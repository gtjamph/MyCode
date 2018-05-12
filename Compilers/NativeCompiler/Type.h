#pragma once
#include "Node.h"

class Type : public Node
{
};

class IntType : public Type
{
public:
	IntType()  { };
	void dump(int indent)
	{
		label(indent, "IntType\n");
	}
};


class BoolType : public Type
{
public:
	BoolType() { };
	void dump(int indent)
	{
		label(indent, "BoolType\n");
	}
};