using System.Xml.Xsl;

namespace XSLTransformation
{
    class Program
    {
        static void Main(string[] args)
        {
            XslCompiledTransform myXslCompiledTransform;
            myXslCompiledTransform = new XslCompiledTransform();
            myXslCompiledTransform.Load(args[1]);
            myXslCompiledTransform.Transform(args[0], args[2]);
        }
    }
}