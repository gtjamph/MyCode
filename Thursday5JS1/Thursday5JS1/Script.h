#pragma once
#include "Node.h"
#include "Statement.h"
#include <vector>

using namespace std;

class ScriptBody : public Node
{
private:
	vector<Statement*> *stmts;
public:
	ScriptBody(vector<Statement*> *stmts) : stmts(stmts) {};
	void dump(int indent)
	{
		label(indent, "ScriptBody\n");
		vector<Statement*>::iterator iter;
		for (iter = stmts->begin(); iter != stmts->end(); ++iter)
		{
			(*iter)->dump(indent + 1);
		}
	}
};