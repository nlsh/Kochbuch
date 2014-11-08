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
            <title>Kochbuch.xsl</title>
            <meta charset="utf-8" />
            <meta name="viewport" content="width=device-width; initial-scale=1.0;" />
            <link rel="stylesheet" href="../css/kochbuch.css" type="text/css" />
          </head>
          <body>
            <div id="rezepte">
            <xsl:apply-templates />
            </div>
          </body>
        </html>
    </xsl:template>

    <!-- erzeugen der einzelnen Abschnitte -->

    <!-- Ausgabe Überschrift aus REZEPTNAME -->
    <xsl:template match="REZEPTNAME">
        <h3><xsl:value-of select="." /></h3>
    </xsl:template>

    <!-- Feld KATEGORIE noch keine Auswertung -->
    <xsl:template match="KATEGORIE"></xsl:template>

    <!-- Ausgabe Rezept- Beschreibung -->
    <xsl:template match="AUTOR">
        <div id="beschreibung">
            <table>
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
        </div>
    </xsl:template>

    <!-- keine eigenen Auswertungen -->
    <xsl:template match="BEWERTUNG"></xsl:template>
    <xsl:template match="ANZAHLPERSONEN"></xsl:template>
    <xsl:template match="ZUBEREITUNGSZEIT"></xsl:template>

    <!-- Ausgabe ZUTATEN -->
    <xsl:template match="ZUTATEN">
        <div id="zutaten">
            <table>
              <tr>
                <td valign="top">
                <span style="font-weight:bold;">Zutaten: </span>
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
        </div>
    </xsl:template>

    <!-- Ausgabe ZUBEREITUNG -->
    <xsl:template match="ZUBEREITUNG">
        <div id="zubereitung">
            <span style="font-weight:bold;">Zubereitung: </span>
            <ul>
              <xsl:for-each select="ITEM">
                <li>
                    <div>&#8658;</div>
                    <div><xsl:apply-templates /> </div>
                </li>
              </xsl:for-each>
            </ul>
        </div>
    </xsl:template>


    <!-- Unterprogramme zur Formatierung -->
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
        <div class="bild">
            <img>
            <xsl:attribute name="src"><xsl:value-of select="BILDURL"/></xsl:attribute>
            <xsl:attribute name="width"><xsl:value-of select="BILDBREITE" /></xsl:attribute>
            <xsl:attribute name="height"><xsl:value-of select="BILDHOHE" /></xsl:attribute>
            <xsl:attribute name="title"><xsl:value-of select="BILDBESCHREIBUNG" /></xsl:attribute>
            <xsl:attribute name="border">0</xsl:attribute>
            <xsl:attribute name="alt"><xsl:value-of select="BILDBESCHREIBUNG" /></xsl:attribute>
            </img>
        </div>
    </xsl:template>
</xsl:stylesheet>