#pragma once
#include "Node.h"

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
	Expression *lhs, *rhs;
public:
	AssignmentExpression(Expression *lhs, Expression *rhs) : lhs(lhs), rhs(rhs) { };
	void dump(int indent)
	{
		label(indent, "AssignmentExpression\n");
		lhs->dump(indent+1, "lhs");
		rhs->dump(indent+1, "rhs");
	}
};

class IdentifierExpression : public Expression
{
private:
	char name;
public:
	IdentifierExpression(char name) : name(name) { };
	void dump(int indent)
	{
		label(indent, "IdentifierExpression %c\n", name);
	}
};

class NumberExpression : public Expression
{
private:
	int value;
public:
	NumberExpression(int value) : value(value) { };
	void dump(int indent)
	{
		label(indent, "NumberExpression %d\n", value);
	}
};

class BinaryExpression : public Expression
{
private:
	char op;
	Expression *lhs, *rhs;
public:
	BinaryExpression(Expression *lhs, char op, Expression *rhs) : lhs(lhs), rhs(rhs), op(op) { };
	void dump(int indent)
	{
		label(indent, "BinaryExpression %c\n", op);
		lhs->dump(indent+1, "lhs");
		rhs->dump(indent+1, "rhs");
	}
};