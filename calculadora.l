
%option noyywrap nodefault yylineno

%{
	// #include <stdio.h>
	// #include <stdlib.h>
	// #include <math.h>

	#include "calculadora.h"
	#include "calculadora.tab.h"
%}

 /* float exponent */
EXP	([Ee][-+]?[0-9]+)

SAIDAS "sair"|"exit"|"halt"|"quit"|"fim"

%%

{SAIDAS} { return FIM; }

 /* single character ops */
"+" |
"-" |
"*" |
"/" |
"=" |
"|" |
"," |
";" |
"(" |
")" { return yytext[0]; }

 /* comparison ops, all are a CMP token */ 
">"     { yylval.fn = 1; return CMP; }
"<"     { yylval.fn = 2; return CMP; }
"<>"    { yylval.fn = 3; return CMP; }
"=="    { yylval.fn = 4; return CMP; }
">="    { yylval.fn = 5; return CMP; }
"<="    { yylval.fn = 6; return CMP; }

 /* keywords */
"aleatorio"    { return ALEATORIO;    } 
"copia"  { return COPIA;  } 
"fimalgoritmo"  { return FIMALGORITMO;    } 
"algoritmo"  { return ALGORITMO;    } 
"int"    { return INT;    } 
"se"    { return SE;    } 
"cronometro"    { return CRONOMETRO;    } 
"fimenquanto"    { return FIMENQUANTO;    } 
"inteiro"    { return INTEIRO;    } 
"ou"    { return OU;    } 
"senao"    { return SENAO;    } 
"arquivo"    { return ARQUIVO;    } 
"debug"    { return DEBUG;    } 
"fimescolha"    { return FIMESCOLHA;    } 
"interrompa" { return INTERROMPA; }
"outrocaso"    { return OUTROCASO;    }
"timer"    { return TIMER;    } 
"asc	"    { return ASC	;    } 
"e"    { return E;    } 
"fimfuncao"    { return FIMFUNCAO;    } 
"leia"    { return LEIA;    } 
"para"    { return PARA;    } 
"var"    { return VAR;    } 
"retorne"    { return RETORNE;    } 
"nao"    { return NAO;    } 
"inicio"    { return INICIO;    } 
"falso"    { return FALSO;    } 
"compr"    { return COMPR;    } 
"repita"    { return REPITA;    } 
"mudacor"    { return MUDACOR;    } 
"funcao"    { return FUNCAO;    } 
"faca"    { return FACA;    } 
"caso"    { return CASO;    } 
"procedimento"    { return PROCEDIMENTO;    } 
"mod"    { return MOD;    } 
"fimse"    { return FIMSE;    } 
"Caracter"    { return CARACTER;    } 
"real"    { return REAL;    } 
"minusc"    { return MINUSC;    } 
"fimrepita"    { return FIMREPITA;    } 
"escolha"    { return ESCOLHA;    } 
"caractere"    { return CARACTERE;    } 
"xou"    { return XOU;    } 
"pos"    { return POS;    } 
"maiusc"    { return MAIUSC;    } 
"fimprocedimento"    { return FIMPROCEDIMENTO;    } 
"entao"    { return ENTAO;    } 
"carac"    { return CARAC;    } 
"enquanto"    { return ENQUANTO;    } 
"vetor"    { return VETOR;    } 
"passo"    { return PASSO;    } 
"limpatela"    { return LIMPATELA;    } 
"FIMFUNCAO"    { return FIMFUNCAO;    } 
"eco"    { return ECO;    } 
"ate"    { return ATE;    } 
"ate"    { return ATE;    } 
"de"    { return DE;    } 
"fimpara"    { return FIMPARA;    }
"logico" {return LOGICO;}
"pausa" {return PAUSA;}
"verdadeiro" {return VERDADEIRO;}

 /* built-in functions */
"sqrt"  { yylval.fn = B_sqrt;  return FUNC; } 
"exp"   { yylval.fn = B_exp;   return FUNC; } 
"log"   { yylval.fn = B_log;   return FUNC; } 
"print" { yylval.fn = B_print; return FUNC; }

 /* debug hack */
"debug"[0-9]+ { debug = atoi(&yytext[5]); 
	            if ( debug == 0 ) 
	            	printf("debug disabled\n");
	            else 
	            	printf("debug set to %d\n", debug);
	        }

"show" { 
		    printf("[DEBUG] NHASH = %d\n", NHASH);
		    int i = 0;
		    for (i = 0; i < NHASH; i++) {
		    	if ( symtab[i].name != NULL ) {
		    		printf("symtab[%4d] = (%s, %lf, %d, %s)\n", 
		    			i, 
		    			symtab[i].name, 
		    			symtab[i].value, 
		    			(symtab[i].func != NULL ? symtab[i].func->nodetype : 0), 
		    			(symtab[i].syms != NULL ? getsymbols( symtab[i].syms ) : "[]" )
		    			);
		    	} 
		    	// printf("symtab[%4d] = ...\n", i);
		    }
		    printf("===============\n");
		}

 /* names */
[a-zA-Z][a-zA-Z0-9]* { yylval.s = lookup(yytext); return NAME; }

[0-9]+"."[0-9]*{EXP}? |
"."?[0-9]+{EXP}?     { yylval.d = atof(yytext); return NUM; }

\n     { return EOL; }

"//".* |
[ \t]+ { /* ignora espacos em branco*/ }

\\\n   { printf("c> "); } /* ignore line continuation */ 

.      { yyerror("Caracter invalido: %c\n", *yytext); }

%%

