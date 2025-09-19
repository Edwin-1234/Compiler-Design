%{
   int lines=0,words=0,chars=0;
%}
%option noyywrap
%%
[a-zA-Z]+ {words++;chars+=yyleng;}
\n {lines++,chars++;}
. {chars++;}
%%

int main(int argc,char **argv)
{
   yyin = fopen(argv[1],"r");
   yylex();
   printf("number of words=%d \t chars=%d \t lines=%d\n",words,chars,lines);
   fclose(yyin);
}
