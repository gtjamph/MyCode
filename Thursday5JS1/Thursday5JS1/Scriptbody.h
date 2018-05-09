#pragma once
#include "Node.h"
#include "Statement.h"
#include <vector>

using namespace std;

class ScriptBody : public Node
{
private:
	vector<StatementListItem*> *stmts;
public:
	ScriptBody(vector<StatementListItem*> *stmts) : stmts(stmts) {};
	void dump(int indent)
	{
		label(indent, "ScriptBody\n");
		for (std::vector<StatementListItem*>::iterator iter = stmts->begin(); iter != stmts->end(); ++iter)
			(*iter)->dump(indent + 1);
	}
};