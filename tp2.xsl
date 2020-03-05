<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head><link type='text/css' rel='stylesheet' href='tp2.css' /></head>
<body>
<h1 align="center">La liste des etudians</h1>
<table class='tablu' border="1" align="center">
	<tr  class='th' align='center' >
	   <td><b> Matricule</b></td>
	   <td><b> Nom</b></td>
       <td><b> prenom</b></td>
       <td><b> M.S1</b></td>
       <td><b> M.S2</b></td>
       <td><b> moy_annuel</b></td>
       <td><b> creadit_s1</b></td>
       <td><b> creadit_s2</b></td>
       <td><b>unit_acuise</b></td>
       <td ><b> resultat</b></td>
    </tr>
    <xsl:for-each select="etudians/etudiant">
    	<tr align='center'>
  <td><xsl:value-of select="@Matricule"/></td>
<td><xsl:value-of select="Nom"/></td>
<td><xsl:value-of select="Prenom"/></td>
<td><xsl:value-of select="moyen/M.S1"/></td>
<td><xsl:value-of select="moyen/M.S2"/></td>
<td><xsl:value-of select="moyen/moy_annuel"/></td>
<td><xsl:value-of select="creadit/creadit_s1"/></td>
<td><xsl:value-of select="creadit/creadit_s2"/></td>
<td><xsl:value-of select="unit_acuise"/></td>
<td><xsl:value-of select="resultat"/></td>
</tr>
</xsl:for-each>
</table>


<xsl:variable name="nbret" >
 <xsl:value-of select='count(/etudians/etudiant)'/> 
 </xsl:variable>

     

      <xsl:variable name="mycls">
        
          <xsl:value-of select='(sum(//moy_annuel))'/> 
              </xsl:variable>
     
      

<table class='sta' id='td2'>
  <tr>
  <td id='td1'>
<fieldset>
<legend class='my' id='sta'>Le nombre des étudiants</legend>
<p><xsl:value-of select='$nbret'/> etudiants</p>
</fieldset>
</td>


<xsl:variable name="nbmax">
        <xsl:for-each select="//moy_annuel">
          <xsl:sort select="." order="descending" data-type="number" />
          <xsl:if test="position()=1"><xsl:value-of select="." /></xsl:if>
        </xsl:for-each>
      </xsl:variable>
     


    
<xsl:variable name="nbmin">
        <xsl:for-each select="//moy_annuel">
          <xsl:sort select="." order="ascending" data-type="number" />
          <xsl:if test="position()=1"><xsl:value-of select="." /></xsl:if>
        </xsl:for-each>
      </xsl:variable>



  <td id='td1'>
<fieldset>
<legend class='my' id='st'>La meilleure moyenne</legend>
 <xsl:value-of select="$nbmax" />
</fieldset>
</td>

  <td id='td1'>
<fieldset>
<legend class='my' id='st'>la mauvaise moyenne</legend>
 <xsl:value-of select="$nbmin" />
</fieldset>
</td>

 <td id='td1'>
<fieldset>
<legend class='my' id='st'>La moyenne de la classe </legend>
<xsl:value-of select="format-number((sum(//moy_annuel))div(count(/etudians/etudiant)),'#.##')" />
</fieldset>
</td>
</tr>
<tr>
  <td id='td1'>
<fieldset>
<legend class='prs' id='sta'>pourcentage des admis</legend>
<p><xsl:value-of select='count(//moyen[M.S1 >= 10 and M.S2 >= 10])'/> etudiants</p>
              <p><xsl:value-of select="format-number(((count(//moyen[M.S1 >= 10 and M.S2 >= 10])*100) div $nbret),'#.##')"/> %</p>
</fieldset>
</td>

 <td id='td1'>
<fieldset>
<legend class='prs' id='sta'>pourcentage des admis avec dettes</legend>
<p><xsl:value-of select='count(//creadit[creadit_s1+ creadit_s2 >= 45 and 60 >creadit_s1+creadit_s2])'/> etudiants</p>
              <p><xsl:value-of select="format-number(((count(//creadit[creadit_s1+ creadit_s2 >= 45 and 60 >creadit_s1+ creadit_s2])*100) div $nbret),'#.##')"/> %</p>
</fieldset>
</td>

<td id='td1'>
<fieldset>
<legend class='prs' id='sta'>pourcentage des ajournes</legend>
<p><xsl:value-of select='count(//creadit[45 > creadit_s1+ creadit_s2])'/> etudiants</p>
              <p><xsl:value-of select="format-number(((count(//creadit[45 >creadit_s1+ creadit_s2])*100) div $nbret),'#.##')"/> %</p>
</fieldset>
</td>

</tr>
</table>

</body>
</html>
</xsl:template>
</xsl:stylesheet>