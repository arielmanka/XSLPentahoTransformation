
This small project is an attempt to automate the process of creating build documentation from Pentaho Spoon jobs. At it's core it uses fairly simple XSL translation which, once applied to the .ktr file, produces html output with most of the attributes extracted from steps. With little help of the CSS, visual layout is easy to read and can be used as base of your documentation.

Usage: Transformation.exe src_file.ktr translation_schema.xslt output_file.html

Example: XSLPentahoSrcTransformation.exe "QuickWin_Load_Services.ktr" transformation.xsl output.html

This example takes file QuickWin_Load_Services.ktr, applies transformation.xsl and writeds results to the output.html file.

HTML output includes reference to simple CSS which imporves look of the output. The CSS file should be kept in the same directory as the output files

Download:
XSLPentahoTransformation/XML/transformation.xslt
XSLPentahoTransformation/XML/table_style0.css
XSLPentahoTransformation/XSLPentahoTransformation.exe
