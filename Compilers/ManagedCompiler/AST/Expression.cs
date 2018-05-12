namespace ManagedCompiler.AST
{
    public abstract class Expression : Node
    {
    }

    public class AssignmentExpression : Expression
    {
	    private Expression lhs, rhs;

	    public AssignmentExpression(Expression lhs, Expression rhs)
        {
            this.lhs = lhs;
            this.rhs = rhs;
        }

        public override void dump(int indent)
	    {
		    label(indent, "AssignmentExpression\n");
		    lhs.dump(indent+1, "lhs");
		    rhs.dump(indent+1, "rhs");
	    }
    };

    public class IdentifierExpression : Expression
    {
        private char name;
	    public IdentifierExpression(char name)
        {
            this.name = name;
        }
	    public override void dump(int indent)
	    {
		    label(indent, "IdentifierExpression {0}\n", name);
	    }
    };

    public class NumberExpression : Expression
    {
        private int value;
        public NumberExpression(int value)
        {
            this.value = value;
        }
	    public override void dump(int indent)
	    {
		    label(indent, "NumberExpression {0}\n", value);
	    }
    };

    public class BinaryExpression : Expression
    {
        private char op;
	    private Expression lhs, rhs;
        public BinaryExpression(Expression lhs, char op, Expression rhs)
        {
            this.op = op;
            this.lhs = lhs;
            this.rhs = rhs;
        }
	    public override void dump(int indent)
	    {
		    label(indent, "BinaryExpression {0}\n", op);
		    lhs.dump(indent+1, "lhs");
		    rhs.dump(indent+1, "rhs");
	    }
    };
}