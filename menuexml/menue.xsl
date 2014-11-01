<?xml version="1.0" encoding="iso-8859-1"?>
<!-- Erzeugung einer Doctype- Deklaration im Sinne HTML 4.01 -->
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html"
              doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"
              doctype-system="http://www.w3.org/TR/html4/loose.dtd" />
  <!-- Erzeugen einer Kopf- Datei für Html -->
<xsl:template match="/">
    <html>
      <head>
        <meta name="generator"
              content="HTML Tidy for Windows (vers 1st October 2003), see www.w3.org" />
        <title>Men&#252;.xsl</title>
        <meta name="author"
              content="Nils_Heinold" />
        <meta name="generator"
              content="Ulli Meybohms HTML EDITOR" />
        <meta http-equiv="Content-Script-Type"
              content="text/javascript" />
        <meta http-equiv="Content-Style-Type"
              content="text/css" />
        <meta name="robots"
              content="noindex, nofollow" />
        <LINK REL="stylesheet"
              HREF="../kochbuch.css"
              TYPE="text/css" />
        <style type="text/css">
a:link { text-decoration:none; color:#000000; }
  a:visited { text-decoration:none; color:#000000; }
  a:hover { text-decoration:none; color:#000000; }
  a:active { text-decoration:none; color:#000000; }
</style>
      </head>
      <body style="background-color: #ffffff; margin-left:0px; margin-right:0px; margin-top:0px; margin-bottom:0px ;">

        <table border="0"
               width="200"
               summary=""
               cellspacing="0"
               cellpadding="0">
          <xsl:for-each select="/MENUE/LINK">
            <tr>
              <td width="188"
                  align="right"
                  valign="middle"
                  style="font-family: Verdana; font-size: 10px; BACKGROUND: url(img/bg_unternav_nils.gif); line-height:12px;">

                <!-- apply-templates, kein value-of-select, da sonst keine Formatierungen möglich -->
<xsl:element name="a"
                             use-attribute-sets="LINKEIGENSCHAFTEN">
                  <xsl:apply-templates select="LINKNAME" />
                </xsl:element>
              </td>
              <td width="12"
                  style="BACKGROUND: url(img/b_aus_unternav.gif);"></td>
            </tr>
            <tr>
              <td colspan="2"
                  style="BACKGROUND: url(img/trenner.gif);line-height:2px;">&#160;</td>
            </tr>
          </xsl:for-each>
          <TR>
            <TD STYLE="BACKGROUND: url(img/hg3.gif)"
                COLSPAN="3"
                HEIGHT="72"></TD>
          </TR>
        </table>
      </body>
    </html>
  </xsl:template>
  <!-- Unterprogramme-->
<xsl:template match="FETT">
    <span style="font-weight:bold;">
      <xsl:apply-templates />
    </span>
  </xsl:template>
  <xsl:template match="ZEILENUMBRUCH">
    <br />
  </xsl:template>
  <xsl:template match="ZENTRIERT">
    <div style="text-align:center;">
      <xsl:apply-templates />
    </div>
  </xsl:template>
  <xsl:attribute-set name="LINKEIGENSCHAFTEN">
    <xsl:attribute name="href">
      <xsl:value-of select="LINKADRESSE" />
    </xsl:attribute>
    <xsl:attribute name="target">
      <xsl:value-of select="LINKAUSGABE" />
    </xsl:attribute>
  </xsl:attribute-set>
</xsl:stylesheet>