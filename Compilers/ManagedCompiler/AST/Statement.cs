using System.Collections.Generic;

namespace ManagedCompiler.AST
{ 
    public abstract class Statement : Node
    {
    }

    public class IfStatement : Statement
    {
        private Expression cond;
	    private Statement thenStmt, elseStmt;

        public IfStatement(Expression cond, Statement thenStmt, Statement elseStmt)
        {
            this.cond = cond;
            this.thenStmt = thenStmt;
            this.elseStmt = elseStmt;
        }

	    public override void dump(int indent)
	    {
		    label(indent, "IfStatement\n");
		    cond.dump(indent+1, "cond");
		    thenStmt.dump(indent+1, "then");
		    elseStmt.dump(indent+1, "else");
	    }
    };

    public class ExpressionStatement : Statement
    {
        private Expression expr;

        public ExpressionStatement(Expression expr)
        {
            this.expr = expr;
        }

	    public override void dump(int indent)
	    {
		    label(indent, "ExpressionStatement\n");
		    expr.dump(indent+1);
	    }
    };

    public class VariableDeclaration : Statement
    {
        private Type type;
	    private char name;
        public VariableDeclaration(Type type, char name)
        {
            this.type = type;
            this.name = name;
        }
        public override void dump(int indent)
	    {
		    label(indent, "VariableDeclaration {0}\n", name);
		    type.dump(indent + 1);
	    }
    };

    public class CompoundStatement : Statement
    {
        private List<Statement> stmts;

        public CompoundStatement(List<Statement> stmts)
        {
            this.stmts = stmts;
        }

	    public override void dump(int indent)
	    {
		    label(indent, "CompoundStatement\n");
		    foreach (var child in stmts)
			    child.dump(indent+1); 
	    }
    }
}