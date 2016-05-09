<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:template match="transformation">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="table_style0.css"/>
            </head>
            <body>

                <xsl:apply-templates select="step/type[text() = 'Constant']"/>
                <br/>
                <xsl:apply-templates select="step/type[text() = 'CMDBLookUp']"/>
                <br/>
                <xsl:apply-templates select="step/type[text() = 'CMDBOutput']"/>
                <br/>
                <xsl:apply-templates select="step/type[text() = 'TableInput']"/>
                <br/>
                <xsl:apply-templates select="step/type[text() = 'FilterRows']"/>
                <br/>
                <xsl:apply-templates select="step/type[text() = 'GetVariable']"/>
                <br/>
                <xsl:apply-templates select="step/type[text() = 'ScriptValueMod']"/>
                <br/>
                <xsl:apply-templates select="step/type[text() = 'AROutput']"/>
                <br/>
                <xsl:apply-templates select="step/type[text() = 'ARInput']"/>
                <br/>
                <xsl:apply-templates select="step/type[text() = 'SelectValues']"/>
                <br/>
                <xsl:apply-templates select="step/type[text() = 'SetValueConstant']"/>
                <br/>
                <xsl:apply-templates select="step/type[text() = 'SortRows']"/>
                <br/>
                <xsl:apply-templates select="step/type[text() = 'Unique']"/>
                <br/>
                <xsl:apply-templates select="step/type[text() = 'TypeExitExcelWriterStep']"/>
                <br/>
                <xsl:apply-templates select="step/type[text() = 'TextFileOutput']"/>
                <br/>
                <xsl:apply-templates select="step/type[text() = 'Calculator']"/>
                <br/>
                <xsl:apply-templates select="step/type[text() = 'SwitchCase']"/>
                <br/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="step/type[text() = 'Constant']">
        <div class="datagrid">
            <table>
                <caption>
                    <xsl:value-of select="."/>
                    <xsl:text> (</xsl:text>
                    <xsl:value-of select="../name"/>
                    <xsl:text>)</xsl:text>
                </caption>
                <tr>
                    <th>Name</th>
                    <th>Type</th>
                    <th>Format</th>
                    <th>Value</th>
                </tr>
                <xsl:for-each select="../fields/field">
                    <tr>
                        <td>
                            <xsl:value-of select="name"/>
                        </td>
                        <td>
                            <xsl:value-of select="type"/>
                        </td>
                        <td>
                            <xsl:value-of select="format"/>
                        </td>
                        <td>
                            <xsl:value-of select="nullif"/>
                        </td>
                    </tr>
                </xsl:for-each>
            </table>
        </div>
    </xsl:template>

    <xsl:template match="step/type[text() = 'CMDBLookUp']">
        <div class="datagrid">
            <table>
                <caption>
                    <xsl:value-of select="."/>
                    <xsl:text> (</xsl:text>
                    <xsl:value-of select="../name"/>
                    <xsl:text>)</xsl:text>
                </caption>
                <tr>
                    <th>Connection</th>
                    <td>
                        <xsl:value-of select="../connection"/>
                    </td>
                </tr>
                <tr>
                    <th>Class Name</th>
                    <td>
                        <xsl:value-of select="../lookup/ClassName"/>
                    </td>
                </tr>
                <tr>
                    <th>NameSpace</th>
                    <td>
                        <xsl:value-of select="../lookup/NameSpace"/>
                    </td>
                </tr>
                <tr>
                    <th>DatasetId</th>
                    <td>
                        <xsl:value-of select="../lookup/DatasetId"/>
                    </td>
                </tr>
                <tr>
                    <th>Enable Cache</th>
                    <td>
                        <xsl:value-of select="../cache"/>
                    </td>
                </tr>
                <tr>
                    <th>The Keys to lookup the value</th>
                    <td>
                        <table>
                            <tr>
                                <th>Class Attribute</th>
                                <th>Comparator</th>
                                <th>Field1</th>
                                <th>Field2</th>
                            </tr>
                            <xsl:for-each select="../lookup/key">
                                <tr>
                                    <td>
                                        <xsl:value-of select="field"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="condition"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="name"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="name2"/>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </td>
                </tr>
                <tr>
                    <th>Values to be returned from the lookup table</th>
                    <td>
                        <table>
                            <tr>
                                <th>Attribute</th>
                                <th>New Name</th>
                                <th>Default</th>
                                <th>Type</th>
                            </tr>
                            <xsl:for-each select="../lookup/value">
                                <tr>
                                    <td>
                                        <xsl:value-of select="name"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="rename"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="default"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="type"/>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </td>
                </tr>
            </table>
            <br/>
        </div>
    </xsl:template>

    <xsl:template match="step/type[text() = 'CMDBOutput']">
        <div class="datagrid">
            <table>
                <caption>
                    <xsl:value-of select="."/>
                    <xsl:text> (</xsl:text>
                    <xsl:value-of select="../name"/>
                    <xsl:text>)</xsl:text>
                </caption>
                <tr>
                    <th>Connection</th>
                    <td>
                        <xsl:value-of select="../connection"/>
                    </td>
                </tr>
                <tr>
                    <th>Class Name</th>
                    <td>
                        <xsl:value-of select="../lookup/ClassName"/>
                    </td>
                </tr>
                <tr>
                    <th>NameSpace</th>
                    <td>
                        <xsl:value-of select="../lookup/NameSpace"/>
                    </td>
                </tr>
                <tr>
                    <th>DatasetId</th>
                    <td>
                        <xsl:value-of select="../lookup/DatasetId"/>
                    </td>
                </tr>
                <tr>
                    <th>CMI Commit size</th>
                    <td>
                        <xsl:value-of select="../commit"/>
                    </td>
                </tr>
                <tr>
                    <th>Only insert new CIs</th>
                    <td>
                        <xsl:value-of select="../always_insert"/>
                    </td>
                </tr>
                <tr>
                    <th>Use Cache</th>
                    <td>
                        <xsl:value-of select="../cache_required"/>
                    </td>
                </tr>
                <tr>
                    <th>The Keys to lookup the value</th>
                    <td>
                        <table>
                            <tr>
                                <th>Class Attribute</th>
                                <th>Comparator</th>
                                <th>Stream Field1</th>
                            </tr>
                            <xsl:for-each select="../lookup/key">
                                <tr>
                                    <td>
                                        <xsl:value-of select="field"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="condition"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="name"/>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </td>
                </tr>
                <tr>
                    <th>Values to be returned from the lookup table</th>
                    <td>
                        <table>
                            <tr>
                                <th>Class</th>
                                <th>Stream Field</th>
                                <th>Update</th>
                            </tr>
                            <xsl:for-each select="../lookup/value">
                                <tr>
                                    <td>
                                        <xsl:value-of select="name"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="rename"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="update"/>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </td>
                </tr>
            </table>
            <br/>
        </div>
    </xsl:template>


    <xsl:template match="step/type[text() = 'TableInput']">
        <div class="datagrid">
            <table>
                <caption>
                    <xsl:value-of select="."/>
                    <xsl:text> (</xsl:text>
                    <xsl:value-of select="../name"/>
                    <xsl:text>)</xsl:text>
                </caption>
                <tr>
                    <th>Connection</th>
                    <td>
                        <xsl:value-of select="../connection"/>
                    </td>
                </tr>
                <tr>
                    <th>SQL</th>
                    <td>
                        <xsl:value-of select="../sql"/>
                    </td>
                </tr>
                <tr>
                    <th>Enable lazy conversion</th>
                    <td>
                        <xsl:value-of select="../lazy_conversion_active"/>
                    </td>
                </tr>
                <tr>
                    <th>Replace variables in the script?</th>
                    <td>
                        <xsl:value-of select="../variables_active"/>
                    </td>
                </tr>
            </table>
        </div>
    </xsl:template>

    <xsl:template match="step/type[text() = 'FilterRows']">
        <div class="datagrid">
            <table>
                <caption>
                    <xsl:value-of select="."/>
                    <xsl:text> (</xsl:text>
                    <xsl:value-of select="../name"/>
                    <xsl:text>)</xsl:text>
                </caption>
                <tr>
                    <th>Send ‘true’ data to step</th>
                    <td>
                        <xsl:value-of select="../send_true_to"/>
                    </td>
                </tr>
                <tr>
                    <th>Send ‘false’ data to step</th>
                    <td>
                        <xsl:value-of select="../send_false_to"/>
                    </td>
                </tr>
                <tr>
                    <th>The condition</th>
                    <td>
                        <xsl:value-of select="../compare/condition/leftvalue"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="../compare/condition/function"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="../compare/condition/rightvalue"/>
                    </td>
                </tr>
            </table>
        </div>
    </xsl:template>

    <xsl:template match="step/type[text() = 'GetVariable']">
        <div class="datagrid">
            <table>
                <caption>
                    <xsl:value-of select="."/>
                    <xsl:text> (</xsl:text>
                    <xsl:value-of select="../name"/>
                    <xsl:text>)</xsl:text>
                </caption>
                <tr>
                    <th>Name</th>
                    <th>Variable</th>
                    <th>Format</th>
                    <th>Type</th>
                </tr>
                <xsl:for-each select="../fields/field">
                    <tr>
                        <td>
                            <xsl:value-of select="name"/>
                        </td>
                        <td>
                            <xsl:value-of select="variable"/>
                        </td>
                        <td>
                            <xsl:value-of select="format"/>
                        </td>
                        <td>
                            <xsl:value-of select="type"/>
                        </td>
                    </tr>

                </xsl:for-each>
            </table>
        </div>
    </xsl:template>

    <xsl:template match="step/type[text() = 'ScriptValueMod']">
        <div class="datagrid">
            <table>
                <caption>
                    <xsl:value-of select="."/>
                    <xsl:text> (</xsl:text>
                    <xsl:value-of select="../name"/>
                    <xsl:text>)</xsl:text>
                </caption>
                <tr>
                    <th>Script</th>
                </tr>
                <tr>
                    <td>
                        <xsl:value-of select="../jsScripts/jsScript/jsScript_script"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table>
                            <tr>

                                <th>Fieldname</th>
                                <th>Rename to</th>
                                <th>Type</th>
                                <th>Length</th>
                                <th>Precision</th>
                                <th>Replace</th>
                            </tr>
                            <xsl:for-each select="../fields/field">
                                <tr>
                                    <td>
                                        <xsl:value-of select="name"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="rename"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="type"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="length"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="precision"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="replace"/>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </xsl:template>

    <xsl:template match="step/type[text() = 'AROutput']">
        <div class="datagrid">
            <table>
                <caption>
                    <xsl:value-of select="."/>
                    <xsl:text> (</xsl:text>
                    <xsl:value-of select="../name"/>
                    <xsl:text>)</xsl:text>
                </caption>
                <tr>
                    <th>Connection</th>
                    <td>
                        <xsl:value-of select="../connection"/>
                    </td>
                </tr>
                <tr>
                    <th>Form Name</th>
                    <td>
                        <xsl:value-of select="../form_name"/>
                    </td>
                </tr>
                <tr>
                    <th>Matching Qualification</th>
                    <td>
                        <xsl:value-of select="../matching_qualification"/>
                    </td>
                </tr>
                <tr>
                    <th>Batch Commit Size</th>
                    <td>
                        <xsl:value-of select="../commit_size"/>
                    </td>
                </tr>
                <tr>
                    <th>Fallback to single row commit if batch commit fails</th>
                    <td>
                        <xsl:value-of select="../fallback_to_single_row_commit"/>
                    </td>
                </tr>
                <tr>
                    <th>Duplicate Request Action</th>
                    <td>
                        <xsl:value-of select="../dup_request_action_id"/>
                    </td>
                </tr>
                <tr>
                    <th>Match By Request ID</th>
                    <td>
                        <xsl:value-of select="../multi_match_option"/>
                    </td>
                </tr>
                <tr>
                    <th>Require Required Fields</th>
                    <td>
                        <xsl:value-of select="../require_required_fields"/>
                    </td>
                </tr>
                <tr>
                    <th>Enforce Pattern Matching</th>
                    <td>
                        <xsl:value-of select="../enforce_pattern_matching"/>
                    </td>
                </tr>
                <tr>
                    <th>Skip Workflow Processing</th>
                    <td/>
                </tr>
                <tr>
                    <th>Field Mapping</th>
                    <td>
                        <table>
                            <tr>
                                <th>Form Field</th>
                                <th>Stream Field</th>
                            </tr>
                            <xsl:for-each select="../field_mapping">
                                <tr>
                                    <td>
                                        <xsl:value-of select="ar_field_name"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="stream_field_name"/>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </xsl:template>

    <xsl:template match="step/type[text() = 'ARInput']">
        <div class="datagrid">
            <table>
                <caption>
                    <xsl:value-of select="."/>
                    <xsl:text> (</xsl:text>
                    <xsl:value-of select="../name"/>
                    <xsl:text>)</xsl:text>
                </caption>
                <tr>
                    <th>Connection</th>
                    <td>
                        <xsl:value-of select="../connection"/>
                    </td>
                </tr>
                <tr>
                    <th>Form Name</th>
                    <td>
                        <xsl:value-of select="../form_name"/>
                    </td>
                </tr>
                <tr>
                    <th>Chunk Size</th>
                    <td>
                        <xsl:value-of select="../max_retrieve"/>
                    </td>
                </tr>
                <tr>
                    <th>Qualification</th>
                    <td>
                        <xsl:value-of select="../qualification"/>
                    </td>
                </tr>
                <tr>
                    <th>Field Mapping</th>
                    <td>
                        <table>
                            <tr>
                                <th>Field Name</th>
                                <th>Field ID</th>
                                <th>Field Type</th>
                            </tr>
                            <xsl:for-each select="../field_mapping">
                                <tr>
                                    <td>
                                        <xsl:value-of select="name"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="id"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="type"/>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </td>

                </tr>
            </table>
        </div>
    </xsl:template>


    <xsl:template match="step/type[text() = 'SelectValues']">
        <div class="datagrid">
            <table>
                <tr>
                    <td>
                        <table>
                            <caption>
                                <xsl:value-of select="."/>
                                <xsl:text> (</xsl:text>
                                <xsl:value-of select="../name"/>
                                <xsl:text>)</xsl:text>
                            </caption>
                            <th>Select &amp; Alter</th>
                            <tr>
                                <th>Field Name</th>
                                <th>Rename To</th>
                                <th>Length</th>
                                <th>Precision</th>
                            </tr>
                            <xsl:for-each select="../fields/field">
                                <tr>
                                    <td>
                                        <xsl:value-of select="name"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="rename"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="length"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="precision"/>
                                    </td>

                                </tr>
                            </xsl:for-each>
                        </table>
                        <br/>

                        <table>
                            <th>Remove</th>
                            <tr>
                                <th>Field Name</th>
                            </tr>

                            <xsl:for-each select="../fields/remove">
                                <tr>
                                    <td>
                                        <xsl:value-of select="name"/>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </table>

                        <br/>
                        <table>
                            <th>Meta-data</th>
                            <tr>
                                <th>Field Name</th>
                                <th>Rename To</th>
                                <th>Type</th>
                                <th>Length</th>
                                <th>Precision</th>
                                <th>Binary to Normal></th>
                                <th>Format</th>
                                <th>Data Format Lenient</th>
                                <th>Encoding</th>
                                <th>Decimal></th>
                                <th>Grouping</th>
                            </tr>
                            <xsl:for-each select="../fields/meta">
                                <tr>
                                    <td>
                                        <xsl:value-of select="name"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="rename"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="type"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="length"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="precision"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="storage_type"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="format"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="date_format_lenient"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="encoding"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="decimal_symbol"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="grouping_symbol"/>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </table>

                    </td>
                </tr>
            </table>
            <br/>
        </div>
    </xsl:template>

    <xsl:template match="step/type[text() = 'SetValueConstant']">
        <div class="datagrid">
            <table>
                <caption>
                    <xsl:value-of select="."/>
                    <xsl:text> (</xsl:text>
                    <xsl:value-of select="../name"/>
                    <xsl:text>)</xsl:text>
                </caption>
                <tr>
                    <th>Field</th>
                    <th>Replace by value</th>
                    <th>Conversion mask (Date)</th>
                </tr>
                <xsl:for-each select="../fields/field">
                    <tr>
                        <td>
                            <xsl:value-of select="name"/>
                        </td>
                        <td>
                            <xsl:value-of select="value"/>
                        </td>
                        <td>
                            <xsl:value-of select="mask"/>
                        </td>
                    </tr>
                </xsl:for-each>
            </table>
            <br/>
        </div>
    </xsl:template>

    <xsl:template match="step/type[text() = 'SortRows']">
        <div class="datagrid">
            <table>
                <caption>
                    <xsl:value-of select="."/>
                    <xsl:text> (</xsl:text>
                    <xsl:value-of select="../name"/>
                    <xsl:text>)</xsl:text>
                </caption>
                <tr>
                    <th>Sort directory</th>
                    <td/>
                </tr>
                <tr>
                    <th>TMP-file prefix</th>
                    <td/>
                </tr>
                <tr>
                    <th>Sort size (rows in memory)</th>
                    <td/>
                </tr>
                <tr>
                    <th>Fields</th>
                    <td>
                        <table>
                            <tr>
                                <th>Field Name</th>
                                <th>Ascending</th>
                                <th>Case sencitive compare?</th>
                            </tr>
                            <xsl:for-each select="../fields/field">
                                <td>
                                    <xsl:value-of select="name"/>
                                </td>
                                <td>
                                    <xsl:value-of select="ascending"/>
                                </td>
                                <td>
                                    <xsl:value-of select="case_sensitive"/>
                                </td>
                            </xsl:for-each>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </xsl:template>

    <xsl:template match="step/type[text() = 'Unique']">
        <div class="datagrid">
            <table>
                <caption>
                    <xsl:value-of select="."/>
                    <xsl:text> (</xsl:text>
                    <xsl:value-of select="../name"/>
                    <xsl:text>)</xsl:text>
                </caption>> <tr>
                    <th>Redirect duplicate</th>
                    <td>
                        <xsl:value-of select="../distribute"/>
                    </td>
                </tr>
                <tr>
                    <th>Fields to compare on</th>
                    <td>
                        <table>
                            <tr>
                                <th>Field Name</th>
                                <th>Ignore case</th>
                            </tr>
                            <xsl:for-each select="../fields/field">
                                <tr>
                                    <td>
                                        <xsl:value-of select="name"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="case_insensitive"/>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </xsl:template>

    <xsl:template match="step/type[text() = 'TypeExitExcelWriterStep']">
        <div class="datagrid">
            <table>
                <caption>
                    <xsl:value-of select="."/>
                    <xsl:text> (</xsl:text>
                    <xsl:value-of select="../name"/>
                    <xsl:text>)</xsl:text>
                </caption>
                <tr>
                    <th>Filename</th>
                    <td>
                        <xsl:value-of select="../file/name"/>
                    </td>
                </tr>
                <tr>
                    <th>Extension</th>
                    <td>
                        <xsl:value-of select="../file/extention"/>
                    </td>
                </tr>
                <tr>
                    <th>Headers</th>
                    <td>
                        <xsl:value-of select="../appendOmitHeader"/>
                    </td>
                </tr>
                <tr>
                    <th>No Empty Rows</th>
                    <td>
                        <xsl:value-of select="../appendEmpty"/>
                    </td>
                </tr>
                <th>Content</th>
                <td>
                    <table>
                        <tr>
                            <th>Name</th>
                            <th>Type</th>
                            <th>Field Title</th>
                        </tr>
                        <xsl:for-each select="../fields/field">
                            <tr>
                                <td>
                                    <xsl:value-of select="name"/>
                                </td>
                                <td>
                                    <xsl:value-of select="type"/>
                                </td>
                                <td>
                                    <xsl:value-of select="title"/>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </td>
            </table>
        </div>
    </xsl:template>

    <xsl:template match="step/type[text() = 'TextFileOutput']">
        <div class="datagrid">
            <table>
                <caption>
                    <xsl:value-of select="."/>
                    <xsl:text> (</xsl:text>
                    <xsl:value-of select="../name"/>
                    <xsl:text>)</xsl:text>
                </caption>
                <tr>
                    <th>Filename</th>
                    <td>
                        <xsl:value-of select="../file/name"/>
                    </td>
                </tr>
                <tr>
                    <th>Run this as command instead?</th>
                    <td>
                        <xsl:value-of select="../file/is_command"/>
                    </td>
                </tr>
                <tr>
                    <th>Do not create file at start</th>
                    <td>
                        <xsl:value-of select="../file/do_not_open_new_file_init"/>
                    </td>
                </tr>
                <tr>
                    <th>Accept file name from field?</th>
                    <td>
                        <xsl:value-of select="../fileNameInField"/>
                    </td>
                </tr>
                <tr>
                    <th>Extension</th>
                    <td>
                        <xsl:value-of select="../file/extention"/>
                    </td>
                </tr>
                <tr>
                    <th>Include stepnr in filename</th>
                    <td>
                        <xsl:value-of select="../file/split"/>
                    </td>
                </tr>
                <tr>
                    <th>Include partition nr in filename?</th>
                    <td>
                        <xsl:value-of select="../file/haspartno"/>
                    </td>
                </tr>
                <tr>
                    <th>Include date in filename?</th>
                    <td>
                        <xsl:value-of select="../file/add_date"/>
                    </td>
                </tr>
                <tr>
                    <th>Include time in filename?</th>
                    <td>
                        <xsl:value-of select="../file/add_time"/>
                    </td>
                </tr>
                <tr>
                    <th>Specify date/time format?</th>
                    <td>
                        <xsl:value-of select="../file/SpecifyFormat"/>
                    </td>
                </tr>
                <tr>
                    <th>Add filename to result</th>
                    <td>
                        <xsl:value-of select="../file/add_to_result_filenames"/>
                    </td>
                </tr>

                <tr>
                    <th>Fields</th>
                    <td>
                        <table>
                            <tr>
                                <th>Name</th>
                                <th>Type</th>
                                <th>Format</th>
                                <th>Length</th>
                                <th>Precision</th>
                                <th>Currency</th>
                                <th>Decimal</th>
                                <th>Group</th>
                                <th>Trim Type</th>
                            </tr>
                            <xsl:for-each select="../fields/field">
                                <tr>
                                    <td>
                                        <xsl:value-of select="name"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="type"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="format"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="length"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="precision"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="currency"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="decimal"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="group"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="trim_type"/>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </xsl:template>

    <xsl:template match="step/type[text() = 'Calculator']">
        <div class="datagrid">
            <table>
                <caption>
                    <xsl:value-of select="."/>
                    <xsl:text> (</xsl:text>
                    <xsl:value-of select="../name"/>
                    <xsl:text>)</xsl:text>
                </caption>
                <tr>
                    <th>New Field</th>
                    <th>Calculation</th>
                    <th>Field A</th>
                    <th>Field B</th>
                    <th>Field C</th>
                    <th>Value Type</th>
                    <th>Length</th>
                    <th>Precision</th>
                    <th>Conversion Mask</th>
                    <th>Decimal Symbol</th>
                    <th>Grouping Symbol</th>
                    <th>Currency symbol</th>
                </tr>

                <xsl:for-each select="../calculation">
                    <tr>
                        <td>
                            <xsl:value-of select="field_name"/>
                        </td>
                        <td>
                            <xsl:value-of select="calc_type"/>
                        </td>
                        <td>
                            <xsl:value-of select="field_a"/>
                        </td>
                        <td>
                            <xsl:value-of select="field_b"/>
                        </td>
                        <td>
                            <xsl:value-of select="field_c"/>
                        </td>
                        <td>
                            <xsl:value-of select="value_type"/>
                        </td>
                        <td>
                            <xsl:value-of select="value_length"/>
                        </td>
                        <td>
                            <xsl:value-of select="value_precision"/>
                        </td>
                        <td>
                            <xsl:value-of select="conversion_mask"/>
                        </td>
                        <td>
                            <xsl:value-of select="decimal_symbol"/>
                        </td>
                        <td>
                            <xsl:value-of select="grouping_symbol"/>
                        </td>
                        <td>
                            <xsl:value-of select="currency_symbol"/>
                        </td>
                    </tr>
                </xsl:for-each>

            </table>
        </div>
    </xsl:template>

    <xsl:template match="step/type[text() = 'SwitchCase']">
        <div class="datagrid">
            <table>
                <caption>
                    <xsl:value-of select="."/>
                    <xsl:text> (</xsl:text>
                    <xsl:value-of select="../name"/>
                    <xsl:text>)</xsl:text>
                </caption>
                <tr>
                    <th>Field name to switch</th>
                    <td>
                        <xsl:value-of select="../fieldname"/>
                    </td>
                </tr>
                <tr>
                    <th>Use string contains</th>
                    <td>
                        <xsl:value-of select="../use_contains"/>
                    </td>
                </tr>
                <tr>
                    <th>Case value data type</th>
                    <td>
                        <xsl:value-of select="../case_value_type"/>
                    </td>
                </tr>
                <tr>
                    <th>Case value conversion mask</th>
                    <td>
                        <xsl:value-of select="../case_value_format"/>
                    </td>
                </tr>
                <tr>
                    <th>Case value decimal symbol</th>
                    <td>
                        <xsl:value-of select="../case_value_decimal"/>
                    </td>
                </tr>
                <tr>
                    <th>Case value grouping symbol</th>
                    <td>
                        <xsl:value-of select="../case_value_group"/>
                    </td>
                </tr>
                <tr>
                    <th>Case values</th>
                    <td>
                        <table>
                            <tr>
                                <th>Value</th>
                                <th>Target step</th>
                            </tr>
                            <xsl:for-each select="../cases/case">
                                <tr>
                                    <td>
                                        <xsl:value-of select="value"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="target_step"/>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </td>
                </tr>
                <tr>
                    <th>Default target step</th>
                    <td>
                        <xsl:value-of select="../default_target_step"/>
                    </td>
                </tr>
            </table>
        </div>
    </xsl:template>
    
</xsl:stylesheet>
