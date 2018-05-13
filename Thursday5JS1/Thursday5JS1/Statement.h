#pragma once
//#include "Node.h"
#include "Expression.h"
#include "Type.h"
#include <vector>

using namespace std;

class Statement : public Node
{
};

class ExpressionStatement : public Statement {
private:
	Expression * expr;

public:
	ExpressionStatement(Expression* expr) :
		expr(expr) {};


	void dump(int indent) {
		label(indent, "ExpressionStatement\n");
		expr->dump(indent + 1);
	}

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


