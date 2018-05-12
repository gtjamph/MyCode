using System.IO;

namespace ManagedCompiler
{
    class Compiler
    {
        static void Main(string[] args)
        {
            var filename = args[0];
            var file = new FileStream(args[0], FileMode.Open);
            Scanner scanner = new Scanner(file);
            Parser parser = new Parser(scanner);
            parser.Parse();
            Parser.root.dump(0);
        }
    }
}
