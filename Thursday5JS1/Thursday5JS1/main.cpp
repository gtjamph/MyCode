#include <stdio.h>
#include "parser.h"

	//int yylex();
	//YYSTYPE yylval;

	int yyparse(void);
	extern FILE *yyin;

	int main(int argc, char* argv[])
	{
		//yyin = fopen(argv[1], "r");
		fopen_s(&yyin, argv[1], "r");
		yyparse();
		return 0;
	}
