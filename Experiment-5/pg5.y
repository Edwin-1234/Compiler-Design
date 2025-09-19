%{
#include<stdio.h>
int yylex();
int yyerror();
%}
%token id num
%left '+' '-'
%left '*' '/'
%left '(' ')'
%%
start:E '\n' {printf("Valid epression\n"); return 0;}
E: E'+'E|E'-'E|E'*'E|E'/'E|'('E')'|id|num
%%
int main()
{
 return yyparse();
}
int yyerror()
{
        printf("Invalid expression\n");
}
