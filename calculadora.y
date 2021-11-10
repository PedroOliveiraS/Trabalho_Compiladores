/* area de definicoes */
%{
	#include <stdio.h>
	#include <stdlib.h>

  #include "calculadora.h"
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
%token ENQUANTO FIMENQUANTO PARA FIMPARA REPITA FIMREPITA FACA CASO PASSO ATE DE// comando de repeticao
%token FIMALGORITMO ALGORITMO VAR INICIO// comandos principais
%token FUNCAO FIMFUNCAO PROCEDIMENTO FIMPROCEDIMENTO// declaração de funcoes definidas pelo usuario
%token INTEIRO REAL CARACTERE VETOR LOGICO//TIpos de variaveis
%token ALEATORIO COPIA CRONOMETRO ARQUIVO DEBUG TIMER ASC LEIA COMPR MUDACOR MOD MINUSC MAIUSC POS LIMPATELA ECO PAUSA//FUncoes Internas

%token UMINUS       // '-'
%token <fn> CMP     // comparações ( ==, >, >=, <, <=, ...)

// %token OP CP     // '(' ')'
%token FIM       // sair da calculadora

/* associatividade de operadores */
%nonassoc CMP
%right '='
%left '+' '-' 
%left '*' '/' 
%nonassoc '|' UMINUS 

%type <a> expr stmt list explist
%type <sl> symlist

%start inputLine

%%

/* area regras gramaticais */

Inicializacao : 
    |ALGORITMO NAMES DEF_GLOBAL INICIO tudo FIMALGORITMO
     ;

DEF_GLOBAL :
     |DEF_VARGLOBAIS 
     |DEF_VARGLOBAIS DEF_FUNC
     |DEF_VARGLOBAIS DEF_FUNC DEF_PROCED
     ;

DEF_VARGLOBAIS :
     |NAMES
     |VAR NAMES : TYPOS_VAR 
     |NAMES : TYPOS_VAR
     |NAMES , DEF_VARGLOBAIS : TYPOS_VAR 
     |NAMES : VETOR '['VALORES '..'VALORES']' DE TYPOS_VAR 
     |NAMES : VETOR '['VALORES '..'VALORES ',' VALORES '..'VALORES ']' DE TYPOS_VAR 
     ;

DEF_PROCED  : 
     |FUNCAO VALORES '('PARAMETROS')' DEF_GLOBAL INICIO tudo FIMPROCEDIMENTO
     ;

DEF_FUNC :
     |PROCEDIMENTO VALORES '('PARAMETROS')' DEF_GLOBAL INICIO tudo RETORNE VALORESE FIMPROCEDIMENTO
     ;

VALORES : 
     |VALOR
     |VERDADEIRO
     |FALSO
     |NOME
     ;

TYPOS_VAR :
     |INTEIRO
     |CARACTERE
     |LOGICO
     |REAL
     ;


PARAMETROS :
     | DEF_VARGLOBAIS
     | DEF_VARGLOBAIS ; PARAMETROS
     ;


DESVIO_CONDICIONAL :
     |SE COMPARACAO ENTÃO RETORNE NAME FIMSE
     |SE COMPARACAO ENTÃO RETORNE NAME SENAO DESVIO_CONDICIONAL FIMSE
     |SE COMPARACAO ENTÃO tudo FIMSE
     ;

ESCOLHA_EXP :
     |ESCOLHA VALOR CASO VALOR tudo ESCOLHA_EXP OUTROCASO tudo FIMESCOLHA
     |CASO VALOR tudo
     ;


COMPARACAO :
     |NAME OPERADORES_LOGICOS NAME COMPARACAO
     |NUM OPERADORES_LOGICOS NUM COMPARACAO
     |COMPARACAO OPERADORES_LOGICOS COMPARACAO
     ;

LOOP :
     |PARA VALORES DE VALORES ATE VALORES PASSO VALORES FACA tudo FIMPARA
     |ENQUANTO COMPARACAO FACA tudo FIMENQUANTO
     |REPITA tudo ATE COMPARACAO 
     ;


OPERADORES_LOGICOS :
     |'<'
     |'>'
     |'='
     |'<>'
     |'<='
     |'>='
     |'NAO'
     |'OU'
     |'E'
     |'XOU'
     ;

ATRIBUICAO :
     |VALORES '<-' VALORES
     |VALORES '<-' ATRIBUICAO 
     |VALORES '<-' ATRIBUICAO '+' ATRIBUICAO     
     |VALORES '<-' ATRIBUICAO '-' ATRIBUICAO      
     |VALORES '<-' ATRIBUICAO '*' ATRIBUICAO         
     |VALORES '<-' ATRIBUICAO '/' ATRIBUICAO         
     | '(' ATRIBUICAO ')' 
     | VALOR                  
     | NOME          
     ;




%%

/* area de funcoes auxiliares */

int main() {
  printf("> ");
  int r = yyparse();
  printf("Calculadora finalizada com sucesso!\n");
	return r;
}


