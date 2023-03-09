<?xml version="1.0" encoding="UTF-8"?>
<!--
    Fecha: 09/03/2023
    Autor: Hely Pereira Almeida.
    Módulo: Lenguaje de marcas y sistemas de gestión de la información.
    Unidad: 04
    Tarea evaluativa 2
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="utf-8" method="html" doctype-system="about:legacy-doctype"/>
    <xsl:template match="/reservaeventos" >
	<html lang="es">
		<!--  Concierto por tipo de música: Mostrar el nombre de festival, nombre de grupo de música(concierto), 
		fecha, hora y lugar de todos los conciertos de "rock" que exista.

		El XSLT que muestra los conciertos solo usará plantillas y expresiones XPath adecuadas y no for-each.
		-->
		<head>
			<link href="./css/estilo.css" rel="stylesheet" type="text/css" />
			<meta charset="utf-8"/>
			<meta name="description" content="Página principal" />
			<title>Festival</title>
		</head>

		<body>
			<header>
				<img src= "./img/logotipo.png" alt= "Reservas" />
				<a href="teatro.xml">Teatro</a>
				<a href="restaurante.xml">Restaurante</a>
				<a href="festival.xml">Festival</a>
			</header>
			
			<section class="festival">
				<h1>Festivales de rock</h1>
				<table>
					<tr>
						<th>FESTIVAL</th>
						<th>CONCIERTO</th>
						<th>FECHA</th>
						<th>HORA</th>
						<th>LUGAR</th>
					</tr>
						<xsl:apply-templates select="festival"/>

				</table>			
			</section>
			<footer>
				<address>&#169; 2020 desarrollado por info@birt.eus</address>
			</footer>
		</body>
	</html>
    </xsl:template>
	<xsl:template match="festival">
		<tr>
			<td><xsl:value-of select="conciertos/concierto[grupo/@tipomusica ='rock']/../../nombrefesti"/></td>
			<td><xsl:value-of select="conciertos/concierto[grupo/@tipomusica ='rock']/grupo"/></td>
			<td><xsl:value-of select="conciertos/concierto[grupo/@tipomusica ='rock']/fecha"/></td>
			<td><xsl:value-of select="conciertos/concierto[grupo/@tipomusica ='rock']/hora"/></td>
			<td><xsl:value-of select="conciertos/concierto[grupo/@tipomusica ='rock']/carpa"/></td>
		</tr>
	</xsl:template>
</xsl:stylesheet>