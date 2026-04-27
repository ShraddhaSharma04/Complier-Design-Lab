#include <stdio.h>
FILE *fp;  
%%
"<"[^>]*">"      {}
[^<>\n]+         { fprintf(fp, "%s ", yytext); }
\n               { fprintf(fp, "\n"); }
%%
int main()
{
    FILE *in;
    in = fopen("input.html", "r");   
    fp = fopen("output.txt", "w");   
    if(in == NULL || fp == NULL){
        printf("File error\n");
        return 0;
    }
yyin = in;
printf("Text extracted to output.txt\n");
    fclose(in);
    fclose(fp);
    return 0;
}
int yywrap(){
    return 1;
}

input.html
<html>
<body>
<h1>Hello World</h1>
<p>This is a Lex program</p>
</body>
</html>
