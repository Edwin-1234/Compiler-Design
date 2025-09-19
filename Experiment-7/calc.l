%{
#define YYSTYPE double
#include "calc.tab.h"
#include<stdlib.h>
%}
%option noyywrap
%%
([0-9]+)|([0-9]*\.[0-9]+) {yylval=atof(yytext);return INT;}
\n {return nl;}
[\t]
. {return yytext[0];}
%%

