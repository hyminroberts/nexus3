<?xml version="1.0" encoding="UTF-8"?>

	<!-- 
	
	Licensed under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at
	 
	    http://www.apache.org/licenses/LICENSE-2.0
	 
	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.
	
	 -->

<features name="org.ops4j.pax.web-7.3.16" xmlns="http://karaf.apache.org/xmlns/features/v1.3.0">

    <feature name="pax-web-core" description="Provide Core pax-web bundles" version="7.3.16">
        <bundle start-level="30">mvn:org.ops4j.pax.web/pax-web-api/7.3.16</bundle>
        <bundle start-level="30">mvn:org.ops4j.pax.web/pax-web-spi/7.3.16</bundle>

        <bundle dependency="true">mvn:org.ow2.asm/asm/9.1</bundle>
        <bundle dependency="true">mvn:org.ow2.asm/asm-util/9.1</bundle>
        <bundle dependency="true">mvn:org.ow2.asm/asm-tree/9.1</bundle>
        <bundle dependency="true">mvn:org.ow2.asm/asm-analysis/9.1</bundle>
        <bundle dependency="true">mvn:org.ow2.asm/asm-commons/9.1</bundle>

        <bundle dependency="true">mvn:org.apache.xbean/xbean-bundleutils/4.19</bundle>
        <bundle dependency="true">mvn:org.apache.xbean/xbean-reflect/4.19</bundle>
        <bundle dependency="true">mvn:org.apache.xbean/xbean-finder/4.19</bundle>
    </feature>

    <feature name="pax-jetty" description="Provide Jetty engine support" version="9.4.40.v20210413">
        <feature>pax-web-core</feature>
        <bundle dependency="true" start-level="30">mvn:org.apache.servicemix.specs/org.apache.servicemix.specs.activation-api-1.1/2.9.0</bundle>
        <bundle dependency="true" start-level="30">mvn:javax.servlet/javax.servlet-api/3.1.0</bundle>
        <bundle dependency="true" start-level="30">mvn:javax.mail/mail/1.4.7</bundle>
        <bundle dependency="true" start-level="30">mvn:org.apache.geronimo.specs/geronimo-jta_1.1_spec/1.1.1</bundle>
        <bundle dependency="true" start-level="30">mvn:javax.annotation/javax.annotation-api/1.3</bundle>
        <bundle dependency="true" start-level="30">mvn:org.apache.geronimo.specs/geronimo-jaspic_1.0_spec/1.1</bundle>
        <bundle dependency="true" start-level="30">mvn:org.apache.aries.spifly/org.apache.aries.spifly.dynamic.bundle/1.3.2</bundle>
        <bundle dependency="true" start-level="30">mvn:org.apache.aries/org.apache.aries.util/1.1.3</bundle>
        <bundle start-level="30">mvn:org.eclipse.jetty/jetty-continuation/9.4.40.v20210413</bundle>
        <bundle start-level="30">mvn:org.eclipse.jetty/jetty-http/9.4.40.v20210413</bundle>
        <bundle start-level="30">mvn:org.eclipse.jetty/jetty-io/9.4.40.v20210413</bundle>
        <bundle start-level="30">mvn:org.eclipse.jetty/jetty-jaspi/9.4.40.v20210413</bundle>
        <bundle start-level="30">mvn:org.eclipse.jetty/jetty-plus/9.4.40.v20210413</bundle>
       	<bundle start-level="30">mvn:org.eclipse.jetty/jetty-jndi/9.4.40.v20210413</bundle>
        <bundle start-level="30">mvn:org.eclipse.jetty/jetty-rewrite/9.4.40.v20210413</bundle>
        <bundle start-level="30">mvn:org.eclipse.jetty/jetty-security/9.4.40.v20210413</bundle>
        <bundle start-level="30">mvn:org.eclipse.jetty/jetty-server/9.4.40.v20210413</bundle>
        <bundle start-level="30">mvn:org.eclipse.jetty/jetty-servlet/9.4.40.v20210413</bundle>
        <bundle start-level="30">mvn:org.eclipse.jetty/jetty-servlets/9.4.40.v20210413</bundle>
        <bundle start-level="30">mvn:org.eclipse.jetty/jetty-util/9.4.40.v20210413</bundle>
        <bundle start-level="30">mvn:org.eclipse.jetty/jetty-util-ajax/9.4.40.v20210413</bundle>
        <bundle start-level="30">mvn:org.eclipse.jetty/jetty-webapp/9.4.40.v20210413</bundle>
        <bundle start-level="30">mvn:org.eclipse.jetty/jetty-jaas/9.4.40.v20210413</bundle>
        <bundle start-level="30">mvn:org.eclipse.jetty/jetty-xml/9.4.40.v20210413</bundle>
        <bundle start-level="30">mvn:org.eclipse.jetty/jetty-client/9.4.40.v20210413</bundle>
        <bundle start-level="30">mvn:org.eclipse.jetty/jetty-deploy/9.4.40.v20210413</bundle>
        <bundle start-level="30">mvn:org.eclipse.jetty/jetty-jmx/9.4.40.v20210413</bundle>
        <bundle start-level="30">mvn:org.eclipse.jetty/jetty-proxy/9.4.40.v20210413</bundle>
	      <bundle start-level="30">mvn:org.eclipse.jetty.websocket/websocket-server/9.4.40.v20210413</bundle>
	      <bundle start-level="30">mvn:org.eclipse.jetty.websocket/websocket-client/9.4.40.v20210413</bundle>
	      <bundle start-level="30">mvn:org.eclipse.jetty.websocket/websocket-common/9.4.40.v20210413</bundle>
	      <bundle start-level="30">mvn:org.eclipse.jetty.websocket/websocket-servlet/9.4.40.v20210413</bundle>
	      <bundle start-level="30">mvn:org.eclipse.jetty.websocket/websocket-api/9.4.40.v20210413</bundle>
	      <bundle start-level="30">mvn:org.eclipse.jetty.websocket/javax-websocket-server-impl/9.4.40.v20210413</bundle>
	      <bundle start-level="30">mvn:org.eclipse.jetty.websocket/javax-websocket-client-impl/9.4.40.v20210413</bundle>
	      <bundle start-level="30">mvn:org.apache.servicemix.bundles/org.apache.servicemix.bundles.javax-websocket-api/1.1_1</bundle>
        <capability>
            osgi.contract;osgi.contract=JavaServlet;version:Version="3.1.0";uses:="javax.servlet,javax.servlet.http,javax.servlet.descriptor,javax.servlet.annotation",
            osgi.contract;osgi.contract=JavaWebSockets;version:Version="1";uses:="javax.websocket, javax.websocket.server"
        </capability>
    </feature>

    <feature name="pax-jetty-http2" version="7.3.16" description="Optional additional feature to run Jetty with SPDY">
    	<details>
    		Please beware, for this feature to run properly you'll need to add the alpn-boot.jar to the
    		lib/ext folder of Karaf in some cases of your JVM.

    		make sure you have the following jar from it's maven coordinate installed:

    		mvn:org.mortbay.jetty.alpn/alpn-boot/8.1.4.v20150727 (and yes version 8.x is intentional there is no newer version available)

    	</details>
        <library type="extension">mvn:org.mortbay.jetty.alpn/alpn-boot/8.1.4.v20150727</library>
        <feature version="[9.3,10.0)">pax-jetty</feature>
		<bundle start-level="1">mvn:org.eclipse.jetty.osgi/jetty-osgi-alpn/9.4.40.v20210413</bundle>
		<bundle start-level="30">mvn:org.eclipse.jetty.alpn/alpn-api/1.1.2.v20150522</bundle>
        <bundle start-level="30">mvn:org.eclipse.jetty/jetty-alpn-server/9.4.40.v20210413</bundle>
        <bundle start-level="30">mvn:org.eclipse.jetty.http2/http2-server/9.4.40.v20210413</bundle>
        <bundle start-level="30">mvn:org.eclipse.jetty.http2/http2-common/9.4.40.v20210413</bundle>
        <bundle start-level="30">mvn:org.eclipse.jetty.http2/http2-hpack/9.4.40.v20210413</bundle>
    </feature>

    <feature name="pax-http-jetty" version="7.3.16">
        <configfile finalname="${karaf.etc}/jetty.xml">mvn:org.ops4j.pax.web/pax-web-features/7.3.16/xml/jettyconfig</configfile>
        <config name="org.ops4j.pax.web">
            org.osgi.service.http.port=8181
            javax.servlet.context.tempdir=${karaf.data}/pax-web-jsp
            org.ops4j.pax.web.config.file=${karaf.etc}/jetty.xml
        </config>
        <feature>scr</feature>
        <feature version="[9.3,10.0)">pax-jetty</feature>

        <feature>pax-web-core</feature>
        <bundle start-level="30">mvn:org.ops4j.pax.web/pax-web-runtime/7.3.16</bundle>
        <bundle start-level="30">mvn:org.ops4j.pax.web/pax-web-jetty/7.3.16</bundle>

        <capability>
            pax.http.provider;provider:=jetty
        </capability>

        <conditional>
            <condition>pax-keycloak</condition>
            <feature>pax-keycloak-http-jetty</feature>
        </conditional>
    </feature>

    <feature name="pax-http" version="7.3.16" description="Implementation of the OSGI HTTP Service">
        <details>Allows to publish servlets using pax web and jetty</details>
        <feature dependency="true" version="[7.3,7.4)">pax-http-jetty</feature>
        <requirement>
            pax.http.provider
        </requirement>
    </feature>

    <feature name="pax-http-whiteboard" description="Provide HTTP Whiteboard pattern support" version="7.3.16">
        <feature version="[7.3,7.4)">pax-http</feature>
        <bundle dependency="true" start-level="30">mvn:org.eclipse.jdt.core.compiler/ecj/4.5.1</bundle>
        <bundle start-level="30" dependency="true">mvn:javax.el/javax.el-api/3.0.0</bundle>
        <bundle start-level="30">mvn:org.ops4j.pax.web/pax-web-jsp/7.3.16</bundle>
        <bundle start-level="30">mvn:org.ops4j.pax.web/pax-web-extender-whiteboard/7.3.16</bundle>

        <capability>
            osgi.contract;osgi.contract=JavaEl;version:Version="3";uses:="javax.el",
            osgi.contract;osgi.contract=JavaJSP;version:Version="2.3";uses:="javax.servlet.jsp, javax.servlet.jsp.el, javax.servlet.jsp.tagext",
            osgi.contract;osgi.contract=JavaJSTL;version:Version="1.2";uses:="javax.servlet.jsp.jstl.core, javax.servlet.jsp.jstl.fmt, javax.servlet.jsp.jstl.sql, javax.servlet.jsp.jstl.tlv"
        </capability>
    </feature>

    <feature name="pax-war" description="Provide support of a full WebContainer" version="7.3.16">
        <config name="org.ops4j.pax.url.war">
            org.ops4j.pax.url.war.importPaxLoggingPackages=true
        </config>
        <feature version="[7.3,7.4)">pax-http-whiteboard</feature>
        <bundle start-level="30">mvn:org.ops4j.pax.web/pax-web-descriptor/7.3.16</bundle>
        <bundle start-level="30">mvn:org.ops4j.pax.web/pax-web-extender-war/7.3.16</bundle>
        <bundle start-level="30">mvn:org.ops4j.pax.web/pax-web-extender-whiteboard/7.3.16</bundle>
        <bundle start-level="30">mvn:org.ops4j.pax.web/pax-web-deployer/7.3.16</bundle>
        <bundle start-level="30">mvn:org.ops4j.pax.url/pax-url-war/2.6.7/jar/uber</bundle>
    </feature>

    <feature name="pax-http-tomcat" description="Provide Tomcat support" version="7.3.16">
        <config name="org.ops4j.pax.url.war">
            org.ops4j.pax.url.war.importPaxLoggingPackages=true
        </config>
        <config name="org.ops4j.pax.web">
            org.osgi.service.http.port=8181
            javax.servlet.context.tempdir=${karaf.data}/pax-web-jsp
        </config>
        <feature>scr</feature>
        <feature version="[7.3,7.4)">pax-http</feature>
        <bundle dependency="true" start-level="30">mvn:javax.el/javax.el-api/3.0.0</bundle>
        <bundle dependency="true" start-level="30">mvn:javax.security.auth.message/javax.security.auth.message-api/1.1</bundle>
        <bundle dependency="true" start-level="30">mvn:javax.validation/validation-api/2.0.1.Final</bundle>
        <bundle dependency="true" start-level="30">mvn:org.ops4j.pax.tipi/org.ops4j.pax.tipi.tomcat-embed-core/9.0.36.1</bundle>
        <bundle dependency="true" start-level="30">mvn:org.ops4j.pax.tipi/org.ops4j.pax.tipi.tomcat-embed-websocket/9.0.36.1</bundle>
        <bundle dependency="true" start-level="30">mvn:javax.servlet/javax.servlet-api/4.0.1</bundle>
        <bundle dependency="true" start-level="30">mvn:org.apache.geronimo.specs/geronimo-atinject_1.0_spec/1.2</bundle>
        <bundle dependency="true" start-level="30">mvn:org.apache.servicemix.bundles/org.apache.servicemix.bundles.jsr305/1.3.9_1</bundle>
        <bundle dependency="true" start-level="30">mvn:org.apache.servicemix.specs/org.apache.servicemix.specs.activation-api-1.1/2.9.0</bundle>
        <bundle dependency="true" start-level="30">mvn:org.apache.servicemix.specs/org.apache.servicemix.specs.java-persistence-api-2.0/2.9.0</bundle>
        <bundle dependency="true" start-level="30">mvn:org.apache.servicemix.specs/org.apache.servicemix.specs.javamail-api-1.4/2.9.0</bundle>

        <bundle dependency="true" start-level="30">mvn:org.apache.geronimo.specs/geronimo-stax-api_1.2_spec/1.1</bundle>
        <bundle dependency="true" start-level="30">mvn:org.apache.geronimo.specs/geronimo-ejb_3.1_spec/1.0.2</bundle>
        <bundle dependency="true" start-level="30">mvn:org.apache.geronimo.specs/geronimo-osgi-registry/1.1</bundle>
        <bundle dependency="true" start-level="30">mvn:org.apache.geronimo.specs/geronimo-jaxws_2.2_spec/1.0</bundle>
        <bundle dependency="true" start-level="30">mvn:org.apache.geronimo.specs/geronimo-jaxrpc_1.1_spec/2.1</bundle>

        <bundle dependency="true" start-level="30">mvn:org.apache.servicemix.specs/org.apache.servicemix.specs.saaj-api-1.3/2.9.0</bundle>
        <bundle dependency="true" start-level="30">mvn:org.apache.servicemix.specs/org.apache.servicemix.specs.jaxb-api-2.2/2.9.0</bundle>

        <bundle dependency="true" start-level="30">mvn:org.apache.geronimo.specs/geronimo-jta_1.1_spec/1.1.1</bundle>
        <bundle dependency="true" start-level="30">mvn:org.apache.geronimo.specs/geronimo-jaspic_1.0_spec/1.1</bundle>

        <bundle dependency="true" start-level="30">mvn:org.apache.servicemix.specs/org.apache.servicemix.specs.jaxp-api-1.3/2.9.0</bundle>
        <bundle dependency="true" start-level="30">mvn:org.apache.geronimo.specs/geronimo-annotation_1.1_spec/1.0.1</bundle>
        <bundle dependency="true" start-level="30">mvn:org.apache.servicemix.bundles/org.apache.servicemix.bundles.javax-websocket-api/1.1_1</bundle>

        <feature>pax-web-core</feature>
        <bundle start-level="30">mvn:org.ops4j.pax.web/pax-web-runtime/7.3.16</bundle>
        <bundle start-level="30">mvn:org.ops4j.pax.web/pax-web-tomcat/7.3.16</bundle>
        <bundle start-level="30">mvn:org.ops4j.pax.web/pax-web-jsp/7.3.16</bundle>

        <capability>
            pax.http.provider;provider:=tomcat
            osgi.contract;osgi.contract=JavaServlet;version:Version="3.1.0";uses:="javax.servlet,javax.servlet.http,javax.servlet.descriptor,javax.servlet.annotation",
            osgi.contract;osgi.contract=JavaWebSockets;version:Version="1";uses:="javax.websocket, javax.websocket.server"
        </capability>

        <conditional>
            <condition>pax-keycloak</condition>
            <feature>pax-keycloak-http-tomcat</feature>
        </conditional>
    </feature>

    <feature name="pax-war-tomcat" version="7.3.16">
        <feature version="[7.3,7.4)">pax-http-tomcat</feature>
        <feature version="[7.3,7.4)">pax-war</feature>
    </feature>

    <feature name="pax-jsf-support" version="7.3.16">
        <feature version="[7.3,7.4)">pax-war</feature>
        <bundle dependency="true">mvn:javax.enterprise/cdi-api/1.2</bundle>
        <bundle dependency="true">mvn:org.apache.servicemix.bundles/org.apache.servicemix.bundles.javax-inject/1_3</bundle>
        <bundle dependency="true">mvn:javax.interceptor/javax.interceptor-api/1.2.2</bundle>
        <bundle dependency="true">mvn:org.apache.servicemix.specs/org.apache.servicemix.specs.jsr250-1.0/2.9.0</bundle>
        <bundle dependency="true">mvn:javax.validation/validation-api/2.0.1.Final</bundle>
        <bundle dependency="true">mvn:org.apache.servicemix.specs/org.apache.servicemix.specs.jsr303-api-1.0.0/2.9.0</bundle>
        <bundle dependency="true">mvn:commons-beanutils/commons-beanutils/1.9.4</bundle>
        <bundle dependency="true">mvn:commons-collections/commons-collections/3.2.2</bundle>
        <bundle dependency="true">mvn:commons-codec/commons-codec/1.15</bundle>
        <bundle dependency="true">mvn:org.apache.servicemix.bundles/org.apache.servicemix.bundles.commons-digester/1.8_4</bundle>
        <bundle dependency="true">mvn:org.apache.geronimo.bundles/commons-discovery/0.4_1</bundle>
        <bundle>mvn:org.apache.myfaces.core/myfaces-api/2.3.3</bundle>
        <bundle>mvn:org.apache.myfaces.core/myfaces-impl/2.3.3</bundle>
        <capability>
            osgi.contract;osgi.contract=JavaJSF;version:Version="2.2";uses:="javax.faces, javax.faces.application, javax.faces.bean, javax.faces.component, javax.faces.component.behavior, javax.faces.component.html, javax.faces.component.visit, javax.faces.context, javax.faces.convert, javax.faces.el, javax.faces.event, javax.faces.flow, javax.faces.flow.builder, javax.faces.lifecycle, javax.faces.model, javax.faces.render, javax.faces.validator, javax.faces.view, javax.faces.view.facelets, javax.faces.webapp"
        </capability>
    </feature>

    <feature name="pax-jsf-resources-support" description="Provide sharing of resources according to Servlet 3.0 for OSGi bundles and JSF" version="7.3.16">
        <feature version="[7.3,7.4)">pax-jsf-support</feature>
        <bundle dependency="true">mvn:org.ops4j.pax.web/pax-web-resources-extender/7.3.16</bundle>
        <bundle>mvn:org.ops4j.pax.web/pax-web-resources-jsf/7.3.16</bundle>
    </feature>

    <feature name="xnio" version="3.3.8.Final">
        <bundle>mvn:org.jboss.xnio/xnio-api/3.3.8.Final</bundle>
        <bundle>mvn:org.jboss.xnio/xnio-nio/3.3.8.Final</bundle>
        <capability>
            osgi.service;effective:=active;objectClass=org.xnio.XnioProvider
        </capability>
    </feature>

    <feature name="undertow" version="2.0.33.Final">
        <bundle dependency="true" start-level="30">mvn:javax.servlet/javax.servlet-api/4.0.1</bundle>
        <bundle dependency="true">mvn:javax.annotation/javax.annotation-api/1.3</bundle>
        <bundle dependency="true">mvn:org.jboss.logging/jboss-logging/3.4.1.Final</bundle>
        <bundle dependency="true">mvn:org.apache.servicemix.bundles/org.apache.servicemix.bundles.javax-websocket-api/1.1_1</bundle>

        <feature>xnio</feature>
        
        <bundle>mvn:io.undertow/undertow-core/2.0.33.Final</bundle>
        <bundle>mvn:io.undertow/undertow-servlet/2.0.33.Final</bundle>
        <bundle>mvn:io.undertow/undertow-websockets-jsr/2.0.33.Final</bundle>
        <capability>
            osgi.contract;osgi.contract=JavaServlet;version:Version="4.0.1";uses:="javax.servlet,javax.servlet.http,javax.servlet.descriptor,javax.servlet.annotation",
            osgi.contract;osgi.contract=JavaWebSockets;version:Version="1";uses:="javax.websocket, javax.websocket.server"
        </capability>
    </feature>

    <feature name="pax-http-undertow" version="7.3.16">
        <configfile finalname="${karaf.etc}/undertow.properties">mvn:org.ops4j.pax.web/pax-web-features/7.3.16/properties/undertowconfig</configfile>
        <configfile finalname="${karaf.etc}/undertow.xml">mvn:org.ops4j.pax.web/pax-web-features/7.3.16/xml/undertowconfig</configfile>
        <config name="org.ops4j.pax.web">
            org.osgi.service.http.port=8181
            javax.servlet.context.tempdir=${karaf.data}/pax-web-jsp
            #org.ops4j.pax.web.config.file=${karaf.etc}/undertow.properties
            org.ops4j.pax.web.config.file=${karaf.etc}/undertow.xml
        </config>
        <feature>scr</feature>
        <feature version="2.0.33.Final">undertow</feature>
        <feature version="[7.3,7.4)">pax-http</feature>

        <feature>pax-web-core</feature>
        <bundle>mvn:org.ops4j.pax.web/pax-web-runtime/7.3.16</bundle>
        <bundle>mvn:org.ops4j.pax.web/pax-web-undertow/7.3.16</bundle>

        <capability>
            pax.http.provider;provider:=undertow
        </capability>

        <conditional>
            <condition>pax-keycloak</condition>
            <feature>pax-keycloak-http-undertow</feature>
        </conditional>
    </feature>

</features>
