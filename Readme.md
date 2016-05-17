This small project is an attempt to automate the process of creating build documentation from Pentaho Spoon jobs. At it's core it uses fairly simple XSL translation which, once applied to the .ktr file, produces html output with most of the attributes extracted from steps. With little help of the CSS, visual layout is easy to read and can be used as base of your documentation.
<br/><br/>
Usage: Transformation.exe src_file.ktr translation_schema output_file.html
<br/><br/>
Example: XSLPentahoSrcTransformation.exe "QuickWin_Load_Services.ktr" transformation.xsl output.html
<br/><br/>
This example takes file QuickWin_Load_Services.ktr, applies transformation.xsl and writeds results to the output.html file.
<br/><br/>
HTML output includes reference to simple CSS which imporves look of the output. The CSS file should be kept in the same directory as the output files

To use this tool, you need to download:<br/>
XSLPentahoTransformation/XML/transformation.xslt<br/>
XSLPentahoTransformation/XML/table_style0.css<br/>
XSLPentahoTransformation/XSLPentahoTransformation.exe<br/>

[17-05-2016]<br/>
New types of steps added to transformation1.1.xslt</br>
SwitchCase<br/>
CMDBInput<br/>
DBLookup<br/>
DetectLastRow<br/>
SetValueField<br/>
<br/>
<br/>
[09-05-2016]<br/>
Following types of steps are modeled:</br>
Constant<br/>
CMDBLookUp<br/>
CMDBOutput<br/>
TableInput<br/>
FilterRows<br/>
GetVariable<br/>
ScriptValueMod<br/>
AROutput<br/>
ARInput<br/>
SelectValues<br/>
SetValueConstant<br/>
SortRows<br/>
Unique<br/>
TypeExitExcelWriterStep<br/>
TextFileOutput<br/>
Calculator<br/>
