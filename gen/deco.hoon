::
::  THIS IS A SAMPLE FILE DESIGNED TO SET CONVENTIONS FOR
::  HIGH-QUALITY CONVENTIONAL HOON.
::
::  ALL LINES MUST BE UNDER 80 CHARACTERS.  NO BLANK LINES.
::  ANY LINE LONGER THAN 60 CHARACTERS IS PROBABLY TOO LONG.
::  UPPERCASE OR NON-ASCII LETTERS ARE STRONGLY DISCOURAGED.
::
::  INFORMAL COMMENTS (LINES WITH {::}) SHOULD BE USED ONLY FOR
::  META-DISCUSSION *ABOUT* THE CODE.
::
::  WHENEVER POSSIBLE, USE FORMAL DECORATIONS. {:>} DECORATES
::  THE NEXT EXPRESSION; {:<} DECORATES THE PREVIOUS ONE.
::
::  THERE ARE TWO PLACES TO PUT DECORATIONS: IN LINE WITH THE
::  CODE, AND ON THE RIGHT MARGIN.
::
::  IN COMMENTS AND DECORATIONS, USE *PHRASE* FOR EMPHASIS
::  AND {BRACES} TO SURROUND CODE LITERALS.  (DOCUMENTATION WILL
::  EVENTUALLY BE AUTOMATICALLY GENERATED FROM FORMAL COMMENTS.)
::  %LITERAL, ++LITERAL, ~SHIP NEED NO BRACES.  FOR A VALID
::  HOON EXPRESSION, `EXP.
::
::  THERE ARE THREE CONVENTIONS FOR NAMING: *ULTRALAPIDARY*,
::  *LAPIDARY*, AND *NATURAL*.  THIS FILE IS MOSTLY NATURAL.
::
::  WHEN IN DOUBT, USE THE *NATURAL* NAMING CONVENTION.  FOR
::  BOTH ARMS AND FACES, NATURAL NAMING MEANS LONG, LEGIBLE,
::  ENGLISH-LANGUAGE PHRASES, IN HYPHEN-SEPARATED {KEBAB-CASE}.
::
::  LAPIDARY CONVENTIONS SHOULD BE USED ONLY FOR SMALL, SIMPLE,
::  SELF-CONTAINED SYSTEMS.  LAPIDARY MODE MEANS THREE-LETTER
::  FACES ("VARIABLE NAMES") AND FOUR-LETTER ARMS ("METHODS").
::
::  ULTRALAPIDARY CONVENTIONS USE SINGLE-LETTER NAMES STARTING
::  WITH {A}.  USE THIS CONVENTION ONLY FOR ONE-LINERS, ETC.
::
::  THE FILE BELOW IS A MEDIUM-SIZED GENERATOR, BUILT AROUND
::  A TYPICAL TWO-CORE STRUCTURE.  THE CORES ARE LABELED {%ARCH}
::  (STRUCTURES) AND {%WORK} (PRODUCTIONS).  THIS IS CANONICAL.
::
::  THIS CODE IS WRITTEN TO DISPLAY THE VARIETY OF FORMATTING
::  OPTIONS THE PARSER ALLOWS.  A SPECIFIC CONVENTION SHOULD PICK
::  ONE OF THESE STYLES AND STICK TO IT.
::
::  A FORWARD DECORATION BLOCK {:>} IS EITHER A *DOCUMENT BLOCK* OR
::  A *DEFINITION BLOCK*.

::  A DOCUMENT BLOCK HAS TWO PARTS, EACH OF WHICH IS OPTIONAL:
::  THE *TITLE* AND THE *BODY*,
::
::  THE TITLE IS A ++TERM PRECEDED BY {::  #  %}.  ONLY CORES
::  AND CORE CHAPTERS (PRECEDED BY {+|}) CAN USE TITLES.  TITLES
::  ARE OPTIONALLY SURROUNDED BY BLANK OR SEMI-BLANK DECORATIONS,
::  {:>} OR {::  #}.
::
::  THE BODY IS EITHER SHORT OR LONG.  A SHORT BODY IS A *SINGLE LINE*
::  PRECEDED BY {::  } - IE, NOT INDENTED.  A LONG BODY STARTS WITH
::  A *SINGLE LINE* INDENTED BY TWO EXTRA SPACES, {::    }, THEN A
::  BLANK LINE, THEN A SERIES OF PARAGRAPHS.
::
::  A DEFINITION BLOCK IS A LIST OF NAME DEFINITIONS.  THE TWIG BELOW
::  THE BLOCK IS TRAVERSED FOR BINDINGS ON THESE NAMES.
::
::  A NAME DEFINITION CAN BE SHORT OR LONG.  A SHORT DEFINITION IS
::  A *SINGLE LINE* OF THE FORM {::  NAME: VALUE}.
::
::  A LONG DEFINITION IS A SHORT DEFINITION, FOLLOWED BY A BLANK
::  DECORATION {:>}, FOLLOWED BY A SERIES OF PARAGRAPHS EACH
::  INDENTED BY AN EXTRA TWO SPACES.
::
::  A PARAGRAPH IS A SERIES OF LINES, NOT INDENTED FOR TEXT,
::  INDENTED BY FOUR EXTRA SPACES, {::      }, FOR CODE.
::
::  A BACKWARD DECORATION {:<} IS ONLY ONE LINE, ALWAYS PARSED
::  AS A SHORT BODY.
::
:-  %SAY
|=  *
=<  [%NOUN (SAY-HELLO %WORLD)]
=>  ::  #  %ARCH
    ::
    ::    STRUCTURES FOR OUR IMAGINARY HELLO, WORLD GENERATOR.
    ::
    ::  NOTHING FORCES US TO PUT STRUCTURES IN A SEPARATE CORE.
    ::  BUT COMPILE-TIME EVALUATION DOESN'T WORK IN THE CURRENT
    ::  CORE; WE OFTEN WANT TO STATICALLY EVALUATE STRUCTURES.
    ::
    ::  THERE ARE THREE KINDS OF STRUCTURES: MODELS (NORMALIZING
    ::  FUNCTIONS), PATTERNS (FUNCTIONS THAT BUILD MODELS), AND
    ::  CONSTANTS (STATIC DATA).
    ::
    ::  MOST CODE WILL NOT NEED ITS OWN PATTERNS.  BUT PUT THEM
    ::  IN A SEPARATE CHAPTER (SEPARATED BY {+|}).
    |%
    ::  #  %MODEL
    ::
    ::    MODELS (MOLDS) ARE FUNCTIONS THAT NORMALIZE NOUNS.
    ::
    ::  ARMS PRODUCING MOLDS ARE INTRODUCED WITH {+$}.  THE
    ::  COMPILER WILL COPY THE ARM DECORATION ONTO ITS PRODUCT
    :: +|
    +$  SPOT  [P=@ Q=@]                                 ::  A COORDINATE
    +$  TOPS                                            ::  ALSO A COORDINATE
      [P=@ Q=@]
    +$  GOOF                                            ::  A SIMPLE TUPLE
      $:  FOO=@                                         ::  SOMETHING MYSTERIOUS
          BAR=@                                         ::  GO HERE FOR DRINK
          MOO=(BINARY-TREE JUICE)                       ::  COWS DO THIS
      ==
    +$  JUICE                                           ::  FRUITY BEVERAGE
      $%  [%PLUM P=@]                                   ::  FRESH PRUNE
          [%PEAR P=@ Q=@]                               ::  GOOD FOR CIDER
          [%ACAI P=@]                                   ::  AZTEC SUPERFOOD
      ==
    ::  #
    ::  #  %PATTERN
    ::  #
    ::
    ::    PATTERNS ARE FUNCTIONS THAT BUILD MODELS.
    ::
    ::  OTHER LANGUAGES MIGHT CALL THESE "TYPE CONSTRUCTORS"
    ::  OR "HIGHER-KINDED TYPES".
    :: +|
    ++  BINARY-TREE                                     ::  TREE PATTERN
      |*  A=$-(* *)
      $@(~ [N=A L=(BINARY-TREE A) R=(BINARY-TREE A)])
    ::  #
    ::  #  %CONSTANT
    ::  #
    ::    IF YOU HAVE CONSTANTS, PUT THEM IN THEIR OWN CHAPTER.
    :: +|
    ++  ANSWER                                          ::  ANSWER TO EVERYTHING
      42
    --
::  #
::  #  %WORK
::  #
::    ENGINES FOR OUR IMAGINARY HELLO, WORLD APP.
::
|%
++  SAY-HELLO                                           ::  SAY HI TO SOMEONE
  ::  FRIENDLY WELCOME MESSAGE
  ::
  |=  ::  TXT: FRIEND TO SAY HI TO
      ::
      TXT=TERM
  ^-  TAPE
  "HELLO, {(RIP 3 TXT)}"
::    ++SAY-GOODBYE: SAY A REALLY PROPER GOODBYE
::
::  SOME PARAGRAPHS ABOUT THE GOODBYE ALGORITHM, POSSIBLY
::  INCLUDING CODE INDENTED BY FOUR EXTRA SPACES:
::
::      ?:  =(%HELLO %WORLD)
::        %HELLO
::      %WORLD
::
++  SAY-GOODBYE                                         ::
  ::  DESCRIBE PRODUCT OF FUNCTION
  ::
  |=  ::  TXT: DEPARTING FRIEND
      ::  NUM: NUMBER OF FRIENDS
      $:  TXT=TERM
          NUM=@
      ==
  ^-  TAPE
  ::  FOO: FOUR
  ::  BAR: FORTY-TWO
  =/  FOO  (ADD 2 2)
  =/  BAR  (ADD (MUL NUM FOO) 2)
  =/  MOO  (MUL NUM BAR)                                ::  FOR ALL THE COWS
  "GOODBYE AND {(SCOW %UD MOO)}, {(RIP 3 TXT)}"
::
++  SAY-MINIMUM                                         ::  MINIMAL DECORATION
  |=  TXT=TERM
  "NOTHING TO SAY TO {(RIP 3 TXT)}"
--
