<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="A4" page-height="29.7cm" page-width="21cm">
                    <fo:region-body margin="2cm" />
                </fo:simple-page-master>
            </fo:layout-master-set>

            <!-- Title page  -->
            <fo:page-sequence master-reference="A4">
                <fo:flow flow-name="xsl-region-body">
                    <fo:block position="absolute" text-align="center" font-weight="bold" margin-bottom="5cm"
                        font-family="Calibri" font-size="56pt" padding-before="5cm" color="black">
                        Serious games catalog
                    </fo:block>
                </fo:flow>
            </fo:page-sequence>

            <!-- Games -->
            <xsl:for-each select="//game">
                <xsl:variable name="genreId" select="@genreRef" />
                <xsl:variable name="alluvalAreaId" select="@alluvialAreaRef" />
                <xsl:variable name="creatorId" select="@creatorRef" />
                <xsl:variable name="gameId" select="@id" />
                <fo:page-sequence master-reference="A4">
                    <fo:flow flow-name="xsl-region-body">
                        <fo:block-container position="absolute" top="-2.5cm" left="-2.5cm" font-family="Calibry">
                            <fo:block position="absolute" text-align="center" padding-before="2cm" margin-left="2.5cm"
                                font-family="Calibri" font-size="20pt" color="black" font-weight="bold">
                                <xsl:value-of select="title" />
                            </fo:block>

                            <fo:block position="absolute" text-align="center" padding-before="0.7cm" margin-left="2.5cm">
                                <fo:external-graphic src="{unparsed-entity-uri(graphics/coverImage/@src)}" content-width="500px" content-height="500px"/>
                            </fo:block>

                            <fo:block position="relative" font-weight="bold" font-size="16pt" color="black" padding-before="0.5cm" margin-left="2cm">
                                Release date: 
                                <fo:inline position="relative" padding-left="0.3cm" font-weight="normal" font-size="14pt">
                                    <xsl:value-of select="releaseDate" />
                                </fo:inline>
                            </fo:block>

                            <fo:block position="relative" font-weight="bold" font-size="16pt" color="black" padding-before="0.5cm" margin-left="2cm">
                                Genre:
                                <fo:inline position="relative" padding-left="0.3cm" font-weight="normal" font-size="14pt">
                                    <xsl:value-of select="//genre[@id = $genreId ]/name" />
                                </fo:inline>
                            </fo:block>

                            <fo:block position="relative" font-weight="bold" font-size="16pt" color="black" padding-before="0.5cm" margin-left="2cm">
                                Alluvial Area:
                                <fo:inline position="relative" padding-left="0.3cm" font-weight="normal" font-size="14pt">
                                    <xsl:value-of select="//area[@id = $alluvalAreaId]/name" />
                                </fo:inline>
                            </fo:block>

                            <fo:block position="relative" font-weight="bold" font-size="16pt" color="black" padding-before="0.5cm" margin-left="2cm">
                                Creator:
                                <fo:inline position="relative" padding-left="0.3cm" font-weight="normal" font-size="14pt">
                                    <xsl:value-of select="//creator[@id = $creatorId]/name" />
                                </fo:inline>
                            </fo:block>

                            <fo:block position="relative" font-weight="bold" font-size="16pt" color="black" padding-before="0.5cm" margin-left="2cm">
                                Description:                                
                            </fo:block>
                            <fo:block position="relative" margin-left="2cm" font-weight="normal" font-size="14pt">
                                <xsl:value-of select="description" />
                            </fo:block>
                        </fo:block-container>
                    </fo:flow>
                </fo:page-sequence>
                <fo:page-sequence master-reference="A4">
                    <fo:flow flow-name="xsl-region-body">
                        <fo:block-container position="absolute" top="-2.5cm" left="-2.5cm">
                            <fo:block position="relative" padding-before="1.5cm" margin-left="2cm" font-weight="bold" font-family="Calibri" font-size="16pt" color="black">
                                Screenshots:
                            </fo:block>

                            <xsl:for-each select="//game[$gameId = @id]/graphics/screenshots/screenshot">
                                <fo:block position="absolute" text-align="center" padding-before="0.7cm" margin-left="2.5cm">
                                    <fo:external-graphic src="{unparsed-entity-uri(@src)}" content-width="500px" content-height="400px" />
                                </fo:block>
                            </xsl:for-each>
                        </fo:block-container>
                    </fo:flow>
                </fo:page-sequence>
            </xsl:for-each>

            <!-- Genres -->
            <fo:page-sequence master-reference="A4">
                <fo:flow flow-name="xsl-region-body">
                    <fo:block text-align="center" font-size="18pt" font-weight="bold">Genres</fo:block>
                    <fo:list-block>
                        <xsl:for-each select="//genre">
                            <fo:list-item padding-top="16pt">
                                <fo:list-item-label end-indent="label-end()">
                                    <fo:block>&#8226;</fo:block>
                                </fo:list-item-label>
                                <fo:list-item-body start-indent="body-start()">
                                    <fo:block font-weight="bold" font-size="14pt">
                                        <xsl:value-of select="name" />
                                    </fo:block>
                                    <fo:block font-weight="normal" font-size="12pt">
                                        <xsl:value-of select="description" />
                                    </fo:block>
                                </fo:list-item-body>
                            </fo:list-item>
                        </xsl:for-each>
                    </fo:list-block>
                </fo:flow>
            </fo:page-sequence>

            <!-- Alluvial areas -->
            <fo:page-sequence master-reference="A4">
                <fo:flow flow-name="xsl-region-body">
                    <fo:block text-align="center" font-size="18pt" font-weight="bold">Alluvial areas</fo:block>
                    <fo:list-block>
                        <xsl:for-each select="//area">
                            <fo:list-item padding-top="16pt">
                                <fo:list-item-label end-indent="label-end()">
                                    <fo:block>&#8226;</fo:block>
                                </fo:list-item-label>
                                <fo:list-item-body start-indent="body-start()">
                                    <fo:block font-weight="bold" font-size="14pt">
                                        <xsl:value-of select="name" />
                                    </fo:block>
                                    <fo:block font-weight="normal" font-size="12pt">
                                        <xsl:value-of select="description" />
                                    </fo:block>
                                </fo:list-item-body>
                            </fo:list-item>
                        </xsl:for-each>
                    </fo:list-block>
                </fo:flow>
            </fo:page-sequence>

            <!-- Creators -->
            <fo:page-sequence master-reference="A4">
                <fo:flow flow-name="xsl-region-body">
                    <fo:block text-align="center" font-size="18pt" font-weight="bold">Creators</fo:block>
                    <fo:list-block>
                        <xsl:for-each select="//creator">
                            <fo:list-item padding-top="16pt">
                                <fo:list-item-label end-indent="label-end()">
                                    <fo:block>&#8226;</fo:block>
                                </fo:list-item-label>
                                <fo:list-item-body start-indent="body-start()">
                                    <fo:block font-weight="bold" font-size="14pt">
                                        <xsl:value-of select="name" />
                                    </fo:block>
                                    <fo:block position="absolute" text-align="left">
                                        <fo:external-graphic src="{unparsed-entity-uri(logo/@src)}" content-width="100px" />
                                    </fo:block>
                                    <fo:block font-weight="normal" font-size="12pt">
                                        <xsl:value-of select="description" />
                                    </fo:block>
                                </fo:list-item-body>
                            </fo:list-item>
                        </xsl:for-each>
                    </fo:list-block>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
</xsl:stylesheet>