<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:ol="http://docs.rackspace.com/olink"
		exclude-result-prefixes="ol"
                version='2.0'>

  <xsl:import href="docbook-xsl/html/docbook.xsl"/>
  
  <xsl:output indent="yes" method="xml"/>

  <xsl:param name="xref.with.number.and.title" select="1"/>

  <xsl:param name="local.l10n.xml" select="document('make-olink-db.xsl')"/>

  <i18n xmlns="http://docbook.sourceforge.net/xmlns/l10n/1.0">
    <l10n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0" language="en">
      <l:gentext key="sectioncalled" text=""/>
      <l:context name="xref">
  	<l:template name="section" text="“%t”"/>
      </l:context>
      <l:context name="xref-number">
  	<l:template name="section" text="“%t”"/>
      </l:context>
      <l:context name="xref-number-and-title">
  	<l:template name="section" text="“%t”"/>
      </l:context>
    </l10n>
  </i18n>

  <xsl:param name="section.autolabel" select="0"/>
  <xsl:param name="chapter.autolabel" select="0"/>
  <xsl:param name="appendix.autolabel" select="'A'"/>
  <xsl:param name="part.autolabel" select="'I'"/>
  <xsl:param name="reference.autolabel" select="0"/>
  <xsl:param name="qandadiv.autolabel" select="0"/>
  
  <xsl:template match="/">
    <targetset> 
      <sitemap>	
	<dir>
	  <xsl:apply-templates select="ol:books/ol:book" mode="process-book"/>
	</dir>
      </sitemap>
    </targetset>
  </xsl:template>
  
  <xsl:template match="ol:book" mode="process-book">
    <xsl:variable name="path" select="@path"/>
    <xsl:variable name="book" select="document(resolve-uri($path, base-uri(.)))"/>
   
    <document targetdoc="{$book/*/@xml:id}" 
	      baseuri="index.html"> 
      <xsl:apply-templates select="$book" mode="olink.mode"/>
    </document>
  </xsl:template>

</xsl:stylesheet>
