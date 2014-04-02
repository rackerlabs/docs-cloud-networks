<?xml version="1.0"?>

<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" version="1.0"
		xmlns:cx="http://xmlcalabash.com/ns/extensions">

  <p:import href="http://xmlcalabash.com/extension/steps/library-1.0.xpl"/>
  <p:input port="parameters" kind="parameter" />
  <p:option name="mavenBuildDir"/>
  <p:option name="olinkManifest"/>
  
  <p:load>
    <p:with-option name="href" select="$olinkManifest"/>
  </p:load>

  <!-- XInclude the source XML Document -->
  <p:xinclude>
    <p:input port="source"/>
  </p:xinclude>

  <!-- Apply the Transform -->
  <p:xslt>
    <p:input port="stylesheet">
      <p:document href="make-olink-db.xsl" />
    </p:input>
  </p:xslt>

  <cx:message>
    <p:with-option name="message" select="concat('Olink db Created:', $olinkManifest)"/>
  </cx:message>

  <!-- Output to file -->
  <p:store method="xml" ><!-- indent="true -->
    <p:with-option name="href" select="concat($mavenBuildDir,'/olink.db')"/>
  </p:store>

</p:declare-step>
