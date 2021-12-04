
%option noyywrap nodefault yylineno

%{
	#include <stdio.h>
	#include <stdlib.h>
	// #include <math.h>

	#include "calculadora.h"
	#include "calculadora.tab.h"
%}

 /* float exponent */
EXP	([Ee][-+]?[0-9]+)

SAIDAS "sair"|"exit"|"halt"|"quit"|"fim"

%%

{SAIDAS} { } // return 0; }

 /* comparison ops, all are a CMP token */ 
">"     { printf("Simbolo Especial -> %s \n", yytext);yylval.fn = 1; } // return CMP; }
"<"     { printf("Simbolo Especial -> %s \n", yytext);yylval.fn = 2; } // return CMP; }
"<>"    { printf("Simbolo Especial -> %s \n", yytext);yylval.fn = 3; } // return CMP; }
"=="    { printf("Simbolo Especial -> %s \n", yytext);yylval.fn = 4; } // return CMP; }
">="    { printf("Simbolo Especial -> %s \n", yytext);yylval.fn = 5; } // return CMP; }
"<="    { printf("Simbolo Especial -> %s \n", yytext);yylval.fn = 6; } // return CMP; }

"+"    { printf("Simbolo Especial -> %s \n", yytext);yylval.fn = 6; } // return CMP; }
"-"    { printf("Simbolo Especial -> %s \n", yytext);yylval.fn = 6; } // return CMP; }
"/"    { printf("Simbolo Especial -> %s \n", yytext);yylval.fn = 6; } // return CMP; }
"*"    { printf("Simbolo Especial -> %s \n", yytext);yylval.fn = 6; } // return CMP; }

 /* keywords */

"aleatorio"    				{ printf("Palavra Reservada -> %s \n", yytext); } // } // return ALEATORIO; } 
"fimalgoritmo"  			{ printf("Palavra Reservada -> %s \n", yytext); } // return FIMALGORITMO;  }
"algoritmo"  				{ printf("\n\n\nPalavra Reservada -> %s \n", yytext); } // return ALGORITMO; }
"se"    					{ printf("Palavra Reservada -> %s \n", yytext); } // return SE; }
"fimenquanto"    			{ printf("Palavra Reservada -> %s \n", yytext); } // return FIMENQUANTO;}
"inteiro"    				{ printf("Tipo de Variavel -> %s \n", yytext); } // return INTEIRO; }
"ou"    					{ printf("Palavra Reservada -> %s \n", yytext); } // return OU;  }
"senao"    					{ printf("Palavra Reservada -> %s \n", yytext); } // return SENAO; }
"fimescolha"    			{ printf("Palavra Reservada -> %s \n", yytext); } // return FIMESCOLHA;  }
"interrompa" 				{ printf("Palavra Reservada -> %s \n", yytext); } // return INTERROMPA;}
"outrocaso"    				{ printf("Palavra Reservada -> %s \n", yytext); } // return OUTROCASO; }
"timer"    					{ printf("Palavra Reservada -> %s \n", yytext); } // return TIMER;   }
"asc"    					{ printf("Palavra Reservada -> %s \n", yytext); } // return ASC	; }
"e"    						{ printf("Palavra Reservada -> %s \n", yytext); } // return E;  }
"fimfuncao"    				{ printf("Palavra Reservada -> %s \n", yytext); } // return FIMFUNCAO;  }
"leia"    					{ printf("Palavra Reservada -> %s \n", yytext); } // return LEIA;   }
"para"    					{ printf("Palavra Reservada -> %s \n", yytext); } // return PARA;  }
"var"    					{ printf("Palavra Reservada -> %s \n", yytext); } // return VAR;  }
"retorne"    				{ printf("Palavra Reservada -> %s \n", yytext); } // return RETORNE; }
"nao"   					{ printf("Palavra Reservada -> %s \n", yytext); } // return NAO; }
"inicio"    				{ printf("Palavra Reservada -> %s \n", yytext); } // return INICIO; }
"falso"    					{ printf("Palavra Reservada -> %s \n", yytext); } // return FALSO;    } 
"compr"    					{ printf("Palavra Reservada -> %s \n", yytext); } // return COMPR;  }
"repita"    				{ printf("Palavra Reservada -> %s \n", yytext); } // return REPITA;  }
"mudacor"    				{ printf("Palavra Reservada -> %s \n", yytext); } // return MUDACOR;  }
"funcao"    				{ printf("Palavra Reservada -> %s \n", yytext); } // return FUNCAO;  }
"faca"    					{ printf("Palavra Reservada -> %s \n", yytext); } // return FACA;  }
"caso"    					{ printf("Palavra Reservada -> %s \n", yytext); } // return CASO;  }
"procedimento"    			{ printf("Palavra Reservada -> %s \n", yytext); } // return PROCEDIMENTO; }
"mod"    					{ printf("Palavra Reservada -> %s \n", yytext); } // return MOD; }
"fimse"    					{ printf("Palavra Reservada -> %s \n", yytext); } // return FIMSE;   }
"real"    					{ printf("Tipo de Variavel -> %s \n", yytext); } // return REAL; }
"minusc"    				{ printf("Palavra Reservada -> %s \n", yytext); } // return MINUSC;  }
"fimrepita"    				{ printf("Palavra Reservada -> %s \n", yytext); } // return FIMREPITA; }
"escolha"    				{ printf("Palavra Reservada -> %s \n", yytext); } // return ESCOLHA; }
"caractere"    				{ printf("Tipo de Variavel -> %s \n", yytext); } // return CARACTERE;  }
"xou"    					{ printf("Palavra Reservada -> %s \n", yytext); } // return XOU; }
"pos"    					{ printf("Palavra Reservada -> %s \n", yytext); } // return POS;  }
"maiusc"    				{ printf("Palavra Reservada -> %s \n", yytext); } // return MAIUSC;  }
"fimprocedimento"    		{ printf("Palavra Reservada -> %s \n", yytext); } // return FIMPROCEDIMENTO;  }
"entao"    					{ printf("Palavra Reservada -> %s \n", yytext); } // return ENTAO;   }
"enquanto"    				{ printf("Palavra Reservada -> %s \n", yytext); } // return ENQUANTO; }
"vetor"    					{ printf("Palavra Reservada -> %s \n", yytext); } // return VETOR;  }
"passo"    					{ printf("Palavra Reservada -> %s \n", yytext); } // return PASSO;  }
"limpatela"    				{ printf("Palavra Reservada -> %s \n", yytext); } // return LIMPATELA; } 
"eco"    					{ printf("Palavra Reservada -> %s \n", yytext); } // return ECO;   }
"ate"    					{ printf("Palavra Reservada -> %s \n", yytext); } // return ATE;   }
"de"    					{ printf("Palavra Reservada -> %s \n", yytext); } // return DE;   }
"fimpara"    				{ printf("Palavra Reservada -> %s \n", yytext); } // return FIMPARA;}
"logico" 					{ printf("Tipo de Variavel -> %s \n", yytext); } // return LOGICO; }
"pausa" 					{ printf("Palavra Reservada -> %s \n", yytext); } // return PAUSA; }
"verdadeiro" 				{ printf("Palavra Reservada -> %s \n", yytext); } // return VERDADEIRO; }
"escreva" 					{ printf("Palavra Reservada -> %s \n", yytext); } // return VERDADEIRO; }


","							{printf("Caracter Especial -> %s \n", yytext);}
":"							{printf("Caracter Especial -> %s \n", yytext);}
"'"							{printf("Caracter Especial -> %s \n", yytext);}
";" 						{printf("Caracter Especial -> %s \n", yytext);}
"(" 						{printf("Caracter Especial -> %s \n", yytext);}
")" 						{printf("Caracter Especial -> %s \n", yytext);}
"!" 						{printf("Caracter Especial -> %s \n", yytext);}
\"	 						{printf("Caracter Especial -> %s \n", yytext);}


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

\".*\"  { yylval.s = lookup(yytext); printf("String -> %s \n", yytext) ;} // return NAME; }

[a-zA-Z][a-zA-Z0-9]*[ ]<- { yylval.s = lookup(yytext); printf("Atribuição -> %s \n", yytext) ;} // return NAME; }

[a-zA-Z][a-zA-Z0-9]*[ ]: { yylval.s = lookup(yytext); printf("Declaração -> %s \n", yytext) ;} // return NAME; }

[a-zA-Z][a-zA-Z0-9]* { yylval.s = lookup(yytext); printf("Literal -> %s \n", yytext) ;} // return NAME; }


[0-9]+"."[0-9]*{EXP}? |
"."?[0-9]+{EXP}?     { yylval.d = atof(yytext); } // return NUM; }

\n     { } // return EOL; }

"/\*"	|
"//".* 	|
"\*/"	|
"{"		|
"}"		|
[ \t]+ { /* ignora espacos em branco*/ }

\\\n   { printf("c> "); } /* ignore line continuation */ 

.      { yyerror("Caracter invalido: %c\n", *yytext); }

%%

