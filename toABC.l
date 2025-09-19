%{
   int i=0;
%}

%option noyywrap
%%

"abc" {for(i=0;yytext[i]!='\0';i++){
   yytext[i]=yytext[i]-32;

};ECHO;}
%%

int main()
{
   printf("Enter a string : ");
   yylex();
   return 0;
}

