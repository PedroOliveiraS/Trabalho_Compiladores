/* area de definicoes */
%{
	#include <stdio.h>
	#include <stdlib.h>
     #include "calculadora.h"
     extern FILE* yyin;
     extern int yylex();
%}

%union {
    struct ast * a;
    double d;             // valor numérico do lexema
    struct symbol * s;    // qual símbolo
    struct symlist * sl;
    int fn;               // qual função pre-definida
}

/* definindo os tokens 
   NUM numeros inteiros e/ou reais 
   ADD adicao
   SUB subtracao
   MUL multiplicacao
   DIV divisao
   EOL final de linha
   OP  abertura de parentesis
   CP  fechamento de parentesis
   INV operador de inversao ( ~ )
*/
%token <d> NUM      // constantes numericas 
%token <s> NAME     // variaveis
%token <fn> FUNC    // funções pré-definidas
%token EOL          // fim de linha (enter)


%token SE FIMSE OU E SENAO ESCOLHA FIMESCOLHA INTERROMPA OUTROCASO CASO RETORNE NAO FALSO XOU ENTAO VERDADEIRO// comandos de desvio condicional
%token ENQUANTO FIMENQUANTO PARA FIMPARA REPITA FIMREPITA FACA PASSO ATE DE// comando de repeticao
%token FIMALGORITMO ALGORITMO VAR INICIO// comandos principais
%token FUNCAO FIMFUNCAO PROCEDIMENTO FIMPROCEDIMENTO// declaração de funcoes definidas pelo usuario
%token INTEIRO REAL CARACTERE VETOR LOGICO//TIpos de variaveis
%token ALEATORIO COPIA CRONOMETRO ARQUIVO DEBUG TIMER ASC LEIA COMPR MUDACOR MOD MINUSC MAIUSC POS LIMPATELA ECO PAUSA//FUncoes Internas


%token <fn> CMP     // comparações ( ==, >, >=, <, <=, ...)

// %token OP CP     // '(' ')'
%token FIM       // sair da calculadora


%start inputLine

%%

/* area regras gramaticais */

inputLine : 
     | ALGORITMO FIMALGORITMO {printf("Fuck");}
     
     ;


%%

/* area de funcoes auxiliares */

int main( int argc, char *argv[]) {
  printf("> ");
  FILE *arg = fopen(argv[1], "r");
  yyin = arg;
  int r = yyparse();
  printf("Calculadora finalizada com sucesso!\n");
  return r;
}


