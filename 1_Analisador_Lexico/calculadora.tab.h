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
    NUM = 258,
    NAME = 259,
    FUNC = 260,
    EOL = 261,
    SE = 262,
    FIMSE = 263,
    OU = 264,
    E = 265,
    SENAO = 266,
    ESCOLHA = 267,
    FIMESCOLHA = 268,
    INTERROMPA = 269,
    OUTROCASO = 270,
    CASO = 271,
    RETORNE = 272,
    NAO = 273,
    FALSO = 274,
    XOU = 275,
    ENTAO = 276,
    VERDADEIRO = 277,
    ENQUANTO = 278,
    FIMENQUANTO = 279,
    PARA = 280,
    FIMPARA = 281,
    REPITA = 282,
    FIMREPITA = 283,
    FACA = 284,
    PASSO = 285,
    ATE = 286,
    DE = 287,
    FIMALGORITMO = 288,
    ALGORITMO = 289,
    VAR = 290,
    INICIO = 291,
    FUNCAO = 292,
    FIMFUNCAO = 293,
    PROCEDIMENTO = 294,
    FIMPROCEDIMENTO = 295,
    INTEIRO = 296,
    REAL = 297,
    CARACTERE = 298,
    VETOR = 299,
    LOGICO = 300,
    ALEATORIO = 301,
    COPIA = 302,
    CRONOMETRO = 303,
    ARQUIVO = 304,
    DEBUG = 305,
    TIMER = 306,
    ASC = 307,
    LEIA = 308,
    COMPR = 309,
    MUDACOR = 310,
    MOD = 311,
    MINUSC = 312,
    MAIUSC = 313,
    POS = 314,
    LIMPATELA = 315,
    ECO = 316,
    PAUSA = 317,
    CMP = 318,
    FIM = 319
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 10 "calculadora.y"

    struct ast * a;
    double d;             // valor numérico do lexema
    struct symbol * s;    // qual símbolo
    struct symlist * sl;
    int fn;               // qual função pre-definida

#line 130 "calculadora.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_CALCULADORA_TAB_H_INCLUDED  */
