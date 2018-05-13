%{
#include <stdio.h>
#include <Statement.h>
#include <Expression.h>
#include <Script.h>

int yylex();
void yyerror(const char*);
extern "C" int yywrap();

ScriptBody *root;
%}

%union
{
    Expression *expr;
	Statement *stmt;
	vector<Statement*> *stmts;
	ScriptBody *scriptBody;
	int num;
	char* name;
	const char* charArray;
}

%token <num> NUMBER
%token <name> IDENT
%token IF ELSE INT BOOL
%token ASSIGNMENT
%token SEMICOLON

%type <expr> Expression NumericLiteral Literal PrimaryExpression MemberExpression NewExpression LeftHandSideExpression 
	UnaryExpression UpdateExpression MultiplicativeExpression AdditiveExpression ExponentiationExpression ShiftExpression 
	RelationalExpression EqualityExpression AssignmentExpression ConditionalExpression LogicalANDExpression LogicalORExpression 
	BitwiseORExpression BitwiseANDExpression BitwiseXORExpression IdentifierReference Identifier IdentifierName 
%type <stmt> Statement StatementListItem ExpressionStatement
%type <stmts> StatementList
%type <scriptBody> ScriptBody

%left '='
%nonassoc '<'
%left '+'

%%

Script: ScriptBody																{root = $1;}                              
    ;

ScriptBody: StatementList														{$$ = new ScriptBody($1);}                       
    ;

StatementList: StatementListItem												{$$ = new vector<Statement*>; $$->push_back($1);}                
    | StatementList StatementListItem											{$$ = $1; $$->push_back($2);}   	
    ;

StatementListItem: Statement													{$$ = $1;}			
    ;
/* TO DO | Declaration */

Statement: ExpressionStatement													{$$ = $1;}			
    ;
/* TO DO
    | BlockStatement      
    | VariableStatement
    | EmptyStatement
    | IfStatement           
    | BreakableStatement
    | ReturnStatement
    | ContinueStatement
    | BreakStatement
    | WithStatement
    | LabelledStatement
    | ThrowStatement
    | TryStatement
    | DebuggerStatement
    ;
*/

ExpressionStatement: Expression SEMICOLON											{$$ = new ExpressionStatement($1);}  	
				| Expression          			
				;

Expression: AssignmentExpression													{$$ = $1;}												
    ;
/* TO DO
    | Expression COMMA AssignmentExpression
    ;
*/

AssignmentExpression: LeftHandSideExpression ASSIGNMENT AssignmentExpression		{$$ = new AssignmentExpression($1, $3);}	
    | ConditionalExpression															{$$ = $1;}			
    ;
/* TO DO
    | LeftHandSideExpression AssignmentOperator AssignmentExpression  
    | YieldExpression
    | ArrowFunction
    ;
*/

/* LHS */
LeftHandSideExpression: NewExpression												{$$ = $1;}		
    ;
/* TO DO
    | CallExpression
    ;
*/

NewExpression: MemberExpression														{$$ = $1;}			
    ;
/* TO DO
    | NEW NewExpression
    ;
*/

MemberExpression: PrimaryExpression													{$$ = $1;}		
    ;

PrimaryExpression: IdentifierReference			
    | Literal																		{$$ = $1;}					
    ;
/* TO DO
    | ArrayLiteral 
    | ObjectLiteral     
    | FunctionExpression
    | ClassExpression
    | GeneratorExpression
    | RegularExpressionLiteral
    | TemplateLiteral
    | CoverParenthesizedExpressionAndArrowParameterList
    ;
*/

IdentifierReference: Identifier														{$$ = $1;}			
    ;

Identifier: IdentifierName															{$$ = $1;} 			
    ;

IdentifierName: IDENT																{$$ = new IdentifierExpression($1);}                   	
     ;


/* RHS */
ConditionalExpression: LogicalORExpression											{$$ = $1;}	
    ;

LogicalORExpression: LogicalANDExpression											{$$ = $1;}	
    ;

LogicalANDExpression: BitwiseORExpression											{$$ = $1;}	
    ;

BitwiseORExpression: BitwiseXORExpression											{$$ = $1;}	
    ;

BitwiseXORExpression: BitwiseANDExpression											{$$ = $1;} 	
    ;

BitwiseANDExpression: EqualityExpression											{$$ = $1;} 	
    ;

EqualityExpression: RelationalExpression											{$$ = $1;}	
    ;

RelationalExpression: ShiftExpression												{$$ = $1;}		
    ;

ShiftExpression: AdditiveExpression													{$$ = $1;}		
    ;

AdditiveExpression: MultiplicativeExpression										{$$ = $1;}	
    ;

MultiplicativeExpression: ExponentiationExpression									{$$ = $1;}  
    ;

ExponentiationExpression: UnaryExpression											{$$ = $1;}	
    ;

UnaryExpression: UpdateExpression													{$$ = $1;}		
    ;

UpdateExpression: LeftHandSideExpression											{$$ = $1;}	
    ;

Literal: NumericLiteral																{$$ = $1;}				
    ;

NumericLiteral: NUMBER																{$$ = new NumericLiteralExpression($1);}				
    ;

%%



