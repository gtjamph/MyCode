%namespace ManagedCompiler

%{
int lines = 0;
%}

%%
// Error: No namespace has been defined
// ------------------------------------

[0-9]+		{ yylval.num = int.Parse(yytext); return (int)Tokens.NUMBER; }
[a-zA-Z]	{ yylval.name = yytext[0];   return (int)Tokens.IDENT; }

if			{ return (int)Tokens.IF; }
else		{ return (int)Tokens.ELSE; }

int			{ return (int)Tokens.INT; }
bool		{ return (int)Tokens.BOOL; }

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

.			{ System.Console.Error.WriteLine("Unexpected character '{0}'", yytext); }

%%

void yyerror(string message)
{
    System.Console.Error.WriteLine("Error: line {0}, {1}", lines, message);
}

