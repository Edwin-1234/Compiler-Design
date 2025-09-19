%option noyywrap
%{
        #include "exp8.h"
        #include "exp8.tab.h"
%}
%%
[0-9]+ {yylval.INT=atoi(yytext);return NUMBER;}
\n {return NL;}
[ \t]+ ;
. {return yytext[0];}
%%

