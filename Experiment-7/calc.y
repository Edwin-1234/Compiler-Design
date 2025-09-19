%{
#define YYSTYPE double
#include<stdio.h>
#include<stdlib.h>
int yylex();
int yyerror();
%}
%token INT nl
%left '+' '-'
%left '*' '/'
%left '(' ')'
%right UMINUS
%%
s:e nl {printf("=%f\n",$1);return 0;}
e:e '+' e {$$=$1+$3;}
 |e '-' e {$$=$1-$3;}
 |e '*' e {$$=$1*$3;}
 |e '/' e {$$=$1/$3;}
 |'-' e %prec UMINUS {$1=-$2;}
 |'(' e ')' {$$=$2;}
 | INT {$$=$1;}
%%
int main(){
 return yyparse();      
}
int yyerror()
{
 printf("Invalid expression");
 return 0;
}
