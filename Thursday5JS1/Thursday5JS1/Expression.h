#pragma once
#include "Node.h"
//#include <string>


class Expression : public Node
{
};

class IdentifierName : public Expression
{
private:
	const char* charName;
public:
	IdentifierName(const char* charName) : charName(charName) {};
	void dump(int indent)
	{
		label(indent, "IdentifierName\n");
	}
};

class NumericLiteral : public Expression
{
private:
	int intNumber;
public:
	NumericLiteral(int intNumber) : intNumber(intNumber) {};
	void dump(int indent)
	{
		label(indent, "NumericLiteral\n");
	}
};

class AssignmentExpression : public Expression
{
private:
	IdentifierName * lhs;
	const char *op;
	NumericLiteral *rhs;
public:
	AssignmentExpression(IdentifierName *lhs, const char *op, NumericLiteral *rhs) : lhs(lhs), op(op), rhs(rhs) {};
	void dump(int indent)
	{
		label(indent, "AssignmentExpression\n");
		lhs->dump(indent + 1);
		rhs->dump(indent + 1);
	}
};
