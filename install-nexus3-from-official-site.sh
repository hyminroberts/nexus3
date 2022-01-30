#!/bin/bash

####################################################################
### Installation of Nexus3                                       ###
### Author: Zhonghui Luo                                         ###
### Since: ADM-1294                                              ###
### Note:                                                        ###
### 1. This script should be run by root user                    ###
###    along with Etix's key setix_com.internal.jks              ###
### 2. This script could only be run on US machine               ###
###    because official download link is not available in China. ###
####################################################################

nexus_version=3.37.3-02
nexus_usr=release
nexus_download_url=https://download.sonatype.com/nexus/3/nexus-${nexus_version}-unix.tar.gz
nexus_folder=nexus3
nexus_http_port=9080
nexus_ssl_port=9443
etix_store_key=etix_com.internal.jks
etix_store_psw=ladodgers

###### 1. Create NON-root user to run Nexus server ######
function create_nexus_user() {
    adduser ${nexus_usr}
    # su - ${nexus_usr}
    # command 'usermod -aG sudo ${nexus_usr}' does not take effect with message "usermod: group 'sudo' does not exist", we need to modify /etc/sudoers
    echo -e "%${nexus_usr} ALL = (ALL) ALL" >> /etc/sudoers
    # command 'usermod -aG wheel ${nexus_usr}' works
    usermod -aG wheel ${nexus_usr}
    echo "[ADM-1294] ======> 1. New user ${nexus_usr} created."
}

###### 2. Install OpenJDK 1.8 that Nexus depends on ######
function install_jdk() {
    java -version
    # If JDK has been installed, skip this step
    if [[ $? -ne 0 ]]; then
        echo "[ADM-1294] ======> 2. Installing java-1.8.0-openjdk.x86_64 ......"
        yum install java-1.8.0-openjdk.x86_64 -y
    fi
}

###### 3. Download Nexus3 of specific version ######
function download_nexus3() {
    # If wget does not exist, install it first
    if [[ ! -x /usr/bin/wget ]] ; then
        yum install wget -y
    fi
    # Clean previously installed Nexus3 files
    rm -rf /home/${nexus_usr}/*
    # Copy the Etix's keystore file into folder /home/${nexus_usr}/
    cp ${etix_store_key} /home/${nexus_usr}/
    cd /home/${nexus_usr}/
    wget -O nexus.tar.gz ${nexus_download_url}
    echo "[ADM-1294] ======> 3. Nexus3 of version ${nexus_version} downloaded."
}

###### 4. Unzip the downloaded file, re-name nexus-3* to ${nexus_folder}, and change ownwership of Nexus files and Nexus data directory to ${nexus_usr} ######
function change_ownership() {
    tar -xvf nexus.tar.gz
    mv nexus-3* ${nexus_folder}
    chown -R ${nexus_usr}:wheel /home/${nexus_usr}/${nexus_folder}
    chown -R ${nexus_usr}:wheel /home/${nexus_usr}/sonatype-work
    # Set run_as_user parameter as Nexus user 
    printf 'run_as_user=${nexus_usr}' > /home/${nexus_usr}/${nexus_folder}/bin/nexus.rc
    echo "[ADM-1294] ======> 4. Finished un-zipping Nexus3 ......"
}

###### 5. Configure /home/${nexus_usr}/sonatype-work/${nexus_folder}/etc/nexus.properties  ######
function configure_nexus_properties() {
    # 5.1. Start Nexus server first for /home/${nexus_usr}/sonatype-work/${nexus_folder}/etc to be ready
    /home/${nexus_usr}/${nexus_folder}/bin/nexus start
    # Wait 2 minutes for Nexus to start
    sleep 120
    ls -l /home/${nexus_usr}/sonatype-work/${nexus_folder}
    ls -l /home/${nexus_usr}/sonatype-work/${nexus_folder}/etc
    # 5.2. Edit the /home/${nexus_usr}/sonatype-work/${nexus_folder}/etc/nexus.properties file to add the ssl port and add the reference to the ssl configuration file:
    #    # Jetty section
    #    application-port=9080
    #    application-port-ssl=9443
    #    application-host=0.0.0.0
    #    nexus-args=${jetty.etc}/jetty.xml,${jetty.etc}/jetty-http.xml,${jetty.etc}/jetty-https.xml,${jetty.etc}/jetty-requestlog.xml
    #    nexus-context-path=/
    nexus_properties=/home/${nexus_usr}/sonatype-work/${nexus_folder}/etc/nexus.properties
    sed -ie '/application-port=.*/ {s/# //; s/8081/${nexus_http_port}/}' ${nexus_properties}
    sed -ie '/application-host=.*/ s/# //' ${nexus_properties}
    sed -ie '/nexus-args=.*/ {s/# //; s|jetty-http.xml|jetty-http.xml,${jetty.etc}/jetty-https.xml|}' ${nexus_properties}
    sed -ie '/nexus-context-path=.*/ s/# //' ${nexus_properties}
    sed -ie "/^application-port=.*/a application-port-ssl=${nexus_ssl_port}" ${nexus_properties}
    echo "[ADM-1294] ======> 5. Finished configuring ${nexus_properties} ......"
}

###### 6. To set up Nexus as an SSL server ######
function set_up_ssl_access() {
    # 6.1. Move the Etix's keystore file into folder /home/${nexus_usr}/${nexus_folder}/etc/ssl.
    mv /home/${nexus_usr}/${etix_store_key} /home/${nexus_usr}/${nexus_folder}/etc/ssl
    # 6.2. Edit the ssl configuration file /home/${nexus_usr}/${nexus_folder}/etc/jetty/jetty-https.xml for the certificate and password:
    #    <New id="sslContextFactory" class="org.eclipse.jetty.util.ssl.SslContextFactory">
    #      <Set name="KeyStorePath"><Property name="ssl.etc"/>/keystore.jks</Set>
    #      <Set name="KeyStorePassword">password</Set>
    #      <Set name="KeyManagerPassword">password</Set>
    #      <Set name="TrustStorePath"><Property name="ssl.etc"/>/keystore.jks</Set>
    #      <Set name="TrustStorePassword">password</Set>
    # Note: The path must just be the name of the keystore file (preceded by a slash) as the file must be in a specific directory.
    jetty_https_xml=/home/${nexus_usr}/${nexus_folder}/etc/jetty/jetty-https.xml
    sed -i "/KeyStorePath/ s/keystore.jks/${etix_store_key}/" ${jetty_https_xml}
    sed -i "/TrustStorePath/ s/keystore.jks/${etix_store_key}/" ${jetty_https_xml}
    sed -i "/KeyStorePassword/ s/password/${etix_store_psw}/" ${jetty_https_xml}
    sed -i "/KeyManagerPassword/ s/password/${etix_store_psw}/" ${jetty_https_xml}
    sed -i "/TrustStorePassword/ s/password/${etix_store_psw}/" ${jetty_https_xml}
    echo "[ADM-1294] ======> 6. Finished setting up Nexus as an SSL server in ${jetty_https_xml} ......"
}

###### 7. Restart Nexus server and verify accessibility  ######
function restart_nexus_server() {
    /home/${nexus_usr}/${nexus_folder}/bin/nexus restart
    # Wait 2 minutes for Nexus to restart
    sleep 120
    curl -k https://127.0.0.1:${nexus_ssl_port}/ | grep 'Nexus Repository Manager'
    if [ $? -eq 0 ]; then
        echo "[ADM-1294] ======> 7. Nexus of version ${nexus_version} started and is running ......"
        exit 0
    else
        echo "[ADM-1294] ======> 7. Failed to start Nexus of version ${nexus_version} !!!"
        exit 1
    fi
}

function main() {
    create_nexus_user
    date

    install_jdk
    date

    download_nexus3
    date

    change_ownership
    date

    configure_nexus_properties
    date

    set_up_ssl_access
    date

    restart_nexus_server
    date
}

main
