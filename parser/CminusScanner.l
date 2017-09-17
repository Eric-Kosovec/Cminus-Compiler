/*
 * CminusScanner.l
 *
 * Cminus Lexical Analyzer
 *
 * Defines tokens and performs operations using those 
 * tokens in order to compile a Cminus program.
 * 
 * to compile:
 *  make
 *
 * Modified by Eric Kosovec
 */

WS                              [ \t]

%{

/* This scanner approximates the Void specification.
 *
 * Major differences:
 *
 *  (1) the printed spec is wrong in about sixteen ways in its definition
 *	of numeric constants.  The scanner recognizes a fairly broad class
 * 	of things as constants - it allows both 0 and 1.0 as constants, where
 *	the document would not.
 *
 *      Feel free to accept the things that the scanner accepts as constants.
 *	The bug is in the original spec document.
 *
 *	Note: the scanner classifies all kinds of constants as "constant".
 *	It does not make a distinction between character, integer, and floating
 *	point constants.  I think of that distinction as something to look for
 *	in the type checker lab, not something that the grammar should enforce.
 *
 *
 * To hook this thing up to your parser, you will need to take the include
 * file of grammar terminals and relate them to the constants defined below.
 * You can either edit the flex spec or edit the constant defintions.  (Of
 * course, you should do that on your own copy!)  
 *
 */

#include <stdio.h>
#include <string.h>
#include <util/symtab.h>
#include <util/symtab_stack.h>
#include <util/string_utils.h>
#include <util/dlink.h>

#include "CminusParser.h"

#include "mips_mgmt.h"
#include "typesystem.h"

EXTERN(int, get_value, (SymTable, int));
EXTERN(int, set_value, (SymTable, int, int));
EXTERN(int, set_str_value, (SymTable, int, char *));
EXTERN(void, set_type_struct, (SymTable, int, type_metadata *));

extern SymTable string_list;
%}

%option bison-bridge
%option prefix="Cminus_"

%%

int                             { return INTEGER; }
float                           { return FLOAT; }
while                           {
                                    Cminus_lval.ulval = g_NEXT_WHILE_ID++;
                                    return WHILE;
                                }
else                            { return ELSE; }
exit                            { return EXIT; }
if                              { 
                                    Cminus_lval.ulval = g_NEXT_IF_ID++;
                                    return IF;
                                }
read                            { return READ; }
write                           { return WRITE; }
return                          { return RETURN; }
\!                              { return NOT;}
"||"                            { return OR;}
\&&                             { return AND;}
\<=                             { return LE; }
\<                              { return LT; }
\>=                             { return GE; }
\>                              { return GT; }
\==                             { return EQ; }
\!=                             { return NE; }
\=                              { return ASSIGN; }
\;                              { return SEMICOLON; }
\{                              { return LBRACE; }
"}"                             { return RBRACE; }
\[                              { return LBRACKET; }
\]                              { return RBRACKET; }
\(                              { return LPAREN; }
\)                              { return RPAREN; }
\+                              { return PLUS; }
\-                              { return MINUS; }
\*                              { return TIMES; }
\/                              { return DIVIDE;}
","                             { return COMMA;}
\"[^\"]*\"                      {
                                    char str_label[16];
                                    memset(str_label, 0, sizeof(str_label));
                                    sprintf(str_label, "__str%d", g_STRING_INDEX++);
                                    Cminus_lval.ival = SymIndex(string_list, str_label);
                                    set_str_value(string_list, Cminus_lval.ival, substr(Cminus_text, 1, Cminus_leng - 2));
                                    return STRING;
                                }
[a-zA-Z]([a-zA-Z]|[0-9])*       {
                                    Cminus_lval.sval = ssave(Cminus_text);
                                    return IDENTIFIER;
                                }
[0-9]+                          { Cminus_lval.ival = atoi(Cminus_text); return INTCON; }
[0-9]+\.[0-9]+                   { Cminus_lval.fval = (float)atof(Cminus_text); return FLOATCON; }
{WS}                            { ; }
"\n"                            { Cminus_lineno++;}
.                               {
                                    fprintf(stderr, "Scanner: lexical error '%s'.\n", Cminus_text);
                                }
%%
