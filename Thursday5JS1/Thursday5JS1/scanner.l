%{ 

#include "y.tab.h"
#include <stdio.h> 

%} 
 
digit [0-9] 
letter [a-zA-Z] 
 
%% 
 
if                          { return IF; } 
else                        { return ELSE; } 
int                         { return INT; } 
bool                        { return BOOL; }

{letter}({letter}|{digit})*	{ yylval.name = _strdup(yytext); return IDENT; } 
 {digit}+                   { yylval.num = atoi(yytext); return NUMBER; }
 
"="                         { return '='; } 
"+"                         { return '+'; } 
"<"                         { return '<'; } 
"("                         { return '('; } 
")"                         { return ')'; } 
"{"                         { return '{'; } 
"}"                         { return '}'; } 
";"                         { return ';'; } 
 
[ \r\n\t]                   /* skip whitespace */ 
 
.                           {                                  
								fprintf(stderr, "invalid character '%c'\n", *yytext);                                 
								exit(0);                             
							} 

%% 
 
int yywrap() 
{     
	return 1; 
}