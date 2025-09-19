%{
        #include<stdio.h>
 int yyerror();
 int yylex();
%}
%token alpha numeric
%%
start:s '\n' {printf("valid identifier\n");return 0;}
s:alpha A
 ;
A:alpha A
 |numeric A
 |
 ;
%%
int main()
{
 return yyparse();
}
int yyerror()
{
 printf("Invalid identifier\n");
}
