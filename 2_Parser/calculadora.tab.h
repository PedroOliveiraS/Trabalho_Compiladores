/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_CALCULADORA_TAB_H_INCLUDED
# define YY_YY_CALCULADORA_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    ID = 258,
    NUM_INT = 259,
    VERDADEIRO = 260,
    FALSO = 261,
    NUM_DOUBLE = 262,
    PI = 263,
    STRING = 264,
    ALGORITMO = 265,
    INICIO = 266,
    VAR = 267,
    FIMALGORITMO = 268,
    INT = 269,
    REAL = 270,
    CARACTERE = 271,
    LOGICO = 272,
    PTPT = 273,
    EOL = 274,
    PASSO = 275,
    ADD = 276,
    SUB = 277,
    MUL = 278,
    DIV = 279,
    DIVINT = 280,
    MOD = 281,
    EXP = 282,
    ATRIBUICAO = 283,
    IGUAL = 284,
    MENOR = 285,
    MAIOR = 286,
    MENORIG = 287,
    MAIORIG = 288,
    DIF = 289,
    NAO = 290,
    OU = 291,
    E = 292,
    XOU = 293,
    SE = 294,
    ENTAO = 295,
    SENAO = 296,
    FIMSE = 297,
    ESCOLHA = 298,
    CASO = 299,
    OUTROCASO = 300,
    FIMESCOLHA = 301,
    FUNC = 302,
    FIMFUNC = 303,
    PROC = 304,
    FIMPROC = 305,
    RETORNE = 306,
    PARENESQ = 307,
    PARENDIR = 308,
    VIRGULA = 309,
    VETOR = 310,
    COCHETEESQ = 311,
    COCHETEDIR = 312,
    DOISPT = 313,
    PARA = 314,
    DE = 315,
    ATE = 316,
    FACA = 317,
    FIMPARA = 318,
    ENQUANTO = 319,
    FIMENQUANTO = 320,
    REPITA = 321,
    FIMREPITA = 322,
    INTERROMPA = 323,
    ALEATORIO = 324,
    LEIA = 325,
    ESCREVA = 326,
    MAIUSCULO = 327,
    MINUSCULO = 328,
    NUMPCARAC = 329,
    FIM = 330
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 11 "calculadora.y"

	int Valor_Inteiro;
	double Valor_Double;
	char *Valor_String;
	char Nome[1024];

#line 140 "calculadora.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_CALCULADORA_TAB_H_INCLUDED  */
