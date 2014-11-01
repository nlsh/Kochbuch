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
        <META NAME="generator"
              CONTENT="HTML Tidy for Windows (vers 1st October 2003), see www.w3.org" />
        <TITLE>Kochbuch.xsl</TITLE>
        <META NAME="author"
              CONTENT="Nils_Heinold" />
        <META NAME="generator"
              CONTENT="Ulli Meybohms HTML EDITOR" />
        <META HTTP-EQUIV="Content-Script-Type"
              CONTENT="text/javascript" />
        <META HTTP-EQUIV="Content-Style-Type"
              CONTENT="text/css" />
        <META NAME="robots"
              CONTENT="noindex, nofollow" />
        <link rel="stylesheet"
              href="../kochbuch.css"
              type="text/css" />
      </head>
      <body>
        <xsl:apply-templates />
      </body>
    </html>
  </xsl:template>
  <xsl:template match="REZEPTNAME">
    <span class="ueberschrift">
      <xsl:value-of select="." />
      <br />
      <br />
      <br />
    </span>
  </xsl:template>
  <xsl:template match="KATEGORIE"></xsl:template>
  <xsl:template match="AUTOR">
    <table class="font"
           summary=""
           border="0"
           width="100%">
      <tr>
        <td width="300">
          <span style="font-weight:bold;">Autor:&#160;</span>
          <xsl:value-of select="." />
        </td>
        <td width="110">
          <span style="font-weight:bold;">Bewertung:</span>
        </td>
        <td>
          <span style="font-weight:bold; color:blue; font-size:10pt;">
            <xsl:value-of select="../BEWERTUNG" />
          </span>
        </td>
      </tr>
      <tr>
        <td width="300">
          <span style="font-weight:bold;">Anzahl Personen:&#160;</span>
          <xsl:value-of select="../ANZAHLPERSONEN" />
        </td>
        <td width="110">
          <span style="font-weight:bold;">Zubereitungszeit:&#160;</span>
        </td>
        <td>
          <xsl:value-of select="../ZUBEREITUNGSZEIT" />
        </td>
      </tr>
    </table>
    <br />
    <br />
    <br />
  </xsl:template>
  <xsl:template match="BEWERTUNG"></xsl:template>
  <xsl:template match="ANZAHLPERSONEN"></xsl:template>
  <xsl:template match="ZUBEREITUNGSZEIT"></xsl:template>
  <xsl:template match="ZUTATEN">
    <table class="font"
           summary="">
      <tr>
        <td valign="top">
          <span class="ueberschrift">Zutaten:</span>
        </td>
        <td>
          <ul>
            <xsl:for-each select="ZUTAT">
              <li>
                <xsl:value-of select="." />
              </li>
            </xsl:for-each>
          </ul>
        </td>
      </tr>
    </table>
    <br />
  </xsl:template>
  <xsl:template match="ZUBEREITUNG">
    <span class="ueberschrift">Zubereitung:</span>
    <br />
    <br />
    <table class="font"
           width="80%"
           cellspacing="0"
           border="0"
           summary="">
      <xsl:for-each select="ITEM">
        <tr>
          <td width="20"
              valign="baseline">&#8658;</td>
          <td>
            <xsl:apply-templates />
          </td>
        </tr>
      </xsl:for-each>
    </table>
  </xsl:template>
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

  <xsl:template match="BILD">
    <br />
    <img>
    <xsl:attribute name="src"><xsl:value-of select="BILDURL"/></xsl:attribute>
    <xsl:attribute name="width"><xsl:value-of select="BILDBREITE" /></xsl:attribute>
    <xsl:attribute name="height"><xsl:value-of select="BILDHOHE" /></xsl:attribute>
    <xsl:attribute name="title"><xsl:value-of select="BILDBESCHREIBUNG" /></xsl:attribute>
    <xsl:attribute name="border">0</xsl:attribute>
    <xsl:attribute name="alt"><xsl:value-of select="BILDBESCHREIBUNG" /></xsl:attribute>
    </img>
    <br />
    <br />

  </xsl:template>
</xsl:stylesheet>