<?xml version="1.0" encoding="UTF-8"?>
<!-- Erzeugung einer Doctype- Deklaration im Sinne HTML5 -->
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html"
              doctype-system="about:legacy-compat"
              encoding="UTF-8"
              indent="yes" />
  <!-- Html erzeugen-->
<xsl:template match="/">
    <html>
      <head>
        <title>Men&#252;.xsl</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width; initial-scale=1.0;" />
        <link rel="stylesheet" href="../css/kochbuch.css" type="text/css" />
        <style type="text/css">
            a:link { text-decoration:none; color:#000000; }
            a:visited { text-decoration:none; color:#000000; }
            a:hover { text-decoration:none; color:#000000; }
            a:active { text-decoration:none; color:#000000; background-image: url("../menuexml/newimg/paprika.gif");
    background-repeat: no-repeat;}
        </style>
      </head>
      <body>
        <div id="menue">
            <nav>
                <ul>
                    <xsl:for-each select="/MENUE/LINK">
                    <li>
                        <!-- apply-templates, kein value-of-select, da sonst keine Formatierungen möglich -->
                        <xsl:element name="a" use-attribute-sets="LINKEIGENSCHAFTEN">
                            <xsl:apply-templates select="LINKNAME" />
                        </xsl:element>
                    </li>
                    </xsl:for-each>
                    <li>
                    <a class="impressum" href="../impressum.htm" target="Hauptfenster">Impressum</a>
                    </li>
                </ul>
            </nav>
            <div id="menue-bottom">
            </div>
        </div>
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