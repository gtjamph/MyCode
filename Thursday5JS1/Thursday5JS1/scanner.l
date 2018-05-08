%{ 

#include "parser.h"
#include <stdio.h> 

int lines = 0;

%} 
 
digit [0-9] 
letter [a-zA-Z] 
 
%% 
 
if                          { return IF; } 
else                        { return ELSE; } 
int                         { return INT; } 
bool                        { return BOOL; }

{letter}({letter}|{digit})*	{ yylval.name = _strdup(yytext); return IDENT; } 
{digit}+					{ yylval.num = atoi(yytext); return NUMBER; }
 
"="                         { return '='; } 
"+"                         { return '+'; } 
"<"                         { return '<'; } 
"("                         { return '('; } 
")"                         { return ')'; } 
"{"                         { return '{'; } 
"}"                         { return '}'; } 
";"                         { return ';'; } 
 
[\n]						{ lines++;    }
[ \t\r]						/* ignore whitespace */
 
.                           {                                  
								fprintf(stderr, "invalid character '%c'\n", *yytext);                                 
								exit(0);                             
							} 

%% 
 
int yywrap() 
{     
	return 1; 
}

void yyerror(const char* message)
{
    fprintf(stderr, "Error: line %d, %s\n", lines, message);
}
