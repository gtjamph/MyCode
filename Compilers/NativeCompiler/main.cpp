#include <stdio.h>
#include "Statement.h"
#include "Script.h"

int yyparse();
extern FILE *yyin;
extern ScriptBody *root;

int main(int argc, char* argv[])
{
	yyin = fopen(argv[1], "r");
	yyparse();
	root->dump(0);
}
