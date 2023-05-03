%option noyywrap

%{
#include <stdio.h>
#include <stdlib.h>
int lineno = 1;
void ret_print(char *token_type);
void yyerror();
%}

/* Regular Expressions Section */

%%
\/\/[^\n]* { ret_print("COMMENT"); }
"go to"|"exit" { ret_print("RESERVED_UNCONDITIONAL_TRANSFER"); }
"if"|"then"|"else if"|"else"|"case"|"endcase" { ret_print("RESERVED_CONDITIONAL_TRANSFER"); }
"while"|"do"|"endwhile"|"repeat"|"until"|"loop"|"forever"|"for"|"by"|"to"|"endfor" { ret_print("RESERVED_ITERATION"); }
"input"|"output" { ret_print("RESERVED_IN_OUT"); }
"array"|"node" { ret_print("RESERVED_DECLARATION"); }
"call"|"return"|"stop"|"end" { ret_print("RESERVED_CONTROL"); }
"procedure"|"call"|"return"|"end" { ret_print("RESERVED_PROCEDURE"); }
"and"|"or"|"not" { ret_print("LOGICAL_OPS"); }
"ceil"|"floor"|"mod"|"log" { ret_print("MISC_MATH_OPS"); }
[_a-zA-Z][_a-zA-Z0-9]* { ret_print("IDENTIFIERS"); }
"<-" | "=" { ret_print("ASSIGNMENT"); }
"+"|"-"|"/"|"x"|"^" { ret_print("ARITHMETIC_OPS"); }
"<"|"<="|"!="|">"|">=" { ret_print("RELATIONAL_OPS"); }
":"|";"|"," { ret_print("DELIMITERS"); }
"("|")" { ret_print("GROUPINGS"); }
\'(\\.|[^\'])*\' { ret_print("STRINGS"); }
[1-9][0-9]*|0 { ret_print("INT"); }
[0-9]*\.?[0-9]+ { ret_print("FLOAT"); }
\s|\t { ret_print("WHITESPACE_CHAR"); }
\n { lineno++; ret_print("WHITESPACE_CHAR"); }
%%

void ret_print(char *token_type) {
    printf("yytext: %s\ttoken: %s\tlineno:%d\n\n", yytext, token_type, lineno);
}

void yyerror(char *message){
    printf("Error: \"%s\" in line %d. Token = %s\n", message, lineno, yytext);
    exit(1);
}

// Main function to start the lexical analysis
int main() {
    yylex();
    fclose(yyin);
    return 0;
}
