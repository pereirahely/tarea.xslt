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
    <!-- 
        Mostrar nombre del restaurante y ciudad, así como todos los menús que dispone el restaurante. 
        Conocido el nombre del restaurante, el resto de datos se obtendrán del XML.   
    -->
    <xsl:template match="/reservaeventos">
        <!-- Se deberá guardar el nombre del restaurante en una variable.
        De manera que si se modifica el nombre del restaurante en la variable, los platos, nombre, ciudad y link 
        también deberán modificarse de forma automática en la página. -->
        <xsl:variable name="restaurantName" select="/reservaeventos/restaurante[nombrerestaurante='El clarete']"/>
        <html lang="es">
            <head>
                <link href="./css/estilo.css" rel="stylesheet" type="text/css" />
                <meta charset="utf-8"/>
                <meta name="description" content="Restaurante" />
                <title>Restaurante</title>
            </head>
            <body>
                <header>
                    <img src= "./img/logotipo.png" alt= "Reservas" />
                    <a href="teatro.xml">Teatro</a>
                    <a href="restaurante.xml">Restaurante</a>
                    <a href="festival.xml">Festival</a>
                </header>
                <main>
                    <h1>
                    <!--  Al clicar encima del nombre del restaurante se abrirá un link a la página oficial. Su URL también se obtendrá del XML -->
                    <xsl:variable name="link" select='$restaurantName/informacion'/>
                    <a href="{$link}" target="_blank"><xsl:value-of select="$restaurantName/nombrerestaurante"/></a> - <xsl:value-of select="$restaurantName/ciudad"/></h1>
                    <xsl:for-each select="$restaurantName/menu">
                        <article class="restaurante">
                            <xsl:variable name="tipo" select="@tipo"/>
                            <h3><xsl:value-of select="$tipo"/></h3>
                            <p><xsl:value-of select="../menu[@tipo=$tipo]"/></p>
                        </article>
                    </xsl:for-each>
                </main>
                <footer>
                    <address>&#169; 2020 desarrollado por info@birt.eus</address>
                </footer>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>