%{
#include "Expression.h"
#include "Statement.h"
#include "Parser.h"

int lines = 0;
%}

%%

[0-9]+		{ yylval.num = atoi(yytext); return NUMBER; }
[a-zA-Z]	{ yylval.name = yytext[0];   return IDENT; }

if			{ return IF; }
else		{ return ELSE; }

int			{ return INT; }
bool		{ return BOOL; }

"="			{ return '='; }
"+"			{ return '+'; }
"<"			{ return '<'; }
"("			{ return '('; }
")"			{ return ')'; }
"{"			{ return '{'; }
"}"			{ return '}'; }
";"			{ return ';'; }

[\n]		{ lines++;    }
[ \t\r]		/* ignore whitespace */ 

.			{ fprintf(stderr, "Unexpected character '%s'", yytext); }

%%

void yyerror(char* message)
{
    fprintf(stderr, "Error: line %d, %s\n", lines, message);
}