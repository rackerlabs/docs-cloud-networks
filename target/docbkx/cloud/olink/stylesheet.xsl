<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:mvn="http://maven.apache.org/POM/4.0.0"
	version="2.0">
	<xsl:output method="xml" indent="yes" encoding="UTF-8" />
	<!--
		<xsl:output method="xhtml"
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-
		transitional.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//
		EN" indent="yes" />
	-->
	
	<!-- <xsl:variable name="olinkFiles" select="document('pom.xml')/mvn:project/mvn:build/mvn:plugins/mvn:plugin[mvn:artifactId = 'xproc-maven-plugin']//mvn:configuration/mvn:olinkFiles[1]"/> -->
	
	<xsl:variable name="olinkFiles" select="document('pom.xml')"/>

	
	<xsl:template match="/">
		<foo>
Version number: <xsl:value-of select="system-property('xsl:version')" />
<br />
Vendor: <xsl:value-of select="system-property('xsl:vendor')" />
<br />
Vendor URL: <xsl:value-of select="system-property('xsl:vendor-url')" />

			<!-- <xsl:value-of select="$olinkFiles/mvn:project/mvn:build/mvn:plugins/mvn:plugin[mvn:artifactId = 'olink-maven-plugin']//mvn:configuration/mvn:olinkFiles[1]"/>		 -->
		</foo>
	</xsl:template>
</xsl:stylesheet>
