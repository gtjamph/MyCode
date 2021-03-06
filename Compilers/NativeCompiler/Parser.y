%{
#include <stdio.h>
#include <Statement.h>
#include <Expression.h>
#include <Script.h>

int yylex();
void yyerror(char*);
extern "C" int yywrap();

ScriptBody *root;
%}

%union
{
    Expression *expr;
	Statement *stmt;
	vector<Statement*> *stmts;
	int num;
	char name;
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
	BitwiseORExpression BitwiseANDExpression BitwiseXORExpression IdentifierReference 
%type <stmt> Statement StatementListItem ExpressionStatement
%type <stmts> StatementList ScriptBody

%left '='
%nonassoc '<'
%left '+'

%%

Script: ScriptBody                              
    ;

ScriptBody: StatementList                       
    ;

StatementList: StatementListItem                
    | StatementList StatementListItem   	
    ;

StatementListItem: Statement			
    ;
/* TO DO | Declaration */

Statement: ExpressionStatement			
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

ExpressionStatement: Expression SEMICOLON  	
    | Expression          			
    ;

Expression: AssignmentExpression												
    ;
/* TO DO
    | Expression COMMA AssignmentExpression
    ;
*/

AssignmentExpression: LeftHandSideExpression ASSIGNMENT AssignmentExpression	
    | ConditionalExpression			
    ;
/* TO DO
    | LeftHandSideExpression AssignmentOperator AssignmentExpression  
    | YieldExpression
    | ArrowFunction
    ;
*/

/* LHS */
LeftHandSideExpression: NewExpression		
    ;
/* TO DO
    | CallExpression
    ;
*/

NewExpression: MemberExpression			
    ;
/* TO DO
    | NEW NewExpression
    ;
*/

MemberExpression: PrimaryExpression		
    ;

PrimaryExpression: IdentifierReference			
    | Literal					
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

IdentifierReference: Identifier			
    ;

Identifier: IdentifierName 			
    ;

IdentifierName: IDENT                   	
     ;


/* RHS */
ConditionalExpression: LogicalORExpression	
    ;

LogicalORExpression: LogicalANDExpression	
    ;

LogicalANDExpression: BitwiseORExpression	
    ;

BitwiseORExpression: BitwiseXORExpression	
    ;

BitwiseXORExpression: BitwiseANDExpression 	
    ;

BitwiseANDExpression: EqualityExpression 	
    ;

EqualityExpression: RelationalExpression	
    ;

RelationalExpression: ShiftExpression		
    ;

ShiftExpression: AdditiveExpression		
    ;

AdditiveExpression: MultiplicativeExpression	
    ;

MultiplicativeExpression: ExponentiationExpression  
    ;

ExponentiationExpression: UnaryExpression	
    ;

UnaryExpression: UpdateExpression		
    ;

UpdateExpression: LeftHandSideExpression	
    ;

Literal: NumericLiteral				
    ;

NumericLiteral: NUMBER				
    ;

%%

int yywrap()
{
    return 1;
}

