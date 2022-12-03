<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">

    <html>
        <head></head>

        <body>
            <h1>Самая длинная последовательность</h1>
            <!-- <table>
                <xsl:for-each select="hash/max-result">
                    <tr>
                        <th>Элемент</th>
                        <th><xsl:value-of select="max-result"/></th>
                    </tr>
                </xsl:for-each>
            </table> -->

            <xsl:value-of select="hash/max-result"/>
        </body>
    </html>

</xsl:template>

</xsl:stylesheet>
