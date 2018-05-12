namespace ManagedCompiler.AST
{
    public abstract class Type : Node
    {
    }

    public class IntType : Type
    {
	    public override void dump(int indent)
	    {
		    label(indent, "IntType\n");
	    }
    }


    public class BoolType : Type
    {
	    public override void dump(int indent)
	    {
		    label(indent, "BoolType\n");
	    }
    }
}