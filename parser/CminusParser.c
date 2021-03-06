/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison implementation for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "3.0.4"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1


/* Substitute the variable and function names.  */
#define yyparse         Cminus_parse
#define yylex           Cminus_lex
#define yyerror         Cminus_error
#define yydebug         Cminus_debug
#define yynerrs         Cminus_nerrs

#define yylval          Cminus_lval
#define yychar          Cminus_char

/* Copy the first part of user declarations.  */
#line 13 "CminusParser.y" /* yacc.c:339  */

#include <stdio.h>
#include <stdlib.h>
#include <strings.h>
#include <string.h>
#include <sys/types.h>

#include <util/general.h>
#include <util/symtab.h>
#include <util/symtab_stack.h>
#include <util/dlink.h>
#include <util/string_utils.h>
#include <util/ptr_convert.h>

#include "mips_mgmt.h"
#include "type_system.h"

#define SYMTABLE_SIZE 100
#define SYMTAB_VALUE_FIELD "value"
#define SYMTAB_VARIABLE_FIELD "variable"

/*********************EXTERNAL DECLARATIONS*********************/
EXTERN(void, Cminus_error, (const char *));
EXTERN(void, Cminus_general_error, (const char *));
EXTERN(void, Cminus_compiler_error, (const char *));
EXTERN(int, Cminus_lex, (void));

/*********************GLOBAL DECLARATIONS***********************/
int get_int_field(SymTable symtab, int index, char * field);
void set_int_field(SymTable symtab, int index, char * field, int value);
void * get_ptr_field(SymTable symtab, int index, char * field);
void set_ptr_field(SymTable symtab, int index, char * field, void * value);

/*********************STATIC DECLARATIONS***********************/
STATIC(void, print_usage, (void));
STATIC(SymTable, variables_scope, (SymtabStack scope_stack, char * var));
STATIC(bool, is_global_variable, (SymtabStack, char *));
STATIC(bool, is_name_defined, (const SymTable, char *));
STATIC(void, declare_scope, (SymtabStack));
STATIC(void, destroy_scope, (SymtabStack));
STATIC(int, get_name_index, (SymTable, char *));
STATIC(int, set_name, (SymTable, char *));
STATIC(bool, is_main, (const char *));
STATIC(bool, is_scope_global, (SymtabStack));

// Holds all defined function names.
SymTable function_data;

// Holds all defined string labels.
SymTable string_list;

// Holds variable information for the global scope and local function scope.
static SymtabStack scope_stack;

// Stacks to track nested while loops/ifs.
static DLinkList while_stack;
static DLinkList if_stack;

static cminus_type_t identifier_type = INVALID_TYPE;

static char * filename = NULL;

// The function currently being compiled.
static char * curr_function = NULL;

// Indicates whether the function being compiled has a return statement.
static bool has_ret_stmt = false;

// Defines an offset from the fp for local variables in functions.
extern int g_FP_NEXT_OFFSET;

extern int Cminus_lineno;

extern FILE * Cminus_in;

#line 150 "CminusParser.c" /* yacc.c:339  */

# ifndef YY_NULLPTR
#  if defined __cplusplus && 201103L <= __cplusplus
#   define YY_NULLPTR nullptr
#  else
#   define YY_NULLPTR 0
#  endif
# endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* In a future release of Bison, this section will be replaced
   by #include "CminusParser.h".  */
#ifndef YY_CMINUS_CMINUSPARSER_H_INCLUDED
# define YY_CMINUS_CMINUSPARSER_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int Cminus_debug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    AND = 258,
    ELSE = 259,
    EXIT = 260,
    FOR = 261,
    IF = 262,
    INTEGER = 263,
    FLOAT = 264,
    NOT = 265,
    OR = 266,
    READ = 267,
    WHILE = 268,
    WRITE = 269,
    LBRACE = 270,
    RBRACE = 271,
    LE = 272,
    LT = 273,
    GE = 274,
    GT = 275,
    EQ = 276,
    NE = 277,
    ASSIGN = 278,
    COMMA = 279,
    SEMICOLON = 280,
    LBRACKET = 281,
    RBRACKET = 282,
    LPAREN = 283,
    RPAREN = 284,
    PLUS = 285,
    TIMES = 286,
    IDENTIFIER = 287,
    DIVIDE = 288,
    RETURN = 289,
    STRING = 290,
    INTCON = 291,
    FLOATCON = 292,
    MINUS = 293,
    DIVDE = 294
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 94 "CminusParser.y" /* yacc.c:355  */

	int ival;
	float fval;
	unsigned long ulval;
	char * sval;

#line 237 "CminusParser.c" /* yacc.c:355  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE Cminus_lval;

int Cminus_parse (void);

#endif /* !YY_CMINUS_CMINUSPARSER_H_INCLUDED  */

/* Copy the second part of user declarations.  */

#line 254 "CminusParser.c" /* yacc.c:358  */

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif

#ifndef YY_ATTRIBUTE
# if (defined __GNUC__                                               \
      && (2 < __GNUC__ || (__GNUC__ == 2 && 96 <= __GNUC_MINOR__)))  \
     || defined __SUNPRO_C && 0x5110 <= __SUNPRO_C
#  define YY_ATTRIBUTE(Spec) __attribute__(Spec)
# else
#  define YY_ATTRIBUTE(Spec) /* empty */
# endif
#endif

#ifndef YY_ATTRIBUTE_PURE
# define YY_ATTRIBUTE_PURE   YY_ATTRIBUTE ((__pure__))
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# define YY_ATTRIBUTE_UNUSED YY_ATTRIBUTE ((__unused__))
#endif

#if !defined _Noreturn \
     && (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112)
# if defined _MSC_VER && 1200 <= _MSC_VER
#  define _Noreturn __declspec (noreturn)
# else
#  define _Noreturn YY_ATTRIBUTE ((__noreturn__))
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(E) ((void) (E))
#else
# define YYUSE(E) /* empty */
#endif

#if defined __GNUC__ && 407 <= __GNUC__ * 100 + __GNUC_MINOR__
/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN \
    _Pragma ("GCC diagnostic push") \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")\
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# define YY_IGNORE_MAYBE_UNINITIALIZED_END \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif


#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYSIZE_T yynewbytes;                                            \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / sizeof (*yyptr);                          \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, (Count) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYSIZE_T yyi;                         \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  10
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   145

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  40
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  34
/* YYNRULES -- Number of rules.  */
#define YYNRULES  68
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  133

/* YYTRANSLATE[YYX] -- Symbol number corresponding to YYX as returned
   by yylex, with out-of-bounds checking.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   294

#define YYTRANSLATE(YYX)                                                \
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, without out-of-bounds checking.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39
};

#if YYDEBUG
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   151,   151,   158,   167,   171,   177,   183,   188,   194,
     224,   245,   249,   255,   259,   265,   314,   366,   370,   376,
     380,   384,   388,   392,   396,   400,   406,   415,   424,   437,
     443,   456,   464,   477,   490,   505,   517,   522,   528,   535,
     560,   566,   572,   576,   582,   586,   592,   598,   605,   609,
     615,   621,   627,   633,   639,   647,   651,   657,   665,   669,
     675,   683,   689,   696,   722,   728,   764,   814,   820
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || 0
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "AND", "ELSE", "EXIT", "FOR", "IF",
  "INTEGER", "FLOAT", "NOT", "OR", "READ", "WHILE", "WRITE", "LBRACE",
  "RBRACE", "LE", "LT", "GE", "GT", "EQ", "NE", "ASSIGN", "COMMA",
  "SEMICOLON", "LBRACKET", "RBRACKET", "LPAREN", "RPAREN", "PLUS", "TIMES",
  "IDENTIFIER", "DIVIDE", "RETURN", "STRING", "INTCON", "FLOATCON",
  "MINUS", "DIVDE", "$accept", "Program", "Procedures", "ProcedureDecl",
  "ProcedureHead", "FunctionDecl", "ProcedureBody", "DeclList",
  "IdentifierList", "VarDecl", "Type", "Statement", "Assignment",
  "IfStatement", "TestAndThen", "Test", "IfToken", "ElseToken",
  "WhileStatement", "WhileExpr", "WhileToken", "IOStatement",
  "ReturnStatement", "ExitStatement", "CompoundStatement", "StatementList",
  "Expr", "SimpleExpr", "AddExpr", "MulExpr", "Factor", "Variable",
  "StringConstant", "Constant", YY_NULLPTR
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[NUM] -- (External) token number corresponding to the
   (internal) symbol number NUM (which must be that of a token).  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294
};
# endif

#define YYPACT_NINF -60

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-60)))

#define YYTABLE_NINF -1

#define yytable_value_is_error(Yytable_value) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int8 yypact[] =
{
      86,   -60,   -60,    14,   -60,    86,    50,    86,    86,   -13,
     -60,   -60,    -9,    23,   -60,    41,   -60,    60,    50,    54,
      49,   -60,   -60,   -60,   -60,    88,   -60,    98,   -60,   -60,
     -60,   -60,    15,    55,    86,    95,   -60,   -13,    18,    87,
     -60,   100,   -60,    97,    51,    38,    49,    61,    49,    32,
     -60,     0,    84,    69,    40,   -60,   -60,   -60,    49,   126,
     116,    49,    50,   -60,   -60,    49,    95,   106,    90,    99,
     104,    95,   -60,   105,   -60,     5,   107,   -60,    64,    84,
       6,   108,    61,    61,   -60,    61,    61,    61,    61,    61,
      61,    61,    61,    61,    61,     7,   -60,   116,   -60,    63,
     -60,    65,   -60,   111,   124,   -60,   115,   117,   118,   -60,
     -60,   -60,    84,    84,    69,    69,    69,    69,    69,    69,
      40,    40,   -60,   -60,   -60,   -60,   -60,   -60,   -60,   -60,
     -60,   -60,   -60
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       0,    17,    18,     0,     2,     5,     0,     8,     0,     0,
       1,     4,     0,     0,    31,     0,    35,     0,     0,    65,
       0,     6,    42,    19,    20,     0,    21,     0,    22,    23,
      24,    25,     0,     0,     7,     0,     3,     0,    15,     0,
      13,     0,    40,     0,     0,     0,     0,     0,     0,    65,
      68,     0,    44,    48,    55,    58,    61,    62,     0,    28,
       0,     0,     0,    10,    43,     0,     0,    15,     0,     0,
       0,     0,    11,     0,    67,     0,     0,    41,     0,    47,
       0,     0,     0,     0,    39,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    32,     0,    29,     0,
      33,     0,    12,     0,     0,    14,     0,     0,     0,    66,
      64,    63,    46,    45,    51,    52,    53,    54,    49,    50,
      56,    57,    59,    60,    30,    27,    34,    26,    16,     9,
      36,    37,    38
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
     -60,   -60,    16,   -60,   -60,   -60,   -60,   134,   -24,    73,
      -1,   -30,   -60,   -60,   -60,   -60,   -60,   -60,   -60,   -60,
     -60,   -60,   -60,   -60,   -59,   127,    52,   -42,    33,    17,
      31,    -6,   -60,   -60
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int8 yydefgoto[] =
{
      -1,     3,     4,     5,     6,     7,    21,     8,    39,    40,
       9,    22,    23,    24,    59,    60,    25,    97,    26,    62,
      27,    28,    29,    30,    31,    32,    51,    52,    53,    54,
      55,    56,    76,    57
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_uint8 yytable[] =
{
      33,    98,    64,    82,    12,    79,    35,    37,    82,    82,
      82,    83,    33,    68,    10,    64,    83,    83,    83,    38,
      13,    11,    14,    41,    36,    84,    33,    15,    16,    17,
      18,    63,   100,    66,   107,   110,   124,    73,   125,    33,
     112,   113,    68,    13,    69,    14,    70,    19,    42,    20,
      15,    16,    17,    18,    77,    13,    33,    14,    46,    47,
      81,    47,    15,    16,    17,    18,    82,    82,    82,    43,
      19,    93,    20,    94,    83,    83,    83,    48,    65,    48,
      46,    49,    19,    49,    20,    50,    74,    50,    44,    48,
     127,   109,   126,    49,     1,     2,    75,    50,    78,    91,
      80,    85,    86,    87,    88,    89,    90,    92,   120,   121,
      95,    71,    72,    99,    71,   102,    58,   101,   114,   115,
     116,   117,   118,   119,   122,   123,    61,    67,    70,    19,
      96,    18,    69,   104,   106,   103,   108,   111,   128,   129,
     130,    34,   131,   132,   105,    45
};

static const yytype_uint8 yycheck[] =
{
       6,    60,    32,     3,     5,    47,     7,     8,     3,     3,
       3,    11,    18,    37,     0,    45,    11,    11,    11,    32,
       5,     5,     7,    32,     8,    25,    32,    12,    13,    14,
      15,    16,    62,    34,    29,    29,    29,    43,    97,    45,
      82,    83,    66,     5,    26,     7,    28,    32,    25,    34,
      12,    13,    14,    15,    16,     5,    62,     7,    26,    10,
      28,    10,    12,    13,    14,    15,     3,     3,     3,    28,
      32,    31,    34,    33,    11,    11,    11,    28,    23,    28,
      26,    32,    32,    32,    34,    36,    35,    36,    28,    28,
      25,    27,    29,    32,     8,     9,    44,    36,    46,    30,
      48,    17,    18,    19,    20,    21,    22,    38,    91,    92,
      58,    24,    25,    61,    24,    25,    28,    65,    85,    86,
      87,    88,    89,    90,    93,    94,    28,    32,    28,    32,
       4,    15,    26,    29,    29,    36,    29,    29,    27,    15,
      25,     7,    25,    25,    71,    18
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     8,     9,    41,    42,    43,    44,    45,    47,    50,
       0,    42,    50,     5,     7,    12,    13,    14,    15,    32,
      34,    46,    51,    52,    53,    56,    58,    60,    61,    62,
      63,    64,    65,    71,    47,    50,    42,    50,    32,    48,
      49,    32,    25,    28,    28,    65,    26,    10,    28,    32,
      36,    66,    67,    68,    69,    70,    71,    73,    28,    54,
      55,    28,    59,    16,    51,    23,    50,    32,    48,    26,
      28,    24,    25,    71,    35,    66,    72,    16,    66,    67,
      66,    28,     3,    11,    25,    17,    18,    19,    20,    21,
      22,    30,    38,    31,    33,    66,     4,    57,    64,    66,
      51,    66,    25,    36,    29,    49,    29,    29,    29,    27,
      29,    29,    67,    67,    68,    68,    68,    68,    68,    68,
      69,    69,    70,    70,    29,    64,    29,    25,    27,    15,
      25,    25,    25
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    40,    41,    41,    42,    42,    43,    44,    44,    45,
      46,    47,    47,    48,    48,    49,    49,    50,    50,    51,
      51,    51,    51,    51,    51,    51,    52,    53,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    61,    61,    62,
      63,    64,    65,    65,    66,    66,    66,    66,    67,    67,
      67,    67,    67,    67,    67,    68,    68,    68,    69,    69,
      69,    70,    70,    70,    70,    71,    71,    72,    73
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     2,     2,     1,     2,     2,     1,     5,
       2,     3,     4,     1,     3,     1,     4,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     4,     4,     2,     2,
       3,     1,     1,     3,     3,     1,     5,     5,     5,     3,
       2,     3,     1,     2,     1,     3,     3,     2,     1,     3,
       3,     3,     3,     3,     3,     1,     3,     3,     1,     3,
       3,     1,     1,     3,     3,     1,     4,     1,     1
};


#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)
#define YYEMPTY         (-2)
#define YYEOF           0

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                  \
do                                                              \
  if (yychar == YYEMPTY)                                        \
    {                                                           \
      yychar = (Token);                                         \
      yylval = (Value);                                         \
      YYPOPSTACK (yylen);                                       \
      yystate = *yyssp;                                         \
      goto yybackup;                                            \
    }                                                           \
  else                                                          \
    {                                                           \
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;                                                  \
    }                                                           \
while (0)

/* Error token number */
#define YYTERROR        1
#define YYERRCODE       256



/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)

/* This macro is provided for backward compatibility. */
#ifndef YY_LOCATION_PRINT
# define YY_LOCATION_PRINT(File, Loc) ((void) 0)
#endif


# define YY_SYMBOL_PRINT(Title, Type, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Type, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*----------------------------------------.
| Print this symbol's value on YYOUTPUT.  |
`----------------------------------------*/

static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  FILE *yyo = yyoutput;
  YYUSE (yyo);
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# endif
  YYUSE (yytype);
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyoutput, "%s %s (",
             yytype < YYNTOKENS ? "token" : "nterm", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yytype_int16 *yyssp, YYSTYPE *yyvsp, int yyrule)
{
  unsigned long int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       yystos[yyssp[yyi + 1 - yynrhs]],
                       &(yyvsp[(yyi + 1) - (yynrhs)])
                                              );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif


#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
static YYSIZE_T
yystrlen (const char *yystr)
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
static char *
yystpcpy (char *yydest, const char *yysrc)
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
        switch (*++yyp)
          {
          case '\'':
          case ',':
            goto do_not_strip_quotes;

          case '\\':
            if (*++yyp != '\\')
              goto do_not_strip_quotes;
            /* Fall through.  */
          default:
            if (yyres)
              yyres[yyn] = *yyp;
            yyn++;
            break;

          case '"':
            if (yyres)
              yyres[yyn] = '\0';
            return yyn;
          }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
                yytype_int16 *yyssp, int yytoken)
{
  YYSIZE_T yysize0 = yytnamerr (YY_NULLPTR, yytname[yytoken]);
  YYSIZE_T yysize = yysize0;
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULLPTR;
  /* Arguments of yyformat. */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Number of reported tokens (one for the "unexpected", one per
     "expected"). */
  int yycount = 0;

  /* There are many possibilities here to consider:
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[*yyssp];
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                {
                  YYSIZE_T yysize1 = yysize + yytnamerr (YY_NULLPTR, yytname[yyx]);
                  if (! (yysize <= yysize1
                         && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
                    return 2;
                  yysize = yysize1;
                }
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  {
    YYSIZE_T yysize1 = yysize + yystrlen (yyformat);
    if (! (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
      return 2;
    yysize = yysize1;
  }

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          yyp++;
          yyformat++;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
{
  YYUSE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YYUSE (yytype);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}




/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;


/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       'yyss': related to states.
       'yyvs': related to semantic values.

       Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken = 0;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yyssp = yyss = yyssa;
  yyvsp = yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */
  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        YYSTYPE *yyvs1 = yyvs;
        yytype_int16 *yyss1 = yyss;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * sizeof (*yyssp),
                    &yyvs1, yysize * sizeof (*yyvsp),
                    &yystacksize);

        yyss = yyss1;
        yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yytype_int16 *yyss1 = yyss;
        union yyalloc *yyptr =
          (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
        if (! yyptr)
          goto yyexhaustedlab;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
                  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:
#line 152 "CminusParser.y" /* yacc.c:1646  */
    {
			if (SymQueryIndex(function_data, "main") == SYM_INVALID_INDEX) {
				Cminus_general_error("No main function defined.");
				exit(-1);
			}
		}
#line 1433 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 3:
#line 159 "CminusParser.y" /* yacc.c:1646  */
    {
			if (SymQueryIndex(function_data, "main") == SYM_INVALID_INDEX) {
				Cminus_general_error("No main function defined.");
				exit(-1);
			}
		}
#line 1444 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 4:
#line 168 "CminusParser.y" /* yacc.c:1646  */
    {
			
		}
#line 1452 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 5:
#line 172 "CminusParser.y" /* yacc.c:1646  */
    {
			
		}
#line 1460 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 6:
#line 178 "CminusParser.y" /* yacc.c:1646  */
    {
			
		}
#line 1468 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 7:
#line 184 "CminusParser.y" /* yacc.c:1646  */
    {
			// Make space for local variables.
			ISSUE_ADDI(SP, SP, g_FP_NEXT_OFFSET);
		}
#line 1477 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 8:
#line 189 "CminusParser.y" /* yacc.c:1646  */
    {

		}
#line 1485 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 9:
#line 195 "CminusParser.y" /* yacc.c:1646  */
    {
			curr_function = (yyvsp[-3].sval);
			
			// There is no function overloading or redefining allowed in Cminus.
			if (is_name_defined(function_data, curr_function)) {
				Cminus_error("Function already defined.");
				exit(-1);
			}
			
			/*
			 * Offset from the caller's FP location on the current call frame.
			 * This is meant for giving variables a space on the stack.
			 */
			g_FP_NEXT_OFFSET = 0;
			
			// Record the function name.
			set_name(function_data, curr_function);
			
			// Function will have its own scope of variables.
			declare_scope(scope_stack);
			
			print_label(curr_function);
			
			if (!is_main(curr_function)) {
				postcall();
			}
		}
#line 1517 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 10:
#line 225 "CminusParser.y" /* yacc.c:1646  */
    {
			destroy_scope(scope_stack);
			
			// Allow only main to not have a return value.
			if (!is_main(curr_function) && !has_ret_stmt) {
				Cminus_error("Function needs to return a value.");
				exit(-1);
			}
			
			else if (is_main(curr_function) && !has_ret_stmt) {
				issue_exit_imm(0);
			}
			
			free(curr_function);
			curr_function = NULL;
			
			has_ret_stmt = false;
		}
#line 1540 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 11:
#line 246 "CminusParser.y" /* yacc.c:1646  */
    {
			
		}
#line 1548 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 12:
#line 250 "CminusParser.y" /* yacc.c:1646  */
    {
			
		}
#line 1556 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 13:
#line 256 "CminusParser.y" /* yacc.c:1646  */
    {
			
		}
#line 1564 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 14:
#line 260 "CminusParser.y" /* yacc.c:1646  */
    {
			
		}
#line 1572 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 15:
#line 266 "CminusParser.y" /* yacc.c:1646  */
    {			
			/*
			 * The variable declaration must be in the current scope. In the
			 * case of a global variable, the current scope (the one on top of the
			 * scope stack) is the global scope. In the case of a function variable,
			 * the current scope will be the function's scope.
			 */
			
			// Disallow multiple declarations of variables within the same scope.
			if (is_name_defined(currentSymtab(scope_stack), (yyvsp[0].sval))) {
				Cminus_error("Identifier already defined.");
				exit(-1);
			}

			cminus_variable * variable = declare_variable();
			if (variable == NULL) {
				Cminus_compiler_error("Failed to allocate memory for variable struct");
			}

			// Declare the variable in the current scope.
			int index = set_name(currentSymtab(scope_stack), (yyvsp[0].sval));
			free((yyvsp[0].sval));

			int offset = 0;
			if (is_scope_global(scope_stack)) {
				offset = g_GP_NEXT_OFFSET;
				g_GP_NEXT_OFFSET += 4; // next slot for a 4 byte value.
				variable->global = true;
			}
			
			else {
				g_FP_NEXT_OFFSET -= 4; // no offset can be 0, so must subtract first.
				offset = g_FP_NEXT_OFFSET;
				variable->global = false;
				
				/* Note: Offset from FP will be negative, as stack looks as such:
				 *		        Locals          low addr
				 *		fp -->	Caller's fp		high addr
				 */
			}

			variable->type = identifier_type;
			variable->size = (variable->type == INT) ? CMINUS_INT_SIZE : CMINUS_FLOAT_SIZE;
			variable->offset = offset;
			variable->reg = INVALID;
			
			set_ptr_field(currentSymtab(scope_stack), index, SYMTAB_VARIABLE_FIELD, variable);
		}
#line 1625 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 16:
#line 315 "CminusParser.y" /* yacc.c:1646  */
    {	
			/*
			 * Array will look as such:
			 * sp --> arr[0]
			 * 		  arr[1]
			 * 		  ...
			 */

			if ((yyvsp[-1].ival) <= 0) {
				Cminus_error("Array size cannot be zero or negative.");
				exit(-1);
			}

			// Disallow multiple declarations of variables within the same scope.
			if (is_name_defined(currentSymtab(scope_stack), (yyvsp[-3].sval))) {
				Cminus_error("Identifier already defined.");
				exit(-1);
			}

			cminus_variable * variable = declare_variable();
			if (variable == NULL) {
				fprintf(stderr, "Failed to allocate memory for variable struct.\n");
				exit(-1);
			}
			
			// Declare the variable in the current scope.
			int index = set_name(currentSymtab(scope_stack), (yyvsp[-3].sval));
			free((yyvsp[-3].sval));
			
			int offset = 0;
			if (is_scope_global(scope_stack)) {
				offset = g_GP_NEXT_OFFSET;
				g_GP_NEXT_OFFSET += (yyvsp[-1].ival) * 4; // Set offset past the array.
				variable->global = true;
			}
			
			else {
				offset = g_FP_NEXT_OFFSET - (yyvsp[-1].ival) * 4; // Start of the array, lower in memory
				g_FP_NEXT_OFFSET = offset; // Set fp offset to start of the array.
				variable->global = false;
			}

			variable->type = (identifier_type == INT ? INT_ARRAY : FLT_ARRAY);
			variable->size = ((variable->type == INT) ? CMINUS_INT_SIZE : CMINUS_FLOAT_SIZE) * (yyvsp[-1].ival);
			variable->offset = offset;
			variable->reg = INVALID;

			set_ptr_field(currentSymtab(scope_stack), index, SYMTAB_VARIABLE_FIELD, variable);
		}
#line 1679 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 17:
#line 367 "CminusParser.y" /* yacc.c:1646  */
    { 
			identifier_type = INT;
		}
#line 1687 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 18:
#line 371 "CminusParser.y" /* yacc.c:1646  */
    {
			identifier_type = FLOAT;
		}
#line 1695 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 19:
#line 377 "CminusParser.y" /* yacc.c:1646  */
    { 
			
		}
#line 1703 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 20:
#line 381 "CminusParser.y" /* yacc.c:1646  */
    { 
		
		}
#line 1711 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 21:
#line 385 "CminusParser.y" /* yacc.c:1646  */
    { 
		
		}
#line 1719 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 22:
#line 389 "CminusParser.y" /* yacc.c:1646  */
    { 
		
		}
#line 1727 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 23:
#line 393 "CminusParser.y" /* yacc.c:1646  */
    {

		}
#line 1735 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 24:
#line 397 "CminusParser.y" /* yacc.c:1646  */
    { 
			
		}
#line 1743 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 25:
#line 401 "CminusParser.y" /* yacc.c:1646  */
    { 
			
		}
#line 1751 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 26:
#line 407 "CminusParser.y" /* yacc.c:1646  */
    {
			// Variable is register holding variable's address.
			issue_sw((yyvsp[-1].ival), (yyvsp[-3].ival), 0);
			reg_free((yyvsp[-3].ival));
			reg_free((yyvsp[-1].ival));
		}
#line 1762 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 27:
#line 416 "CminusParser.y" /* yacc.c:1646  */
    {
			// Label else end statement to jump to when the if statement
			// evaluates to true.
			print_else_end_label((yyvsp[-2].ulval));
			
			DLinkNode * victim_if_node = dlinkPop(&if_stack);
			dlinkFreeNode(victim_if_node);
		}
#line 1775 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 28:
#line 425 "CminusParser.y" /* yacc.c:1646  */
    {
			// Prints the label to jump to incase the if statement evaluates to false.
			// An if can have no else statement, thus refer to no else and else as
			// if end.
			print_if_end_label((yyvsp[0].ulval));
			
			// Remove the current if from the stack.
			DLinkNode * victim_if_node = dlinkPop(&if_stack);
			dlinkFreeNode(victim_if_node);
		}
#line 1790 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 29:
#line 438 "CminusParser.y" /* yacc.c:1646  */
    {
			(yyval.ulval) = (yyvsp[-1].ulval);
		}
#line 1798 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 30:
#line 444 "CminusParser.y" /* yacc.c:1646  */
    {
			// Get the current if number.
			DLinkNode * if_node = dlinkHead(&if_stack);
			unsigned long if_number = PTR_AS_ULONG(dlinkNodeAtom(if_node));
			
			ISSUE_BEQ((yyvsp[-1].ival), ZERO, get_if_end_label(if_number));
			reg_free((yyvsp[-1].ival));
			
			(yyval.ulval) = if_number;
		}
#line 1813 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 31:
#line 457 "CminusParser.y" /* yacc.c:1646  */
    {
			// Put the if's number from $1 onto the stack of if statement numbers.
			DLinkNode * new_if = dlinkNodeAlloc(ULONG_AS_PTR((yyvsp[0].ulval)));
			dlinkPush(new_if, &if_stack);
		}
#line 1823 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 32:
#line 465 "CminusParser.y" /* yacc.c:1646  */
    {
			// Get the if number the else is associated with.
			DLinkNode * if_node = dlinkHead(&if_stack);
			unsigned long if_number = PTR_AS_ULONG(dlinkNodeAtom(if_node));
			
			// insert jump to come after the else.
			issue_j(get_else_end_label(if_number));
			
			print_if_end_label(if_number);
		}
#line 1838 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 33:
#line 478 "CminusParser.y" /* yacc.c:1646  */
    {	
			// Exiting the while loop, so must remove its number from the stack.
			DLinkNode * victim_while_node = dlinkPop(&while_stack);
			dlinkFreeNode(victim_while_node);
			
			// Insert jump back to the start of the while loop.
			issue_j(get_while_start_label((yyvsp[-1].ulval)));
			
			print_while_end_label((yyvsp[-1].ulval));
		}
#line 1853 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 34:
#line 491 "CminusParser.y" /* yacc.c:1646  */
    {			
			// Get the while loop the code is in, which is at the top of the stack.
			DLinkNode * while_node = dlinkHead(&while_stack);
			unsigned long while_number = PTR_AS_ULONG(dlinkNodeAtom(while_node));
			
			// Expr will be the register containing true or false at this point.
			// Test and jump if need be to the end of the while loop.
			ISSUE_BEQ((yyvsp[-1].ival), ZERO, get_while_end_label(while_number));
			reg_free((yyvsp[-1].ival));
			
			(yyval.ulval) = while_number;
		}
#line 1870 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 35:
#line 506 "CminusParser.y" /* yacc.c:1646  */
    {
			// Insert while number into while stack to mark the code is in 
			// a new while loop.
			DLinkNode * new_while = dlinkNodeAlloc(ULONG_AS_PTR((yyvsp[0].ulval)));
			dlinkPush(new_while, &while_stack);
			
			// Insert the while's label using the number into the code.
			print_while_start_label((yyvsp[0].ulval));
		}
#line 1884 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 36:
#line 518 "CminusParser.y" /* yacc.c:1646  */
    {
			read_int((yyvsp[-2].ival)); // read value from stdin and store into variable's location
			reg_free((yyvsp[-2].ival));
		}
#line 1893 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 37:
#line 523 "CminusParser.y" /* yacc.c:1646  */
    {
			write_reg_value((yyvsp[-2].ival));
			reg_free((yyvsp[-2].ival));
			write_new_line();
		}
#line 1903 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 38:
#line 529 "CminusParser.y" /* yacc.c:1646  */
    {
			write_const_string((yyvsp[-2].sval));
			write_new_line();
		}
#line 1912 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 39:
#line 536 "CminusParser.y" /* yacc.c:1646  */
    {	
			if (curr_function == NULL) {
				Cminus_compiler_error("Null current function");
			}

			// Only do prereturn if not returning from the main 
			// function...
			if (!is_main(curr_function)) {
				// Send the return value into the result register.
				issue_move(V0, (yyvsp[-1].ival));
				prereturn();
			}
			
			// Otherwise, just exit the program.
			else {
				issue_exit((yyvsp[-1].ival));
			}
			
			reg_free((yyvsp[-1].ival));

			has_ret_stmt = true;
		}
#line 1939 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 40:
#line 561 "CminusParser.y" /* yacc.c:1646  */
    {
			issue_exit(ZERO);
		}
#line 1947 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 41:
#line 567 "CminusParser.y" /* yacc.c:1646  */
    {
			
		}
#line 1955 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 42:
#line 573 "CminusParser.y" /* yacc.c:1646  */
    {		
			
		}
#line 1963 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 43:
#line 577 "CminusParser.y" /* yacc.c:1646  */
    {		
			
		}
#line 1971 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 44:
#line 583 "CminusParser.y" /* yacc.c:1646  */
    {
			(yyval.ival) = (yyvsp[0].ival);
		}
#line 1979 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 45:
#line 587 "CminusParser.y" /* yacc.c:1646  */
    {
			ISSUE_OR((yyvsp[-2].ival), (yyvsp[-2].ival), (yyvsp[0].ival));
			reg_free((yyvsp[0].ival));
			(yyval.ival) = (yyvsp[-2].ival);
		}
#line 1989 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 46:
#line 593 "CminusParser.y" /* yacc.c:1646  */
    {
			ISSUE_AND((yyvsp[-2].ival), (yyvsp[-2].ival), (yyvsp[0].ival));
			reg_free((yyvsp[0].ival));
			(yyval.ival) = (yyvsp[-2].ival);
		}
#line 1999 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 47:
#line 599 "CminusParser.y" /* yacc.c:1646  */
    {
			ISSUE_SEQ((yyvsp[0].ival), (yyvsp[0].ival), ZERO);
			(yyval.ival) = (yyvsp[0].ival);
		}
#line 2008 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 48:
#line 606 "CminusParser.y" /* yacc.c:1646  */
    {
			(yyval.ival) = (yyvsp[0].ival);
		}
#line 2016 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 49:
#line 610 "CminusParser.y" /* yacc.c:1646  */
    {
			ISSUE_SEQ((yyvsp[-2].ival), (yyvsp[-2].ival), (yyvsp[0].ival));
			reg_free((yyvsp[0].ival));
			(yyval.ival) = (yyvsp[-2].ival);
		}
#line 2026 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 50:
#line 616 "CminusParser.y" /* yacc.c:1646  */
    {
			ISSUE_SNE((yyvsp[-2].ival), (yyvsp[-2].ival), (yyvsp[0].ival));
			reg_free((yyvsp[0].ival));
			(yyval.ival) = (yyvsp[-2].ival);
		}
#line 2036 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 51:
#line 622 "CminusParser.y" /* yacc.c:1646  */
    {
			ISSUE_SLE((yyvsp[-2].ival), (yyvsp[-2].ival), (yyvsp[0].ival));
			reg_free((yyvsp[0].ival));
			(yyval.ival) = (yyvsp[-2].ival);
		}
#line 2046 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 52:
#line 628 "CminusParser.y" /* yacc.c:1646  */
    {
			ISSUE_SLT((yyvsp[-2].ival), (yyvsp[-2].ival), (yyvsp[0].ival));
			reg_free((yyvsp[0].ival));
			(yyval.ival) = (yyvsp[-2].ival);
		}
#line 2056 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 53:
#line 634 "CminusParser.y" /* yacc.c:1646  */
    {
			ISSUE_SGE((yyvsp[-2].ival), (yyvsp[-2].ival), (yyvsp[0].ival));
			reg_free((yyvsp[0].ival));
			(yyval.ival) = (yyvsp[-2].ival);
		}
#line 2066 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 54:
#line 640 "CminusParser.y" /* yacc.c:1646  */
    {
			ISSUE_SGT((yyvsp[-2].ival), (yyvsp[-2].ival), (yyvsp[0].ival));
			reg_free((yyvsp[0].ival));
			(yyval.ival) = (yyvsp[-2].ival);
		}
#line 2076 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 55:
#line 648 "CminusParser.y" /* yacc.c:1646  */
    {
			(yyval.ival) = (yyvsp[0].ival);
		}
#line 2084 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 56:
#line 652 "CminusParser.y" /* yacc.c:1646  */
    {
			ISSUE_ADD((yyvsp[-2].ival), (yyvsp[-2].ival), (yyvsp[0].ival));
			reg_free((yyvsp[0].ival));
			(yyval.ival) = (yyvsp[-2].ival);
		}
#line 2094 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 57:
#line 658 "CminusParser.y" /* yacc.c:1646  */
    {
			ISSUE_SUB((yyvsp[-2].ival), (yyvsp[-2].ival), (yyvsp[0].ival));
			reg_free((yyvsp[0].ival));
			(yyval.ival) = (yyvsp[-2].ival);
		}
#line 2104 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 58:
#line 666 "CminusParser.y" /* yacc.c:1646  */
    {
			(yyval.ival) = (yyvsp[0].ival);
		}
#line 2112 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 59:
#line 670 "CminusParser.y" /* yacc.c:1646  */
    {
			ISSUE_MUL((yyvsp[-2].ival), (yyvsp[-2].ival), (yyvsp[0].ival));
			reg_free((yyvsp[0].ival));
			(yyval.ival) = (yyvsp[-2].ival);
		}
#line 2122 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 60:
#line 676 "CminusParser.y" /* yacc.c:1646  */
    {
			ISSUE_DIV((yyvsp[-2].ival), (yyvsp[-2].ival), (yyvsp[0].ival));
			reg_free((yyvsp[0].ival));
			(yyval.ival) = (yyvsp[-2].ival);
		}
#line 2132 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 61:
#line 684 "CminusParser.y" /* yacc.c:1646  */
    { 
			// Variable is reg holding variable's location.
			issue_lw((yyvsp[0].ival), (yyvsp[0].ival), 0);
			(yyval.ival) = (yyvsp[0].ival);
		}
#line 2142 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 62:
#line 690 "CminusParser.y" /* yacc.c:1646  */
    { 
			// TODO MAKE MORE EFFICIENT, BY MANUALLY PERFORMING MATH/EXPLICITY CHANGES WHERE CONSTANT CAN BE USED
			reg_idx_t reg = reg_alloc();
			issue_li(reg, (yyvsp[0].ival));
			(yyval.ival) = reg;
		}
#line 2153 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 63:
#line 697 "CminusParser.y" /* yacc.c:1646  */
    {
			if (is_main((yyvsp[-2].sval))) {
				Cminus_error("Cannot recursively call main.");
				exit(-1);
			}
	
			// Make sure the function exists.
			if (!is_name_defined(function_data, (yyvsp[-2].sval))) {
				Cminus_error("Function does not exist.");
				exit(-1);
			}
			
			// Code to set up activation record and jumping to the function.
			precall((yyvsp[-2].sval));
			
			free((yyvsp[-2].sval));

			// Code to grab data off the stack after coming back from function call.
			postreturn();
			
			// Returning V0 will bubble up into Expr and the only
			// case in which this would matter would be in assignment, which
			// is exactly what we would like to do.
			(yyval.ival) = V0;
		}
#line 2183 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 64:
#line 723 "CminusParser.y" /* yacc.c:1646  */
    {
			(yyval.ival) = (yyvsp[-1].ival);
		}
#line 2191 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 65:
#line 729 "CminusParser.y" /* yacc.c:1646  */
    {
			SymTable scope = variables_scope(scope_stack, (yyvsp[0].sval));
			
			int index = SymQueryIndex(scope, (yyvsp[0].sval));
			if (index == SYM_INVALID_INDEX) {
				Cminus_error("Identifier not declared.");
				exit(-1);
			}

			cminus_variable * variable = (cminus_variable *)get_ptr_field(scope, index, SYMTAB_VARIABLE_FIELD);
			if (variable == NULL) {
				Cminus_error("Identifier not declared.");
				exit(-1);
			}

			if (variable->type == INT_ARRAY || variable->type == FLT_ARRAY) {
				Cminus_error("Array identifier needs a specified index.");
				exit(-1);
			}
			
			int offset = variable->offset;
			int base = (is_global_variable(scope_stack, (yyvsp[0].sval)) ? GP : FP);
			free((yyvsp[0].sval));
			
			reg_idx_t reg = reg_alloc();
			if (offset != 0) {
				ISSUE_ADDI(reg, base, offset);	
			}
			
			else {
				issue_move(reg, base);
			}
			
			(yyval.ival) = reg; // register holding variable location.
		}
#line 2231 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 66:
#line 765 "CminusParser.y" /* yacc.c:1646  */
    {
			// Expr is reg in which value lies.
			
			SymTable scope = variables_scope(scope_stack, (yyvsp[-3].sval));
			
			int index = SymQueryIndex(scope, (yyvsp[-3].sval));
			if (index == SYM_INVALID_INDEX) {
				Cminus_error("Identifier not declared.");
				exit(-1);
			}

			cminus_variable * variable = (cminus_variable *)get_ptr_field(scope, index, SYMTAB_VARIABLE_FIELD);
			if (variable == NULL) {
				Cminus_error("Identifier not declared.");
				exit(-1);
			}

			if (variable->type != INT_ARRAY && variable->type != FLT_ARRAY) {
				Cminus_error("Identifier is not an array.");
				exit(-1);
			}

			int offset = variable->offset; // array start (offset from gp or fp)
			
			ISSUE_SLL((yyvsp[-1].ival), (yyvsp[-1].ival), 2); // 4 * $Expr
			
			/* 
			 * Calculation of gp offset is as follows: 
			 * array base + (4 * $Expr), where $Expr is the value in the register 
			 * defined by Expr.
			 */
			if (is_global_variable(scope_stack, (yyvsp[-3].sval))) {
				ISSUE_ADD((yyvsp[-1].ival), (yyvsp[-1].ival), GP); // (4 * $Expr) + $GP
				ISSUE_ADDI((yyvsp[-1].ival), (yyvsp[-1].ival), offset); // $GP + array base offset + (4 * $Expr)
			}
			
			// Local variable, which has an offset from the FP register.
			// Offsets from FP are negative.
			else {
				ISSUE_ADDI((yyvsp[-1].ival), (yyvsp[-1].ival), offset); // (4 * $Expr) + base
				ISSUE_ADD((yyvsp[-1].ival), FP, (yyvsp[-1].ival)); // FP + (base + (4 * $Expr))
			}

			free((yyvsp[-3].sval));
			
			(yyval.ival) = (yyvsp[-1].ival); // holds variable location
		}
#line 2283 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 67:
#line 815 "CminusParser.y" /* yacc.c:1646  */
    { 
			(yyval.sval) = (char *)SymGetFieldByIndex(string_list, (yyvsp[0].ival), SYM_NAME_FIELD);
		}
#line 2291 "CminusParser.c" /* yacc.c:1646  */
    break;

  case 68:
#line 821 "CminusParser.y" /* yacc.c:1646  */
    { 
			(yyval.ival) = (yyvsp[0].ival);
		}
#line 2299 "CminusParser.c" /* yacc.c:1646  */
    break;


#line 2303 "CminusParser.c" /* yacc.c:1646  */
      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = (char *) YYSTACK_ALLOC (yymsg_alloc);
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYTERROR;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#if !defined yyoverflow || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  return yyresult;
}
#line 826 "CminusParser.y" /* yacc.c:1906  */


/******************** C ROUTINES ********************/

void
Cminus_error(const char * s)
{
	fprintf(stderr, "%s: line %d: %s\n", filename, Cminus_lineno, s);
}

void
Cminus_general_error(const char * s)
{
	fprintf(stderr, "%s: %s\n", filename, s);
}

void 
Cminus_compiler_error(const char * explain) 
{
	fprintf(stderr, "Compiler Error: %s\n", explain);
	exit(-1);
}

int
Cminus_wrap()
{
	return 1;
}

static 
void
initialize(char * input_filename)
{
	Cminus_in = fopen(input_filename, "r");
	if (Cminus_in == NULL) {
		fprintf(stderr, "Error: Could not open file %s\n", input_filename);
		exit(-1);
	}

	char * dot = rindex(input_filename, '.');
	int end_index = strlen(input_filename) - strlen(dot);
	char * input_no_ext = substr(input_filename, 0, end_index);
	char * output_filename = nssave(2, input_no_ext, ".s");
	sfree(input_no_ext);

	stdout = freopen(output_filename, "w", stdout);
	if (stdout == NULL) {
		fprintf(stderr, "Error: Could not open file %s\n", output_filename);
		exit(-1);
	}
	sfree(output_filename);
	
	scope_stack = symtabStackInit();

	// Declare global scope
	declare_scope(scope_stack);
	
	function_data = SymInit(SYMTABLE_SIZE);
	string_list = SymInit(SYMTABLE_SIZE);
	
	// Initialize the while loop stack to track while loop numbers.
	dlinkListInit(&while_stack, INT_AS_PTR(-1));
	
	// Initialize the if statement stack to track if statement numbers.
	dlinkListInit(&if_stack, INT_AS_PTR(-1));
}

static 
void
cleanup()
{
	symtabStackFree(scope_stack);

	free(curr_function);
	
	SymKill(function_data);
	SymKill(string_list);
	
	// Free memory used by tracking while loops and if statements.
	dlinkFreeNodes(&while_stack);
	dlinkFreeNodes(&if_stack);
	
	fclose(Cminus_in);
	fclose(stdout);
}

static 
void 
print_usage(void)
{
	printf("Usage: cmc [.cm file path]\n");
}

static 
SymTable 
variables_scope(SymtabStack scope_stack, char * var)
{
	if (scope_stack == NULL || var == NULL) {
		Cminus_compiler_error("variables_scope given a null pointer");
	}
	
	bool is_global = is_global_variable(scope_stack, var);
	SymTable scope = (is_global ? lastSymtab(scope_stack) : currentSymtab(scope_stack));

	return scope;
}

inline 
int
get_int_field(SymTable symtab, int index, char * field)
{
	if (symtab == NULL || field == NULL) {
		Cminus_compiler_error("get_int_field given a null pointer");
	}
	return PTR_AS_INT(SymGetFieldByIndex(symtab, index, field));
}

inline 
void
set_int_field(SymTable symtab, int index, char * field, int value)
{
	if (symtab == NULL || field == NULL) {
		Cminus_compiler_error("set_int_field given a null pointer");
	}
	SymPutFieldByIndex(symtab, index, field, INT_AS_PTR(value));
}

inline 
void 
set_ptr_field(SymTable symtab, int index, char * field, void * value) 
{
	if (symtab == NULL || field == NULL || value == NULL) {
		Cminus_compiler_error("set_ptr_field given a null pointer");
	}
	SymPutFieldByIndex(symtab, index, field, value);
}

inline 
void * 
get_ptr_field(SymTable symtab, int index, char * field) 
{
	if (symtab == NULL || field == NULL) {
		Cminus_compiler_error("get_ptr_field given a null pointer");
	}
	return SymGetFieldByIndex(symtab, index, field);
}

static 
void
declare_scope(SymtabStack stack)
{
	if (stack != NULL) {
		SymTable new_scope = beginScope(stack);
		SymInitField(new_scope, SYMTAB_VALUE_FIELD, INT_AS_PTR(-1), NULL);
		SymInitField(new_scope, SYMTAB_VARIABLE_FIELD, NULL, cleanup_variable);
	}
}

static 
void
destroy_scope(SymtabStack stack)
{
	if (stack != NULL && stackSize(stack) > 0) {
		SymTable old_scope = endScope(stack);
		SymKillField(old_scope, SYMTAB_VARIABLE_FIELD);
		SymKillField(old_scope, SYMTAB_VALUE_FIELD);
		SymKill(old_scope);
	}
}

static 
int
get_name_index(SymTable symtab, char * name)
{
	if (symtab == NULL || name == NULL) {
		Cminus_compiler_error("get_name_index given a null pointer");
	}
	
	return SymQueryIndex(symtab, name);
}

static 
int
set_name(SymTable symtab, char * name)
{
	if (symtab == NULL || name == NULL) {
		Cminus_compiler_error("set_name given a null pointer");
	}

	return SymIndex(symtab, name);
}

static 
bool
is_global_variable(SymtabStack stack, char * identifier_name)
{
	bool is_global = false;
	
	if (stack == NULL || identifier_name == NULL) {
		Cminus_compiler_error("is_global_variable given a null pointer");
	}

	// Check the local scope for the variable.
	int index = SymQueryIndex(currentSymtab(stack), identifier_name);
	
	// Didn't find the variable in local scope, so should be global, or
	// found the variable, but only the global scope exists, thus it must be global.
	if (index == SYM_INVALID_INDEX || (index != SYM_INVALID_INDEX && stackSize(stack) <= 1)) {
		is_global = true;
	}
	
	// Neither local or global scope, so error.
	if (is_global && (SymQueryIndex(lastSymtab(stack), identifier_name) == SYM_INVALID_INDEX)) {
		fprintf(stderr, "Identifier %s could not be found.\n", identifier_name);
		exit(-1);
	}
	
	return is_global;
}

static 
bool
is_name_defined(const SymTable symtab, char * name)
{
	return symtab != NULL && name != NULL && SymQueryIndex(symtab, name) != SYM_INVALID_INDEX;
}

static inline 
bool
is_scope_global(SymtabStack scope_stack)
{
	return scope_stack != NULL && stackSize(scope_stack) == 1;
}

static inline 
bool
is_main(const char * function_name)
{
	return function_name != NULL && strcmp(function_name, "main") == 0;
}

int
main(int argc, char * argv[])
{
	if (argc <= 1) {
		print_usage();
		return -1;
	}

	filename = argv[1];

	initialize(filename);
	
	print_prologue();

	Cminus_parse();

	print_epilogue(SYMTAB_VALUE_FIELD);
  
	cleanup();
  
	return 0;
}

/******************END OF C ROUTINES**********************/
