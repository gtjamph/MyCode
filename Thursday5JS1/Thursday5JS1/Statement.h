#pragma once
#include "Node.h"
#include "Expression.h"
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


