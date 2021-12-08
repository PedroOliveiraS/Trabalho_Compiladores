
%{
	#include <stdio.h>
	#include <stdlib.h>
	// #include <math.h>

	#include "calculadora.h"
	#include "calculadora.tab.h"
	int aux = 1;
%}


EXP	([Ee][-+]?[0-9]+)
SAIDAS "sair"|"exit"|"halt"|"quit"|"fim"
LETRAS__					[a-zA-Z]
NUM__						[0-9]
IDENTIFICADOR						{LETRAS__}+{LETRAS__|NUM__}*

%%

{SAIDAS} { return 0; }

"+" 								{ return ADD; }
"-" 								{ return SUB; }
"*" 								{ return MUL; }
"/" 								{ return DIV; }
"\\"								{ return DIVINT; }
"%" 								{ return MOD; }
"^" 								{ return EXP; }
"<-"								{ return ATRIBUICAO; }
"("									{ return PARENTESES_ESQ; }
")"									{ return PARENTESES_DIR; }
","									{ return VIRGULA; }
"["									{ return COCHETES_ESQ; }
"]"									{ return COCHETES_DIR; }
":"									{ return DOIS_PONTO; }
".."								{ return PONTO_PONTO; }
"=" 								{ return IGUAL; }
"<" 								{ return MENOR; }
">" 								{ return MAIOR; }
"<=" 								{ return MENOR_IGUAL; }
">=" 								{ return MAIOR_IGUAL; }
"<>" 								{ return DIFERENTE; }

"algoritmo"							{ return ALGORITMO; }
"inicio"							{ return INICIO; }
"var"								{ return VAR; }
"fimalgoritmo"						{ return FIMALGORITMO; }
"inteiro"							{ return INT; }
"real"								{ return REAL; }
"caractere" 						{ return CARACTERE; }
"logico"    						{ return LOGICO; }
"nao" 								{ return NAO; }
"ou" 								{ return OU; }
"e" 								{ return E; }
"xou" 								{ return XOU; }
"se"								{ return SE; }
"entao"								{ return ENTAO; }
"senao"								{ return SENAO; }
"fimse"								{ return FIMSE; }
"escolha"							{ return ESCOLHA; }
"caso"								{ return CASO; }
"outrocaso"							{ return OUTROCASO; }
"fimescolha"						{ return FIMESCOLHA; }
"funcao"							{ return FUNC; }
"fimfuncao"							{ return FIMFUNC; }
"procedimento"						{ return PROC; }
"fimprocedimento" 					{ return FIMPROC; }
"retorne"							{ return RETORNE; }
"vetor"								{ return VETOR; }
"para"								{ return PARA; }
"de"								{ return DE; }
"ate"								{ return ATE; }
"passo"								{ return PASSO; }
"faca"								{ return FACA; }
"fimpara"							{ return FIMPARA; }
"enquanto"							{ return ENQUANTO; }
"fimenquanto"						{ return FIMENQUANTO; }
"repita"							{ return REPITA; }
"fimrepita"							{ return FIMREPITA; }
"interrompa"						{ return INTERROMPA; }
"aleatorio"							{ return ALEATORIO; }	
"leia"       		    			{ return LEIA; }			
"escreva"							{ return ESCREVA; }				
"verdadeiro"						{ return VERDADEIRO;}
"falso"								{ return FALSO; }

[0-9]+ 								{yylval.Valor_Inteiro = atoi(yytext);return NUM_INT;}

[0-9]+"."[0-9]+{EXP}? 				{yylval.Valor_Double = atof(yytext); return NUM_DOUBLE;}

[a-zA-Z0-9]+ 						{strcpy(yylval.Nome, yytext) ;return ID;}

\".*\"								{ yylval.Valor_String = yytext;return STRING; }

\n+									{ aux += strlen(yytext); return EOL; }

[ \t\r\f]+							{ }

.      								{ char buffer[1024];sprintf(buffer, "Caracter invalido: %c\n", *yytext);yyerror(buffer);}

\\\n  								{ printf("c> "); } 

%%

