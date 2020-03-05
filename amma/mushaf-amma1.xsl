<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html xmlns="http://www.w3.org/1999/xhtml">
<body>
<table border='1' align="center">
<tr bgcolor="339900">
    <th> الصنف</th>
    <th> رقم السورة</th>
    <th>اياتها</th>
    <th>اسم السورة</th>
</tr>
<xsl:for-each select="mushaf/sura">
<tr align='center' bgcolor="cc9900">
            <td><xsl:value-of select="sura/type"/>
	   <xsl:value-of select="@type"/></td>
			<td><xsl:value-of select="sura/id"/>
	   <xsl:value-of select="@id"/></td>
			<td><xsl:value-of select="sura/nb_aya"/>
		<xsl:value-of select="@nb_aya"/></td>
			<td><xsl:value-of select="sura/name"/>
		<xsl:element name="a">	
		<xsl:attribute name="href">
		sura/<xsl:value-of select="@name"/>.amr
		</xsl:attribute>
		<xsl:value-of select="@name"/>
		</xsl:element></td>
		
</tr>
</xsl:for-each>
</table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
