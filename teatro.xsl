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
            <head>
                <link href="./css/estilo.css" rel="stylesheet" type="text/css" />
                <meta name="description" content="Página principal" />
                <title>Teatro</title>
            </head>
            <body>
                <header>
                    <img src= "./img/logotipo.png" alt= "Reservas" />
                    <a href="teatro.xml">Teatro</a>
                    <a href="restaurante.xml">Restaurante</a>
                    <a href="festival.xml">Festival</a>
                </header>
                
                <main class="principal">
                    <section class="teatro">
                        <h1>PROXIMAS OBRAS DE TEATRO</h1>
                        <!-- 1. Listado de las obras de teatro de enero de 2023 ordenadas por fecha, de la más recientes a menos. 
                        Y además, las obras con precio menor de 20€ se mostrarán subrayadas. 
                        -->
                        <ul>
                            <xsl:for-each select="teatro">
                                <xsl:sort select="fechahora/@dia" />
                                <xsl:choose>
                                    <xsl:when test="precio&lt;20">
                                        <!-- El XLT para las obras de teatro, seleccionará sólo las obras de enero de 2023 -->
                                        <li style="text-decoration: underline"><xsl:value-of select="fechahora[contains(@dia, '01')]"/>: <xsl:value-of select="obra"/></li>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <li><xsl:value-of select="fechahora[contains(@dia, '01')]"/>: <xsl:value-of select="obra"/></li>  
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:for-each>
                        </ul>
                    </section>
                </main>
                <footer>
                    <address>&#169; 2020 desarrollado por info@birt.eus</address>
                </footer>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>