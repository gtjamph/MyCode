#pragma once
#include "Node.h"
//#include <string>


class Expression : public Node
{
};

class IdentifierExpression : public Expression
{
private:
	const char* charName;
public:
	IdentifierExpression(const char* charName) : charName(charName) {};
	void dump(int indent)
	{
		label(indent, "IdentifierExpression: %s\n", charName);
	}
};

class NumericLiteralExpression : public Expression
{
private:
	int intNumber;
public:
	NumericLiteralExpression(int intNumber) : intNumber(intNumber) {};
	void dump(int indent)
	{
		label(indent, "NumericLiteralExpression: %d\n", intNumber);
	}
};

class AssignmentExpression : public Expression
{
private:
	Expression *lhs, *rhs;
public:
	AssignmentExpression(Expression *lhs, Expression *rhs) {
		this->lhs = lhs;
		this->rhs = rhs;
	};

	void dump(int indent) {
		label(indent, "AssignmentExpression\n");
		lhs->dump(indent + 1, "lhs");
		rhs->dump(indent + 1, "rhs");
	}
};
