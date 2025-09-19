%{
   int numofvowel=0;
   int numofconsonants=0;
%}
%option noyywrap
%%
[aeiouAEIOU] {numofvowel++;}
[a-zA-Z] {numofconsonants++;}
.
%%
int main()
{
   printf("Enter text, ctrl+D to stop\n");
   yylex();
   printf("The number of vowels in the input is %d\n",numofvowel);
   printf("The number of consonants in the input is %d\n",numofconsonants);
}
