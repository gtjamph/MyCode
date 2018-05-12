#pragma once
#include "Expression.h"
#include "Type.h"
#include <vector>

using namespace std;

class Statement : public Node
{
};

class StatementListItem : public Statement
{
private:
	AssignmentExpression * assignmentExpression;
public:
	StatementListItem(AssignmentExpression *assignmentExpression) : assignmentExpression(assignmentExpression) {};
	void dump(int indent)
	{
		label(indent, "StatementListItem\n");
		assignmentExpression->dump(indent + 1);
	}
};

class IfStatement : public Statement
{
private:
	Expression *cond;
	Statement *thenStmt, *elseStmt;
public:
	IfStatement(Expression *cond, Statement *thenStmt, Statement *elseStmt) : cond(cond), thenStmt(thenStmt), elseStmt(elseStmt) { };
	void dump(int indent)
	{
		label(indent, "IfStatement\n");
		cond->dump(indent+1, "cond");
		thenStmt->dump(indent+1, "then");
		elseStmt->dump(indent+1, "else");
	}
};

class ExpressionStatement : public Statement
{
private:
	Expression *expr;
public:
	ExpressionStatement(Expression *expr) : expr(expr) { };
	void dump(int indent)
	{
		label(indent, "ExpressionStatement\n");
		expr->dump(indent+1);
	}
};

class VariableDeclaration : public Statement
{
private:
	Type *type;
	char name;
public:
	VariableDeclaration(Type *type, char name) : type(type), name(name) { };
	void dump(int indent)
	{
		label(indent, "VariableDeclaration %c\n", name);
		type->dump(indent + 1);
	}
};

class CompoundStatement : public Statement
{
private:
	vector<Statement*> *stmts;
public:
	CompoundStatement(vector<Statement*> *stmts) : stmts(stmts) { };
	void dump(int indent)
	{
		label(indent, "CompoundStatement\n");
		for (std::vector<Statement*>::iterator iter = stmts->begin(); iter != stmts->end(); ++iter)
			(*iter)->dump(indent+1); 
	}
};