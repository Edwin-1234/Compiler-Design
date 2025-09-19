%option noyywrap

%{
  #include  <stdio.h>
%}


preprocessor #.*
keyword int|float|char|if|for|while|else|main|void|return
identifier [_a-zA-Z][_a-zA-Z0-9]*
comment "/*"(.|"\n")*"*/"
asmt_op "="|"+="|"-="|"/="|"*="
relop "=="|"!="|"<"|">"|"<="|">="
logical_op "&&"|"||"|"!"
arith_op [\-+*/%]
integer ([0-9]+)
string \".*\"
punct [,;\[\]]

%%

{string} {printf("\n String:\t%s ",yytext);}
{keyword} {printf("\n Keyword:\t%s ",yytext);}
{preprocessor} {printf("\n Preprocessor:\t%s ",yytext);}
{comment} {printf("\n Comment:\t%s ",yytext);}
{asmt_op} {printf("\n Assignment operator:\t%s ",yytext);}
{logical_op} {printf("\n Logical Operator:\t%s ",yytext);}
{arith_op} {printf("\n Arithmatic operator:\t%s ",yytext);}
{integer} {printf("\n Integer:\t%s ",yytext);}
{identifier}: {printf("\n Label:\t%s ",yytext);}
{identifier} {printf("\n Variable:\t%s ",yytext);}
{integer} {printf("\n Integer Number:\t%s ",yytext);}
\) {printf("\n End o function\t%s ",yytext);}
{punct} {printf("\n Punctuators:\t%s ",yytext);}


%%

int main(int argc,char *argv[])
{
    yyin=fopen(argv[1],"r");
    yylex();
    fclose(yyin);
    return 0;
}
