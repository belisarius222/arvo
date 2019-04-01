::
::::    /SYS/HOON                                       ::
  ::                                                    ::
=<  RIDE
=>  %141  =>
::                                                      ::
::::    0: VERSION STUB                                 ::
  ::                                                    ::
~%  %K.141  ~  ~                                        ::
|%
++  HOON-VERSION  141
--  =>
~%  %ONE  +  ~
::  #  %BASE
::
::    BASIC MATHEMATICAL OPERATIONS
|%
::  #  %MATH
::    UNSIGNED ARITHMETIC
+|  %MATH
++  ADD
  ~/  %ADD
  ::  UNSIGNED ADDITION
  ::
  ::  A: AUGEND
  ::  B: ADDEND
  |=  [A=@ B=@]
  ::  SUM
  ^-  @
  ?:  =(0 A)  B
  $(A (DEC A), B +(B))
::
++  DEC
  ~/  %DEC
  ::  UNSIGNED DECREMENT BY ONE.
  |=  A=@
  ~_  LEAF+"DECREMENT-UNDERFLOW"
  ?<  =(0 A)
  =+  B=0
  ::  DECREMENTED INTEGER
  |-  ^-  @
  ?:  =(A +(B))  B
  $(B +(B))
::
++  DIV
  ~/  %DIV
  ::  UNSIGNED DIVIDE
  ::
  ::  A: DIVIDEND
  ::  B: DIVISOR
  |:  [A=`@`1 B=`@`1]
  ::  QUOTIENT
  ^-  @
  ~_  LEAF+"DIVIDE-BY-ZERO"
  ?<  =(0 B)
  =+  C=0
  |-
  ?:  (LTH A B)  C
  $(A (SUB A B), C +(C))
::
++  DVR
  ~/  %DVR
  ::  UNSIGNED DIVIDE WITH REMAINDER
  ::
  ::  A: DIVIDEND
  ::  B: DIVISOR
  |=  [A=@ B=@]
  ::  P: QUOTIENT
  ::  Q: REMAINDER
  ^-  [P=@ Q=@]
  [(DIV A B) (MOD A B)]
::
++  GTE
  ~/  %GTE
  ::    UNSIGNED GREATER THAN OR EQUALS
  ::
  ::  RETURNS WHETHER {A >= B}.
  ::
  ::  A: LEFT HAND OPERAND (TODO: NAME)
  ::  B: RIGHT HAND OPERAND
  |=  [A=@ B=@]
  ::  GREATER THAN OR EQUAL TO?
  ^-  ?
  !(LTH A B)
::
++  GTH
  ~/  %GTH
  ::    UNSIGNED GREATER THAN
  ::
  ::  RETURNS WHETHER {A > B}
  ::
  ::  A: LEFT HAND OPERAND (TODO: NAME)
  ::  B: RIGHT HAND OPERAND
  |=  [A=@ B=@]
  ::  GREATER THAN?
  ^-  ?
  !(LTE A B)
::
++  LTE
  ~/  %LTE
  ::    UNSIGNED LESS THAN OR EQUALS
  ::
  ::  RETURNS WHETHER {A >= B}.
  ::
  ::  A: LEFT HAND OPERAND (TODO: NAME)
  ::  B: RIGHT HAND OPERAND
  |=  [A=@ B=@]
  ::  LESS THAN OR EQUAL TO?
  |(=(A B) (LTH A B))
::
++  LTH
  ~/  %LTH
  ::    UNSIGNED LESS THAN
  ::
  ::  A: LEFT HAND OPERAND (TODO: NAME)
  ::  B: RIGHT HAND OPERAND
  |=  [A=@ B=@]
  ::  LESS THAN?
  ^-  ?
  ?&  !=(A B)
      |-
      ?|  =(0 A)
          ?&  !=(0 B)
              $(A (DEC A), B (DEC B))
  ==  ==  ==
::
++  MAX
  ~/  %MAX
  ::  UNSIGNED MAXIMUM
  |=  [A=@ B=@]
  ::  THE MAXIMUM
  ^-  @
  ?:  (GTH A B)  A
  B
::
++  MIN
  ~/  %MIN
  ::  UNSIGNED MINIMUM
  |=  [A=@ B=@]
  ::  THE MINIMUM
  ^-  @
  ?:  (LTH A B)  A
  B
::
++  MOD
  ~/  %MOD
  ::  UNSIGNED MODULUS
  ::
  ::  A: DIVIDEND
  ::  B: DIVISOR
  |:  [A=`@`1 B=`@`1]
  ::  THE REMAINDER
  ^-  @
  ?<  =(0 B)
  (SUB A (MUL B (DIV A B)))
::
++  MUL
  ~/  %MUL
  ::  UNSIGNED MULTIPLICATION
  ::
  ::  A: MULTIPLICAND
  ::  B: MULTIPLIER
  |:  [A=`@`1 B=`@`1]
  ::  PRODUCT
  ^-  @
  =+  C=0
  |-
  ?:  =(0 A)  C
  $(A (DEC A), C (ADD B C))
::
++  SUB
  ~/  %SUB
  ::  UNSIGNED SUBTRACTION
  ::
  ::  A: MINUEND
  ::  B: SUBTRAHEND
  |=  [A=@ B=@]
  ~_  LEAF+"SUBTRACT-UNDERFLOW"
  ::  DIFFERENCE
  ^-  @
  ?:  =(0 B)  A
  $(A (DEC A), B (DEC B))
::
::  #  %TREE
::
::    TREE ADDRESSING
+|  %TREE
++  CAP
  ~/  %CAP
  ::    TREE HEAD
  ::
  ::  TESTS WHETHER AN `A` IS IN THE HEAD OR TAIL OF A NOUN. PRODUCES %2 IF IT
  ::  IS WITHIN THE HEAD, OR %3 IF IT IS WITHIN THE TAIL.
  |=  A=@
  ^-  ?($2 $3)
  ?-  A
    $2        %2
    $3        %3
    ?($0 $1)  !!
    *         $(A (DIV A 2))
  ==
::
++  MAS
  ~/  %MAS
  ::    AXIS WITHIN HEAD/TAIL
  ::
  ::  COMPUTES THE AXIS OF `A` WITHIN EITHER THE HEAD OR TAIL OF A NOUN
  ::  (DEPENDS WHETHER `A` LIES WITHIN THE THE HEAD OR TAIL).
  |=  A=@
  ^-  @
  ?-  A
    $1   !!
    $2   1
    $3   1
    *    (ADD (MOD A 2) (MUL $(A (DIV A 2)) 2))
  ==
::
++  PEG
  ~/  %PEG
  ::    AXIS WITHIN AXIS
  ::
  ::  COMPUTES THE AXIS OF {B} WITHIN AXIS {A}.
  |=  [A=@ B=@]
  ?<  =(0 A)
  ::  A COMPOSED AXIS
  ^-  @
  ?-  B
    $1  A
    $2  (MUL A 2)
    $3  +((MUL A 2))
    *   (ADD (MOD B 2) (MUL $(B (DIV B 2)) 2))
  ==
::                                                      ::
::::  2N: FUNCTIONAL HACKS                              ::
  ::                                                    ::
  ::
++  AFTR  |*(A/$-(* *) |*(B/$-(* *) (PAIR B A)))        ::  PAIR AFTER
++  CORK  |*({A/$-(* *) B/$-(* *)} (CORL B A))          ::  COMPOSE FORWARD
++  CORL                                                ::  COMPOSE BACKWARDS
  |*  {A/$-(* *) B/$-(* *)}
  =<  +:|.((A (B)))      ::  TYPE CHECK
  =+  C=+<.B
  |@  ++  $  (A (B C))
  --
::
++  CURY                                                ::  CURRY LEFT
  |*  {A/$-(^ *) B/*}
  =+  C=+<+.A
  |@  ++  $  (A B C)
  --
::
++  CURR                                                ::  CURRY RIGHT
  |*  {A/$-(^ *) C/*}
  =+  B=+<+.A
  |@  ++  $  (A B C)
  --
::
++  FORE  |*(A/$-(* *) |*(B/$-(* *) (PAIR A B)))        ::  PAIR BEFORE
++  HARD                                                ::  FORCE REMOLD
  |*  HAN/$-(* *)
  |=  FUD/*  ^-  HAN
  ~_  LEAF+"HARD"
  =+  GOL=(HAN FUD)
  ?>(=(GOL FUD) GOL)
::
::
++  HEAD  |*(^ ,:+<-)                                   ::  GET HEAD
++  SAME  |*(* +<)                                      ::  IDENTITY
::
++  TAIL  |*(^ ,:+<+)                                   ::  GET TAIL
++  TEST  |=(^ =(+<- +<+))                              ::  EQUALITY
::
::  #  %CONTAINERS
::
::    THE MOST BASIC OF DATA TYPES
+|  %CONTAINERS
++  BLOQ
  ::    BLOCKSIZE
  ::
  ::  A BLOCKSIZE IS THE POWER OF 2 SIZE OF AN ATOM. IE, 3 IS A BYTE AS 2^3 IS
  ::  8 BITS.
  @
::
+*  EACH  [THIS THAT]
  ::    EITHER {A} OR {B}, DEFAULTING TO {A}.
  ::
  ::  MOLD GENERATOR: PRODUCES A DISCRIMINATED FORK BETWEEN TWO TYPES,
  ::  DEFAULTING TO {A}.
  ::
  $%  [%| P=THAT]
      [%& P=THIS]
  ==
::
++  GATE
  ::    FUNCTION
  ::
  ::  A CORE WITH ONE ARM, `$`--THE EMPTY NAME--WHICH TRANSFORMS A SAMPLE NOUN
  ::  INTO A PRODUCT NOUN. IF USED DRYLY AS A TYPE, THE SUBJECT MUST HAVE A
  ::  SAMPLE TYPE OF `*`.
  $-(* *)
::
+*  LIST  [ITEM]
  ::    NULL-TERMINATED LIST
  ::
  ::  MOLD GENERATOR: PRODUCES A MOLD OF A NULL-TERMINATED LIST OF THE
  ::  HOMOGENEOUS TYPE {A}.
  ::
  $@(~ [I=ITEM T=(LIST ITEM)])
::
+*  LONE  [ITEM]
  ::    SINGLE ITEM TUPLE
  ::
  ::  MOLD GENERATOR: PUTS THE FACE OF `P` ON THE PASSED IN MOLD.
  ::
  P=ITEM
::
+*  LEST  [ITEM]
  ::    NULL-TERMINATED NON-EMPTY LIST
  ::
  ::  MOLD GENERATOR: PRODUCES A MOLD OF A NULL-TERMINATED LIST OF THE
  ::  HOMOGENEOUS TYPE {A} WITH AT LEAST ONE ELEMENT.
  [I/ITEM T/(LIST ITEM)]
::
++  MOLD
  ::    NORMALIZING GATE
  ::
  ::  A GATE THAT ACCEPTS ANY NOUN, AND VALIDATES ITS SHAPE, PRODUCING THE
  ::  INPUT IF IT FITS OR A DEFAULT VALUE IF IT DOESN'T.
  ::
  ::  EXAMPLES: * @UD ,[P=TIME Q=?(%A %B)]
  _|~(* +<)
::
+*  PAIR  [HEAD TAIL]
  ::    DUAL TUPLE
  ::
  ::  MOLD GENERATOR: PRODUCES A TUPLE OF THE TWO TYPES PASSED IN.
  ::
  ::  A: FIRST TYPE, LABELED {P}
  ::  B: SECOND TYPE, LABELED {Q}
  ::
  [P=HEAD Q=TAIL]
::
+*  POLE  [ITEM]
  ::    FACELESS LIST
  ::
  ::  LIKE ++LIST, BUT WITHOUT THE FACES {I} AND {T}.
  ::
  $@(~ [ITEM (POLE ITEM)])
::
+*  QUAL  [FIRST SECOND THIRD FOURTH]
  ::    QUADRUPLE TUPLE
  ::
  ::  MOLD GENERATOR: PRODUCES A TUPLE OF THE FOUR TYPES PASSED IN.
  ::
  [P=FIRST Q=SECOND R=THIRD S=FOURTH]
::
+*  QUIP  [ITEM STATE]
  ::    PAIR OF LIST OF FIRST AND SECOND
  ::
  ::  A COMMON PATTERN IN HOON CODE IS TO RETURN A ++LIST OF CHANGES, ALONG WITH
  ::  A NEW STATE.
  ::
  ::  A: TYPE OF LIST ITEM
  ::  B: TYPE OF RETURNED STATE
  ::
  [(LIST ITEM) STATE]
::
+*  TRAP  [PRODUCT]
  ::    A CORE WITH ONE ARM `$`
  ::
  _|?($:PRODUCT)
::
+*  TREE  [NODE]
  ::    TREE MOLD GENERATOR
  ::
  ::  A `++TREE` CAN BE EMPTY, OR CONTAIN A NODE OF A TYPE AND
  ::  LEFT/RIGHT SUB `++TREE` OF THE SAME TYPE. PRETTY-PRINTED WITH `{}`.
  ::
  $@(~ [N=NODE L=(TREE NODE) R=(TREE NODE)])
::
+*  TREL  [FIRST SECOND THIRD]
  ::    TRIPLE TUPLE
  ::
  ::  MOLD GENERATOR: PRODUCES A TUPLE OF THE THREE TYPES PASSED IN.
  ::
  [P=FIRST Q=SECOND R=THIRD]
::
+*  UNIT  [ITEM]
  ::    MAYBE
  ::
  ::  MOLD GENERATOR: EITHER `~` OR `[~ U=A]` WHERE `A` IS THE
  ::  TYPE THAT WAS PASSED IN.
  ::
  $@(~ [~ U=ITEM])
::
::                                                      ::
::::  2O: CONTAINERS                        ::
  ::                                                    ::
  ::
+*  JAR  [KEY VALUE]  (MAP KEY (LIST VALUE))            ::  MAP OF LISTS
+*  JUG  [KEY VALUE]  (MAP KEY (SET VALUE))             ::  MAP OF SETS
+*  MAP  [KEY VALUE]  (TREE (PAIR KEY VALUE))           ::  TABLE
+*  QEU  [ITEM]       (TREE ITEM)                       ::  QUEUE
+*  SET  [ITEM]       (TREE ITEM)                       ::  SET
::
::::  2Q: MOLDS AND MOLD BUILDERS                       ::
  ::                                                    ::
  ::
+$  AXIS  @                                             ::  TREE ADDRESS
+$  BEAN  ?                                             ::  0=&=YES, 1=|=NO
+$  FLAG  ?
+$  CHAR  @T                                            ::  UTF8 BYTE
+$  CORD  @T                                            ::  UTF8, LSB FIRST
+$  BYTS  [WID=@UD DAT=@]                               ::  BYTES, MSB FIRST
+$  DECO  ?($BL $BR $UN $~)                             ::  TEXT DECORATION
+$  DATE  {{A/? Y/@UD} M/@UD T/TARP}                    ::  PARSED DATE
+$  KNOT  @TA                                           ::  ASCII TEXT
+$  NOUN  *                                             ::  ANY NOUN
+$  PATH  (LIST KNOT)                                   ::  LIKE UNIX PATH
+$  STUD                                                ::  STANDARD NAME
          $@  MARK=@TAS                                 ::  AUTH=URBIT
          $:  AUTH=@TAS                                 ::  STANDARDS AUTHORITY
              TYPE=PATH                                 ::  STANDARD LABEL
          ==                                            ::
+$  STUB  (LIST (PAIR STYE (LIST @C)))                  ::  STYLED UNICODE
+$  STYE  (PAIR (SET DECO) (PAIR TINT TINT))            ::  DECOS/BG/FG
+$  STYL                                                ::  CASCADING STYLE
          %+  PAIR  (UNIT DECO)                         ::
          (PAIR (UNIT TINT) (UNIT TINT))                ::
::                                                      ::
+$  STYX  (LIST $@(@T (PAIR STYL STYX)))                ::  STYLED TEXT
+$  TILE  ::  XX: ?@(KNOT (PAIR STYL KNOT))
          ::
          CORD
+$  TINT  ?($R $G $B $C $M $Y $K $W $~)                 ::  TEXT COLOR
::
::  A `PLUM` IS THE INTERMEDIATE REPRESENTATION FOR THE PRETTY-PRINTER. IT
::  ENCODES HOON-SHAPED DATA WITH THE LEAST AMOUNT OF STRUCTURED NEEDED
::  FOR FORMATING.
::
::  A `PLUM` IS EITHER A
::
::  - `CORD`: A SIMPLE CORD
::  - `[%PARA *]`: A WRAPPABLE PARAGRAPH.
::  - `[%TREE *]`: A FORMATTED PLUM TREE
::  - `[%SBRK *]`: AN INDICATION OF A NESTED SUBEXPRESSION.
::
::  THE FORMATTER WILL USE THE TALL MODE UNLESS:
::
::    - A PLUM HAS ONLY A `WIDE` STYLE.
::    - THE PLUM IS IN `%SBRK` FORM AND ITS SUBPLUM (`KID`), WHEN
::      FORMATTED IN WIDE MODE, CAN FIT ON A SINGLE LINE.
::
+$  PLUM
  $@  CORD
  $%  [%PARA PREFIX=TILE LINES=(LIST @T)]
      [%TREE FMT=PLUMFMT KIDS=(LIST PLUM)]
      [%SBRK KID=PLUM]
  ==
::
::  A `PLUMFMT` IS A DESCRIPTION OF HOW TO RENDER A `PLUM`. A `PLUMFMT`
::  MUST INCLUDE A `WIDE`, A `TALL`, OR BOTH.
::
::  A `WIDE` IS A DESCRIPTION OF HOW TO RENDER A PLUM IN A SINGLE
::  LINE. THE NESTED (`KIDS`) SUB-PLUMS WILL BE INTERLEAVED WITH `DELIMIT`
::  STRINGS, AND, IF `ENCLOSE` IS SET, THEN THE OUTPUT WILL BE ENCLOSED
::  WITH `P.U.ENCLOSE` ABND `Q.U.ENCLOSE`.
::
::  FOR EXAMPLE, TO BUILD A PLUMFMT FOR STRING LITERALS, WE COULD WRITE:
::
::      [WIDE=[~ '' [~ '"' '"']] TALL=~]
::
::  A `TALL` IS A DESCRIPTION OF HOW TO RENDER A PLUM ACROSS MULTIPLE
::  LINES. THE OUTPUT WILL BE PREFIXED BY `INTRO`, SUFFIXED BY
::  `FINAL.U.INDEF`, AND EACH SUBPLUM PREFIXED BY `SIGIL.U.INDEF`.
::
::  FOR EXAMPLE, TO BUILD A PLUMFMT FOR CORES, WE COULD WRITE:
::
::      [WIDE=~ TALL=`['' `['++' '--']]]
::
+$  PLUMFMT
  $:  WIDE=(UNIT [DELIMIT=TILE ENCLOSE=(UNIT (PAIR TILE TILE))])
      TALL=(UNIT [INTRO=TILE INDEF=(UNIT [SIGIL=TILE FINAL=TILE])])
  ==
::
++  TANG  (LIST TANK)                                   ::  BOTTOM-FIRST ERROR
++  TANK  $~  [%LEAF ~]                                 ::
          $%  {$LEAF P/TAPE}                            ::  PRINTING FORMATS
              {$PLUM P/PLUM}                            ::
              $:  $PALM                                 ::  BACKSTEP LIST
                  P/{P/TAPE Q/TAPE R/TAPE S/TAPE}       ::
                  Q/(LIST TANK)                         ::
              ==                                        ::
              $:  $ROSE                                 ::  FLAT LIST
                  P/{P/TAPE Q/TAPE R/TAPE}              ::  MID OPEN CLOSE
                  Q/(LIST TANK)                         ::
              ==                                        ::
          ==                                            ::
++  TAPE  (LIST @TD)                                    ::  UTF8 STRING AS LIST
++  TOUR  (LIST @C)                                     ::  UTF32 CLUSTERS
++  TARP  {D/@UD H/@UD M/@UD S/@UD F/(LIST @UX)}        ::  PARSED TIME
++  TERM  @TAS                                          ::  ASCII SYMBOL
++  WAIN  (LIST CORD)                                   ::  TEXT LINES
++  WALL  (LIST TAPE)                                   ::  TEXT LINES
--  =>
::                                                      ::
::::  2: LAYER TWO                                      ::
  ::                                                    ::
  ::    2A: UNIT LOGIC                                  ::
  ::    2B: LIST LOGIC                                  ::
  ::    2C: BIT ARITHMETIC                              ::
  ::    2D: BIT LOGIC                                   ::
  ::    2E: INSECURE HASHING                            ::
  ::    2F: NOUN ORDERING                               ::
  ::    2G: UNSIGNED POWERS                             ::
  ::    2H: SET LOGIC                                   ::
  ::    2I: MAP LOGIC                                   ::
  ::    2J: JAR AND JUG LOGIC                           ::
  ::    2K: QUEUE LOGIC                                 ::
  ::    2L: CONTAINER FROM CONTAINER                    ::
  ::    2M: CONTAINER FROM NOUN                         ::
  ::    2N: FUNCTIONAL HACKS                            ::
  ::    2O: NORMALIZING CONTAINERS                      ::
  ::    2P: SERIALIZATION                               ::
  ::    2Q: MOLDS AND MOLD BUILDERS                     ::
  ::
~%  %TWO  +  ~
|%
::                                                      ::
::::  2A: UNIT LOGIC                                    ::
  ::                                                    ::
  ::    BIFF, BIND, BOND, BOTH, CLAP, DROP,             ::
  ::    FALL, FLIT, LIFT, MATE, NEED, SOME              ::
  ::
++  BIFF                                                ::  APPLY
  |*  {A/(UNIT) B/$-(* (UNIT))}
  ?~  A  ~
  (B U.A)
::
++  BIND                                                ::  ARGUE
  |*  {A/(UNIT) B/GATE}
  ?~  A  ~
  [~ U=(B U.A)]
::
++  BOND                                                ::  REPLACE
  |*  A/(TRAP)
  |*  B/(UNIT)
  ?~  B  $:A
  U.B
::
++  BOTH                                                ::  ALL THE ABOVE
  |*  {A/(UNIT) B/(UNIT)}
  ?~  A  ~
  ?~  B  ~
  [~ U=[U.A U.B]]
::
++  CLAP                                                ::  COMBINE
  |*  {A/(UNIT) B/(UNIT) C/_=>(~ |=(^ +<-))}
  ?~  A  B
  ?~  B  A
  [~ U=(C U.A U.B)]
::
++  CLEF                                                ::  COMPOSE
  |*  {A/(UNIT) B/(UNIT) C/_=>(~ |=(^ `+<-))}
  ?~  A  ~
  ?~  B  ~
  (C U.A U.B)
::
++  DROP                                                ::  ENLIST
  |*  A/(UNIT)
  ?~  A  ~
  [I=U.A T=~]
::
++  FALL                                                ::  DEFAULT
  |*  {A/(UNIT) B/*}
  ?~(A B U.A)
::
++  FLIT                                                ::  MAKE FILTER
  |*  A/$-(* ?)
  |*  B/*
  ?.((A B) ~ [~ U=B])
::
++  HUNT                                                ::  FIRST OF UNITS
  |*  [ORD=$-(^ ?) A=(UNIT) B=(UNIT)]
  ^-  %-  UNIT
      $?  _?>(?=(^ A) U.A)
          _?>(?=(^ B) U.B)
      ==
  ?~  A  B
  ?~  B  A
  ?:((ORD U.A U.B) A B)
::
++  LIFT                                                ::  LIFT MOLD (FMAP)
  |*  A/MOLD                                            ::  FLIPPED
  |*  B/(UNIT)                                          ::  CURRIED
  (BIND B A)                                            ::  BIND
::
++  MATE                                                ::  CHOOSE
  |*  {A/(UNIT) B/(UNIT)}
  ?~  B  A
  ?~  A  B
  ?.(=(U.A U.B) ~>(%MEAN.[%LEAF "MATE"] !!) A)
::
++  NEED                                                ::  DEMAND
  ~/  %NEED
  |*  A/(UNIT)
  ?~  A  ~>(%MEAN.[%LEAF "NEED"] !!)
  U.A
::
++  SOME                                                ::  LIFT (PURE)
  |*  A/*
  [~ U=A]
::
::::  2B: LIST LOGIC                                    ::
  ::                                                    ::
  ::                                                    ::
::
::  +SNOC APPEND AN ELEMENT TO THE END OF A LIST.
::
++  SNOC
  |*  [A/(LIST) B/*]
  (WELD A ^+(A [B]~))
::
++  FAND                                                ::  ALL INDICES
  ~/  %FAND
  |=  {NEDL/(LIST) HSTK/(LIST)}
  =|  I/@UD
  =|  FND/(LIST @UD)
  |-  ^+  FND
  =+  [N=NEDL H=HSTK]
  |-
  ?:  |(?=(~ N) ?=(~ H))
    (FLOP FND)
  ?:  =(I.N I.H)
    ?~  T.N
      ^$(I +(I), HSTK +.HSTK, FND [I FND])
    $(N T.N, H T.H)
  ^$(I +(I), HSTK +.HSTK)
::
++  FIND                                                ::  FIRST INDEX
  ~/  %FIND
  |=  {NEDL/(LIST) HSTK/(LIST)}
  =|  I/@UD
  |-   ^-  (UNIT @UD)
  =+  [N=NEDL H=HSTK]
  |-
  ?:  |(?=(~ N) ?=(~ H))
     ~
  ?:  =(I.N I.H)
    ?~  T.N
      `I
    $(N T.N, H T.H)
  ^$(I +(I), HSTK +.HSTK)
::
++  FLOP                                                ::  REVERSE
  ~/  %FLOP
  |*  A/(LIST)
  =>  .(A (HOMO A))
  ^+  A
  =+  B=`_A`~
  |-
  ?~  A  B
  $(A T.A, B [I.A B])
::
++  GULF                                                ::  RANGE INCLUSIVE
  |=  {A/@ B/@}
  ^-  (LIST @)
  ?:(=(A +(B)) ~ [A $(A +(A))])
::
++  HOMO                                                ::  HOMOGENIZE
  |*  A/(LIST)
  ^+  =<  $
    |@  ++  $  ?:(*? ~ [I=(SNAG 0 A) T=$])
    --
  A
::
++  LENT                                                ::  LENGTH
  ~/  %LENT
  |=  A/(LIST)
  ^-  @
  =+  B=0
  |-
  ?~  A  B
  $(A T.A, B +(B))
::
++  LEVY
  ~/  %LEVY                                             ::  ALL OF
  |*  {A/(LIST) B/$-(* ?)}
  |-  ^-  ?
  ?~  A  &
  ?.  (B I.A)  |
  $(A T.A)
::
++  LIEN                                                ::  SOME OF
  ~/  %LIEN
  |*  {A/(LIST) B/$-(* ?)}
  |-  ^-  ?
  ?~  A  |
  ?:  (B I.A)  &
  $(A T.A)
::
++  LIMO                                                ::  LISTIFY
  |*  A/*
  ^+  =<  $
    |@  ++  $  ?~(A ~ ?:(*? [I=-.A T=$] $(A +.A)))
    --
  A
::
++  MURN                                                ::  MAYBE TRANSFORM
  ~/  %MURN
  |*  {A/(LIST) B/$-(* (UNIT))}
  |-
  ?~  A  ~
  =+  C=(B I.A)
  ?~  C
    $(A T.A)
  [I=U.C T=$(A T.A)]
::
++  OUST                                                ::  REMOVE
  ~/  %OUST
  |*  {{A/@ B/@} C/(LIST)}
  (WELD (SCAG +<-< C) (SLAG (ADD +<-< +<->) C))
::
++  REAP                                                ::  REPLICATE
  ~/  %REAP
  |*  {A/@ B/*}
  |-  ^-  (LIST _B)
  ?~  A  ~
  [B $(A (DEC A))]
::
++  REEL                                                ::  RIGHT FOLD
  ~/  %REEL
  |*  {A/(LIST) B/_=>(~ |=({* *} +<+))}
  |-  ^+  ,.+<+.B
  ?~  A
    +<+.B
  (B I.A $(A T.A))
::
++  ROLL                                                ::  LEFT FOLD
  ~/  %ROLL
  |*  {A/(LIST) B/_=>(~ |=({* *} +<+))}
  |-  ^+  ,.+<+.B
  ?~  A
    +<+.B
  $(A T.A, B B(+<+ (B I.A +<+.B)))
::
++  SCAG                                                ::  PREFIX
  ~/  %SCAG
  |*  {A/@ B/(LIST)}
  |-  ^+  B
  ?:  |(?=(~ B) =(0 A))  ~
  [I.B $(B T.B, A (DEC A))]
::
++  SKID                                                ::  SEPARATE
  ~/  %SKID
  |*  {A/(LIST) B/$-(* ?)}
  |-  ^+  [P=A Q=A]
  ?~  A  [~ ~]
  =+  C=$(A T.A)
  ?:((B I.A) [[I.A P.C] Q.C] [P.C [I.A Q.C]])
::
++  SKIM                                                ::  ONLY
  ~/  %SKIM
  |*  {A/(LIST) B/$-(* ?)}
  |-
  ^+  A
  ?~  A  ~
  ?:((B I.A) [I.A $(A T.A)] $(A T.A))
::
++  SKIP                                                ::  EXCEPT
  ~/  %SKIP
  |*  {A/(LIST) B/$-(* ?)}
  |-
  ^+  A
  ?~  A  ~
  ?:((B I.A) $(A T.A) [I.A $(A T.A)])
::
++  SLAG                                                ::  SUFFIX
  ~/  %SLAG
  |*  {A/@ B/(LIST)}
  |-  ^+  B
  ?:  =(0 A)  B
  ?~  B  ~
  $(B T.B, A (DEC A))
::
++  SNAG                                                ::  INDEX
  ~/  %SNAG
  |*  {A/@ B/(LIST)}
  |-  ^+  ?>(?=(^ B) I.B)
  ?~  B
    ~_  LEAF+"SNAG-FAIL"
    !!
  ?:  =(0 A)  I.B
  $(B T.B, A (DEC A))
::
++  SORT  !.                                            ::  QUICKSORT
  ~/  %SORT
  |*  {A/(LIST) B/$-({* *} ?)}
  =>  .(A ^.(HOMO A))
  |-  ^+  A
  ?~  A  ~
  =+  S=(SKID T.A |:(C=I.A (B C I.A)))
  %+  WELD
    $(A P.S)
  ^+  T.A
  [I.A $(A Q.S)]
::
++  SPIN                                                ::  STATEFUL TURN
  ::
  ::  A: LIST
  ::  B: STATE
  ::  C: GATE FROM LIST-ITEM AND STATE TO PRODUCT AND NEW STATE
  ~/  %SPIN
  |*  [A=(LIST) B=* C=_|=(^ [** +<+])]
  =>  .(C `$-([_?>(?=(^ A) I.A) _B] [_-:(C) _B])`C)
  =/  ACC=(LIST _-:(C))  ~
  ::  TRANSFORMED LIST AND UPDATED STATE
  |-  ^-  (PAIR _ACC _B)
  ?~  A
    [(FLOP ACC) B]
  =^  RES  B  (C I.A B)
  $(ACC [RES ACC], A T.A)
::
++  SPUN                                                ::  INTERNAL SPIN
  ::
  ::  A: LIST
  ::  B: GATE FROM LIST-ITEM AND STATE TO PRODUCT AND NEW STATE
  ~/  %SPUN
  |*  [A=(LIST) B=_|=(^ [** +<+])]
  ::  TRANSFORMED LIST
  P:(SPIN A +<+.B B)
::
++  SWAG                                                ::  SLICE
  |*  {{A/@ B/@} C/(LIST)}
  (SCAG +<-> (SLAG +<-< C))
::  +TURN: TRANSFORM EACH VALUE OF LIST :A USING THE FUNCTION :B
::
++  TURN
  ~/  %TURN
  |*  [A=(LIST) B=GATE]
  =>  .(A (HOMO A))
  ^-  (LIST _?>(?=(^ A) (B I.A)))
  |-
  ?~  A  ~
  [I=(B I.A) T=$(A T.A)]
::
++  WELD                                                ::  CONCATENATE
  ~/  %WELD
  |*  {A/(LIST) B/(LIST)}
  =>  .(A ^.(HOMO A), B ^.(HOMO B))
  |-  ^+  B
  ?~  A  B
  [I.A $(A T.A)]
::
++  WELP                                                ::  FACELESS WELD
  =|  {* *}
  |@
  ++  $
    ?~  +<-
      +<-(. +<+)
    +<-(+ $(+<- +<->))
  --
::
++  ZING                                                ::  PROMOTE
  =|  *
  |@
  ++  $
    ?~  +<
      +<
    (WELP +<- $(+< +<+))
  --
::                                                      ::
::::  2C: BIT ARITHMETIC                                ::
  ::                                                    ::
  ::
++  BEX                                                 ::  BINARY EXPONENT
  ~/  %BEX
  |=  A/@
  ^-  @
  ?:  =(0 A)  1
  (MUL 2 $(A (DEC A)))
::
++  CAN                                                 ::  ASSEMBLE
  ~/  %CAN
  |=  {A/BLOQ B/(LIST {P/@U Q/@})}
  ^-  @
  ?~  B  0
  (ADD (END A P.I.B Q.I.B) (LSH A P.I.B $(B T.B)))
::
++  CAT                                                 ::  CONCATENATE
  ~/  %CAT
  |=  {A/BLOQ B/@ C/@}
  (ADD (LSH A (MET A B) C) B)
::
++  CUT                                                 ::  SLICE
  ~/  %CUT
  |=  {A/BLOQ {B/@U C/@U} D/@}
  (END A C (RSH A B D))
::
++  END                                                 ::  TAIL
  ~/  %END
  |=  {A/BLOQ B/@U C/@}
  (MOD C (BEX (MUL (BEX A) B)))
::
++  FIL                                                 ::  FILL BLOQSTREAM
  |=  {A/BLOQ B/@U C/@}
  =+  N=0
  =+  D=C
  |-  ^-  @
  ?:  =(N B)
    (RSH A 1 D)
  $(D (ADD C (LSH A 1 D)), N +(N))
::
++  LSH                                                 ::  LEFT-SHIFT
  ~/  %LSH
  |=  {A/BLOQ B/@U C/@}
  (MUL (BEX (MUL (BEX A) B)) C)
::
++  MET                                                 ::  MEASURE
  ~/  %MET
  |=  {A/BLOQ B/@}
  ^-  @
  =+  C=0
  |-
  ?:  =(0 B)  C
  $(B (RSH A 1 B), C +(C))
::
++  RAP                                                 ::  ASSEMBLE NONZERO
  ~/  %RAP
  |=  {A/BLOQ B/(LIST @)}
  ^-  @
  =+  ~  ::REMOVEME JET DASHBOARD BUMP
  ?~  B  0
  (CAT A I.B $(B T.B))
::
++  REP                                                 ::  ASSEMBLE SINGLE
  ~/  %REP
  |=  {A/BLOQ B/(LIST @)}
  ^-  @
  =+  C=0
  |-
  ?~  B  0
  (ADD (LSH A C (END A 1 I.B)) $(C +(C), B T.B))
::
++  REV
  ::  REVERSES BLOCK ORDER, ACCOUNTING FOR LEADING ZEROES
  ::
  ::  BOZ: BLOCK SIZE
  ::  LEN: SIZE OF DAT, IN BOZ
  ::  DAT: DATA TO FLIP
  ~/  %REV
  |=  [BOZ=BLOQ LEN=@UD DAT=@]
  ^-  @
  =.  DAT  (END BOZ LEN DAT)
  %^  LSH  BOZ
    (SUB LEN (MET BOZ DAT))
  (SWP BOZ DAT)
::
::  LIKE `RIP` BUT PRODUCES N-BIT BLOCKS INSTEAD OF 2^N BIT BLOCKS.
::
++  RIPN
  ~/  %RIPN
  |=  {BITS=@UD X=@}
  ^-  (LIST @)
  ?:  =(0 X)  ~
  [(END 0 BITS X) $(X (RSH 0 BITS X))]
::
++  RIP                                                 ::  DISASSEMBLE
  ~/  %RIP
  |=  {=BLOQ X=@}
  ^-  (LIST @)
  ?:  =(0 X)  ~
  [(END BLOQ 1 X) $(X (RSH BLOQ 1 X))]
::
++  RSH                                                 ::  RIGHT-SHIFT
  ~/  %RSH
  |=  {A/BLOQ B/@U C/@}
  (DIV C (BEX (MUL (BEX A) B)))
::
++  SWP                                                 ::  NAIVE REV BLOQ ORDER
  ~/  %SWP
  |=  {A/BLOQ B/@}
  (REP A (FLOP (RIP A B)))
::
++  XEB                                                 ::  BINARY LOGARITHM
  ~/  %XEB
  |=  A/@
  ^-  @
  (MET 0 A)
::
++  FE                                                  ::  MODULO BLOQ
  |_  A/BLOQ
  ++  DIF                                               ::  DIFFERENCE
    |=({B/@ C/@} (SIT (SUB (ADD OUT (SIT B)) (SIT C))))
  ++  INV  |=(B/@ (SUB (DEC OUT) (SIT B)))              ::  INVERSE
  ++  NET  |=  B/@  ^-  @                               ::  FLIP BYTE ENDIANNESS
           =>  .(B (SIT B))
           ?:  (LTE A 3)
             B
           =+  C=(DEC A)
           %+  CON
             (LSH C 1 $(A C, B (CUT C [0 1] B)))
           $(A C, B (CUT C [1 1] B))
  ++  OUT  (BEX (BEX A))                                ::  MOD VALUE
  ++  ROL  |=  {B/BLOQ C/@ D/@}  ^-  @                  ::  ROLL LEFT
           =+  E=(SIT D)
           =+  F=(BEX (SUB A B))
           =+  G=(MOD C F)
           (SIT (CON (LSH B G E) (RSH B (SUB F G) E)))
  ++  ROR  |=  {B/BLOQ C/@ D/@}  ^-  @                  ::  ROLL RIGHT
           =+  E=(SIT D)
           =+  F=(BEX (SUB A B))
           =+  G=(MOD C F)
           (SIT (CON (RSH B G E) (LSH B (SUB F G) E)))
  ++  SUM  |=({B/@ C/@} (SIT (ADD B C)))                ::  WRAPPING ADD
  ++  SIT  |=(B/@ (END A 1 B))                          ::  ENFORCE MODULO
  --
::                                                      ::
::::  2D: BIT LOGIC                                     ::
  ::                                                    ::
  ::
++  CON                                                 ::  BINARY OR
  ~/  %CON
  |=  {A/@ B/@}
  =+  [C=0 D=0]
  |-  ^-  @
  ?:  ?&(=(0 A) =(0 B))  D
  %=  $
    A   (RSH 0 1 A)
    B   (RSH 0 1 B)
    C   +(C)
    D   %+  ADD  D
          %^  LSH  0  C
          ?&  =(0 (END 0 1 A))
              =(0 (END 0 1 B))
          ==
  ==
::
++  DIS                                                 ::  BINARY AND
  ~/  %DIS
  |=  {A/@ B/@}
  =|  {C/@ D/@}
  |-  ^-  @
  ?:  ?|(=(0 A) =(0 B))  D
  %=  $
    A   (RSH 0 1 A)
    B   (RSH 0 1 B)
    C   +(C)
    D   %+  ADD  D
          %^  LSH  0  C
          ?|  =(0 (END 0 1 A))
              =(0 (END 0 1 B))
          ==
  ==
::
++  MIX                                                 ::  BINARY XOR
  ~/  %MIX
  |=  {A/@ B/@}
  ^-  @
  =+  [C=0 D=0]
  |-
  ?:  ?&(=(0 A) =(0 B))  D
  %=  $
    A   (RSH 0 1 A)
    B   (RSH 0 1 B)
    C   +(C)
    D   (ADD D (LSH 0 C =((END 0 1 A) (END 0 1 B))))
  ==
::
++  NOT  |=  {A/BLOQ B/@ C/@}                           ::  BINARY NOT (SIZED)
  (MIX C (DEC (BEX (MUL B (BEX A)))))
::                                                      ::
::::  2E: INSECURE HASHING                              ::
  ::                                                    ::
  ::
++  MUK                                                 ::  STANDARD MURMUR3
  ~%  %MUK  ..MUK  ~
  =+  ~(. FE 5)
  |=  {SYD/@ LEN/@ KEY/@}
  ?>  &((LTE (MET 5 SYD) 1) (LTE (MET 0 LEN) 31))
  =/  PAD      (SUB LEN (MET 3 KEY))
  =/  DATA     (WELD (RIP 3 KEY) (REAP PAD 0))
  =/  NBLOCKS  (DIV LEN 4)  ::  INTENTIONALLY OFF-BY-ONE
  =/  H1  SYD
  =+  [C1=0XCC9E.2D51 C2=0X1B87.3593]
  =/  BLOCKS  (RIP 5 KEY)
  =/  I  NBLOCKS
  =.  H1  =/  HI  H1  |-
    ?:  =(0 I)  HI
    =/  K1  (SNAG (SUB NBLOCKS I) BLOCKS)  ::  NEGATIVE ARRAY INDEX
    =.  K1  (SIT (MUL K1 C1))
    =.  K1  (ROL 0 15 K1)
    =.  K1  (SIT (MUL K1 C2))
    =.  HI  (MIX HI K1)
    =.  HI  (ROL 0 13 HI)
    =.  HI  (SUM (SIT (MUL HI 5)) 0XE654.6B64)
    $(I (DEC I))
  =/  TAIL  (SLAG (MUL 4 NBLOCKS) DATA)
  =/  K1    0
  =/  TLEN  (DIS LEN 3)
  =.  H1
    ?+  TLEN  H1  ::  FALLTHROUGH SWITCH
      $3  =.  K1  (MIX K1 (LSH 0 16 (SNAG 2 TAIL)))
          =.  K1  (MIX K1 (LSH 0 8 (SNAG 1 TAIL)))
          =.  K1  (MIX K1 (SNAG 0 TAIL))
          =.  K1  (SIT (MUL K1 C1))
          =.  K1  (ROL 0 15 K1)
          =.  K1  (SIT (MUL K1 C2))
          (MIX H1 K1)
      $2  =.  K1  (MIX K1 (LSH 0 8 (SNAG 1 TAIL)))
          =.  K1  (MIX K1 (SNAG 0 TAIL))
          =.  K1  (SIT (MUL K1 C1))
          =.  K1  (ROL 0 15 K1)
          =.  K1  (SIT (MUL K1 C2))
          (MIX H1 K1)
      $1  =.  K1  (MIX K1 (SNAG 0 TAIL))
          =.  K1  (SIT (MUL K1 C1))
          =.  K1  (ROL 0 15 K1)
          =.  K1  (SIT (MUL K1 C2))
          (MIX H1 K1)
    ==
  =.  H1  (MIX H1 LEN)
  |^  (FMIX32 H1)
  ++  FMIX32
    |=  H/@
    =.  H  (MIX H (RSH 0 16 H))
    =.  H  (SIT (MUL H 0X85EB.CA6B))
    =.  H  (MIX H (RSH 0 13 H))
    =.  H  (SIT (MUL H 0XC2B2.AE35))
    =.  H  (MIX H (RSH 0 16 H))
    H
  --
::
++  MUG                                                 ::  MUG WITH MURMUR3
  ~/  %MUG
  |=  A/*
  |^  (TRIM ?@(A A (MIX $(A -.A) (MIX 0X7FFF.FFFF $(A +.A)))))
  ++  TRIM                                              ::  31-BIT NONZERO
    |=  KEY/@
    =+  SYD=0XCAFE.BABE
    |-  ^-  @
    =+  HAZ=(MUK SYD (MET 3 KEY) KEY)
    =+  HAM=(MIX (RSH 0 31 HAZ) (END 0 31 HAZ))
    ?.(=(0 HAM) HAM $(SYD +(SYD)))
  --
::                                                      ::
::::  2F: NOUN ORDERING                                 ::
  ::                                                    ::
  ::    AOR, DOR, GOR, MOR                              ::
  ::
::  +AOR: ALPHABETICAL ORDER
::
::    ORDERS ATOMS BEFORE CELLS, AND ATOMS IN ASCENDING LSB ORDER.
::
++  AOR
  ~/  %AOR
  |=  {A/* B/*}
  ^-  ?
  ?:  =(A B)  &
  ?.  ?=(@ A)
    ?:  ?=(@ B)  |
    ?:  =(-.A -.B)
      $(A +.A, B +.B)
    $(A -.A, B -.B)
  ?.  ?=(@ B)  &
  |-
  =+  [C=(END 3 1 A) D=(END 3 1 B)]
  ?:  =(C D)
    $(A (RSH 3 1 A), B (RSH 3 1 B))
  (LTH C D)
::  +DOR: DEPTH ORDER
::
::    ORDERS IN ASCENDING TREE DEPTH.
::
++  DOR
  ~/  %DOR
  |=  {A/* B/*}
  ^-  ?
  ?:  =(A B)  &
  ?.  ?=(@ A)
    ?:  ?=(@ B)  |
    ?:  =(-.A -.B)
      $(A +.A, B +.B)
    $(A -.A, B -.B)
  ?.  ?=(@ B)  &
  (LTH A B)
::  +GOR: MUG ORDER
::
::    ORDERS IN ASCENDING +MUG HASH ORDER, COLLISIONS FALL BACK TO +DOR.
::
++  GOR
  ~/  %GOR
  |=  {A/* B/*}
  ^-  ?
  =+  [C=(MUG A) D=(MUG B)]
  ?:  =(C D)
    (DOR A B)
  (LTH C D)
::  +MOR: (MORE) MUG ORDER
::
::    ORDERS IN ASCENDING DOUBLE +MUG HASH ORDER, COLLISIONS FALL BACK TO +DOR.
::
++  MOR
  ~/  %MOR
  |=  {A/* B/*}
  ^-  ?
  =+  [C=(MUG (MUG A)) D=(MUG (MUG B))]
  ?:  =(C D)
    (DOR A B)
  (LTH C D)
::                                                      ::
::::                                                    ::
  ::  2G: UNSIGNED POWERS                               ::
  ::                                                    ::
  ::
++  POW                                                 ::  UNSIGNED EXPONENT
  ~/  %POW
  |=  {A/@ B/@}
  ?:  =(B 0)  1
  |-  ?:  =(B 1)  A
  =+  C=$(B (DIV B 2))
  =+  D=(MUL C C)
  ?~  (DIS B 1)  D  (MUL D A)
::
++  SQT                                                 ::  UNSIGNED SQRT/REM
  ~/  %SQT
  |=  A/@  ^-  {P/@ Q/@}
  ?~  A  [0 0]
  =+  [Q=(DIV (DEC (XEB A)) 2) R=0]
  =-  [-.B (SUB A +.B)]
  ^=  B  |-
  =+  S=(ADD R (BEX Q))
  =+  T=(MUL S S)
  ?:  =(Q 0)
    ?:((LTE T A) [S T] [R (MUL R R)])
  ?:  (LTE T A)
    $(R S, Q (DEC Q))
  $(Q (DEC Q))
::                                                      ::
::::                                                    ::
  ::                                                    ::
  ::  2H: SET LOGIC                                     ::
  ::                                                    ::
  ::
++  IN                                                  ::  SET ENGINE
  ~/  %IN
  =|  A/(TREE)  :: (SET)
  |@
  ++  ALL                                               ::  LOGICAL AND
    ~/  %ALL
    |*  B/$-(* ?)
    |-  ^-  ?
    ?~  A
      &
    ?&((B N.A) $(A L.A) $(A R.A))
  ::
  ++  ANY                                               ::  LOGICAL OR
    ~/  %ANY
    |*  B/$-(* ?)
    |-  ^-  ?
    ?~  A
      |
    ?|((B N.A) $(A L.A) $(A R.A))
  ::
  ++  APT                                               ::  CHECK CORRECTNESS
    =|  {L/(UNIT) R/(UNIT)}
    |-  ^-  ?
    ?~  A   &
    ?&  ?~(L & (GOR N.A U.L))
        ?~(R & (GOR U.R N.A))
        ?~(L.A & ?&((MOR N.A N.L.A) $(A L.A, L `N.A)))
        ?~(R.A & ?&((MOR N.A N.R.A) $(A R.A, R `N.A)))
    ==
  ::
  ++  BIF                                               ::  SPLITS A BY B
    ~/  %BIF
    |*  B/*
    ^+  [L=A R=A]
    =<  +
    |-  ^+  A
    ?~  A
      [B ~ ~]
    ?:  =(B N.A)
      A
    ?:  (GOR B N.A)
      =+  C=$(A L.A)
      ?>  ?=(^ C)
      [N.C L.C [N.A R.C R.A]]
    =+  C=$(A R.A)
    ?>  ?=(^ C)
    [N.C [N.A L.A L.C] R.C]
  ::
  ++  DEL                                               ::  B WITHOUT ANY A
    ~/  %DEL
    |*  B/*
    |-  ^+  A
    ?~  A
      ~
    ?.  =(B N.A)
      ?:  (GOR B N.A)
        [N.A $(A L.A) R.A]
      [N.A L.A $(A R.A)]
    |-  ^-  {$?(~ _A)}
    ?~  L.A  R.A
    ?~  R.A  L.A
    ?:  (MOR N.L.A N.R.A)
      [N.L.A L.L.A $(L.A R.L.A)]
    [N.R.A $(R.A L.R.A) R.R.A]
  ::
  ++  DIF                                               ::  DIFFERENCE
    ~/  %DIF
    =+  B=A
    |@
    ++  $
      |-  ^+  A
      ?~  B
        A
      =+  C=(BIF N.B)
      ?>  ?=(^ C)
      =+  D=$(A L.C, B L.B)
      =+  E=$(A R.C, B R.B)
      |-  ^-  {$?(~ _A)}
      ?~  D  E
      ?~  E  D
      ?:  (MOR N.D N.E)
        [N.D L.D $(D R.D)]
      [N.E $(E L.E) R.E]
    --
  ::
  ++  DIG                                               ::  AXIS OF A IN B
    |=  B/*
    =+  C=1
    |-  ^-  (UNIT @)
    ?~  A  ~
    ?:  =(B N.A)  [~ U=(PEG C 2)]
    ?:  (GOR B N.A)
      $(A L.A, C (PEG C 6))
    $(A R.A, C (PEG C 7))
  ::
  ++  GAS                                               ::  CONCATENATE
    ~/  %GAS
    |=  B/(LIST _?>(?=(^ A) N.A))
    |-  ^+  A
    ?~  B
      A
    $(B T.B, A (PUT I.B))
  ::  +HAS: DOES :B EXIST IN :A?
  ::
  ++  HAS
    ~/  %HAS
    |*  B=*
    ^-  ?
    ::  WRAP EXTRACTED ITEM TYPE IN A UNIT BECAUSE BUNTING FAILS
    ::
    ::    IF WE USED THE REAL ITEM TYPE OF _?^(A N.A !!) AS THE SAMPLE TYPE,
    ::    THEN HOON WOULD BUNT IT TO CREATE THE DEFAULT SAMPLE FOR THE GATE.
    ::
    ::    HOWEVER, BUNTING THAT EXPRESSION FAILS IF :A IS ~. IF WE WRAP IT
    ::    IN A UNIT, THE BUNTED UNIT DOESN'T INCLUDE THE BUNTED ITEM TYPE.
    ::
    ::    THIS WAY WE CAN ENSURE TYPE SAFETY OF :B WITHOUT NEEDING TO PERFORM
    ::    THIS FAILING BUNT. IT'S A HACK.
    ::
    %.  [~ B]
    |=  B=(UNIT _?>(?=(^ A) N.A))
    =>  .(B ?>(?=(^ B) U.B))
    |-  ^-  ?
    ?~  A
      |
    ?:  =(B N.A)
      &
    ?:  (GOR B N.A)
      $(A L.A)
    $(A R.A)
  ::
  ++  INT                                               ::  INTERSECTION
    ~/  %INT
    =+  B=A
    |@
    ++  $
      |-  ^+  A
      ?~  B
        ~
      ?~  A
        ~
      ?.  (MOR N.A N.B)
        $(A B, B A)
      ?:  =(N.B N.A)
        [N.A $(A L.A, B L.B) $(A R.A, B R.B)]
      ?:  (GOR N.B N.A)
        %-  UNI(A $(A L.A, B [N.B L.B ~]))  $(B R.B)
      %-  UNI(A $(A R.A, B [N.B ~ R.B]))  $(B L.B)
    --
  ::
  ++  PUT                                               ::  PUTS B IN A, SORTED
    ~/  %PUT
    |*  B/*
    |-  ^+  A
    ?~  A
      [B ~ ~]
    ?:  =(B N.A)
      A
    ?:  (GOR B N.A)
      =+  C=$(A L.A)
      ?>  ?=(^ C)
      ?:  (MOR N.A N.C)
        [N.A C R.A]
      [N.C L.C [N.A R.C R.A]]
    =+  C=$(A R.A)
    ?>  ?=(^ C)
    ?:  (MOR N.A N.C)
      [N.A L.A C]
    [N.C [N.A L.A L.C] R.C]
  ::
  ++  REP                                               ::  REPLACE BY PRODUCT
    |*  B/_=>(~ |=({* *} +<+))
    |-
    ?~  A  +<+.B
    $(A R.A, +<+.B $(A L.A, +<+.B (B N.A +<+.B)))
  ::
  ++  RUN                                               ::  APPLY GATE TO VALUES
    ~/  %RUN
    |*  B/GATE
    =+  C=`(SET _?>(?=(^ A) (B N.A)))`~
    |-  ?~  A  C
    =.  C  (~(PUT IN C) (B N.A))
    =.  C  $(A L.A, C C)
    $(A R.A, C C)
  ::
  ++  TAP                                               ::  CONVERT TO LIST
    =<  $
    ~/  %TAP
    =+  B=`(LIST _?>(?=(^ A) N.A))`~
    |.  ^+  B
    ?~  A
      B
    $(A R.A, B [N.A $(A L.A)])
  ::
  ++  UNI                                               ::  UNION
    ~/  %UNI
    =+  B=A
    |@
    ++  $
      ?:  =(A B)  A
      |-  ^+  A
      ?~  B
        A
      ?~  A
        B
      ?:  (MOR N.A N.B)
        ?:  =(N.B N.A)
          [N.B $(A L.A, B L.B) $(A R.A, B R.B)]
        ?:  (GOR N.B N.A)
          $(A [N.A $(A L.A, B [N.B L.B ~]) R.A], B R.B)
        $(A [N.A L.A $(A R.A, B [N.B ~ R.B])], B L.B)
      ?:  =(N.A N.B)
        [N.B $(B L.B, A L.A) $(B R.B, A R.A)]
      ?:  (GOR N.A N.B)
        $(B [N.B $(B L.B, A [N.A L.A ~]) R.B], A R.A)
      $(B [N.B L.B $(B R.B, A [N.A ~ R.A])], A L.A)
    --
  ::
  ++  WYT                                               ::  SIZE OF SET
    =<  $
    ~%  %WYT  +  ~
    |.  ^-  @
    ?~(A 0 +((ADD $(A L.A) $(A R.A))))
  --
::                                                      ::
::::  2I: MAP LOGIC                                     ::
  ::                                                    ::
  ::
++  BY                                                  ::  MAP ENGINE
  ~/  %BY
  =|  A/(TREE (PAIR))  ::  (MAP)
  =*  NODE  ?>(?=(^ A) N.A)
  |@
  ++  ALL                                               ::  LOGICAL AND
    ~/  %ALL
    |*  B/$-(* ?)
    |-  ^-  ?
    ?~  A
      &
    ?&((B Q.N.A) $(A L.A) $(A R.A))
  ::
  ++  ANY                                               ::  LOGICAL OR
    ~/  %ANY
    |*  B/$-(* ?)
    |-  ^-  ?
    ?~  A
      |
    ?|((B Q.N.A) $(A L.A) $(A R.A))
  ::
  ++  BIF                                               ::  SPLITS A BY B
    ~/  %BIF
    |*  {B/* C/*}
    ^+  [L=A R=A]
    =<  +
    |-  ^+  A
    ?~  A
      [[B C] ~ ~]
    ?:  =(B P.N.A)
      ?:  =(C Q.N.A)
        A
      [[B C] L.A R.A]
    ?:  (GOR B P.N.A)
      =+  D=$(A L.A)
      ?>  ?=(^ D)
      [N.D L.D [N.A R.D R.A]]
    =+  D=$(A R.A)
    ?>  ?=(^ D)
    [N.D [N.A L.A L.D] R.D]
  ::
  ++  DEL                                               ::  DELETE AT KEY B
    ~/  %DEL
    |*  B/*
    |-  ^+  A
    ?~  A
      ~
    ?.  =(B P.N.A)
      ?:  (GOR B P.N.A)
        [N.A $(A L.A) R.A]
      [N.A L.A $(A R.A)]
    |-  ^-  {$?(~ _A)}
    ?~  L.A  R.A
    ?~  R.A  L.A
    ?:  (MOR P.N.L.A P.N.R.A)
      [N.L.A L.L.A $(L.A R.L.A)]
    [N.R.A $(R.A L.R.A) R.R.A]
  ::
  ++  DIF                                               ::  DIFFERENCE
    ~/  %DIF
    =+  B=A
    |@
    ++  $
      |-  ^+  A
      ?~  B
        A
      =+  C=(BIF P.N.B Q.N.B)
      ?>  ?=(^ C)
      =+  D=$(A L.C, B L.B)
      =+  E=$(A R.C, B R.B)
      |-  ^-  {$?(~ _A)}
      ?~  D  E
      ?~  E  D
      ?:  (MOR P.N.D P.N.E)
        [N.D L.D $(D R.D)]
      [N.E $(E L.E) R.E]
    --
  ::
  ++  DIG                                               ::  AXIS OF B KEY
    |=  B/*
    =+  C=1
    |-  ^-  (UNIT @)
    ?~  A  ~
    ?:  =(B P.N.A)  [~ U=(PEG C 2)]
    ?:  (GOR B P.N.A)
      $(A L.A, C (PEG C 6))
    $(A R.A, C (PEG C 7))
  ::
  ++  APT                                               ::  CHECK CORRECTNESS
    =|  {L/(UNIT) R/(UNIT)}
    |-  ^-  ?
    ?~  A   &
    ?&  ?~(L & (GOR P.N.A U.L))
        ?~(R & (GOR U.R P.N.A))
        ?~(L.A & ?&((MOR P.N.A P.N.L.A) $(A L.A, L `P.N.A)))
        ?~(R.A & ?&((MOR P.N.A P.N.R.A) $(A R.A, R `P.N.A)))
    ==
  ::
  ++  GAS                                               ::  CONCATENATE
    ~/  %GAS
    |*  B/(LIST {P/* Q/*})
    =>  .(B `(LIST _?>(?=(^ A) N.A))`B)
    |-  ^+  A
    ?~  B
      A
    $(B T.B, A (PUT P.I.B Q.I.B))
  ::
  ++  GET                                               ::  GRAB VALUE BY KEY
    ~/  %GET
    |=  B/*
    ^-  {$@(~ {~ U/_?>(?=(^ A) Q.N.A)})}
    =+  42
    ?~  A
      ~
    ?:  =(B P.N.A)
      [~ U=Q.N.A]
    ?:  (GOR B P.N.A)
      $(A L.A)
    $(A R.A)
  ::
  ++  GOT
    |*  B/*
    (NEED (GET B))
  ::
  ++  HAS                                               ::  KEY EXISTENCE CHECK
    ~/  %HAS
    |*  B/*
    !=(~ (GET B))
  ::
  ++  INT                                               ::  INTERSECTION
    ~/  %INT
    =+  B=A
    |@
    ++  $
      |-  ^+  A
      ?~  B
        ~
      ?~  A
        ~
      ?:  (MOR P.N.A P.N.B)
        ?:  =(P.N.B P.N.A)
          [N.B $(A L.A, B L.B) $(A R.A, B R.B)]
        ?:  (GOR P.N.B P.N.A)
          %-  UNI(A $(A L.A, B [N.B L.B ~]))  $(B R.B)
        %-  UNI(A $(A R.A, B [N.B ~ R.B]))  $(B L.B)
      ?:  =(P.N.A P.N.B)
        [N.B $(B L.B, A L.A) $(B R.B, A R.A)]
      ?:  (GOR P.N.A P.N.B)
        %-  UNI(A $(B L.B, A [N.A L.A ~]))  $(A R.A)
      %-  UNI(A $(B R.B, A [N.A ~ R.A]))  $(A L.A)
    --
  ::
  ++  JAB
    ~/  %JAB
    |*  [KEY=_?>(?=(^ A) P.N.A) FUN=$-(_?>(?=(^ A) Q.N.A) _?>(?=(^ A) Q.N.A))]
    ^+  A
    ::
    ?~  A  !!
    ::
    ?:  =(KEY P.N.A)
      A(Q.N (FUN Q.N.A))
    ::
    ?:  (GOR KEY P.N.A)
      A(L $(A L.A))
    ::
    A(R $(A R.A))
  ::
  ++  MAR                                               ::  ADD WITH VALIDATION
    |*  {B/* C/(UNIT *)}
    ?~  C
      (DEL B)
    (PUT B U.C)
  ::
  ++  PUT                                               ::  ADDS KEY-VALUE PAIR
    ~/  %PUT
    |*  {B/* C/*}
    |-  ^+  A
    ?~  A
      [[B C] ~ ~]
    ?:  =(B P.N.A)
      ?:  =(C Q.N.A)
        A
      [[B C] L.A R.A]
    ?:  (GOR B P.N.A)
      =+  D=$(A L.A)
      ?>  ?=(^ D)
      ?:  (MOR P.N.A P.N.D)
        [N.A D R.A]
      [N.D L.D [N.A R.D R.A]]
    =+  D=$(A R.A)
    ?>  ?=(^ D)
    ?:  (MOR P.N.A P.N.D)
      [N.A L.A D]
    [N.D [N.A L.A L.D] R.D]
  ::
  ++  REP                                               ::  REPLACE BY PRODUCT
    |*  B/_=>(~ |=({* *} +<+))
    |-
    ?~  A  +<+.B
    $(A R.A, +<+.B $(A L.A, +<+.B (B N.A +<+.B)))
  ::
  ++  RIB                                               ::  TRANSFORM + PRODUCT
    |*  {B/* C/GATE}
    |-  ^+  [B A]
    ?~  A  [B ~]
    =+  D=(C N.A B)
    =.  N.A  +.D
    =+  E=$(A L.A, B -.D)
    =+  F=$(A R.A, B -.E)
    [-.F [N.A +.E +.F]]
  ::
  ++  RUN                                               ::  APPLY GATE TO VALUES
    |*  B/GATE
    |-
    ?~  A  A
    [N=[P=P.N.A Q=(B Q.N.A)] L=$(A L.A) R=$(A R.A)]
  ::
  ++  RUT                                               ::  APPLY GATE TO NODES
    |*  B/GATE
    |-
    ?~  A  A
    [N=[P=P.N.A Q=(B P.N.A Q.N.A)] L=$(A L.A) R=$(A R.A)]
  ::
  ++  TAP                                               ::  LISTIFY PAIRS
    =<  $
    ~/  %TAP
    =+  B=`(LIST _?>(?=(^ A) N.A))`~
    |.  ^+  B
    ?~  A
      B
    $(A R.A, B [N.A $(A L.A)])
  ::
  ++  UNI                                               ::  UNION, MERGE
    ~/  %UNI
    =+  B=A
    |@
    ++  $
      |-  ^+  A
      ?~  B
        A
      ?~  A
        B
      ?:  (MOR P.N.A P.N.B)
        ?:  =(P.N.B P.N.A)
          [N.B $(A L.A, B L.B) $(A R.A, B R.B)]
        ?:  (GOR P.N.B P.N.A)
          $(A [N.A $(A L.A, B [N.B L.B ~]) R.A], B R.B)
        $(A [N.A L.A $(A R.A, B [N.B ~ R.B])], B L.B)
      ?:  =(P.N.A P.N.B)
        [N.B $(B L.B, A L.A) $(B R.B, A R.A)]
      ?:  (GOR P.N.A P.N.B)
        $(B [N.B $(B L.B, A [N.A L.A ~]) R.B], A R.A)
      $(B [N.B L.B $(B R.B, A [N.A ~ R.A])], A L.A)
    --
  ::
  ++  UNO                                               ::  GENERAL UNION
    =+  B=A
    |@
    ++  $
      |=  MEG/$-({_P:NODE _Q:NODE _Q:NODE} _Q:NODE)
      |-  ^+  A
      ?~  B
        A
      ?~  A
        B
      ?:  (MOR P.N.A P.N.B)
        ?:  =(P.N.B P.N.A)
          [N.B $(A L.A, B L.B) $(A R.A, B R.B)]
        ?:  (GOR P.N.B P.N.A)
          $(A [N.A $(A L.A, B [N.B L.B ~]) R.A], B R.B)
        $(A [N.A L.A $(A R.A, B [N.B ~ R.B])], B L.B)
      ?:  =(P.N.A P.N.B)
        :+  [P.N.A (MEG P.N.A Q.N.A Q.N.B)]
          $(B L.B, A L.A)
        $(B R.B, A R.A)
      ?:  (GOR P.N.A P.N.B)
        $(B [N.B $(B L.B, A [N.A L.A ~]) R.B], A R.A)
      $(B [N.B L.B $(B R.B, A [N.A ~ R.A])], A L.A)
    --
  ::
  ::
  ++  URN                                               ::  APPLY GATE TO NODES
    |*  B/$-({* *} *)
    |-
    ?~  A  ~
    [N=[P=P.N.A Q=(B P.N.A Q.N.A)] L=$(A L.A) R=$(A R.A)]
  ::
  ++  WYT                                               ::  DEPTH OF MAP
    |-  ^-  @
    ?~(A 0 +((ADD $(A L.A) $(A R.A))))
  ::
  ++  KEY                                               ::  SET OF KEYS
    =+  B=`(SET _?>(?=(^ A) P.N.A))`~
    |-  ^+  B
    ?~  A   B
    $(A R.A, B $(A L.A, B (~(PUT IN B) P.N.A)))
  ::
  ++  VAL                                               ::  LIST OF VALS
    =+  B=`(LIST _?>(?=(^ A) Q.N.A))`~
    |-  ^+  B
    ?~  A   B
    $(A R.A, B [Q.N.A $(A L.A)])
  --
::                                                      ::
::::  2J: JAR AND JUG LOGIC                             ::
  ::                                                    ::
  ::
++  JA                                                  ::  JAR ENGINE
  =|  A/(TREE (PAIR * (LIST)))  ::  (JAR)
  |@
  ++  GET                                               ::  GETS LIST BY KEY
    |*  B/*
    =+  C=(~(GET BY A) B)
    ?~(C ~ U.C)
  ::
  ++  ADD                                               ::  ADDS KEY-LIST PAIR
    |*  {B/* C/*}
    =+  D=(GET B)
    (~(PUT BY A) B [C D])
  --
++  JU                                                  ::  JUG ENGINE
  =|  A/(TREE (PAIR * (TREE)))  ::  (JUG)
  |@
  ++  DEL                                               ::  DEL KEY-SET PAIR
    |*  {B/* C/*}
    ^+  A
    =+  D=(GET B)
    =+  E=(~(DEL IN D) C)
    ?~  E
      (~(DEL BY A) B)
    (~(PUT BY A) B E)
  ::
  ++  GAS                                               ::  CONCATENATE
    |*  B/(LIST {P/* Q/*})
    =>  .(B `(LIST _?>(?=({{* ^} ^} A) [P=P Q=N.Q]:N.A))`B)
    |-  ^+  A
    ?~  B
      A
    $(B T.B, A (PUT P.I.B Q.I.B))
  ::
  ++  GET                                               ::  GETS SET BY KEY
    |*  B/*
    =+  C=(~(GET BY A) B)
    ?~(C ~ U.C)
  ::
  ++  HAS                                               ::  EXISTENCE CHECK
    |*  {B/* C/*}
    ^-  ?
    (~(HAS IN (GET B)) C)
  ::
  ++  PUT                                               ::  ADD KEY-SET PAIR
    |*  {B/* C/*}
    ^+  A
    =+  D=(GET B)
    (~(PUT BY A) B (~(PUT IN D) C))
  --
::                                                      ::
::::  2K: QUEUE LOGIC                                   ::
  ::                                                    ::
  ::
++  TO                                                  ::  QUEUE ENGINE
  =|  A/(TREE)  ::  (QEU)
  |@
  ++  BAL
    |-  ^+  A
    ?~  A  ~
    ?.  |(?=(~ L.A) (MOR N.A N.L.A))
      $(A [N.L.A L.L.A $(A [N.A R.L.A R.A])])
    ?.  |(?=(~ R.A) (MOR N.A N.R.A))
      $(A [N.R.A $(A [N.A L.A L.R.A]) R.R.A])
    A
  ::
  ++  DEP                                               ::  MAX DEPTH OF QUEUE
    |-  ^-  @
    ?~  A  0
    +((MAX $(A L.A) $(A R.A)))
  ::
  ++  GAS                                               ::  INSERT LIST TO QUE
    |=  B/(LIST _?>(?=(^ A) N.A))
    |-  ^+  A
    ?~(B A $(B T.B, A (PUT I.B)))
  ::
  ++  GET                                               ::  HEAD-REST PAIR
    |-  ^+  ?>(?=(^ A) [P=N.A Q=*(TREE _N.A)])
    ?~  A
      !!
    ?~  R.A
      [N.A L.A]
    =+  B=$(A R.A)
    :-  P.B
    ?:  |(?=(~ Q.B) (MOR N.A N.Q.B))
      [N.A L.A Q.B]
    [N.Q.B [N.A L.A L.Q.B] R.Q.B]
  ::
  ++  NIP                                               ::  REMOVE ROOT
    |-  ^+  A
    ?~  A  ~
    ?~  L.A  R.A
    ?~  R.A  L.A
    ?:  (MOR N.L.A N.R.A)
      [N.L.A L.L.A $(L.A R.L.A)]
    [N.R.A $(R.A L.R.A) R.R.A]
  ::
  ++  NAP                                               ::  REMOVES HEAD
    ?>  ?=(^ A)
    ?:  =(~ L.A)  R.A
    =+  B=GET(A L.A)
    BAL(A ^+(A [P.B Q.B R.A]))
  ::
  ++  PUT                                               ::  INSERT NEW TAIL
    |*  B/*
    |-  ^+  A
    ?~  A
      [B ~ ~]
    BAL(A A(L $(A L.A)))
  ::
  ++  TAP                                               ::  ADDS LIST TO END
    =+  B=`(LIST _?>(?=(^ A) N.A))`~
    |-  ^+  B
    =+  0                                               ::  HACK FOR JET MATCH
    ?~  A
      B
    $(A R.A, B [N.A $(A L.A)])
  ::
  ++  TOP                                               ::  PRODUCES HEAD
    |-  ^-  (UNIT _?>(?=(^ A) N.A))
    ?~  A  ~
    ?~(R.A [~ N.A] $(A R.A))
  --
::                                                      ::
::::  2L: CONTAINER FROM CONTAINER                      ::
  ::                                                    ::
  ::
++  MALT                                                ::  MAP FROM LIST
  |*  A/(LIST)
  (MOLT `(LIST {P/_-<.A Q/_->.A})`A)
::
++  MOLT                                                ::  MAP FROM PAIR LIST
  |*  A/(LIST (PAIR))  ::  ^-  =,(I.-.A (MAP _P _Q))
  (~(GAS BY `(TREE {P/_P.I.-.A Q/_Q.I.-.A})`~) A)
::
++  SILT                                                ::  SET FROM LIST
  |*  A/(LIST)  ::  ^-  (SET _I.-.A)
  =+  B=*(TREE _?>(?=(^ A) I.A))
  (~(GAS IN B) A)
::                                                      ::
::::  2M: CONTAINER FROM NOUN                           ::
  ::                                                    ::
  ::
++  LY                                                  ::  LIST FROM RAW NOUN
  LE:NL
::
++  MY                                                  ::  MAP FROM RAW NOUN
  MY:NL
::
++  SY                                                  ::  SET FROM RAW NOUN
  SI:NL
::
++  NL
  |%
  ::                                                    ::
  ++  LE                                                ::  CONSTRUCT LIST
    |*  A/(LIST)
    ^+  =<  $
      |@  ++  $  ?:(*? ~ [I=(SNAG 0 A) T=$])
      --
    A
  ::                                                    ::
  ++  MY                                                ::  CONSTRUCT MAP
    |*  A/(LIST (PAIR))
    =>  .(A ^+((LE A) A))
    (~(GAS BY `(MAP _P.I.-.A _Q.I.-.A)`~) A)
  ::                                                    ::
  ++  SI                                                ::  CONSTRUCT SET
    |*  A/(LIST)
    =>  .(A ^+((LE A) A))
    (~(GAS IN `(SET _I.-.A)`~) A)
  ::                                                    ::
  ++  SNAG                                              ::  INDEX
    |*  {A/@ B/(LIST)}
    ?~  B
      ~_  LEAF+"SNAG-FAIL"
      !!
    ?:  =(0 A)  I.B
    $(B T.B, A (DEC A))
  ::                                                    ::
  ++  WELD                                              ::  CONCATENATE
    |*  {A/(LIST) B/(LIST)}
    =>  .(A ^+((LE A) A), B ^+((LE B) B))
    =+  42
    |-
    ?~  A  B
    [I=I.A T=$(A T.A)]
  --
::
::::  2P: SERIALIZATION                                 ::
  ::                                                    ::
  ::
++  CUE                                                 ::  UNPACK
  ~/  %CUE
  |=  A/@
  ^-  *
  =+  B=0
  =+  M=`(MAP @ *)`~
  =<  Q
  |-  ^-  {P/@ Q/* R/(MAP @ *)}
  ?:  =(0 (CUT 0 [B 1] A))
    =+  C=(RUB +(B) A)
    [+(P.C) Q.C (~(PUT BY M) B Q.C)]
  =+  C=(ADD 2 B)
  ?:  =(0 (CUT 0 [+(B) 1] A))
    =+  U=$(B C)
    =+  V=$(B (ADD P.U C), M R.U)
    =+  W=[Q.U Q.V]
    [(ADD 2 (ADD P.U P.V)) W (~(PUT BY R.V) B W)]
  =+  D=(RUB C A)
  [(ADD 2 P.D) (NEED (~(GET BY M) Q.D)) M]
::
++  JAM                                                 ::  PACK
  ~/  %JAM
  |=  A/*
  ^-  @
  =+  B=0
  =+  M=`(MAP * @)`~
  =<  Q
  |-  ^-  {P/@ Q/@ R/(MAP * @)}
  =+  C=(~(GET BY M) A)
  ?~  C
    =>  .(M (~(PUT BY M) A B))
    ?:  ?=(@ A)
      =+  D=(MAT A)
      [(ADD 1 P.D) (LSH 0 1 Q.D) M]
    =>  .(B (ADD 2 B))
    =+  D=$(A -.A)
    =+  E=$(A +.A, B (ADD B P.D), M R.D)
    [(ADD 2 (ADD P.D P.E)) (MIX 1 (LSH 0 2 (CAT 0 Q.D Q.E))) R.E]
  ?:  ?&(?=(@ A) (LTE (MET 0 A) (MET 0 U.C)))
    =+  D=(MAT A)
    [(ADD 1 P.D) (LSH 0 1 Q.D) M]
  =+  D=(MAT U.C)
  [(ADD 2 P.D) (MIX 3 (LSH 0 2 Q.D)) M]
::
++  MAT                                                 ::  LENGTH-ENCODE
  ~/  %MAT
  |=  A/@
  ^-  {P/@ Q/@}
  ?:  =(0 A)
    [1 1]
  =+  B=(MET 0 A)
  =+  C=(MET 0 B)
  :-  (ADD (ADD C C) B)
  (CAT 0 (BEX C) (MIX (END 0 (DEC C) B) (LSH 0 (DEC C) A)))
::
++  RUB                                                 ::  LENGTH-DECODE
  ~/  %RUB
  |=  {A/@ B/@}
  ^-  {P/@ Q/@}
  =+  ^=  C
      =+  [C=0 M=(MET 0 B)]
      |-  ?<  (GTH C M)
      ?.  =(0 (CUT 0 [(ADD A C) 1] B))
        C
      $(C +(C))
  ?:  =(0 C)
    [1 0]
  =+  D=(ADD A +(C))
  =+  E=(ADD (BEX (DEC C)) (CUT 0 [D (DEC C)] B))
  [(ADD (ADD C C) E) (CUT 0 [(ADD D (DEC C)) E] B)]
::
++  FN  ::  FLOAT, INFINITY, OR NAN
        ::  S=SIGN, E=EXPONENT, A=ARITHMETIC FORM
        ::  (-1)^S * A * 2^E
        $%  {$F S/? E/@S A/@U}
            {$I S/?}
            {$N ~}
        ==
::
++  DN  ::  DECIMAL FLOAT, INFINITY, OR NAN
        ::  (-1)^S * A * 10^E
        $%  {$D S/? E/@S A/@U}
            {$I S/?}
            {$N ~}
        ==
::
++  RN  ::  PARSED DECIMAL FLOAT
        ::
        $%  {$D A/? B/{C/@ {D/@ E/@} F/? I/@}}
            {$I A/?}
            {$N ~}
        ==
--  =>
::                                                      ::
::::  3: LAYER THREE                                    ::
  ::                                                    ::
  ::    3A: SIGNED AND MODULAR INTS                     ::
  ::    3B: FLOATING POINT                              ::
  ::    3C: URBIT TIME                                  ::
  ::    3D: SHA HASH FAMILY                             ::
  ::    3E: (RESERVED)                                  ::
  ::    3F: SCRAMBLING                                  ::
  ::    3G: MOLDS AND MOLD BUILDERS                     ::
  ::                                                    ::
~%  %TRI  +  ~
|%
::
::::  3A: SIGNED AND MODULAR INTS                       ::
  ::                                                    ::
  ::
++  EGCD                                                ::  SCHNEIER'S EGCD
  |=  {A/@ B/@}
  =+  SI
  =+  [C=(SUN A) D=(SUN B)]
  =+  [U=[C=(SUN 1) D=--0] V=[C=--0 D=(SUN 1)]]
  |-  ^-  {D/@ U/@S V/@S}
  ?:  =(--0 C)
    [(ABS D) D.U D.V]
  ::  ?>  ?&  =(C (SUM (PRO (SUN A) C.U) (PRO (SUN B) C.V)))
  ::          =(D (SUM (PRO (SUN A) D.U) (PRO (SUN B) D.V)))
  ::      ==
  =+  Q=(FRA D C)
  %=  $
    C  (DIF D (PRO Q C))
    D  C
    U  [(DIF D.U (PRO Q C.U)) C.U]
    V  [(DIF D.V (PRO Q C.V)) C.V]
  ==
::
++  FO                                                  ::  MODULO PRIME
  ^|
  |_  A/@
  ++  DIF
    |=  {B/@ C/@}
    (SIT (SUB (ADD A B) (SIT C)))
  ::
  ++  EXP
    |=  {B/@ C/@}
    ?:  =(0 B)
      1
    =+  D=$(B (RSH 0 1 B))
    =+  E=(PRO D D)
    ?:(=(0 (END 0 1 B)) E (PRO C E))
  ::
  ++  FRA
    |=  {B/@ C/@}
    (PRO B (INV C))
  ::
  ++  INV
    |=  B/@
    =+  C=(DUL:SI U:(EGCD B A) A)
    C
  ::
  ++  PRO
    |=  {B/@ C/@}
    (SIT (MUL B C))
  ::
  ++  SIT
    |=  B/@
    (MOD B A)
  ::
  ++  SUM
    |=  {B/@ C/@}
    (SIT (ADD B C))
  --
::
++  SI                                                  ::  SIGNED INTEGER
  ^?
  |%
  ++  ABS  |=(A/@S (ADD (END 0 1 A) (RSH 0 1 A)))       ::  ABSOLUTE VALUE
  ++  DIF  |=  {A/@S B/@S}                              ::  SUBTRACTION
           (SUM A (NEW !(SYN B) (ABS B)))
  ++  DUL  |=  {A/@S B/@}                               ::  MODULUS
           =+(C=(OLD A) ?:(-.C (MOD +.C B) (SUB B +.C)))
  ++  FRA  |=  {A/@S B/@S}                              ::  DIVIDE
           (NEW =(0 (MIX (SYN A) (SYN B))) (DIV (ABS A) (ABS B)))
  ++  NEW  |=  {A/? B/@}                                ::  [SIGN VALUE] TO @S
           `@S`?:(A (MUL 2 B) ?:(=(0 B) 0 +((MUL 2 (DEC B)))))
  ++  OLD  |=(A/@S [(SYN A) (ABS A)])                   ::  [SIGN VALUE]
  ++  PRO  |=  {A/@S B/@S}                              ::  MULTIPLICATION
           (NEW =(0 (MIX (SYN A) (SYN B))) (MUL (ABS A) (ABS B)))
  ++  REM  |=({A/@S B/@S} (DIF A (PRO B (FRA A B))))    ::  REMAINDER
  ++  SUM  |=  {A/@S B/@S}                              ::  ADDITION
           =+  [C=(OLD A) D=(OLD B)]
           ?:  -.C
             ?:  -.D
               (NEW & (ADD +.C +.D))
             ?:  (GTE +.C +.D)
               (NEW & (SUB +.C +.D))
             (NEW | (SUB +.D +.C))
           ?:  -.D
             ?:  (GTE +.C +.D)
               (NEW | (SUB +.C +.D))
             (NEW & (SUB +.D +.C))
           (NEW | (ADD +.C +.D))
  ++  SUN  |=(A/@U (MUL 2 A))                           ::  @U TO @S
  ++  SYN  |=(A/@S =(0 (END 0 1 A)))                    ::  SIGN TEST
  ++  CMP  |=  {A/@S B/@S}                              ::  COMPARE
           ^-  @S
           ?:  =(A B)
             --0
           ?:  (SYN A)
             ?:  (SYN B)
               ?:  (GTH A B)
                 --1
               -1
             --1
          ?:  (SYN B)
            -1
          ?:  (GTH A B)
            -1
          --1
  --
::                                                      ::
::::  3B: FLOATING POINT                                ::
  ::                                                    ::
  ::
::
++  FL                                                  ::  ARB. PRECISION FP
  =+  ^-  {{P/@U V/@S W/@U} R/$?($N $U $D $Z $A) D/$?($D $F $I)}
    [[113 -16.494 32.765] %N %D]
  ::  P=PRECISION:     NUMBER OF BITS IN ARITHMETIC FORM; MUST BE AT LEAST 2
  ::  V=MIN EXPONENT:  MINIMUM VALUE OF E
  ::  W=WIDTH:         MAX - MIN VALUE OF E, 0 IS FIXED POINT
  ::  R=ROUNDING MODE: NEAREST (TIES TO EVEN), UP, DOWN, TO ZERO, AWAY FROM ZERO
  ::  D=BEHAVIOR:      RETURN DENORMALS, FLUSH DENORMALS TO ZERO,
  ::                   INFINITE EXPONENT RANGE
  =>
    ~%  %COFL  +>  ~
    ::  INTERNAL FUNCTIONS; MOSTLY OPERATING ON {E/@S A/@U}, IN OTHER WORDS
    ::  POSITIVE NUMBERS. MANY OF THESE ERROR OUT IF A=0.
    |%
    ++  ROU
      |=  {A/{E/@S A/@U}}  ^-  FN  (RAU A &)
    ::
    ++  RAU
      |=  {A/{E/@S A/@U} T/?}  ^-  FN
      ?-  R
        $Z  (LUG %FL A T)  $D  (LUG %FL A T)
        $A  (LUG %CE A T)  $U  (LUG %CE A T)
        $N  (LUG %NE A T)
      ==
    ::
    ++  ADD                                             ::  ADD; EXACT IF E
      |=  {A/{E/@S A/@U} B/{E/@S A/@U} E/?}  ^-  FN
      =+  Q=(DIF:SI E.A E.B)
      |-  ?.  (SYN:SI Q)  $(B A, A B, Q +(Q))           ::  A HAS LARGER EXP
      ?:  E
        [%F & E.B (^ADD (LSH 0 (ABS:SI Q) A.A) A.B)]
      =+  [MA=(MET 0 A.A) MB=(MET 0 A.B)]
      =+  ^=  W  %+  DIF:SI  E.A  %-  SUN:SI            ::  EXPANDED EXP OF A
        ?:  (GTH PRC MA)  (^SUB PRC MA)  0
      =+  ^=  X  %+  SUM:SI  E.B  (SUN:SI MB)           ::  HIGHEST EXP FOR B
      ?:  =((CMP:SI W X) --1)                           ::  DON'T NEED TO ADD
        ?-  R
          $Z  (LUG %FL A &)  $D  (LUG %FL A &)
          $A  (LUG %LG A &)  $U  (LUG %LG A &)
          $N  (LUG %NA A &)
        ==
      (ROU [E.B (^ADD (LSH 0 (ABS:SI Q) A.A) A.B)])
    ::
    ++  SUB                                             ::  SUBTRACT; EXACT IF E
      |=  {A/{E/@S A/@U} B/{E/@S A/@U} E/?}  ^-  FN
      =+  Q=(DIF:SI E.A E.B)
      |-  ?.  (SYN:SI Q)
        (FLI $(B A, A B, Q +(Q), R SWR))
      =+  [MA=(MET 0 A.A) MB=(MET 0 A.B)]
      =+  ^=  W  %+  DIF:SI  E.A  %-  SUN:SI
        ?:  (GTH PRC MA)  (^SUB PRC MA)  0
      =+  ^=  X  %+  SUM:SI  E.B  (SUN:SI +(MB))
      ?:  &(!E =((CMP:SI W X) --1))
        ?-  R
          $Z  (LUG %SM A &)  $D  (LUG %SM A &)
          $A  (LUG %CE A &)  $U  (LUG %CE A &)
          $N  (LUG %NT A &)
        ==
      =+  J=(LSH 0 (ABS:SI Q) A.A)
      |-  ?.  (GTE J A.B)
        (FLI $(A.B J, J A.B, R SWR))
      =+  I=(^SUB J A.B)
      ?~  I  [%F & ZER]
      ?:  E  [%F & E.B I]  (ROU [E.B I])
    ::
    ++  MUL                                             ::  MULTIPLY
      |=  {A/{E/@S A/@U} B/{E/@S A/@U}}  ^-  FN
      (ROU (SUM:SI E.A E.B) (^MUL A.A A.B))
    ::
    ++  DIV                                             ::  DIVIDE
      |=  {A/{E/@S A/@U} B/{E/@S A/@U}}  ^-  FN
      =+  [MA=(MET 0 A.A) MB=(MET 0 A.B)]
      =+  V=(DIF:SI (SUN:SI MA) (SUN:SI +((^ADD MB PRC))))
      =.  A  ?:  (SYN:SI V)  A
      A(E (SUM:SI V E.A), A (LSH 0 (ABS:SI V) A.A))
      =+  [J=(DIF:SI E.A E.B) Q=(DVR A.A A.B)]
      (RAU [J P.Q] =(Q.Q 0))
    ::
    ++  SQT                                             ::  SQUARE ROOT
      |=  {A/{E/@S A/@U}}  ^-  FN
      =.  A
        =+  [W=(MET 0 A.A) X=(^MUL +(PRC) 2)]
        =+  ?:((^LTH W X) (^SUB X W) 0)
        =+  ?:  =((DIS - 1) (DIS (ABS:SI E.A) 1))  -
          (^ADD - 1)
        A(E (DIF:SI E.A (SUN:SI -)), A (LSH 0 - A.A))
      =+  [Y=(^SQT A.A) Z=(FRA:SI E.A --2)]
      (RAU [Z P.Y] =(Q.Y 0))
    ::
    ++  LTH                                             ::  LESS-THAN
      |=  {A/{E/@S A/@U} B/{E/@S A/@U}}  ^-  ?
      ?:  =(E.A E.B)  (^LTH A.A A.B)
      =+  C=(CMP:SI (IBL A) (IBL B))
      ?:  =(C -1)  &  ?:  =(C --1)  |
      ?:  =((CMP:SI E.A E.B) -1)
        (^LTH (RSH 0 (ABS:SI (DIF:SI E.A E.B)) A.A) A.B)
      (^LTH (LSH 0 (ABS:SI (DIF:SI E.A E.B)) A.A) A.B)
    ::
    ++  EQU                                             ::  EQUALS
      |=  {A/{E/@S A/@U} B/{E/@S A/@U}}  ^-  ?
      ?.  =((IBL A) (IBL B))  |
      ?:  =((CMP:SI E.A E.B) -1)
        =((LSH 0 (ABS:SI (DIF:SI E.A E.B)) A.B) A.A)
      =((LSH 0 (ABS:SI (DIF:SI E.A E.B)) A.A) A.B)
    ::
    ::  INTEGER BINARY LOGARITHM: 2^IBL(A) <= |A| < 2^(IBL(A)+1)
    ++  IBL
      |=  {A/{E/@S A/@U}}  ^-  @S
      (SUM:SI (SUN:SI (DEC (MET 0 A.A))) E.A)
    ::
    ::  CHANGE TO A REPRESENTATION WHERE A.A IS ODD
    ::  EVERY FN HAS A UNIQUE REPRESENTATION OF THIS KIND
    ++  UNI
      |=  {A/{E/@S A/@U}}
      |-  ?:  =((END 0 1 A.A) 1)  A
      $(A.A (RSH 0 1 A.A), E.A (SUM:SI E.A --1))
    ::
    ::  EXPANDS TO EITHER FULL PRECISION OR TO DENORMALIZED
    ++  XPD
      |=  {A/{E/@S A/@U}}
      =+  MA=(MET 0 A.A)
      ?:  (GTE MA PRC)  A
      =+  ?:  =(DEN %I)  (^SUB PRC MA)
          =+  ^=  Q
            =+  W=(DIF:SI E.A EMN)
            ?:  (SYN:SI W)  (ABS:SI W)  0
          (MIN Q (^SUB PRC MA))
      A(E (DIF:SI E.A (SUN:SI -)), A (LSH 0 - A.A))
    ::
    ::  CENTRAL ROUNDING MECHANISM
    ::  CAN PERFORM: FLOOR, CEILING, SMALLER, LARGER,
    ::               NEAREST (ROUND TIES TO: EVEN, AWAY FROM 0, TOWARD 0)
    ::  S IS STICKY BIT: REPRESENTS A VALUE LESS THAN ULP(A) = 2^(E.A)
    ::
    ++  LUG
      ~/  %LUG
      |=  {T/$?($FL $CE $SM $LG $NE $NA $NT) A/{E/@S A/@U} S/?}  ^-  FN
      ?<  =(A.A 0)
      =-
        ?.  =(DEN %F)  -                                ::  FLUSH DENORMALS
        ?.  ?=({$F *} -)  -
        ?:  =((MET 0 ->+>) PRC)  -  [%F & ZER]
      ::
      =+  M=(MET 0 A.A)
      ?>  |(S (GTH M PRC))                              ::  REQUIRE PRECISION
      =+  ^=  Q  %+  MAX
          ?:  (GTH M PRC)  (^SUB M PRC)  0              ::  REDUCE PRECISION
        %-  ABS:SI  ?:  =(DEN %I)  --0                  ::  ENFORCE MIN. EXP
        ?:  =((CMP:SI E.A EMN) -1)  (DIF:SI EMN E.A)  --0
      =^  B  A  :-  (END 0 Q A.A)
        A(E (SUM:SI E.A (SUN:SI Q)), A (RSH 0 Q A.A))
      ::
      ?~  A.A
        ?<  =(DEN %I)
        ?-  T
          $FL  [%F & ZER]
          $SM  [%F & ZER]
          $CE  [%F & SPD]
          $LG  [%F & SPD]
          $NE  ?:  S  [%F & ?:((LTE B (BEX (DEC Q))) ZER SPD)]
               [%F & ?:((^LTH B (BEX (DEC Q))) ZER SPD)]
          $NT  ?:  S  [%F & ?:((LTE B (BEX (DEC Q))) ZER SPD)]
               [%F & ?:((^LTH B (BEX (DEC Q))) ZER SPD)]
          $NA  [%F & ?:((^LTH B (BEX (DEC Q))) ZER SPD)]
        ==
      ::
      =.  A  (XPD A)
      ::
      =.  A
        ?-  T
          $FL  A
          $LG  A(A +(A.A))
          $SM  ?.  &(=(B 0) S)  A
               ?:  &(=(E.A EMN) !=(DEN %I))  A(A (DEC A.A))
               =+  Y=(DEC (^MUL A.A 2))
               ?.  (LTE (MET 0 Y) PRC)  A(A (DEC A.A))
               [(DIF:SI E.A --1) Y]
          $CE  ?:  &(=(B 0) S)  A  A(A +(A.A))
          $NE  ?~  B  A
               =+  Y=(BEX (DEC Q))
               ?:  &(=(B Y) S)                          ::  ROUND HALFS TO EVEN
                 ?~  (DIS A.A 1)  A  A(A +(A.A))
               ?:  (^LTH B Y)  A  A(A +(A.A))
          $NA  ?~  B  A
               =+  Y=(BEX (DEC Q))
               ?:  (^LTH B Y)  A  A(A +(A.A))
          $NT  ?~  B  A
               =+  Y=(BEX (DEC Q))
               ?:  =(B Y)  ?:  S  A  A(A +(A.A))
               ?:  (^LTH B Y)  A  A(A +(A.A))
        ==
      ::
      =.  A  ?.  =((MET 0 A.A) +(PRC))  A
        A(A (RSH 0 1 A.A), E (SUM:SI E.A --1))
      ?~  A.A  [%F & ZER]
      ::
      ?:  =(DEN %I)  [%F & A]
      ?:  =((CMP:SI EMX E.A) -1)  [%I &]  [%F & A]      ::  ENFORCE MAX. EXP
    ::
    ++  DRG                                             ::  DRAGON4; GET
      ~/  %DRG                                          ::  PRINTABLE DECIMAL;
      |=  {A/{E/@S A/@U}}  ^-  {@S @U}                  ::  GUARANTEED ACCURATE
      ?<  =(A.A 0)                                      ::  FOR ROUNDED FLOATS
      =.  A  (XPD A)
      =+  R=(LSH 0 ?:((SYN:SI E.A) (ABS:SI E.A) 0) A.A)
      =+  S=(LSH 0 ?.((SYN:SI E.A) (ABS:SI E.A) 0) 1)
      =+  MN=(LSH 0 ?:((SYN:SI E.A) (ABS:SI E.A) 0) 1)
      =+  MP=MN
      =>  ?.
            ?&  =(A.A (BEX (DEC PRC)))                  ::  IF NEXT SMALLEST
                |(!=(E.A EMN) =(DEN %I))                ::  FLOAT IS HALF ULP,
            ==                                          ::  TIGHTEN LOWER BOUND
          .
        %=  .
          MP  (LSH 0 1 MP)
          R  (LSH 0 1 R)
          S  (LSH 0 1 S)
        ==
      =+  [K=--0 Q=(^DIV (^ADD S 9) 10)]
      |-  ?:  (^LTH R Q)
        %=  $
          K  (DIF:SI K --1)
          R  (^MUL R 10)
          MN  (^MUL MN 10)
          MP  (^MUL MP 10)
        ==
      |-  ?:  (GTE (^ADD (^MUL R 2) MP) (^MUL S 2))
        $(S (^MUL S 10), K (SUM:SI K --1))
      =+  [U=0 O=0]
      |-                                                ::  R/S+O = A*10^-K
      =+  V=(DVR (^MUL R 10) S)
      =>  %=  .
          K  (DIF:SI K --1)
          U  P.V
          R  Q.V
          MN  (^MUL MN 10)
          MP  (^MUL MP 10)
        ==
      =+  L=(^LTH (^MUL R 2) MN)                        ::  IN LOWER BOUND
      =+  ^=  H                                         ::  IN UPPER BOUND
        ?|  (^LTH (^MUL S 2) MP)
            (GTH (^MUL R 2) (^SUB (^MUL S 2) MP))
        ==
      ?:  &(!L !H)
        $(O (^ADD (^MUL O 10) U))
      =+  Q=&(H |(!L (GTH (^MUL R 2) S)))
      =.  O  (^ADD (^MUL O 10) ?:(Q +(U) U))
      [K O]
    ::
    ++  TOJ                                             ::  ROUND TO INTEGER
      |=  {A/{E/@S A/@U}}  ^-  FN
      ?.  =((CMP:SI E.A --0) -1)  [%F & A]
      =+  X=(ABS:SI E.A)
      =+  Y=(RSH 0 X A.A)
      ?:  |(=(R %D) =(R %Z))  [%F & --0 Y]
      =+  Z=(END 0 X A.A)
      ?:  |(=(R %U) =(R %A))  [%F & --0 ?~(Z Y +(Y))]
      =+  I=(BEX (DEC X))
      ?:  &(=(Z I) =((DIS Y 1) 0))  [%F & --0 Y]
      ?:  (^LTH Z I)  [%F & --0 Y]  [%F & --0 +(Y)]
    ::
    ++  NED                                             ::  REQUIRE ?=({$F *} A)
      |=  {A/FN}  ^-  {$F S/? E/@S A/@U}
      ?:  ?=({$F *} A)  A
      ~_  LEAF+"NEED-FLOAT"
      !!
    ::
    ++  SHF                                             ::  A * 2^B; NO ROUNDING
      |=  {A/FN B/@S}
      ?:  |(?=({$N *} A) ?=({$I *} A))  A
      A(E (SUM:SI E.A B))
    ::
    ++  FLI                                             ::  FLIP SIGN
      |=  {A/FN}  ^-  FN
      ?-(-.A $F A(S !S.A), $I A(S !S.A), $N A)
    ::
    ++  SWR  ?+(R R $D %U, $U %D)                       ::  FLIPPED ROUNDING
    ++  PRC  ?>((GTH P 1) P)                            ::  FORCE >= 2 PRECISION
    ++  DEN  D                                          ::  DENORM+FLUSH+INF EXP
    ++  EMN  V                                          ::  MINIMUM EXPONENT
    ++  EMX  (SUM:SI EMN (SUN:SI W))                    ::  MAXIMUM EXPONENT
    ++  SPD  [E=EMN A=1]                                ::  SMALLEST DENORMAL
    ++  SPN  [E=EMN A=(BEX (DEC PRC))]                  ::  SMALLEST NORMAL
    ++  LFN  [E=EMX A=(FIL 0 PRC 1)]                    ::  LARGEST
    ++  LFE  (SUM:SI EMX (SUN:SI PRC))                  ::  2^LFE IS > THAN ALL
    ++  ZER  [E=--0 A=0]
    --
  |%
  ++  ROU                                               ::  ROUND
    |=  {A/FN}  ^-  FN
    ?.  ?=({$F *} A)  A
    ?~  A.A  [%F S.A ZER]
    ?:  S.A  (^ROU +>.A)
    =.(R SWR (FLI (^ROU +>.A)))
  ::
  ++  SYN                                               ::  GET SIGN
    |=  {A/FN}  ^-  ?
    ?-(-.A $F S.A, $I S.A, $N &)
  ::
  ++  ABS                                               ::  ABSOLUTE VALUE
    |=  {A/FN}  ^-  FN
    ?:  ?=({$F *} A)  [%F & E.A A.A]
    ?:  ?=({$I *} A)  [%I &]  [%N ~]
  ::
  ++  ADD                                               ::  ADD
    |=  {A/FN B/FN}  ^-  FN
    ?:  |(?=({$N *} A) ?=({$N *} B))  [%N ~]
    ?:  |(?=({$I *} A) ?=({$I *} B))
      ?:  &(?=({$I *} A) ?=({$I *} B))
        ?:  =(A B)  A  [%N ~]
      ?:  ?=({$I *} A)  A  B
    ?:  |(=(A.A 0) =(A.B 0))
      ?.  &(=(A.A 0) =(A.B 0))  %-  ROU  ?~(A.A B A)
      [%F ?:(=(R %D) &(S.A S.B) |(S.A S.B)) ZER]
    %-  |=  {A/FN}
        ?.  ?=({$F *} A)  A
        ?.  =(A.A 0)  A
        [%F !=(R %D) ZER]
    ?:  =(S.A S.B)
      ?:  S.A  (^ADD +>.A +>.B |)
      =.(R SWR (FLI (^ADD +>.A +>.B |)))
    ?:  S.A  (^SUB +>.A +>.B |)
    (^SUB +>.B +>.A |)
  ::
  ++  EAD                                               ::  EXACT ADD
    |=  {A/FN B/FN}  ^-  FN
    ?:  |(?=({$N *} A) ?=({$N *} B))  [%N ~]
    ?:  |(?=({$I *} A) ?=({$I *} B))
      ?:  &(?=({$I *} A) ?=({$I *} B))
        ?:  =(A B)  A  [%N ~]
      ?:  ?=({$I *} A)  A  B
    ?:  |(=(A.A 0) =(A.B 0))
      ?.  &(=(A.A 0) =(A.B 0))  ?~(A.A B A)
      [%F ?:(=(R %D) &(S.A S.B) |(S.A S.B)) ZER]
    %-  |=  {A/FN}
        ?.  ?=({$F *} A)  A
        ?.  =(A.A 0)  A
        [%F !=(R %D) ZER]
    ?:  =(S.A S.B)
      ?:  S.A  (^ADD +>.A +>.B &)
      (FLI (^ADD +>.A +>.B &))
    ?:  S.A  (^SUB +>.A +>.B &)
    (^SUB +>.B +>.A &)
  ::
  ++  SUB                                               ::  SUBTRACT
    |=  {A/FN B/FN}  ^-  FN  (ADD A (FLI B))
  ::
  ++  MUL                                               ::  MULTIPLY
    |=  {A/FN B/FN}  ^-  FN
    ?:  |(?=({$N *} A) ?=({$N *} B))  [%N ~]
    ?:  ?=({$I *} A)
      ?:  ?=({$I *} B)
        [%I =(S.A S.B)]
      ?:  =(A.B 0)  [%N ~]  [%I =(S.A S.B)]
    ?:  ?=({$I *} B)
      ?:  =(A.A 0)  [%N ~]  [%I =(S.A S.B)]
    ?:  |(=(A.A 0) =(A.B 0))  [%F =(S.A S.B) ZER]
    ?:  =(S.A S.B)  (^MUL +>.A +>.B)
    =.(R SWR (FLI (^MUL +>.A +>.B)))
  ::
  ++  EMU                                               ::  EXACT MULTIPLY
    |=  {A/FN B/FN}  ^-  FN
    ?:  |(?=({$N *} A) ?=({$N *} B))  [%N ~]
    ?:  ?=({$I *} A)
      ?:  ?=({$I *} B)
        [%I =(S.A S.B)]
      ?:  =(A.B 0)  [%N ~]  [%I =(S.A S.B)]
    ?:  ?=({$I *} B)
      ?:  =(A.A 0)  [%N ~]  [%I =(S.A S.B)]
    ?:  |(=(A.A 0) =(A.B 0))  [%F =(S.A S.B) ZER]
    [%F =(S.A S.B) (SUM:SI E.A E.B) (^^MUL A.A A.B)]
  ::
  ++  DIV                                               ::  DIVIDE
    |=  {A/FN B/FN}  ^-  FN
    ?:  |(?=({$N *} A) ?=({$N *} B))  [%N ~]
    ?:  ?=({$I *} A)
      ?:  ?=({$I *} B)  [%N ~]  [%I =(S.A S.B)]
    ?:  ?=({$I *} B)  [%F =(S.A S.B) ZER]
    ?:  =(A.A 0)  ?:  =(A.B 0)  [%N ~]  [%F =(S.A S.B) ZER]
    ?:  =(A.B 0)  [%I =(S.A S.B)]
    ?:  =(S.A S.B)  (^DIV +>.A +>.B)
    =.(R SWR (FLI (^DIV +>.A +>.B)))
  ::
  ++  FMA                                               ::  FUSED MULTIPLY-ADD
    |=  {A/FN B/FN C/FN}  ^-  FN                        ::  (A * B) + C
    (ADD (EMU A B) C)
  ::
  ++  SQT                                               ::  SQUARE ROOT
    |=  {A/FN}  ^-  FN
    ?:  ?=({$N *} A)  [%N ~]
    ?:  ?=({$I *} A)  ?:(S.A A [%N ~])
    ?~  A.A  [%F S.A ZER]
    ?:  S.A  (^SQT +>.A)  [%N ~]
  ::
  ++  INV                                               ::  INVERSE
    |=  {A/FN}  ^-  FN
    (DIV [%F & --0 1] A)
  ::
  ++  SUN                                               ::  UNS INTEGER TO FLOAT
    |=  {A/@U}  ^-  FN
    (ROU [%F & --0 A])
  ::
  ++  SAN                                               ::  SGN INTEGER TO FLOAT
    |=  {A/@S}  ^-  FN
    =+  B=(OLD:SI A)
    (ROU [%F -.B --0 +.B])
  ::
  ::  COMPARISONS RETURN ~ IN THE EVENT OF A NAN
  ++  LTH                                               ::  LESS-THAN
    |=  {A/FN B/FN}  ^-  (UNIT ?)
    ?:  |(?=({$N *} A) ?=({$N *} B))  ~  :-  ~
    ?:  =(A B)  |
    ?:  ?=({$I *} A)  !S.A  ?:  ?=({$I *} B)  S.B
    ?:  |(=(A.A 0) =(A.B 0))
      ?:  &(=(A.A 0) =(A.B 0))  |
      ?:  =(A.A 0)  S.B  !S.A
    ?:  !=(S.A S.B)  S.B
    ?:  S.A  (^LTH +>.A +>.B)  (^LTH +>.B +>.A)
  ::
  ++  LTE                                               ::  LESS-EQUAL
    |=  {A/FN B/FN}  ^-  (UNIT ?)
    %+  BIND  (LTH B A)  |=  A/?  !A
  ::
  ++  EQU                                               ::  EQUAL
    |=  {A/FN B/FN}  ^-  (UNIT ?)
    ?:  |(?=({$N *} A) ?=({$N *} B))  ~  :-  ~
    ?:  =(A B)  &
    ?:  |(?=({$I *} A) ?=({$I *} B))  |
    ?:  |(=(A.A 0) =(A.B 0))
      ?:  &(=(A.A 0) =(A.B 0))  &  |
    ?:  |(=(E.A E.B) !=(S.A S.B))  |
    (^EQU +>.A +>.B)
  ::
  ++  GTE                                               ::  GREATER-EQUAL
    |=  {A/FN B/FN}  ^-  (UNIT ?)  (LTE B A)
  ::
  ++  GTH                                               ::  GREATER-THAN
    |=  {A/FN B/FN}  ^-  (UNIT ?)  (LTH B A)
  ::
  ++  DRG                                               ::  FLOAT TO DECIMAL
    |=  {A/FN}  ^-  DN
    ?:  ?=({$N *} A)  [%N ~]
    ?:  ?=({$I *} A)  [%I S.A]
    ?~  A.A  [%D S.A --0 0]
    [%D S.A (^DRG +>.A)]
  ::
  ++  GRD                                               ::  DECIMAL TO FLOAT
    |=  {A/DN}  ^-  FN
    ?:  ?=({$N *} A)  [%N ~]
    ?:  ?=({$I *} A)  [%I S.A]
    =>  .(R %N)
    =+  Q=(ABS:SI E.A)
    ?:  (SYN:SI E.A)
      (MUL [%F S.A --0 A.A] [%F & E.A (POW 5 Q)])
    (DIV [%F S.A --0 A.A] [%F & (SUN:SI Q) (POW 5 Q)])
  ::
  ++  TOI                                               ::  ROUND TO INTEGER @S
    |=  {A/FN}  ^-  (UNIT @S)
    =+  B=(TOJ A)
    ?.  ?=({$F *} B)  ~  :-  ~
    =+  C=(^^MUL (BEX (ABS:SI E.B)) A.B)
    (NEW:SI S.B C)
  ::
  ++  TOJ                                               ::  ROUND TO INTEGER FN
    |=  {A/FN}  ^-  FN
    ?.  ?=({$F *} A)  A
    ?~  A.A  [%F S.A ZER]
    ?:  S.A  (^TOJ +>.A)
    =.(R SWR (FLI (^TOJ +>.A)))
  --
::
++  FF                                                  ::  IEEE 754 FORMAT FP
  |_  {{W/@U P/@U B/@S} R/$?($N $U $D $Z $A)}
  ::  THIS CORE HAS NO USE OUTSIDE OF THE FUNCTIONALITY
  ::  PROVIDED TO ++RD, ++RS, ++RQ, AND ++RH
  ::
  ::  W=WIDTH:         BITS IN EXPONENT FIELD
  ::  P=PRECISION:     BITS IN FRACTION FIELD
  ::  B=BIAS:          ADDED TO EXPONENT WHEN STORING
  ::  R=ROUNDING MODE: SAME AS IN ++FL
  ::
  ++  SB  (BEX (^ADD W P))                              ::  SIGN BIT
  ++  ME  (DIF:SI (DIF:SI --1 B) (SUN:SI P))            ::  MINIMUM EXPONENT
  ::
  ++  PA
    %*(. FL P +(P), V ME, W (^SUB (BEX W) 3), D %D, R R)
  ::
  ++  SEA                                               ::  @R TO FN
    |=  {A/@R}  ^-  FN
    =+  [F=(CUT 0 [0 P] A) E=(CUT 0 [P W] A)]
    =+  S=(SIG A)
    ?:  =(E 0)
      ?:  =(F 0)  [%F S --0 0]  [%F S ME F]
    ?:  =(E (FIL 0 W 1))
      ?:  =(F 0)  [%I S]  [%N ~]
    =+  Q=:(SUM:SI (SUN:SI E) ME -1)
    =+  R=(^ADD F (BEX P))
    [%F S Q R]
  ::
  ++  BIT  |=  {A/FN}  (BIF (ROU:PA A))                 ::  FN TO @R W+ ROUNDING
  ::
  ++  BIF                                               ::  FN TO @R NO ROUNDING
    |=  {A/FN}  ^-  @R
    ?:  ?=({$I *} A)
      =+  Q=(LSH 0 P (FIL 0 W 1))
      ?:  S.A  Q  (^ADD Q SB)
    ?:  ?=({$N *} A)  (LSH 0 (DEC P) (FIL 0 +(W) 1))
    ?~  A.A  ?:  S.A  `@R`0  SB
    =+  MA=(MET 0 A.A)
    ?.  =(MA +(P))
      ?>  =(E.A ME)
      ?>  (^LTH MA +(P))
      ?:  S.A  `@R`A.A  (^ADD A.A SB)
    =+  Q=(SUM:SI (DIF:SI E.A ME) --1)
    =+  R=(^ADD (LSH 0 P (ABS:SI Q)) (END 0 P A.A))
    ?:  S.A  R  (^ADD R SB)
  ::
  ++  SIG                                               ::  GET SIGN
    |=  {A/@R}  ^-  ?
    =(0 (CUT 0 [(^ADD P W) 1] A))
  ::
  ++  EXP                                               ::  GET EXPONENT
    |=  {A/@R}  ^-  @S
    (DIF:SI (SUN:SI (CUT 0 [P W] A)) B)
  ::
  ++  ADD                                               ::  ADD
    |=  {A/@R B/@R}
    (BIF (ADD:PA (SEA A) (SEA B)))
  ::
  ++  SUB                                               ::  SUBTRACT
    |=  {A/@R B/@R}
    (BIF (SUB:PA (SEA A) (SEA B)))
  ::
  ++  MUL                                               ::  MULTIPLY
    |=  {A/@R B/@R}
    (BIF (MUL:PA (SEA A) (SEA B)))
  ::
  ++  DIV                                               ::  DIVIDE
    |=  {A/@R B/@R}
    (BIF (DIV:PA (SEA A) (SEA B)))
  ::
  ++  FMA                                               ::  FUSED MULTIPLY-ADD
    |=  {A/@R B/@R C/@R}
    (BIF (FMA:PA (SEA A) (SEA B) (SEA C)))
  ::
  ++  SQT                                               ::  SQUARE ROOT
    |=  {A/@R}
    (BIF (SQT:PA (SEA A)))
  ::
  ++  LTH                                               ::  LESS-THAN
    |=  {A/@R B/@R}  (FALL (LTH:PA (SEA A) (SEA B)) |)
  ++  LTE                                               ::  LESS-EQUALS
    |=  {A/@R B/@R}  (FALL (LTE:PA (SEA A) (SEA B)) |)
  ++  EQU                                               ::  EQUALS
    |=  {A/@R B/@R}  (FALL (EQU:PA (SEA A) (SEA B)) |)
  ++  GTE                                               ::  GREATER-EQUALS
    |=  {A/@R B/@R}  (FALL (GTE:PA (SEA A) (SEA B)) |)
  ++  GTH                                               ::  GREATER-THAN
    |=  {A/@R B/@R}  (FALL (GTH:PA (SEA A) (SEA B)) |)
  ++  SUN                                               ::  UNS INTEGER TO @R
    |=  {A/@U}  (BIT [%F & --0 A])
  ++  SAN                                               ::  SIGNED INTEGER TO @R
    |=  {A/@S}  (BIT [%F (SYN:SI A) --0 (ABS:SI A)])
  ++  TOI                                               ::  ROUND TO INTEGER
    |=  {A/@R}  (TOI:PA (SEA A))
  ++  DRG                                               ::  @R TO DECIMAL FLOAT
    |=  {A/@R}  (DRG:PA (SEA A))
  ++  GRD                                               ::  DECIMAL FLOAT TO @R
    |=  {A/DN}  (BIF (GRD:PA A))
  --
::
++  RLYD  |=  A/@RD  ^-  DN  (DRG:RD A)                 ::  PREP @RD FOR PRINT
++  RLYS  |=  A/@RS  ^-  DN  (DRG:RS A)                 ::  PREP @RS FOR PRINT
++  RLYH  |=  A/@RH  ^-  DN  (DRG:RH A)                 ::  PREP @RH FOR PRINT
++  RLYQ  |=  A/@RQ  ^-  DN  (DRG:RQ A)                 ::  PREP @RQ FOR PRINT
++  RYLD  |=  A/DN  ^-  @RD  (GRD:RD A)                 ::  FINISH PARSING @RD
++  RYLS  |=  A/DN  ^-  @RS  (GRD:RS A)                 ::  FINISH PARSING @RS
++  RYLH  |=  A/DN  ^-  @RH  (GRD:RH A)                 ::  FINISH PARSING @RH
++  RYLQ  |=  A/DN  ^-  @RQ  (GRD:RQ A)                 ::  FINISH PARSING @RQ
::
++  RD                                                  ::  DOUBLE PRECISION FP
  ^|
  ~%  %RD  +>  ~
  |_  R/$?($N $U $D $Z)
  ::  ROUND TO NEAREST, ROUND UP, ROUND DOWN, ROUND TO ZERO
  ::
  ++  MA
    %*(. FF W 11, P 52, B --1.023, R R)
  ::
  ++  SEA                                               ::  @RD TO FN
    |=  {A/@RD}  (SEA:MA A)
  ::
  ++  BIT                                               ::  FN TO @RD
    |=  {A/FN}  ^-  @RD  (BIT:MA A)
  ::
  ++  ADD  ~/  %ADD                                     ::  ADD
    |=  {A/@RD B/@RD}  ^-  @RD
    ~_  LEAF+"RD-FAIL"
    (ADD:MA A B)
  ::
  ++  SUB  ~/  %SUB                                     ::  SUBTRACT
    |=  {A/@RD B/@RD}  ^-  @RD
    ~_  LEAF+"RD-FAIL"
    (SUB:MA A B)
  ::
  ++  MUL  ~/  %MUL                                     ::  MULTIPLY
    |=  {A/@RD B/@RD}  ^-  @RD
    ~_  LEAF+"RD-FAIL"
    (MUL:MA A B)
  ::
  ++  DIV  ~/  %DIV                                     ::  DIVIDE
    |=  {A/@RD B/@RD}  ^-  @RD
    ~_  LEAF+"RD-FAIL"
    (DIV:MA A B)
  ::
  ++  FMA  ~/  %FMA                                     ::  FUSED MULTIPLY-ADD
    |=  {A/@RD B/@RD C/@RD}  ^-  @RD
    ~_  LEAF+"RD-FAIL"
    (FMA:MA A B C)
  ::
  ++  SQT  ~/  %SQT                                     ::  SQUARE ROOT
    |=  {A/@RD}  ^-  @RD  ~_  LEAF+"RD-FAIL"
    (SQT:MA A)
  ::
  ++  LTH  ~/  %LTH                                     ::  LESS-THAN
    |=  {A/@RD B/@RD}
    ~_  LEAF+"RD-FAIL"
    (LTH:MA A B)
  ::
  ++  LTE  ~/  %LTE                                     ::  LESS-EQUALS
    |=  {A/@RD B/@RD}
    ~_  LEAF+"RD-FAIL"
    (LTE:MA A B)
  ::
  ++  EQU  ~/  %EQU                                     ::  EQUALS
    |=  {A/@RD B/@RD}
    ~_  LEAF+"RD-FAIL"
    (EQU:MA A B)
  ::
  ++  GTE  ~/  %GTE                                     ::  GREATER-EQUALS
    |=  {A/@RD B/@RD}
    ~_  LEAF+"RD-FAIL"
    (GTE:MA A B)
  ::
  ++  GTH  ~/  %GTH                                     ::  GREATER-THAN
    |=  {A/@RD B/@RD}
    ~_  LEAF+"RD-FAIL"
    (GTH:MA A B)
  ::
  ++  SUN  |=  {A/@U}  ^-  @RD  (SUN:MA A)              ::  UNS INTEGER TO @RD
  ++  SAN  |=  {A/@S}  ^-  @RD  (SAN:MA A)              ::  SGN INTEGER TO @RD
  ++  SIG  |=  {A/@RD}  ^-  ?  (SIG:MA A)               ::  GET SIGN
  ++  EXP  |=  {A/@RD}  ^-  @S  (EXP:MA A)              ::  GET EXPONENT
  ++  TOI  |=  {A/@RD}  ^-  (UNIT @S)  (TOI:MA A)       ::  ROUND TO INTEGER
  ++  DRG  |=  {A/@RD}  ^-  DN  (DRG:MA A)              ::  @RD TO DECIMAL FLOAT
  ++  GRD  |=  {A/DN}  ^-  @RD  (GRD:MA A)              ::  DECIMAL FLOAT TO @RD
  --
::
++  RS                                                  ::  SINGLE PRECISION FP
  ~%  %RS  +>  ~
  ^|
  |_  R/$?($N $U $D $Z)
  ::  ROUND TO NEAREST, ROUND UP, ROUND DOWN, ROUND TO ZERO
  ::
  ++  MA
    %*(. FF W 8, P 23, B --127, R R)
  ::
  ++  SEA                                               ::  @RS TO FN
    |=  {A/@RS}  (SEA:MA A)
  ::
  ++  BIT                                               ::  FN TO @RS
    |=  {A/FN}  ^-  @RS  (BIT:MA A)
  ::
  ++  ADD  ~/  %ADD                                     ::  ADD
    |=  {A/@RS B/@RS}  ^-  @RS
    ~_  LEAF+"RS-FAIL"
    (ADD:MA A B)
  ::
  ++  SUB  ~/  %SUB                                     ::  SUBTRACT
    |=  {A/@RS B/@RS}  ^-  @RS
    ~_  LEAF+"RS-FAIL"
    (SUB:MA A B)
  ::
  ++  MUL  ~/  %MUL                                     ::  MULTIPLY
    |=  {A/@RS B/@RS}  ^-  @RS
    ~_  LEAF+"RS-FAIL"
    (MUL:MA A B)
  ::
  ++  DIV  ~/  %DIV                                     ::  DIVIDE
    |=  {A/@RS B/@RS}  ^-  @RS
    ~_  LEAF+"RS-FAIL"
    (DIV:MA A B)
  ::
  ++  FMA  ~/  %FMA                                     ::  FUSED MULTIPLY-ADD
    |=  {A/@RS B/@RS C/@RS}  ^-  @RS
    ~_  LEAF+"RS-FAIL"
    (FMA:MA A B C)
  ::
  ++  SQT  ~/  %SQT                                     ::  SQUARE ROOT
    |=  {A/@RS}  ^-  @RS
    ~_  LEAF+"RS-FAIL"
    (SQT:MA A)
  ::
  ++  LTH  ~/  %LTH                                     ::  LESS-THAN
    |=  {A/@RS B/@RS}
    ~_  LEAF+"RS-FAIL"
    (LTH:MA A B)
  ::
  ++  LTE  ~/  %LTE                                     ::  LESS-EQUALS
    |=  {A/@RS B/@RS}
    ~_  LEAF+"RS-FAIL"
    (LTE:MA A B)
  ::
  ++  EQU  ~/  %EQU                                     ::  EQUALS
    |=  {A/@RS B/@RS}
    ~_  LEAF+"RS-FAIL"
    (EQU:MA A B)
  ::
  ++  GTE  ~/  %GTE                                     ::  GREATER-EQUALS
    |=  {A/@RS B/@RS}
    ~_  LEAF+"RS-FAIL"
    (GTE:MA A B)
  ::
  ++  GTH  ~/  %GTH                                     ::  GREATER-THAN
    |=  {A/@RS B/@RS}
    ~_  LEAF+"RS-FAIL"
    (GTH:MA A B)
  ::
  ++  SUN  |=  {A/@U}  ^-  @RS  (SUN:MA A)              ::  UNS INTEGER TO @RS
  ++  SAN  |=  {A/@S}  ^-  @RS  (SAN:MA A)              ::  SGN INTEGER TO @RS
  ++  SIG  |=  {A/@RS}  ^-  ?  (SIG:MA A)               ::  GET SIGN
  ++  EXP  |=  {A/@RS}  ^-  @S  (EXP:MA A)              ::  GET EXPONENT
  ++  TOI  |=  {A/@RS}  ^-  (UNIT @S)  (TOI:MA A)       ::  ROUND TO INTEGER
  ++  DRG  |=  {A/@RS}  ^-  DN  (DRG:MA A)              ::  @RS TO DECIMAL FLOAT
  ++  GRD  |=  {A/DN}  ^-  @RS  (GRD:MA A)              ::  DECIMAL FLOAT TO @RS
  --
::
++  RQ                                                  ::  QUAD PRECISION FP
  ~%  %RQ  +>  ~
  ^|
  |_  R/$?($N $U $D $Z)
  ::  ROUND TO NEAREST, ROUND UP, ROUND DOWN, ROUND TO ZERO
  ::
  ++  MA
    %*(. FF W 15, P 112, B --16.383, R R)
  ::
  ++  SEA                                               ::  @RQ TO FN
    |=  {A/@RQ}  (SEA:MA A)
  ::
  ++  BIT                                               ::  FN TO @RQ
    |=  {A/FN}  ^-  @RQ  (BIT:MA A)
  ::
  ++  ADD  ~/  %ADD                                     ::  ADD
    |=  {A/@RQ B/@RQ}  ^-  @RQ
    ~_  LEAF+"RQ-FAIL"
    (ADD:MA A B)
  ::
  ++  SUB  ~/  %SUB                                     ::  SUBTRACT
    |=  {A/@RQ B/@RQ}  ^-  @RQ
    ~_  LEAF+"RQ-FAIL"
    (SUB:MA A B)
  ::
  ++  MUL  ~/  %MUL                                     ::  MULTIPLY
    |=  {A/@RQ B/@RQ}  ^-  @RQ
    ~_  LEAF+"RQ-FAIL"
    (MUL:MA A B)
  ::
  ++  DIV  ~/  %DIV                                     ::  DIVIDE
    |=  {A/@RQ B/@RQ}  ^-  @RQ
    ~_  LEAF+"RQ-FAIL"
    (DIV:MA A B)
  ::
  ++  FMA  ~/  %FMA                                     ::  FUSED MULTIPLY-ADD
    |=  {A/@RQ B/@RQ C/@RQ}  ^-  @RQ
    ~_  LEAF+"RQ-FAIL"
    (FMA:MA A B C)
  ::
  ++  SQT  ~/  %SQT                                     ::  SQUARE ROOT
    |=  {A/@RQ}  ^-  @RQ
    ~_  LEAF+"RQ-FAIL"
    (SQT:MA A)
  ::
  ++  LTH  ~/  %LTH                                     ::  LESS-THAN
    |=  {A/@RQ B/@RQ}
    ~_  LEAF+"RQ-FAIL"
    (LTH:MA A B)
  ::
  ++  LTE  ~/  %LTE                                     ::  LESS-EQUALS
    |=  {A/@RQ B/@RQ}
    ~_  LEAF+"RQ-FAIL"
    (LTE:MA A B)
  ::
  ++  EQU  ~/  %EQU                                     ::  EQUALS
    |=  {A/@RQ B/@RQ}
    ~_  LEAF+"RQ-FAIL"
    (EQU:MA A B)
  ::
  ++  GTE  ~/  %GTE                                     ::  GREATER-EQUALS
    |=  {A/@RQ B/@RQ}
    ~_  LEAF+"RQ-FAIL"
    (GTE:MA A B)
  ::
  ++  GTH  ~/  %GTH                                     ::  GREATER-THAN
    |=  {A/@RQ B/@RQ}
    ~_  LEAF+"RQ-FAIL"
    (GTH:MA A B)
  ::
  ++  SUN  |=  {A/@U}  ^-  @RQ  (SUN:MA A)              ::  UNS INTEGER TO @RQ
  ++  SAN  |=  {A/@S}  ^-  @RQ  (SAN:MA A)              ::  SGN INTEGER TO @RQ
  ++  SIG  |=  {A/@RQ}  ^-  ?  (SIG:MA A)               ::  GET SIGN
  ++  EXP  |=  {A/@RQ}  ^-  @S  (EXP:MA A)              ::  GET EXPONENT
  ++  TOI  |=  {A/@RQ}  ^-  (UNIT @S)  (TOI:MA A)       ::  ROUND TO INTEGER
  ++  DRG  |=  {A/@RQ}  ^-  DN  (DRG:MA A)              ::  @RQ TO DECIMAL FLOAT
  ++  GRD  |=  {A/DN}  ^-  @RQ  (GRD:MA A)              ::  DECIMAL FLOAT TO @RQ
  --
::
++  RH                                                  ::  HALF PRECISION FP
  ~%  %RH  +>  ~
  ^|
  |_  R/$?($N $U $D $Z)
  ::  ROUND TO NEAREST, ROUND UP, ROUND DOWN, ROUND TO ZERO
  ::
  ++  MA
    %*(. FF W 5, P 10, B --15, R R)
  ::
  ++  SEA                                               ::  @RH TO FN
    |=  {A/@RH}  (SEA:MA A)
  ::
  ++  BIT                                               ::  FN TO @RH
    |=  {A/FN}  ^-  @RH  (BIT:MA A)
  ::
  ++  ADD  ~/  %ADD                                     ::  ADD
    |=  {A/@RH B/@RH}  ^-  @RH
    ~_  LEAF+"RH-FAIL"
    (ADD:MA A B)
  ::
  ++  SUB  ~/  %SUB                                     ::  SUBTRACT
    |=  {A/@RH B/@RH}  ^-  @RH
    ~_  LEAF+"RH-FAIL"
    (SUB:MA A B)
  ::
  ++  MUL  ~/  %MUL                                     ::  MULTIPLY
    |=  {A/@RH B/@RH}  ^-  @RH
    ~_  LEAF+"RH-FAIL"
    (MUL:MA A B)
  ::
  ++  DIV  ~/  %DIV                                     ::  DIVIDE
    |=  {A/@RH B/@RH}  ^-  @RH
    ~_  LEAF+"RH-FAIL"
    (DIV:MA A B)
  ::
  ++  FMA  ~/  %FMA                                     ::  FUSED MULTIPLY-ADD
    |=  {A/@RH B/@RH C/@RH}  ^-  @RH
    ~_  LEAF+"RH-FAIL"
    (FMA:MA A B C)
  ::
  ++  SQT  ~/  %SQT                                     ::  SQUARE ROOT
    |=  {A/@RH}  ^-  @RH
    ~_  LEAF+"RH-FAIL"
    (SQT:MA A)
  ::
  ++  LTH  ~/  %LTH                                     ::  LESS-THAN
    |=  {A/@RH B/@RH}
    ~_  LEAF+"RH-FAIL"
    (LTH:MA A B)
  ::
  ++  LTE  ~/  %LTE                                     ::  LESS-EQUALS
    |=  {A/@RH B/@RH}
    ~_  LEAF+"RH-FAIL"
    (LTE:MA A B)
  ::
  ++  EQU  ~/  %EQU                                     ::  EQUALS
    |=  {A/@RH B/@RH}
    ~_  LEAF+"RH-FAIL"
    (EQU:MA A B)
  ::
  ++  GTE  ~/  %GTE                                     ::  GREATER-EQUALS
    |=  {A/@RH B/@RH}
    ~_  LEAF+"RH-FAIL"
    (GTE:MA A B)
  ::
  ++  GTH  ~/  %GTH                                     ::  GREATER-THAN
    |=  {A/@RH B/@RH}
    ~_  LEAF+"RH-FAIL"
    (GTH:MA A B)
  ::
  ++  TOS                                               ::  @RH TO @RS
    |=  {A/@RH}  (BIT:RS (SEA A))
  ::
  ++  FOS                                               ::  @RS TO @RH
    |=  {A/@RS}  (BIT (SEA:RS A))
  ::
  ++  SUN  |=  {A/@U}  ^-  @RH  (SUN:MA A)              ::  UNS INTEGER TO @RH
  ++  SAN  |=  {A/@S}  ^-  @RH  (SAN:MA A)              ::  SGN INTEGER TO @RH
  ++  SIG  |=  {A/@RH}  ^-  ?  (SIG:MA A)               ::  GET SIGN
  ++  EXP  |=  {A/@RH}  ^-  @S  (EXP:MA A)              ::  GET EXPONENT
  ++  TOI  |=  {A/@RH}  ^-  (UNIT @S)  (TOI:MA A)       ::  ROUND TO INTEGER
  ++  DRG  |=  {A/@RH}  ^-  DN  (DRG:MA A)              ::  @RH TO DECIMAL FLOAT
  ++  GRD  |=  {A/DN}  ^-  @RH  (GRD:MA A)              ::  DECIMAL FLOAT TO @RH
  --
::    3C: URBIT TIME                                    ::
::::                                                    ::
  ::  YEAR, YORE, YELL, YULE, YALL, YAWN, YELP, YO      ::
  ::
++  YEAR                                                ::  DATE TO @D
  |=  DET/DATE
  ^-  @DA
  =+  ^=  YER
      ?:  A.DET
        (ADD 292.277.024.400 Y.DET)
      (SUB 292.277.024.400 (DEC Y.DET))
  =+  DAY=(YAWN YER M.DET D.T.DET)
  (YULE DAY H.T.DET M.T.DET S.T.DET F.T.DET)
::
++  YORE                                                ::  @D TO DATE
  |=  NOW/@DA
  ^-  DATE
  =+  RIP=(YELL NOW)
  =+  GER=(YALL D.RIP)
  :-  ?:  (GTH Y.GER 292.277.024.400)
        [A=& Y=(SUB Y.GER 292.277.024.400)]
      [A=| Y=+((SUB 292.277.024.400 Y.GER))]
  [M.GER D.GER H.RIP M.RIP S.RIP F.RIP]
::
++  YELL                                                ::  TARP FROM @D
  |=  NOW/@D
  ^-  TARP
  =+  SEC=(RSH 6 1 NOW)
  =+  ^=  FAN
      =+  [MUC=4 RAW=(END 6 1 NOW)]
      |-  ^-  (LIST @UX)
      ?:  |(=(0 RAW) =(0 MUC))
        ~
      =>  .(MUC (DEC MUC))
      [(CUT 4 [MUC 1] RAW) $(RAW (END 4 MUC RAW))]
  =+  DAY=(DIV SEC DAY:YO)
  =>  .(SEC (MOD SEC DAY:YO))
  =+  HOR=(DIV SEC HOR:YO)
  =>  .(SEC (MOD SEC HOR:YO))
  =+  MIT=(DIV SEC MIT:YO)
  =>  .(SEC (MOD SEC MIT:YO))
  [DAY HOR MIT SEC FAN]
::
++  YULE                                                ::  TIME ATOM
  |=  RIP/TARP
  ^-  @D
  =+  ^=  SEC  ;:  ADD
                 (MUL D.RIP DAY:YO)
                 (MUL H.RIP HOR:YO)
                 (MUL M.RIP MIT:YO)
                 S.RIP
               ==
  =+  ^=  FAC  =+  MUC=4
               |-  ^-  @
               ?~  F.RIP
                 0
               =>  .(MUC (DEC MUC))
               (ADD (LSH 4 MUC I.F.RIP) $(F.RIP T.F.RIP))
  (CON (LSH 6 1 SEC) FAC)
::
++  YALL                                                ::  DAY / TO DAY OF YEAR
  |=  DAY/@UD
  ^-  {Y/@UD M/@UD D/@UD}
  =+  [ERA=0 CET=0 LEP=*?]
  =>  .(ERA (DIV DAY ERA:YO), DAY (MOD DAY ERA:YO))
  =>  ^+  .
      ?:  (LTH DAY +(CET:YO))
        .(LEP &, CET 0)
      =>  .(LEP |, CET 1, DAY (SUB DAY +(CET:YO)))
      .(CET (ADD CET (DIV DAY CET:YO)), DAY (MOD DAY CET:YO))
  =+  YER=(ADD (MUL 400 ERA) (MUL 100 CET))
  |-  ^-  {Y/@UD M/@UD D/@UD}
  =+  DIS=?:(LEP 366 365)
  ?.  (LTH DAY DIS)
    =+  NER=+(YER)
    $(YER NER, DAY (SUB DAY DIS), LEP =(0 (END 0 2 NER)))
  |-  ^-  {Y/@UD M/@UD D/@UD}
  =+  [MOT=0 CAH=?:(LEP MOY:YO MOH:YO)]
  |-  ^-  {Y/@UD M/@UD D/@UD}
  =+  ZIS=(SNAG MOT CAH)
  ?:  (LTH DAY ZIS)
    [YER +(MOT) +(DAY)]
  $(MOT +(MOT), DAY (SUB DAY ZIS))
::
++  YAWN                                                ::  DAYS SINCE JESUS
  |=  {YER/@UD MOT/@UD DAY/@UD}
  ^-  @UD
  =>  .(MOT (DEC MOT), DAY (DEC DAY))
  =>  ^+  .
      %=    .
          DAY
        =+  CAH=?:((YELP YER) MOY:YO MOH:YO)
        |-  ^-  @UD
        ?:  =(0 MOT)
          DAY
        $(MOT (DEC MOT), CAH (SLAG 1 CAH), DAY (ADD DAY (SNAG 0 CAH)))
      ==
  |-  ^-  @UD
  ?.  =(0 (MOD YER 4))
    =+  NEY=(DEC YER)
    $(YER NEY, DAY (ADD DAY ?:((YELP NEY) 366 365)))
  ?.  =(0 (MOD YER 100))
    =+  NEF=(SUB YER 4)
    $(YER NEF, DAY (ADD DAY ?:((YELP NEF) 1.461 1.460)))
  ?.  =(0 (MOD YER 400))
    =+  NEC=(SUB YER 100)
    $(YER NEC, DAY (ADD DAY ?:((YELP NEC) 36.525 36.524)))
  (ADD DAY (MUL (DIV YER 400) (ADD 1 (MUL 4 36.524))))
::
++  YELP                                                ::  LEAP YEAR
  |=  YER/@UD  ^-  ?
  &(=(0 (MOD YER 4)) |(!=(0 (MOD YER 100)) =(0 (MOD YER 400))))
::
++  YO                                                  ::  TIME CONSTANTS
  |%  ++  CET  36.524                 ::  (ADD 24 (MUL 100 365))
      ++  DAY  86.400                 ::  (MUL 24 HOR)
      ++  ERA  146.097                ::  (ADD 1 (MUL 4 CET))
      ++  HOR  3.600                  ::  (MUL 60 MIT)
      ++  JES  106.751.991.084.417    ::  (MUL 730.692.561 ERA)
      ++  MIT  60
      ++  MOH  `(LIST @UD)`[31 28 31 30 31 30 31 31 30 31 30 31 ~]
      ++  MOY  `(LIST @UD)`[31 29 31 30 31 30 31 31 30 31 30 31 ~]
      ++  QAD  126.144.001            ::  (ADD 1 (MUL 4 YER))
      ++  YER  31.536.000             ::  (MUL 365 DAY)
  --
::                                                      ::
::::  3D: SHA HASH FAMILY                               ::
  ::                                                    ::
  ::
++  SHAD  |=(RUZ/@ (SHAX (SHAX RUZ)))                   ::  DOUBLE SHA-256
++  SHAF                                                ::  HALF SHA-256
  |=  {SAL/@ RUZ/@}
  =+  HAZ=(SHAS SAL RUZ)
  (MIX (END 7 1 HAZ) (RSH 7 1 HAZ))
::
++  SHAM                                                ::  128BIT NOUN HASH
  |=  YUX/*  ^-  @UVH  ^-  @
  ?@  YUX
    (SHAF %MASH YUX)
  (SHAF %SHAM (JAM YUX))
::
++  SHAS                                                ::  SALTED HASH
  ~/  %SHAS
  |=  {SAL/@ RUZ/@}
  (SHAX (MIX SAL (SHAX RUZ)))
::
++  SHAX                                                ::  SHA-256
  ~/  %SHAX
  |=  RUZ/@  ^-  @
  (SHAY [(MET 3 RUZ) RUZ])
::
++  SHAY                                                ::  SHA-256 WITH LENGTH
  ~/  %SHAY
  |=  {LEN/@U RUZ/@}  ^-  @
  =>  .(RUZ (CUT 3 [0 LEN] RUZ))
  =+  [FEW==>(FE .(A 5)) WAC=|=({A/@ B/@} (CUT 5 [A 1] B))]
  =+  [SUM=SUM.FEW ROR=ROR.FEW NET=NET.FEW INV=INV.FEW]
  =+  RAL=(LSH 0 3 LEN)
  =+  ^=  FUL
      %+  CAN  0
      :~  [RAL RUZ]
          [8 128]
          [(MOD (SUB 960 (MOD (ADD 8 RAL) 512)) 512) 0]
          [64 (~(NET FE 6) RAL)]
      ==
  =+  LEX=(MET 9 FUL)
  =+  ^=  KBX  0XC671.78F2.BEF9.A3F7.A450.6CEB.90BE.FFFA.
                 8CC7.0208.84C8.7814.78A5.636F.748F.82EE.
                 682E.6FF3.5B9C.CA4F.4ED8.AA4A.391C.0CB3.
                 34B0.BCB5.2748.774C.1E37.6C08.19A4.C116.
                 106A.A070.F40E.3585.D699.0624.D192.E819.
                 C76C.51A3.C24B.8B70.A81A.664B.A2BF.E8A1.
                 9272.2C85.81C2.C92E.766A.0ABB.650A.7354.
                 5338.0D13.4D2C.6DFC.2E1B.2138.27B7.0A85.
                 1429.2967.06CA.6351.D5A7.9147.C6E0.0BF3.
                 BF59.7FC7.B003.27C8.A831.C66D.983E.5152.
                 76F9.88DA.5CB0.A9DC.4A74.84AA.2DE9.2C6F.
                 240C.A1CC.0FC1.9DC6.EFBE.4786.E49B.69C1.
                 C19B.F174.9BDC.06A7.80DE.B1FE.72BE.5D74.
                 550C.7DC3.2431.85BE.1283.5B01.D807.AA98.
                 AB1C.5ED5.923F.82A4.59F1.11F1.3956.C25B.
                 E9B5.DBA5.B5C0.FBCF.7137.4491.428A.2F98
  =+  ^=  HAX  0X5BE0.CD19.1F83.D9AB.9B05.688C.510E.527F.
                 A54F.F53A.3C6E.F372.BB67.AE85.6A09.E667
  =+  I=0
  |-  ^-  @
  ?:  =(I LEX)
    (REP 5 (TURN (RIP 5 HAX) NET))
  =+  ^=  WOX
      =+  DUX=(CUT 9 [I 1] FUL)
      =+  WOX=(REP 5 (TURN (RIP 5 DUX) NET))
      =+  J=16
      |-  ^-  @
      ?:  =(64 J)
        WOX
      =+  :*  L=(WAC (SUB J 15) WOX)
              M=(WAC (SUB J 2) WOX)
              N=(WAC (SUB J 16) WOX)
              O=(WAC (SUB J 7) WOX)
          ==
      =+  X=:(MIX (ROR 0 7 L) (ROR 0 18 L) (RSH 0 3 L))
      =+  Y=:(MIX (ROR 0 17 M) (ROR 0 19 M) (RSH 0 10 M))
      =+  Z=:(SUM N X O Y)
      $(WOX (CON (LSH 5 J Z) WOX), J +(J))
  =+  J=0
  =+  :*  A=(WAC 0 HAX)
          B=(WAC 1 HAX)
          C=(WAC 2 HAX)
          D=(WAC 3 HAX)
          E=(WAC 4 HAX)
          F=(WAC 5 HAX)
          G=(WAC 6 HAX)
          H=(WAC 7 HAX)
      ==
  |-  ^-  @
  ?:  =(64 J)
    %=  ^$
      I  +(I)
      HAX  %+  REP  5
           :~  (SUM A (WAC 0 HAX))
               (SUM B (WAC 1 HAX))
               (SUM C (WAC 2 HAX))
               (SUM D (WAC 3 HAX))
               (SUM E (WAC 4 HAX))
               (SUM F (WAC 5 HAX))
               (SUM G (WAC 6 HAX))
               (SUM H (WAC 7 HAX))
           ==
    ==
  =+  L=:(MIX (ROR 0 2 A) (ROR 0 13 A) (ROR 0 22 A))    ::  S0
  =+  M=:(MIX (DIS A B) (DIS A C) (DIS B C))            ::  MAJ
  =+  N=(SUM L M)                                       ::  T2
  =+  O=:(MIX (ROR 0 6 E) (ROR 0 11 E) (ROR 0 25 E))    ::  S1
  =+  P=(MIX (DIS E F) (DIS (INV E) G))                 ::  CH
  =+  Q=:(SUM H O P (WAC J KBX) (WAC J WOX))            ::  T1
  $(J +(J), A (SUM Q N), B A, C B, D C, E (SUM D Q), F E, G F, H G)
::
++  SHAW                                                ::  HASH TO NBITS
  |=  {SAL/@ LEN/@ RUZ/@}
  (~(RAW OG (SHAS SAL (MIX LEN RUZ))) LEN)
::
++  SHAZ                                                ::  SHA-512
  |=  RUZ/@  ^-  @
  (SHAL [(MET 3 RUZ) RUZ])
::
++  SHAL                                                ::  SHA-512 WITH LENGTH
  ~/  %SHAL
  |=  {LEN/@ RUZ/@}  ^-  @
  =>  .(RUZ (CUT 3 [0 LEN] RUZ))
  =+  [FEW==>(FE .(A 6)) WAC=|=({A/@ B/@} (CUT 6 [A 1] B))]
  =+  [SUM=SUM.FEW ROR=ROR.FEW NET=NET.FEW INV=INV.FEW]
  =+  RAL=(LSH 0 3 LEN)
  =+  ^=  FUL
      %+  CAN  0
      :~  [RAL RUZ]
          [8 128]
          [(MOD (SUB 1.920 (MOD (ADD 8 RAL) 1.024)) 1.024) 0]
          [128 (~(NET FE 7) RAL)]
      ==
  =+  LEX=(MET 10 FUL)
  =+  ^=  KBX  0X6C44.198C.4A47.5817.5FCB.6FAB.3AD6.FAEC.
                 597F.299C.FC65.7E2A.4CC5.D4BE.CB3E.42B6.
                 431D.67C4.9C10.0D4C.3C9E.BE0A.15C9.BEBC.
                 32CA.AB7B.40C7.2493.28DB.77F5.2304.7D84.
                 1B71.0B35.131C.471B.113F.9804.BEF9.0DAE.
                 0A63.7DC5.A2C8.98A6.06F0.67AA.7217.6FBA.
                 F57D.4F7F.EE6E.D178.EADA.7DD6.CDE0.EB1E.
                 D186.B8C7.21C0.C207.CA27.3ECE.EA26.619C.
                 C671.78F2.E372.532B.BEF9.A3F7.B2C6.7915.
                 A450.6CEB.DE82.BDE9.90BE.FFFA.2363.1E28.
                 8CC7.0208.1A64.39EC.84C8.7814.A1F0.AB72.
                 78A5.636F.4317.2F60.748F.82EE.5DEF.B2FC.
                 682E.6FF3.D6B2.B8A3.5B9C.CA4F.7763.E373.
                 4ED8.AA4A.E341.8ACB.391C.0CB3.C5C9.5A63.
                 34B0.BCB5.E19B.48A8.2748.774C.DF8E.EB99.
                 1E37.6C08.5141.AB53.19A4.C116.B8D2.D0C8.
                 106A.A070.32BB.D1B8.F40E.3585.5771.202A.
                 D699.0624.5565.A910.D192.E819.D6EF.5218.
                 C76C.51A3.0654.BE30.C24B.8B70.D0F8.9791.
                 A81A.664B.BC42.3001.A2BF.E8A1.4CF1.0364.
                 9272.2C85.1482.353B.81C2.C92E.47ED.AEE6.
                 766A.0ABB.3C77.B2A8.650A.7354.8BAF.63DE.
                 5338.0D13.9D95.B3DF.4D2C.6DFC.5AC4.2AED.
                 2E1B.2138.5C26.C926.27B7.0A85.46D2.2FFC.
                 1429.2967.0A0E.6E70.06CA.6351.E003.826F.
                 D5A7.9147.930A.A725.C6E0.0BF3.3DA8.8FC2.
                 BF59.7FC7.BEEF.0EE4.B003.27C8.98FB.213F.
                 A831.C66D.2DB4.3210.983E.5152.EE66.DFAB.
                 76F9.88DA.8311.53B5.5CB0.A9DC.BD41.FBD4.
                 4A74.84AA.6EA6.E483.2DE9.2C6F.592B.0275.
                 240C.A1CC.77AC.9C65.0FC1.9DC6.8B8C.D5B5.
                 EFBE.4786.384F.25E3.E49B.69C1.9EF1.4AD2.
                 C19B.F174.CF69.2694.9BDC.06A7.25C7.1235.
                 80DE.B1FE.3B16.96B1.72BE.5D74.F27B.896F.
                 550C.7DC3.D5FF.B4E2.2431.85BE.4EE4.B28C.
                 1283.5B01.4570.6FBE.D807.AA98.A303.0242.
                 AB1C.5ED5.DA6D.8118.923F.82A4.AF19.4F9B.
                 59F1.11F1.B605.D019.3956.C25B.F348.B538.
                 E9B5.DBA5.8189.DBBC.B5C0.FBCF.EC4D.3B2F.
                 7137.4491.23EF.65CD.428A.2F98.D728.AE22
  =+  ^=  HAX  0X5BE0.CD19.137E.2179.1F83.D9AB.FB41.BD6B.
                 9B05.688C.2B3E.6C1F.510E.527F.ADE6.82D1.
                 A54F.F53A.5F1D.36F1.3C6E.F372.FE94.F82B.
                 BB67.AE85.84CA.A73B.6A09.E667.F3BC.C908
  =+  I=0
  |-  ^-  @
  ?:  =(I LEX)
    (REP 6 (TURN (RIP 6 HAX) NET))
  =+  ^=  WOX
      =+  DUX=(CUT 10 [I 1] FUL)
      =+  WOX=(REP 6 (TURN (RIP 6 DUX) NET))
      =+  J=16
      |-  ^-  @
      ?:  =(80 J)
        WOX
      =+  :*  L=(WAC (SUB J 15) WOX)
              M=(WAC (SUB J 2) WOX)
              N=(WAC (SUB J 16) WOX)
              O=(WAC (SUB J 7) WOX)
          ==
      =+  X=:(MIX (ROR 0 1 L) (ROR 0 8 L) (RSH 0 7 L))
      =+  Y=:(MIX (ROR 0 19 M) (ROR 0 61 M) (RSH 0 6 M))
      =+  Z=:(SUM N X O Y)
      $(WOX (CON (LSH 6 J Z) WOX), J +(J))
  =+  J=0
  =+  :*  A=(WAC 0 HAX)
          B=(WAC 1 HAX)
          C=(WAC 2 HAX)
          D=(WAC 3 HAX)
          E=(WAC 4 HAX)
          F=(WAC 5 HAX)
          G=(WAC 6 HAX)
          H=(WAC 7 HAX)
      ==
  |-  ^-  @
  ?:  =(80 J)
    %=  ^$
      I  +(I)
      HAX  %+  REP  6
           :~  (SUM A (WAC 0 HAX))
               (SUM B (WAC 1 HAX))
               (SUM C (WAC 2 HAX))
               (SUM D (WAC 3 HAX))
               (SUM E (WAC 4 HAX))
               (SUM F (WAC 5 HAX))
               (SUM G (WAC 6 HAX))
               (SUM H (WAC 7 HAX))
           ==
    ==
  =+  L=:(MIX (ROR 0 28 A) (ROR 0 34 A) (ROR 0 39 A))   ::  S0
  =+  M=:(MIX (DIS A B) (DIS A C) (DIS B C))            ::  MAJ
  =+  N=(SUM L M)                                       ::  T2
  =+  O=:(MIX (ROR 0 14 E) (ROR 0 18 E) (ROR 0 41 E))   ::  S1
  =+  P=(MIX (DIS E F) (DIS (INV E) G))                 ::  CH
  =+  Q=:(SUM H O P (WAC J KBX) (WAC J WOX))            ::  T1
  $(J +(J), A (SUM Q N), B A, C B, D C, E (SUM D Q), F E, G F, H G)
::
++  SHAN                                                ::  SHA-1 (DEPRECATED)
  |=  RUZ/@
  =+  [FEW==>(FE .(A 5)) WAC=|=({A/@ B/@} (CUT 5 [A 1] B))]
  =+  [SUM=SUM.FEW ROR=ROR.FEW ROL=ROL.FEW NET=NET.FEW INV=INV.FEW]
  =+  RAL=(LSH 0 3 (MET 3 RUZ))
  =+  ^=  FUL
      %+  CAN  0
      :~  [RAL RUZ]
          [8 128]
          [(MOD (SUB 960 (MOD (ADD 8 RAL) 512)) 512) 0]
          [64 (~(NET FE 6) RAL)]
      ==
  =+  LEX=(MET 9 FUL)
  =+  KBX=0XCA62.C1D6.8F1B.BCDC.6ED9.EBA1.5A82.7999
  =+  HAX=0XC3D2.E1F0.1032.5476.98BA.DCFE.EFCD.AB89.6745.2301
  =+  I=0
  |-
  ?:  =(I LEX)
    (REP 5 (FLOP (RIP 5 HAX)))
  =+  ^=  WOX
      =+  DUX=(CUT 9 [I 1] FUL)
      =+  WOX=(REP 5 (TURN (RIP 5 DUX) NET))
      =+  J=16
      |-  ^-  @
      ?:  =(80 J)
        WOX
      =+  :*  L=(WAC (SUB J 3) WOX)
              M=(WAC (SUB J 8) WOX)
              N=(WAC (SUB J 14) WOX)
              O=(WAC (SUB J 16) WOX)
          ==
      =+  Z=(ROL 0 1 :(MIX L M N O))
      $(WOX (CON (LSH 5 J Z) WOX), J +(J))
  =+  J=0
  =+  :*  A=(WAC 0 HAX)
          B=(WAC 1 HAX)
          C=(WAC 2 HAX)
          D=(WAC 3 HAX)
          E=(WAC 4 HAX)
      ==
  |-  ^-  @
  ?:  =(80 J)
    %=  ^$
      I  +(I)
      HAX  %+  REP  5
           :~
               (SUM A (WAC 0 HAX))
               (SUM B (WAC 1 HAX))
               (SUM C (WAC 2 HAX))
               (SUM D (WAC 3 HAX))
               (SUM E (WAC 4 HAX))
           ==
    ==
  =+  FX=(CON (DIS B C) (DIS (NOT 5 1 B) D))
  =+  FY=:(MIX B C D)
  =+  FZ=:(CON (DIS B C) (DIS B D) (DIS C D))
  =+  ^=  TEM
      ?:  &((GTE J 0) (LTE J 19))
        :(SUM (ROL 0 5 A) FX E (WAC 0 KBX) (WAC J WOX))
      ?:  &((GTE J 20) (LTE J 39))
        :(SUM (ROL 0 5 A) FY E (WAC 1 KBX) (WAC J WOX))
      ?:  &((GTE J 40) (LTE J 59))
        :(SUM (ROL 0 5 A) FZ E (WAC 2 KBX) (WAC J WOX))
      :(SUM (ROL 0 5 A) FY E (WAC 3 KBX) (WAC J WOX))
  $(J +(J), A TEM, B A, C (ROL 0 30 B), D C, E D)
::
++  OG                                                  ::  SHAX-POWERED RNG
  ~/  %OG
  |_  A/@
  ++  RAD                                               ::  RANDOM IN RANGE
    |=  B/@  ^-  @
    ~_  LEAF+"RAD-ZERO"
    ?<  =(0 B)
    =+  C=(RAW (MET 0 B))
    ?:((LTH C B) C $(A +(A)))
  ::
  ++  RADS                                              ::  RANDOM CONTINUATION
    |=  B/@
    =+  R=(RAD B)
    [R +>.$(A (SHAS %OG-S (MIX A R)))]
  ::
  ++  RAW                                               ::  RANDOM BITS
    ~/  %RAW
    |=  B/@  ^-  @
    %+  CAN
      0
    =+  C=(SHAS %OG-A (MIX B A))
    |-  ^-  (LIST {@ @})
    ?:  =(0 B)
      ~
    =+  D=(SHAS %OG-B (MIX B (MIX A C)))
    ?:  (LTH B 256)
      [[B (END 0 B D)] ~]
    [[256 D] $(C D, B (SUB B 256))]
  ::
  ++  RAWS                                              ::  RANDOM BITS
    |=  B/@                                             ::  CONTINUATION
    =+  R=(RAW B)
    [R +>.$(A (SHAS %OG-S (MIX A R)))]
  --
::
++  SHA                                                 ::  CORRECT BYTE-ORDER
  ~%  %SHA  ..SHA  ~
  =>  |%
      ++  FLIN  |=(A=@ (SWP 3 A))                       ::  FLIP INPUT
      ++  FLIM  |=(BYTS [WID (REV 3 WID DAT)])          ::  FLIP INPUT W/ LENGTH
      ++  FLIP  |=(W=@U (CURY (CURY REV 3) W))          ::  FLIP OUTPUT OF SIZE
      ++  MEET  |=(A=@ [(MET 3 A) A])                   ::  MEASURE INPUT SIZE
      --
  |%
  ::
  ::  USE WITH @
  ::
  ++  SHA-1     (CORK MEET SHA-1L)
  ++  SHA-256   :(CORK FLIN SHAX (FLIP 32))
  ++  SHA-512   :(CORK FLIN SHAZ (FLIP 64))
  ::
  ::  USE WITH BYTS
  ::
  ++  SHA-256L  :(CORK FLIM SHAY (FLIP 32))
  ++  SHA-512L  :(CORK FLIM SHAL (FLIP 64))
  ::
  ++  SHA-1L
    ~/  %SHA1
    |=  BYTS
    ^-  @
    =+  [FEW==>(FE .(A 5)) WAC=|=({A/@ B/@} (CUT 5 [A 1] B))]
    =+  [SUM=SUM.FEW ROR=ROR.FEW ROL=ROL.FEW NET=NET.FEW INV=INV.FEW]
    =+  RAL=(LSH 0 3 WID)
    =+  ^=  FUL
        %+  CAN  0
        :~  [RAL (REV 3 WID DAT)]
            [8 128]
            [(MOD (SUB 960 (MOD (ADD 8 RAL) 512)) 512) 0]
            [64 (~(NET FE 6) RAL)]
        ==
    =+  LEX=(MET 9 FUL)
    =+  KBX=0XCA62.C1D6.8F1B.BCDC.6ED9.EBA1.5A82.7999
    =+  HAX=0XC3D2.E1F0.1032.5476.98BA.DCFE.EFCD.AB89.6745.2301
    =+  I=0
    |-
    ?:  =(I LEX)
      (REP 5 (FLOP (RIP 5 HAX)))
    =+  ^=  WOX
        =+  DUX=(CUT 9 [I 1] FUL)
        =+  WOX=(REP 5 (TURN (RIP 5 DUX) NET))
        =+  J=16
        |-  ^-  @
        ?:  =(80 J)
          WOX
        =+  :*  L=(WAC (SUB J 3) WOX)
                M=(WAC (SUB J 8) WOX)
                N=(WAC (SUB J 14) WOX)
                O=(WAC (SUB J 16) WOX)
            ==
        =+  Z=(ROL 0 1 :(MIX L M N O))
        $(WOX (CON (LSH 5 J Z) WOX), J +(J))
    =+  J=0
    =+  :*  A=(WAC 0 HAX)
            B=(WAC 1 HAX)
            C=(WAC 2 HAX)
            D=(WAC 3 HAX)
            E=(WAC 4 HAX)
        ==
    |-  ^-  @
    ?:  =(80 J)
      %=  ^$
        I  +(I)
        HAX  %+  REP  5
             :~
                 (SUM A (WAC 0 HAX))
                 (SUM B (WAC 1 HAX))
                 (SUM C (WAC 2 HAX))
                 (SUM D (WAC 3 HAX))
                 (SUM E (WAC 4 HAX))
             ==
      ==
    =+  FX=(CON (DIS B C) (DIS (NOT 5 1 B) D))
    =+  FY=:(MIX B C D)
    =+  FZ=:(CON (DIS B C) (DIS B D) (DIS C D))
    =+  ^=  TEM
        ?:  &((GTE J 0) (LTE J 19))
          :(SUM (ROL 0 5 A) FX E (WAC 0 KBX) (WAC J WOX))
        ?:  &((GTE J 20) (LTE J 39))
          :(SUM (ROL 0 5 A) FY E (WAC 1 KBX) (WAC J WOX))
        ?:  &((GTE J 40) (LTE J 59))
          :(SUM (ROL 0 5 A) FZ E (WAC 2 KBX) (WAC J WOX))
        :(SUM (ROL 0 5 A) FY E (WAC 3 KBX) (WAC J WOX))
    $(J +(J), A TEM, B A, C (ROL 0 30 B), D C, E D)
  --
::                                                      ::
::::  3E: AES ENCRYPTION  (XX REMOVED)                  ::
  ::                                                    ::
  ::
::                                                      ::
::::  3F: SCRAMBLING                                    ::
  ::                                                    ::
  ::    OB                                              ::
  ::
++  UN                                                  ::  =(X (WRED (WREN X)))
  |%
  ++  WREN                                              ::  CONCEAL STRUCTURE
    |=  PYN/@  ^-  @
    =+  LEN=(MET 3 PYN)
    ?:  =(0 LEN)
      0
    =>  .(LEN (DEC LEN))
    =+  MIG=(ZAFT (XAFO LEN (CUT 3 [LEN 1] PYN)))
    %+  CAN  3
    %-  FLOP  ^-  (LIST {@ @})
    :-  [1 MIG]
    |-  ^-  (LIST {@ @})
    ?:  =(0 LEN)
      ~
    =>  .(LEN (DEC LEN))
    =+  MOG=(ZYFT :(MIX MIG (END 3 1 LEN) (CUT 3 [LEN 1] PYN)))
    [[1 MOG] $(MIG MOG)]
  ::
  ++  WRED                                              ::  RESTORE STRUCTURE
    |=  CRY/@  ^-  @
    =+  LEN=(MET 3 CRY)
    ?:  =(0 LEN)
      0
    =>  .(LEN (DEC LEN))
    =+  MIG=(CUT 3 [LEN 1] CRY)
    %+  CAN  3
    %-  FLOP  ^-  (LIST {@ @})
    :-  [1 (XARO LEN (ZART MIG))]
    |-  ^-  (LIST {@ @})
    ?:  =(0 LEN)
      ~
    =>  .(LEN (DEC LEN))
    =+  MOG=(CUT 3 [LEN 1] CRY)
    [[1 :(MIX MIG (END 3 1 LEN) (ZYRT MOG))] $(MIG MOG)]
  ::
  ++  XAFO  |=({A/@ B/@} +((MOD (ADD (DEC B) A) 255)))
  ++  XARO  |=({A/@ B/@} +((MOD (ADD (DEC B) (SUB 255 (MOD A 255))) 255)))
  ::
  ++  ZAFT                                              ::  FORWARD 255-SBOX
    |=  A/@D
    =+  ^=  B
        0XCC.75BC.86C8.2FB1.9A42.F0B3.79A0.92CA.21F6.1E41.CDE5.FCC0.
        7E85.51AE.1005.C72D.1246.07E8.7C64.A914.8D69.D9F4.59C2.8038.
        1F4A.DCA2.6FDF.66F9.F561.A12E.5A16.F7B0.A39F.364E.CB70.7318.
        1DE1.AD31.63D1.ABD4.DB68.6A33.134D.A760.EDEE.5434.493A.E323.
        930D.8F3D.3562.BB81.0B24.43CF.BEA5.A6EB.52B4.0229.06B2.6704.
        78C9.45EC.D75E.58AF.C577.B7B9.C40E.017D.90C3.87F8.96FA.1153.
        0372.7F30.1C32.AC83.FF17.C6E4.D36D.6B55.E2CE.8C71.8A5B.B6F3.
        9D4B.EAB5.8B3C.E7F2.A8FE.9574.5DE0.BF20.3F15.9784.9939.5F9C.
        E609.564F.D8A4.B825.9819.94AA.2C08.8E4C.9B22.477A.2840.3ED6.
        3750.6EF1.44DD.89EF.6576.D00A.FBDA.9ED2.3B6C.7B0C.BDE9.2ADE.
        5C88.C182.481A.1B0F.2BFD.D591.2726.57BA
    (CUT 3 [(DEC A) 1] B)
  ::
  ++  ZART                                              ::  REVERSE 255-SBOX
    |=  A/@D
    =+  ^=  B
        0X68.4F07.EA1C.73C9.75C2.EFC8.D559.5125.F621.A7A8.8591.5613.
        DD52.40EB.65A2.60B7.4BCB.1123.CEB0.1BD6.3C84.2906.B164.19B3.
        1E95.5FEC.FFBC.F187.FBE2.6680.7C77.D30E.E94A.9414.FD9A.017D.
        3A7E.5A55.8FF5.8BF9.C181.E5B6.6AB2.35DA.50AA.9293.3BC0.CDC6.
        F3BF.1A58.4130.F844.3846.744E.36A0.F205.789E.32D8.5E54.5C22.
        0F76.FCE7.4569.0D99.D26E.E879.DC16.2DF4.887F.1FFE.4DBA.6F5D.
        BBCC.2663.1762.AED7.AF8A.CA20.DBB4.9BC7.A942.834C.105B.C4D4.
        8202.3E61.A671.90E6.273D.BDAB.3157.CFA4.0C2E.DF86.2496.F7ED.
        2B48.2A9D.5318.A343.D128.BE9C.A5AD.6BB5.6DFA.C5E1.3408.128D.
        2C04.0339.97A1.2FF0.49D0.EEB8.6C0A.0B37.B967.C347.D9AC.E072.
        E409.7B9F.1598.1D3F.33DE.8CE3.8970.8E7A
    (CUT 3 [(DEC A) 1] B)
  ::
  ++  ZYFT                                              ::  FORWARD 256-SBOX
    |=  A/@D
    =+  ^=  B
        0XBB49.B71F.B881.B402.17E4.6B86.69B5.1647.115F.DDDB.7CA5.
          8371.4BD5.19A9.B092.605D.0D9B.E030.A0CC.78BA.5706.4D2D.
          986A.768C.F8E8.C4C7.2F1C.EFFE.3CAE.01C0.253E.65D3.3872.
          CE0E.7A74.8AC6.DAAC.7E5C.6479.44EC.4143.3D20.4AF0.EE6C.
          C828.DECA.0377.249F.FFCD.7B4F.EB7D.66F2.8951.042E.595A.
          8E13.F9C3.A79A.F788.6199.9391.7FAB.6200.4CE5.0758.E2F1.
          7594.C945.D218.4248.AFA1.E61A.54FB.1482.BEA4.96A2.3473.
          63C2.E7CB.155B.120A.4ED7.BFD8.B31B.4008.F329.FCA3.5380.
          9556.0CB2.8722.2BEA.E96E.3AC5.D1BC.10E3.2C52.A62A.B1D6.
          35AA.D05E.F6A8.0F3B.31ED.559D.09AD.F585.6D21.FD1D.8D67.
          370B.26F4.70C1.B923.4684.6FBD.CF8B.5036.0539.9CDC.D93F.
          9068.1EDF.8F33.B632.D427.97FA.9EE1
    (CUT 3 [A 1] B)
  ::
  ++  ZYRT                                              ::  REVERSE 256-SBOX
    |=  A/@D
    =+  ^=  B
        0X9FC8.2753.6E02.8FCF.8B35.2B20.5598.7CAA.C9A9.30B0.9B48.
          47CE.6371.80F6.407D.00DD.0AA5.ED10.ECB7.0F5A.5C3A.E605.
          C077.4337.17BD.9EDA.62A4.79A7.CCB8.44CD.8E64.1EC4.5B6B.
          1842.FFD8.1DFB.FD07.F2F9.594C.3BE3.73C6.2CB6.8438.E434.
          8D3D.EA6A.5268.72DB.A001.2E11.DE8C.88D3.0369.4F7A.87E2.
          860D.0991.25D0.16B9.978A.4BF4.2A1A.E96C.FA50.85B5.9AEB.
          9DBB.B2D9.A2D1.7BBA.66BE.E81F.1946.29A8.F5D2.F30C.2499.
          C1B3.6583.89E1.EE36.E0B4.6092.937E.D74E.2F6F.513E.9615.
          9C5D.D581.E7AB.FE74.F01B.78B1.AE75.AF57.0EC2.ADC7.3245.
          12BF.2314.3967.0806.31DC.CB94.D43F.493C.54A6.0421.C3A1.
          1C4A.28AC.FC0B.26CA.5870.E576.F7F1.616D.905F.EF41.33BC.
          DF4D.225E.2D56.7FD6.1395.A3F8.C582
    (CUT 3 [A 1] B)
  --
::
++  OB
  |%
  ++  FEEN                                              ::  CONCEAL STRUCTURE V2
    |=  PYN/@  ^-  @
    ?:  &((GTE PYN 0X1.0000) (LTE PYN 0XFFFF.FFFF))
      (ADD 0X1.0000 (FICE (SUB PYN 0X1.0000)))
    ?:  &((GTE PYN 0X1.0000.0000) (LTE PYN 0XFFFF.FFFF.FFFF.FFFF))
      =+  LO=(DIS PYN 0XFFFF.FFFF)
      =+  HI=(DIS PYN 0XFFFF.FFFF.0000.0000)
      %+  CON  HI
      $(PYN LO)
    PYN
  ::
  ++  FEND                                              ::  RESTORE STRUCTURE V2
    |=  CRY/@  ^-  @
    ?:  &((GTE CRY 0X1.0000) (LTE CRY 0XFFFF.FFFF))
      (ADD 0X1.0000 (TEIL (SUB CRY 0X1.0000)))
    ?:  &((GTE CRY 0X1.0000.0000) (LTE CRY 0XFFFF.FFFF.FFFF.FFFF))
      =+  LO=(DIS CRY 0XFFFF.FFFF)
      =+  HI=(DIS CRY 0XFFFF.FFFF.0000.0000)
      %+  CON  HI
      $(CRY LO)
    CRY
  ::
  ++  FICE                                              ::  ADAPTED FROM
    |=  NOR/@                                           ::  BLACK AND ROGAWAY
    ^-  @                                               ::  "CIPHERS WITH
    =+  ^=  SEL                                         ::   ARBITRARY FINITE
    %+  RYND  3                                         ::   DOMAINS", 2002
    %+  RYND  2
    %+  RYND  1
    %+  RYND  0
    [(MOD NOR 65.535) (DIV NOR 65.535)]
    (ADD (MUL 65.535 -.SEL) +.SEL)
  ::
  ++  TEIL                                              ::  REVERSE ++FICE
    |=  VIP/@
    ^-  @
    =+  ^=  SEL
    %+  RUND  0
    %+  RUND  1
    %+  RUND  2
    %+  RUND  3
    [(MOD VIP 65.535) (DIV VIP 65.535)]
    (ADD (MUL 65.535 -.SEL) +.SEL)
  ::
  ++  RYND                                              ::  FEISTEL ROUND
    |=  {N/@ L/@ R/@}
    ^-  {@ @}
    :-  R
    ?~  (MOD N 2)
      (~(SUM FO 65.535) L (MUK (SNAG N RAKU) 2 R))
    (~(SUM FO 65.536) L (MUK (SNAG N RAKU) 2 R))
  ::
  ++  RUND                                              ::  REVERSE ROUND
    |=  {N/@ L/@ R/@}
    ^-  {@ @}
    :-  R
    ?~  (MOD N 2)
      (~(DIF FO 65.535) L (MUK (SNAG N RAKU) 2 R))
    (~(DIF FO 65.536) L (MUK (SNAG N RAKU) 2 R))
  ::
  ++  RAKU
    ^-  (LIST @UX)
    :~  0XB76D.5EED
        0XEE28.1300
        0X85BC.AE01
        0X4B38.7AF7
    ==
  --
::
::::  3G: MOLDS AND MOLD BUILDERS
  ::
++  COIN  $~  [%$ %UD 0]                                ::  PRINT FORMAT
          $%  {$$ P/DIME}                               ::
              {$BLOB P/*}                               ::
              {$MANY P/(LIST COIN)}                     ::
          ==                                            ::
++  DIME  {P/@TA Q/@}                                   ::
++  EDGE  {P/HAIR Q/(UNIT {P/* Q/NAIL})}                ::  PARSING OUTPUT
++  HAIR  {P/@UD Q/@UD}                                 ::  PARSING TRACE
++  LIKE  |*  A/$-(* *)                                 ::  GENERIC EDGE
          |:  B=`*`[(HAIR) ~]                           ::
          :-  P=(HAIR -.B)                              ::
          ^=  Q                                         ::
          ?@  +.B  ~                                    ::
          :-  ~                                         ::
          U=[P=(A +>-.B) Q=[P=(HAIR -.B) Q=(TAPE +.B)]] ::
++  NAIL  {P/HAIR Q/TAPE}                               ::  PARSING INPUT
++  PINT  {P/{P/@ Q/@} Q/{P/@ Q/@}}                     ::  LINE+COLUMN RANGE
++  RULE  _|:($:NAIL $:EDGE)                            ::  PARSING RULE
++  SPOT  {P/PATH Q/PINT}                               ::  RANGE IN FILE
++  TONE  $%  {$0 P/*}                                  ::  SUCCESS
              {$1 P/(LIST)}                             ::  BLOCKS
              {$2 P/(LIST {@TA *})}                     ::  ERROR REPORT
          ==                                            ::
++  TOON  $%  {$0 P/*}                                  ::  SUCCESS
              {$1 P/(LIST)}                             ::  BLOCKS
              {$2 P/(LIST TANK)}                        ::  STACK TRACE
          ==                                            ::
++  WONK  =+  VEQ=$:EDGE                                ::  PRODUCT FROM EDGE
          |@  ++  $  ?~(Q.VEQ !! P.U.Q.VEQ)             ::
          --                                            ::
--  =>
::                                                      ::
::::  4: LAYER FOUR                                     ::
  ::                                                    ::
  ::    4A: EXOTIC BASES                                ::
  ::    4B: TEXT PROCESSING                             ::
  ::    4C: TANK PRINTER                                ::
  ::    4D: PARSING (TRACING)                           ::
  ::    4E: PARSING (COMBINATORS)                       ::
  ::    4F: PARSING (RULE BUILDERS)                     ::
  ::    4G: PARSING (OUTSIDE CALLER)                    ::
  ::    4H: PARSING (ASCII GLYPHS)                      ::
  ::    4I: PARSING (USEFUL IDIOMS)                     ::
  ::    4J: PARSING (BASES AND BASE DIGITS)             ::
  ::    4K: ATOM PRINTING                               ::
  ::    4L: ATOM PARSING                                ::
  ::    4M: FORMATTING FUNCTIONS                        ::
  ::    4N: VIRTUALIZATION                              ::
  ::    4O: MOLDS AND MOLD BUILDERS                     ::
  ::
~%    %QUA
    +
  ==
    %MUTE  MUTE
    %SHOW  SHOW
  ==
|%
::
::::  4A: EXOTIC BASES
  ::
++  PO                                                  ::  PHONETIC BASE
  ~/  %PO
  =+  :-  ^=  SIS                                       ::  PREFIX SYLLABLES
      'DOZMARBINWANSAMLITSIGHIDFIDLISSOGDIRWACSABWISSIB\
      /RIGSOLDOPMODFOGLIDHOPDARDORLORHODFOLRINTOGSILMIR\
      /HOLPASLACROVLIVDALSATLIBTABHANTICPIDTORBOLFOSDOT\
      /LOSDILFORPILRAMTIRWINTADBICDIFROCWIDBISDASMIDLOP\
      /RILNARDAPMOLSANLOCNOVSITNIDTIPSICROPWITNATPANMIN\
      /RITPODMOTTAMTOLSAVPOSNAPNOPSOMFINFONBANMORWORSIP\
      /RONNORBOTWICSOCWATDOLMAGPICDAVBIDBALTIMTASMALLIG\
      /SIVTAGPADSALDIVDACTANSIDFABTARMONRANNISWOLMISPAL\
      /LASDISMAPRABTOBROLLATLONNODNAVFIGNOMNIBPAGSOPRAL\
      /BILHADDOCRIDMOCPACRAVRIPFALTODTILTINHAPMICFANPAT\
      /TACLABMOGSIMSONPINLOMRICTAPFIRHASBOSBATPOCHACTID\
      /HAVSAPLINDIBHOSDABBITBARRACPARLODDOSBORTOCHILMAC\
      /TOMDIGFILFASMITHOBHARMIGHINRADMASHALRAGLAGFADTOP\
      /MOPHABNILNOSMILFOPFAMDATNOLDINHATNACRISFOTRIBHOC\
      /NIMLARFITWALRAPSARNALMOSLANDONDANLADDOVRIVBACPOL\
      /LAPTALPITNAMBONROSTONFODPONSOVNOCSORLAVMATMIPFIP'
      ^=  DEX                                           ::  SUFFIX SYLLABLES
      'ZODNECBUDWESSEVPERSUTLETFULPENSYTDURWEPSERWYLSUN\
      /RYPSYXDYRNUPHEBPEGLUPDEPDYSPUTLUGHECRYTTYVSYDNEX\
      /LUNMEPLUTSEPPESDELSULPEDTEMLEDTULMETWENBYNHEXFEB\
      /PYLDULHETMEVRUTTYLWYDTEPBESDEXSEFWYCBURDERNEPPUR\
      /RYSREBDENNUTSUBPETRULSYNREGTYDSUPSEMWYNRECMEGNET\
      /SECMULNYMTEVWEBSUMMUTNYXREXTEBFUSHEPBENMUSWYXSYM\
      /SELRUCDECWEXSYRWETDYLMYNMESDETBETBELTUXTUGMYRPEL\
      /SYPTERMEBSETDUTDEGTEXSURFELTUDNUXRUXRENWYTNUBMED\
      /LYTDUSNEBRUMTYNSEGLYXPUNRESREDFUNREVREFMECTEDRUS\
      /BEXLEBDUXRYNNUMPYXRYGRYXFEPTYRTUSTYCLEGNEMFERMER\
      /TENLUSNUSSYLTECMEXPUBRYMTUCFYLLEPDEBBERMUGHUTTUN\
      /BYLSUDPEMDEVLURDEFBUSBEPRUNMELPEXDYTBYTTYPLEVMYL\
      /WEDDUCFURFEXNULLUCLENNERLEXRUPNEDLECRYDLYDFENWEL\
      /NYDHUSRELRUDNESHESFETDESRETDUNLERNYRSEBHULRYLLUD\
      /REMLYSFYNWERRYCSUGNYSNYLLYNDYNDEMLUXFEDSEDBECMUN\
      /LYRTESMUDNYTBYRSENWEGFYRMURTELREPTEGPECNELNEVFES'
  |%
  ++  INS  ~/  %INS                                     ::  PARSE PREFIX
           |=  A/@TAS
           =+  B=0
           |-  ^-  (UNIT @)
           ?:(=(256 B) ~ ?:(=(A (TOS B)) [~ B] $(B +(B))))
  ++  IND  ~/  %IND                                     ::  PARSE SUFFIX
           |=  A/@TAS
           =+  B=0
           |-  ^-  (UNIT @)
           ?:(=(256 B) ~ ?:(=(A (TOD B)) [~ B] $(B +(B))))
  ++  TOS  ~/  %TOS                                     ::  FETCH PREFIX
           |=(A/@ ?>((LTH A 256) (CUT 3 [(MUL 3 A) 3] SIS)))
  ++  TOD  ~/  %TOD                                     ::  FETCH SUFFIX
           |=(A/@ ?>((LTH A 256) (CUT 3 [(MUL 3 A) 3] DEX)))
  --
::
++  FA                                                  ::  BASE58CHECK
  =+  KEY='123456789ABCDEFGHJKLMNPQRSTUVWXYZABCDEFGHIJKMNOPQRSTUVWXYZ'
  =+  ^-  YEK/@UX  ~+
      =-  YEK:(ROLL (RIP 3 KEY) -)
      =+  [A=*CHAR B=*@ YEK=`@UX`(FIL 3 256 0XFF)]
      |.
      [+(B) (MIX YEK (LSH 3 `@U`A (~(INV FE 3) B)))]
  |%
  ++  CHA  |=(A/CHAR `(UNIT @UF)`=+(B=(CUT 3 [`@`A 1] YEK) ?:(=(B 0XFF) ~ `B)))
  ++  TOK
    |=  A/@UX  ^-  @UX
    =+  B=(PAD A)
    =-  (~(NET FE 5) (END 3 4 (SHAY 32 -)))
    (SHAY (ADD B (MET 3 A)) (LSH 3 B (SWP 3 A)))
  ::
  ++  PAD  |=(A/@ =+(B=(MET 3 A) ?:((GTE B 21) 0 (SUB 21 B))))
  ++  ENC  |=(A/@UX `@UX`(MIX (LSH 3 4 A) (TOK A)))
  ++  DEN
    |=  A/@UX  ^-  (UNIT @UX)
    =+  B=(RSH 3 4 A)
    ?.  =((TOK B) (END 3 4 A))
      ~
    `B
  --
::
::::  4B: TEXT PROCESSING
  ::
++  AT                                                  ::  BASIC PRINTING
  |_  A/@
  ++  R
    ?:  ?&  (GTE (MET 3 A) 2)
            |-
            ?:  =(0 A)
              &
            =+  VIS=(END 3 1 A)
            ?&  ?|(=('-' VIS) ?&((GTE VIS 'A') (LTE VIS 'Z')))
                $(A (RSH 3 1 A))
            ==
        ==
      RTAM
    ?:  (LTE (MET 3 A) 2)
      RUD
    RUX
  ::
  ++  RF    `TAPE`[?-(A %& '&', %| '|', * !!) ~]
  ++  RN    `TAPE`[?>(=(0 A) '~') ~]
  ++  RT    `TAPE`['\'' (WELD (MESC (TRIP A)) `TAPE`['\'' ~])]
  ++  RTA   RT
  ++  RTAM  `TAPE`['%' (TRIP A)]
  ++  RUB   `TAPE`['0' 'B' (RUM 2 ~ |=(B/@ (ADD '0' B)))]
  ++  RUD   (RUM 10 ~ |=(B/@ (ADD '0' B)))
  ++  RUM
    |=  {B/@ C/TAPE D/$-(@ @)}
    ^-  TAPE
    ?:  =(0 A)
      [(D 0) C]
    =+  E=0
    |-  ^-  TAPE
    ?:  =(0 A)
      C
    =+  F=&(!=(0 E) =(0 (MOD E ?:(=(10 B) 3 4))))
    %=  $
      A  (DIV A B)
      C  [(D (MOD A B)) ?:(F [?:(=(10 B) ',' '-') C] C)]
      E  +(E)
    ==
  ::
  ++  RUP
    =+  B=(MET 3 A)
    ^-  TAPE
    :-  '-'
    |-  ^-  TAPE
    ?:  (GTH (MET 5 A) 1)
      %+  WELD
        $(A (RSH 5 1 A), B (SUB B 4))
      `TAPE`['-' '-' $(A (END 5 1 A), B 4)]
    ?:  =(0 B)
      ['~' ~]
    ?:  (LTE B 1)
      (TRIP (TOS:PO A))
    |-  ^-  TAPE
    ?:  =(2 B)
      =+  C=(RSH 3 1 A)
      =+  D=(END 3 1 A)
      (WELD (TRIP (TOD:PO C)) (TRIP (TOS:PO (MIX C D))))
    =+  C=(RSH 3 2 A)
    =+  D=(END 3 2 A)
    (WELD ^$(A C, B (MET 3 C)) `TAPE`['-' $(A (MIX C D), B 2)])
  ::
  ++  RUV
    ^-  TAPE
    :+  '0'
      'V'
    %^    RUM
        64
      ~
    |=  B/@
    ?:  =(63 B)
      '+'
    ?:  =(62 B)
      '-'
    ?:((LTH B 26) (ADD 65 B) ?:((LTH B 52) (ADD 71 B) (SUB B 4)))
  ::
  ++  RUX  `TAPE`['0' 'X' (RUM 16 ~ |=(B/@ (ADD B ?:((LTH B 10) 48 87))))]
  --
++  CASS                                                ::  LOWERCASE
  |=  VIB/TAPE
  ^-  TAPE
  (TURN VIB |=(A/@ ?.(&((GTE A 'A') (LTE A 'Z')) A (ADD 32 A))))
::
++  CUSS                                                ::  UPPERCASE
  |=  VIB/TAPE
  ^-  TAPE
  (TURN VIB |=(A/@ ?.(&((GTE A 'A') (LTE A 'Z')) A (SUB A 32))))
::
++  CRIP  |=(A/TAPE `@T`(RAP 3 A))                      ::  TAPE TO CORD
::
++  MESC                                                ::  CTRL CODE ESCAPE
  |=  VIB/TAPE
  ^-  TAPE
  ?~  VIB
    ~
  ?:  =('\\' I.VIB)
    ['\\' '\\' $(VIB T.VIB)]
  ?:  ?|((GTH I.VIB 126) (LTH I.VIB 32) =(`@`39 I.VIB))
    ['\\' (WELP ~(RUX AT I.VIB) '/' $(VIB T.VIB))]
  [I.VIB $(VIB T.VIB)]
::
++  RUNT                                                ::  PREPEND REPEATEDLY
  |=  {{A/@ B/@} C/TAPE}
  ^-  TAPE
  ?:  =(0 A)
    C
  [B $(A (DEC A))]
::
++  SAND                                                ::  ATOM SANITY
  |=  A/@TA
  (FLIT (SANE A))
::
++  SANE                                                ::  ATOM SANITY
  |=  A/@TA
  |=  B/@  ^-  ?
  ?.  =(%T (END 3 1 A))
    ::  XX MORE AND BETTER SANITY
    ::
    &
  =+  [INX=0 LEN=(MET 3 B)]
  ?:  =(%TAS A)
    |-  ^-  ?
    ?:  =(INX LEN)  &
    =+  CUR=(CUT 3 [INX 1] B)
    ?&  ?|  &((GTE CUR 'A') (LTE CUR 'Z'))
            &(=('-' CUR) !=(0 INX) !=(LEN INX))
            &(&((GTE CUR '0') (LTE CUR '9')) !=(0 INX))
        ==
        $(INX +(INX))
    ==
  ?:  =(%TA A)
    |-  ^-  ?
    ?:  =(INX LEN)  &
    =+  CUR=(CUT 3 [INX 1] B)
    ?&  ?|  &((GTE CUR 'A') (LTE CUR 'Z'))
            &((GTE CUR '0') (LTE CUR '9'))
            |(=('-' CUR) =('~' CUR) =('_' CUR) =('.' CUR))
        ==
        $(INX +(INX))
    ==
  |-  ^-  ?
  ?:  =(0 B)  &
  =+  CUR=(END 3 1 B)
  ?:  &((LTH CUR 32) !=(10 CUR))  |
  =+  LEN=(TEFF CUR)
  ?&  |(=(1 LEN) =+(I=1 |-(|(=(I LEN) &((GTE (CUT 3 [I 1] B) 128) $(I +(I)))))))
      $(B (RSH 3 LEN B))
  ==
::
++  RUTH                                                ::  BIBLICAL SANITY
  |=  {A/@TA B/*}
  ^-  @
  ?^  B  !!
  ::  ?.  ((SANE A) B)  !!
  B
::
++  TRIM                                                ::  TAPE SPLIT
  |=  {A/@ B/TAPE}
  ^-  {P/TAPE Q/TAPE}
  ?~  B
    [~ ~]
  ?:  =(0 A)
    [~ B]
  =+  C=$(A (DEC A), B T.B)
  [[I.B P.C] Q.C]
::
++  TRIP                                                ::  CORD TO TAPE
  ~/  %TRIP
  |=  A/@  ^-  TAPE
  ?:  =(0 (MET 3 A))
    ~
  [^-(@TA (END 3 1 A)) $(A (RSH 3 1 A))]
::
++  TEFF                                                ::  LENGTH UTF8
  |=  A/@T  ^-  @
  =+  B=(END 3 1 A)
  ?:  =(0 B)
    ?>(=(`@`0 A) 0)
  ?>  |((GTE B 32) =(10 B))
  ?:((LTE B 127) 1 ?:((LTE B 223) 2 ?:((LTE B 239) 3 4)))
::
++  TAFT                                                ::  UTF8 TO UTF32
  |=  A/@T
  ^-  @C
  %+  RAP  5
  |-  ^-  (LIST @C)
  =+  B=(TEFF A)
  ?:  =(0 B)  ~
  =+  ^=  C
      %+  CAN  0
      %+  TURN
        ^-  (LIST {P/@ Q/@})
        ?+  B  !!
          $1  [[0 7] ~]
          $2  [[8 6] [0 5] ~]
          $3  [[16 6] [8 6] [0 4] ~]
          $4  [[24 6] [16 6] [8 6] [0 3] ~]
        ==
      |=({P/@ Q/@} [Q (CUT 0 [P Q] A)])
  ?>  =((TUFT C) (END 3 B A))
  [C $(A (RSH 3 B A))]
::
++  TUBA                                                ::  UTF8 TO UTF32 TAPE
  |=  A/TAPE
  ^-  (LIST @C)
  (RIP 5 (TAFT (RAP 3 A)))                              ::  XX HORRIBLE
::
++  TUFA                                                ::  UTF32 TO UTF8 TAPE
  |=  A/(LIST @C)
  ^-  TAPE
  ?~  A  ""
  (WELD (RIP 3 (TUFT I.A)) $(A T.A))
::
++  TUFT                                                ::  UTF32 TO UTF8 TEXT
  |=  A/@C
  ^-  @T
  %+  RAP  3
  |-  ^-  (LIST @)
  ?:  =(`@`0 A)
    ~
  =+  B=(END 5 1 A)
  =+  C=$(A (RSH 5 1 A))
  ?:  (LTE B 0X7F)
    [B C]
  ?:  (LTE B 0X7FF)
    :*  (MIX 0B1100.0000 (CUT 0 [6 5] B))
        (MIX 0B1000.0000 (END 0 6 B))
        C
    ==
  ?:  (LTE B 0XFFFF)
    :*  (MIX 0B1110.0000 (CUT 0 [12 4] B))
        (MIX 0B1000.0000 (CUT 0 [6 6] B))
        (MIX 0B1000.0000 (END 0 6 B))
        C
    ==
  :*  (MIX 0B1111.0000 (CUT 0 [18 3] B))
      (MIX 0B1000.0000 (CUT 0 [12 6] B))
      (MIX 0B1000.0000 (CUT 0 [6 6] B))
      (MIX 0B1000.0000 (END 0 6 B))
      C
  ==
::
++  WACK                                                ::  KNOT ESCAPE
  |=  A/@TA
  ^-  @TA
  =+  B=(RIP 3 A)
  %+  RAP  3
  |-  ^-  TAPE
  ?~  B
    ~
  ?:  =('~' I.B)  ['~' '~' $(B T.B)]
  ?:  =('_' I.B)  ['~' '-' $(B T.B)]
  [I.B $(B T.B)]
::
++  WICK                                                ::  KNOT UNESCAPE
  |=  A/@
  ^-  (UNIT @TA)
  =+  B=(RIP 3 A)
  =-  ?^(B ~ (SOME (RAP 3 (FLOP C))))
  =|  C/TAPE
  |-  ^-  {B/TAPE C/TAPE}
  ?~  B  [~ C]
  ?.  =('~' I.B)
    $(B T.B, C [I.B C])
  ?~  T.B  [B ~]
  ?-  I.T.B
    $'~'  $(B T.T.B, C ['~' C])
    $'-'  $(B T.T.B, C ['_' C])
    @     [B ~]
  ==
::
++  WOAD                                                ::  CORD UNESCAPE
  |=  A/@TA
  ^-  @T
  %+  RAP  3
  |-  ^-  (LIST @)
  ?:  =(`@`0 A)
    ~
  =+  B=(END 3 1 A)
  =+  C=(RSH 3 1 A)
  ?:  =('.' B)
    [' ' $(A C)]
  ?.  =('~' B)
    [B $(A C)]
  =>  .(B (END 3 1 C), C (RSH 3 1 C))
  ?+  B  =-  (WELD (RIP 3 (TUFT P.D)) $(A Q.D))
         ^=  D
         =+  D=0
         |-  ^-  {P/@ Q/@}
         ?:  =('.' B)
           [D C]
         ?<  =(0 C)
         %=    $
            B  (END 3 1 C)
            C  (RSH 3 1 C)
            D  %+  ADD  (MUL 16 D)
               %+  SUB  B
               ?:  &((GTE B '0') (LTE B '9'))  48
               ?>(&((GTE B 'A') (LTE B 'Z')) 87)
         ==
    $'.'  ['.' $(A C)]
    $'~'  ['~' $(A C)]
  ==
::
++  WOOD                                                ::  CORD ESCAPE
  |=  A/@T
  ^-  @TA
  %+  RAP  3
  |-  ^-  (LIST @)
  ?:  =(`@`0 A)
    ~
  =+  B=(TEFF A)
  =+  C=(TAFT (END 3 B A))
  =+  D=$(A (RSH 3 B A))
  ?:  ?|  &((GTE C 'A') (LTE C 'Z'))
          &((GTE C '0') (LTE C '9'))
          =(`@`'-' C)
      ==
    [C D]
  ?+  C
    :-  '~'
    =+  E=(MET 2 C)
    |-  ^-  TAPE
    ?:  =(0 E)
      ['.' D]
    =.  E  (DEC E)
    =+  F=(RSH 2 E C)
    [(ADD ?:((LTE F 9) 48 87) F) $(C (END 2 E C))]
  ::
    $' '  ['.' D]
    $'.'  ['~' '.' D]
    $'~'  ['~' '~' D]
  ==
::
::::  4C: TANK PRINTER
  ::
++  WASH                                                ::  RENDER TANK AT WIDTH
  |=  {{TAB/@ EDG/@} TAC/TANK}  ^-  WALL
  (~(WIN RE TAC) TAB EDG)
::
::  THIS LIBRARY INCLUDES `PLUME`, THE ACTUAL PRETTY PRINTING LOGIC,
::  AND A HANDFUL OF UTILITIES FOR CONSTRUCTING PLUMS.
::
::  GENERALLY, YOU'LL JUST USE `PLUME` LIKE THIS:
::
::    ~(PLUME TALL PLUM)  ::  PRETTY PRINT `PLUM` IN TALL MODE.
::    ~(PLUME FLAT PLUM)  ::  PRETTY PRINT `PLUM` IN WIDE MODE.
::
::  THERE IS PROBABLY NO REASON TO LOOK AT THE UTILITY ROUTINES UNLESS
::  YOU ARE WRITING SOMETHING TO GENERATE `PLUM`S.
::
::  THIS IS THE PRETTY-PRINTER.  USE THE `FLAT` ARM TO RENDER A PLUM
::  INTO A SINGLE LINE AND USE THE `TALL` ARM TO GET A NICE MULTI-LINE
::  RENDERING THAT SWITCHES TO WIDE MODE IF THERE'S ENOUGH SPACE.
::
::  FOR DETAILS ABOUT HOW THIS WORKS AND WHAT EXACTLY IT DOES IN VARIOUS
::  CASES, TAKE A LOOK AT THE DOCS FOR `PLUM`, `PLUMFMT`, AND AT THE
::  DOCS ON THE ARMS OF THIS DOOR.
::
++  PLUME
  |_  =PLUM
  ::
  ::  AN LINE, INDENTED BY `INDENT` SPACES.
  ::
  +$  LINE  [INDENT=@UD TEXT=TAPE]
  ::
  ::  AN SEQUENCE OF INDENTED LINES.
  ::
  +$  BLOCK  (LIST LINE)
  ::
  ::  +FLAT: PRINT AS A SINGLE LINE
  ::
  ++  FLAT
    ^-  WAIN
    TEXT:LINEAR
  ::
  ::  +TALL: PRINT AS MULTIPLE LINES
  ::
  ++  TALL
    ^-  WAIN
    %+  TURN  WINDOW
    |=  LINE
    (CRIP (RUNT [INDENT ' '] TEXT))
  ::
  ::  +ADJUST: ADJUST LINES TO RIGHT
  ::
  ++  ADJUST
    |=  [TAB=@UD =BLOCK]  ^-  ^BLOCK
    (TURN BLOCK |=([@UD TAPE] [(ADD TAB +<-) +<+]))
  ::
  ::  PREPEND `N` SPACES TO A TAPE.
  ::
  ++  PREPEND-SPACES
    |=  [N=@ T=TAPE]  ^-  TAPE
    (RUNT [N ' '] T)
  ::
  ::  +WINDOW: PRINT AS LIST OF TABBED LINES
  ::
  ++  WINDOW
    ^-  BLOCK
    ~+                                                  ::  FOR RANDOM ACCESS
    ?@  PLUM  [0 (TRIP PLUM)]~                          ::  TRIVIAL TEXT
    ?-  -.PLUM
      ::
      ::  %PARA: LINE-WRAPPABLE PARAGRAPH. THIS IS A STUB; IT SHOULD
      ::  WRAP TEXT TO 40 CHARACTERS.
      ::
      %PARA
        [0 +:LINEAR]~
      ::
      ::  %SBRK: NESTED SUBEXPRESSION
      ::
      ::  THIS IS AN OPPORTUNITY TO SWITCH TO WIDE MODE. FIRST, TRY
      ::  RENDERED IN WIDE MODE. IF THAT'S POSSIBLE AND THE RESULT
      ::  ISN'T TOO BIG, USE THAT. OTHERWISE RECURSE INTO THE SUBPLUM
      ::  WITHOUT SWITCHING TO WIDE MODE.
      ::
      %SBRK
        =/  SUB  KID.PLUM
        ?+    SUB
            WINDOW(PLUM SUB)
          [%TREE *]
            =/  WIDERESULT
              ?~(WIDE.FMT.SUB ~ [~ U=LINEAR])
            ?:  ?&(?=(^ WIDERESULT) (LTE LENGTH.U.WIDERESULT 40))
              [0 TEXT.U.WIDERESULT]~
            WINDOW(PLUM SUB)
        ==
      ::
      ::  %TREE: TRY TO RENDER A TEXT TREE IN TALL MODE.
      ::
      ::  WE WANT TO RENDER THIS IN TALL MODE. FIRST, VERIFY THAT THERE
      ::  THE PLUM HAS A TALL RENDER (IF NOT, FALL BACK TO `LINEAR`
      ::  FORMATTING), THEN RENDER ALL THE SUBPLUMS, AND THEN RENDER
      ::  THEM IN ONE OF THREE WAYS:
      ::
      ::  - IF THE `PLUMFMT` CONTAINS AN `INDEF` AND THAT INDEF HAS
      ::    NO PREFIX, THEN THIS IS A VARIABLE-ARITY RUNE WITH A
      ::    TERMINATOR: USE VERTICAL FORMATTING.
      ::
      ::  - IF THE `PLUMFMT` CONTAINS AN `INDEF` AND THAT INDEF DOES HAVE
      ::    A PREFIX, THEN THIS IS SOMETHING THAT LOOKS LIKE A CORE: USE
      ::    `CORE-LIKE` FORMATTING.
      ::
      ::  - OTHERWISE, THIS IS A RUNE WITH A FIXED NUMBER OF ARGUMENTS
      ::    RENDER THE SUBPLUMS USING BACKSTEP INDENTATION.
      ::
      ::  THERE'S ALSO A SPECIAL CASE WHERE SOMETHING HAS EXACTLY ONE SUB-PLUM.
      ::  WHERE SOMETHING HAS EXACTLY ONE SUB-BLOCK. FOR EXAMPLE, WE
      ::  WANT THIS OUTPUT:
      ::
      ::      |-
      ::      FOO
      ::
      %TREE
        ?~  TALL.FMT.PLUM  [0 TEXT:LINEAR]~
        =/  PRELUDE  (TRIP INTRO.U.TALL.FMT.PLUM)
        |^  =/  BLOCKS   (TURN KIDS.PLUM |=(=^PLUM WINDOW(PLUM PLUM)))
            =/  PRELUDE  (TRIP INTRO.U.TALL.FMT.PLUM)
            ?~  INDEF.U.TALL.FMT.PLUM
              ?:  =(1 (LENT BLOCKS))
                [[0 PRELUDE] (ZING BLOCKS)]
              (BACKSTEP PRELUDE BLOCKS)
            =/  PREFIX  (TRIP SIGIL.U.INDEF.U.TALL.FMT.PLUM)
            =/  FINALE  (TRIP FINAL.U.INDEF.U.TALL.FMT.PLUM)
            ?~  BLOCKS  %+  WELD
                          ?~(PRELUDE ~ [0 PRELUDE]~)
                        ?~(FINALE ~ [0 FINALE]~)
            ?~  PREFIX  (RUNNING PRELUDE BLOCKS FINALE)
            (CORE-LIKE PRELUDE PREFIX BLOCKS FINALE)
        --
    ==
  ::
  ::  RENDER A PLUM IN TALL-MODE USING BACKSTEP INDENTATION. HERE,
  ::  WE ARE RENDERING THINGS THAT LOOK SOMETHING LIKE THIS:
  ::
  ::      :+  FOO
  ::        BAR
  ::      BAZ
  ::
  ++  BACKSTEP
    |=  [PRELUDE=TAPE BLOCKS=(LIST BLOCK)]
    ^-  BLOCK
    %-  ZING
    =/  NKIDS  (LENT BLOCKS)
    =/  IDX  1
    |-  ^-  (LIST BLOCK)
    ?~  BLOCKS  ~
    :_  $(BLOCKS T.BLOCKS, IDX +(IDX))
    ^-  BLOCK
    =/  INDENT  (MUL 2 (SUB NKIDS IDX))
    ?.  =(1 IDX)  (ADJUST INDENT I.BLOCKS)
    (RUNE-INLINE-WITH-BLOCK PRELUDE INDENT I.BLOCKS)
  ::
  ::  TO MAKE THINGS LOOK A BIT NICER, WE WANT TO PUT THE FIRST
  ::  SUB-BLOCK ON THE SAME LINE AS THE RUNE. WE WANT THIS:
  ::
  ::      :-  FOO
  ::      BAZ
  ::
  ::  INSTEAD OF THIS:
  ::
  ::      :-
  ::          FOO
  ::      BAZ
  ::
  ::  THIS HANDLES THE "FOO" CASE.
  ::
  ++  RUNE-INLINE-WITH-BLOCK
    |=  [RUNE=TAPE INDENT=@ BLK=BLOCK]
    ^-  BLOCK
    =.  INDENT  (MAX INDENT (ADD 2 (LENT RUNE)))
    =.  BLK     (ADJUST INDENT BLK)
    ?~  RUNE  BLK
    ?~  BLK   [0 RUNE]~
    :_  T.BLK
    :-  0
    %+  WELD  RUNE
    =/  SPACES-BTWN  (SUB INDENT.I.BLK (LENT RUNE))
    (PREPEND-SPACES SPACES-BTWN TEXT.I.BLK)
  ::
  ::  RENDER A TALL HOON WITH RUNNING INDENTATION. HERE, WE ARE
  ::  RENDERING THINGS THAT LOOK SOPMETHING LIKE:
  ::
  ::      :~  FOO
  ::          BAR
  ::          BAZ
  ::      ==
  ::
  ::  SO, THERE'S BASICALLY THREE CASES HERE: EITHER THE PRELUDE
  ::  IS A RUNE, THE PRELUDE IS EMPTY, OR PRELUDE IS SOME OTHER
  ::  RANDOM-ASS THING.
  ::
  ::  - IF THERE IS NO PRELUDE, THEN JUST COMBINE ALL OF THE
  ::    SUB-BLOCKS TOGETHER UNALTERED.
  ::  - IF IT'S A RUNE (TWO-CHARACTERS WIDE), THEN COMBINE THE
  ::    RUNE AND THE FIRST LINE INTO ONE LINE (SEPARATED BY TWO
  ::    SPACES) AND INDENT THE REST OF THE LINES BY FOUR SPACES.
  ::  - IF THE RUNE IS SOME OTHER RANDOM-ASS THING (HAS A LENGTH
  ::    THAT ISN'T 0 OR 2), THEN RENDER THE PRELUDE ALONE ON THE
  ::    FIRST LINE AND THEN COMBINE THE SUB-BLOCKS TOGETHER,
  ::    ALL INDENTED BY ANOTHER TWO SPACES.
  ::
  ::  REGARDLESS, IF THERE'S A FINALE, STICK IT ON THE END WITHOUT
  ::  ANY INDENTATION.
  ::
  ++  RUNNING
    |=  [PRELUDE=TAPE BLOCKS=(LIST BLOCK) FINALE=TAPE]
    ^-  BLOCK
    =/  RESULT=BLOCK  (ZING BLOCKS)
    =.  RESULT
      ?+    (LENT PRELUDE)
          [[0 PRELUDE] (ADJUST 2 RESULT)]         ::  UNUSUAL PRELUDE
        %0                                        ::  EMPTY PRELUDE
          RESULT
        %2                                        ::  RUNE PRELUDE
          (RUNE-INLINE-WITH-BLOCK PRELUDE 4 RESULT)
      ==
    ?~  FINALE  RESULT
    (SNOC RESULT [0 FINALE])
  ::
  ::  THIS RENDERS SUB-BLOCKS WHERE EACH SUB-BLOCK NEEDS TO BE
  ::  PREFIXED BY SOME TAPE. FOR EXAMPLE:
  ::
  ::      |%
  ::      ++  FOO
  ::        BAR
  ::      ++  BAZ
  ::        QUX
  ::      --
  ::
  ++  CORE-LIKE
    |=  [PRELUDE=TAPE PREFIX=TAPE BLOCKS=(LIST BLOCK) FINALE=TAPE]
    ^-  BLOCK
    =/  CLEAR  (ADD 2 (LENT PREFIX))
    =/  RESULT
      ^-  BLOCK
      %-  ZING
      ^-  (LIST BLOCK)
      %+  TURN  BLOCKS
      |=  BLK=BLOCK
      ^-  BLOCK
      ^+  +<
      =*  TAB  ?~(BLK 0 (SUB CLEAR (MIN CLEAR INDENT.I.BLK)))
      =.  BLK  (ADJUST TAB BLK)
      ?~  BLK  ~
      :_  T.BLK
      :-  0
      %+  WELD  PREFIX
      (RUNT [(SUB INDENT.I.BLK (LENT PREFIX)) ' '] TEXT.I.BLK)
    =.  RESULT
      ?~  FINALE  RESULT
      (SNOC RESULT [0 FINALE])
    ?~  PRELUDE  RESULT
    [[0 PRELUDE] RESULT]
  ::
  ::  +LINEAR: RENDER A PLUM ONTO A SINGLE LINE, EVEN IF IT ONLY HAS A
  ::  WIDE FORM.
  ::
  ++  LINEAR
    ^-  [LENGTH=@UD TEXT=TAPE]
    ~+                                                  ::  ~+ FOR RANDOM ACCESS
    ?@  PLUM  [(MET 3 PLUM) (TRIP PLUM)]                ::  JUST A CORD.
    ?-  -.PLUM
      ::
      ::  THIS IS ALREADY IN WIDE MODE, SO %SBRK NODES DON'T MATTER HERE.
      ::
      %SBRK
        LINEAR(PLUM KID.PLUM)
      ::
      ::  %PARA: TO WRITE A WRAPPABLE TEXT PARAGRAPH TO A SINGLE LINE,
      ::  WE JUST COMBINE ALL THE LINES INTO ONE, INTERSPERSING SINGLE
      ::  SPACES CHARS.
      ::
      %PARA
        |-  ^-  [LENGTH=@UD TEXT=TAPE]
        ?~  LINES.PLUM  [0 ~]
        =/  NEXT  $(LINES.PLUM T.LINES.PLUM)
        =/  THIS  [LENGTH=(MET 3 I.LINES.PLUM) TEXT=(TRIP I.LINES.PLUM)]
        :-  (ADD +(LENGTH.THIS) LENGTH.NEXT)
        (WELD TEXT.THIS `TAPE`[' ' TEXT.NEXT])
      ::
      ::  RENDER A TEXT TREE TO A SINGLE LINE.
      ::
      %TREE
        |^  ^-  [LENGTH=@UD TEXT=TAPE]
            ?~  WIDE.FMT.PLUM  (FORCE-WIDE WINDOW)
            =/  BODY  (RENDER-BODY DELIMIT.U.WIDE.FMT.PLUM KIDS.PLUM)
            ?~  ENCLOSE.U.WIDE.FMT.PLUM  BODY
            (WRAP-WITH-ENCLOSE U.ENCLOSE.U.WIDE.FMT.PLUM BODY)
        ::
        ::  GIVEN A LIST OF SUBPLUMS AND A DELIMITER, RENDER ALL THE
        ::  SUBPLUMS ONTO A SINGLE LINE, AND COMBINE THEM INTO A SINGLE
        ::  STRING BY INTERSPERSING THE DELIMITER.
        ::
        ++  RENDER-BODY
           |=  [DELIMIT=CORD KIDS=(LIST ^PLUM)]
           =/  STOP  (TRIP DELIMIT)
           |-  ^-  [LENGTH=@UD TEXT=TAPE]
           ?~  KIDS  [0 ~]
           =/  NEXT  $(KIDS T.KIDS)
           =/  THIS  LINEAR(PLUM I.KIDS)
           ?~  TEXT.NEXT  THIS
           :-  :(ADD LENGTH.THIS (LENT STOP) LENGTH.NEXT)
           :(WELD TEXT.THIS STOP TEXT.NEXT)
        ::
        ::  WRAP A WIDE-FORM-RENDERED RESULT WITH THE `ENCLOSE`  CORDS
        ::  FROM ITS `PLUMEFMT`.
        ::
        ++  WRAP-WITH-ENCLOSE
          |=  [CLAMPS=(PAIR CORD CORD) BODY=[LENGTH=@ TEXT=TAPE]]
          ^-  [LENGTH=@UD TEXT=TAPE]
          ::
          =/  CLOSE  [(TRIP -.CLAMPS) (TRIP +.CLAMPS)]
          :-  :(ADD LENGTH.BODY (LENT -.CLOSE) (LENT +.CLOSE))
          :(WELD -.CLOSE TEXT.BODY +.CLOSE)
        ::
        ::  GIVEN THE RESULT OF RENDERING A PLUM IN TALL FORM, COMBINE
        ::  ALL THE LINES INTO ONE BY SEPARATING EACH BY TWO SPACES.
        ::
        ++  FORCE-WIDE
          |=  RENDER=(LIST [@UD TEXT=TAPE])
          ^-  [LENGTH=@UD TEXT=TAPE]
          ::
          ?~  RENDER  [0 ~]
          =/  NEXT  (FORCE-WIDE T.RENDER)
          :-  :(ADD (LENT TEXT.I.RENDER) 2 LENGTH.NEXT)
          ?~(TEXT.NEXT TEXT.I.RENDER :(WELD TEXT.I.RENDER "  " TEXT.NEXT))
        --
    ==
  --
::
::  CONVENIENCE FUNCTION TO BUILD A `PLUMFMT` FOR A RUNE WITH A FIXED
::  NUMBER OF PARAMETERS.
::
++  FIXED
  |=  RUNE=@TA
  ^-  PLUMFMT
  [WIDE=`[' ' `[(CAT 3 +< '(') ')']] TALL=`[+< ~]]
::
::  SAME AS `FIXED` BUT ONLY OUTPUTS IN `TALL` MODE.
::
++  TALL-FIXED
  |=  RUNE=CORD
  ^-  (UNIT [CORD (UNIT [CORD CORD])])
  `[RUNE ~]
::
::  CONVENIENCE FUNCTION TO BUILD A THE `TALL` PART OF A `PLUMFMT` FOR
::  A RUNNING-STYLE RUNE (ONE THAT TAKES A VARIABLE NUMBER OF PARAMETERS
::  AND HAS A TERMINATOR).
::
++  TALL-RUNNING
  |=  [RUNE=CORD SIGIL=CORD TERM=CORD]
  ^-  (UNIT [CORD (UNIT [CORD CORD])])
  `[RUNE `[SIGIL TERM]]
::
::  CONVENIENCE FUNCTION FOR RENDERING A RUNE INTO A PLUM. THIS TAKES
::  A RUNE, AN OPTIONAL TALL-FORM TERMINATOR, OPTIONALLY A SHORT-FORM (IF
::  YOU DON'T SUPPLY A SHORT-FORM, IT'LL JUST CONSTRUCT THE STANDARD
::  WIDE-FORM (E.G. "?~(X X ~)") FOR YOU, AND A LIST OF SUB-PLUMS.
::
++  RUNE
  |=  $:  RUNE=CORD
          TERM=(UNIT CORD)
          SHORT=(UNIT [CORD CORD CORD])
          KIDS=(LIST PLUM)
      ==
  ^.  PLUM
  |^  :-  %SBRK
      :+  %TREE
        :-  (RUNE-WIDE-FORM RUNE SHORT)
        ?~  TERM  (TALL-FIXED RUNE)
        (TALL-RUNNING RUNE '' U.TERM)
      KIDS
  ::
  ::  IF YOU JUST GIVE THIS A RUNE, IT'LL BUILD THE STANDARD WIDE-FORM.
  ::  OTHERWISE, IT'LL JUST USE THE ONE THAT YOU GAVE IT.
  ::
  ++  RUNE-WIDE-FORM
    |=  [RUNE=CORD SHORT=(UNIT [FST=CORD MID=CORD LST=CORD])]
    ^-  (UNIT (PAIR CORD (UNIT [CORD CORD])))
    =*  FST  (CAT 3 RUNE '(')
    =*  STD  `[' ' `[FST ')']]
    ?~  SHORT  STD
    `[MID.U.SHORT `[FST.U.SHORT LST.U.SHORT]]
  --
::
::  JUST A HELPER FUNCTION FOR CONSTRUCTING A WIDE-FORM %TREE PLUM.
::
++  SIMPLE-WIDE
  |=  [INIT=CORD SEP=CORD END=CORD KIDS=(LIST PLUM)]
  ^-  PLUM
  =/  FMT=PLUMFMT  [WIDE=[~ SEP [~ INIT END]] TALL=~]
  [%TREE FMT KIDS]
::
::  CONVENIENCE FUNCTION THAT BUILDS A PLUM FOR A SUBEXPRESSION. THE
::  `%SBRK` TELLS THE PRETTY-PRINTER THAT THIS IS A VALID PLACE TO
::  SWITCH FROM TALL MODE TO WIDE MODE.
::
++  SUBTREE
  |=  [P=PLUMFMT Q=(LIST PLUM)]
  ^-  PLUM
  [%SBRK [%TREE P Q]]
::
::  CONVENIENCE FOR GENERATING PLUMS THAT LOOK LIKE S-EXPRESSIONS. USEFUL
::  FOR QUICKLY GETTING DECENT-LOOKING DEBUG OUTPUT.
::
++  SEXP
  |=  [SYM=CORD KIDS=(LIST PLUM)]
  ^-  PLUM
  =/  HEAD=CORD     (CAT 3 '(' SYM)
  =/  HEADSPC=CORD  (CAT 3 HEAD ' ')
  =/  SYMCOL=CORD  (CAT 3 SYM ':')
  =/  FMT=PLUMFMT   [[~ ' ' [~ HEADSPC ')']] [~ SYMCOL [~ '' '']]]
  ?~  KIDS  (CAT 3 '(' (CAT 3 SYM ')'))
  [%SBRK [%TREE FMT KIDS]]
::
++  RE
  |_  TAC/TANK
  ++  RAM
    ^-  TAPE
    ?-    -.TAC
        $LEAF  P.TAC
        $PLUM  ~(FLAT PLUME P.TAC)
        $PALM  RAM(TAC [%ROSE [P.P.TAC (WELD Q.P.TAC R.P.TAC) S.P.TAC] Q.TAC])
        $ROSE
      %+  WELD
        Q.P.TAC
      |-  ^-  TAPE
      ?~  Q.TAC
        R.P.TAC
      =+  VOZ=$(Q.TAC T.Q.TAC)
      (WELD RAM(TAC I.Q.TAC) ?~(T.Q.TAC VOZ (WELD P.P.TAC VOZ)))
    ==
  ::
  ++  UG                                                ::  HORRIBLE HACK
    |%
    ++  ACE                                             ::  STRIP CTRL CHARS
      |=  A=TAPE
      ^-  TAPE
      ?~  A  ~
      ?:  |((LTH I.A 32) =(127 `@`I.A))
        $(A T.A)
      [I.A $(A T.A)]
    ::
    ++  ACT                                             ::  PRETEND TAPES
      |=  TAC=TANK
      ^-  TANK
      ?-  -.TAC
        %LEAF  [%LEAF (HEW P.TAC)]
        %PLUM  TAC    ::  XX CONSIDER
        %PALM  :+  %PALM
                 [(HEW P.P.TAC) (HEW Q.P.TAC) (HEW R.P.TAC) (HEW S.P.TAC)]
               (TURN Q.TAC ACT)
        %ROSE  :+  %ROSE
                 [(HEW P.P.TAC) (HEW Q.P.TAC) (HEW R.P.TAC)]
               (TURN Q.TAC ACT)
      ==
    ::
    ++  FIX                                             ::  RESTORE TAPES
      |=  WOL=WALL
      %+  TURN  WOL
      |=(A=TAPE (TUFA `(LIST @C)``(LIST @)`A))
    ::
    ++  HEW                                             ::  PRETEND TAPE
      |=(A=TAPE `TAPE``(LIST @)`(TUBA (ACE A)))
    --
  ::
  ++  WIN
    |=  {TAB/@ EDG/@}
    =.  TAC  (ACT:UG TAC)
    %-  FIX:UG
    =+  LUG=`WALL`~
    |^  |-  ^-  WALL
        ?-    -.TAC
            $LEAF  (RIG P.TAC)
            $PLUM  (TURN ~(TALL PLUME P.TAC) |=(=CORD (TRIP CORD)))
            $PALM
          ?:  FIT
            (RIG RAM)
          ?~  Q.TAC
            (RIG Q.P.TAC)
          ?~  T.Q.TAC
            (RIG(TAB (ADD 2 TAB), LUG $(TAC I.Q.TAC)) Q.P.TAC)
          =>  .(Q.TAC `(LIST TANK)`Q.TAC)
          =+  LYN=(MUL 2 (LENT Q.TAC))
          =+  ^=  QYR
              |-  ^-  WALL
              ?~  Q.TAC
                LUG
              %=  ^$
                TAC  I.Q.TAC
                TAB  (ADD TAB (SUB LYN 2))
                LUG  $(Q.TAC T.Q.TAC, LYN (SUB LYN 2))
              ==
          (WIG(LUG QYR) Q.P.TAC)
        ::
            $ROSE
          ?:  FIT
            (RIG RAM)
          =.  LUG
            |-  ^-  WALL
            ?~  Q.TAC
              ?:(=(~ R.P.TAC) LUG (RIG R.P.TAC))
            ^$(TAC I.Q.TAC, LUG $(Q.TAC T.Q.TAC), TAB DIN)
          ?:  =(~ Q.P.TAC)
            LUG
          (WIG Q.P.TAC)
        ==
    ::
    ++  DIN  (MOD (ADD 2 TAB) (MUL 2 (DIV EDG 3)))
    ++  FIT  (LTE (LENT RAM) (SUB EDG TAB))
    ++  RIG
      |=  HOM/TAPE
      ^-  WALL
      ?:  (LTE (LENT HOM) (SUB EDG TAB))
        [(RUNT [TAB ' '] HOM) LUG]
      =>  .(TAB (ADD TAB 2), EDG (SUB EDG 2))
      =+  MUT=(TRIM (SUB EDG TAB) HOM)
      :-  (RUNT [(SUB TAB 2) ' '] ['\\' '/' (WELD P.MUT `_HOM`['\\' '/' ~])])
      =>  .(HOM Q.MUT)
      |-
      ?~  HOM
        :-  %+  RUNT
              [(SUB TAB 2) ' ']
            ['\\' '/' (RUNT [(SUB EDG TAB) ' '] ['\\' '/' ~])]
        LUG
      =>  .(MUT (TRIM (SUB EDG TAB) HOM))
      [(RUNT [TAB ' '] P.MUT) $(HOM Q.MUT)]
    ::
    ++  WIG
      |=  HOM/TAPE
      ^-  WALL
      ?~  LUG
        (RIG HOM)
      =+  LIN=(LENT HOM)
      =+  WUG=:(ADD 1 TAB LIN)
      ?.  =+  MIR=I.LUG
          |-  ?~  MIR
                |
              ?|(=(0 WUG) ?&(=(' ' I.MIR) $(MIR T.MIR, WUG (DEC WUG))))
        (RIG HOM)       :: ^ XX REGULAR FORM?
      [(RUNT [TAB ' '] (WELD HOM `TAPE`[' ' (SLAG WUG I.LUG)])) T.LUG]
    --
  --
++  SHOW                                                ::  XX DEPRECATED!
  |=  VEM/*
  |^  ^-  TANK
      ?:  ?=(@ VEM)
        [%LEAF (MESC (TRIP VEM))]
      ?-    VEM
          {S/~ C/*}
        [%LEAF '\'' (WELD (MESC (TAPE +.VEM)) `TAPE`['\'' ~])]
      ::
          {S/$A C/@}        [%LEAF (MESC (TRIP C.VEM))]
          {S/$B C/*}        (SHOP C.VEM |=(A/@ ~(RUB AT A)))
          {S/{$C P/@} C/*}
        :+  %PALM
          [['.' ~] ['-' ~] ~ ~]
        [[%LEAF (MESC (TRIP P.S.VEM))] $(VEM C.VEM) ~]
      ::
          {S/$D C/*}        (SHOP C.VEM |=(A/@ ~(RUD AT A)))
          {S/$K C/*}        (TANK C.VEM)
          {S/$H C/*}
        :+  %ROSE
          [['/' ~] ['/' ~] ~]
        =+  YOL=((LIST @TA) C.VEM)
        (TURN YOL |=(A/@TA [%LEAF (TRIP A)]))
      ::
          {S/$L C/*}        (SHOL C.VEM)
          {S/$O C/*}
        %=    $
            VEM
          :-  [%M '%H::[%D %D].[%D %D]>']
          [-.C.VEM +<-.C.VEM +<+.C.VEM +>-.C.VEM +>+.C.VEM ~]
        ==
      ::
          {S/$P C/*}        (SHOP C.VEM |=(A/@ ~(RUP AT A)))
          {S/$Q C/*}        (SHOP C.VEM |=(A/@ ~(R AT A)))
          {S/$R C/*}        $(VEM [[%R ' ' '{' '}'] C.VEM])
          {S/$T C/*}        (SHOP C.VEM |=(A/@ ~(RT AT A)))
          {S/$V C/*}        (SHOP C.VEM |=(A/@ ~(RUV AT A)))
          {S/$X C/*}        (SHOP C.VEM |=(A/@ ~(RUX AT A)))
          {S/{$M P/@} C/*}  (SHEP P.S.VEM C.VEM)
          {S/{$R P/@} C/*}
        $(VEM [[%R ' ' (CUT 3 [0 1] P.S.VEM) (CUT 3 [1 1] P.S.VEM)] C.VEM])
      ::
          {S/{$R P/@ Q/@ R/@} C/*}
        :+  %ROSE
          :*  P=(MESC (TRIP P.S.VEM))
              Q=(MESC (TRIP Q.S.VEM))
              R=(MESC (TRIP R.S.VEM))
          ==
        |-  ^-  (LIST TANK)
        ?@  C.VEM
          ~
        [^$(VEM -.C.VEM) $(C.VEM +.C.VEM)]
      ::
          {S/$Z C/*}        $(VEM [[%R %$ %$ %$] C.VEM])
          *                 !!
      ==
  ++  SHEP
    |=  {FOM/@ GAR/*}
    ^-  TANK
    =+  L=(MET 3 FOM)
    =+  I=0
    :-  %LEAF
    |-  ^-  TAPE
    ?:  (GTE I L)
      ~
    =+  C=(CUT 3 [I 1] FOM)
    ?.  =(37 C)
      (WELD (MESC [C ~]) $(I +(I)))
    =+  D=(CUT 3 [+(I) 1] FOM)
    ?.  .?(GAR)
      ['\\' '#' $(I (ADD 2 I))]
    (WELD ~(RAM RE (SHOW D -.GAR)) $(I (ADD 2 I), GAR +.GAR))
  ::
  ++  SHOP
    |=  {AUG/* VEL/$-(A/@ TAPE)}
    ^-  TANK
    ?:  ?=(@ AUG)
      [%LEAF (VEL AUG)]
    :+  %ROSE
      [[' ' ~] ['[' ~] [']' ~]]
    =>  .(AUG `*`AUG)
    |-  ^-  (LIST TANK)
    ?:  ?=(@ AUG)
      [^$ ~]
    [^$(AUG -.AUG) $(AUG +.AUG)]
  ::
  ++  SHOL
    |=  LIM/*
    :+  %ROSE
      [['.' ~] ~ ~]
    |-    ^-  (LIST TANK)
    ?:  ?=(@ LIM)  ~
    :_  $(LIM +.LIM)
    ?+  -.LIM  (SHOW '#')
        ~   (SHOW '$')
        C/@  (SHOW C.LIM)
        {%& $1}  (SHOW '.')
        {%& C/@}
      [%LEAF '+' ~(RUD AT C.LIM)]
    ::
        {%| @ ~}  (SHOW ',')
        {%| N/@ ~ C/@}
      [%LEAF (WELD (REAP N.LIM '^') ?~(C.LIM "$" (TRIP C.LIM)))]
    ==
  --
::
::::  4D: PARSING (TRACING)
  ::
++  LAST  |=  {ZYC/HAIR NAZ/HAIR}                       ::  FARTHER TRACE
          ^-  HAIR
          ?:  =(P.ZYC P.NAZ)
            ?:((GTH Q.ZYC Q.NAZ) ZYC NAZ)
          ?:((GTH P.ZYC P.NAZ) ZYC NAZ)
::
++  LUST  |=  {WEQ/CHAR NAZ/HAIR}                       ::  DETECT NEWLINE
          ^-  HAIR
          ?:(=(`@`10 WEQ) [+(P.NAZ) 1] [P.NAZ +(Q.NAZ)])
::
::::  4E: PARSING (COMBINATORS)
  ::
++  BEND                                                ::  CONDITIONAL COMP
  ~/  %BEND
  =+  RAQ=|*({A/* B/*} [~ U=[A B]])
  |@
  ++  $
    ~/  %FUN
    |*  {VEX/EDGE SAB/RULE}
    ?~  Q.VEX
      VEX
    =+  YIT=(SAB Q.U.Q.VEX)
    =+  YUR=(LAST P.VEX P.YIT)
    ?~  Q.YIT
      [P=YUR Q=Q.VEX]
    =+  VUX=(RAQ P.U.Q.VEX P.U.Q.YIT)
    ?~  VUX
      [P=YUR Q=Q.VEX]
    [P=YUR Q=[~ U=[P=U.VUX Q=Q.U.Q.YIT]]]
  --
::
++  COMP
  ~/  %COMP
  =+  RAQ=|*({A/* B/*} [A B])                           ::  ARBITRARY COMPOSE
  |@
  ++  $
    ~/  %FUN
    |*  {VEX/EDGE SAB/RULE}
    ~!  +<
    ?~  Q.VEX
      VEX
    =+  YIT=(SAB Q.U.Q.VEX)
    =+  YUR=(LAST P.VEX P.YIT)
    ?~  Q.YIT
      [P=YUR Q=Q.YIT]
    [P=YUR Q=[~ U=[P=(RAQ P.U.Q.VEX P.U.Q.YIT) Q=Q.U.Q.YIT]]]
  --
::
++  FAIL  |=(TUB/NAIL [P=P.TUB Q=~])                    ::  NEVER PARSE
++  GLUE                                                ::  ADD RULE
  ~/  %GLUE
  |*  BUS/RULE
  ~/  %FUN
  |*  {VEX/EDGE SAB/RULE}
  (PLUG VEX ;~(PFIX BUS SAB))
::
++  LESS                                                ::  NO FIRST AND SECOND
  |*  {VEX/EDGE SAB/RULE}
  ?~  Q.VEX
    =+  ROQ=(SAB)
    [P=(LAST P.VEX P.ROQ) Q=Q.ROQ]
  (FAIL +<.SAB)
::
++  PFIX                                                ::  DISCARD FIRST RULE
  ~/  %PFIX
  |*  SAM=*
  %.  SAM
  (COMP |*({A/* B/*} B))
::
++  PLUG                                                ::  FIRST THEN SECOND
  ~/  %PLUG
  |*  {VEX/EDGE SAB/RULE}
  ?~  Q.VEX
    VEX
  =+  YIT=(SAB Q.U.Q.VEX)
  =+  YUR=(LAST P.VEX P.YIT)
  ?~  Q.YIT
    [P=YUR Q=Q.YIT]
  [P=YUR Q=[~ U=[P=[P.U.Q.VEX P.U.Q.YIT] Q=Q.U.Q.YIT]]]
::
++  POSE                                                ::  FIRST OR SECOND
  ~/  %POSE
  |*  {VEX/EDGE SAB/RULE}
  ?~  Q.VEX
    =+  ROQ=(SAB)
    [P=(LAST P.VEX P.ROQ) Q=Q.ROQ]
  VEX
::
++  SIMU                                                ::  FIRST AND SECOND
  |*  {VEX/EDGE SAB/RULE}
  ?~  Q.VEX
    VEX
  =+  ROQ=(SAB)
  ROQ
::
++  SFIX                                                ::  DISCARD SECOND RULE
  ~/  %SFIX
  |*  SAM=*
  %.  SAM
  (COMP |*({A/* B/*} A))
::
::::  4F: PARSING (RULE BUILDERS)
  ::
++  BASS                                                ::  LEFTMOST BASE
  |*  {WUC/@ TYD/RULE}
  %+  COOK
    |=  WAQ/(LIST @)
    %+  ROLL
      WAQ
    =|({P/@ Q/@} |.((ADD P (MUL WUC Q))))
  TYD
::
++  BOSS                                                ::  RIGHTMOST BASE
  |*  {WUC/@ TYD/RULE}
  %+  COOK
    |=  WAQ/(LIST @)
    %+  REEL
      WAQ
    =|({P/@ Q/@} |.((ADD P (MUL WUC Q))))
  TYD
::
++  COLD                                                ::  REPLACE W+ CONSTANT
  ~/  %COLD
  |*  {CUS/* SEF/RULE}
  ~/  %FUN
  |=  TUB/NAIL
  =+  VEX=(SEF TUB)
  ?~  Q.VEX
    VEX
  [P=P.VEX Q=[~ U=[P=CUS Q=Q.U.Q.VEX]]]
::
++  COOK                                                ::  APPLY GATE
  ~/  %COOK
  |*  {POQ/GATE SEF/RULE}
  ~/  %FUN
  |=  TUB/NAIL
  =+  VEX=(SEF TUB)
  ?~  Q.VEX
    VEX
  [P=P.VEX Q=[~ U=[P=(POQ P.U.Q.VEX) Q=Q.U.Q.VEX]]]
::
++  EASY                                                ::  ALWAYS PARSE
  ~/  %EASY
  |*  HUF/*
  ~/  %FUN
  |=  TUB/NAIL
  ^-  (LIKE _HUF)
  [P=P.TUB Q=[~ U=[P=HUF Q=TUB]]]
::
++  FUSS
  |=  {SIC/@T NON/@T}
  ;~(POSE (COLD %& (JEST SIC)) (COLD %| (JEST NON)))
::
++  FULL                                                ::  HAS TO FULLY PARSE
  |*  SEF/RULE
  |=  TUB/NAIL
  =+  VEX=(SEF TUB)
  ?~(Q.VEX VEX ?:(=(~ Q.Q.U.Q.VEX) VEX [P=P.VEX Q=~]))
::
++  FUNK                                                ::  ADD TO TAPE FIRST
  |*  {PRE/TAPE SEF/RULE}
  |=  TUB/NAIL
  (SEF P.TUB (WELD PRE Q.TUB))
::
++  HERE                                                ::  PLACE-BASED APPLY
  ~/  %HERE
  =+  [HEZ=|=({A/PINT B/*} [A B]) SEF=*RULE]
  |@
  ++  $
    ~/  %FUN
    |=  TUB/NAIL
    =+  VEX=(SEF TUB)
    ?~  Q.VEX
      VEX
    [P=P.VEX Q=[~ U=[P=(HEZ [P.TUB P.Q.U.Q.VEX] P.U.Q.VEX) Q=Q.U.Q.VEX]]]
  --
::
++  INDE  |*  SEF/RULE                                  :: INDENTATION BLOCK
  |=  NAIL  ^+  (SEF)
  =+  [HAR TAP]=[P Q]:+<
  =+  LEV=(FIL 3 (DEC Q.HAR) ' ')
  =+  EOL=(JUST `@T`10)
  =+  =-  ROQ=((STAR ;~(POSE PRN ;~(SFIX EOL (JEST LEV)) -)) HAR TAP)
      ;~(SIMU ;~(PLUG EOL EOL) EOL)
  ?~  Q.ROQ  ROQ
  =+  VEX=(SEF HAR(Q 1) P.U.Q.ROQ)
  =+  FUR=P.VEX(Q (ADD (DEC Q.HAR) Q.P.VEX))
  ?~  Q.VEX  VEX(P FUR)
  =-  VEX(P FUR, U.Q -)
  :+  &3.VEX
    &4.VEX(Q.P (ADD (DEC Q.HAR) Q.P.&4.VEX))
  =+  RES=|4.VEX
  |-  ?~  RES  |4.ROQ
  ?.  =(10 -.RES)  [-.RES $(RES +.RES)]
  (WELP [`@T`10 (TRIP LEV)] $(RES +.RES))
::
++  IFIX
  |*  {FEL/{RULE RULE} HOF/RULE}
  ~!  +<
  ~!  +<:-.FEL
  ~!  +<:+.FEL
  ;~(PFIX -.FEL ;~(SFIX HOF +.FEL))
::
++  JEST                                                ::  MATCH A CORD
  |=  DAF/@T
  |=  TUB/NAIL
  =+  FAD=DAF
  |-  ^-  (LIKE @T)
  ?:  =(`@`0 DAF)
    [P=P.TUB Q=[~ U=[P=FAD Q=TUB]]]
  ?:  |(?=(~ Q.TUB) !=((END 3 1 DAF) I.Q.TUB))
    (FAIL TUB)
  $(P.TUB (LUST I.Q.TUB P.TUB), Q.TUB T.Q.TUB, DAF (RSH 3 1 DAF))
::
++  JUST                                                ::  XX REDUNDANT, JEST
  ~/  %JUST                                             ::  MATCH A CHAR
  |=  DAF/CHAR
  ~/  %FUN
  |=  TUB/NAIL
  ^-  (LIKE CHAR)
  ?~  Q.TUB
    (FAIL TUB)
  ?.  =(DAF I.Q.TUB)
    (FAIL TUB)
  (NEXT TUB)
::
++  KNEE                                                ::  CALLBACKS
  =|  {GAR/* SEF/_|.(*RULE)}
  |@  ++  $
        |=  TUB/NAIL
        ^-  (LIKE _GAR)
        ((SEF) TUB)
  --
::
++  MASK                                                ::  MATCH CHAR IN SET
  ~/  %MASK
  |=  BUD/(LIST CHAR)
  ~/  %FUN
  |=  TUB/NAIL
  ^-  (LIKE CHAR)
  ?~  Q.TUB
    (FAIL TUB)
  ?.  (LIEN BUD |=(A/CHAR =(I.Q.TUB A)))
    (FAIL TUB)
  (NEXT TUB)
::
++  MORE                                                ::  SEPARATED, *
  |*  {BUS/RULE FEL/RULE}
  ;~(POSE (MOST BUS FEL) (EASY ~))
::
++  MOST                                                ::  SEPARATED, +
  |*  {BUS/RULE FEL/RULE}
  ;~(PLUG FEL (STAR ;~(PFIX BUS FEL)))
::
++  NEXT                                                ::  CONSUME A CHAR
  |=  TUB/NAIL
  ^-  (LIKE CHAR)
  ?~  Q.TUB
    (FAIL TUB)
  =+  ZAC=(LUST I.Q.TUB P.TUB)
  [ZAC [~ I.Q.TUB [ZAC T.Q.TUB]]]
::
++  PERK                                                ::  PARSE CUBE FORK
  |*  A/(POLE @TAS)
  ?~  A  FAIL
  ;~  POSE
    (COLD -.A (JEST -.A))
    $(A +.A)
  ==
::
++  PICK                                                ::  RULE FOR ++EACH
  |*  {A/RULE B/RULE}
  ;~  POSE
    (STAG %& A)
    (STAG %| B)
  ==
++  PLUS  |*(FEL/RULE ;~(PLUG FEL (STAR FEL)))          ::
++  PUNT  |*({A/RULE} ;~(POSE (STAG ~ A) (EASY ~)))     ::
++  SEAR                                                ::  CONDITIONAL COOK
  |*  {PYQ/$-(* (UNIT)) SEF/RULE}
  |=  TUB/NAIL
  =+  VEX=(SEF TUB)
  ?~  Q.VEX
    VEX
  =+  GEY=(PYQ P.U.Q.VEX)
  ?~  GEY
    [P=P.VEX Q=~]
  [P=P.VEX Q=[~ U=[P=U.GEY Q=Q.U.Q.VEX]]]
::
++  SHIM                                                ::  MATCH CHAR IN RANGE
  ~/  %SHIM
  |=  {LES/@ MOS/@}
  ~/  %FUN
  |=  TUB/NAIL
  ^-  (LIKE CHAR)
  ?~  Q.TUB
    (FAIL TUB)
  ?.  ?&((GTE I.Q.TUB LES) (LTE I.Q.TUB MOS))
    (FAIL TUB)
  (NEXT TUB)
::
++  STAG                                                ::  ADD A LABEL
  ~/  %STAG
  |*  {GOB/* SEF/RULE}
  ~/  %FUN
  |=  TUB/NAIL
  =+  VEX=(SEF TUB)
  ?~  Q.VEX
    VEX
  [P=P.VEX Q=[~ U=[P=[GOB P.U.Q.VEX] Q=Q.U.Q.VEX]]]
::
++  STET                                                ::
  |*  LEH/(LIST {?(@ {@ @}) RULE})
  |-
  ?~  LEH
    ~
  [I=[P=-.I.LEH Q=+.I.LEH] T=$(LEH T.LEH)]
::
++  STEW                                                ::  SWITCH BY FIRST CHAR
  ~/  %STEW
  |*  LEH/(LIST {P/?(@ {@ @}) Q/RULE})                  ::  CHAR+RANGE KEYS
  =+  ^=  WOR                                           ::  RANGE COMPLETE LTH
      |=  {ORT/?(@ {@ @}) WAN/?(@ {@ @})}
      ?@  ORT
        ?@(WAN (LTH ORT WAN) (LTH ORT -.WAN))
      ?@(WAN (LTH +.ORT WAN) (LTH +.ORT -.WAN))
  =+  ^=  HEL                                           ::  BUILD PARSER MAP
      =+  HEL=`(TREE _?>(?=(^ LEH) I.LEH))`~
      |-  ^+  HEL
      ?~  LEH
        ~
      =+  YAL=$(LEH T.LEH)
      |-  ^+  HEL
      ?~  YAL
        [I.LEH ~ ~]
      ?:  (WOR P.I.LEH P.N.YAL)
        =+  NUC=$(YAL L.YAL)
        ?>  ?=(^ NUC)
        ?:  (MOR P.N.YAL P.N.NUC)
          [N.YAL NUC R.YAL]
        [N.NUC L.NUC [N.YAL R.NUC R.YAL]]
      =+  NUC=$(YAL R.YAL)
      ?>  ?=(^ NUC)
      ?:  (MOR P.N.YAL P.N.NUC)
        [N.YAL L.YAL NUC]
      [N.NUC [N.YAL L.YAL L.NUC] R.NUC]
  ~%  %FUN  ..^$  ~
  |=  TUB/NAIL
  ?~  Q.TUB
    (FAIL TUB)
  |-
  ?~  HEL
    (FAIL TUB)
  ?:  ?@  P.N.HEL
        =(P.N.HEL I.Q.TUB)
      ?&((GTE I.Q.TUB -.P.N.HEL) (LTE I.Q.TUB +.P.N.HEL))
    ::  (Q.N.HEL [(LUST I.Q.TUB P.TUB) T.Q.TUB])
    (Q.N.HEL TUB)
  ?:  (WOR I.Q.TUB P.N.HEL)
    $(HEL L.HEL)
  $(HEL R.HEL)
::
++  SLUG                                                ::
  |*  RAQ/_=>(~ |*({A/* B/*} [A B]))
  |*  {BUS/RULE FEL/RULE}
  ;~((COMP RAQ) FEL (STIR +<+.RAQ RAQ ;~(PFIX BUS FEL)))
::
++  STAR                                                ::  0 OR MORE TIMES
  |*  FEL/RULE
  (STIR `(LIST _(WONK *FEL))`~ |*({A/* B/*} [A B]) FEL)
::
++  STIR
  ~/  %STIR
  |*  {RUD/* RAQ/_=>(~ |*({A/* B/*} [A B])) FEL/RULE}
  ~/  %FUN
  |=  TUB/NAIL
  ^-  (LIKE _RUD)
  =+  VEX=(FEL TUB)
  ?~  Q.VEX
    [P.VEX [~ RUD TUB]]
  =+  WAG=$(TUB Q.U.Q.VEX)
  ?>  ?=(^ Q.WAG)
  [(LAST P.VEX P.WAG) [~ (RAQ P.U.Q.VEX P.U.Q.WAG) Q.U.Q.WAG]]
::
++  STUN                                                ::  PARSE SEVERAL TIMES
  |*  {LIG/{@ @} FEL/RULE}
  |=  TUB/NAIL
  ^-  (LIKE (LIST _(WONK (FEL))))
  ?:  =(0 +.LIG)
    [P.TUB [~ ~ TUB]]
  =+  VEX=(FEL TUB)
  ?~  Q.VEX
    ?:  =(0 -.LIG)
      [P.VEX [~ ~ TUB]]
    VEX
  =+  ^=  WAG  %=  $
                 -.LIG  ?:(=(0 -.LIG) 0 (DEC -.LIG))
                 +.LIG  ?:(=(0 +.LIG) 0 (DEC +.LIG))
                 TUB  Q.U.Q.VEX
               ==
  ?~  Q.WAG
    WAG
  [P.WAG [~ [P.U.Q.VEX P.U.Q.WAG] Q.U.Q.WAG]]
::
::::  4G: PARSING (OUTSIDE CALLER)
  ::
++  RASH  |*({NAF/@ SAB/RULE} (SCAN (TRIP NAF) SAB))
++  ROSE  |*  {LOS/TAPE SAB/RULE}
          =+  VEX=(SAB [[1 1] LOS])
          =+  LEN=(LENT LOS)
          ?.  =(+(LEN) Q.P.VEX)  [%| P=(DEC Q.P.VEX)]
          ?~  Q.VEX
            [%& P=~]
          [%& P=[~ U=P.U.Q.VEX]]
++  RUSH  |*({NAF/@ SAB/RULE} (RUST (TRIP NAF) SAB))
++  RUST  |*  {LOS/TAPE SAB/RULE}
          =+  VEX=((FULL SAB) [[1 1] LOS])
          ?~(Q.VEX ~ [~ U=P.U.Q.VEX])
++  SCAN  |*  {LOS/TAPE SAB/RULE}
          =+  VEX=((FULL SAB) [[1 1] LOS])
          ?~  Q.VEX
            ~_  (SHOW [%M '{%D %D}'] P.P.VEX Q.P.VEX ~)
            ~_(LEAF+"SYNTAX ERROR" !!)
          P.U.Q.VEX
::
::::  4H: PARSING (ASCII GLYPHS)
  ::
++  ACE  (JUST ' ')
++  BAN  (JUST '>')
++  BAR  (JUST '|')
++  BAS  (JUST '\\')  ::  XX DEPRECATED
++  BAT  (JUST '\\')
++  BUC  (JUST '$')   ::  XX DEPRECATED
++  BUS  (JUST '$')
++  CAB  (JUST '_')
++  CEN  (JUST '%')
++  COL  (JUST ':')
++  COM  (JUST ',')
++  DOT  (JUST '.')
++  FAS  (JUST '/')  ::  XX DEPRECATED?
++  GAL  (JUST '<')   ::  XX DEPRECATED
++  GAR  (JUST '>')   ::  XX DEPRECATED
++  VAT  (JUST '@')   ::  PRONOUNCED "AT"
++  HAX  (JUST '#')
++  HEP  (JUST '-')   ::  PRONOUNCED "EP"
++  KET  (JUST '^')
++  LEB  (JUST '{')
++  LED  (JUST '<')
++  LOB  (JUST '{')
++  LIT  (JUST '(')
++  LAC  (JUST '[')
++  LUS  (JUST '+')
++  MIC  (JUST ';')   ::  PRONOUNCED "MICK"
++  NET  (JUST '/')
++  PAD  (JUST '&')
++  RAC  (JUST ']')
++  REB  (JUST '}')
++  ROB  (JUST '}')
++  RIT  (JUST ')')
++  SAY  (JUST '\'')
++  SIG  (JUST '~')
++  TAR  (JUST '*')
++  TEC  (JUST '`')
++  TIS  (JUST '=')   ::  PRONOUNCED "IS"
++  TOC  (JUST '"')   ::  XX DEPRECATED
++  YEL  (JUST '"')
++  WUT  (JUST '?')
++  ZAP  (JUST '!')
::
::::  4I: PARSING (USEFUL IDIOMS)
  ::
++  ALF  ;~(POSE LOW HIG)                               ::  ALPHABETIC
++  ALN  ;~(POSE LOW HIG NUD)                           ::  ALPHANUMERIC
++  ALP  ;~(POSE LOW HIG NUD HEP)                       ::  ALPHANUMERIC AND -
++  BET  ;~(POSE (COLD 2 HEP) (COLD 3 LUS))             ::  AXIS SYNTAX - +
++  BIN  (BASS 2 (MOST GON BUT))                        ::  BINARY TO ATOM
++  BUT  (COOK |=(A/@ (SUB A '0')) (SHIM '0' '1'))      ::  BINARY DIGIT
++  CIT  (COOK |=(A/@ (SUB A '0')) (SHIM '0' '7'))      ::  OCTAL DIGIT
++  DEM  (BASS 10 (MOST GON DIT))                       ::  DECIMAL TO ATOM
++  DIT  (COOK |=(A/@ (SUB A '0')) (SHIM '0' '9'))      ::  DECIMAL DIGIT
++  DOG  ;~(PLUG DOT GAY)                               ::  .  NUMBER SEPARATOR
++  DOF  ;~(PLUG HEP GAY)                               ::  - @Q SEPARATOR
++  DOH  ;~(PLUG ;~(PLUG HEP HEP) GAY)                  ::  --  PHON SEPARATOR
++  DUN  (COLD ~ ;~(PLUG HEP HEP))                      ::  -- (STOP) TO ~
++  DUZ  (COLD ~ ;~(PLUG TIS TIS))                      ::  == (STET) TO ~
++  GAH  (MASK [`@`10 ' ' ~])                           ::  NEWLINE OR ACE
++  GAP  (COLD ~ ;~(PLUG GAQ (STAR ;~(POSE VUL GAH))))  ::  PLURAL SPACE
++  GAQ  ;~  POSE                                       ::  END OF LINE
             (JUST `@`10)
             ;~(PLUG GAH ;~(POSE GAH VUL))
             VUL
         ==
++  GAW  (COLD ~ (STAR ;~(POSE VUL GAH)))               ::  CLASSIC WHITE
++  GAY  ;~(POSE GAP (EASY ~))                          ::
++  GON  ;~(POSE ;~(PLUG BAT GAY NET) (EASY ~))         ::  LONG NUMBERS \ /
++  GUL  ;~(POSE (COLD 2 LED) (COLD 3 BAN))             ::  AXIS SYNTAX < >
++  HEX  (BASS 16 (MOST GON HIT))                       ::  HEX TO ATOM
++  HIG  (SHIM 'A' 'Z')                                 ::  UPPERCASE
++  HIT  ;~  POSE                                       ::  HEX DIGITS
           DIT
           (COOK |=(A/CHAR (SUB A 87)) (SHIM 'A' 'F'))
           (COOK |=(A/CHAR (SUB A 55)) (SHIM 'A' 'F'))
         ==
++  INY                                                 :: INDENTATION BLOCK
  |*  SEF/RULE
  |=  NAIL  ^+  (SEF)
  =+  [HAR TAP]=[P Q]:+<
  =+  LEV=(FIL 3 (DEC Q.HAR) ' ')
  =+  EOL=(JUST `@T`10)
  =+  =-  ROQ=((STAR ;~(POSE PRN ;~(SFIX EOL (JEST LEV)) -)) HAR TAP)
      ;~(SIMU ;~(PLUG EOL EOL) EOL)
  ?~  Q.ROQ  ROQ
  =+  VEX=(SEF HAR(Q 1) P.U.Q.ROQ)
  =+  FUR=P.VEX(Q (ADD (DEC Q.HAR) Q.P.VEX))
  ?~  Q.VEX  VEX(P FUR)
  =-  VEX(P FUR, U.Q -)
  :+  &3.VEX
    &4.VEX(Q.P (ADD (DEC Q.HAR) Q.P.&4.VEX))
  =+  RES=|4.VEX
  |-  ?~  RES  |4.ROQ
  ?.  =(10 -.RES)  [-.RES $(RES +.RES)]
  (WELP [`@T`10 (TRIP LEV)] $(RES +.RES))
::
++  LOW  (SHIM 'A' 'Z')                                 ::  LOWERCASE
++  MES  %+  COOK                                       ::  HEXBYTE
           |=({A/@ B/@} (ADD (MUL 16 A) B))
         ;~(PLUG HIT HIT)
++  NIX  (BOSS 256 (STAR ;~(POSE ALN CAB)))             ::
++  NUD  (SHIM '0' '9')                                 ::  NUMERIC
++  PRN  ;~(LESS (JUST `@`127) (SHIM 32 256))           ::  NON-CONTROL
++  QAT  ;~  POSE                                       ::  CHARS IN BLOCKCORD
             PRN
             ;~(LESS ;~(PLUG (JUST `@`10) SOZ) (JUST `@`10))
         ==
++  QIT  ;~  POSE                                       ::  CHARS IN A CORD
             ;~(LESS BAT SAY PRN)
             ;~(PFIX BAT ;~(POSE BAT SAY MES))          ::  ESCAPE CHARS
         ==
++  QUT  ;~  SIMU  SAY                                  ::  CORD
           ;~  POSE
             ;~  LESS  SOZ
               (IFIX [SAY SAY] (BOSS 256 (MORE GON QIT)))
             ==
             =+  HED=;~(POSE ;~(PLUG (PLUS ACE) VUL) (JUST '\0A'))
             %-  INY  %+  IFIX
               :-  ;~(PLUG SOZ HED)
               ;~(PLUG (JUST '\0A') SOZ)
             (BOSS 256 (STAR QAT))
           ==
         ==
++  SOZ  ;~(PLUG SAY SAY SAY)                           ::  DELIMITING '''
++  SYM                                                 ::  SYMBOL
  %+  COOK
    |=(A/TAPE (RAP 3 ^-((LIST @) A)))
  ;~(PLUG LOW (STAR ;~(POSE NUD LOW HEP)))
::
++  MIXED-CASE-SYMBOL
  %+  COOK
    |=(A/TAPE (RAP 3 ^-((LIST @) A)))
  ;~(PLUG ALF (STAR ALP))
::
++  VEN  ;~  (COMP |=({A/@ B/@} (PEG A B)))             ::  +>- AXIS SYNTAX
           BET
           =+  HOM=`?`|
           |=  TUB/NAIL
           ^-  (LIKE @)
           =+  VEX=?:(HOM (BET TUB) (GUL TUB))
           ?~  Q.VEX
             [P.TUB [~ 1 TUB]]
           =+  WAG=$(P.TUB P.VEX, HOM !HOM, TUB Q.U.Q.VEX)
           ?>  ?=(^ Q.WAG)
           [P.WAG [~ (PEG P.U.Q.VEX P.U.Q.WAG) Q.U.Q.WAG]]
         ==
++  VIT                                                 ::  BASE64 DIGIT
  ;~  POSE
    (COOK |=(A/@ (SUB A 65)) (SHIM 'A' 'Z'))
    (COOK |=(A/@ (SUB A 71)) (SHIM 'A' 'Z'))
    (COOK |=(A/@ (ADD A 4)) (SHIM '0' '9'))
    (COLD 62 (JUST '-'))
    (COLD 63 (JUST '+'))
  ==
++  VUL  %+  COLD   ~                                   ::  COMMENTS
         ;~  PLUG  COL  COL
           (STAR PRN)
           (JUST `@`10)
         ==
::
::::  4J: PARSING (BASES AND BASE DIGITS)
  ::
++  AB
  |%
  ++  BIX  (BASS 16 (STUN [2 2] SIX))
  ++  FEM  (SEAR |=(A/@ (CHA:FA A)) ALN)
  ++  HAF  (BASS 256 ;~(PLUG TEP TIQ (EASY ~)))
  ++  HEF  %+  SEAR  |=(A/@ ?:(=(A 0) ~ (SOME A)))
           %+  BASS  256
           ;~(PLUG TIP TIQ (EASY ~))
  ++  HIF  (BASS 256 ;~(PLUG TIP TIQ (EASY ~)))
  ++  HOF  (BASS 0X1.0000 ;~(PLUG HEF (STUN [1 3] ;~(PFIX HEP HIF))))
  ++  HUF  (BASS 0X1.0000 ;~(PLUG HEF (STUN [0 3] ;~(PFIX HEP HIF))))
  ++  HYF  (BASS 0X1.0000 ;~(PLUG HIF (STUN [3 3] ;~(PFIX HEP HIF))))
  ++  PEV  (BASS 32 ;~(PLUG SEV (STUN [0 4] SIV)))
  ++  PEW  (BASS 64 ;~(PLUG SEW (STUN [0 4] SIW)))
  ++  PIV  (BASS 32 (STUN [5 5] SIV))
  ++  PIW  (BASS 64 (STUN [5 5] SIW))
  ++  QEB  (BASS 2 ;~(PLUG SEB (STUN [0 3] SIB)))
  ++  QEX  (BASS 16 ;~(PLUG SEX (STUN [0 3] HIT)))
  ++  QIB  (BASS 2 (STUN [4 4] SIB))
  ++  QIX  (BASS 16 (STUN [4 4] SIX))
  ++  SEB  (COLD 1 (JUST '1'))
  ++  SED  (COOK |=(A/@ (SUB A '0')) (SHIM '1' '9'))
  ++  SEV  ;~(POSE SED SOV)
  ++  SEW  ;~(POSE SED SOW)
  ++  SEX  ;~(POSE SED SOX)
  ++  SIB  (COOK |=(A/@ (SUB A '0')) (SHIM '0' '1'))
  ++  SID  (COOK |=(A/@ (SUB A '0')) (SHIM '0' '9'))
  ++  SIV  ;~(POSE SID SOV)
  ++  SIW  ;~(POSE SID SOW)
  ++  SIX  ;~(POSE SID SOX)
  ++  SOV  (COOK |=(A/@ (SUB A 87)) (SHIM 'A' 'V'))
  ++  SOW  ;~  POSE
             (COOK |=(A/@ (SUB A 87)) (SHIM 'A' 'Z'))
             (COOK |=(A/@ (SUB A 29)) (SHIM 'A' 'Z'))
             (COLD 62 (JUST '-'))
             (COLD 63 (JUST '~'))
           ==
  ++  SOX  (COOK |=(A/@ (SUB A 87)) (SHIM 'A' 'F'))
  ++  TED  (BASS 10 ;~(PLUG SED (STUN [0 2] SID)))
  ++  TEP  (SEAR |=(A/@ ?:(=(A 'DOZ') ~ (INS:PO A))) TIL)
  ++  TIP  (SEAR |=(A/@ (INS:PO A)) TIL)
  ++  TIQ  (SEAR |=(A/@ (IND:PO A)) TIL)
  ++  TID  (BASS 10 (STUN [3 3] SID))
  ++  TIL  (BOSS 256 (STUN [3 3] LOW))
  ++  URS  %+  COOK
             |=(A/TAPE (RAP 3 ^-((LIST @) A)))
           (STAR ;~(POSE NUD LOW HEP DOT SIG CAB))
  ++  URT  %+  COOK
             |=(A/TAPE (RAP 3 ^-((LIST @) A)))
           (STAR ;~(POSE NUD LOW HEP DOT SIG))
  ++  URX  %+  COOK
             |=(A/TAPE (RAP 3 ^-((LIST @) A)))
           %-  STAR
           ;~  POSE
             NUD
             LOW
             HEP
             CAB
             (COLD ' ' DOT)
             (COOK TUFT (IFIX [SIG DOT] HEX))
             ;~(PFIX SIG ;~(POSE SIG DOT))
           ==
  ++  VOY  ;~(PFIX BAT ;~(POSE BAT SAY BIX))
  --
++  AG
  |%
  ++  APE  |*(FEL/RULE ;~(POSE (COLD 0 (JUST '0')) FEL))
  ++  BAY  (APE (BASS 16 ;~(PLUG QEB:AB (STAR ;~(PFIX DOG QIB:AB)))))
  ++  BIP  =+  TOD=(APE QEX:AB)
           (BASS 0X1.0000 ;~(PLUG TOD (STUN [7 7] ;~(PFIX DOG TOD))))
  ++  DEM  (APE (BASS 1.000 ;~(PLUG TED:AB (STAR ;~(PFIX DOG TID:AB)))))
  ++  DIM  (APE DIP)
  ++  DIP  (BASS 10 ;~(PLUG SED:AB (STAR SID:AB)))
  ++  DUM  (BASS 10 (PLUS SID:AB))
  ++  FED  %+  COOK  FEND:OB
           ;~  POSE
             %+  BASS  0X1.0000.0000.0000.0000          ::  OVERSIZED
               ;~  PLUG
                 HUF:AB
                 (PLUS ;~(PFIX DOH HYF:AB))
               ==
             HOF:AB                                     ::  PLANET OR MOON
             HAF:AB                                     ::  STAR
             TIQ:AB                                     ::  GALAXY
           ==
  ++  FEQ  %+  COOK  |=(A=(LIST @) (REP 4 (FLOP A)))
           ;~  PLUG
             ;~(POSE HIF:AB TIQ:AB)
             (STAR ;~(PFIX DOF HIF:AB))
           ==
  ++  FIM  (SEAR DEN:FA (BASS 58 (PLUS FEM:AB)))
  ++  HEX  (APE (BASS 0X1.0000 ;~(PLUG QEX:AB (STAR ;~(PFIX DOG QIX:AB)))))
  ++  LIP  =+  TOD=(APE TED:AB)
           (BASS 256 ;~(PLUG TOD (STUN [3 3] ;~(PFIX DOG TOD))))
  ++  MOT  ;~  POSE
             ;~  PFIX
               (JUST '1')
               (COOK |=(A/@ (ADD 10 (SUB A '0'))) (SHIM '0' '2'))
             ==
             SED:AB
           ==
  ++  VIZ  (APE (BASS 0X200.0000 ;~(PLUG PEV:AB (STAR ;~(PFIX DOG PIV:AB)))))
  ++  VUM  (BASS 32 (PLUS SIV:AB))
  ++  WIZ  (APE (BASS 0X4000.0000 ;~(PLUG PEW:AB (STAR ;~(PFIX DOG PIW:AB)))))
  --
++  MU
  |_  {TOP/@ BOT/@}
  ++  ZAG  [P=(END 4 1 (ADD TOP BOT)) Q=BOT]
  ++  ZIG  [P=(END 4 1 (ADD TOP (SUB 0X1.0000 BOT))) Q=BOT]
  ++  ZUG  (MIX (LSH 4 1 TOP) BOT)
  --
++  NE
  |_  TIG/@
  ++  C  (CUT 3 [TIG 1] KEY:FA)
  ++  D  (ADD TIG '0')
  ++  X  ?:((GTE TIG 10) (ADD TIG 87) D)
  ++  V  ?:((GTE TIG 10) (ADD TIG 87) D)
  ++  W  ?:(=(TIG 63) '~' ?:(=(TIG 62) '-' ?:((GTE TIG 36) (ADD TIG 29) X)))
  --
::
::::  4K: ATOM PRINTING
  ::
++  CO
  ~%  %CO  ..CO  ~
  =<  |_  LOT/COIN
      ++  REAR  |=(ROM/TAPE =>(.(REP ROM) REND))
      ++  RENT  `@TA`(RAP 3 REND)
      ++  REND
        ^-  TAPE
        ?:  ?=($BLOB -.LOT)
          ['~' '0' ((V-CO 1) (JAM P.LOT))]
        ?:  ?=($MANY -.LOT)
          :-  '.'
          |-  ^-  TAPE
          ?~   P.LOT
            ['_' '_' REP]
          ['_' (WELD (TRIP (WACK RENT(LOT I.P.LOT))) $(P.LOT T.P.LOT))]
        =+  [YED=(END 3 1 P.P.LOT) HAY=(CUT 3 [1 1] P.P.LOT)]
        |-  ^-  TAPE
        ?+    YED  (Z-CO Q.P.LOT)
            $C   ['~' '-' (WELD (RIP 3 (WOOD (TUFT Q.P.LOT))) REP)]
            $D
          ?+    HAY  (Z-CO Q.P.LOT)
              $A
            =+  YOD=(YORE Q.P.LOT)
            =>  ^+(. .(REP ?~(F.T.YOD REP ['.' (S-CO F.T.YOD)])))
            =>  ^+  .
                %=    .
                    REP
                  ?:  &(=(~ F.T.YOD) =(0 H.T.YOD) =(0 M.T.YOD) =(0 S.T.YOD))
                    REP
                  =>  .(REP ['.' (Y-CO S.T.YOD)])
                  =>  .(REP ['.' (Y-CO M.T.YOD)])
                  ['.' '.' (Y-CO H.T.YOD)]
                ==
            =>  .(REP ['.' (A-CO D.T.YOD)])
            =>  .(REP ['.' (A-CO M.YOD)])
            =>  .(REP ?:(A.YOD REP ['-' REP]))
            ['~' (A-CO Y.YOD)]
          ::
              $R
            =+  YUG=(YELL Q.P.LOT)
            =>  ^+(. .(REP ?~(F.YUG REP ['.' (S-CO F.YUG)])))
            :-  '~'
            ?:  &(=(0 D.YUG) =(0 M.YUG) =(0 H.YUG) =(0 S.YUG))
              ['S' '0' REP]
            =>  ^+(. ?:(=(0 S.YUG) . .(REP ['.' 'S' (A-CO S.YUG)])))
            =>  ^+(. ?:(=(0 M.YUG) . .(REP ['.' 'M' (A-CO M.YUG)])))
            =>  ^+(. ?:(=(0 H.YUG) . .(REP ['.' 'H' (A-CO H.YUG)])))
            =>  ^+(. ?:(=(0 D.YUG) . .(REP ['.' 'D' (A-CO D.YUG)])))
            +.REP
          ==
        ::
            $F
          ?:  =(& Q.P.LOT)
            ['.' 'Y' REP]
          ?:(=(| Q.P.LOT) ['.' 'N' REP] (Z-CO Q.P.LOT))
        ::
            $N   ['~' REP]
            $I
          ?+  HAY  (Z-CO Q.P.LOT)
            $F  ((RO-CO [3 10 4] |=(A/@ ~(D NE A))) Q.P.LOT)
            $S  ((RO-CO [4 16 8] |=(A/@ ~(X NE A))) Q.P.LOT)
          ==
        ::
            $P
          =+  SXZ=(FEEN:OB Q.P.LOT)
          =+  DYX=(MET 3 SXZ)
          :-  '~'
          ?:  (LTE DYX 1)
            (WELD (TRIP (TOD:PO SXZ)) REP)
          =+  DYY=(MET 4 SXZ)
          =+  IMP=*@
          |-  ^-  TAPE
          ?:  =(IMP DYY)
            REP
          %=  $
            SXZ  (RSH 4 1 SXZ)
            IMP      +(IMP)
            REP
              =+  LOG=(END 4 1 SXZ)
              ;:  WELD
                (TRIP (TOS:PO (RSH 3 1 LOG)))
                (TRIP (TOD:PO (END 3 1 LOG)))
                ?:(=((MOD IMP 4) 0) ?:(=(IMP 0) "" "--") "-")
                REP
             ==
          ==
        ::
            $Q
          =*  VAL  Q.P.LOT
          :+  '.'  '~'
          =-  =.(REP (WELD - REP) REP)
          %-  TAIL
          %+  ROLL  ?:(=(0 VAL) ~[0] (RIP 3 VAL))
          |=  [Q=@ S=? R=TAPE]
          :-  !S
          ;:  WELD
            (TRIP (?:(S TOD:PO TOS:PO) Q))
            ?:(&(S !=(R "")) "-" ~)
            R
          ==
        ::
            $R
          ?+  HAY  (Z-CO Q.P.LOT)
            $D  ['.' '~' (R-CO (RLYD Q.P.LOT))]
            $H  ['.' '~' '~' (R-CO (RLYH Q.P.LOT))]
            $Q  ['.' '~' '~' '~' (R-CO (RLYQ Q.P.LOT))]
            $S  ['.' (R-CO (RLYS Q.P.LOT))]
          ==
        ::
            $U
          ?:  ?=($C HAY)
            %+  WELP  ['0' 'C' (REAP (PAD:FA Q.P.LOT) '1')]
            (C-CO (ENC:FA Q.P.LOT))
          =-  (WELD P.GAM ?:(=(0 Q.P.LOT) `TAPE`['0' ~] Q.GAM))
          ^=  GAM  ^-  {P/TAPE Q/TAPE}
          ?+  HAY  [~ ((OX-CO [10 3] |=(A/@ ~(D NE A))) Q.P.LOT)]
            $B  [['0' 'B' ~] ((OX-CO [2 4] |=(A/@ ~(D NE A))) Q.P.LOT)]
            $I  [['0' 'I' ~] ((D-CO 1) Q.P.LOT)]
            $X  [['0' 'X' ~] ((OX-CO [16 4] |=(A/@ ~(X NE A))) Q.P.LOT)]
            $V  [['0' 'V' ~] ((OX-CO [32 5] |=(A/@ ~(X NE A))) Q.P.LOT)]
            $W  [['0' 'W' ~] ((OX-CO [64 5] |=(A/@ ~(W NE A))) Q.P.LOT)]
          ==
        ::
            $S
          %+  WELD
            ?:((SYN:SI Q.P.LOT) "--" "-")
          $(YED 'U', Q.P.LOT (ABS:SI Q.P.LOT))
        ::
            $T
          ?:  =('A' HAY)
            ?:  =('S' (CUT 3 [2 1] P.P.LOT))
              (WELD (RIP 3 Q.P.LOT) REP)
            ['~' '.' (WELD (RIP 3 Q.P.LOT) REP)]
          ['~' '~' (WELD (RIP 3 (WOOD Q.P.LOT)) REP)]
        ==
      --
  =+  REP=*TAPE
  =<  |%
      ++  A-CO  |=(DAT/@ ((D-CO 1) DAT))
      ++  C-CO  (EM-CO [58 1] |=({? B/@ C/TAPE} [~(C NE B) C]))
      ++  D-CO  |=(MIN/@ (EM-CO [10 MIN] |=({? B/@ C/TAPE} [~(D NE B) C])))
      ++  R-CO
        |=  A/DN
        ?:  ?=({$I *} A)  (WELD ?:(S.A "INF" "-INF") REP)
        ?:  ?=({$N *} A)  (WELD "NAN" REP)
        =+  ^=  E  %+  ED-CO  [10 1]
          |=  {A/? B/@ C/TAPE}
          ?:  A  [~(D NE B) '.' C]
          [~(D NE B) C]
        =+  ^=  F
          =>(.(REP ~) (E A.A))
        =.  E.A  (SUM:SI E.A (SUN:SI (DEC +.F)))
        =+  B=?:((SYN:SI E.A) "E" "E-")
        =>  .(REP ?~(E.A REP (WELD B ((D-CO 1) (ABS:SI E.A)))))
        =>  .(REP (WELD -.F REP))
        ?:(S.A REP ['-' REP])
      ::
      ++  S-CO
        |=  ESC/(LIST @)  ^-  TAPE
        ?~  ESC
          REP
        :-  '.'
        =>(.(REP $(ESC T.ESC)) ((X-CO 4) I.ESC))
      ::
      ++  V-CO  |=(MIN/@ (EM-CO [32 MIN] |=({? B/@ C/TAPE} [~(V NE B) C])))
      ++  W-CO  |=(MIN/@ (EM-CO [64 MIN] |=({? B/@ C/TAPE} [~(W NE B) C])))
      ++  X-CO  |=(MIN/@ (EM-CO [16 MIN] |=({? B/@ C/TAPE} [~(X NE B) C])))
      ++  Y-CO  |=(DAT/@ ((D-CO 2) DAT))
      ++  Z-CO  |=(DAT/@ `TAPE`['0' 'X' ((X-CO 1) DAT)])
      --
  |%
  ++  EM-CO
    |=  {{BAS/@ MIN/@} PAR/$-({? @ TAPE} TAPE)}
    |=  HOL/@
    ^-  TAPE
    ?:  &(=(0 HOL) =(0 MIN))
      REP
    =+  [RAD=(MOD HOL BAS) DAR=(DIV HOL BAS)]
    %=  $
      MIN  ?:(=(0 MIN) 0 (DEC MIN))
      HOL  DAR
      REP  (PAR =(0 DAR) RAD REP)
    ==
  ::
  ++  ED-CO
    |=  {{BAS/@ MIN/@} PAR/$-({? @ TAPE} TAPE)}
    =+  [FIR=& COU=0]
    |=  HOL/@
    ^-  {TAPE @}
    ?:  &(=(0 HOL) =(0 MIN))
      [REP COU]
    =+  [RAD=(MOD HOL BAS) DAR=(DIV HOL BAS)]
    %=  $
      MIN  ?:(=(0 MIN) 0 (DEC MIN))
      HOL  DAR
      REP  (PAR &(=(0 DAR) !FIR) RAD REP)
      FIR  |
      COU  +(COU)
    ==
  ::
  ++  OX-CO
    |=  {{BAS/@ GOP/@} DUG/$-(@ @)}
    %+  EM-CO
      [|-(?:(=(0 GOP) 1 (MUL BAS $(GOP (DEC GOP))))) 0]
    |=  {TOP/? SEG/@ RES/TAPE}
    %+  WELD
      ?:(TOP ~ `TAPE`['.' ~])
    %.  SEG
    %+  EM-CO(REP RES)
      [BAS ?:(TOP 0 GOP)]
    |=({? B/@ C/TAPE} [(DUG B) C])
  ::
  ++  RO-CO
    |=  {{BUZ/@ BAS/@ DOP/@} DUG/$-(@ @)}
    |=  HOL/@
    ^-  TAPE
    ?:  =(0 DOP)
      REP
    =>  .(REP $(DOP (DEC DOP)))
    :-  '.'
    %-  (EM-CO [BAS 1] |=({? B/@ C/TAPE} [(DUG B) C]))
    [(CUT BUZ [(DEC DOP) 1] HOL)]
  --
::
::::  4L: ATOM PARSING
  ::
++  SO
  ~%  %SO  +  ~
  |%
  ++  BISK
    ~+
    ;~  POSE
      ;~  PFIX  (JUST '0')
        ;~  POSE
          (STAG %UB ;~(PFIX (JUST 'B') BAY:AG))
          (STAG %UC ;~(PFIX (JUST 'C') FIM:AG))
          (STAG %UI ;~(PFIX (JUST 'I') DIM:AG))
          (STAG %UX ;~(PFIX (JUST 'X') HEX:AG))
          (STAG %UV ;~(PFIX (JUST 'V') VIZ:AG))
          (STAG %UW ;~(PFIX (JUST 'W') WIZ:AG))
        ==
      ==
      (STAG %UD DEM:AG)
    ==
  ++  CRUB
    ~+
    ;~  POSE
      (COOK |=(DET/DATE `DIME`[%DA (YEAR DET)]) WHEN)
    ::
      %+  COOK
        |=  {A/(LIST {P/?($D $H $M $S) Q/@}) B/(LIST @)}
        =+  ROP=`TARP`[0 0 0 0 B]
        |-  ^-  DIME
        ?~  A
          [%DR (YULE ROP)]
        ?-  P.I.A
          $D  $(A T.A, D.ROP (ADD Q.I.A D.ROP))
          $H  $(A T.A, H.ROP (ADD Q.I.A H.ROP))
          $M  $(A T.A, M.ROP (ADD Q.I.A M.ROP))
          $S  $(A T.A, S.ROP (ADD Q.I.A S.ROP))
        ==
      ;~  PLUG
        %+  MOST
          DOT
        ;~  POSE
          ;~(PFIX (JUST 'D') (STAG %D DIM:AG))
          ;~(PFIX (JUST 'H') (STAG %H DIM:AG))
          ;~(PFIX (JUST 'M') (STAG %M DIM:AG))
          ;~(PFIX (JUST 'S') (STAG %S DIM:AG))
        ==
        ;~(POSE ;~(PFIX ;~(PLUG DOT DOT) (MOST DOT QIX:AB)) (EASY ~))
      ==
    ::
      (STAG %P FED:AG)
      ;~(PFIX DOT (STAG %TA URS:AB))
      ;~(PFIX SIG (STAG %T URX:AB))
      ;~(PFIX HEP (STAG %C (COOK TAFT URX:AB)))
    ==
  ++  NUCK
    ~/  %NUCK  |=  A/NAIL  %.  A
    %+  KNEE  *COIN  |.  ~+
    %-  STEW
    ^.  STET  ^.  LIMO
    :~  :-  ['A' 'Z']  (COOK |=(A/@TA [%$ %TAS A]) SYM)
        :-  ['0' '9']  (STAG %$ BISK)
        :-  '-'        (STAG %$ TASH)
        :-  '.'        ;~(PFIX DOT PERD)
        :-  '~'        ;~(PFIX SIG ;~(POSE TWID (EASY [%$ %N 0])))
    ==
  ++  NUSK
    ~+
    :(SEAR |=(A/@TA (RUSH A NUCK)) WICK URT:AB)
  ++  PERD
    ~+
    ;~  POSE
      (STAG %$ ZUST)
      (STAG %MANY (IFIX [CAB ;~(PLUG CAB CAB)] (MORE CAB NUSK)))
    ==
  ++  ROYL
    ~+
    =+  ^=  MOO
      |=  A/TAPE
      :-  (LENT A)
      (SCAN A (BASS 10 (PLUS SID:AB)))
    =+  ^=  VOY
      %+  COOK  ROYL-CELL
      ;~  POSE
        ;~  PLUG
          (EASY %D)
          ;~  POSE  (COLD | HEP)  (EASY &)  ==
          ;~  PLUG  DIM:AG
            ;~  POSE
              ;~(PFIX DOT (COOK MOO (PLUS (SHIM '0' '9'))))
              (EASY [0 0])
            ==
            ;~  POSE
              ;~  PFIX
                (JUST 'E')
                ;~(PLUG ;~(POSE (COLD | HEP) (EASY &)) DIM:AG)
              ==
              (EASY [& 0])
            ==
          ==
        ==
        ;~  PLUG
          (EASY %I)
          ;~  SFIX
            ;~  POSE  (COLD | HEP)  (EASY &)  ==
            (JEST 'INF')
          ==
        ==
        ;~  PLUG
          (EASY %N)
          (COLD ~ (JEST 'NAN'))
        ==
      ==
    ;~  POSE
      (STAG %RH (COOK RYLH ;~(PFIX ;~(PLUG SIG SIG) VOY)))
      (STAG %RQ (COOK RYLQ ;~(PFIX ;~(PLUG SIG SIG SIG) VOY)))
      (STAG %RD (COOK RYLD ;~(PFIX SIG VOY)))
      (STAG %RS (COOK RYLS VOY))
    ==
  ::
  ++  ROYL-CELL
    |=  RN
    ^-  DN
    ?.  ?=({$D *} +<)  +<
    =+  ^=  H
      (DIF:SI (NEW:SI F.B I.B) (SUN:SI D.B))
    [%D A H (ADD (MUL C.B (POW 10 D.B)) E.B)]
  ::
  ++  TASH
    ~+
    =+  ^=  NEG
        |=  {SYN/? MOL/DIME}  ^-  DIME
        ?>  =('U' (END 3 1 P.MOL))
        [(CAT 3 'S' (RSH 3 1 P.MOL)) (NEW:SI SYN Q.MOL)]
    ;~  PFIX  HEP
      ;~  POSE
        (COOK |=(A/DIME (NEG | A)) BISK)
        ;~(PFIX HEP (COOK |=(A/DIME (NEG & A)) BISK))
      ==
    ==
  ::
  ++  TWID
    ~+
    ;~  POSE
      (COOK |=(A/@ [%BLOB (CUE A)]) ;~(PFIX (JUST '0') VUM:AG))
      (STAG %$ CRUB)
    ==
  ::
  ++  WHEN
    ~+
    ;~  PLUG
      %+  COOK
        |=({A/@ B/?} [B A])
      ;~(PLUG DIM:AG ;~(POSE (COLD | HEP) (EASY &)))
      ;~(PFIX DOT MOT:AG)   ::  MONTH
      ;~(PFIX DOT DIP:AG)   ::  DAY
      ;~  POSE
        ;~  PFIX
          ;~(PLUG DOT DOT)
          ;~  PLUG
            DUM:AG
            ;~(PFIX DOT DUM:AG)
            ;~(PFIX DOT DUM:AG)
            ;~(POSE ;~(PFIX ;~(PLUG DOT DOT) (MOST DOT QIX:AB)) (EASY ~))
          ==
        ==
        (EASY [0 0 0 ~])
      ==
    ==
  ::
  ++  ZUST
    ~+
    ;~  POSE
      (STAG %IS BIP:AG)
      (STAG %IF LIP:AG)
      ROYL
      (STAG %F ;~(POSE (COLD & (JUST 'Y')) (COLD | (JUST 'N'))))
      (STAG %Q ;~(PFIX SIG FEQ:AG))
    ==
  --
::
::::  4M: FORMATTING FUNCTIONS
  ::
++  SCOT
  ~/  %SCOT
  |=(MOL/DIME ~(RENT CO %$ MOL))
++  SCOW
  ~/  %SCOW
  |=(MOL/DIME ~(REND CO %$ MOL))
++  SLAT  |=(MOD/@TAS |=(TXT/@TA (SLAW MOD TXT)))
++  SLAV  |=({MOD/@TAS TXT/@TA} (NEED (SLAW MOD TXT)))
++  SLAW
  ~/  %SLAW
  |=  {MOD/@TAS TXT/@TA}
  ^-  (UNIT @)
  ?+    MOD
      ::  SLOW FALLBACK CASE TO THE FULL SLAY
      ::
      =+  CON=(SLAY TXT)
      ?.(&(?=({~ $$ @ @} CON) =(P.P.U.CON MOD)) ~ [~ Q.P.U.CON])
  ::
      %DA
    (RUSH TXT ;~(PFIX SIG (COOK YEAR WHEN:SO)))
  ::
      %P
    (RUSH TXT ;~(PFIX SIG FED:AG))
  ::
      %UD
    (RUSH TXT DEM:AG)
  ::
      %UX
    (RUSH TXT ;~(PFIX (JEST '0X') HEX:AG))
  ::
      %UV
    (RUSH TXT ;~(PFIX (JEST '0V') VIZ:AG))
  ::
      %TA
    (RUSH TXT ;~(PFIX ;~(PLUG SIG DOT) URS:AB))
  ::
      %TAS
    (RUSH TXT SYM)
  ==
::
++  SLAY
  |=  TXT/@TA  ^-  (UNIT COIN)
  =+  ^=  VEX
      ?:  (GTH 0X7FFF.FFFF TXT)                         ::  XX  PETTY CACHE
        ~+  ((FULL NUCK:SO) [[1 1] (TRIP TXT)])
      ((FULL NUCK:SO) [[1 1] (TRIP TXT)])
  ?~  Q.VEX
    ~
  [~ P.U.Q.VEX]
::
++  SMYT                                                ::  PRETTY PRINT PATH
  |=  BON/PATH  ^-  TANK
  :+  %ROSE  [['/' ~] ['/' ~] ~]
  (TURN BON |=(A/@ [%LEAF (TRIP A)]))
::
++  SPAT  |=(PAX/PATH (CRIP (SPUD PAX)))                ::  RENDER PATH TO CORD
++  SPUD  |=(PAX/PATH ~(RAM RE (SMYT PAX)))             ::  RENDER PATH TO TAPE
++  STAB                                                ::  PARSE CORD TO PATH
  =+  FEL=;~(PFIX NET (MORE NET URS:AB))
  |=(ZEP/@T `PATH`(RASH ZEP FEL))
::
::::  4N: VIRTUALIZATION
  ::
++  MACK
  |=  {SUB/* FOL/*}
  ^-  (UNIT)
  =+  TON=(MINK [SUB FOL] |=({* *} ~))
  ?.(?=({$0 *} TON) ~ [~ P.TON])
::
++  MINK  !.
  ~/  %MINK
  |=  {{SUB/* FOL/*} GUL/$-({* *} (UNIT (UNIT)))}
  =+  TAX=*(LIST {@TA *})
  |-  ^-  TONE
  ?@  FOL
    [%2 TAX]
  ?:  ?=(^ -.FOL)
    =+  HED=$(FOL -.FOL)
    ?:  ?=($2 -.HED)
      HED
    =+  TAL=$(FOL +.FOL)
    ?-  -.TAL
      $0  ?-(-.HED $0 [%0 P.HED P.TAL], $1 HED)
      $1  ?-(-.HED $0 TAL, $1 [%1 (WELD P.HED P.TAL)])
      $2  TAL
    ==
  ?+    FOL
    [%2 TAX]
  ::
      {$0 B/@}
    ?:  =(0 B.FOL)  [%2 TAX]
    ?:  =(1 B.FOL)  [%0 SUB]
    ?:  ?=(@ SUB)   [%2 TAX]
    =+  [NOW=(CAP B.FOL) LAT=(MAS B.FOL)]
    $(B.FOL LAT, SUB ?:(=(2 NOW) -.SUB +.SUB))
  ::
      {$1 B/*}
    [%0 B.FOL]
  ::
      {$2 B/{^ *}}
    =+  BEN=$(FOL B.FOL)
    ?.  ?=($0 -.BEN)  BEN
    ?>(?=(^ P.BEN) $(SUB -.P.BEN, FOL +.P.BEN))
    ::?>(?=(^ P.BEN) $([SUB FOL] P.BEN)
  ::
      {$3 B/*}
    =+  BEN=$(FOL B.FOL)
    ?.  ?=($0 -.BEN)  BEN
    [%0 .?(P.BEN)]
  ::
      {$4 B/*}
    =+  BEN=$(FOL B.FOL)
    ?.  ?=($0 -.BEN)  BEN
    ?.  ?=(@ P.BEN)  [%2 TAX]
    [%0 .+(P.BEN)]
  ::
      {$5 B/* C/*}
    =+  HED=$(FOL B.FOL)
    ?.  ?=($0 -.HED)  HED
    =+  TAL=$(FOL C.FOL)
    ?.  ?=($0 -.TAL)  TAL
    [%0 =(P.HED P.TAL)]
  ::
      {$6 B/* C/* D/*}
    =+  BEN=$(FOL B.FOL)
    ?.  ?=($0 -.BEN)  BEN
    ?:  =(& P.BEN)  $(FOL C.FOL)
    ?:  =(| P.BEN)  $(FOL D.FOL)
    [%2 TAX]
  ::
      {$7 B/* C/*}
    =+  BEN=$(FOL B.FOL)
    ?.  ?=($0 -.BEN)  BEN
    $(SUB P.BEN, FOL C.FOL)
  ::
      {$8 B/* C/*}
    =+  BEN=$(FOL B.FOL)
    ?.  ?=($0 -.BEN)  BEN
    $(SUB [P.BEN SUB], FOL C.FOL)
  ::
      {$9 B/* C/*}
    =+  BEN=$(FOL C.FOL)
    ?.  ?=($0 -.BEN)  BEN
    =.  SUB  P.BEN
    =+  LOF=$(FOL [0 B.FOL])
    ?.  ?=($0 -.LOF)  LOF
    $(FOL P.LOF)
  ::
      {$10 {B/@ C/*} D/*}
    =+  BOG=$(FOL D.FOL)
    ?.  ?=({$0 *} BOG)  BOG
    =+  LOT=$(FOL C.FOL)
    ?.  ?=({$0 *} LOT)  LOT
    =+  [AXE=B.FOL BIG=P.BOG LIT=P.LOT]
    ^-  TONE
    :-  %0
    |-  ^-  P/*
    ?:  =(2 AXE)  [LIT +.BIG]
    ?:  =(3 AXE)  [-.BIG LIT]
    =+  MOR=(MAS AXE)
    ?:  =(2 (CAP AXE))
      [$(BIG -.BIG, AXE MOR) +.BIG]
    [-.BIG $(BIG +.BIG, AXE MOR)]
  ::
      {$11 @ C/*}        $(FOL C.FOL)
      {$11 {B/* C/*} D/*}
    =+  BEN=$(FOL C.FOL)
    ?.  ?=($0 -.BEN)  BEN
    ?:  ?=(?($HUNK $HAND $LOSE $MEAN $SPOT) B.FOL)
      $(FOL D.FOL, TAX [[B.FOL P.BEN] TAX])
    $(FOL D.FOL)
  ::
      {$12 B/* C/*}
    =+  REF=$(FOL B.FOL)
    =+  BEN=$(FOL C.FOL)
    ?.  ?=($0 -.REF)  REF
    ?.  ?=($0 -.BEN)  BEN
    =+  VAL=(GUL P.REF P.BEN)
    ?~(VAL [%1 P.BEN ~] ?~(U.VAL [%2 [[%HUNK (MUSH P.BEN)] TAX]] [%0 U.U.VAL]))
  ==
::
++  MOCK
  |=  {{SUB/* FOL/*} GUL/$-({* *} (UNIT (UNIT)))}
  (MOOK (MINK [SUB FOL] GUL))
::
++  MOOK
  |=  TON/TONE
  ^-  TOON
  ?.  ?=({$2 *} TON)  TON
  :-  %2
  :: =.  P.TON  (MOOP P.TON)
  =+  YEL=(LENT P.TON)
  =.  P.TON
    ?.  (GTH YEL 1.024)  P.TON
    %+  WELD
      (SCAG 512 P.TON)
    ^-  (LIST {@TA *})
    :_  (SLAG (SUB YEL 512) P.TON)
    :-  %LOSE
    %+  RAP  3
    "[SKIPPED {(SCOW %UD (SUB YEL 1.024))} FRAMES]"
  |-  ^-  (LIST TANK)
  ?~  P.TON  ~
  =+  REP=$(P.TON T.P.TON)
  ?+    -.I.P.TON  REP
      $HUNK  [(TANK +.I.P.TON) REP]
      $LOSE  [[%LEAF (RIP 3 (@ +.I.P.TON))] REP]
      $HAND  [[%LEAF (SCOW %P (MUG +.I.P.TON))] REP]
      $MEAN  :_  REP
             ?@  +.I.P.TON  [%LEAF (RIP 3 (@ +.I.P.TON))]
             =+  MAC=(MACK +.I.P.TON +<.I.P.TON)
             ?~(MAC [%LEAF "####"] (TANK U.MAC))
      $SPOT  :_  REP
             =+  SOT=(SPOT +.I.P.TON)
             :+  %ROSE  [":" ~ ~]
             :~  (SMYT P.SOT)
                 =>  [UD=|=(A/@U (SCOW %UD A)) Q.SOT]
                 LEAF+"<[{(UD P.P)} {(UD Q.P)}].[{(UD P.Q)} {(UD Q.Q)}]>"
  ==         ==
::
++  MUSH                                                ::  SANE NAME TO LEAF
  |=  VAL/*
  ^-  TANK
  :+  %ROSE
    [['/' ~] ['/' ~] ~]
  (TURN ((LIST @TA) VAL) |=(A/@TA [%LEAF (TRIP A)]))
::
++  MONG
  |=  {{GAT/* SAM/*} GUL/$-({* *} (UNIT (UNIT)))}
  ^-  TOON
  ?.  &(?=(^ GAT) ?=(^ +.GAT))
    [%2 ~]
  (MOCK [GAT(+< SAM) %9 2 %0 1] GUL)
::
++  MULE                                                ::  TYPED VIRTUAL
  ~/  %MULE
  =+  TAQ=|.(**)
  |@  ++  $
        =+  MUD=(MUTE TAQ)
        ?-  -.MUD
          %&  [%& P=$:TAQ]
          %|  [%| P=P.MUD]
        ==
  --
::
++  MUTE                                                ::  UNTYPED VIRTUAL
  |=  TAQ/_=>(~ ^?(|.(**)))
  ^-  (EACH * (LIST TANK))
  =+  TON=(MOCK [TAQ %9 2 %0 1] |=({* *} ~))
  ?-  -.TON
    $0  [%& P.TON]
    $1  [%| (TURN P.TON |=(A/* (SMYT (PATH A))))]
    $2  [%| P.TON]
  ==
::  +SLUM: SLAM A GATE ON A SAMPLE USING RAW NOCK, UNTYPED
::
++  SLUM
  ~/  %SLUM
  |=  [GAT=* SAM=*]
  ^-  *
  .*(GAT [%9 2 %10 [6 %1 SAM] %0 1])
::
++  SOFT                                                ::  MAYBE REMOLD
  |*  HAN/$-(* *)
  |=  FUD/*  ^-  (UNIT HAN)
  =+  RESULT=(MULE |.((HAN FUD)))
  ?-  -.RESULT
    %|  ~
    %&  [~ P.RESULT]
  ==
::
::::  4O: MOLDS AND MOLD BUILDERS
  ::
+$  ABEL  TYPO                                          ::  ORIGINAL SIN: TYPE
+$  ALAS  (LIST (PAIR TERM HOON))                       ::  ALIAS LIST
+$  ATOM  @                                             ::  JUST AN ATOM
+$  AURA  @TA                                           ::  ATOM FORMAT
+$  BASE                                                ::  BASE MOLD
  $@  $?  $NOUN                                         ::  ANY NOUN
          $CELL                                         ::  ANY CELL
          $FLAG                                         ::  LOOBEAN
          $NULL                                         ::  ~ == 0
          $VOID                                         ::  EMPTY SET
      ==                                                ::
  {$ATOM P/AURA}                                        ::  ATOM
::
+$  WOOF  $@(@ {~ P/HOON})                              ::  SIMPLE EMBED
+$  CHUM  $?  LEF/TERM                                  ::  JET NAME
              {STD/TERM KEL/@}                          ::  KELVIN VERSION
              {VEN/TERM PRO/TERM KEL/@}                 ::  VENDOR AND PRODUCT
              {VEN/TERM PRO/TERM VER/@ KEL/@}           ::  ALL OF THE ABOVE
          ==                                            ::
+$  COIL  $:  P/GARB                                    ::  NAME, WET/DRY, VARY
              Q/TYPE                                    ::  CONTEXT
              R/(PAIR SEMINOUN (MAP TERM TOME))         ::  CHAPTERS
          ==                                            ::
+$  GARB  (TREL (UNIT TERM) POLY VAIR)                  ::  CORE
+$  POLY  ?(%WET %DRY)                                  ::  POLARITY
+$  FOOT  $%  {$DRY P/HOON}                             ::  DRY ARM, GEOMETRIC
              {$WET P/HOON}                             ::  WET ARM, GENERIC
          ==                                            ::
+$  LINK                                                ::  LEXICAL SEGMENT
          $%  [%CHAT P/TERM]                            ::  |CHAPTER
              [%CONE P/AURA Q/ATOM]                     ::  %CONSTANT
              [%FRAG P/TERM]                            ::  .LEG
              [%FUNK P/TERM]                            ::  +ARM
          ==                                            ::
+$  CRIB  [SUMMARY=CORD DETAILS=(LIST SECT)]            ::
+$  HELP  [LINKS=(LIST LINK) =CRIB]                     ::  DOCUMENTATION
+$  LIMB  $@  TERM                                      ::  WING ELEMENT
          $%  {%& P/AXIS}                               ::  BY GEOMETRY
              {%| P/@UD Q/(UNIT TERM)}                  ::  BY NAME
          ==                                            ::
            ::  XX MORE AND BETTER SANITY
            ::
+$  NULL  ~                                             ::  NULL, NIL, ETC
+$  ONYX  (LIST (PAIR TYPE FOOT))                       ::  ARM ACTIVATION
+$  OPAL                                                ::  LIMB MATCH
          $%  {%& P/TYPE}                               ::  LEG
              {%| P/AXIS Q/(SET {P/TYPE Q/FOOT})}       ::  ARM
          ==                                            ::
+$  PICA  (PAIR ? CORD)                                 ::  & PROSE, | CODE
+$  PALO  (PAIR VEIN OPAL)                              ::  WING TRACE, MATCH
+$  PLAT                                                ::
          $?  %HOON                                     ::
              %TYPE                                     ::
              %NOCK                                     ::
              %TANK                                     ::
          ==                                            ::
+$  POCK  (PAIR AXIS NOCK)                              ::  CHANGES
+$  PORT  (EACH PALO (PAIR TYPE NOCK))                  ::  SUCCESSFUL MATCH
+$  SPEC                                                ::  STRUCTURE DEFINITION
          $~  [%BASE %NULL]                             ::
          $%  {$BASE P/BASE}                            ::  BASE TYPE
              {$DBUG P/SPOT Q/SPEC}                     ::  SET DEBUG
              {$LEAF P/TERM Q/@}                        ::  CONSTANT ATOM
              {$LIKE P/WING Q/(LIST WING)}              ::  REFERENCE
              {$LOOP P/TERM}                            ::  HYGIENIC REFERENCE
              {$MADE P/(PAIR TERM (LIST TERM)) Q/SPEC}  ::  ANNOTATE SYNTHETIC
              {$MAKE P/HOON Q/(LIST SPEC)}              ::  COMPOSED SPEC
              {$NAME P/TERM Q/SPEC}                     ::  ANNOTATE SIMPLE
              {$OVER P/WING Q/SPEC}                     ::  RELATIVE TO SUBJECT
          ::                                            ::
              {$BSBN P/SPEC Q/SPEC}                     ::  $>, FILTER: REQUIRE
              {$BSBS P/SPEC Q/(MAP TERM SPEC)}          ::  $$, RECURSION
              {$BSBR P/SPEC Q/HOON}                     ::  $|, VERIFY
              {$BSCB P/HOON}                            ::  $_, EXAMPLE
              {$BSCL P/{I/SPEC T/(LIST SPEC)}}          ::  $:, TUPLE
              {$BSCN P/{I/SPEC T/(LIST SPEC)}}          ::  $%, HEAD PICK
              {$BSDT P/SPEC Q/(MAP TERM SPEC)}          ::  $., READ-WRITE CORE
              {$BSLD P/SPEC Q/SPEC}                     ::  $<, FILTER: EXCLUDE
              {$BSHP P/SPEC Q/SPEC}                     ::  $-, FUNCTION CORE
              {$BSKT P/SPEC Q/SPEC}                     ::  $^, CONS PICK
              {$BSLS P/STUD Q/SPEC}                     ::  $+, STANDARD
              {$BSNT P/SPEC Q/(MAP TERM SPEC)}          ::  $/, WRITE-ONLY CORE
              {$BSMC P/HOON}                            ::  $;, MANUAL
              {$BSPD P/SPEC Q/HOON}                     ::  $&, REPAIR
              {$BSSG P/HOON Q/SPEC}                     ::  $~, DEFAULT
              {$BSTC P/SPEC Q/(MAP TERM SPEC)}          ::  $`, READ-ONLY CORE
              {$BSTS P/SKIN Q/SPEC}                     ::  $=, NAME
              {$BSVT P/SPEC Q/SPEC}                     ::  $@, ATOM PICK
              {$BSWT P/{I/SPEC T/(LIST SPEC)}}          ::  $?, FULL PICK
              {$BSZP P/SPEC Q/(MAP TERM SPEC)}          ::  $!, OPAQUE CORE
          ==                                            ::
+$  TENT                                                ::  MODEL BUILDER
          $%  {%| P/WING Q/TENT R/(LIST SPEC)}          ::  ~(P Q R...)
              {%& P/(LIST WING)}                        ::  A.B:C.D
          ==                                            ::
+$  TIKI                                                ::  TEST CASE
          $%  {%& P/(UNIT TERM) Q/WING}                 ::  SIMPLE WING
              {%| P/(UNIT TERM) Q/HOON}                 ::  NAMED WING
          ==                                            ::
+$  SKIN                                                ::  TEXTURE
          $@  =TERM                                     ::  NAME/~[TERM %NONE]
          $%  [%BASE =BASE]                             ::  BASE MATCH
              [%CELL =SKIN =SKIN]                       ::  PAIR
              [%DBUG =SPOT =SKIN]                       ::  TRACE
              [%LEAF =AURA =ATOM]                       ::  ATOMIC CONSTANT
              [%HELP =HELP =SKIN]                       ::  DESCRIBE
              [%NAME =TERM =SKIN]                       ::  APPLY LABEL
              [%OVER =WING =SKIN]                       ::  RELATIVE TO
              [%SPEC =SPEC =SKIN]                       ::  CAST TO
              [%WASH DEPTH=@UD]                         ::  STRIP FACES
          ==                                            ::
+$  TOME  (PAIR WHAT (MAP TERM HOON))                   ::  CORE CHAPTER
+$  TOPE                                                ::  TOPOGRAPHIC TYPE
  $@  $?  %&                                            ::  CELL OR ATOM
          %|                                            ::  ATOM
      ==                                                ::
  (PAIR TOPE TOPE)                                      ::  CELL
++  HOOT                                                ::  HOON TOOLS
  |%
  +$  BEER  $@(CHAR {~ P/HOON})                    ::  SIMPLE EMBED
  +$  MANE  $@(@TAS {@TAS @TAS})                    ::  XML NAME+SPACE
  +$  MANX  $~([[%$ ~] ~] {G/MARX C/MARL})          ::  DYNAMIC XML NODE
  +$  MARL  (LIST TUNA)                             ::  DYNAMIC XML NODES
  +$  MART  (LIST {N/MANE V/(LIST BEER)})           ::  DYNAMIC XML ATTRS
  +$  MARX  $~([%$ ~] {N/MANE A/MART})              ::  DYNAMIC XML TAG
  +$  MARE  (EACH MANX MARL)                        ::  NODE OR NODES
  +$  MARU  (EACH TUNA MARL)                        ::  INTERP OR NODES
  +$  TUNA                                          ::  MAYBE INTERPOLATION
      $~  [[%$ ~] ~]
      $^  MANX
      $:  ?($TAPE $MANX $MARL $CALL)
          P/HOON
      ==
  --                                                    ::
+$  HOON                                                ::
  $~  [%ZPZP ~]
  $^  {P/HOON Q/HOON}                                   ::
  $%                                                    ::
    {$$ P/AXIS}                                         ::  SIMPLE LEG
  ::                                                    ::
    {$BASE P/BASE}                                      ::  BASE SPEC
    {$BUST P/BASE}                                      ::  BUNT BASE
    {$DBUG P/SPOT Q/HOON}                               ::  DEBUG INFO IN TRACE
    {$EROR P/TAPE}                                      ::  ASSEMBLY ERROR
    {$HAND P/TYPE Q/NOCK}                               ::  PREMADE RESULT
    {$NOTE P/NOTE Q/HOON}                               ::  ANNOTATE
    {$FITS P/HOON Q/WING}                               ::  UNDERLYING ?=
    {$KNIT P/(LIST WOOF)}                               ::  ASSEMBLE STRING
    {$LEAF P/(PAIR TERM @)}                             ::  SYMBOL SPEC
    {$LIMB P/TERM}                                      ::  TAKE LIMB
    {$LOST P/HOON}                                      ::  NOT TO BE TAKEN
    {$ROCK P/TERM Q/*}                                  ::  FIXED CONSTANT
    {$SAND P/TERM Q/*}                                  ::  UNFIXED CONSTANT
    {$TELL P/(LIST HOON)}                               ::  RENDER AS TAPE
    {$TUNE P/$@(TERM TUNE)}                             ::  MINIMAL FACE
    {$WING P/WING}                                      ::  TAKE WING
    {$YELL P/(LIST HOON)}                               ::  RENDER AS TANK
    {$XRAY P/MANX:HOOT}                                 ::  ;FOO; TEMPLATING
  ::                                            ::::::  CORES
    {$BRCB P/SPEC Q/ALAS R/(MAP TERM TOME)}             ::  |_
    {$BRCL P/HOON Q/HOON}                               ::  |:
    {$BRCN P/(UNIT TERM) Q/(MAP TERM TOME)}             ::  |%
    {$BRDT P/HOON}                                      ::  |.
    {$BRKT P/HOON Q/(MAP TERM TOME)}                    ::  |^
    {$BRHP P/HOON}                                      ::  |-
    {$BRSG P/SPEC Q/HOON}                               ::  |~
    {$BRTR P/SPEC Q/HOON}                               ::  |*
    {$BRTS P/SPEC Q/HOON}                               ::  |=
    {$BRVT P/(UNIT TERM) Q/(MAP TERM TOME)}             ::  |@
    {$BRWT P/HOON}                                      ::  |?
  ::                                            ::::::  TUPLES
    {$CLCB P/HOON Q/HOON}                               ::  :_ [Q P]
    {$CLKT P/HOON Q/HOON R/HOON S/HOON}                 ::  :^ [P Q R S]
    {$CLHP P/HOON Q/HOON}                               ::  :- [P Q]
    {$CLLS P/HOON Q/HOON R/HOON}                        ::  :+ [P Q R]
    {$CLSG P/(LIST HOON)}                               ::  :~ [P ~]
    {$CLTR P/(LIST HOON)}                               ::  :* P AS A TUPLE
  ::                                            ::::::  INVOCATIONS
    {$CNCB P/WING Q/(LIST (PAIR WING HOON))}            ::  %_
    {$CNDT P/HOON Q/HOON}                               ::  %.
    {$CNHP P/HOON Q/HOON}                               ::  %-
    {$CNCL P/HOON Q/(LIST HOON)}                        ::  %:
    {$CNTR P/WING Q/HOON R/(LIST (PAIR WING HOON))}     ::  %*
    {$CNKT P/HOON Q/HOON R/HOON S/HOON}                 ::  %^
    {$CNLS P/HOON Q/HOON R/HOON}                        ::  %+
    {$CNSG P/WING Q/HOON R/(LIST HOON)}                 ::  %~
    {$CNTS P/WING Q/(LIST (PAIR WING HOON))}            ::  %=
  ::                                            ::::::  NOCK
    {$DTKT P/SPEC Q/HOON}                               ::  .^  NOCK 11
    {$DTLS P/HOON}                                      ::  .+  NOCK 4
    {$DTTR P/HOON Q/HOON}                               ::  .*  NOCK 2
    {$DTTS P/HOON Q/HOON}                               ::  .=  NOCK 5
    {$DTWT P/HOON}                                      ::  .?  NOCK 3
  ::                                            ::::::  TYPE CONVERSION
    {$KTBR P/HOON}                                      ::  ^|  CONTRAVARIANT
    {$KTCN P/HOON}                                      ::  ^%  ENTER TEST MODE
    {$KTDT P/HOON Q/HOON}                               ::  ^.  SELF-CAST
    {$KTLS P/HOON Q/HOON}                               ::  ^+  EXPRESSION CAST
    {$KTHP P/SPEC Q/HOON}                               ::  ^-  STRUCTURE CAST
    {$KTPD P/HOON}                                      ::  ^&  COVARIANT
    {$KTSG P/HOON}                                      ::  ^~  CONSTANT
    {$KTTS P/SKIN Q/HOON}                               ::  ^=  LABEL
    {$KTWT P/HOON}                                      ::  ^?  BIVARIANT
    {$KTTR P/SPEC}                                      ::  ^*  EXAMPLE
    {$KTCL P/SPEC}                                      ::  ^:  FILTER
  ::                                            ::::::  HINTS
    {$SGBR P/HOON Q/HOON}                               ::  ~|  SELL ON TRACE
    {$SGCB P/HOON Q/HOON}                               ::  ~_  TANK ON TRACE
    {$SGCN P/CHUM Q/HOON R/TYRE S/HOON}                 ::  ~%  GENERAL JET HINT
    {$SGNT P/CHUM Q/HOON}                               ::  ~/  FUNCTION J-HINT
    {$SGLD P/$@(TERM {P/TERM Q/HOON}) Q/HOON}           ::  ~<  BACKWARD HINT
    {$SGBN P/$@(TERM {P/TERM Q/HOON}) Q/HOON}           ::  ~>  FORWARD HINT
    {$SGBS P/TERM Q/HOON}                               ::  ~$  PROFILER HIT
    {$SGLS P/@ Q/HOON}                                  ::  ~+  CACHE/MEMOIZE
    {$SGPD P/@UD Q/HOON R/HOON}                         ::  ~&  PRINTF/PRIORITY
    {$SGTS P/HOON Q/HOON}                               ::  ~=  DON'T DUPLICATE
    {$SGWT P/@UD Q/HOON R/HOON S/HOON}                  ::  ~?  TESTED PRINTF
    {$SGZP P/HOON Q/HOON}                               ::  ~!  TYPE ON TRACE
  ::                                            ::::::  MISCELLANEOUS
    {$MCTS P/MARL:HOOT}                                 ::  ;=  LIST TEMPLATING
    {$MCCL P/HOON Q/(LIST HOON)}                        ::  ;:  BINARY TO NARY
    {$MCNT P/HOON}                                      ::  ;/  [%$ [%$ P ~] ~]
    {$MCSG P/HOON Q/(LIST HOON)}                        ::  ;~  KLEISLI ARROW
    {$MCMC P/HOON Q/HOON}                               ::  ;;  NORMALIZE
  ::                                            ::::::  COMPOSITIONS
    {$TSBR P/SPEC Q/HOON}                               ::  =|  PUSH BUNT
    {$TSCL P/(LIST (PAIR WING HOON)) Q/HOON}            ::  =:  Q W/ P CHANGES
    {$TSNT P/SKIN Q/HOON R/HOON}                        ::  =/  TYPED VARIABLE
    {$TSMC P/SKIN Q/HOON R/HOON}                        ::  =;  =/(Q P R)
    {$TSDT P/WING Q/HOON R/HOON}                        ::  =.  R WITH P AS Q
    {$TSWT P/WING Q/HOON R/HOON S/HOON}                 ::  =?  CONDITIONAL =.
    {$TSLD P/HOON Q/HOON}                               ::  =<  =>(Q P)
    {$TSHP P/HOON Q/HOON}                               ::  =-  =+(Q P)
    {$TSBN P/HOON Q/HOON}                               ::  =>  Q W/SUBJECT P
    {$TSKT P/SKIN Q/WING R/HOON S/HOON}                 ::  =^  STATE MACHINE
    {$TSLS P/HOON Q/HOON}                               ::  =+  Q W/[P SUBJECT]
    {$TSSG P/(LIST HOON)}                               ::  =~  HOON STACK
    {$TSTR P/(PAIR TERM (UNIT SPEC)) Q/HOON R/HOON}     ::  =*  NEW STYLE
    {$TSCM P/HOON Q/HOON}                               ::  =,  OVERLOAD P IN Q
  ::                                            ::::::  CONDITIONALS
    {$WTBR P/(LIST HOON)}                               ::  ?|  LOOBEAN OR
    {$WTHP P/WING Q/(LIST (PAIR SPEC HOON))}            ::  ?-  PICK CASE IN Q
    {$WTCL P/HOON Q/HOON R/HOON}                        ::  ?:  IF/THEN/ELSE
    {$WTDT P/HOON Q/HOON R/HOON}                        ::  ?.  ?:(P R Q)
    {$WTKT P/WING Q/HOON R/HOON}                        ::  ?^  IF P IS A CELL
    {$WTLD P/HOON Q/HOON}                               ::  ?<  ?:(P !! Q)
    {$WTBN P/HOON Q/HOON}                               ::  ?>  ?:(P Q !!)
    {$WTLS P/WING Q/HOON R/(LIST (PAIR SPEC HOON))}     ::  ?+  ?-  W/DEFAULT
    {$WTPD P/(LIST HOON)}                               ::  ?&  LOOBEAN AND
    {$WTVT P/WING Q/HOON R/HOON}                        ::  ?@  IF P IS ATOM
    {$WTSG P/WING Q/HOON R/HOON}                        ::  ?~  IF P IS NULL
    {$WTHX P/SKIN Q/WING}                               ::  ?#  IF Q MATCHES P
    {$WTTS P/SPEC Q/WING}                               ::  ?=  IF Q MATCHES P
    {$WTZP P/HOON}                                      ::  ?!  LOOBEAN NOT
  ::                                            ::::::  SPECIAL
    {$ZPCM P/HOON Q/HOON}                               ::  !,
    {$ZPBN P/HOON}                                      ::  !>
    {$ZPMC P/HOON Q/HOON}                               ::  !;
    {$ZPTS P/HOON}                                      ::  !=
    {$ZPVT P/(LIST WING) Q/HOON R/HOON}                 ::  !@
    {$ZPWT P/$@(P/@ {P/@ Q/@}) Q/HOON}                  ::  !?
    {$ZPZP ~}                                           ::  !!
  ==                                                    ::
+$  TYRE  (LIST {P/TERM Q/HOON})                        ::
+$  TYKE  (LIST (UNIT HOON))                            ::
::                                                      ::::::  VIRTUAL NOCK
+$  NOCK  $^  {P/NOCK Q/NOCK}                           ::  AUTOCONS
          $%  {$1 P/*}                                  ::  CONSTANT
              {$2 P/NOCK Q/NOCK}                        ::  COMPOSE
              {$3 P/NOCK}                               ::  CELL TEST
              {$4 P/NOCK}                               ::  INCREMENT
              {$5 P/NOCK Q/NOCK}                        ::  EQUALITY TEST
              {$6 P/NOCK Q/NOCK R/NOCK}                 ::  IF, THEN, ELSE
              {$7 P/NOCK Q/NOCK}                        ::  SERIAL COMPOSE
              {$8 P/NOCK Q/NOCK}                        ::  PUSH ONTO SUBJECT
              {$9 P/@ Q/NOCK}                           ::  SELECT ARM AND FIRE
              {$10 P/{P/@ Q/NOCK} Q/NOCK}               ::  EDIT
              {$11 P/$@(@ {P/@ Q/NOCK}) Q/NOCK}         ::  HINT
              {$12 P/NOCK Q/NOCK}                       ::  GRAB DATA FROM SKY
              {$0 P/@}                                  ::  AXIS SELECT
          ==                                            ::
+$  NOTE                                                ::  TYPE ANNOTATION
          $%  {$HELP P/HELP}                            ::  DOCUMENTATION
              {$KNOW P/STUD}                            ::  GLOBAL STANDARD
              {$MADE P/TERM Q/(UNIT (LIST WING))}       ::  STRUCTURE
          ==                                            ::
+$  TYPE  $~  %NOUN                                     ::
          $@  $?  $NOUN                                 ::  ANY NOUNS
                  $VOID                                 ::  NO NOUN
              ==                                        ::
          $%  {$ATOM P/TERM Q/(UNIT @)}                 ::  ATOM / CONSTANT
              {$CELL P/TYPE Q/TYPE}                     ::  ORDERED PAIR
              {$CORE P/TYPE Q/COIL}                     ::  OBJECT
              {$FACE P/$@(TERM TUNE) Q/TYPE}            ::  NAMESPACE
              {$FORK P/(SET TYPE)}                      ::  UNION
              {$HINT P/(PAIR TYPE NOTE) Q/TYPE}         ::  ANNOTATION
              {$HOLD P/TYPE Q/HOON}                     ::  LAZY EVALUATION
          ==                                            ::
+$  TONY                                                ::  ++TONE DONE RIGHT
          $%  {$0 P/TINE Q/*}                           ::  SUCCESS
              {$1 P/(SET)}                              ::  BLOCKS
              {$2 P/(LIST {@TA *})}                     ::  ERROR ~_S
          ==                                            ::
+$  TINE                                                ::  PARTIAL NOUN
          $@  ~                                         ::  OPEN
          $%  {%& P/TINE Q/TINE}                        ::  HALF-BLOCKED
              {%| P/(SET)}                              ::  FULLY BLOCKED
          ==                                            ::
+$  TOOL  $@(TERM TUNE)                                 ::  TYPE DECORATION
+$  TUNE                                                ::  COMPLEX
          $~  [~ ~]                                     ::
          $:  P/(MAP TERM (UNIT HOON))                  ::  ALIASES
              Q/(LIST HOON)                             ::  BRIDGES
          ==                                            ::
+$  TYPO  TYPE                                          ::  OLD TYPE
+$  VASE  {P/TYPE Q/*}                                  ::  TYPE-VALUE PAIR
+$  VISE  {P/TYPO Q/*}                                  ::  OLD VASE
+$  VIAL  ?($READ $RITE $BOTH $FREE)                    ::  CO/CONTRA/IN/BI
+$  VAIR  ?($GOLD $IRON $LEAD $ZINC)                    ::  IN/CONTRA/BI/CO
+$  VEIN  (LIST (UNIT AXIS))                            ::  SEARCH TRACE
+$  SECT  (LIST PICA)                                   ::  PARAGRAPH
+$  WHIT                                                ::
          $:  LAB/(UNIT TERM)                           ::  LABEL
              BOY/(UNIT (PAIR CORD (LIST SECT)))        ::  BODY
              DEF/(MAP TERM (PAIR CORD (LIST SECT)))    ::  DEFINITIONS
              USE/(SET TERM)                            ::  DEFS USED
          ==                                            ::
+$  WHAT  (UNIT (PAIR CORD (LIST SECT)))                ::  HELP SLOGAN/SECTION
+$  WING  (LIST LIMB)                                   ::  SEARCH PATH
+$  WORM                                                ::  COMPILER CACHE
  $:  NES/(SET ^)                                       ::  ++NEST
      PAY/(MAP (PAIR TYPE HOON) TYPE)                   ::  ++PLAY
      MIT/(MAP (PAIR TYPE HOON) (PAIR TYPE NOCK))       ::  ++MINT
  ==                                                    ::
::
::  +BLOCK: ABSTRACT IDENTITY OF RESOURCE AWAITED
::
++  BLOCK
  PATH
::
::  +RESULT: INTERNAL INTERPRETER RESULT
::
++  RESULT
  $@(~ SEMINOUN)
::
::  +THUNK: FRAGMENT CONSTRUCTOR
::
++  THUNK
  $-(@UD (UNIT NOUN))
::
::  +SEMINOUN:
::
++  SEMINOUN
  ::  PARTIAL NOUN; BLOCKED SUBTREES ARE ~
  ::
  $~  [[%FULL ~] ~]
  {MASK/STENCIL DATA/NOUN}
::
::  +STENCIL: NOUN KNOWLEDGE MAP
::
++  STENCIL
  $%  ::
      ::  %HALF: NOUN HAS PARTIAL BLOCK SUBSTRUCTURE
      ::
      [%HALF LEFT=STENCIL RITE=STENCIL]
      ::
      ::  %FULL: NOUN IS EITHER FULLY COMPLETE, OR FULLY BLOCKED
      ::
      [%FULL BLOCKS=(SET BLOCK)]
      ::
      ::  %LAZY: NOUN CAN BE GENERATED FROM VIRTUAL SUBTREE
      ::
      [%LAZY FRAGMENT/AXIS RESOLVE/THUNK]
  ==
::
++  OUTPUT
  ::  ~: INTERPRETER STOPPED
  ::
  %-  UNIT
  $%  ::
      ::  %DONE: OUTPUT IS COMPLETE
      ::
      [%DONE P/NOUN]
      ::
      ::  %WAIT: OUTPUT IS WAITING FOR RESOURCES
      ::
      [%WAIT P/(LIST BLOCK)]
  ==
:: PROFILING
++  DOSS
  $:  MON/MOAN                                          ::  SAMPLE COUNT
      HIT/(MAP TERM @UD)                                ::  HIT POINTS
      CUT/(MAP PATH HUMP)                               ::  CUT POINTS
  ==
++  MOAN                                                ::  SAMPLE METRIC
  $:  FUN/@UD                                           ::  SAMPLES IN C
      NOC/@UD                                           ::  SAMPLES IN NOCK
      GLU/@UD                                           ::  SAMPLES IN GLUE
      MAL/@UD                                           ::  SAMPLES IN ALLOC
      FAR/@UD                                           ::  SAMPLES IN FRAG
      COY/@UD                                           ::  SAMPLES IN COPY
      EUQ/@UD                                           ::  SAMPLES IN EQUAL
  ==                                                    ::
::
++  HUMP
  $:  MON/MOAN                                          ::  SAMPLE COUNT
      OUT/(MAP PATH @UD)                                ::  CALLS OUT OF
      INN/(MAP PATH @UD)                                ::  CALLS INTO
  ==
--
::                                                      ::
::::  5: LAYER FIVE                                     ::
  ::                                                    ::
  ::    5A: COMPILER UTILITIES                          ::
  ::    5B: MACRO EXPANSION                             ::
  ::    5C: COMPILER BACKEND AND PRETTYPRINTER          ::
  ::    5D: PARSER                                      ::
  ::    5E: CACHING COMPILER                            ::
  ::    5F: MOLDS AND MOLD BUILDERS                     ::
  ::    5G: PROFILING SUPPORT (XX REMOVE)               ::
  ::
~%    %PEN
    +
  ==
    %AP    AP
    %UT    UT
  ==
|%
::
::::  5AA: NEW PARTIAL NOCK INTERPRETER
  ::
++  MUSK  !.                                            ::  NOCK WITH BLOCK SET
  |%
  ++  ABET
    ::  SIMPLIFY RAW RESULT
    ::
    |=  $:  ::  NOY: RAW RESULT
            ::
            NOY/RESULT
        ==
    ^-  OUTPUT
    ::  PROPAGATE STOP
    ::
    ?~  NOY  ~
    :-  ~
    ::  MERGE ALL BLOCKING SETS
    ::
    =/  BLOCKS  (SQUASH MASK.NOY)
    ?:  =(~ BLOCKS)
      ::  NO BLOCKS, DATA IS COMPLETE
      ::
      DONE/DATA.NOY
    ::  REDUCE BLOCK SET TO BLOCK LIST
    ::
    WAIT/~(TAP IN BLOCKS)
  ::
  ++  ARAW
    ::  EXECUTE NOCK ON PARTIAL SUBJECT
    ::
    |=  $:  ::  BUS: SUBJECT, A PARTIAL NOUN
            ::  FOL: FORMULA, A COMPLETE NOUN
            ::
            BUS/SEMINOUN
            FOL/NOUN
        ==
    ::  INTERPRETER LOOP
    ::
    |-  ^-  RESULT
    ?@  FOL
      ::  BAD FORMULA, STOP
      ::
      ~
    ?:  ?=(^ -.FOL)
      ::  HED: INTERPRET HEAD
      ::
      =+  HED=$(FOL -.FOL)
      ::  PROPAGATE STOP
      ::
      ?~  HED  ~
      ::  TAL: INTERPRET TAIL
      ::
      =+  TAL=$(FOL +.FOL)
      ::  PROPAGATE STOP
      ::
      ?~  TAL  ~
      ::  COMBINE
      ::
      (COMBINE HED TAL)
    ?+    FOL
    ::  BAD FORMULA; STOP
    ::
        ~
    ::  0; FRAGMENT
    ::
        {$0 B/@}
      ::  IF BAD AXIS, STOP
      ::
      ?:  =(0 B.FOL)  ~
      ::  REDUCE TO FRAGMENT
      ::
      (FRAGMENT B.FOL BUS)
    ::
    ::  1; CONSTANT
    ::
        {$1 B/*}
      ::  CONSTANT IS COMPLETE
      ::
      [FULL/~ B.FOL]
    ::
    ::  2; RECURSION
    ::
        {$2 B/* C/*}
      ::  REQUIRE COMPLETE FORMULA
      ::
      %+  REQUIRE
        ::  COMPUTE FORMULA WITH CURRENT SUBJECT
        ::
        $(FOL C.FOL)
      |=  ::  RYF: NEXT FORMULA
          ::
          RYF/NOUN
      ::  LUB: NEXT SUBJECT
      ::
      =+  LUB=^$(FOL B.FOL)
      ::  PROPAGATE STOP
      ::
      ?~  LUB  ~
      ::  RECURSE
      ::
      ^$(FOL RYF, BUS LUB)
    ::
    ::  3; PROBE
    ::
        {$3 B/*}
      %+  REQUIRE
        $(FOL B.FOL)
      |=  ::  FIG: PROBE INPUT
          ::
          FIG/NOUN
      ::  YES IF CELL, NO IF ATOM
      ::
      [FULL/~ .?(FIG)]
    ::
    ::  4; INCREMENT
    ::
        {$4 B/*}
      %+  REQUIRE
        $(FOL B.FOL)
      |=  ::  FIG: INCREMENT INPUT
          ::
          FIG/NOUN
      ::  STOP FOR CELLS, INCREMENT FOR ATOMS
      ::
      ?^(FIG ~ [FULL/~ +(FIG)])
    ::
    ::  5; COMPARE
    ::
        {$5 B/* C/*}
      %+  REQUIRE
        $(FOL B.FOL)
      |=  ::  HED: LEFT INPUT
          ::
          HED/NOUN
      %+  REQUIRE
        ^$(FOL C.FOL)
      |=  ::  TAL: RIGHT INPUT
          ::
          TAL/NOUN
      [FULL/~ =(HED TAL)]
    ::
    ::  6; IF-THEN-ELSE
    ::
        {$6 B/* C/* D/*}
      ::  SEMANTIC EXPANSION
      ::
      %+  REQUIRE
        $(FOL B.FOL)
      |=  ::  FIG: BOOLEAN
          ::
          FIG/NOUN
      ::  APPLY PROPER BOOLEANS
      ::
      ?:  =(& FIG)  ^$(FOL C.FOL)
      ?:  =(| FIG)  ^$(FOL D.FOL)
      ::  STOP ON BAD TEST
      ::
      ~
    ::
    ::  7; COMPOSITION
    ::
        {$7 B/* C/*}
      ::  ONE: INPUT
      ::
      =+  ONE=$(FOL B.FOL)
      ::  PROPAGATE STOP
      ::
      ?~  ONE  ~
      ::  COMPLETE COMPOSITION
      ::
      $(FOL C.FOL, BUS ONE)
    ::
    ::  8; INTRODUCTION
    ::
        {$8 B/* C/*}
      ::  ONE: INPUT
      ::
      =+  ONE=$(FOL B.FOL)
      ::  PROPAGATE STOP
      ::
      ?~  ONE  ~
      ::  COMPLETE INTRODUCTION
      ::
      $(FOL C.FOL, BUS (COMBINE ONE BUS))
    ::
    ::  9; INVOCATION
    ::
        {$9 B/* C/*}
      ::  SEMANTIC EXPANSION
      ::
      ?^  B.FOL  ~
      ::  ONE: CORE
      ::
      =+  ONE=$(FOL C.FOL)
      ::  PROPAGATE STOP
      ::
      ?~  ONE  ~
      ::  IF CORE IS CONSTANT
      ::
      ?:  ?=([[%FULL ~] *] ONE)
        ::  THEN CALL VIRTUAL NOCK DIRECTLY
        ::
        =+  (MACK DATA.ONE [%9 B.FOL %0 1])
        ::  PROPAGATE STOP
        ::
        ?~  -  ~
        ::  PRODUCE RESULT
        ::
        [[%FULL ~] U.-]
      ::  ELSE COMPLETE CALL
      ::
      %+  REQUIRE
        ::  RETRIEVE FORMULA
        ::
        (FRAGMENT B.FOL ONE)
      ::  CONTINUE
      ::
      |=(NOUN ^$(BUS ONE, FOL +<))
    ::
    ::  10; EDIT
    ::
        {$10 {B/@ C/*} D/*}
      ::  TAR:  TARGET OF EDIT
      ::
      =+  TAR=$(FOL D.FOL)
      ::  PROPAGATE STOP
      ::
      ?~  TAR  ~
      ::  INN:  INNER VALUE
      ::
      =+  INN=$(FOL C.FOL)
      ::  PROPAGATE STOP
      ::
      ?~  INN  ~
      (MUTATE B.FOL INN TAR)
    ::
    ::  11; STATIC HINT
    ::
        {$11 @ C/*}
      ::  IGNORE HINT
      ::
      $(FOL C.FOL)
    ::
    ::  11; DYNAMIC HINT
    ::
        {$11 {B/* C/*} D/*}
      ::  NOY: DYNAMIC HINT
      ::
      =+  NOY=$(FOL C.FOL)
      ::  PROPAGATE STOP
      ::
      ?~  NOY  ~
      ::  IF HINT IS A FULLY COMPUTED TRACE
      ::
      ?:  &(?=($SPOT B.FOL) ?=([[%FULL ~] *] NOY))
        ::  COMPUTE WITHIN TRACE
        ::
        ~_((SHOW %O +.NOY) $(FOL D.FOL))
      ::  ELSE IGNORE HINT
      ::
      $(FOL D.FOL)
    ==
  ::
  ++  APEX
    ::  EXECUTE NOCK ON PARTIAL SUBJECT
    ::
    |=  $:  ::  BUS: SUBJECT, A PARTIAL NOUN
            ::  FOL: FORMULA, A COMPLETE NOUN
            ::
            BUS/SEMINOUN
            FOL/NOUN
        ==
    ~+
    ^-  OUTPUT
    ::  SIMPLIFY RESULT
    ::
    (ABET (ARAW BUS FOL))
  ::
  ++  COMBINE
    ::  COMBINE A PAIR OF SEMINOUNS
    ::
    |=  $:  ::  HED: HEAD OF PAIR
            ::  TAL: TAIL OF PAIR
            ::
            HED/SEMINOUN
            TAL/SEMINOUN
        ==
    ^-  SEMINOUN
    ?.  ?&  &(?=($FULL -.MASK.HED) ?=($FULL -.MASK.TAL))
            =(=(~ BLOCKS.MASK.HED) =(~ BLOCKS.MASK.TAL))
        ==
      ::  DEFAULT MERGE
      ::
      [HALF/[MASK.HED MASK.TAL] [DATA.HED DATA.TAL]]
    ::  BOTH SIDES TOTAL
    ::
    ?:  =(~ BLOCKS.MASK.HED)
      ::  BOTH SIDES ARE COMPLETE
      ::
      [FULL/~ DATA.HED DATA.TAL]
    ::  BOTH SIDES ARE BLOCKED
    ::
    [FULL/(~(UNI IN BLOCKS.MASK.HED) BLOCKS.MASK.TAL) ~]
  ::
  ++  COMPLETE
    ::  COMPLETE ANY LAZINESS
    ::
    |=  BUS/SEMINOUN
    ^-  SEMINOUN
    ?-  -.MASK.BUS
      $FULL  BUS
      $LAZY  ::  FRAGMENT 1 IS THE WHOLE THING
             ::
             ?:  =(1 FRAGMENT.MASK.BUS)
               ::  BLOCKED; WE CAN'T GET FRAGMENT 1 WHILE COMPILING IT
               ::
               [[%FULL [~ ~ ~]] ~]
             ::  EXECUTE THUNK
             ::
             =+  (RESOLVE.MASK.BUS FRAGMENT.MASK.BUS)
             ::  IF PRODUCT IS NIL
             ::
             ?~  -
               ::  THEN BLOCKED
               ::
               [[%FULL [~ ~ ~]] ~]
             ::  ELSE USE VALUE
             ::
             [[%FULL ~] U.-]
      $HALF  ::  RECURSIVE DESCENT
             ::
             %+  COMBINE
               $(BUS [LEFT.MASK.BUS -.DATA.BUS])
             $(BUS [RITE.MASK.BUS +.DATA.BUS])
    ==
  ::
  ++  FRAGMENT
    ::  SEEK TO AN AXIS IN A SEMINOUN
    ::
    |=  $:  ::  AXE: TREE ADDRESS OF SUBTREE
            ::  BUS: PARTIAL NOUN
            ::
            AXE/AXIS
            BUS/SEMINOUN
        ==
    ^-  RESULT
    ::  1 IS THE ROOT
    ::
    ?:  =(1 AXE)  BUS
    ::  NOW: TOP OF AXIS (2 OR 3)
    ::  LAT: REST OF AXIS
    ::
    =+  [NOW=(CAP AXE) LAT=(MAS AXE)]
    ?-  -.MASK.BUS
      %LAZY  ::  PROPAGATE LAZINESS
             ::
             BUS(FRAGMENT.MASK (PEG FRAGMENT.MASK.BUS AXE))
    ::
      %FULL  ::  IF FULLY BLOCKED, PRODUCE SELF
             ::
             ?^  BLOCKS.MASK.BUS  BUS
             ::  DESCENDING INTO ATOM, STOP
             ::
             ?@  DATA.BUS  ~
             ::  DESCEND INTO COMPLETE CELL
             ::
             $(AXE LAT, BUS [FULL/~ ?:(=(2 NOW) -.DATA.BUS +.DATA.BUS)])
    ::
      %HALF  ::  DESCEND INTO PARTIAL CELL
             ::
             %=  $
               AXE  LAT
               BUS  ?:  =(2 NOW)
                      [LEFT.MASK.BUS -.DATA.BUS]
                    [RITE.MASK.BUS +.DATA.BUS]
    ==       ==
  ::
  ++  MUTATE
    ::  CHANGE A SINGLE AXIS IN A SEMINOUN
    ::
    |=  $:  ::  AXE: AXIS WITHIN BIG TO CHANGE
            ::  LIT: (LITTLE) SEMINOUN TO INSERT WITHIN BIG AT AXE
            ::  BIG: SEMINOUN TO MUTATE
            ::
            AXE/@
            LIT/SEMINOUN
            BIG/SEMINOUN
        ==
    ^-  RESULT
    ::  STOP ON ZERO AXIS
    ::
    ?~  AXE  ~
    ::  EDIT ROOT OF BIG MEANS DISCARD IT
    ::
    ?:  =(1 AXE)  LIT
    ::  DECOMPOSE AXIS INTO PATH OF HEAD-TAIL
    ::
    |-  ^-  RESULT
    ?:  =(2 AXE)
      ::  MUTATE HEAD OF CELL
      ::
      =+  TAL=(FRAGMENT 3 BIG)
      ::  PROPAGATE STOP
      ::
      ?~  TAL  ~
      (COMBINE LIT TAL)
    ?:  =(3 AXE)
      ::  MUTATE TAIL OF CELL
      ::
      =+  HED=(FRAGMENT 2 BIG)
      ::  PROPAGATE STOP
      ::
      ?~  HED  ~
      (COMBINE HED LIT)
    ::  DEEPER AXIS: KEEP ONE SIDE OF BIG AND
    ::  RECURSE INTO THE OTHER WITH SMALLER AXE
    ::
    =+  MOR=(MAS AXE)
    =+  HED=(FRAGMENT 2 BIG)
    ::  PROPAGATE STOP
    ::
    ?~  HED  ~
    =+  TAL=(FRAGMENT 3 BIG)
    ::  PROPAGATE STOP
    ::
    ?~  TAL  ~
    ?:  =(2 (CAP AXE))
      ::  RECURSE INTO THE HEAD
      ::
      =+  MUT=$(BIG HED, AXE MOR)
      ::  PROPAGATE STOP
      ::
      ?~  MUT  ~
      (COMBINE MUT TAL)
    ::  RECURSE INTO THE TAIL
    ::
    =+  MUT=$(BIG TAL, AXE MOR)
    ::  PROPAGATE STOP
    ::
    ?~  MUT  ~
    (COMBINE HED MUT)
  ::
  ++  REQUIRE
    ::  REQUIRE COMPLETE INTERMEDIATE STEP
    ::
    |=  $:  NOY/RESULT
            YEN/$-(* RESULT)
        ==
    ^-  RESULT
    ::  PROPAGATE STOP
    ::
    ?~  NOY  ~
    ::  SUPPRESS LAZINESS
    ::
    =/  BUS/SEMINOUN  (COMPLETE NOY)
    ?<  ?=($LAZY -.MASK.BUS)
    ::  IF PARTIAL BLOCK, SQUASH BLOCKS AND STOP
    ::
    ?:  ?=($HALF -.MASK.BUS)  [FULL/(SQUASH MASK.BUS) ~]
    ::  IF FULL BLOCK, PROPAGATE BLOCK
    ::
    ?:  ?=(^ BLOCKS.MASK.BUS)  [MASK.BUS ~]
    ::  OTHERWISE USE COMPLETE NOUN
    ::
    (YEN DATA.BUS)
  ::
  ++  SQUASH
    ::  CONVERT STENCIL TO BLOCK SET
    ::
    |=  TYN/STENCIL
    ^-  (SET BLOCK)
    ?-  -.TYN
      $LAZY  $(TYN -:(COMPLETE TYN ~))
      $FULL  BLOCKS.TYN
      $HALF  (~(UNI IN $(TYN LEFT.TYN)) $(TYN RITE.TYN))
    ==
  --
::
::::  5A: COMPILER UTILITIES
  ::
++  BOOL  `TYPE`(FORK [%ATOM %F `0] [%ATOM %F `1] ~)    ::  MAKE LOOBEAN
++  CELL                                                ::  MAKE %CELL TYPE
  ~/  %CELL
  |=  {HED/TYPE TAL/TYPE}
  ^-  TYPE
  ?:(=(%VOID HED) %VOID ?:(=(%VOID TAL) %VOID [%CELL HED TAL]))
::
++  CORE                                                ::  MAKE %CORE TYPE
  ~/  %CORE
  |=  {PAC/TYPE CON/COIL}
  ^-  TYPE
  ?:(=(%VOID PAC) %VOID [%CORE PAC CON])
::
++  HINT
  |=  {P/(PAIR TYPE NOTE) Q/TYPE}
  ^-  TYPE
  ?:  =(%VOID Q)  %VOID
  ?:  =(%NOUN Q)  %NOUN
  [%HINT P Q]
::
++  FACE                                                ::  MAKE %FACE TYPE
  ~/  %FACE
  |=  {GIZ/$@(TERM TUNE) DER/TYPE}
  ^-  TYPE
  ?:  =(%VOID DER)
    %VOID
  [%FACE GIZ DER]
::
++  FORK                                                ::  MAKE %FORK TYPE
  ~/  %FORK
  |=  YED/(LIST TYPE)
  =|  LEZ/(SET TYPE)
  |-  ^-  TYPE
  ?~  YED
    ?~  LEZ  %VOID
    ?:  ?=({* ~ ~} LEZ)  N.LEZ
    [%FORK LEZ]
  %=    $
      YED  T.YED
      LEZ
    ?:  =(%VOID I.YED)  LEZ
    ?:  ?=({$FORK *} I.YED)  (~(UNI IN LEZ) P.I.YED)
    (~(PUT IN LEZ) I.YED)
  ==
::
++  COVE                                                ::  EXTRACT [0 *] AXIS
  |=  NUG/NOCK
  ?-    NUG
      {$0 *}   P.NUG
      {$11 *}  $(NUG Q.NUG)
      *        ~_(LEAF+"COVE" !!)
  ==
++  COMB                                                ::  COMBINE TWO FORMULAS
  ~/  %COMB
  |=  {MAL/NOCK BUZ/NOCK}
  ^-  NOCK
  ?:  ?&(?=({$0 *} MAL) !=(0 P.MAL))
    ?:  ?&(?=({$0 *} BUZ) !=(0 P.BUZ))
      [%0 (PEG P.MAL P.BUZ)]
    ?:  ?=({$2 {$0 *} {$0 *}} BUZ)
      [%2 [%0 (PEG P.MAL P.P.BUZ)] [%0 (PEG P.MAL P.Q.BUZ)]]
    [%7 MAL BUZ]
  ?:  ?=({^ {$0 $1}} MAL)
    [%8 P.MAL BUZ]
  ?:  =([%0 %1] BUZ)
    MAL
  [%7 MAL BUZ]
::
++  COND                                                ::  ?:  COMPILE
  ~/  %COND
  |=  {PEX/NOCK YOM/NOCK WOQ/NOCK}
  ^-  NOCK
  ?-  PEX
    {$1 $0}  YOM
    {$1 $1}  WOQ
    *        [%6 PEX YOM WOQ]
  ==
::
++  CONS                                                ::  MAKE FORMULA CELL
  ~/  %CONS
  |=  {VUR/NOCK SED/NOCK}
  ^-  NOCK
  ::  THIS OPTIMIZATION CAN REMOVE CRASHES WHICH ARE ESSENTIAL
  ::
  ::  ?:  ?=([[%0 *] [%0 *]] +<)
  ::  ?:  ?&(=(+(P.VUR) P.SED) =((DIV P.VUR 2) (DIV P.SED 2)))
  ::    [%0 (DIV P.VUR 2)]
  ::  [VUR SED]
  ?:  ?=({{$1 *} {$1 *}} +<)
    [%1 P.VUR P.SED]
  [VUR SED]
::
++  FITZ                                                ::  ODOR COMPATIBILITY
  ~/  %FITZ
  |=  {YAZ/TERM WIX/TERM}
  =+  ^=  FIZ
      |=  MOT/@TA  ^-  {P/@ Q/@TA}
      =+  LEN=(MET 3 MOT)
      ?:  =(0 LEN)
        [0 %$]
      =+  TYL=(RSH 3 (DEC LEN) MOT)
      ?:  &((GTE TYL 'A') (LTE TYL 'Z'))
        [(SUB TYL 64) (END 3 (DEC LEN) MOT)]
      [0 MOT]
  =+  [YOZ=(FIZ YAZ) WUX=(FIZ WIX)]
  ?&  ?|  =(0 P.YOZ)
          =(0 P.WUX)
          &(!=(0 P.WUX) (LTE P.WUX P.YOZ))
      ==
      |-  ?|  =(%$ P.YOZ)
              =(%$ P.WUX)
              ?&  =((END 3 1 P.YOZ) (END 3 1 P.WUX))
                  $(P.YOZ (RSH 3 1 P.YOZ), P.WUX (RSH 3 1 P.WUX))
              ==
          ==
  ==
::
++  FLAN                                                ::  LOOBEAN  &
  ~/  %FLAN
  |=  {BOS/NOCK NIF/NOCK}
  ^-  NOCK
  ?:  =(BOS NIF)  BOS
  ?:  =([%0 0] BOS)  NIF
  ?:  =([%0 0] NIF)  BOS
  ?-    BOS
      {$1 $1}   BOS
      {$1 $0}   NIF
      *
    ?-    NIF
        {$1 $1}   NIF
        {$1 $0}   BOS
        *       [%6 BOS NIF [%1 1]]
    ==
  ==
::
++  FLIP                                                ::  LOOBEAN NEGATION
  ~/  %FLIP
  |=  DYR/NOCK
  ?:  =([%0 0] DYR)  DYR
  [%6 DYR [%1 1] [%1 0]]
::
++  FLOR                                                ::  LOOBEAN  |
  ~/  %FLOR
  |=  {BOS/NOCK NIF/NOCK}
  ^-  NOCK
  ?:  =(BOS NIF)  BOS
  ?:  =([%0 0] BOS)  NIF
  ?:  =([%0 0] NIF)  BOS
  ?-  BOS
      {$1 $1}   NIF
      {$1 $0}   BOS
      *
    ?-  NIF
        {$1 $1}   BOS
        {$1 $0}   NIF
        *         [%6 BOS [%1 0] NIF]
    ==
  ==
::
++  HIKE
  ~/  %HIKE
  |=  [A=AXIS PAC=(LIST (PAIR AXIS NOCK))]
  |^  =/  REL=(MAP AXIS NOCK)  (ROLL PAC INSERT)
      =/  ORD=(LIST AXIS)      (SORT ~(TAP IN ~(KEY BY REL)) GTH)
      |-  ^-  NOCK
      ?~  ORD
        [%0 A]
      =/  B=AXIS  I.ORD
      =/  C=NOCK  (~(GOT BY REL) B)
      =/  D=NOCK  $(ORD T.ORD)
      [%10 [B C] D]
  ::
  ++  CONTAINS
    |=  [CONTAINER=AXIS CONTAINED=AXIS]
    ^-  ?
    =/  BIG=@    (MET 0 CONTAINER)
    =/  SMALL=@  (MET 0 CONTAINED)
    ?:  (LTE SMALL BIG)  |
    =/  DIF=@  (SUB SMALL BIG)
    =(CONTAINER (RSH 0 DIF CONTAINED))
  ::
  ++  PARENT
    |=  A=AXIS
    `AXIS`(RSH 0 1 A)
  ::
  ++  SIBLING
    |=  A=AXIS
    ^-  AXIS
    ?~  (MOD A 2)
      +(A)
    (DEC A)
  ::
  ++  INSERT
    |=  [E=[AXE=AXIS FOL=NOCK] N=(MAP AXIS NOCK)]
    ^-  (MAP AXIS NOCK)
    ?:  =/  A=AXIS  AXE.E
        |-  ^-  ?
        ?:  =(1 A)  |
        ?:  (~(HAS BY N) A)
          &
        $(A (PARENT A))
      ::  PARENT ALREADY IN
      N
    =.  N
      ::  REMOVE CHILDREN
      %+  ROLL  ~(TAP BY N)
      |=  [[AXE=AXIS FOL=NOCK] M=_N]
      ?.  (CONTAINS AXE.E AXE)  M
      (~(DEL BY M) AXE)
    =/  SIB  (SIBLING AXE.E)
    =/  UN   (~(GET BY N) SIB)
    ?~  UN   (~(PUT BY N) AXE.E FOL.E)
    ::  REPLACE SIBLING WITH PARENT
    %=  $
      N  (~(DEL BY N) SIB)
      E  :-  (PARENT SIB)
         ?:  (GTH SIB AXE.E)
           (CONS FOL.E U.UN)
         (CONS U.UN FOL.E)
    ==
  --
::
++  JOCK
  |=  RAD/?
  |=  LOT/COIN  ^-  HOON
  ?-    -.LOT
      ~
    ?:(RAD [%ROCK P.LOT] [%SAND P.LOT])
  ::
      $BLOB
    ?:  RAD
      [%ROCK %$ P.LOT]
    ?@(P.LOT [%SAND %$ P.LOT] [$(P.LOT -.P.LOT) $(P.LOT +.P.LOT)])
  ::
      $MANY
    [%CLTR (TURN P.LOT |=(A/COIN ^$(LOT A)))]
  ==
::
++  LOOK
  ~/  %LOOK
  |=  {COG/TERM DAB/(MAP TERM HOON)}
  =+  AXE=1
  |-  ^-  (UNIT {P/AXIS Q/HOON})
  ?-  DAB
      ~  ~
  ::
      {* ~ ~}
    ?:(=(COG P.N.DAB) [~ AXE Q.N.DAB] ~)
  ::
      {* ~ *}
    ?:  =(COG P.N.DAB)
      [~ (PEG AXE 2) Q.N.DAB]
    ?:  (GOR COG P.N.DAB)
      ~
    $(AXE (PEG AXE 3), DAB R.DAB)
  ::
      {* * ~}
    ?:  =(COG P.N.DAB)
      [~ (PEG AXE 2) Q.N.DAB]
    ?:  (GOR COG P.N.DAB)
      $(AXE (PEG AXE 3), DAB L.DAB)
    ~
  ::
      {* * *}
    ?:  =(COG P.N.DAB)
      [~ (PEG AXE 2) Q.N.DAB]
    ?:  (GOR COG P.N.DAB)
      $(AXE (PEG AXE 6), DAB L.DAB)
    $(AXE (PEG AXE 7), DAB R.DAB)
  ==
::
++  LOOT
  ~/  %LOOT
  |=  {COG/TERM DOM/(MAP TERM TOME)}
  =+  AXE=1
  |-  ^-  (UNIT {P/AXIS Q/HOON})
  ?-  DOM
      ~  ~
  ::
      {* ~ ~}
    %+  BIND  (LOOK COG Q.Q.N.DOM)
    |=((PAIR AXIS HOON) [(PEG AXE P) Q])
  ::
      {* ~ *}
    =+  YEP=(LOOK COG Q.Q.N.DOM)
    ?^  YEP
      [~ (PEG (PEG AXE 2) P.U.YEP) Q.U.YEP]
    $(AXE (PEG AXE 3), DOM R.DOM)
  ::
      {* * ~}
    =+  YEP=(LOOK COG Q.Q.N.DOM)
    ?^  YEP
      [~ (PEG (PEG AXE 2) P.U.YEP) Q.U.YEP]
    $(AXE (PEG AXE 3), DOM L.DOM)
  ::
      {* * *}
    =+  YEP=(LOOK COG Q.Q.N.DOM)
    ?^  YEP
      [~ (PEG (PEG AXE 2) P.U.YEP) Q.U.YEP]
    =+  PEY=$(AXE (PEG AXE 6), DOM L.DOM)
    ?^  PEY  PEY
    $(AXE (PEG AXE 7), DOM R.DOM)
  ==
::
::::  5B: MACRO EXPANSION
  ::
++  AH                                                  ::  TIKI ENGINE
  |_  TIK/TIKI
  ++  BLUE
    |=  GEN/HOON
    ^-  HOON
    ?.  &(?=(%| -.TIK) ?=(~ P.TIK))  GEN
    [%TSBN [%$ 3] GEN]
  ::
  ++  TEAL
    |=  MOD/SPEC
    ^-  SPEC
    [%OVER [%& 3]~ MOD]
  ::
  ++  TELE
    |=  SYN/SKIN
    ^-  SKIN
    [%OVER [%& 3]~ SYN]
  ::
  ++  GRAY
    |=  GEN/HOON
    ^-  HOON
    ?-  -.TIK
      %&  ?~(P.TIK GEN [%TSTR [U.P.TIK ~] [%WING Q.TIK] GEN])
      %|  [%TSLS ?~(P.TIK Q.TIK [%KTTS U.P.TIK Q.TIK]) GEN]
    ==
  ::
  ++  PUCE
    ^-  WING
    ?-  -.TIK
      %&  ?~(P.TIK Q.TIK [U.P.TIK ~])
      %|  [[%& 2] ~]
    ==
  ::
  ++  WTHP  |=  OPT/(LIST (PAIR SPEC HOON))
            %+  GRAY  %WTHP
            [PUCE (TURN OPT |=({A/SPEC B/HOON} [A (BLUE B)]))]
  ++  WTKT  |=({SIC/HOON NON/HOON} (GRAY [%WTKT PUCE (BLUE SIC) (BLUE NON)]))
  ++  WTLS  |=  {GEN/HOON OPT/(LIST (PAIR SPEC HOON))}
            %+  GRAY  %WTLS
            [PUCE (BLUE GEN) (TURN OPT |=({A/SPEC B/HOON} [A (BLUE B)]))]
  ++  WTVT  |=({SIC/HOON NON/HOON} (GRAY [%WTVT PUCE (BLUE SIC) (BLUE NON)]))
  ++  WTSG  |=({SIC/HOON NON/HOON} (GRAY [%WTSG PUCE (BLUE SIC) (BLUE NON)]))
  ++  WTHX  |=(SYN/SKIN (GRAY [%WTHX (TELE SYN) PUCE]))
  ++  WTTS  |=(MOD/SPEC (GRAY [%WTTS (TEAL MOD) PUCE]))
  --
::
++  AX
  =+  :*  ::  DOM: AXIS TO HOME
          ::  HAY: WING TO HOME
          ::  COX: HYGIENIC CONTEXT
          ::  BUG: DEBUG ANNOTATIONS
          ::  DEF: DEFAULT EXPRESSION
          ::
          DOM=`AXIS`1
          HAY=*WING
          COX=*(MAP TERM SPEC)
          BUG=*(LIST SPOT)
          NUT=*(UNIT NOTE)
          DEF=*(UNIT HOON)
      ==
  |_  {FAB/? MOD/SPEC}
  ::
  ++  AUTONAME
    ::  DERIVE NAME FROM SPEC
    ::
    |-  ^-  (UNIT TERM)
    ?-  -.MOD
      $BASE  ?.(?=([%ATOM *] P.MOD) ~ ?:(=(%$ P.P.MOD) `%ATOM `P.P.MOD))
      $DBUG  $(MOD Q.MOD)
      $LEAF  `P.MOD
      $LOOP  `P.MOD
      $LIKE  ?~(P.MOD ~ ?^(I.P.MOD ?:(?=(%& -.I.P.MOD) ~ Q.I.P.MOD) `I.P.MOD))
      $MAKE  ~(NAME AP P.MOD)
      $MADE  $(MOD Q.MOD)
      $OVER  $(MOD Q.MOD)
      $NAME  $(MOD Q.MOD)
    ::
      $BSBS  $(MOD P.MOD)
      $BSBR  $(MOD P.MOD)
      $BSCB  ~(NAME AP P.MOD)
      $BSCL  $(MOD I.P.MOD)
      $BSCN  $(MOD I.P.MOD)
      $BSDT  ~
      $BSLD  $(MOD Q.MOD)
      $BSBN  $(MOD Q.MOD)
      $BSHP  $(MOD P.MOD)
      $BSKT  $(MOD Q.MOD)
      $BSLS  $(MOD Q.MOD)
      $BSNT  ~
      $BSMC  ~(NAME AP P.MOD)
      $BSPD  $(MOD P.MOD)
      $BSSG  $(MOD Q.MOD)
      $BSTC  ~
      $BSTS  $(MOD Q.MOD)
      $BSVT  $(MOD Q.MOD)
      $BSWT  $(MOD I.P.MOD)
      $BSZP  ~
    ==
  ++  HINT
    |=  NOT/NOTE
    ^+  +>
    ?>(?=(~ NUT) +>.$(NUT `NOT))
  ::
  ++  FUNCTION
    ::  CONSTRUCT A FUNCTION EXAMPLE
    ::
    |=  {FUN/SPEC ARG/SPEC}
    ^-  HOON
    ::  MINIMAL CONTEXT AS SUBJECT
    ::
    :+  %TSBN
      ::  CONTEXT IS EXAMPLE OF BOTH SPECS
      ::
      [EXAMPLE:CLEAR(MOD FUN) EXAMPLE:CLEAR(MOD ARG)]
    ::  PRODUCE AN %IRON (CONTRAVARIANT) CORE
    ::
    :-  %KTBR
    ::  MAKE AN ACTUAL GATE
    ::
    :+  %BRCL
      [%$ 2]
    [%$ 15]
  ::
  ++  INTERFACE
    ::  CONSTRUCT A CORE EXAMPLE
    ::
    |=  {VARIANCE/VAIR PAYLOAD/SPEC ARMS/(MAP TERM SPEC)}
    ^-  HOON
    ::  ATTACH PROPER VARIANCE CONTROL
    ::
    =-  ?-  VARIANCE
          %GOLD  -
          %LEAD  [%KTWT -]
          %ZINC  [%KTPD -]
          %IRON  [%KTBR -]
        ==
    ^-  HOON
    :+  %TSBN  EXAMPLE:CLEAR(MOD PAYLOAD)
    :+  %BRCN  ~
    =-  [[%$ ~ -] ~ ~]
    %-  ~(GAS BY *(MAP TERM HOON))
    %+  TURN
      ~(TAP BY ARMS)
    |=  [=TERM =SPEC]
    ::
    ::  NOTE THAT WE *DON'T* MAKE ARM SPECS IN AN INTERFACE
    ::  HYGIENIC -- WE LEAVE THEM IN CONTEXT, TO SUPPORT
    ::  MAXIMUM PROGRAMMER FLEXIBILITY
    ::
    [TERM EXAMPLE:CLEAR(MOD SPEC)]
  ::
  ++  HOME
    ::  EXPRESS A HOON AGAINST THE ORIGINAL SUBJECT
    ::
    |=  GEN/HOON
    ^-  HOON
    =+  ^-  WING
        ?:  =(1 DOM)
          HAY
        (WELD HAY `WING`[[%& DOM] ~])
    ?~  -  GEN
    [%TSBN [%WING -] GEN]
  ::
  ++  CLEAR
    ::  CLEAR ANNOTATIONS
    ^+  .
    .(BUG ~, DEF ~, NUT ~)
  ::
  ++  BASAL
    ::  EXAMPLE BASE CASE
    ::
    |=  BAS/BASE
    ?-    BAS
    ::
        {$ATOM *}
      ::  WE MAY WANT SPED
      ::
      [%SAND P.BAS ?:(=(%DA P.BAS) ~2000.1.1 0)]
    ::
        $NOUN
      ::  RAW NOCK PRODUCES NOUN TYPE
      ::
      =+([%ROCK %$ 0] [%KTLS [%DTTR - - [%ROCK %$ 1]] -])
    ::
        $CELL
      ::  REDUCE TO PAIR OF NOUNS
      ::
      =+($(BAS %NOUN) [- -])
    ::
        $FLAG
      ::  COMPARISON PRODUCES BOOLEAN TYPE
      ::
      =+([%ROCK %$ 0] [%KTLS [%DTTS - -] -])
    ::
        $NULL
      [%ROCK %N 0]
    ::
        $VOID
      [%ZPZP ~]
    ==
  ::
  ++  UNFOLD
    |=  [FUN/HOON ARG/(LIST SPEC)]
    ^-  HOON
    [%CNCL FUN (TURN ARG |=(SPEC KTCL/+<))]
  ::
  ++  UNREEL
    |=  [ONE/WING RES/(LIST WING)]
    ^-  HOON
    ?~(RES [%WING ONE] [%TSLD [%WING ONE] $(ONE I.RES, RES T.RES)])
  ::
  ++  DESCEND
    ::  RECORD AN AXIS TO ORIGINAL SUBJECT
    ::
    |=  AXE/AXIS
    +>(DOM (PEG AXE DOM))
  ::
  ++  DECORATE
    ::  APPLY DOCUMENTATION TO EXPRESSION
    ::
    |=  GEN/HOON
    ^-  HOON
    =-  ?~(NUT - [%NOTE U.NUT -])
    ^-  HOON
    |-  ^-  HOON
    ?~(BUG GEN [%DBUG I.BUG $(BUG T.BUG)])
  ::
  ++  PIECES
    ::  ENUMERATE TUPLE WINGS
    ::
    |=  =(LIST TERM)
    ^-  (^LIST WING)
    (TURN LIST |=(=TERM `WING`[TERM ~]))
  ::
  ++  SPORE
    ::  BUILD DEFAULT SAMPLE
    ::
    ^-  HOON
    ::  SAMPLE IS ALWAYS TYPELESS
    ::
    :+  %KTLS
      [%BUST %NOUN]
    ::  CONSUME DEBUGGING CONTEXT
    ::
    %-  DECORATE
    ::  USE HOME AS SUBJECT
    ::
    %-  HOME
    ::  IF DEFAULT IS SET, USE IT
    ::
    ?^  DEF  U.DEF
    ::  ELSE MAP STRUCTURE TO EXPRESSION
    ::
    ~+
    |-  ^-  HOON
    ?-  MOD
      {$BASE *}  ?:(=(%VOID P.MOD) [%ROCK %N 0] (BASAL P.MOD))
      {$BSBS *}  ::  TRACK HYGIENIC RECURSION POINTS LEXICALLY
                 ::
                 %=  $
                   MOD  P.MOD
                   COX  ::  MERGE LEXICALLY AND DON'T FORGET %$
                        ::
                        (~(PUT BY ^+(COX (~(UNI BY COX) Q.MOD))) %$ P.MOD)
                 ==
      {$DBUG *}  [%DBUG P.MOD $(MOD Q.MOD)]
      {$LEAF *}  [%ROCK P.MOD Q.MOD]
      {$LOOP *}  ~|([%LOOP P.MOD] $(MOD (~(GOT BY COX) P.MOD)))
      {$LIKE *}  $(MOD BSMC/(UNREEL P.MOD Q.MOD))
      {$MADE *}  $(MOD Q.MOD)
      {$MAKE *}  $(MOD BSMC/(UNFOLD P.MOD Q.MOD))
      {$NAME *}  $(MOD Q.MOD)
      {$OVER *}  $(HAY P.MOD, MOD Q.MOD)
    ::
      {$BSBR *}  $(MOD P.MOD)
      {$BSCB *}  [%ROCK %N 0]
      {$BSCL *}  |-  ^-  HOON
                 ?~  T.P.MOD  ^$(MOD I.P.MOD)
                 :-  ^$(MOD I.P.MOD)
                 $(I.P.MOD I.T.P.MOD, T.P.MOD T.T.P.MOD)
      {$BSCN *}  ::  USE LAST ENTRY
                 ::
                 |-  ^-  HOON
                 ?~  T.P.MOD  ^$(MOD I.P.MOD)
                 $(I.P.MOD I.T.P.MOD, T.P.MOD T.T.P.MOD)
      {$BSHP *}  ::  SEE UNDER %BSCB
                 ::
                 [%ROCK %N 0]
      {$BSLD *}  $(MOD Q.MOD)
      {$BSBN *}  $(MOD Q.MOD)
      {$BSKT *}  $(MOD Q.MOD)
      {$BSLS *}  $(MOD Q.MOD)
      {$BSMC *}  ::  BORROW SAMPLE
                 ::
                 [%TSLD [%$ 6] P.MOD]
      {$BSPD *}  $(MOD P.MOD)
      {$BSSG *}  [%KTHP Q.MOD P.MOD]
      {$BSTS *}  [%KTTS P.MOD $(MOD Q.MOD)]
      {$BSVT *}  $(MOD P.MOD)
      {$BSWT *}  ::  USE LAST ENTRY
                 ::
                 |-  ^-  HOON
                 ?~  T.P.MOD  ^$(MOD I.P.MOD)
                 $(I.P.MOD I.T.P.MOD, T.P.MOD T.T.P.MOD)
      {$BSDT *}  [%ROCK %N 0]
      {$BSNT *}  [%ROCK %N 0]
      {$BSTC *}  [%ROCK %N 0]
      {$BSZP *}  [%ROCK %N 0]
    ==
  ::
  ++  EXAMPLE
    ::  PRODUCE A CORRECTLY TYPED DEFAULT INSTANCE
    ::
    ~+
    ^-  HOON
    ?+  MOD
      ::  IN THE GENERAL CASE, MAKE AND ANALYZE A SPORE
      ::
      :+  %TSLS
        SPORE
      ~(RELATIVE ANALYZE:(DESCEND 3) 2)
    ::
      {$BASE *}  (DECORATE (BASAL P.MOD))
      {$DBUG *}  EXAMPLE(MOD Q.MOD, BUG [P.MOD BUG])
      {$LEAF *}  (DECORATE [%ROCK P.MOD Q.MOD])
      {$LIKE *}  EXAMPLE(MOD BSMC/(UNREEL P.MOD Q.MOD))
      {$LOOP *}  [%LIMB P.MOD]
      {$MADE *}  EXAMPLE(MOD Q.MOD, NUT `MADE/[P.P.MOD `(PIECES Q.P.MOD)])
      {$MAKE *}  EXAMPLE(MOD BSMC/(UNFOLD P.MOD Q.MOD))
      {$NAME *}  EXAMPLE(MOD Q.MOD, NUT `MADE/[P.MOD ~])
      {$OVER *}  EXAMPLE(HAY P.MOD, MOD Q.MOD)
    ::
      {$BSCB *}  (DECORATE (HOME P.MOD))
      {$BSCL *}  %-  DECORATE
                 |-  ^-  HOON
                 ?~  T.P.MOD
                   EXAMPLE:CLEAR(MOD I.P.MOD)
                 :-  EXAMPLE:CLEAR(MOD I.P.MOD)
                 EXAMPLE:CLEAR(I.P.MOD I.T.P.MOD, T.P.MOD T.T.P.MOD)
      {$BSHP *}  (DECORATE (FUNCTION:CLEAR P.MOD Q.MOD))
      {$BSMC *}  (DECORATE (HOME [%TSLD [%LIMB %$] P.MOD]))
      {$BSSG *}  [%KTLS EXAMPLE(MOD Q.MOD) (HOME P.MOD)]
      {$BSLS *}  (DECORATE EXAMPLE(MOD Q.MOD))
      {$BSTS *}  (DECORATE [%KTTS P.MOD EXAMPLE:CLEAR(MOD Q.MOD)])
      {$BSDT *}  (DECORATE (HOME (INTERFACE %GOLD P.MOD Q.MOD)))
      {$BSNT *}  (DECORATE (HOME (INTERFACE %IRON P.MOD Q.MOD)))
      {$BSZP *}  (DECORATE (HOME (INTERFACE %LEAD P.MOD Q.MOD)))
      {$BSTC *}  (DECORATE (HOME (INTERFACE %ZINC P.MOD Q.MOD)))
    ==
  ::
  ++  FACTORY
    ::  MAKE A NORMALIZING GATE (MOLD)
    ::
    ^-  HOON
    ::  PROCESS ANNOTATIONS OUTSIDE CONSTRUCT, TO CATCH DEFAULT
    ::
    ?:  ?=($DBUG -.MOD)  FACTORY(MOD Q.MOD, BUG [P.MOD BUG])
    ?:  ?=($BSSG -.MOD)  FACTORY(MOD Q.MOD, DEF `[%KTHP Q.MOD P.MOD])
    ^-  HOON
    ::  IF WE RECOGNIZE AN INDIRECTION
    ::
    ?:  &(=(~ DEF) ?=(?(%BSMC %LIKE %LOOP %MAKE) -.MOD))
      ::  THEN SHORT-CIRCUIT IT
      ::
      %-  DECORATE
      %-  HOME
      ?-  -.MOD
        %BSMC  P.MOD
        %LIKE  (UNREEL P.MOD Q.MOD)
        %LOOP  [%LIMB P.MOD]
        %MAKE  (UNFOLD P.MOD Q.MOD)
      ==
    ::  ELSE BUILD A GATE
    ::
    :+  %BRCL
      [%KTSG SPORE]
    ~(RELATIVE ANALYZE:(DESCEND 7) 6)
  ::
  ++  ANALYZE
    ::  NORMALIZE A FRAGMENT OF THE SUBJECT
    ::
    |_  $:  ::  AXE: AXIS TO FRAGMENT
            ::
            AXE/AXIS
        ==
    ++  BASIC
      |=  BAS/BASE
      ^-  HOON
      ?-    BAS
          {%ATOM *}
        :+  %KTLS  EXAMPLE
        ^-  HOON
        :^    %ZPVT
            [[[%| 0 `%RUTH] ~] ~]
          [%CNLS [%LIMB %RUTH] [%SAND %TA P.BAS] FETCH]
        [%WTVT FETCH-WING FETCH [%ZPZP ~]]
      ::
          $CELL
        :+  %KTLS  EXAMPLE
        =+  FETCH-WING
        :-  [%WING [[%& %2] -]]
            [%WING [[%& %3] -]]
      ::
          $FLAG
        :^    %WTCL
            [%DTTS [%ROCK %$ &] [%$ AXE]]
          [%ROCK %F &]
        :+  %WTBN
          [%DTTS [%ROCK %$ |] [%$ AXE]]
        [%ROCK %F |]
      ::
          $NOUN
        FETCH
      ::
          $NULL
        :+  %WTBN
          [%DTTS [%BUST %NOUN] [%$ AXE]]
        [%ROCK %N ~]
      :::
          $VOID
        [%ZPZP ~]
      ==
    ++  CLEAR
      .(..ANALYZE ^CLEAR)
    ::
    ++  FETCH
      ::  LOAD THE FRAGMENT
      ::
      ^-  HOON
      [%$ AXE]
    ::
    ++  FETCH-WING
      ::  LOAD, AS A WING
      ::
      ^-  WING
      [[%& AXE] ~]
    ::
    ++  CHOICE
      ::  MATCH FULL MODELS, BY TRYING THEM
      ::
      |=  $:  ::  ONE: FIRST OPTION
              ::  REP: OTHER OPTIONS
              ::
              ONE/SPEC
              REP/(LIST SPEC)
          ==
      ^-  HOON
      ::  IF NO OTHER CHOICES, CONSTRUCT HEAD
      ::
      ?~  REP  RELATIVE:CLEAR(MOD ONE)
      ::  BUILD TEST
      ::
      :^    %WTCL
          ::  IF WE FIT THE TYPE OF THIS CHOICE
          ::
          [%FITS EXAMPLE:CLEAR(MOD ONE) FETCH-WING]
        ::  BUILD WITH THIS CHOICE
        ::
        RELATIVE:CLEAR(MOD ONE)
      ::  CONTINUE THROUGH LOOP
      ::
      $(ONE I.REP, REP T.REP)
    ::
    ++  SWITCH
      |=  $:  ::  ONE: FIRST FORMAT
              ::  TWO: MORE FORMATS
              ::
              ONE/SPEC
              REP/(LIST SPEC)
          ==
      |-  ^-  HOON
      ::  IF NO OTHER CHOICES, CONSTRUCT HEAD
      ::
      ?~  REP  RELATIVE:CLEAR(MOD ONE)
      ::  FIN: LOOP COMPLETION
      ::
      =/  FIN/HOON  $(ONE I.REP, REP T.REP)
      ::  INTERROGATE THIS INSTANCE
      ::
      :^    %WTCL
          ::  TEST IF THE HEAD MATCHES THIS WING
          ::
          :+  %FITS
            [%TSLD [%$ 2] EXAMPLE:CLEAR(MOD ONE)]
          FETCH-WING(AXE (PEG AXE 2))
        ::  IF SO, USE THIS FORM
        ::
        RELATIVE:CLEAR(MOD ONE)
      ::  CONTINUE IN THE LOOP
      ::
      FIN
    ::
    ++  RELATIVE
      ::  LOCAL CONSTRUCTOR
      ::
      ~+
      ^-  HOON
      ?-    MOD
      ::
      ::  BASE
      ::
          {$BASE *}
        (DECORATE (BASIC:CLEAR P.MOD))
      ::
      ::  DEBUG
      ::
          {$DBUG *}
        RELATIVE(MOD Q.MOD, BUG [P.MOD BUG])
      ::
      ::  CONSTANT
      ::
          {$LEAF *}
        %-  DECORATE
        :+  %WTBN
          [%DTTS FETCH [%ROCK %$ Q.MOD]]
        [%ROCK P.MOD Q.MOD]
      ::
      ::  COMPOSITE
      ::
          {$MAKE *}
        RELATIVE(MOD BSMC/(UNFOLD P.MOD Q.MOD))
      ::
      ::  INDIRECT
      ::
          {$LIKE *}
        RELATIVE(MOD BSMC/(UNREEL P.MOD Q.MOD))
      ::
      ::  LOOP
      ::
          {$LOOP *}
        (DECORATE [%CNHP [%LIMB P.MOD] FETCH])
      ::
      ::  SIMPLE NAMED STRUCTURE
      ::
          {$NAME *}
        RELATIVE(MOD Q.MOD, NUT `MADE/[P.MOD ~])
      ::
      ::  SYNTHETIC NAMED STRUCTURE
      ::
          {$MADE *}
        RELATIVE(MOD Q.MOD, NUT `MADE/[P.P.MOD `(PIECES Q.P.MOD)])
      ::
      ::  SUBJECTIVE
      ::
          {$OVER *}
        RELATIVE(HAY P.MOD, MOD Q.MOD)
      ::
      ::  RECURSIVE, $$
      ::
          {$BSBS *}
        ::
        ::  APPLY SEMANTICALLY
        ::
        :+  %BRKT
          RELATIVE(MOD P.MOD, DOM (PEG 3 DOM))
        =-  [[%$ ~ -] ~ ~]
        %-  ~(GAS BY *(MAP TERM HOON))
        ^-  (LIST (PAIR TERM HOON))
        %+  TURN
          ~(TAP BY Q.MOD)
        |=  [=TERM =SPEC]
        [TERM RELATIVE(MOD SPEC, DOM (PEG 3 DOM))]
      ::
      ::  NORMALIZE, $&
      ::
          {$BSPD *}
        ::  PUSH THE RAW RESULT
        ::
        :+  %TSLS  RELATIVE(MOD P.MOD)
        ::  PUSH REPAIR FUNCTION
        ::
        :+  %TSLS
          [%TSBN $/3 Q.MOD]
        ::  PUSH REPAIRED PRODUCT
        ::
        :+  %TSLS
          [%CNHP $/2 $/6]
        ::  SANITY-CHECK REPAIRED PRODUCT
        ::
        :+  %WTBN
          ::  EITHER
          ::
          :~  %WTBR
              ::  THE REPAIR DID NOT CHANGE ANYTHING
              ::
              [%DTTS $/14 $/2]
              ::  WHEN WE FIX IT AGAIN, IT STAYS FIXED
              ::
              [%DTTS $/2 [%CNHP $/6 $/2]]
          ==
        $/2
      ::
      ::  VERIFY, $|
      ::
          {$BSBR *}
        ^-  HOON
        ::  PUSH THE RAW PRODUCT
        ::
        :+  %TSLS  RELATIVE(MOD P.MOD)
        ^-  HOON
        ::  ASSERT
        ::
        :+  %WTBN
          ::  RUN THE VERIFIER
          ::
          [%CNHP [%TSBN $/3 Q.MOD] $/2]
        ::  PRODUCE VERIFIED PRODUCT
        ::
        $/2
      ::
      ::  SPECIAL, $_
      ::
          {$BSCB *}
        (DECORATE (HOME P.MOD))
      ::
      ::  SWITCH, $%
      ::
          {$BSCN *}
        (DECORATE (SWITCH I.P.MOD T.P.MOD))
      ::
      ::  TUPLE, $:
      ::
          {$BSCL *}
        %-  DECORATE
        |-  ^-  HOON
        ?~  T.P.MOD
          RELATIVE:CLEAR(MOD I.P.MOD)
        :-  RELATIVE:CLEAR(MOD I.P.MOD, AXE (PEG AXE 2))
        %=  RELATIVE
          I.P.MOD  I.T.P.MOD
          T.P.MOD  T.T.P.MOD
          AXE      (PEG AXE 3)
        ==
      ::
      ::  EXCLUDE, $<
      ::
          {$BSLD *}
        :+  %TSLS
          RELATIVE
        :+  %WTLD
          [%WTTS [%OVER ~[&/3] P.MOD] ~[&/4]]
        $/2
      ::
      ::  REQUIRE, $>
      ::
          {$BSBN *}
        :+  %TSLS
          RELATIVE
        :+  %WTBN
          [%WTTS [%OVER ~[&/3] P.MOD] ~[&/4]]
        $/2
      ::
      ::  FUNCTION
      ::
          {$BSHP *}
        %-  DECORATE
        =/  FUN  (FUNCTION:CLEAR P.MOD Q.MOD)
        ?^  DEF
          [%KTLS FUN U.DEF]
        FUN
      ::
      ::  BRIDGE, $^
      ::
          {$BSKT *}
        %-  DECORATE
        :^    %WTCL
            [%DTWT FETCH(AXE (PEG AXE 2))]
          RELATIVE:CLEAR(MOD P.MOD)
        RELATIVE:CLEAR(MOD Q.MOD)
      ::
      ::  SYNTHESIS, $;
      ::
          {$BSMC *}
        (DECORATE [%CNCL (HOME P.MOD) FETCH ~])
      ::
      ::  DEFAULT
      ::
          {$BSSG *}
        RELATIVE(MOD Q.MOD, DEF `[%KTHP Q.MOD P.MOD])
      ::
      ::  CHOICE, $?
      ::
          {$BSWT *}
        (DECORATE (CHOICE I.P.MOD T.P.MOD))
      ::
      ::  NAME, $=
      ::
          {$BSTS *}
        [%KTTS P.MOD RELATIVE(MOD Q.MOD)]
      ::
      ::  BRANCH, $@
      ::
          {$BSVT *}
        %-  DECORATE
        :^    %WTCL
            [%DTWT FETCH]
          RELATIVE:CLEAR(MOD Q.MOD)
        RELATIVE:CLEAR(MOD P.MOD)
      ::
        {$BSLS *}  RELATIVE(MOD Q.MOD)
        {$BSDT *}  (DECORATE (HOME (INTERFACE %GOLD P.MOD Q.MOD)))
        {$BSNT *}  (DECORATE (HOME (INTERFACE %IRON P.MOD Q.MOD)))
        {$BSZP *}  (DECORATE (HOME (INTERFACE %LEAD P.MOD Q.MOD)))
        {$BSTC *}  (DECORATE (HOME (INTERFACE %ZINC P.MOD Q.MOD)))
      ==
    --
  --
::
++  AP                                                  ::  HOON ENGINE
  ~%    %AP
      +>+
    ==
      %OPEN  OPEN
      %RAKE  RAKE
    ==
  =+  FAB=`?`&
  |_  GEN/HOON
  ::
  ++  GRIP
    |=  =SKIN
    =|  REL/WING
    |-  ^-  HOON
    ?-    SKIN
        @
      [%TSLD [%TUNE SKIN] GEN]
        [%BASE *]
      ?:  ?=(%NOUN BASE.SKIN)
        GEN
      [%KTHP SKIN GEN]
    ::
        [%CELL *]
      =+  HAF=~(HALF AP GEN)
      ?^  HAF
        :-  $(SKIN SKIN.SKIN, GEN P.U.HAF)
        $(SKIN ^SKIN.SKIN, GEN Q.U.HAF)
      :+  %TSLS
        GEN
      :-  $(SKIN SKIN.SKIN, GEN [%$ 4])
      $(SKIN ^SKIN.SKIN, GEN [%$ 5])
    ::
        [%DBUG *]
      [%DBUG SPOT.SKIN $(SKIN SKIN.SKIN)]
    ::
        [%LEAF *]
      [%KTHP SKIN GEN]
    ::
        [%HELP *]
      [%NOTE [%HELP HELP.SKIN] $(SKIN SKIN.SKIN)]
    ::
        [%NAME *]
      [%TSLD [%TUNE TERM.SKIN] $(SKIN SKIN.SKIN)]
    ::
        [%OVER *]
      $(SKIN SKIN.SKIN, REL (WELD WING.SKIN REL))
    ::
        [%SPEC *]
      :+  %KTHP
        ?~(REL SPEC.SKIN [%OVER REL SPEC.SKIN])
      $(SKIN SKIN.SKIN)
    ::
        [%WASH *]
      :+  %TSLD
        :-  %WING
        |-  ^-  WING
        ?:  =(0 DEPTH.SKIN)  ~
        [[%| 0 ~] $(DEPTH.SKIN (DEC DEPTH.SKIN))]
      GEN
    ==
  ::
  ++  NAME
    |-  ^-  (UNIT TERM)
    ?+  GEN  ~
      {$WING *}  ?~  P.GEN  ~
                 ?^  I.P.GEN
                   ?:(?=(%& -.I.P.GEN) ~ Q.I.P.GEN)
                 `I.P.GEN
      {$LIMB *}  `P.GEN
      {$DBUG *}  $(GEN ~(OPEN AP GEN))
      {$TSLD *}  $(GEN ~(OPEN AP GEN))
      {$TSBN *}  $(GEN Q.GEN)
    ==
  ::
  ++  FECK
    |-  ^-  (UNIT TERM)
    ?-  GEN
      {$SAND $TAS @}  [~ Q.GEN]
      {$DBUG *}       $(GEN Q.GEN)
      *               ~
    ==
  ::
  ::  NOT USED AT PRESENT; SEE COMMENT AT $CSNG IN ++OPEN
::::
::++  HAIL
::  |=  AXE/AXIS
::  =|  AIR/(LIST (PAIR WING HOON))
::  |-  ^+  AIR
::  =+  HAV=HALF
::  ?~  HAV  [[[[%| 0 ~] [%& AXE] ~] GEN] AIR]
::  $(GEN P.U.HAV, AXE (PEG AXE 2), AIR $(GEN Q.U.HAV, AXE (PEG AXE 3)))
::
  ++  HALF
    |-  ^-  (UNIT (PAIR HOON HOON))
    ?+  GEN  ~
      {^ *}       `[P.GEN Q.GEN]
      {$DBUG *}   $(GEN Q.GEN)
      {$CLCB *}   `[Q.GEN P.GEN]
      {$CLHP *}   `[P.GEN Q.GEN]
      {$CLKT *}   `[P.GEN %CLLS Q.GEN R.GEN S.GEN]
      {$CLSG *}   ?~(P.GEN ~ `[I.P.GEN %CLSG T.P.GEN])
      {$CLTR *}   ?~  P.GEN  ~
                  ?~(T.P.GEN $(GEN I.P.GEN) `[I.P.GEN %CLTR T.P.GEN])
    ==
::::
  ::  +FLAY: HOON TO SKIN
  ::
  ++  FLAY
    |-  ^-  (UNIT SKIN)
    ?+    GEN
      =+(OPEN ?:(=(- GEN) ~ $(GEN -)))
    ::
        [^ *]
      =+  [$(GEN P.GEN) $(GEN Q.GEN)]
      ?~(-< ~ ?~(-> ~ `[%CELL -<+ ->+]))
    ::
        [%BASE *]
      `GEN
    ::
        [%ROCK *]
      ?@(Q.GEN `[%LEAF P.GEN Q.GEN] ~)
    ::
        [%CNTS [@ ~] ~]
      `I.P.GEN
    ::
        [%TSBN *]
      %+  BIFF  REEK(GEN P.GEN)
      |=  =WING
      (BIND ^$(GEN Q.GEN) |=(=SKIN [%OVER WING SKIN]))
    ::
        [%LIMB @]
      `P.GEN
    ::
      ::  [%ROCK *]
      ::  [%SPEC %LEAF Q.GEN Q.GEN]
    ::
        [%NOTE [%HELP *] *]
      (BIND $(GEN Q.GEN) |=(=SKIN [%HELP P.P.GEN SKIN]))
    ::
        [%WING *]
      ?:  ?=([@ ~] P.GEN)
        `I.P.GEN
      =/  DEPTH  0
      |-  ^-  (UNIT SKIN)
      ?~  P.GEN  `[%WASH DEPTH]
      ?.  =([%| 0 ~] I.P.GEN)  ~
      $(P.GEN T.P.GEN)
    ::
        [%KTTR *]
      `[%SPEC P.GEN %BASE %NOUN]
    ::
        [%KTTS *]
      %+  BIFF  $(GEN Q.GEN)
      |=  =SKIN
      ?@  P.GEN  `[%NAME P.GEN SKIN]
      ?.  ?=([%NAME @ [%BASE %NOUN]] P.GEN)  ~
      `[%NAME TERM.P.GEN SKIN]
    ==
  ::
  ++  OPEN
    ^-  HOON
    ?-    GEN
        {~ *}     [%CNTS [[%& P.GEN] ~] ~]
    ::
        {$BASE *}  ~(FACTORY AX FAB `SPEC`GEN)
        {$BUST *}  ~(EXAMPLE AX FAB %BASE P.GEN)
        {$KTCL *}  ~(FACTORY AX FAB P.GEN)
        {$DBUG *}   Q.GEN
        {$EROR *}  ~>(%SLOG.[0 LEAF/P.GEN] !!)
    ::
        {$KNIT *}                                       ::
      :+  %TSBN  [%KTTS %V %$ 1]                        ::  =>  V=.
      :-  %BRHP                                         ::  |-
      :+  %KTLS                                         ::  ^+
        :-  %BRHP                                       ::  |-
        :^    %WTCL                                     ::  ?:
            [%BUST %FLAG]                               ::  ?
          [%BUST %NULL]                                 ::  ~
        :-  [%KTTS %I [%SAND 'TD' *@]]                  ::  :-  I=~~
        [%KTTS %T [%LIMB %$]]                           ::  T=$
      |-  ^-  HOON                                      ::
      ?~  P.GEN                                         ::
        [%BUST %NULL]                                   ::  ~
      =+  RES=$(P.GEN T.P.GEN)                          ::
      ^-  HOON                                          ::
      ?@  I.P.GEN                                       ::
        [[%SAND 'TD' I.P.GEN] RES]                      ::  [~~{I.P.GEN} {RES}]
      :+  %TSLS                                         ::
        :-  :+  %KTTS                                   ::  ^=
              %A                                        ::  A
            :+  %KTLS                                   ::  ^+
              [%LIMB %$]                                ::  $
            [%TSBN [%LIMB %V] P.I.P.GEN]                ::  =>(V {P.I.P.GEN})
        [%KTTS %B RES]                                  ::  B={RES}
      ^-  HOON                                          ::
      :-  %BRHP                                         ::  |-
      :^    %WTVT                                       ::  ?@
          [%A ~]                                        ::  A
        [%LIMB %B]                                      ::  B
      :-  [%TSLD [%$ 2] [%LIMB %A]]                     ::  :-  -.A
      :+  %CNTS                                         ::  %=
        [%$ ~]                                          ::  $
      [[[%A ~] [%TSLD [%$ 3] [%LIMB %A]]] ~]            ::  A  +.A
    ::
        {$LEAF *}  ~(FACTORY AX FAB `SPEC`GEN)
        {$LIMB *}  [%CNTS [P.GEN ~] ~]
        {$TELL *}  [%CNCL [%LIMB %NOAH] [%ZPBN [%CLTR P.GEN]] ~]
        {$WING *}  [%CNTS P.GEN ~]
        {$YELL *}  [%CNCL [%LIMB %CAIN] [%ZPBN [%CLTR P.GEN]] ~]
        {$NOTE *}  Q.GEN
    ::
        {$BRCB *}  :+  %TSLS  [%KTTR P.GEN]
                   :+  %BRCN  ~
                   %-  ~(RUN BY R.GEN)
                   |=  =TOME
                   :-  P.TOME
                   %-  ~(RUN BY Q.TOME)
                   |=  =HOON
                   ?~  Q.GEN  HOON
                   [%TSTR [P.I.Q.GEN ~] Q.I.Q.GEN $(Q.GEN T.Q.GEN)]
        {$BRCL *}  [%TSLS P.GEN [%BRDT Q.GEN]]
        {$BRDT *}  :+  %BRCN  ~
                   =-  [[%$ ~ -] ~ ~]
                   (~(PUT BY *(MAP TERM HOON)) %$ P.GEN)
        {$BRKT *}  :+  %TSLD  [%LIMB %$]
                   :+  %BRCN  ~
                   =+  ZIL=(~(GET BY Q.GEN) %$)
                   ?~  ZIL
                     %+  ~(PUT BY Q.GEN)  %$
                     [*WHAT [[%$ P.GEN] ~ ~]]
                   %+  ~(PUT BY Q.GEN)  %$
                   [P.U.ZIL (~(PUT BY Q.U.ZIL) %$ P.GEN)]
        {$BRHP *}  [%TSLD [%LIMB %$] [%BRDT P.GEN]]
        {$BRSG *}  [%KTBR [%BRTS P.GEN Q.GEN]]
        {$BRTR *}  :+  %TSLS  [%KTTR P.GEN]
                   :+  %BRVT  ~
                   =-  [[%$ ~ -] ~ ~]
                   (~(PUT BY *(MAP TERM HOON)) %$ Q.GEN)
        {$BRTS *}  :+  %BRCB  P.GEN
                   =-  [~ [[%$ ~ -] ~ ~]]
                   (~(PUT BY *(MAP TERM HOON)) %$ Q.GEN)
        {$BRWT *}  [%KTWT %BRDT P.GEN]
    ::
        {$CLKT *}  [P.GEN Q.GEN R.GEN S.GEN]
        {$CLLS *}  [P.GEN Q.GEN R.GEN]
        {$CLCB *}  [Q.GEN P.GEN]
        {$CLHP *}  [P.GEN Q.GEN]
        {$CLSG *}
      |-  ^-  HOON
      ?~  P.GEN
        [%ROCK %N ~]
      [I.P.GEN $(P.GEN T.P.GEN)]
    ::
        {$CLTR *}
      |-  ^-  HOON
      ?~  P.GEN
        [%ZPZP ~]
      ?~  T.P.GEN
        I.P.GEN
      [I.P.GEN $(P.GEN T.P.GEN)]
    ::
        {$KTTR *}  [%KTSG ~(EXAMPLE AX FAB P.GEN)]
        {$CNCB *}  [%KTLS [%WING P.GEN] %CNTS P.GEN Q.GEN]
        {$CNDT *}  [%CNCL Q.GEN [P.GEN ~]]
        {$CNKT *}  [%CNCL P.GEN Q.GEN R.GEN S.GEN ~]
        {$CNLS *}  [%CNCL P.GEN Q.GEN R.GEN ~]
        {$CNHP *}  [%CNCL P.GEN Q.GEN ~]
        ::  THIS PROBABLY SHOULD WORK, BUT DOESN'T
        ::
        ::  {$CNCL *}  [%CNTR [%$ ~] P.GEN [[[[%& 6] ~] [%CLTR Q.GEN]] ~]]
        {$CNCL *}  [%CNSG [%$ ~] P.GEN Q.GEN]
        {$CNSG *}
      ::  THIS COMPLEX MATCHING SYSTEM IS A LEFTOVER FROM THE OLD
      ::  "ELECTROPLATING" ERA.  %CNSG SHOULD BE REMOVED AND REPLACED
      ::  WITH THE COMMENTED-OUT %CNCL ABOVE.  BUT SOMETHING IS BROKEN.
      ::
      :^  %CNTR  P.GEN  Q.GEN
      =+  AXE=6
      |-  ^-  (LIST {WING HOON})
      ?~  R.GEN  ~
      ?~  T.R.GEN  [[[[%| 0 ~] [%& AXE] ~] I.R.GEN] ~]
      :-  [[[%| 0 ~] [%& (PEG AXE 2)] ~] I.R.GEN]
      $(AXE (PEG AXE 3), R.GEN T.R.GEN)
    ::
        {$CNTR *}
      ?:  =(~ R.GEN)
        [%TSBN Q.GEN [%WING P.GEN]]
      :+  %TSLS
        Q.GEN
      :+  %CNTS
        (WELD P.GEN `WING`[[%& 2] ~])
      (TURN R.GEN |=({P/WING Q/HOON} [P [%TSBN [%$ 3] Q]]))
    ::
        {$KTDT *}  [%KTLS [%CNCL P.GEN Q.GEN ~] Q.GEN]
        {$KTHP *}  [%KTLS ~(EXAMPLE AX FAB P.GEN) Q.GEN]
        {$KTTS *}  (GRIP(GEN Q.GEN) P.GEN)
    ::
        {$SGBR *}
      :+  %SGBN
        :-  %MEAN
        =+  FEK=~(FECK AP P.GEN)
        ?^  FEK  [%ROCK %TAS U.FEK]
        [%BRDT [%CNCL [%LIMB %CAIN] [%ZPBN [%TSBN [%$ 3] P.GEN]] ~]]
      Q.GEN
    ::
        {$SGCB *}  [%SGBN [%MEAN [%BRDT P.GEN]] Q.GEN]
        {$SGCN *}
      :+  %SGLD
        :-  %FAST
        :-  %CLLS
        :+  [%ROCK %$ P.GEN]
          [%ZPTS Q.GEN]
        :-  %CLSG
        =+  NOB=`(LIST HOON)`~
        |-  ^-  (LIST HOON)
        ?~  R.GEN
          NOB
        [[[%ROCK %$ P.I.R.GEN] [%ZPTS Q.I.R.GEN]] $(R.GEN T.R.GEN)]
      S.GEN
    ::
        {$SGNT *}  [%SGCN P.GEN [%$ 7] ~ Q.GEN]
        {$SGLD *}  [%TSLD [%SGBN P.GEN [%$ 1]] Q.GEN]
        {$SGBS *}  [%SGBN [%LIVE [%ROCK %$ P.GEN]] Q.GEN]
        {$SGLS *}  [%SGBN [%MEMO %ROCK %$ P.GEN] Q.GEN]
        {$SGPD *}
      :+  %SGBN
        [%SLOG [%SAND %$ P.GEN] [%CNCL [%LIMB %CAIN] [%ZPBN Q.GEN] ~]]
      R.GEN
    ::
        {$SGTS *}  [%SGBN [%GERM P.GEN] Q.GEN]
        {$SGWT *}
      :+  %TSLS  [%WTDT Q.GEN [%BUST %NULL] [[%BUST %NULL] R.GEN]]
      :^  %WTSG  [%& 2]~
        [%TSBN [%$ 3] S.GEN]
      [%SGPD P.GEN [%$ 5] [%TSBN [%$ 3] S.GEN]]
    ::
        {$MCTS *}
      |-
      ?~  P.GEN  [%BUST %NULL]
      ?-  -.I.P.GEN
        ^      [[%XRAY I.P.GEN] $(P.GEN T.P.GEN)]
        $MANX  [P.I.P.GEN $(P.GEN T.P.GEN)]
        $TAPE  [[%MCNT P.I.P.GEN] $(P.GEN T.P.GEN)]
        $CALL  [%CNCL P.I.P.GEN [$(P.GEN T.P.GEN)]~]
        $MARL  =-  [%CNDT [P.I.P.GEN $(P.GEN T.P.GEN)] -]
               ^-  HOON
               :+  %TSBR  [%BASE %CELL]
               :+  %BRVT  ~
               ^-  (MAP TERM TOME)
               =-  [[%$ ~ -] ~ ~]
               ^-  (MAP TERM HOON)
               :_  [~ ~]
               =+  SUG=[[%& 12] ~]
               :-  %$
               :^  %WTSG  SUG
                 [%CNTS SUG [[[[%& 1] ~] [%$ 13]] ~]]
               [%CNTS SUG [[[[%& 3] ~] [%CNTS [%$ ~] [[SUG [%$ 25]] ~]]] ~]]
      ==
    ::
        {$MCCL *}
      ?-    Q.GEN
          ~      [%ZPZP ~]
          {* ~}  I.Q.GEN
          ^
        :+  %TSLS
          P.GEN
        =+  YEX=`(LIST HOON)`Q.GEN
        |-  ^-  HOON
        ?-  YEX
          {* ~}  [%TSBN [%$ 3] I.YEX]
          {* ^}   [%CNCL [%$ 2] [%TSBN [%$ 3] I.YEX] $(YEX T.YEX) ~]
          ~      !!
        ==
      ==
    ::
        {$MCNT *}  =+(ZOY=[%ROCK %TA %$] [%CLSG [ZOY [%CLSG [ZOY P.GEN] ~]] ~])
        {$MCSG *}                                       ::                  ;~
      |-  ^-  HOON
      ?-  Q.GEN
          ~      ~_(LEAF+"OPEN-MCSG" !!)
          ^
        :+  %TSBN  [%KTTS %V %$ 1]                      ::  =>  V=.
        |-  ^-  HOON                                    ::
        ?:  ?=(~ T.Q.GEN)                               ::
          [%TSBN [%LIMB %V] I.Q.GEN]                    ::  =>(V {I.Q.GEN})
        :+  %TSLS  [%KTTS %A $(Q.GEN T.Q.GEN)]          ::  =+  ^=  A
        :+  %TSLS                                       ::    {$(Q.GEN T.Q.GEN)}
          [%KTTS %B [%TSBN [%LIMB %V] I.Q.GEN]]         ::  =+  ^=  B
        :+  %TSLS                                       ::    =>(V {I.Q.GEN})
          :+  %KTTS  %C                                 ::  =+  C=,.+6.B
          :+  %TSLD                                     ::
            [%WING [%| 0 ~] [%& 6] ~]                   ::
          [%LIMB %B]                                    ::
        :-  %BRDT                                       ::  |.
        :^    %CNLS                                     ::  %+
            [%TSBN [%LIMB %V] P.GEN]                    ::      =>(V {P.GEN})
          [%CNCL [%LIMB %B] [%LIMB %C] ~]               ::    (B C)
        :+  %CNTS  [%A ~]                               ::  A(,.+6 C)
        [[[[%| 0 ~] [%& 6] ~] [%LIMB %C]] ~]            ::
      ==                                                ::
    ::
        {$MCMC *}                                       ::                  ;;
      :+  %TSBN  [%KTTS %V %$ 1]                        ::  =>  V=.
      :+  %TSLS  :+  %KTTS  %A                          ::  =+  ^=  A
                 [%TSBN [%LIMB %V] P.GEN]               ::  =>(V {P.GEN})
      :+  %TSLS  [%KTTS %B [%TSBN [%LIMB %V] Q.GEN]]    ::  =+  B==>(V {Q.GEN})
      :+  %TSLS                                         ::  =+  C=(A B)
        [%KTTS %C [%CNCL [%LIMB %A] [%LIMB %B] ~]]      ::
      :+  %WTBN                                         ::  ?>(=(`*`C `*`B) C)
        :+  %DTTS                                       ::
        [%KTHP [%BASE %NOUN] [%LIMB %C]]                ::
        [%KTHP [%BASE %NOUN] [%LIMB %B]]                ::
      [%LIMB %C]                                        ::
    ::
        {$TSBR *}
      [%TSLS ~(EXAMPLE AX FAB P.GEN) Q.GEN]
    ::
        {$TSTR *}
      :+  %TSLD
        R.GEN
      [%TUNE [[P.P.GEN ~ ?~(Q.P.GEN Q.GEN [%KTHP U.Q.P.GEN Q.GEN])] ~ ~] ~]
    ::
        {$TSCL *}
      [%TSBN [%CNCB [[%& 1] ~] P.GEN] Q.GEN]
    ::
        {$TSNT *}
      [%TSLS [%KTTS P.GEN Q.GEN] R.GEN]
    ::
        {$TSMC *}  [%TSNT P.GEN R.GEN Q.GEN]
        {$TSDT *}
      [%TSBN [%CNCB [[%& 1] ~] [[P.GEN Q.GEN] ~]] R.GEN]
        {$TSWT *}                                       ::                  =?
      [%TSDT P.GEN [%WTCL Q.GEN R.GEN [%WING P.GEN]] S.GEN]
    ::
        {$TSKT *}                                       ::                  =^
      =+  WUY=(WELD Q.GEN `WING`[%V ~])                 ::
      :+  %TSBN  [%KTTS %V %$ 1]                        ::  =>  V=.
      :+  %TSLS  [%KTTS %A %TSBN [%LIMB %V] R.GEN]      ::  =+  A==>(V \R.GEN)
      :^  %TSDT  WUY  [%TSLD [%$ 3] [%LIMB %A]]
      :+  %TSBN  :-  :+  %KTTS  [%OVER [%V ~] P.GEN]
                     [%TSLD [%$ 2] [%LIMB %A]]
                 [%LIMB %V]
      S.GEN
    ::
        {$TSLD *}  [%TSBN Q.GEN P.GEN]
        {$TSLS *}  [%TSBN [P.GEN [%$ 1]] Q.GEN]
        {$TSHP *}  [%TSLS Q.GEN P.GEN]
        {$TSSG *}
      |-  ^-  HOON
      ?~  P.GEN    [%$ 1]
      ?~  T.P.GEN  I.P.GEN
      [%TSBN I.P.GEN $(P.GEN T.P.GEN)]
    ::
        {$WTBR *}
      |-
      ?~(P.GEN [%ROCK %F 1] [%WTCL I.P.GEN [%ROCK %F 0] $(P.GEN T.P.GEN)])
    ::
        {$WTDT *}   [%WTCL P.GEN R.GEN Q.GEN]
        {$WTLD *}   [%WTCL P.GEN [%ZPZP ~] Q.GEN]
        {$WTBN *}   [%WTCL P.GEN Q.GEN [%ZPZP ~]]
        {$WTKT *}   [%WTCL [%WTTS [%BASE %ATOM %$] P.GEN] R.GEN Q.GEN]
    ::
        {$WTHP *}
      |-
      ?~  Q.GEN
        [%LOST [%WING P.GEN]]
      :^    %WTCL
          [%WTTS P.I.Q.GEN P.GEN]
        Q.I.Q.GEN
      $(Q.GEN T.Q.GEN)
    ::
        {$WTLS *}
      [%WTHP P.GEN (WELD R.GEN `_R.GEN`[[[%BASE %NOUN] Q.GEN] ~])]
    ::
        {$WTPD *}
      |-
      ?~(P.GEN [%ROCK %F 0] [%WTCL I.P.GEN $(P.GEN T.P.GEN) [%ROCK %F 1]])
    ::
        {$XRAY *}
      |^  :-  [(OPEN-MANE N.G.P.GEN) %CLSG (TURN A.G.P.GEN OPEN-MART)]
          [%MCTS C.P.GEN]
      ::
      ++  OPEN-MANE
        |=  A/MANE:HOOT
        ?@(A [%ROCK %TAS A] [[%ROCK %TAS -.A] [%ROCK %TAS +.A]])
      ::
      ++  OPEN-MART
        |=  {N/MANE:HOOT V/(LIST BEER:HOOT)}
        [(OPEN-MANE N) %KNIT V]
      --
    ::
        {$WTVT *}   [%WTCL [%WTTS [%BASE %ATOM %$] P.GEN] Q.GEN R.GEN]
        {$WTSG *}   [%WTCL [%WTTS [%BASE %NULL] P.GEN] Q.GEN R.GEN]
        {$WTTS *}   [%FITS ~(EXAMPLE AX FAB P.GEN) Q.GEN]
        {$WTZP *}   [%WTCL P.GEN [%ROCK %F 1] [%ROCK %F 0]]
        {$ZPBN *}
      [%CNCL [%LIMB %ONAN] [%ZPMC [%KTTR [%BSMC %LIMB %ABEL]] P.GEN] ~]
    ::
        {$ZPWT *}
      ?:  ?:  ?=(@ P.GEN)
            (LTE HOON-VERSION P.GEN)
          &((LTE HOON-VERSION P.P.GEN) (GTE HOON-VERSION Q.P.GEN))
        Q.GEN
      ~_(LEAF+"HOON-VERSION" !!)
    ::
        *           GEN
    ==
  ::
  ++  RAKE  ~>(%MEAN.[%LEAF "RAKE-HOON"] (NEED REEK))
  ++  REEK
    ^-  (UNIT WING)
    ?+  GEN  ~
      {~ *}        `[[%& P.GEN] ~]
      {$LIMB *}     `[P.GEN ~]
      {$WING *}     `P.GEN
      {$CNTS * ~}  `P.GEN
      {$DBUG *}     REEK(GEN Q.GEN)
    ==
  ++  RUSK
    ^-  TERM
    =+  WIG=RAKE
    ?.  ?=({@ ~} WIG)
      ~>(%MEAN.[%LEAF "RUSK-HOON"] !!)
    I.WIG
  --
::
::::  5C: COMPILER BACKEND AND PRETTYPRINTER
  ::
++  UT
  ~%    %UT
      +>+
    ==
      %AR     AR
      %FAN    FAN
      %RIB    RIB
      %VET    VET
      %FAB    FAB
      %BLOW   BLOW
      %BURP   BURP
      %BUSK   BUSK
      %BUSS   BUSS
      %CROP   CROP
      %DUCK   DUCK
      %DUNE   DUNE
      %DUNK   DUNK
      %EPLA   EPLA
      %EMIN   EMIN
      %EMUL   EMUL
      %FEEL   FEEL
      %FELT   FELT
      %FINE   FINE
      %FIRE   FIRE
      %FISH   FISH
      %FOND   FOND
      %FUND   FUND
      %FUNK   FUNK
      %FUSE   FUSE
      %GAIN   GAIN
      %LOSE   LOSE
      %MILE   MILE
      %MINE   MINE
      %MINT   MINT
      %MOOT   MOOT
      %MULL   MULL
      %NEST   NEST
      %PEEL   PEEL
      %PLAY   PLAY
      %PEEK   PEEK
      %REPO   REPO
      %REST   REST
      %TACK   TACK
      %TOSS   TOSS
      %WRAP   WRAP
    ==
  =+  :*  FAN=*(SET {TYPE HOON})
          RIB=*(SET {TYPE TYPE HOON})
          VET=`?`&
          FAB=`?`&
      ==
  =+  SUT=`TYPE`%NOUN
  |%
  ++  CLIP
    |=  REF/TYPE
    ?>  ?|(!VET (NEST(SUT REF) & SUT))
    REF
  ::
  ::  +AR: TEXTURE ENGINE
  ::
  ++  AR  !:
    ~%    %AR
        +>
      ==
        %FISH  FISH
        %GAIN  GAIN
        %LOSE  LOSE
      ==
    |_  [REF=TYPE =SKIN]
    ::
    ::  =FISH: MAKE A $NOCK THAT TESTS A .REF AT .AXIS FOR .SKIN
    ::
    ++  FISH
      |=  =AXIS
      ^-  NOCK
      ?@  SKIN  [%1 &]
      ?-    -.SKIN
      ::
          %BASE
        ?-  BASE.SKIN
          %CELL      $(SKIN [%CELL [%BASE %NOUN] [%BASE %NOUN]])
          %FLAG      ?:  (~(NEST UT BOOL) | REF)
                       [%1 &]
                     %+  FLAN
                       $(SKIN [%BASE %ATOM %$])
                     %+  FLOR
                       [%5 [%0 AXIS] [%1 &]]
                     [%5 [%0 AXIS] [%1 |]]
          %NOUN      [%1 &]
          %NULL      $(SKIN [%LEAF %N ~])
          %VOID      [%1 |]
          [%ATOM *]  ?:  (~(NEST UT [%ATOM %$ ~]) | REF)
                       [%1 &]
                     ?:  (~(NEST UT [%CELL %NOUN %NOUN]) | REF)
                       [%1 |]
                     (FLIP [%3 %0 AXIS])
        ==
      ::
          %CELL
        ?:  (~(NEST UT [%ATOM %$ ~]) | REF)  [%1 |]
        %+  FLAN
          ?:  (~(NEST UT [%CELL %NOUN %NOUN]) | REF)
            [%1 &]
          [%3 %0 AXIS]
        %+  FLAN
          $(REF (PEEK(SUT REF) %FREE 2), SKIN SKIN.SKIN)
        $(REF (PEEK(SUT REF) %FREE 3), SKIN ^SKIN.SKIN)
      ::
          %LEAF
        ?:  (~(NEST UT [%ATOM %$ `ATOM.SKIN]) | REF)
          [%1 &]
        [%5 [%1 ATOM.SKIN] [%0 AXIS]]
      ::
          %DBUG  $(SKIN SKIN.SKIN)
          %HELP  $(SKIN SKIN.SKIN)
          %NAME  $(SKIN SKIN.SKIN)
          %OVER  $(SKIN SKIN.SKIN)
          %SPEC  $(SKIN SKIN.SKIN)
          %WASH  [%1 1]
      ==
    ::
    ::  -GAIN: MAKE A $TYPE BY RESTRICTING .REF TO .SKIN
    ::
    ++  GAIN
      |-  ^-  TYPE
      ?@  SKIN  [%FACE SKIN REF]
      ?-    -.SKIN
      ::
          %BASE
        ?-    BASE.SKIN
            %CELL      $(SKIN [%CELL [%BASE %NOUN] [%BASE %NOUN]])
            %FLAG      (FORK $(SKIN [%LEAF %F &]) $(SKIN [%LEAF %F |]) ~)
            %NULL      $(SKIN [%LEAF %N ~])
            %VOID      %VOID
            %NOUN      ?:((~(NEST UT %VOID) | REF) %VOID REF)
            [%ATOM *]
          =|  GIL=(SET TYPE)
          |-  ^-  TYPE
          ?-    REF
            %VOID      %VOID
            %NOUN      [%ATOM P.BASE.SKIN ~]
            [%ATOM *]  ?.  (FITZ P.BASE.SKIN P.REF)
                          ~>(%MEAN.[%LEAF "ATOM-MISMATCH"] !!)
                       :+  %ATOM
                         (MAX P.BASE.SKIN P.REF)
                       Q.REF
            [%CELL *]  %VOID
            [%CORE *]  %VOID
            [%FACE *]  (FACE P.REF $(REF Q.REF))
            [%FORK *]  (FORK (TURN ~(TAP IN P.REF) |=(=TYPE ^$(REF TYPE))))
            [%HINT *]  (HINT P.REF $(REF Q.REF))
            [%HOLD *]  ?:  (~(HAS IN GIL) REF)  %VOID
                       $(GIL (~(PUT IN GIL) REF), REF REPO(SUT REF))
          ==
        ==
      ::
          %CELL
        =|  GIL=(SET TYPE)
        |-  ^-  TYPE
        ?-    REF
            %VOID      %VOID
            %NOUN      [%CELL %NOUN %NOUN]
            [%ATOM *]  %VOID
            [%CELL *]  =+  ^$(SKIN SKIN.SKIN, REF P.REF)
                       ?:  =(%VOID -)  %VOID
                       (CELL - ^$(SKIN ^SKIN.SKIN, REF Q.REF))
            [%CORE *]  =+  ^$(SKIN SKIN.SKIN, REF P.REF)
                       ?:  =(%VOID -)  %VOID
                       ?.  =(%NOUN ^SKIN.SKIN)
                         (CELL - ^$(SKIN ^SKIN.SKIN, REF %NOUN))
                       [%CORE - Q.REF]
            [%FACE *]  (FACE P.REF $(REF Q.REF))
            [%FORK *]  (FORK (TURN ~(TAP IN P.REF) |=(=TYPE ^$(REF TYPE))))
            [%HINT *]  (HINT P.REF $(REF Q.REF))
            [%HOLD *]  ?:  (~(HAS IN GIL) REF)  %VOID
                       $(GIL (~(PUT IN GIL) REF), REF REPO(SUT REF))
        ==
      ::
          %LEAF
        =|  GIL=(SET TYPE)
        |-  ^-  TYPE
        ?-  REF
          %VOID      %VOID
          %NOUN      [%ATOM AURA.SKIN `ATOM.SKIN]
          [%ATOM *]  ?:  &(?=(^ Q.REF) !=(ATOM.SKIN U.Q.REF))
                       %VOID
                     ?.  (FITZ AURA.SKIN P.REF)
                        ~>(%MEAN.[%LEAF "ATOM-MISMATCH"] !!)
                     :+  %ATOM
                       (MAX AURA.SKIN P.REF)
                     `ATOM.SKIN
          [%CELL *]  %VOID
          [%CORE *]  %VOID
          [%FACE *]  (FACE P.REF $(REF Q.REF))
          [%FORK *]  (FORK (TURN ~(TAP IN P.REF) |=(=TYPE ^$(REF TYPE))))
          [%HINT *]  (HINT P.REF $(REF Q.REF))
          [%HOLD *]  ?:  (~(HAS IN GIL) REF)  %VOID
                     $(GIL (~(PUT IN GIL) REF), REF REPO(SUT REF))
        ==
      ::
          %DBUG  $(SKIN SKIN.SKIN)
          %HELP  (HINT [SUT %HELP HELP.SKIN] $(SKIN SKIN.SKIN))
          %NAME  (FACE TERM.SKIN $(SKIN SKIN.SKIN))
          %OVER  $(SKIN SKIN.SKIN, SUT (~(PLAY UT SUT) %WING WING.SKIN))
          %SPEC  =/  YON  $(SKIN SKIN.SKIN)
                 =/  HIT  (~(PLAY UT SUT) ~(EXAMPLE AX FAB SPEC.SKIN))
                 ?>  (~(NEST UT HIT) & YON)
                 HIT
          %WASH  =-  $(REF (~(PLAY UT REF) -))
                 :-  %WING
                 |-  ^-  WING
                 ?:  =(0 DEPTH.SKIN)  ~
                 [[%| 0 ~] $(DEPTH.SKIN (DEC DEPTH.SKIN))]
      ==
    ::
    ::  -LOSE: MAKE A $TYPE BY RESTRICTING .REF TO EXCLUDE .SKIN
    ::
    ++  LOSE
      |-  ^-  TYPE
      ?@  SKIN  [%FACE SKIN REF]
      ?-    -.SKIN
      ::
          %BASE
        ?-    BASE.SKIN
            %CELL      $(SKIN [%CELL [%BASE %NOUN] [%BASE %NOUN]])
            %FLAG      $(SKIN [%BASE %ATOM %F])
            %NULL      $(SKIN [%LEAF %N ~])
            %VOID      REF
            %NOUN      %VOID
            [%ATOM *]
          =|  GIL=(SET TYPE)
          |-  ^-  TYPE
          ?-    REF
            %VOID      %VOID
            %NOUN      [%CELL %NOUN %NOUN]
            [%ATOM *]  %VOID
            [%CELL *]  REF
            [%CORE *]  REF
            [%FACE *]  (FACE P.REF $(REF Q.REF))
            [%FORK *]  (FORK (TURN ~(TAP IN P.REF) |=(=TYPE ^$(REF TYPE))))
            [%HINT *]  (HINT P.REF $(REF Q.REF))
            [%HOLD *]  ?:  (~(HAS IN GIL) REF)  %VOID
                       $(GIL (~(PUT IN GIL) REF), REF REPO(SUT REF))
          ==
        ==
      ::
          %CELL
        =|  GIL=(SET TYPE)
        |-  ^-  TYPE
        ?-    REF
            %VOID      %VOID
            %NOUN      [%ATOM %$ ~]
            [%ATOM *]  REF
            [%CELL *]  =+  ^$(SKIN SKIN.SKIN, REF P.REF)
                       ?:  =(%VOID -)  %VOID
                       (CELL - ^$(SKIN ^SKIN.SKIN, REF Q.REF))
            [%CORE *]  =+  ^$(SKIN SKIN.SKIN, REF P.REF)
                       ?:  =(%VOID -)  %VOID
                       ?.  =(%NOUN ^SKIN.SKIN)
                         (CELL - ^$(SKIN ^SKIN.SKIN, REF %NOUN))
                       [%CORE - Q.REF]
            [%FACE *]  (FACE P.REF $(REF Q.REF))
            [%FORK *]  (FORK (TURN ~(TAP IN P.REF) |=(=TYPE ^$(REF TYPE))))
            [%HINT *]  (HINT P.REF $(REF Q.REF))
            [%HOLD *]  ?:  (~(HAS IN GIL) REF)  %VOID
                       $(GIL (~(PUT IN GIL) REF), REF REPO(SUT REF))
        ==
      ::
          %LEAF
        =|  GIL=(SET TYPE)
        |-  ^-  TYPE
        ?-  REF
          %VOID      %VOID
          %NOUN      %NOUN
          [%ATOM *]  ?:  =(Q.REF `ATOM.SKIN)
                       %VOID
                     REF
          [%CELL *]  REF
          [%CORE *]  REF
          [%FACE *]  (FACE P.REF $(REF Q.REF))
          [%FORK *]  (FORK (TURN ~(TAP IN P.REF) |=(=TYPE ^$(REF TYPE))))
          [%HINT *]  (HINT P.REF $(REF Q.REF))
          [%HOLD *]  ?:  (~(HAS IN GIL) REF)  %VOID
                     $(GIL (~(PUT IN GIL) REF), REF REPO(SUT REF))
        ==
      ::
          %DBUG  $(SKIN SKIN.SKIN)
          %HELP  $(SKIN SKIN.SKIN)
          %NAME  $(SKIN SKIN.SKIN)
          %OVER  $(SKIN SKIN.SKIN)
          %SPEC  $(SKIN SKIN.SKIN)
          %WASH  REF
      ==
    --
  ::
  ++  BLEU
    |=  {GOL/TYPE GEN/HOON}
    ^-  {TYPE NOCK}
    =+  PRO=(MINT GOL GEN)
    =+  JON=(APEX:MUSK BRAN Q.PRO)
    ?:  |(?=(~ JON) ?=($WAIT -.U.JON))
      ?:  &(!FAB VET)
        ~&  %BLEU-FAIL
        !!
      [P.PRO Q.PRO]
    [P.PRO %1 P.U.JON]
  ::
  ++  BLOW
    |=  {GOL/TYPE GEN/HOON}
    ^-  {TYPE NOCK}
    =+  PRO=(MINT GOL GEN)
    =+  JON=(APEX:MUSK BRAN Q.PRO)
    ?:  |(?=(~ JON) ?=($WAIT -.U.JON))
      [P.PRO Q.PRO]
    [P.PRO %1 P.U.JON]
  ::
  ++  BRAN
    ~+
    =+  GIL=*(SET TYPE)
    |-  ~+  ^-  SEMINOUN:MUSK
    ?-    SUT
      $NOUN      [FULL/[~ ~ ~] ~]
      $VOID      [FULL/[~ ~ ~] ~]
      {$ATOM *}  ?~(Q.SUT [FULL/[~ ~ ~] ~] [FULL/~ U.Q.SUT])
      {$CELL *}  (COMBINE:MUSK $(SUT P.SUT) $(SUT Q.SUT))
      {$CORE *}  %+  COMBINE:MUSK
                   P.R.Q.SUT
                 $(SUT P.SUT)
      {$FACE *}  $(SUT REPO)
      {$FORK *}  [FULL/[~ ~ ~] ~]
      {$HINT *}  $(SUT REPO)
      {$HOLD *}  ?:  (~(HAS IN GIL) SUT)
                   [FULL/[~ ~ ~] ~]
                 $(SUT REPO, GIL (~(PUT IN GIL) SUT))
    ==
  ::
  ++  BURP
    ::  EXPEL UNDIGESTED SEMINOUNS
    ::
    ^-  TYPE
    ~+
    ~=  SUT
    ?+  SUT      SUT
      [%CELL *]  [%CELL BURP(SUT P.SUT) BURP(SUT Q.SUT)]
      [%CORE *]  :+  %CORE
                   BURP(SUT P.SUT)
                 :*  P.Q.SUT
                     BURP(SUT Q.Q.SUT)
                     :_  Q.R.Q.SUT
                     ?:  ?=([[%FULL ~] *] P.R.Q.SUT)
                       P.R.Q.SUT
                     [[%FULL ~ ~ ~] ~]
                  ==
      [%FACE *]  [%FACE P.SUT BURP(SUT Q.SUT)]
      [%FORK *]  [%FORK (~(RUN IN P.SUT) |=(TYPE BURP(SUT +<)))]
      [%HINT *]  (HINT P.SUT BURP(SUT Q.SUT))
      [%HOLD *]  [%HOLD BURP(SUT P.SUT) Q.SUT]
    ==
  ::
  ++  BUSK
    ~/  %BUSK
    |=  GEN/HOON
    ^-  TYPE
    [%FACE [~ [GEN ~]] SUT]
  ::
  ++  BUSS
    ~/  %BUSS
    |=  {COG/TERM GEN/HOON}
    ^-  TYPE
    [%FACE [[[COG ~ GEN] ~ ~] ~] SUT]
  ::
  ++  CROP
    ~/  %CROP
    |=  REF/TYPE
    =+  BIX=*(SET {TYPE TYPE})
    =<  DEXT
    |%
    ++  DEXT
      ^-  TYPE
      ~_  LEAF+"CROP"
      ::  ~_  (DUNK 'DEXT: SUT')
      ::  ~_  (DUNK(SUT REF) 'DEXT: REF')
      ?:  |(=(SUT REF) =(%NOUN REF))
        %VOID
      ?:  =(%VOID REF)
        SUT
      ?-    SUT
          {$ATOM *}
        ?+  REF      SINT
          {$ATOM *}  ?^  Q.SUT
                       ?^(Q.REF ?:(=(Q.REF Q.SUT) %VOID SUT) %VOID)
                     ?^(Q.REF SUT %VOID)
          {$CELL *}  SUT
        ==
      ::
          {$CELL *}
        ?+  REF      SINT
          {$ATOM *}  SUT
          {$CELL *}  ?.  (NEST(SUT P.REF) | P.SUT)  SUT
                     (CELL P.SUT DEXT(SUT Q.SUT, REF Q.REF))
        ==
      ::
          {$CORE *}  ?:(?=(?({$ATOM *} {$CELL *}) REF) SUT SINT)
          {$FACE *}  (FACE P.SUT DEXT(SUT Q.SUT))
          {$FORK *}  (FORK (TURN ~(TAP IN P.SUT) |=(TYPE DEXT(SUT +<))))
          {$HINT *}  (HINT P.SUT DEXT(SUT Q.SUT))
          {$HOLD *}  ?<  (~(HAS IN BIX) [SUT REF])
                     DEXT(SUT REPO, BIX (~(PUT IN BIX) [SUT REF]))
          $NOUN      DEXT(SUT REPO)
          $VOID      %VOID
      ==
    ::
    ++  SINT
      ^-  TYPE
      ?+    REF    !!
        {$CORE *}  SUT
        {$FACE *}  DEXT(REF REPO(SUT REF))
        {$FORK *}  =+  YED=~(TAP IN P.REF)
                   |-  ^-  TYPE
                   ?~  YED  SUT
                   $(YED T.YED, SUT DEXT(REF I.YED))
        {$HINT *}  DEXT(REF REPO(SUT REF))
        {$HOLD *}  DEXT(REF REPO(SUT REF))
      ==
    --
  ::
  ++  COOL
    |=  {POL/? HYP/WING REF/TYPE}
    ^-  TYPE
    =+  FID=(FIND %BOTH HYP)
    ?-  -.FID
      %|  SUT
      %&  =<  Q
          %+  TAKE  P.P.FID
          |=(A/TYPE ?:(POL (FUSE(SUT A) REF) (CROP(SUT A) REF)))
    ==
  ::
  ++  DUCK  ^-(TANK ~(DUCK US SUT))
  ++  DUNE  |.(DUCK)
  ++  DUNK
    |=  PAZ/TERM  ^-  TANK
    :+  %PALM
      [['.' ~] ['-' ~] ~ ~]
    [[%LEAF (MESC (TRIP PAZ))] DUCK ~]
  ::
  ++  ELBO
    |=  {LOP/PALO RIG/(LIST (PAIR WING HOON))}
    ^-  TYPE
    ?:  ?=(%& -.Q.LOP)
      |-  ^-  TYPE
      ?~  RIG
        P.Q.LOP
      =+  ZIL=(PLAY Q.I.RIG)
      =+  DAR=(TACK(SUT P.Q.LOP) P.I.RIG ZIL)
      %=  $
        RIG      T.RIG
        P.Q.LOP  Q.DAR
      ==
    =+  HAG=~(TAP IN Q.Q.LOP)
    %-  FIRE
    |-  ^+  HAG
    ?~  RIG
      HAG
    =+  ZIL=(PLAY Q.I.RIG)
    =+  DIX=(TOSS P.I.RIG ZIL HAG)
    %=  $
      RIG  T.RIG
      HAG  Q.DIX
    ==
  ::
  ++  ERGO
    |=  {LOP/PALO RIG/(LIST (PAIR WING HOON))}
    ^-  (PAIR TYPE NOCK)
    =+  AXE=(TEND P.LOP)
    =|  HEJ/(LIST (PAIR AXIS NOCK))
    ?:  ?=(%& -.Q.LOP)
      =-  [P.- (HIKE AXE Q.-)]
      |-  ^-  (PAIR TYPE (LIST (PAIR AXIS NOCK)))
      ?~  RIG
        [P.Q.LOP HEJ]
      =+  ZIL=(MINT %NOUN Q.I.RIG)
      =+  DAR=(TACK(SUT P.Q.LOP) P.I.RIG P.ZIL)
      %=  $
        RIG      T.RIG
        P.Q.LOP  Q.DAR
        HEJ      [[P.DAR Q.ZIL] HEJ]
      ==
    =+  HAG=~(TAP IN Q.Q.LOP)
    =-  [(FIRE P.-) [%9 P.Q.LOP (HIKE AXE Q.-)]]
    |-  ^-  (PAIR (LIST (PAIR TYPE FOOT)) (LIST (PAIR AXIS NOCK)))
    ?~  RIG
      [HAG HEJ]
    =+  ZIL=(MINT %NOUN Q.I.RIG)
    =+  DIX=(TOSS P.I.RIG P.ZIL HAG)
    %=  $
      RIG  T.RIG
      HAG  Q.DIX
      HEJ  [[P.DIX Q.ZIL] HEJ]
    ==
  ::
  ++  ENDO
    |=  {LOP/(PAIR PALO PALO) DOX/TYPE RIG/(LIST (PAIR WING HOON))}
    ^-  (PAIR TYPE TYPE)
    ?:  ?=(%& -.Q.P.LOP)
      ?>  ?=(%& -.Q.Q.LOP)
      |-  ^-  (PAIR TYPE TYPE)
      ?~  RIG
        [P.Q.P.LOP P.Q.Q.LOP]
      =+  ZIL=(MULL %NOUN DOX Q.I.RIG)
      =+  ^=  DAR
          :-  P=(TACK(SUT P.Q.P.LOP) P.I.RIG P.ZIL)
              Q=(TACK(SUT P.Q.Q.LOP) P.I.RIG Q.ZIL)
      ?>  =(P.P.DAR P.Q.DAR)
      %=  $
        RIG        T.RIG
        P.Q.P.LOP  Q.P.DAR
        P.Q.Q.LOP  Q.Q.DAR
      ==
    ?>  ?=(%| -.Q.Q.LOP)
    ?>  =(P.Q.P.LOP P.Q.Q.LOP)
    =+  HAG=[P=~(TAP IN Q.Q.P.LOP) Q=~(TAP IN Q.Q.Q.LOP)]
    =-  [(FIRE P.-) (FIRE(VET |) Q.-)]
    |-  ^-  (PAIR (LIST (PAIR TYPE FOOT)) (LIST (PAIR TYPE FOOT)))
    ?~  RIG
      HAG
    =+  ZIL=(MULL %NOUN DOX Q.I.RIG)
    =+  ^=  DIX
        :-  P=(TOSS P.I.RIG P.ZIL P.HAG)
            Q=(TOSS P.I.RIG Q.ZIL Q.HAG)
    ?>  =(P.P.DIX P.Q.DIX)
    %=  $
      RIG  T.RIG
      HAG  [Q.P.DIX Q.Q.DIX]
    ==
  ::
  ++  AD
    |%
    ++  ARC
      |%
      ++  DEFT                                          ::  GENERIC
        |%
        ++  BATH  *                                     ::  LEG MATCH TYPE
        ++  CLAW  *                                     ::  ARM MATCH TYPE
        ++  FORM  |*({* *} P=+<-)                       ::  ATTACH BUILD STATE
        ++  SKIN  |*(P/* P)                             ::  REVEAL BUILD STATE
        ++  MEAT  |*(P/* P)                             ::  REMOVE BUILD STATE
        --
      ++  MAKE                                          ::  FOR MINT
        |%
        ++  BATH  TYPE                                  ::  LEG MATCH TYPE
        ++  CLAW  ONYX                                  ::  ARM
        ++  FORM  |*({* *} [P=+<- Q=+<+])               ::
        ++  SKIN  |*({P/* Q/*} Q)                       ::  UNWRAP BAGGAGE
        ++  MEAT  |*({P/* Q/*} P)                       ::  UNWRAP FILLING
        --
      --
    ++  DEF
      =+  DEFT:ARC
      |@  ++  $
      =>  +<
      |%
      ++  PORD  |*(* (FORM +< *NOCK))                   ::  WRAP MINT FORMULA
      ++  ROSH  |*(* (FORM +< *(LIST POCK)))            ::  WRAP MINT CHANGES
      ++  FLEG  _(PORD $:BATH)                          ::  LEGMATCH + CODE
      ++  FRAM  _(PORD $:CLAW)                          ::  ARMMATCH +
      ++  FOAT  _(ROSH $:BATH)                          ::  LEG WITH CHANGES
      ++  FULT  _(ROSH $:CLAW)                          ::  ARM WITH CHANGES
      --  --
    ::
    ++  LIB
      |%
      ++  DEFT
        =>  (DEF DEFT:ARC)
        |%
        ++  HALP  ^|(|:($:HOON $:FLEG))
        ++  VANT
          |%  ++  TREP  ^|(|:($:{BATH WING BATH} $:{AXIS BATH}))
              ++  TASP  ^|(|:($:{{AXIS BATH} FLEG FOAT} $:FOAT))
              ++  TYLE  ^|(|:($:FOAT $:FOAT))
          --
        ++  VUNT
          |%  ++  TREP  ^|(|:($:{CLAW WING BATH} $:{AXIS CLAW}))
              ++  TASP  ^|(|:($:{{AXIS CLAW} FLEG FULT} $:FULT))
              ++  TYLE  ^|(|:($:FULT $:FOAT))
        --  --
      ::
      ++  MAKE
        =>  (DEF MAKE:ARC)
        |%
        ++  HALP  |~  A/HOON
                  ^-  FLEG
                  (MINT %NOUN A)
        ++  VANT
          |%  ++  TREP  |:  $:{A/TYPE B/WING C/TYPE}
                        ^-  {AXIS TYPE}
                        (TACK(SUT A) B C)
              ++  TASP  |:  $:{A/(PAIR AXIS TYPE) B/FLEG C/FOAT}
                        ^-  FOAT
                        [Q.A [[P.A (SKIN B)] (SKIN C)]]
              ++  TYLE  |:($:FOAT +<)
          --
        ++  VUNT
          |%  ++  TREP  |:  $:{A/CLAW B/WING C/BATH}
                        ^-  (PAIR AXIS CLAW)
                        (TOSS B C A)
              ++  TASP  |:  $:{A/(PAIR AXIS CLAW) B/FLEG C/FULT}
                        ^-  FULT
                        [Q.A [[P.A (SKIN B)] (SKIN C)]]
              ++  TYLE  |:  $:FULT
                        ^-  FOAT
                        [(FIRE +<-) +<+]
      --  --  --
    ::
    ++  BIN
      =+  DEFT:LIB
      |@  ++  $
      =>  +<
      |%
      ++  RAME
        =>  VANT  |%
            ++  CLOM  BATH
            ++  CHOG  FLEG
            ++  CEUT  FOAT
        --
      ++  GELP
        =>  VUNT  |%
            ++  CLOM  CLAW
            ++  CHOG  FRAM
            ++  CEUT  FULT
        --
      ++  ECBO  (ECCO RAME)
      ++  ECLO  (ECCO GELP)
      ++  ECCO
        =+  RAME
        |@  ++  $
        =>  +<
        |:  $:{RUM/CLOM RIG/(LIST (PAIR WING HOON))}
        ^-  FOAT
        %-  TYLE
        |-  ^-  CEUT
        ?~  RIG  (ROSH RUM)
        =+  MOR=$(RIG T.RIG)
        =+  ZIL=(HALP Q.I.RIG)
        =+  DAR=(TREP (MEAT MOR) P.I.RIG (MEAT ZIL))
        (TASP DAR ZIL MOR)
      --  --  --  --
  ::
  ++  OC
    =+  INC=(BIN:AD)
    |@  ++  $
    =>  INC
    |%
    ++  ECHO
      |:  $:{RUM/BATH RIG/(LIST (PAIR WING HOON))}
      (ECBO RUM RIG)
    ::
    ++  ECMO
      |:  $:{HAG/CLAW RIG/(LIST (PAIR WING HOON))}
      (ECLO HAG RIG)
    --  --
  ::
  ++  ETCO
    |=  {LOP/PALO RIG/(LIST (PAIR WING HOON))}
    ^-  (PAIR TYPE NOCK)
    =+  CIN=(OC (BIN:AD MAKE:LIB:AD))
    =.  RIG  (FLOP RIG)         ::  XX THIS UNBREAKS, VOID ORDER IN DEVULC
    =+  AXE=(TEND P.LOP)
    ?:  ?=(%& -.Q.LOP)
      =-  [P.- (HIKE AXE Q.-)]
      (ECHO:CIN P.Q.LOP RIG)
    =-  [P.- [%9 P.Q.LOP (HIKE AXE Q.-)]]
    (ECMO:CIN ~(TAP IN Q.Q.LOP) RIG)
  ::
  ++  ET
    |_  {HYP/WING RIG/(LIST (PAIR WING HOON))}
    ::
    ++  PLAY
      ^-  TYPE
      =+  LUG=(FIND %READ HYP)
      ?:  ?=(%| -.LUG)  ~>(%MEAN.[%LEAF "HOON"] ?>(?=(~ RIG) P.P.LUG))
      (ELBO P.LUG RIG)
    ::
    ++  MINT
      |=  GOL/TYPE
      ^-  (PAIR TYPE NOCK)
      =+  LUG=(FIND %READ HYP)
      ?:  ?=(%| -.LUG)  ~>(%MEAN.[%LEAF "HOON"] ?>(?=(~ RIG) P.LUG))
      =-  ?>(?|(!VET (NEST(SUT GOL) & P.-)) -)
      (ETCO P.LUG RIG)
    ::
    ++  MULL
      |=  {GOL/TYPE DOX/TYPE}
      ^-  {TYPE TYPE}
      =+  LUG=[P=(FIND %READ HYP) Q=(FIND(SUT DOX) %READ HYP)]
      ?:  ?=(%| -.P.LUG)
        ?>   &(?=(%| -.Q.LUG) ?=(~ RIG))
        [P.P.P.LUG P.P.Q.LUG]
      ?>  ?=(%& -.Q.LUG)
      =-  ?>(?|(!VET (NEST(SUT GOL) & P.-)) -)
      (ENDO [P.P.LUG P.Q.LUG] DOX RIG)
    --
  ::
  ++  EPLA
    ~/  %EPLA
    |=  {HYP/WING RIG/(LIST (PAIR WING HOON))}
    ^-  TYPE
    ~(PLAY ET HYP RIG)
  ::
  ++  EMIN
    ~/  %EMIN
    |=  {GOL/TYPE HYP/WING RIG/(LIST (PAIR WING HOON))}
    ^-  (PAIR TYPE NOCK)
    (~(MINT ET HYP RIG) GOL)
  ::
  ++  EMUL
    ~/  %EMUL
    |=  {GOL/TYPE DOX/TYPE HYP/WING RIG/(LIST (PAIR WING HOON))}
    ^-  (PAIR TYPE TYPE)
    (~(MULL ET HYP RIG) GOL DOX)
  ::
  ++  FELT
    ~/  %FELT
    |=  LAP/OPAL
    ^-  TYPE
    ?-  -.LAP
      %&  P.LAP
      %|  %-  FORK
          %+  TURN  ~(TAP IN Q.LAP)
          |=  [A=TYPE *]
          ?>  ?=([%CORE *] A)
          [%CORE Q.Q.A Q.A]
    ==
  ::                                                    ::
  ++  FEEL                                              ::  DETECT EXISTENCE
    |=  ROT/(LIST WING)
    ^-  ?
    =.  ROT  (FLOP ROT)
    |-  ^-  ?
    ?~  ROT  &
    =/  YEP  (FOND %FREE I.ROT)
    ?~  YEP  |
    ?-    -.YEP
      %&  %=  $
            ROT  T.ROT
            SUT  P:(FINE %& P.YEP)
          ==
      %|  ?-  -.P.YEP
            %&  |
            %|  %=  $
                  ROT  T.ROT
                  SUT  P:(FINE %| P.P.YEP)
                ==
    ==    ==
  ::
  ++  FOND
    ~/  %FOND
    |=  {WAY/VIAL HYP/WING}
    =>  |%
        ++  PONY                                        ::  RAW MATCH
                  $@  ~                                 ::  VOID
                  %+  EACH                              ::  NATURAL/ABNORMAL
                    PALO                                ::  ARM OR LEG
                  %+  EACH                              ::  ABNORMAL
                    @UD                                 ::  UNMATCHED
                  (PAIR TYPE NOCK)                      ::  SYNTHETIC
        --
    ^-  PONY
    ?~  HYP
      [%& ~ %& SUT]
    =+  MOR=$(HYP T.HYP)
    ?-    -.MOR
        %|
      ?-    -.P.MOR
          %&  MOR
          %|
        =+  FEX=(MINT(SUT P.P.P.MOR) %NOUN [%WING I.HYP ~])
        [%| %| P.FEX (COMB Q.P.P.MOR Q.FEX)]
      ==
    ::
        %&
      =.  SUT  (FELT Q.P.MOR)
      =>  :_  +
          :*  AXE=`AXIS`1
              LON=P.P.MOR
              HEG=?^(I.HYP I.HYP [%| P=0 Q=(SOME I.HYP)])
          ==
      ?:  ?=(%& -.HEG)
        [%& [`P.HEG LON] %& (PEEK WAY P.HEG)]
      =|  GIL/(SET TYPE)
      =<  $
      |%  ++  HERE  ?:  =(0 P.HEG)
                      [%& [~ `AXE LON] %& SUT]
                    [%| %& (DEC P.HEG)]
          ++  LOSE  [%| %& P.HEG]
          ++  STOP  ?~(Q.HEG HERE LOSE)
          ++  TWIN  |=  {HAX/PONY YOR/PONY}
                    ^-  PONY
                    ~_  LEAF+"FIND-FORK"
                    ?:  =(HAX YOR)  HAX
                    ?~  HAX  YOR
                    ?~  YOR  HAX
                    ?:  ?=(%| -.HAX)
                      ?>  ?&  ?=(%| -.YOR)
                              ?=(%| -.P.HAX)
                              ?=(%| -.P.YOR)
                              =(Q.P.P.HAX Q.P.P.YOR)
                          ==
                      :+  %|
                        %|
                      [(FORK P.P.P.HAX P.P.P.YOR ~) Q.P.P.HAX]
                    ?>  ?=(%& -.YOR)
                    ?>  =(P.P.HAX P.P.YOR)
                    ?:  &(?=(%& -.Q.P.HAX) ?=(%& -.Q.P.YOR))
                      :+  %&  P.P.HAX
                      [%& (FORK P.Q.P.HAX P.Q.P.YOR ~)]
                    ?>  &(?=(%| -.Q.P.HAX) ?=(%| -.Q.P.YOR))
                    ?>  =(P.Q.P.HAX P.Q.P.YOR)
                    =+  WAL=(~(UNI IN Q.Q.P.HAX) Q.Q.P.YOR)
                    :+  %&  P.P.HAX
                    [%| P.Q.P.HAX WAL]
          ++  $
            ^-  PONY
            ?-    SUT
                $VOID       ~
                $NOUN       STOP
                {$ATOM *}   STOP
                {$CELL *}
              ?~  Q.HEG  HERE
              =+  TAF=$(AXE (PEG AXE 2), SUT P.SUT)
              ?~  TAF  ~
              ?:  |(?=(%& -.TAF) ?=(%| -.P.TAF))
                TAF
              $(AXE (PEG AXE 3), P.HEG P.P.TAF, SUT Q.SUT)
            ::
                {$CORE *}
              ?~  Q.HEG  HERE
              =^  ZEM  P.HEG
                  =+  ZEM=(LOOT U.Q.HEG Q.R.Q.SUT)
                  ?~  ZEM  [~ P.HEG]
                  ?:(=(0 P.HEG) [ZEM 0] [~ (DEC P.HEG)])
              ?^  ZEM
                :+  %&
                  [`AXE LON]
                =/  ZUT  ^-  FOOT
                         ?-  Q.P.Q.SUT
                           %WET  [%WET Q.U.ZEM]
                           %DRY  [%DRY Q.U.ZEM]
                         ==
                [%| (PEG 2 P.U.ZEM) [[SUT ZUT] ~ ~]]
              =+  PEC=(PEEL WAY R.P.Q.SUT)
              ?.  SAM.PEC  LOSE
              ?:  CON.PEC  $(SUT P.SUT, AXE (PEG AXE 3))
              $(SUT (PEEK(SUT P.SUT) WAY 2), AXE (PEG AXE 6))
            ::
                {$HINT *}
              $(SUT REPO)
            ::
                {$FACE *}
              ?:  ?=(~ Q.HEG)  HERE(SUT Q.SUT)
              =*  ZOT  P.SUT
              ?@  ZOT
                ?:(=(U.Q.HEG ZOT) HERE(SUT Q.SUT) LOSE)
              =<  MAIN
              |%
              ++  MAIN
                ^-  PONY
                =+  TYR=(~(GET BY P.ZOT) U.Q.HEG)
                ?~  TYR
                  NEXT
                ?~  U.TYR
                  $(SUT Q.SUT, LON [~ LON], P.HEG +(P.HEG))
                =+  TOR=(FUND WAY U.U.TYR)
                ?-  -.TOR
                  %&  [%& (WELD P.P.TOR `VEIN`[~ `AXE LON]) Q.P.TOR]
                  %|  [%| %| P.P.TOR (COMB [%0 AXE] Q.P.TOR)]
                ==
              ++  NEXT
                |-  ^-  PONY
                ?~  Q.ZOT
                  ^$(SUT Q.SUT, LON [~ LON])
                =+  TIV=(MINT(SUT Q.SUT) %NOUN I.Q.ZOT)
                =+  FID=^$(SUT P.TIV, LON ~, AXE 1, GIL ~)
                ?~  FID  ~
                ?:  ?=({%| %& *} FID)
                  $(Q.ZOT T.Q.ZOT, P.HEG P.P.FID)
                =+  ^-  VAT/(PAIR TYPE NOCK)
                    ?-    -.FID
                      %&  (FINE %& P.FID)
                      %|  (FINE %| P.P.FID)
                    ==
                [%| %| P.VAT (COMB (COMB [%0 AXE] Q.TIV) Q.VAT)]
              --
            ::
                {$FORK *}
              =+  WIZ=(TURN ~(TAP IN P.SUT) |=(A/TYPE ^$(SUT A)))
              ?~  WIZ  ~
              |-  ^-  PONY
              ?~  T.WIZ  I.WIZ
              (TWIN I.WIZ $(WIZ T.WIZ))
            ::
                {$HOLD *}
              ?:  (~(HAS IN GIL) SUT)
                ~
              $(GIL (~(PUT IN GIL) SUT), SUT REPO)
            ==
      --
    ==
  ::
  ++  FIND
    ~/  %FIND
    |=  {WAY/VIAL HYP/WING}
    ^-  PORT
    ~_  (SHOW [%C %FIND] %L HYP)
    =-  ?@  -  !!
        ?-    -<
          %&  [%& P.-]
          %|  ?-  -.P.-
                %|  [%| P.P.-]
                %&  !!
        ==    ==
    (FOND WAY HYP)
  ::
  ++  FUND
    ~/  %FUND
    |=  {WAY/VIAL GEN/HOON}
    ^-  PORT
    =+  HUP=~(REEK AP GEN)
    ?~  HUP
      [%| (MINT %NOUN GEN)]
    (FIND WAY U.HUP)
  ::
  ++  FINE
    ~/  %FINE
    |=  TOR/PORT
    ^-  (PAIR TYPE NOCK)
    ?-  -.TOR
      %|  P.TOR
      %&  =+  AXE=(TEND P.P.TOR)
          ?-  -.Q.P.TOR
            %&  [`TYPE`P.Q.P.TOR %0 AXE]
            %|  [(FIRE ~(TAP IN Q.Q.P.TOR)) [%9 P.Q.P.TOR %0 AXE]]
    ==    ==
  ::
  ++  FIRE
    |=  HAG/(LIST {P/TYPE Q/FOOT})
    ^-  TYPE
    ?:  ?=({{* {$WET ~ $1}} ~} HAG)
      P.I.HAG
    %-  FORK
    %+  TURN
      HAG.$
    |=  {P/TYPE Q/FOOT}
    :-  %HOLD
    ?.  ?=({$CORE *} P)
      ~_  (DUNK %FIRE-TYPE)
      ~>(%MEAN.[%LEAF "FIRE-CORE"] !!)
    =+  DOX=[%CORE Q.Q.P Q.P(R.P %GOLD)]
    ?:  ?=($DRY -.Q)
      ::  ~_  (DUNK(SUT [%CELL Q.Q.P P.P]) %FIRE-DRY)
      ?>  ?|(!VET (NEST(SUT Q.Q.P) & P.P))
      [DOX P.Q]
    ?>  ?=($WET -.Q)
    ::  ~_  (DUNK(SUT [%CELL Q.Q.P P.P]) %FIRE-WET)
    ::  =.  P.P  ?:(FAB P.P (REDO(SUT P.P) Q.Q.P))
    =.  P.P  (REDO(SUT P.P) Q.Q.P)
    ?>  ?|  !VET
            (~(HAS IN RIB) [SUT DOX P.Q])
            !=(** (MULL(SUT P, RIB (~(PUT IN RIB) SUT DOX P.Q)) %NOUN DOX P.Q))
        ==
    [P P.Q]
  ::
  ++  FISH
    ~/  %FISH
    |=  AXE/AXIS
    =+  VOT=*(SET TYPE)
    |-  ^-  NOCK
    ?-  SUT
        $VOID       [%1 1]
        $NOUN       [%1 0]
        {$ATOM *}   ?~  Q.SUT
                      (FLIP [%3 %0 AXE])
                    [%5 [%1 U.Q.SUT] [%0 AXE]]
        {$CELL *}
      %+  FLAN
        [%3 %0 AXE]
      (FLAN $(SUT P.SUT, AXE (PEG AXE 2)) $(SUT Q.SUT, AXE (PEG AXE 3)))
    ::
        {$CORE *}   ~>(%MEAN.[%LEAF "FISH-CORE"] !!)
        {$FACE *}   $(SUT Q.SUT)
        {$FORK *}   =+  YED=~(TAP IN P.SUT)
                    |-  ^-  NOCK
                    ?~(YED [%1 1] (FLOR ^$(SUT I.YED) $(YED T.YED)))
        {$HINT *}   $(SUT Q.SUT)
        {$HOLD *}
      ?:  (~(HAS IN VOT) SUT)
        ~>(%MEAN.[%LEAF "FISH-LOOP"] !!)
      =>  %=(. VOT (~(PUT IN VOT) SUT))
      $(SUT REPO)
    ==
  ::
  ++  FUSE
    ~/  %FUSE
    |=  REF/TYPE
    =+  BIX=*(SET {TYPE TYPE})
    |-  ^-  TYPE
    ?:  ?|(=(SUT REF) =(%NOUN REF))
      SUT
    ?-    SUT
        {$ATOM *}
      ?-    REF
          {$ATOM *}   =+  FOC=?:((FITZ P.REF P.SUT) P.SUT P.REF)
                      ?^  Q.SUT
                        ?^  Q.REF
                          ?:  =(Q.SUT Q.REF)
                            [%ATOM FOC Q.SUT]
                          %VOID
                        [%ATOM FOC Q.SUT]
                      [%ATOM FOC Q.REF]
          {$CELL *}   %VOID
          *           $(SUT REF, REF SUT)
      ==
        {$CELL *}
      ?-  REF
        {$CELL *}   (CELL $(SUT P.SUT, REF P.REF) $(SUT Q.SUT, REF Q.REF))
        *           $(SUT REF, REF SUT)
      ==
    ::
        {$CORE *}  $(SUT REPO)
        {$FACE *}  (FACE P.SUT $(SUT Q.SUT))
        {$FORK *}  (FORK (TURN ~(TAP IN P.SUT) |=(TYPE ^$(SUT +<))))
        {$HINT *}  (HINT P.SUT $(SUT Q.SUT))
        {$HOLD *}
      ?:  (~(HAS IN BIX) [SUT REF])
        ~>(%MEAN.[%LEAF "FUSE-LOOP"] !!)
      $(SUT REPO, BIX (~(PUT IN BIX) [SUT REF]))
    ::
        $NOUN       REF
        $VOID       %VOID
    ==
  ::
  ++  GAIN
    ~/  %GAIN
    |=  GEN/HOON  ^-  TYPE
    (CHIP & GEN)
  ::
  ++  HEMP
    ::  GENERATE FORMULA FROM FOOT
    ::
    |=  [HUD/POLY GEN/HOON]
    ^-  NOCK
    ~+
    =+  %HEMP-141
    ?-  HUD
      $DRY  Q:(MINT %NOUN GEN)
      $WET  Q:(MINT(VET |) %NOUN GEN)
    ==
  ::
  ++  LAZE
    ::  PRODUCE LAZY CORE GENERATOR FOR STATIC EXECUTION
    ::
    |=  [NYM=(UNIT TERM) HUD=POLY DOM=(MAP TERM TOME)]
    ::  ONLY ONE LAYER OF FABRICATION ANALYSIS
    ::
    =.  FAB  &
    ~+
    ^-  SEMINOUN
    =+  %HEMP-141
    ::  TAL: MAP FROM BATTERY AXIS TO FOOT
    ::
    =;  TAL/(MAP @UD HOON)
      ::  PRODUCE LAZY BATTERY
      ::
      :_  ~
      :+  %LAZY  1
      |=  AXE/@UD
      ^-  (UNIT NOUN)
      %+  BIND  (~(GET BY TAL) AXE)
      |=  GEN/HOON
      %.  [HUD GEN]
      HEMP(SUT (CORE SUT [NYM HUD %GOLD] SUT [[%LAZY 1 ..^$] ~] DOM))
    ::
    %-  ~(GAS BY *(MAP @UD HOON))
    =|  YEB/(LIST (PAIR @UD HOON))
    =+  AXE=1
    |^  ?-  DOM
          ~        YEB
          [* ~ ~]  (CHAPTER Q.Q.N.DOM)
          [* * ~]  %=  $
                     DOM  L.DOM
                     AXE  (PEG AXE 3)
                     YEB  (CHAPTER(AXE (PEG AXE 2)) Q.Q.N.DOM)
                   ==
          [* ~ *]  %=  $
                     DOM  R.DOM
                     AXE  (PEG AXE 3)
                     YEB  (CHAPTER(AXE (PEG AXE 2)) Q.Q.N.DOM)
                   ==
          [* * *]  %=  $
                     DOM  R.DOM
                     AXE  (PEG AXE 7)
                     YEB  %=  $
                            DOM  L.DOM
                            AXE  (PEG AXE 6)
                            YEB  (CHAPTER(AXE (PEG AXE 2)) Q.Q.N.DOM)
        ==         ==     ==
    ++  CHAPTER
      |=  DAB/(MAP TERM HOON)
      ^+  YEB
      ?-  DAB
        ~        YEB
        [* ~ ~]  [[AXE Q.N.DAB] YEB]
        [* * ~]  %=  $
                   DAB  L.DAB
                   AXE  (PEG AXE 3)
                   YEB  [[(PEG AXE 2) Q.N.DAB] YEB]
                 ==
        [* ~ *]  %=  $
                   DAB  R.DAB
                   AXE  (PEG AXE 3)
                   YEB  [[(PEG AXE 2) Q.N.DAB] YEB]
                 ==
        [* * *]  %=  $
                   DAB  R.DAB
                   AXE  (PEG AXE 7)
                   YEB  %=  $
                          DAB  L.DAB
                          AXE  (PEG AXE 6)
                          YEB  [[(PEG AXE 2) Q.N.DAB] YEB]
      ==         ==     ==
    --
  ::
  ++  LOSE
    ~/  %LOSE
    |=  GEN/HOON  ^-  TYPE
    (CHIP | GEN)
  ::
  ++  CHIP
    ~/  %CHIP
    |=  {HOW/? GEN/HOON}  ^-  TYPE
    ?:  ?=({$WTTS *} GEN)
      (COOL HOW Q.GEN (PLAY ~(EXAMPLE AX FAB P.GEN)))
    ?:  ?=({$WTHX *} GEN)
      =+  (PLAY %WING Q.GEN)
      ~>  %SLOG.[0 [%LEAF "CHIPPING"]]
      ?:  HOW
        =-  ~>  %SLOG.[0 (DUNK(SUT +<) 'CHIP: GAIN: REF')]
            ~>  %SLOG.[0 (DUNK(SUT -) 'CHIP: GAIN: GAIN')]
            -
        ~(GAIN AR - P.GEN)
      ~(LOSE AR - P.GEN)
    ?:  ?&(HOW ?=({$WTPD *} GEN))
      |-(?~(P.GEN SUT $(P.GEN T.P.GEN, SUT ^$(GEN I.P.GEN))))
    ?:  ?&(!HOW ?=({$WTBR *} GEN))
      |-(?~(P.GEN SUT $(P.GEN T.P.GEN, SUT ^$(GEN I.P.GEN))))
    =+  NEG=~(OPEN AP GEN)
    ?:(=(NEG GEN) SUT $(GEN NEG))
  ::
  ++  BAKE
    |=  [DOX/TYPE HUD/POLY DAB/(MAP TERM HOON)]
    ^-  *
    ?:  ?=(~ DAB)
      ~
    =+  ^=  DOV
        ::  THIS SEEMS WRONG BUT IT'S ACTUALLY RIGHT
        ::
        ?-  HUD
          $DRY  (MULL %NOUN DOX Q.N.DAB)
          $WET  ~
        ==
    ?-  DAB
      {* ~ ~}  DOV
      {* ~ *}  [DOV $(DAB R.DAB)]
      {* * ~}  [DOV $(DAB L.DAB)]
      {* * *}  [DOV $(DAB L.DAB) $(DAB R.DAB)]
    ==
  ::
  ++  BALK
    |=  [DOX/TYPE HUD/POLY DOM/(MAP TERM TOME)]
    ^-  *
    ?:  ?=(~ DOM)
      ~
    =+  DOV=(BAKE DOX HUD Q.Q.N.DOM)
    ?-    DOM
      {* ~ ~}   DOV
      {* ~ *}   [DOV $(DOM R.DOM)]
      {* * ~}   [DOV $(DOM L.DOM)]
      {* * *}   [DOV $(DOM L.DOM) $(DOM R.DOM)]
    ==
  ::
  ++  MILE
    ::  MULL ALL CHAPTERS AND FEET IN A CORE
    ::
    |=  [DOX=TYPE MEL=VAIR NYM=(UNIT TERM) HUD=POLY DOM=(MAP TERM TOME)]
    ^-  (PAIR TYPE TYPE)
    =+  YET=(CORE SUT [NYM HUD %GOLD] SUT (LAZE NYM HUD DOM) DOM)
    =+  HUM=(CORE DOX [NYM HUD %GOLD] DOX (LAZE NYM HUD DOM) DOM)
    =+  (BALK(SUT YET) HUM HUD DOM)
    [YET HUM]
  ::
  ++  MINE
    ::  MINT ALL CHAPTERS AND FEET IN A CORE
    ::
    |=  [MEL/VAIR NYM/(UNIT TERM) HUD/POLY DOM/(MAP TERM TOME)]
    ^-  (PAIR TYPE NOCK)
    =-  :_  [%1 DEZ]
        (CORE SUT [NYM HUD MEL] SUT [[%FULL ~] DEZ] DOM)
    ^=  DEZ
    =.  SUT  (CORE SUT [NYM HUD %GOLD] SUT (LAZE NYM HUD DOM) DOM)
    |-  ^-  ?(~ ^)
    ?:  ?=(~ DOM)
      ~
    =/  DOV/?(~ ^)
      =/  DAB/(MAP TERM HOON)  Q.Q.N.DOM
      |-  ^-  ?(~ ^)
      ?:  ?=(~ DAB)
        ~
      =+  VAD=(HEMP HUD Q.N.DAB)
      ?-    DAB
        {* ~ ~}   VAD
        {* ~ *}   [VAD $(DAB R.DAB)]
        {* * ~}   [VAD $(DAB L.DAB)]
        {* * *}   [VAD $(DAB L.DAB) $(DAB R.DAB)]
      ==
    ?-    DOM
      {* ~ ~}   DOV
      {* ~ *}   [DOV $(DOM R.DOM)]
      {* * ~}   [DOV $(DOM L.DOM)]
      {* * *}   [DOV $(DOM L.DOM) $(DOM R.DOM)]
    ==
  ::
  ++  MINT
    ~/  %MINT
    |=  {GOL/TYPE GEN/HOON}
    ^-  {P/TYPE Q/NOCK}
    ~&  %PURE-MINT
    |^  ^-  {P/TYPE Q/NOCK}
    ?:  ?&(=(%VOID SUT) !?=({$DBUG *} GEN))
      ?.  |(!VET ?=({$LOST *} GEN) ?=({$ZPZP *} GEN))
        ~>(%MEAN.[%LEAF "MINT-VAIN"] !!)
      [%VOID %0 0]
    ?-    GEN
    ::
        {^ *}
      =+  HED=$(GEN P.GEN, GOL %NOUN)
      =+  TAL=$(GEN Q.GEN, GOL %NOUN)
      [(NICE (CELL P.HED P.TAL)) (CONS Q.HED Q.TAL)]
    ::
        {$KTCN *}  $(FAB |, GEN P.GEN)
        {$BRCN *}  (GROW %GOLD P.GEN %DRY [%$ 1] Q.GEN)
        {$BRVT *}  (GROW %GOLD P.GEN %WET [%$ 1] Q.GEN)
    ::
        {$CNTS *}  (~(MINT ET P.GEN Q.GEN) GOL)
    ::
        {$DTKT *}
      =+  NEF=$(GEN [%KTTR P.GEN])
      [P.NEF [%12 [%1 %151 P.NEF] Q:$(GEN Q.GEN, GOL %NOUN)]]
    ::
        {$DTLS *}  [(NICE [%ATOM %$ ~]) [%4 Q:$(GEN P.GEN, GOL [%ATOM %$ ~])]]
        {$SAND *}  [(NICE (PLAY GEN)) [%1 Q.GEN]]
        {$ROCK *}  [(NICE (PLAY GEN)) [%1 Q.GEN]]
    ::
        {$DTTR *}
      [(NICE %NOUN) [%2 Q:$(GEN P.GEN, GOL %NOUN) Q:$(GEN Q.GEN, GOL %NOUN)]]
    ::
        {$DTTS *}
      =+  [ONE TWO]=[$(GEN P.GEN, GOL %NOUN) $(GEN Q.GEN, GOL %NOUN)]
      [(NICE BOOL) [%5 Q:$(GEN P.GEN, GOL %NOUN) Q:$(GEN Q.GEN, GOL %NOUN)]]
    ::
        {$DTWT *}  [(NICE BOOL) [%3 Q:$(GEN P.GEN, GOL %NOUN)]]
        {$HAND *}  [P.GEN Q.GEN]
        {$KTBR *}  =+(VAT=$(GEN P.GEN) [(NICE (WRAP(SUT P.VAT) %IRON)) Q.VAT])
    ::
        {$KTLS *}
      =+(HIF=(NICE (PLAY P.GEN)) [HIF Q:$(GEN Q.GEN, GOL HIF)])
    ::
        {$KTPD *}  =+(VAT=$(GEN P.GEN) [(NICE (WRAP(SUT P.VAT) %ZINC)) Q.VAT])
        {$KTSG *}  (BLOW GOL P.GEN)
        {$TUNE *}  [(FACE P.GEN SUT) [%0 %1]]
        {$KTWT *}  =+(VAT=$(GEN P.GEN) [(NICE (WRAP(SUT P.VAT) %LEAD)) Q.VAT])
    ::
        {$NOTE *}
      =+  HUM=$(GEN Q.GEN)
      [(HINT [SUT P.GEN] P.HUM) Q.HUM]
    ::
        {$SGZP *}  ~_(DUCK(SUT (PLAY P.GEN)) $(GEN Q.GEN))
        {$SGBN *}
      =+  HUM=$(GEN Q.GEN)
      :: ?:  &(HUZ !?=(%|(@ [?(%SGCN %SGLS) ^]) P.GEN))
      ::  HUM
      :-  P.HUM
      :+  %11
        ?-    P.GEN
            @   P.GEN
            ^   [P.P.GEN Q:$(GEN Q.P.GEN, GOL %NOUN)]
        ==
      Q.HUM
    ::
        {$TSBN *}
      =+  FID=$(GEN P.GEN, GOL %NOUN)
      =+  DOV=$(SUT P.FID, GEN Q.GEN)
      [P.DOV (COMB Q.FID Q.DOV)]
    ::
        {$TSCM *}
      $(GEN Q.GEN, SUT (BUSK P.GEN))
    ::
        {$WTCL *}
      =+  NOR=$(GEN P.GEN, GOL BOOL)
      =+  FEX=(GAIN P.GEN)
      =+  WUX=(LOSE P.GEN)
      =+  ^=  DUY
          ?:  =(%VOID FEX)
            ?:(=(%VOID WUX) [%0 0] [%1 1])
          ?:(=(%VOID WUX) [%1 0] Q.NOR)
      =+  HIQ=$(SUT FEX, GEN Q.GEN)
      =+  RAN=$(SUT WUX, GEN R.GEN)
      [(FORK P.HIQ P.RAN ~) (COND DUY Q.HIQ Q.RAN)]
    ::
        {$WTHX *}
      :-  (NICE BOOL)
      =+  FID=(FIND %READ [[%& 1] Q.GEN])
      ~>  %MEAN.[%LEAF "MINT-FRAGMENT"]
      ?>  &(?=(%& -.FID) ?=(%& -.Q.P.FID))
      (~(FISH AR `TYPE`P.Q.P.FID `SKIN`P.GEN) (TEND P.P.FID))
    ::
        {$FITS *}
      :-  (NICE BOOL)
      =+  REF=(PLAY P.GEN)
      =+  FID=(FIND %READ Q.GEN)
      ~|  [%TEST Q.GEN]
      |-  ^-  NOCK
      ?-  -.FID
        %&  ?-  -.Q.P.FID
              %&  (FISH(SUT REF) (TEND P.P.FID))
              %|  $(FID [%| (FINE FID)])
            ==
        %|  [%7 Q.P.FID (FISH(SUT REF) 1)]
      ==
    ::
        {$DBUG *}
      ~_  (SHOW %O P.GEN)
      =+  HUM=$(GEN Q.GEN)
      [P.HUM [%11 [%SPOT %1 P.GEN] Q.HUM]]
    ::
        {$ZPCM *}   [(NICE (PLAY P.GEN)) [%1 Q.GEN]]    ::  XX VALIDATE!
        {$LOST *}
      ?:  VET
        ~_  (DUNK(SUT (PLAY P.GEN)) 'LOST')
        ~>(%MEAN.[%LEAF "MINT-LOST"] !!)
      [%VOID [%0 0]]
    ::
        {$ZPMC *}
      =+  VOS=$(GOL %NOUN, GEN Q.GEN)
      =+  REF=P:$(GOL %NOUN, GEN P.GEN)
      ?>  (~(NEST UT P:!>(*TYPE)) & REF)
      [(NICE (CELL REF P.VOS)) (CONS [%1 BURP(SUT P.VOS)] Q.VOS)]
    ::
        {$ZPTS *}   [(NICE %NOUN) [%1 Q:$(VET |, GEN P.GEN)]]
        {$ZPVT *}   ?:((FEEL P.GEN) $(GEN Q.GEN) $(GEN R.GEN))
    ::
        {$ZPZP ~}  [%VOID [%0 0]]
        *
      =+  DOZ=~(OPEN AP GEN)
      ?:  =(DOZ GEN)
        ~_  (SHOW [%C 'HOON'] [%Q GEN])
        ~>(%MEAN.[%LEAF "MINT-OPEN"] !!)
      $(GEN DOZ)
    ==
    ::
    ++  NICE
      |=  TYP/TYPE
      ~_  LEAF+"MINT-NICE"
      ?>  ?|(!VET (NEST(SUT GOL) & TYP))
      TYP
    ::
    ++  GROW
      |=  {MEL/VAIR NYM/(UNIT TERM) HUD/POLY RUF/HOON DOM/(MAP TERM TOME)}
      ^-  {P/TYPE Q/NOCK}
      =+  DAN=^$(GEN RUF, GOL %NOUN)
      =+  PUL=(MINE MEL NYM HUD DOM)
      [(NICE P.PUL) (CONS Q.PUL Q.DAN)]
    --
  ::
  ++  MOOT
    =+  GIL=*(SET TYPE)
    |-  ^-  ?
    ?-  SUT
      {$ATOM *}  |
      {$CELL *}  |($(SUT P.SUT) $(SUT Q.SUT))
      {$CORE *}  $(SUT P.SUT)
      {$FACE *}  $(SUT Q.SUT)
      {$FORK *}  (LEVY ~(TAP IN P.SUT) |=(TYPE ^$(SUT +<)))
      {$HINT *}  $(SUT Q.SUT)
      {$HOLD *}  |((~(HAS IN GIL) SUT) $(GIL (~(PUT IN GIL) SUT), SUT REPO))
      $NOUN      |
      $VOID      &
    ==
  ::
  ++  MULL
    ~/  %MULL
    |=  {GOL/TYPE DOX/TYPE GEN/HOON}
    |^  ^-  {P/TYPE Q/TYPE}
    ?:  =(%VOID SUT)
      ~>(%MEAN.[%LEAF "MULL-NONE"] !!)
    ?-    GEN
    ::
        {^ *}
      =+  HED=$(GEN P.GEN, GOL %NOUN)
      =+  TAL=$(GEN Q.GEN, GOL %NOUN)
      [(NICE (CELL P.HED P.TAL)) (CELL Q.HED Q.TAL)]
    ::
        {$KTCN *}  $(FAB |, GEN P.GEN)
        {$BRCN *}  (GROW %GOLD P.GEN %DRY [%$ 1] Q.GEN)
        {$BRVT *}  (GROW %GOLD P.GEN %WET [%$ 1] Q.GEN)
        {$CNTS *}  (~(MULL ET P.GEN Q.GEN) GOL DOX)
        {$DTKT *}  =+($(GEN Q.GEN, GOL %NOUN) $(GEN [%KTTR P.GEN]))
        {$DTLS *}  =+($(GEN P.GEN, GOL [%ATOM %$ ~]) (BETH [%ATOM %$ ~]))
        {$SAND *}  (BETH (PLAY GEN))
        {$ROCK *}  (BETH (PLAY GEN))
    ::
        {$DTTR *}
      =+([$(GEN P.GEN, GOL %NOUN) $(GEN Q.GEN, GOL %NOUN)] (BETH %NOUN))
    ::
        {$DTTS *}
      =+([$(GEN P.GEN, GOL %NOUN) $(GEN Q.GEN, GOL %NOUN)] (BETH BOOL))
    ::
        {$DTWT *}  =+($(GEN P.GEN, GOL %NOUN) (BETH BOOL)) ::  XX  =|
        {$HAND *}  [P.GEN P.GEN]
        {$KTBR *}
      =+(VAT=$(GEN P.GEN) [(WRAP(SUT P.VAT) %IRON) (WRAP(SUT Q.VAT) %IRON)])
    ::
        {$KTLS *}
      =+  HIF=[P=(NICE (PLAY P.GEN)) Q=(PLAY(SUT DOX) P.GEN)]
      =+($(GEN Q.GEN, GOL P.HIF) HIF)
    ::
        {$KTPD *}
      =+(VAT=$(GEN P.GEN) [(WRAP(SUT P.VAT) %ZINC) (WRAP(SUT Q.VAT) %ZINC)])
    ::
        {$TUNE *}
      [(FACE P.GEN SUT) (FACE P.GEN DOX)]
    ::
        {$KTWT *}
      =+(VAT=$(GEN P.GEN) [(WRAP(SUT P.VAT) %LEAD) (WRAP(SUT Q.VAT) %LEAD)])
    ::
        {$NOTE *}
      =+  VAT=$(GEN Q.GEN)
      [(HINT [SUT P.GEN] P.VAT) (HINT [DOX P.GEN] Q.VAT)]
    ::
        {$KTSG *}  $(GEN P.GEN)
        {$SGZP *}  ~_(DUCK(SUT (PLAY P.GEN)) $(GEN Q.GEN))
        {$SGBN *}  $(GEN Q.GEN)
        {$TSBN *}
      =+  LEM=$(GEN P.GEN, GOL %NOUN)
      $(GEN Q.GEN, SUT P.LEM, DOX Q.LEM)
    ::
        {$WTCL *}
      =+  NOR=$(GEN P.GEN, GOL BOOL)
      =+  ^=  HIQ  ^-  {P/TYPE Q/TYPE}
          =+  FEX=[P=(GAIN P.GEN) Q=(GAIN(SUT DOX) P.GEN)]
          ?:  =(%VOID P.FEX)
            :-  %VOID
            ?:  =(%VOID Q.FEX)
              %VOID
            ~>(%MEAN.[%LEAF "IF-Z"] (PLAY(SUT Q.FEX) Q.GEN))
          ?:  =(%VOID Q.FEX)
            ~>(%MEAN.[%LEAF "MULL-BONK-B"] !!)
          $(SUT P.FEX, DOX Q.FEX, GEN Q.GEN)
      =+  ^=  RAN  ^-  {P/TYPE Q/TYPE}
          =+  WUX=[P=(LOSE P.GEN) Q=(LOSE(SUT DOX) P.GEN)]
          ?:  =(%VOID P.WUX)
            :-  %VOID
            ?:  =(%VOID Q.WUX)
              %VOID
            ~>(%MEAN.[%LEAF "IF-A"] (PLAY(SUT Q.WUX) R.GEN))
          ?:  =(%VOID Q.WUX)
            ~>(%MEAN.[%LEAF "MULL-BONK-C"] !!)
          $(SUT P.WUX, DOX Q.WUX, GEN R.GEN)
      [(NICE (FORK P.HIQ P.RAN ~)) (FORK Q.HIQ Q.RAN ~)]
    ::
        {$FITS *}
      =+  WAZ=[P=(PLAY P.GEN) Q=(PLAY(SUT DOX) P.GEN)]
      =+  ^=  SYX  :-  P=(COVE Q:(MINT %NOUN [%WING Q.GEN]))
                   Q=(COVE Q:(MINT(SUT DOX) %NOUN [%WING Q.GEN]))
      =+  POV=[P=(FISH(SUT P.WAZ) P.SYX) Q=(FISH(SUT Q.WAZ) Q.SYX)]
      ?.  &(=(P.SYX Q.SYX) =(P.POV Q.POV))
        ~>(%MEAN.[%LEAF "MULL-BONK-A"] !!)
      (BETH BOOL)
    ::
        {$WTHX *}
      ~>  %MEAN.[%LEAF "MULL-BONK-X"]
      =+  :-  =+  (FIND %READ [[%& 1] Q.GEN])
              ?>  &(?=(%& -.-) ?=(%& -.Q.P.-))
              NEW=[TYPE=P.Q.P.- AXIS=(TEND P.P.-)]
          =+  (FIND(SUT DOX) %READ [%& 1] Q.GEN)
          ?>  &(?=(%& -.-) ?=(%& -.Q.P.-))
          OLD=[TYPE=P.Q.P.- AXIS=(TEND P.P.-)]
      ?>  =(AXIS.OLD AXIS.NEW)
      ?>  (NEST(SUT TYPE.OLD) & TYPE.NEW)
      (BETH BOOL)
    ::
        {$DBUG *}  ~_((SHOW %O P.GEN) $(GEN Q.GEN))
        {$ZPCM *}  [(NICE (PLAY P.GEN)) (PLAY(SUT DOX) P.GEN)]
        {$LOST *}
      ?:  VET
        ::  ~_  (DUNK(SUT (PLAY P.GEN)) 'ALSO')
        ~>(%MEAN.[%LEAF "MULL-SKIP"] !!)
      (BETH %VOID)
    ::
        {$ZPTS *}  (BETH %NOUN)
    ::
        {$ZPMC *}
      =+  VOS=$(GOL %NOUN, GEN Q.GEN)       ::  XX VALIDATE!
      [(NICE (CELL (PLAY P.GEN) P.VOS)) (CELL (PLAY(SUT DOX) P.GEN) Q.VOS)]
    ::
        {$ZPVT *}
      =+  [(FEEL P.GEN) (FEEL(SUT DOX) P.GEN)]
      ?.  =(-< ->)
        ~>(%MEAN.[%LEAF "MULL-BONK-F"] !!)
      ?:  -<
        $(GEN Q.GEN)
      $(GEN R.GEN)
    ::
        {$ZPZP *}  (BETH %VOID)
        *
      =+  DOZ=~(OPEN AP GEN)
      ?:  =(DOZ GEN)
        ~_  (SHOW [%C 'HOON'] [%Q GEN])
        ~>(%MEAN.[%LEAF "MULL-OPEN"] !!)
      $(GEN DOZ)
    ==
    ::
    ++  BETH
      |=  TYP/TYPE
      [(NICE TYP) TYP]
    ::
    ++  NICE
      |=  TYP/TYPE
      ::  ~_  (DUNK(SUT GOL) 'NEED')
      ::  ~_  (DUNK(SUT TYP) 'HAVE')
      ~_  LEAF+"MULL-NICE"
      ?>  ?|(!VET (NEST(SUT GOL) & TYP))
      TYP
    ::
    ++  GROW
      |=  {MEL/VAIR NYM/(UNIT TERM) HUD/POLY RUF/HOON DOM/(MAP TERM TOME)}
      ::  MAKE AL
      ~_  LEAF+"MULL-GROW"
      ^-  {P/TYPE Q/TYPE}
      =+  DAN=^$(GEN RUF, GOL %NOUN)
      =+  YAZ=(MILE(SUT P.DAN) Q.DAN MEL NYM HUD DOM)
      [(NICE P.YAZ) Q.YAZ]
    --
  ++  MEET  |=(REF/TYPE &((NEST | REF) (NEST(SUT REF) | SUT)))
  ::                                                    ::
  ++  MISS                                              ::  NONINTERSECTION
    |=  $:  ::  REF: SYMMETRIC TYPE
            ::
            REF/TYPE
        ==
    ::  INTERSECTION OF SUT AND REF IS EMPTY
    ::
    ^-  ?
    =|  GIL/(SET (SET TYPE))
    =<  DEXT
    |%
    ++  DEXT
      ^-  ?
      ::
      ?:  =(REF SUT)
        (NEST(SUT %VOID) | SUT)
      ?-  SUT
        $VOID      &
        $NOUN      (NEST(SUT %VOID) | REF)
        {$ATOM *}  SINT
        {$CELL *}  SINT
        {$CORE *}  SINT(SUT [%CELL %NOUN %NOUN])
        {$FORK *}  %+  LEVY  ~(TAP IN P.SUT)
                   |=(TYPE DEXT(SUT +<))
        {$FACE *}  DEXT(SUT Q.SUT)
        {$HINT *}  DEXT(SUT Q.SUT)
        {$HOLD *}  =+  (~(GAS IN *(SET TYPE)) `(LIST TYPE)`[SUT REF ~])
                   ?:  (~(HAS IN GIL) -)
                      &
                   %=  DEXT
                     SUT  REPO
                     GIL  (~(PUT IN GIL) -)
      ==           ==
    ++  SINT
      ?+  REF      DEXT(SUT REF, REF SUT)
        {$ATOM *}  ?.  ?=({$ATOM *} SUT)  &
                   ?&  ?=(^ Q.REF)
                       ?=(^ Q.SUT)
                       !=(Q.REF Q.SUT)
                   ==
        {$CELL *}  ?.  ?=({$CELL *} SUT)  &
                   ?|  DEXT(SUT P.SUT, REF P.REF)
                       DEXT(SUT Q.SUT, REF Q.REF)
      ==           ==
    --
  ++  MITE  |=(REF/TYPE |((NEST | REF) (NEST(SUT REF) & SUT)))
  ++  NEST
    ~/  %NEST
    |=  {TEL/? REF/TYPE}
    =|  $:  SEG/(SET TYPE)                              ::  DEGENERATE SUT
            REG/(SET TYPE)                              ::  DEGENERATE REF
            GIL/(SET {P/TYPE Q/TYPE})                   ::  ASSUME NEST
        ==
    =<  DEXT
    |%
    ++  DEEM
      |=  {MEL/VAIR RAM/VAIR}
      ^-  ?
      ?.  |(=(MEL RAM) =(%LEAD MEL) =(%GOLD RAM))  |
      ?:  ?=($LEAD MEL)  &
      ?:  ?=($GOLD MEL)  MEET
      =+  VAY=?-(MEL $IRON %RITE, $ZINC %READ)
      DEXT(SUT (PEEK VAY 2), REF (PEEK(SUT REF) VAY 2))
    ::
    ++  DEEP
      |=  $:  DOM/(MAP TERM TOME)
              VIM/(MAP TERM TOME)
          ==
      ^-  ?
      ?:  ?=(~ DOM)  =(VIM ~)
      ?:  ?=(~ VIM)  |
      ?&  =(P.N.DOM P.N.VIM)
          $(DOM L.DOM, VIM L.VIM)
          $(DOM R.DOM, VIM R.VIM)
      ::
          =+  [DAB HEM]=[Q.Q.N.DOM Q.Q.N.VIM]
          |-  ^-  ?
          ?:  ?=(~ DAB)  =(HEM ~)
          ?:  ?=(~ HEM)  |
          ?&  =(P.N.DAB P.N.HEM)
              $(DAB L.DAB, HEM L.HEM)
              $(DAB R.DAB, HEM R.HEM)
              %=  DEXT
                SUT  (PLAY Q.N.DAB)
                REF  (PLAY(SUT REF) Q.N.HEM)
      ==  ==  ==
    ::
    ++  DEXT
      ^-  ?
      =-  ?:  -  &
          ?.  TEL  |
          ::  ~_  (DUNK %NEED)
          ::  ~_  (DUNK(SUT REF) %HAVE)
          ~>(%MEAN.[%LEAF "NEST-FAIL"] !!)
      ?:  =(SUT REF)  &
      ?-  SUT
        $VOID      SINT
        $NOUN      &
        {$ATOM *}  ?.  ?=({$ATOM *} REF)  SINT
                   ?&  (FITZ P.SUT P.REF)
                       |(?=(~ Q.SUT) =(Q.SUT Q.REF))
                   ==
        {$CELL *}  ?.  ?=({$CELL *} REF)  SINT
                   ?&  DEXT(SUT P.SUT, REF P.REF, SEG ~, REG ~)
                       DEXT(SUT Q.SUT, REF Q.REF, SEG ~, REG ~)
                   ==
        {$CORE *}  ?.  ?=({$CORE *} REF)  SINT
                   ?:  =(Q.SUT Q.REF)  DEXT(SUT P.SUT, REF P.REF)
                   ?&  =(Q.P.Q.SUT Q.P.Q.REF)
                       MEET(SUT Q.Q.SUT, REF P.SUT)
                       DEXT(SUT Q.Q.REF, REF P.REF)
                       (DEEM(SUT Q.Q.SUT, REF Q.Q.REF) R.P.Q.SUT R.P.Q.REF)
                       ?:  =(%WET Q.P.Q.SUT)  =(Q.R.Q.SUT Q.R.Q.REF)
                       ?|  (~(HAS IN GIL) [SUT REF])
                           %.  [Q.R.Q.SUT Q.R.Q.REF]
                           %=  DEEP
                             GIL  (~(PUT IN GIL) [SUT REF])
                             SUT  SUT(P Q.Q.SUT, R.P.Q %GOLD)
                             REF  REF(P Q.Q.REF, R.P.Q %GOLD)
                       ==  ==
                   ==
        {$FACE *}  DEXT(SUT Q.SUT)
        {$FORK *}  ?.  ?=(?({$ATOM *} $NOUN {$CELL *} {$CORE *}) REF)  SINT
                   (LIEN ~(TAP IN P.SUT) |=(TYPE DEXT(TEL |, SUT +<)))
        {$HINT *}  DEXT(SUT Q.SUT)
        {$HOLD *}  ?:  (~(HAS IN SEG) SUT)  |
                   ?:  (~(HAS IN GIL) [SUT REF])  &
                   %=  DEXT
                     SUT  REPO
                     SEG  (~(PUT IN SEG) SUT)
                     GIL  (~(PUT IN GIL) [SUT REF])
      ==           ==
    ::
    ++  MEET  &(DEXT DEXT(SUT REF, REF SUT))
    ++  SINT
      ^-  ?
      ?-  REF
        $NOUN       |
        $VOID       &
        {$ATOM *}   |
        {$CELL *}   |
        {$CORE *}   DEXT(REF REPO(SUT REF))
        {$FACE *}   DEXT(REF Q.REF)
        {$FORK *}   (LEVY ~(TAP IN P.REF) |=(TYPE DEXT(REF +<)))
        {$HINT *}   DEXT(REF Q.REF)
        {$HOLD *}   ?:  (~(HAS IN REG) REF)  &
                    ?:  (~(HAS IN GIL) [SUT REF])  &
                    %=  DEXT
                      REF  REPO(SUT REF)
                      REG  (~(PUT IN REG) REF)
                      GIL  (~(PUT IN GIL) [SUT REF])
      ==            ==
    --
  ::
  ++  PEEK
    ~/  %PEEK
    |=  {WAY/?($READ $RITE $BOTH $FREE) AXE/AXIS}
    ^-  TYPE
    ?:  =(1 AXE)
      SUT
    =+  [NOW=(CAP AXE) LAT=(MAS AXE)]
    =+  GIL=*(SET TYPE)
    |-  ^-  TYPE
    ?-    SUT
        {$ATOM *}   %VOID
        {$CELL *}   ?:(=(2 NOW) ^$(SUT P.SUT, AXE LAT) ^$(SUT Q.SUT, AXE LAT))
        {$CORE *}
      ?.  =(3 NOW)  %NOUN
      =+  PEC=(PEEL WAY R.P.Q.SUT)
      =/  TOW
        ?:  =(1 LAT)  1
        (CAP LAT)
      %=    ^$
          AXE  LAT
          SUT
        ?:  ?|  =([& &] PEC)
                &(SAM.PEC =(TOW 2))
                &(CON.PEC =(TOW 3))
            ==
          P.SUT
        ~_  LEAF+"PAYLOAD-BLOCK"
        ?.  =(WAY %READ)  !!
        %+  CELL
          ?.(SAM.PEC %NOUN ^$(SUT P.SUT, AXE 2))
        ?.(CON.PEC %NOUN ^$(SUT P.SUT, AXE 3))
      ==
    ::
        {$FORK *}   (FORK (TURN ~(TAP IN P.SUT) |=(TYPE ^$(SUT +<))))
        {$HOLD *}
      ?:  (~(HAS IN GIL) SUT)
        %VOID
      $(GIL (~(PUT IN GIL) SUT), SUT REPO)
    ::
        $VOID       %VOID
        $NOUN       %NOUN
        *           $(SUT REPO)
    ==
  ::
  ++  PEEL
    |=  {WAY/VIAL MET/?($GOLD $IRON $LEAD $ZINC)}
    ^-  {SAM/? CON/?}
    ?:  ?=($GOLD MET)  [& &]
    ?-  WAY
      $BOTH  [| |]
      $FREE  [& &]
      $READ  [?=($ZINC MET) |]
      $RITE  [?=($IRON MET) |]
    ==
  ::
  ++  PLAY
    ~/  %PLAY
    =>  .(VET |)
    |=  GEN/HOON
    ^-  TYPE
    ?-  GEN
      {^ *}      (CELL $(GEN P.GEN) $(GEN Q.GEN))
      {$KTCN *}  $(FAB |, GEN P.GEN)
      {$BRCN *}  (CORE SUT [P.GEN %DRY %GOLD] SUT *SEMINOUN Q.GEN)
      {$BRVT *}  (CORE SUT [P.GEN %WET %GOLD] SUT *SEMINOUN Q.GEN)
      {$CNTS *}  ~(PLAY ET P.GEN Q.GEN)
      {$DTKT *}  $(GEN [%KTTR P.GEN])
      {$DTLS *}  [%ATOM %$ ~]
      {$ROCK *}  |-  ^-  TYPE
                 ?@  Q.GEN  [%ATOM P.GEN `Q.GEN]
                 [%CELL $(Q.GEN -.Q.GEN) $(Q.GEN +.Q.GEN)]
      {$SAND *}  |-  ^-  TYPE
                 ?@  Q.GEN
                   ?:  =(%N P.GEN)  ?>(=(0 Q.GEN) [%ATOM P.GEN ~ Q.GEN])
                   ?:(=(%F P.GEN) ?>((LTE Q.GEN 1) BOOL) [%ATOM P.GEN ~])
                 [%CELL $(Q.GEN -.Q.GEN) $(Q.GEN +.Q.GEN)]
      {$TUNE *}  (FACE P.GEN SUT)
      {$DTTR *}  %NOUN
      {$DTTS *}  BOOL
      {$DTWT *}  BOOL
      {$HAND *}  P.GEN
      {$KTBR *}  (WRAP(SUT $(GEN P.GEN)) %IRON)
      {$KTLS *}  $(GEN P.GEN)
      {$KTPD *}  (WRAP(SUT $(GEN P.GEN)) %ZINC)
      {$KTSG *}  $(GEN P.GEN)
      {$KTWT *}  (WRAP(SUT $(GEN P.GEN)) %LEAD)
      {$NOTE *}  (HINT [SUT P.GEN] $(GEN Q.GEN))
      {$SGZP *}  ~_(DUCK(SUT ^$(GEN P.GEN)) $(GEN Q.GEN))
      {$SGBN *}  $(GEN Q.GEN)
      {$TSBN *}  $(GEN Q.GEN, SUT $(GEN P.GEN))
      {$WTCL *}  =+  [FEX=(GAIN P.GEN) WUX=(LOSE P.GEN)]
                 %-  FORK  :~
                   ?:(=(%VOID FEX) %VOID $(SUT FEX, GEN Q.GEN))
                   ?:(=(%VOID WUX) %VOID $(SUT WUX, GEN R.GEN))
                 ==
      {$FITS *}  BOOL
      {$WTHX *}  BOOL
      {$DBUG *}  ~_((SHOW %O P.GEN) $(GEN Q.GEN))
      {$ZPCM *}  (PLAY P.GEN)
      {$LOST *}  %VOID
      {$ZPMC *}  (CELL $(GEN P.GEN) $(GEN Q.GEN))
      {$ZPTS *}  %NOUN
      {$ZPVT *}  ?:((FEEL P.GEN) $(GEN Q.GEN) $(GEN R.GEN))
      {$ZPZP *}  %VOID
      *          =+  DOZ=~(OPEN AP GEN)
                 ?:  =(DOZ GEN)
                   ~_  (SHOW [%C 'HOON'] [%Q GEN])
                   ~>(%MEAN.[%LEAF "PLAY-OPEN"] !!)
                 $(GEN DOZ)
    ==
  ::                                                    ::
  ++  REDO                                              ::  REFURBISH FACES
    |=  $:  ::  REF: RAW PAYLOAD
            ::
            REF/TYPE
        ==
    ::  :TYPE: SUBJECT REFURBISHED TO REFERENCE NAMESPACE
    ::
    ^-  TYPE
    ::  HOS: SUBJECT TOOL STACK
    ::  WEC: REFERENCE TOOL STACK SET
    ::  GIL: REPETITION SET
    ::
    =|  HOS/(LIST TOOL)
    =/  WEC/(SET (LIST TOOL))  [~ ~ ~]
    =|  GIL/(SET (PAIR TYPE TYPE))
    =<  ::  ERRORS IMPLY SUBJECT/REFERENCE MISMATCH
        ::
        ~|  %REDO-MATCH
        ::  REDUCE BY SUBJECT
        ::
        DEXT
    |%
    ::                                                  ::
    ++  DEAR                                            ::  RESOLVE TOOL STACK
      ::  :(UNIT (LIST TOOL)): UNIFIED TOOL STACK
      ::
      ^-  (UNIT (LIST TOOL))
      ::  EMPTY IMPLIES VOID
      ::
      ?~  WEC  `~
      ::  ANY REFERENCE FACES MUST BE CLEAR
      ::
      ?.  ?=({* ~ ~} WEC)
        ~&  [%DEAR-MANY WEC]
        ~
      :-  ~
      ::  HAR: SINGLE REFERENCE TOOL STACK
      ::
      =/  HAR  N.WEC
      ::  LEN: LENGTHS OF [SUT REF] FACE STACKS
      ::
      =/  LEN  [P Q]=[(LENT HOS) (LENT HAR)]
      ::  LIP: LENGTH OF SUT-REF FACE STACK OVERLAP
      ::
      ::      AB
      ::       BC
      ::
      ::    +LIP IS (LENT B), WHERE +HAY IS FORWARD AB
      ::    AND +LIV IS FORWARD BC (STACK BA AND CB).
      ::
      ::    OVERLAP IS A WEIRD CORNER CASE.  +LIP IS
      ::    ALMOST ALWAYS 0.  BRUTE FORCE IS FINE.
      ::
      =/  LIP
        =|  LUP/(UNIT @UD)
        =|  LIP/@UD
        |-  ^-  @UD
        ?:  |((GTH LIP P.LEN) (GTH LIP Q.LEN))
          (FALL LUP 0)
        ::  LEP: OVERLAP CANDIDATE: SUFFIX OF SUBJECT FACE STACK
        ::
        =/  LEP  (SLAG (SUB P.LEN LIP) HOS)
        ::  LAP: OVERLAP CANDIDATE: PREFIX OF REFERENCE FACE STACK
        ::
        =/  LAP  (SCAG LIP HAR)
        ::  SAVE ANY MATCH AND CONTINUE
        ::
        $(LIP +(LIP), LUP ?.(=(LEP LAP) LUP `LIP))
      ::  ~&  [HAR+HAR HOS+HOS LEN+LEN LIP+LIP]
      ::  PRODUCE COMBINED FACE STACK (FORWARD ABC, STACK CBA)
      ::
      (WELD HOS (SLAG LIP HAR))
    ::                                                  ::
    ++  DEXT                                            ::  SUBJECT TRAVERSE
      ::  :TYPE: REFURBISHED SUBJECT
      ::
      ^-  TYPE
      ::  CHECK FOR TRIVIAL CASES
      ::
      ?:  ?|  =(SUT REF)
              ?=(?($NOUN $VOID {?($ATOM $CORE) *}) REF)
          ==
        DONE
      ::  ~_  (DUNK 'REDO: DEXT: SUT')
      ::  ~_  (DUNK(SUT REF) 'REDO: DEXT: REF')
      ?-    SUT
          ?($NOUN $VOID {?($ATOM $CORE) *})
        ::  REDUCE REFERENCE AND REASSEMBLE LEAF
        ::
        DONE:(SINT &)
      ::
          {$CELL *}
        ::  REDUCE REFERENCE TO MATCH SUBJECT
        ::
        =>  (SINT &)
        ?>  ?=({$CELL *} SUT)
        ::  LEAF WITH POSSIBLE RECURSIVE DESCENT
        ::
        %=    DONE
            SUT
          ::  CLEAR FACE STACKS FOR DESCENT
          ::
          =:  HOS  ~
              WEC  [~ ~ ~]
            ==
          ::  DESCEND INTO CELL
          ::
          :+  %CELL
            DEXT(SUT P.SUT, REF (PEEK(SUT REF) %FREE 2))
          DEXT(SUT Q.SUT, REF (PEEK(SUT REF) %FREE 3))
        ==
      ::
          {$FACE *}
        ::  PUSH FACE ON SUBJECT STACK, AND DESCEND
        ::
        DEXT(HOS [P.SUT HOS], SUT Q.SUT)
      ::
          {$HINT *}
        ::  WORK THROUGH HINT
        ::
        (HINT P.SUT DEXT(SUT Q.SUT))
      ::
          {$FORK *}
        ::  RECONSTRUCT EACH CASE IN FORK
        ::
        (FORK (TURN ~(TAP IN P.SUT) |=(TYPE DEXT(SUT +<))))
      ::
          {$HOLD *}
        ::  REDUCE TO HARD
        ::
        =>  (SINT |)
        ?>  ?=({$HOLD *} SUT)
        ?:  (~(HAS IN FAN) [P.SUT Q.SUT])
          ::  REPO LOOP; REDO DEPENDS ON ITS OWN PRODUCT
          ::
          DONE:(SINT &)
        ?:  (~(HAS IN GIL) [SUT REF])
          ::  TYPE RECURSION, STOP RENAMING
          ::
          DONE:(SINT |)
        ::  RESTORE UNCHANGED HOLDS
        ::
        =+  REPO
        =-  ?:(=(- +<) SUT -)
        DEXT(SUT -, GIL (~(PUT IN GIL) SUT REF))
      ==
    ::                                                  ::
    ++  DONE                                            ::  COMPLETE ASSEMBLY
      ^-  TYPE
      ::  :TYPE: SUBJECT REFURBISHED
      ::
      ::  LOV: COMBINED FACE STACK
      ::
      =/  LOV
          =/  LOV  DEAR
          ?~  LOV
            ::  ~_  (DUNK 'REDO: DEAR: SUT')
            ::  ~_  (DUNK(SUT REF) 'REDO: DEAR: REF')
            ~&  [%WEC WEC]
            !!
          (NEED LOV)
      ::  RECOMPOSE FACES
      ::
      |-  ^-  TYPE
      ?~  LOV  SUT
      $(LOV T.LOV, SUT (FACE I.LOV SUT))
    ::                                                  ::
    ++  SINT                                            ::  REDUCE BY REFERENCE
      |=  $:  ::  HOD: EXPAND HOLDS
              ::
              HOD/?
          ==
      ::  ::.: REFERENCE WITH FACE/FORK/HOLD REDUCED
      ::
      ^+  .
      ::  =-  ~>  %SLOG.[0 (DUNK 'SINT: SUT')]
      ::      ~>  %SLOG.[0 (DUNK(SUT REF) 'SINT: REF')]
      ::      ~>  %SLOG.[0 (DUNK(SUT =>(- REF)) 'SINT: PRO')]
      ::      -
      ?+    REF  .
          {$HINT *}  $(REF Q.REF)
          {$FACE *}
        ::  EXTEND ALL STACKS IN SET
        ::
        %=  $
          REF  Q.REF
          WEC  (~(RUN IN WEC) |=((LIST TOOL) [P.REF +<]))
        ==
      ::
          {$FORK *}
        ::  RECONSTRUCT ALL RELEVANT CASES
        ::
        =-  ::  ~>  %SLOG.[0 (DUNK 'FORK: SUT')]
            ::  ~>  %SLOG.[0 (DUNK(SUT REF) 'FORK: REF')]
            ::  ~>  %SLOG.[0 (DUNK(SUT (FORK ->)) 'FORK: PRO')]
            +(WEC -<, REF (FORK ->))
        =/  MOY  ~(TAP IN P.REF)
        |-  ^-  (PAIR (SET (LIST TOOL)) (LIST TYPE))
        ?~  MOY  [~ ~]
        ::  HEAD RECURSE
        ::
        =/  MOR  $(MOY T.MOY)
        ::  PRUNE REFERENCE CASES OUTSIDE SUBJECT
        ::
        ?:  (MISS I.MOY)  MOR
        ::  UNIFY ALL CASES
        ::
        =/  DIS  ^$(REF I.MOY)
        [(~(UNI IN P.MOR) WEC.DIS) [REF.DIS Q.MOR]]
      ::
          {$HOLD *}
        ?.  HOD  .
        $(REF REPO(SUT REF))
      ==
    --
  ::
  ++  REPO
    ^-  TYPE
    ?-  SUT
      {$CORE *}   [%CELL %NOUN P.SUT]
      {$FACE *}   Q.SUT
      {$HINT *}   Q.SUT
      {$HOLD *}   (REST [[P.SUT Q.SUT] ~])
      $NOUN       (FORK [%ATOM %$ ~] [%CELL %NOUN %NOUN] ~)
      *           ~>(%MEAN.[%LEAF "REPO-FLTT"] !!)
    ==
  ::
  ++  REST
    ~/  %REST
    |=  LEG/(LIST {P/TYPE Q/HOON})
    ^-  TYPE
    ?:  (LIEN LEG |=({P/TYPE Q/HOON} (~(HAS IN FAN) [P Q])))
      ~>(%MEAN.[%LEAF "REST-LOOP"] !!)
    =>  .(FAN (~(GAS IN FAN) LEG))
    %-  FORK
    %~  TAP  IN
    %-  ~(GAS IN *(SET TYPE))
    (TURN LEG |=({P/TYPE Q/HOON} (PLAY(SUT P) Q)))
  ::
  ++  TAKE
    |=  {VIT/VEIN DUZ/$-(TYPE TYPE)}
    ^-  (PAIR AXIS TYPE)
    :-  (TEND VIT)
    =.  VIT  (FLOP VIT)
    |-  ^-  TYPE
    ?~  VIT  (DUZ SUT)
    ?~  I.VIT
      |-  ^-  TYPE
      ?+  SUT      ^$(VIT T.VIT)
        {$FACE *}  (FACE P.SUT ^$(VIT T.VIT, SUT Q.SUT))
        {$HINT *}  (HINT P.SUT ^$(SUT Q.SUT))
        {$FORK *}  (FORK (TURN ~(TAP IN P.SUT) |=(TYPE ^$(SUT +<))))
        {$HOLD *}  $(SUT REPO)
      ==
    =+  VIL=*(SET TYPE)
    |-  ^-  TYPE
    ?:  =(1 U.I.VIT)
      ^$(VIT T.VIT)
    =+  [NOW LAT]=(CAP U.I.VIT)^(MAS U.I.VIT)
    ?-  SUT
      $NOUN      $(SUT [%CELL %NOUN %NOUN])
      $VOID      %VOID
      {$ATOM *}  %VOID
      {$CELL *}  ?:  =(2 NOW)
                   (CELL $(SUT P.SUT, U.I.VIT LAT) Q.SUT)
                  (CELL P.SUT $(SUT Q.SUT, U.I.VIT LAT))
      {$CORE *}  ?:  =(2 NOW)
                   $(SUT REPO)
                 (CORE $(SUT P.SUT, U.I.VIT LAT) Q.SUT)
      {$FACE *}  (FACE P.SUT $(SUT Q.SUT))
      {$FORK *}  (FORK (TURN ~(TAP IN P.SUT) |=(TYPE ^$(SUT +<))))
      {$HINT *}  (HINT P.SUT $(SUT Q.SUT))
      {$HOLD *}  ?:  (~(HAS IN VIL) SUT)
                   %VOID
                 $(SUT REPO, VIL (~(PUT IN VIL) SUT))
    ==
  ::
  ++  TACK
    |=  {HYP/WING MUR/TYPE}
    ~_  (SHOW [%C %TACK] %L HYP)
    =+  FID=(FIND %RITE HYP)
    ?>  ?=(%& -.FID)
    (TAKE P.P.FID |=(TYPE MUR))
  ::
  ++  TEND
    |=  VIT/VEIN
    ^-  AXIS
    ?~(VIT 1 (PEG $(VIT T.VIT) ?~(I.VIT 1 U.I.VIT)))
  ::
  ++  TOSS
    ~/  %TOSS
    |=  {HYP/WING MUR/TYPE MEN/(LIST {P/TYPE Q/FOOT})}
    ^-  {P/AXIS Q/(LIST {P/TYPE Q/FOOT})}
    =-  [(NEED P.WIB) Q.WIB]
    ^=  WIB
    |-  ^-  {P/(UNIT AXIS) Q/(LIST {P/TYPE Q/FOOT})}
    ?~  MEN
      [*(UNIT AXIS) ~]
    =+  GEQ=(TACK(SUT P.I.MEN) HYP MUR)
    =+  MOX=$(MEN T.MEN)
    [(MATE P.MOX `_P.MOX`[~ P.GEQ]) [[Q.GEQ Q.I.MEN] Q.MOX]]
  ::
  ++  WRAP
    ~/  %WRAP
    |=  YOZ/?($LEAD $IRON $ZINC)
    ~_  LEAF+"WRAP"
    ^-  TYPE
    ?+  SUT  SUT
      {$CELL *}  (CELL $(SUT P.SUT) $(SUT Q.SUT))
      {$CORE *}  ?>(|(=(%GOLD R.P.Q.SUT) =(%LEAD YOZ)) SUT(R.P.Q YOZ))
      {$FACE *}  (FACE P.SUT $(SUT Q.SUT))
      {$FORK *}  (FORK (TURN ~(TAP IN P.SUT) |=(TYPE ^$(SUT +<))))
      {$HINT *}  (HINT P.SUT $(SUT Q.SUT))
      {$HOLD *}  $(SUT REPO)
    ==
  --
++  US                                                  ::  PRETTYPRINTER
  =>  |%
      ++  CAPE  {P/(MAP @UD WINE) Q/WINE}               ::
      ++  WINE                                          ::
                $@  $?  $NOUN                           ::
                        $PATH                           ::
                        $TYPE                           ::
                        $VOID                           ::
                        $WALL                           ::
                        $WOOL                           ::
                        $YARN                           ::
                    ==                                  ::
                $%  {$MATO P/TERM}                      ::
                    {$CORE P/(LIST @TA) Q/WINE}         ::
                    {$FACE P/TERM Q/WINE}               ::
                    {$LIST P/TERM Q/WINE}               ::
                    {$PEAR P/TERM Q/@}                  ::
                    {$BSWT P/(LIST WINE)}               ::
                    {$PLOT P/(LIST WINE)}               ::
                    {$STOP P/@UD}                       ::
                    {$TREE P/TERM Q/WINE}               ::
                    {$UNIT P/TERM Q/WINE}               ::
                ==                                      ::
      --
  |_  SUT/TYPE
  ++  DASH
    |=  {MIL/TAPE LIM/CHAR LAM/TAPE}
    ^-  TAPE
    =/  ESC  (~(GAS IN *(SET @TD)) LAM)
    :-  LIM
    |-  ^-  TAPE
    ?~  MIL  [LIM ~]
    ?:  ?|  =(LIM I.MIL)
            =('\\' I.MIL)
            (~(HAS IN ESC) I.MIL)
        ==
      ['\\' I.MIL $(MIL T.MIL)]
    ?:  (LTE ' ' I.MIL)
      [I.MIL $(MIL T.MIL)]
    ['\\' ~(X NE (RSH 2 1 I.MIL)) ~(X NE (END 2 1 I.MIL)) $(MIL T.MIL)]
  ::
  ++  DEAL  |=(LUM/* (DISH DOLE LUM))
  ++  DIAL
    |=  HAM/CAPE
    =+  GID=*(SET @UD)
    =<  `TANK`-:$
    |%
    ++  MANY
      |=  HAZ/(LIST WINE)
      ^-  {(LIST TANK) (SET @UD)}
      ?~  HAZ  [~ GID]
      =^  MOR  GID  $(HAZ T.HAZ)
      =^  DIS  GID  ^$(Q.HAM I.HAZ)
      [[DIS MOR] GID]
    ::
    ++  $
      ^-  {TANK (SET @UD)}
      ?-    Q.HAM
          $NOUN      :_(GID [%LEAF '*' ~])
          $PATH      :_(GID [%LEAF '/' ~])
          $TYPE      :_(GID [%LEAF '#' 'T' ~])
          $VOID      :_(GID [%LEAF '#' '!' ~])
          $WOOL      :_(GID [%LEAF '*' '"' '"' ~])
          $WALL      :_(GID [%LEAF '*' '\'' '\'' ~])
          $YARN      :_(GID [%LEAF '"' '"' ~])
          {$MATO *}  :_(GID [%LEAF '@' (TRIP P.Q.HAM)])
          {$CORE *}
        =^  COX  GID  $(Q.HAM Q.Q.HAM)
        :_  GID
        :+  %ROSE
          [[' ' ~] ['<' ~] ['>' ~]]
        |-  ^-  (LIST TANK)
        ?~  P.Q.HAM  [COX ~]
        [[%LEAF (RIP 3 I.P.Q.HAM)] $(P.Q.HAM T.P.Q.HAM)]
      ::
          {$FACE *}
        =^  COX  GID  $(Q.HAM Q.Q.HAM)
        :_(GID [%PALM [['/' ~] ~ ~ ~] [%LEAF (TRIP P.Q.HAM)] COX ~])
      ::
          {$LIST *}
        =^  COX  GID  $(Q.HAM Q.Q.HAM)
        :_(GID [%ROSE [" " (WELD (TRIP P.Q.HAM) "(") ")"] COX ~])
      ::
          {$BSWT *}
        =^  COZ  GID  (MANY P.Q.HAM)
        :_(GID [%ROSE [[' ' ~] ['?' '(' ~] [')' ~]] COZ])
      ::
          {$PLOT *}
        =^  COZ  GID  (MANY P.Q.HAM)
        :_(GID [%ROSE [[' ' ~] ['{' ~] ['}' ~]] COZ])
      ::
          {$PEAR *}
        :_(GID [%LEAF '$' ~(REND CO [%$ P.Q.HAM Q.Q.HAM])])
      ::
          {$STOP *}
        =+  NUM=~(REND CO [%$ %UD P.Q.HAM])
        ?:  (~(HAS IN GID) P.Q.HAM)
          :_(GID [%LEAF '#' NUM])
        =^  COX  GID
            %=  $
              GID    (~(PUT IN GID) P.Q.HAM)
              Q.HAM  (~(GOT BY P.HAM) P.Q.HAM)
            ==
        :_(GID [%PALM [['.' ~] ~ ~ ~] [%LEAF ['^' '#' NUM]] COX ~])
      ::
          {$TREE *}
        =^  COX  GID  $(Q.HAM Q.Q.HAM)
        :_(GID [%ROSE [" " (WELD (TRIP P.Q.HAM) "(") ")"] COX ~])
      ::
          {$UNIT *}
        =^  COX  GID  $(Q.HAM Q.Q.HAM)
        :_(GID [%ROSE [" " (WELD (TRIP P.Q.HAM) "(") ")"] COX ~])
      ==
    --
  ::
  ++  DISH  !:
    |=  {HAM/CAPE LUM/*}  ^-  TANK
    ~|  [%DISH-H ?@(Q.HAM Q.HAM -.Q.HAM)]
    ~|  [%LUMP LUM]
    ~|  [%HAM HAM]
    %-  NEED
    =|  GIL/(SET {@UD *})
    |-  ^-  (UNIT TANK)
    ?-    Q.HAM
        $NOUN
      %=    $
          Q.HAM
        ?:  ?=(@ LUM)
          [%MATO %$]
        :-  %PLOT
        |-  ^-  (LIST WINE)
        [%NOUN ?:(?=(@ +.LUM) [[%MATO %$] ~] $(LUM +.LUM))]
      ==
    ::
        $PATH
      :-  ~
      :+  %ROSE
        [['/' ~] ['/' ~] ~]
      |-  ^-  (LIST TANK)
      ?~  LUM  ~
      ?@  LUM  !!
      ?>  ?=(@ -.LUM)
      [[%LEAF (RIP 3 -.LUM)] $(LUM +.LUM)]
    ::
        $TYPE
      =+  TYR=|.((DIAL DOLE))
      =+  VOL=TYR(SUT LUM)
      =+  CIS=((HARD TANK) .*(VOL [%9 2 %0 1]))
      :^  ~   %PALM
        [~ ~ ~ ~]
      [[%LEAF '#' 'T' '/' ~] CIS ~]
    ::
        $WALL
      :-  ~
      :+  %ROSE
        [[' ' ~] ['<' '|' ~] ['|' '>' ~]]
      |-  ^-  (LIST TANK)
      ?~  LUM  ~
      ?@  LUM  !!
      [[%LEAF (TRIP ((HARD @) -.LUM))] $(LUM +.LUM)]
    ::
        $WOOL
      :-  ~
      :+  %ROSE
        [[' ' ~] ['<' '<' ~] ['>' '>' ~]]
      |-  ^-  (LIST TANK)
      ?~  LUM  ~
      ?@  LUM  !!
      [(NEED ^$(Q.HAM %YARN, LUM -.LUM)) $(LUM +.LUM)]
    ::
        $YARN
      [~ %LEAF (DASH (TAPE LUM) '"' "\{")]
    ::
        $VOID
      ~
    ::
        {$MATO *}
      ?.  ?=(@ LUM)
        ~
      :+  ~
        %LEAF
      ?+    (RASH P.Q.HAM ;~(SFIX (COOK CRIP (STAR LOW)) (STAR HIG)))
          ~(REND CO [%$ P.Q.HAM LUM])
        $$    ~(REND CO [%$ %UD LUM])
        $T    (DASH (RIP 3 LUM) '\'' ~)
        $TAS  ['%' ?.(=(0 LUM) (RIP 3 LUM) ['$' ~])]
      ==
    ::
        {$CORE *}
      ::  XX  NEEDS RETHINKING FOR CORE METAL
      ::  ?.  ?=(^ LUM)  ~
      ::  =>  .(LUM `*`LUM)
      ::  =-  ?~(TOK ~ [~ %ROSE [[' ' ~] ['<' ~] ['>' ~]] U.TOK])
      ::  ^=  TOK
      ::  |-  ^-  (UNIT (LIST TANK))
      ::  ?~  P.Q.HAM
      ::    =+  DEN=^$(Q.HAM Q.Q.HAM)
      ::    ?~(DEN ~ [~ U.DEN ~])
      ::  =+  MUR=$(P.Q.HAM T.P.Q.HAM, LUM +.LUM)
      ::  ?~(MUR ~ [~ [[%LEAF (RIP 3 I.P.Q.HAM)] U.MUR]])
      [~ (DIAL HAM)]
    ::
        {$FACE *}
      =+  WAL=$(Q.HAM Q.Q.HAM)
      ?~  WAL
        ~
      [~ %PALM [['=' ~] ~ ~ ~] [%LEAF (TRIP P.Q.HAM)] U.WAL ~]
    ::
        {$LIST *}
      ?:  =(~ LUM)
        [~ %LEAF '~' ~]
      =-  ?~  TOK
            ~
          [~ %ROSE [[' ' ~] ['~' '[' ~] [']' ~]] U.TOK]
      ^=  TOK
      |-  ^-  (UNIT (LIST TANK))
      ?:  ?=(@ LUM)
        ?.(=(~ LUM) ~ [~ ~])
      =+  [FOR=^$(Q.HAM Q.Q.HAM, LUM -.LUM) AFT=$(LUM +.LUM)]
      ?.  &(?=(^ FOR) ?=(^ AFT))
        ~
      [~ U.FOR U.AFT]
    ::
        {$BSWT *}
      |-  ^-  (UNIT TANK)
      ?~  P.Q.HAM
        ~
      =+  WAL=^$(Q.HAM I.P.Q.HAM)
      ?~  WAL
        $(P.Q.HAM T.P.Q.HAM)
      WAL
    ::
        {$PLOT *}
      =-  ?~  TOK
            ~
          [~ %ROSE [[' ' ~] ['[' ~] [']' ~]] U.TOK]
      ^=  TOK
      |-  ^-  (UNIT (LIST TANK))
      ?~  P.Q.HAM
        ~
      ?:  ?=({* ~} P.Q.HAM)
        =+  WAL=^$(Q.HAM I.P.Q.HAM)
        ?~(WAL ~ [~ [U.WAL ~]])
      ?@  LUM
        ~
      =+  GIM=^$(Q.HAM I.P.Q.HAM, LUM -.LUM)
      ?~  GIM
        ~
      =+  MYD=$(P.Q.HAM T.P.Q.HAM, LUM +.LUM)
      ?~  MYD
        ~
      [~ U.GIM U.MYD]
    ::
        {$PEAR *}
      ?.  =(LUM Q.Q.HAM)
        ~
      =.  P.Q.HAM
        (RASH P.Q.HAM ;~(SFIX (COOK CRIP (STAR LOW)) (STAR HIG)))
      =+  FOX=$(Q.HAM [%MATO P.Q.HAM])
      ?>  ?=({~ $LEAF ^} FOX)
      ?:  ?=(?($N $TAS) P.Q.HAM)
        FOX
      [~ %LEAF '%' P.U.FOX]
    ::
        {$STOP *}
      ?:  (~(HAS IN GIL) [P.Q.HAM LUM])  ~
      =+  KEP=(~(GET BY P.HAM) P.Q.HAM)
      ?~  KEP
        ~|([%STOP-LOSS P.Q.HAM] !!)
      $(GIL (~(PUT IN GIL) [P.Q.HAM LUM]), Q.HAM U.KEP)
    ::
        {$TREE *}
      =-  ?~  TOK
            ~
          [~ %ROSE [[' ' ~] ['{' ~] ['}' ~]] U.TOK]
      ^=  TOK
      =+  TUK=*(LIST TANK)
      |-  ^-  (UNIT (LIST TANK))
      ?:  =(~ LUM)
        [~ TUK]
      ?.  ?=({N/* L/* R/*} LUM)
        ~
      =+  ROL=$(LUM R.LUM)
      ?~  ROL
        ~
      =+  TIM=^$(Q.HAM Q.Q.HAM, LUM N.LUM)
      ?~  TIM
        ~
      $(LUM L.LUM, TUK [U.TIM U.ROL])
    ::
        {$UNIT *}
      ?@  LUM
        ?.(=(~ LUM) ~ [~ %LEAF '~' ~])
      ?.  =(~ -.LUM)
        ~
      =+  WAL=$(Q.HAM Q.Q.HAM, LUM +.LUM)
      ?~  WAL
        ~
      [~ %ROSE [[' ' ~] ['[' ~] [']' ~]] [%LEAF '~' ~] U.WAL ~]
    ==
  ::
  ++  DOGE
    |=  HAM/CAPE
    =-  ?+  WOZ  WOZ
          {$LIST * {$MATO $'TA'}}  %PATH
          {$LIST * {$MATO $'T'}}   %WALL
          {$LIST * {$MATO $'TD'}}  %YARN
          {$LIST * $YARN}          %WOOL
        ==
    ^=  WOZ
    ^-  WINE
    ?.  ?=({$STOP *} Q.HAM)
      ?:  ?&  ?=  {$BSWT {$PEAR $N $0} {$PLOT {$PEAR $N $0} {$FACE *} ~} ~}
                Q.HAM
              =(1 (MET 3 P.I.T.P.I.T.P.Q.HAM))
          ==
        [%UNIT =<([P Q] I.T.P.I.T.P.Q.HAM)]
      Q.HAM
    =+  MAY=(~(GET BY P.HAM) P.Q.HAM)
    ?~  MAY
      Q.HAM
    =+  NUL=[%PEAR %N 0]
    ?.  ?&  ?=({$BSWT *} U.MAY)
            ?=({* * ~} P.U.MAY)
            |(=(NUL I.P.U.MAY) =(NUL I.T.P.U.MAY))
        ==
      Q.HAM
    =+  DIN=?:(=(NUL I.P.U.MAY) I.T.P.U.MAY I.P.U.MAY)
    ?:  ?&  ?=({$PLOT {$FACE *} {$FACE * $STOP *} ~} DIN)
            =(P.Q.HAM P.Q.I.T.P.DIN)
            =(1 (MET 3 P.I.P.DIN))
            =(1 (MET 3 P.I.T.P.DIN))
        ==
      :+  %LIST
        (CAT 3 P.I.P.DIN P.I.T.P.DIN)
      Q.I.P.DIN
    ?:  ?&  ?=  $:  $PLOT
                    {$FACE *}
                    {$FACE * $STOP *}
                    {{$FACE * $STOP *} ~}
                ==
                DIN
            =(P.Q.HAM P.Q.I.T.P.DIN)
            =(P.Q.HAM P.Q.I.T.T.P.DIN)
            =(1 (MET 3 P.I.P.DIN))
            =(1 (MET 3 P.I.T.P.DIN))
            =(1 (MET 3 P.I.T.T.P.DIN))
        ==
      :+  %TREE
        %^    CAT
            3
          P.I.P.DIN
        (CAT 3 P.I.T.P.DIN P.I.T.T.P.DIN)
      Q.I.P.DIN
    Q.HAM
  ::
  ++  DOLE
    ^-  CAPE
    =+  GIL=*(SET TYPE)
    =+  DEX=[P=*(MAP TYPE @) Q=*(MAP @ WINE)]
    =<  [Q.P Q]
    |-  ^-  {P/{P/(MAP TYPE @) Q/(MAP @ WINE)} Q/WINE}
    =-  [P.TEZ (DOGE Q.P.TEZ Q.TEZ)]
    ^=  TEZ
    ^-  {P/{P/(MAP TYPE @) Q/(MAP @ WINE)} Q/WINE}
    ?:  (~(MEET UT SUT) -:!>(*TYPE))
      [DEX %TYPE]
    ?-    SUT
        $NOUN      [DEX SUT]
        $VOID      [DEX SUT]
        {$ATOM *}  [DEX ?~(Q.SUT [%MATO P.SUT] [%PEAR P.SUT U.Q.SUT])]
        {$CELL *}
      =+  HIN=$(SUT P.SUT)
      =+  YON=$(DEX P.HIN, SUT Q.SUT)
      :-  P.YON
      :-  %PLOT
      ?:(?=({$PLOT *} Q.YON) [Q.HIN P.Q.YON] [Q.HIN Q.YON ~])
    ::
        {$CORE *}
      =+  YAD=$(SUT P.SUT)
      :-  P.YAD
      =+  ^=  DOY  ^-  {P/(LIST @TA) Q/WINE}
          ?:  ?=({$CORE *} Q.YAD)
            [P.Q.YAD Q.Q.YAD]
          [~ Q.YAD]
      :-  %CORE
      :_  Q.DOY
      :_  P.DOY
      %^  CAT  3
        %~  RENT  CO
        :+  %$  %UD
        %-  ~(REP BY (~(RUN BY Q.R.Q.SUT) |=(TOME ~(WYT BY Q.+<))))
        |=([[@ A=@U] B=@U] (ADD A B))
      %^  CAT  3
        ?-(R.P.Q.SUT $GOLD '.', $IRON '|', $LEAD '?', $ZINC '&')
      =+  GUM=(MUG Q.R.Q.SUT)
      %+  CAN  3
      :~  [1 (ADD 'A' (MOD GUM 26))]
          [1 (ADD 'A' (MOD (DIV GUM 26) 26))]
          [1 (ADD 'A' (MOD (DIV GUM 676) 26))]
      ==
    ::
        {$HINT *}
      $(SUT Q.SUT)
    ::
        {$FACE *}
      =+  YAD=$(SUT Q.SUT)
      ?^(P.SUT YAD [P.YAD [%FACE P.SUT Q.YAD]])
    ::
        {$FORK *}
      =+  YED=~(TAP IN P.SUT)
      =-  [P [%BSWT Q]]
      |-  ^-  {P/{P/(MAP TYPE @) Q/(MAP @ WINE)} Q/(LIST WINE)}
      ?~  YED
        [DEX ~]
      =+  MOR=$(YED T.YED)
      =+  DIS=^$(DEX P.MOR, SUT I.YED)
      [P.DIS Q.DIS Q.MOR]
    ::
        {$HOLD *}
      =+  HEY=(~(GET BY P.DEX) SUT)
      ?^  HEY
        [DEX [%STOP U.HEY]]
      ?:  (~(HAS IN GIL) SUT)
        =+  DYR=+(~(WYT BY P.DEX))
        [[(~(PUT BY P.DEX) SUT DYR) Q.DEX] [%STOP DYR]]
      =+  ROM=$(GIL (~(PUT IN GIL) SUT), SUT ~(REPO UT SUT))
      =+  REY=(~(GET BY P.P.ROM) SUT)
      ?~  REY
        ROM
      [[P.P.ROM (~(PUT BY Q.P.ROM) U.REY Q.ROM)] [%STOP U.REY]]
    ==
  ::
  ++  DUCK  (DIAL DOLE)
  --
++  CAIN  SELL                                          ::  $-(VASE TANK)
++  NOAH  TEXT                                          ::  $-(VASE TAPE)
++  ONAN  SEER                                          ::  $-(VISE VASE)
++  TEXT                                                ::  TAPE PRETTY-PRINT
  |=  VAX/VASE  ^-  TAPE
  ~(RAM RE (SELL VAX))
::
++  SEEM  |=(TOY/TYPO `TYPE`TOY)                        ::  PROMOTE TYPO
++  SEER  |=(VIX/VISE `VASE`VIX)                        ::  PROMOTE VISE
::
::  +SELL PRETTY-PRINT A VASE TO A TANK USING `DEAL`.
::
++  SELL
  ~/  %SELL
  |=  VAX/VASE
  ^-  TANK
  ~|  %SELL
  (~(DEAL US P.VAX) Q.VAX)
::
::  +XSELL PRETTY-PRINT A VASE TO A TANK USING `PPRINT`.
::
++  XSELL  |=(V=VASE (VASE-TO-TANK:LIBPPRINT V))
::
::
::  THESE ARE THE PUBLIC TYPES FOR THE `XRAY` LIBRARY.  ANALYSING A TYPE
::  YIELDS AN `XIMAGE`, AND EVERYTHING ELSE HERE IS JUST SOME STRUCTURE
::  WITHIN THAT.
::
::  `XIMAGE`S CAN BE PRINTED AS SPECS (HOON SYNTAX FOR TYPES), AND CAN
::  BE USED TO PRETTY-PRINT TYPED DATA.
::
::  |%
::
::  AN `XTABLE` IS A GRAPH OF TYPES REFERENCED BY THE TOP-LEVEL TYPE,
::  AND THE `ROOT` `KEY` POINTS TO THE NODE WHICH CORRESPONDS TO THE
::  TYPE UNDER ANALYSIS.
::
+$  XIMAGE  [ROOT=XKEY =XTABLE]
::
::  A `XKEY` IS JUST AN IDENTIFIER FOR A NODE IN THE XRAY GRAPH.
::
+$  XKEY  @
::
::  AN `XTABLE` IS THE XRAY GRAPH ITSELF. IT CONTAINS ONE NODE FOR FOR
::  THE TYPE THAT WAS ANALYZED AND ONE NODE FOR EVERY TYPE REFERENCED
::  WITHIN THAT TYPE.
::
::  THE `NEXT` FIELD IS THE THE NEXT AVAILABLE XKEY (USED WHEN INSERTING
::  NEW XRAYS), `XRAYS` MAPS KEYS TO GRAPH NODES AND `TYPE-MAP` GIVES
::  THE XKEY CORRESPONDING TO A TYPE.
::
::  THE `TYPE-MAP` IS BASICALLY JUST THE REVERSE OF THE `XRAYS` MAP. IT
::  DOESN'T CONTAIN ANY NEW INFORMATION, BUT IS NEEDED FOR PERFORMANCE
::  REASONS.
::
+$  XTABLE  [NEXT=XKEY XRAYS=(MAP XKEY XRAY) =TYPE=(MAP TYPE XKEY)]
::
::  AN `XRAY` IS A NODE IN THE `XIMAGE` GRAPH. IT CONTAINS EVERYTHING
::  WE KNOW ABOUT A CERTAIN `TYPE`. `KEY` IS ITS IDENTIFIER IN THE GRAPH,
::  `TYPE` IS THE TYPE THAT IT'S AN XRAY OF, AND `XDAT` IS THE BASIC
::  INFORMATION WE DERIVED ABOUT THE TYPE.  THE BASIC REFERENCES TO OTHER
::  NODES ARE INSIDE THE `XDAT` STRUCTURE, THOUGH SOME OF THE OTHER
::  FIELDS MAY CONTAIN REFERENCES AS WELL.
::
::  - `XSHAPE` IS SOME MORE INFORMATION ABOUT THE XSHAPE OF DATA WITHIN
::     A CELL.
::  - `XROLE` EXPANDS ON `XSHAPE`, ADDING FURTHER INFORMATION ABOUT THE
::     XROLE THAT A NODE HAS WITHIN A FORK.
::  - `PATS` IS USED FOR PRINTING DATA: WE WANT TO KNOW IF THIS TYPE
::    CAN BE PRINTED AS A LIST, AS JSON, AS A TAPE LITERAL, ETC.
::  - `RECIPES` CONTAINS INFORMATION ABOUT HOW A TYPE WAS
::     CONSTRUCTED. IT'S USED TO GET MUCH NICER OUTPUT WHEN PRINTING TYPES.
::  - `STUDS` CONTAINS "STANDARDS NAMES". I ACTUALLY DON'T KNOW WHAT THIS IS.
::  - `HELPS` CONTAINS ALL THE DOCUMENTATION ABOUT A TYPE.
::  - `LOOP` INDICATES WHETHER OR NOT A NODE REFERENCES ITSELF. THE LIST
::    TYPE IS CYCLICAL, FOR EXAMPLE. THIS IS USED WHEN PRINTING AN
::    `XIMAGE`.
::
+$  XRAY
  $:  =XKEY
      =TYPE
      XDAT=(UNIT XDAT)
      XROLE=(UNIT XROLE)
      PATS=(UNIT XPAT)
      STUDS=(SET STUD)
      RECIPES=(SET RECIPE)
      HELPS=(SET HELP)
      XSHAPE=(UNIT XSHAPE)
      LOOP=(UNIT ?)
  ==
::
::  - `%VOID` -- IMPOSSIBLE TO CREATE.
::  - `%NOUN` -- COULD BE ANY NOUN.
::  - `%ATOM` -- AN ATOM OF SOME AURA, POSSIBLY CONSTANT
::  - `%CELL` -- A CELL WITH A HEAD AND A TAIL.
::  - `%CORE` -- A CORE, ITS GARB, ITS CONTEXT TYPE, AND THE TYPES OF
::     EACH OF ITS ARMS.
::  - `%FACE` -- A FACE ON ANOTHER TYPE.
::  - `%FORK` -- COULD BE ONE OR MORE OTHER TYPES.
::  - `%PNTR` -- THIS IS AN INTERNAL HACK, IT SHOULD NEVER SURVIVE
::     ANALYSIS; IGNORE.
::
+$  XDAT
  $@  ?(%NOUN %VOID)
  $%  [%ATOM =AURA CONSTANT=(UNIT @)]
      [%CELL HEAD=XKEY TAIL=XKEY]
      [%CORE =GARB XRAY=XKEY BATT=XBAT]
      [%FACE FACE=$@(TERM TUNE) XRAY=XKEY]
      [%FORK =(SET XKEY)]
      [%PNTR XRAY=XKEY]
  ==
::
::  THE BASIC XSHAPE OF A TYPE:
::
::  - `%VOID` -- IMPOSSIBLE TO CREATE.
::  - `%NOUN` -- COULD BE ANY NOUN.
::  - `%ATOM` -- ALWAYS SOME TYPE OF ATOM; NEVER A CELL
::  - `%CELL` -- ALWAYS SOME TYPE OF CELL; NEVER AN ATOM.
::  - `%JUNC` -- IS A FORK OF A CELL TYPE AND AN ATOM TYPE.
::
+$  XSHAPE  ?(%VOID %NOUN %ATOM %CELL %JUNC)
::
::  A `XROLE` IS THE OF A TYPE, INCLUDING A MORE REFINED UNDERSTANDING
::  OF WHAT XROLE IT PLAYS WITHIN A FORK.
::
::  NODES REFERENCED WITHIN A `XROLE` OFTEN DO NOT ACTUALLY EXIST IN THE
::  ORIGINAL TYPE, SINCE WE NEED TO REORGANIZE FORKS IN ORDER TO MAKE
::  THEM MORE COHERENT.
::
::  - `%VOID` -- IMPOSSIBLE TO CREATE.
::  - `%NOUN` -- COULD BE ANY NOUN.
::  - `%ATOM` -- ALWAYS SOME TYPE OF ATOM; NEVER A CELL
::  - `%CONSTANT` -- A CELL TYPE WHOSE HEAD IS A CONSTANT ATOM.
::  - `%TALL` -- A CELL TYPE WHOSE HEAD IS AN ATOM.
::  - `%WIDE` -- A CELL TYPE WHOSE HEAD IS ALSO A CELL
::  - `%INSTANCE` -- A CELL TYPE WHOSE HEAD IS A CONSTANT ATOM.
::  - `%OPTION` -- A UNION OF TYPES WHICH ARE ALL CONSTANT ATOMS.
::  - `%UNION` -- A UNION OF TYPES WHICH ARE ALL INSTANCES (CELLS WHOSE
::    HEAD IS A CONSTANT ATOM).
::  - `%JUNCTION` -- A UNION OF AN ATOM TYPE AND A CELL TYPE.
::  - `%CONJUNCTION` -- A UNION OF TWO CELL TYPES, ONE OF THEM %WIDE
::     AND THE OTHER %TALL.
::  - `%MISJUNCTION` -- ANY OTHER UNION TYPE. THERE'S NO EFFICIENT WAY
::    TO TELL WHICH BRANCH TO TAKE WHEN ANALYZING A FORK WHICH IS A
::    %MISJUNCTION, AND THE TYPE IS PROBABLY IMPROPERLY CONSTRUCTED.
::
+$  XROLE
  $@  $?  %VOID  %NOUN  %ATOM  %TALL  %WIDE  ==
  $%  [%CONSTANT =ATOM]
      [%INSTANCE =ATOM]
      [%OPTION =(MAP ATOM XKEY)]
      [%UNION =(MAP ATOM XKEY)]
      [%JUNCTION FLAT=XKEY DEEP=XKEY]
      [%CONJUNCTION WIDE=XKEY TALL=XKEY]
      [%MISJUNCTION ONE=XKEY TWO=XKEY]
  ==
::
::  THIS IS JUST A UTILITY TYPE, IT ENCODES THE "BATTERY" STRUCTURE
::  WITHIN A CORE.
::
::  IT'S A MAP FROM CHAPTER NAMES TO THE DOCUMENTATION AND ARMS WITHIN
::  THAT CHAPTER.
::
+$  XBAT  (MAP TERM (PAIR WHAT (MAP TERM XKEY)))
::
::  A RECIPE TELLS US HOW A TYPE WAS CONSTRUCTED.
::
::  - `%DIRECT` IS A SIMPLE TYPE LIKE `TERM`, OR `XRAY`.
::  - `%SYNTHETIC` IS A CONSTRUCTED TYPE, LIKE `(LIST @)`.
::
+$  RECIPE
  $%  [%DIRECT =TERM]
      [%SYNTHETIC =TERM =(LIST XKEY)]
  ==
::
::  A `XPAT` IS HIGH-LEVEL INFORMATION ABOUT THE SHAPE OF A TYPE. THIS
::  IS USED FOR PRINTING DATA.
::
::  THIS IS FAIRLY HEURISTIC. [%A %B %C ~] IS RECOGNIZED AS A `PATH`,
::  `[3 ~[4 5 6]]` IS RECOGNIZED AS A LIST, ETC.
::
::  MOST OF THE XPATS HAVE NAMES THAT MAKE THEIR PURPOSE OBVIOUS:
::  FOR EXAMPLE, THE %TAPE XPAT MEANS THAT DATA OF TYPE TYPE CAN BE
::  PRINTED AS IF IT HAD THE `TAPE` TYPE. HOWEVER, `%GEAR` AND `%GATE`
::  MIGHT NOT BE ENTIRELY OBVIOUS.
::
::  - THE %GEAR XPAT IS ANY CORE WITH A CELL SUBJECT.
::  - THE %GATE XPAT IS A CORE THAT LOOKS LIKE A GATE.
::
+$  XPAT
  $@  ?(%HOON %MANX %JSON %NOCK %PATH %PLUM %SKIN %SPEC %TAPE %TOUR %TYPE %VASE)
  $%  [%GATE SAMPLE=XKEY PRODUCT=XKEY]
      [%GEAR SAMPLE=XKEY CONTEXT=XKEY BATT=XBAT]
      [%LIST ITEM=XKEY]
      [%TREE ITEM=XKEY]
      [%UNIT ITEM=XKEY]
  ==
::
::  LEFT-FOLD OVER A LIST.
::
::  THIS IS `ROLL`, BUT WITH EXPLICIT TYPE PARAMETERS.
::
++  FOLD
   |*  [STATE=MOLD ELEM=MOLD]
   |=  [[ST=STATE XS=(LIST ELEM)] F=$-([STATE ELEM] STATE)]
   ^-  STATE
   |-
   ?~  XS  ST
   =.  ST  (F ST I.XS)
   $(XS T.XS, ST ST)
::
::  THIS IS BASICALLY A `MAPM` OVER A LIST USING THE STATE MONAD.
::
::  ANOTHER WAY TO THINK ABOUT THIS IS THAT IT IS THE SAME AS `TURN`,
::  EXCEPT THAT A STATE VARIABLE `ST` IS THREADED THROUGH THE
::  EXECUTION. THE LIST IS PROCESSED FROM LEFT TO RIGHT.
::
::  THIS IS `SPIN`, BUT WITH EXPLICIT TYPE PARAMETERS.
::
++  TRAVERSE
  |*  [STATE=MOLD IN=MOLD OUT=MOLD]
  |=  [[ST=STATE XS=(LIST IN)] F=$-([STATE IN] [OUT STATE])]
  ^-  [(LIST OUT) STATE]
  ?~  XS  [~ ST]
  =^  R   ST  (F ST I.XS)
  =^  RS  ST  $(XS T.XS, ST ST)
  [[R RS] ST]
::
::  `TRAVERSE` OVER A SET.
::
++  TRAVERSE-SET
  |*  [STATE=MOLD INPUT=MOLD OUT=MOLD]
  |=  [[ST=STATE XS=(SET INPUT)] F=$-([STATE INPUT] [OUT STATE])]
  ^-  [(SET OUT) STATE]
  ::
  =^  ELEMS  ST  ((TRAVERSE STATE INPUT OUT) [ST ~(TAP IN XS)] F)
  :_  ST  (~(GAS IN *(SET OUT)) ELEMS)
::
::  `TRAVERSE` OVER A MAP, ALSO PASSING THE KEY TO THE FOLDING FUNCTION.
::
++  TRAVERSE-MAP
  |*  [STATE=MOLD KEY=MOLD IN=MOLD OUT=MOLD]
  |=  [[ST=STATE DICT=(MAP KEY IN)] F=$-([STATE KEY IN] [OUT STATE])]
  ^-  [(MAP KEY OUT) STATE]
  ::
  =^  PAIRS=(LIST (PAIR KEY OUT))  ST
    %+  (TRAVERSE STATE (PAIR KEY IN) (PAIR KEY OUT))
      [ST ~(TAP BY DICT)]
    |=  [ST=STATE K=KEY X=IN]
    ^-  [(PAIR KEY OUT) STATE]
    =^  V  ST  (F ST K X)
    [[K V] ST]
  ::
  :_  ST
  (~(GAS BY *(MAP KEY OUT)) PAIRS)
::
::  GIVEN A MAP, RETURN ITS INVERSE: FOR EACH VALUE, WHAT ARE THE SET
::  OF ASSOCIATED KEYS?
::
++  REVERSE-MAP
  |*  [KEY=MOLD VAL=MOLD]
  |=  TBL=(MAP KEY VAL)
  =/  INIT  *(MAP VAL (SET KEY))
  ^-  _INIT
  %+  (FOLD _INIT (PAIR KEY VAL))
    [INIT ~(TAP BY TBL)]
  |=  [ACC=_INIT K=KEY V=VAL]
  ^-  _INIT
  =/  MB-KEYS         (~(GET BY ACC) V)
  =/  KEYS=(SET KEY)  ?~(MB-KEYS ~ U.MB-KEYS)
  (~(PUT BY ACC) V (~(PUT IN KEYS) K))
::
++  JSON                                                ::  NORMAL JSON VALUE
  $@  ~                                                 ::  NULL
  $%  {$A P/(LIST JSON)}                                ::  ARRAY
      {$B P/?}                                          ::  BOOLEAN
      {$O P/(MAP @T JSON)}                              ::  OBJECT
      {$N P/@TA}                                        ::  NUMBER
      {$S P/@T}                                         ::  STRING
  ==                                                    ::
::
::
::  # TYPE ANALYSIS
::
::  THIS DOES ANALYSIS ON TYPES TO PRODUCE AN `XIMAGE` VALUE, WHICH CAN
::  BE USED TO PRINT THE TYPE (WITH `XIMAGE-TO-SPEC`) OR TO PRINT VALUES
::  OF THAT TYPE (USING THE `LIBPPRINT` LIBRARY).  YOU SHOULD UNDERSTAND
::  THE `XIMAGE` TYPE BEFORE DIGGING FURTHER.
::
::  `XRAY-TYPE` IS THE MAIN GATE OF INTEREST HERE. IT'S IMPLEMENTED AS A
::  SERIES OF PASSES:
::
::  - `ANALYZE-TYPE`: THIS TAKES A `TYPE`, WHICH IS A LAZILY-EVALUATED,
::     RECURSIVE XDAT STRUCTURE, AND CONVERTS IT INTO AN EXPLICIT
::     GRAPH. IT ALSO COLLECT THE INFORMATION FROM `%HINT` TYPES AND
::     DECORATES THE GRAPH NODES WITH THAT.
::
::  - `CLEANUP`: REMOVES `%PNTR` NODES, REPLACING REFERENCES TO THEM
::    WITH REFERENCES TO WHAT THEY RESOLVE TO.
::
::  - `DECORATE-XIMAGE-WITH-LOOPS`: DETERMINES WHICH NODES REFERENCE
::    THEMSELVES RECURSIVELY.
::
::  - `DECORATE-XIMAGE-WITH-XPATS`: ADDS PRINTING HEURISTICS TO TYPES:
::    "SHOULD THIS BE PRINTED AS A LIST?"
::
::  - `DECORATE-XIMAGE-WITH-XSHAPES`: DETERMINES THE LOOSE SHAPE OF EACH
::    TYPE. THIS OVERLAPS WITH, AND IS USED BY, THE NEXT PASS. DOING
::    THIS AS A SEPARATE PASS REMOVES A LOT OF DIFFICULT EDGE-CASES WHEN
::    DETERMINING THE `XROLE` OF CELL-TYPES.
::
::  - `DECORATE-XIMAGE-WITH-XROLES`: RESTRUCTURES FORKS TO MAKE THEM
::    COHERENT. THIS IS IMPORTANT BOTH FOR PRINTING TYPES (WE WANT TO USE
::    `$@` `$%` `$%`, ETC) AND FOR PRINTING XDAT (WE NEED AN EFFICIENT
::    WAY TO DETERMINE WHICH BRANCH OF A FORK MATCHES A VALUE.
::
::  # TODOS
::
::  - XX IT SEEMS (HAVE'NT VERIFIED THIS) THAT THERE'S A LOT OF THINGS
::    THAT ARE FORKS THAT, ONCE VOID TYPES HAVE BEEN FACTORED OUT,
::    ONLY ACTUALLY REFER TO ONE THING. IT WOULD BE NICE TO DISCOVER
::    THINGS OF THIS KIND AND REPLACE SUCH FORK NODE WITH THE THING THE
::    ACTUALY RESOLVE TO.
::
::    THE REASON I THINK THIS IS WHAT'S HAPPENING IS THAT I SEE LOTS
::    OF %UNEXPECTED-FORK-XROLE MESSAGES WHEN CONVERTING THE KERNEL TYPE
::    TO A SPEC, AND THOSE XROLES HAVE THINGS LIKE %TALL AND %ATOM.
::    HOWEVER! THE `COMBINE` FUNCTION NEVER PRODUCES ANYTHING WITH
::    THOSE XROLES.
::
::  - XX CREATE XPATS AND MATCHERS %MAP %SET.
::
::  - XX CREATE XPATS AND MATCHERS FOR TUPLES. THERE'S NO NEED TO
::    RECREATE THIS STRUCTURE IN THE PRINTING CODE, AND THAT'S WHAT WE'RE
::    DOING NOW.
::
::  - XX THE XPAT OF AN XRAY COULD BE COMPUTED ON DEMAND INSTEAD OF
::    UP-FRONT. POSSIBLY A LOT FASTER!
::
::  - XX THE LOOP-DETECTION OF AN XRAY COULD BE DONE ON DEMAND INSTEAD
::    OF UP-FRONT. POSSIBLY A LOT FASTER!
::
::  - XX THE XPAT MATCHING CODE IS BASICALLY BRUTE-FORCE.
::
::    IF IT TURNS OUT TO BE A PERFORMANCE BOTTLENECK, THERE'S LOTS OF
::    LOW-HANGING FRUIT THERE. FOR EXAMPLE:
::
::    - FACES REPEAT THE WORK DONE FOR THE TYPE THEY REFERENCE.
::    - WHEN DETECTING WHETHER A CELL IS PART OF AN "INFORMAL" LIST,
::      WE RECURSE INTO THE TAIL REPEATEDLY. FOR EXAMPLE, THE FOLLOWING
::      EXAMPLE WILL DO THE "FORMAL-LIST" TEST 3 TIMES:
::
::      - `[1 2 `(LIST @)`~]`
::
::  - XX TRY TO FIND A WAY TO DROP THE `%PNTR` CONSTRUCTOR FROM
::    `%XDAT`. THE CONSUMER OF AN `XRAY` DOES NOT CARE.
::
::  - XX ACTUALLY, IT WOULD ALSO BE REALLY NICE TO PRODUCE ANOTHER
::    VERSION OF THIS STRUCTURE THAT DOESN'T HAVE THE (UNIT *) WRAPPER AROUND
::    EVERYTHING INTERESTING. THIS WOULD MAKE THE ON-DEMAND COMPUTATION
::    OF VARIOUS THINGS HARD, THOUGH.
::
::  - XX SIMPLY LYING ABOUT THE TYPE OF DEEP ARMS IS NOT ROBUST. I AM JUST
::    CLAIMING THAT THEY ARE NOUNS, BUT IF ANOTHER THING IN THE XRAY
::    ACTUALLY NEEDS IT, IT WILL THINK IT'S A NOUN TOO.
::
::  - XX THERE ARE PROBABLY REMAINING BUGS. TEST THE SHIT OUT OF THIS.
::
::  - XX WHAT SHOULD THE `XROLE` OF A CELL WITH A %NOUN HEAD BE? I
::    THINK THE CURRENT DESIGN CAN'T HANDLE THIS CASE COHERENTLY.
::
++  LIBXRAY
  ::
  |^  ^-  $:  XIMAGE-TO-SPEC=$-(=XIMAGE =SPEC)
              XRAY-TYPE=$-([@ TYPE] XIMAGE)
              FOCUS-ON=$-([XTABLE XKEY] XRAY)
          ==
      [XIMAGE-TO-SPEC XRAY-TYPE FOCUS-ON]
  ::
  +|  %HELPERS
  ::
  +*  BATT-OF  [ARM]  (MAP TERM (PAIR WHAT (MAP TERM ARM)))
  +*  CHAP-OF  [ARM]  [DOC=WHAT ARMS=(MAP TERM ARM)]
  ::
  ::  TRAVERSE OVER A CHAPTER IN A BATTERY.
  ::
  ++  TRAVERSE-CHAPTER
    |*  [STATE=MOLD IN=MOLD OUT=MOLD]
    |=  [[ST=STATE CHAP=(CHAP-OF IN)] F=$-([STATE TERM IN] [OUT STATE])]
    ^-  [(CHAP-OF OUT) STATE]
    =^  ARMS  ST  ((TRAVERSE-MAP STATE TERM IN OUT) [ST ARMS.CHAP] F)
    [CHAP(ARMS ARMS) ST]
  ::
  ::  TRAVERSE OVER A BATTERY.
  ::
  ++  TRAVERSE-BATTERY
    |*  [STATE=MOLD IN=MOLD OUT=MOLD]
    |=  [[ST=STATE BATT=(BATT-OF IN)] F=$-([STATE TERM IN] [OUT STATE])]
    ^-  [(BATT-OF OUT) STATE]
    %+  (TRAVERSE-MAP STATE TERM (CHAP-OF IN) (CHAP-OF OUT))
      [ST BATT]
    |=  [ST=STATE CHAPTER-NAME=TERM CHAP=(CHAP-OF IN)]
    ^-  [(CHAP-OF OUT) STATE]
    ((TRAVERSE-CHAPTER STATE IN OUT) [ST CHAP] F)
  ::
  ::  MAP A FUNCTION OVER ALL THE ARMS IN A BATTERY.
  ::
  ++  TURN-BATTERY
    |*  ARM=MOLD
    |=  [B=(BATT-OF ARM) F=$-(ARM ARM)]
    ^-  (BATT-OF ARM)
    %-  ~(RUN BY B)
    |=  [W=WHAT CHAP=(MAP TERM ARM)]
    ^-  [WHAT (MAP TERM ARM)]
    :-  W
    %-  ~(RUN BY CHAP)
    |=  I=ARM
    ^-  ARM
    (F I)
  ::
  ::  CREATE A NEW XRAY WITH `XDAT` SET TO `D`. IF THE XRAY IS ALREADY IN
  ::  THE TABLE, DO NOTHING.
  ::
  ++  POST-XRAY
    |=  [TBL=XTABLE TY=TYPE D=(UNIT XDAT)]
    ^-  [XKEY XTABLE]
    ::
    =/  OLD  (~(GET BY TYPE-MAP.TBL) TY)
    ?^  OLD  [U.OLD TBL]
    ::
    =/  I=XKEY  NEXT.TBL
    =/  X=XRAY  [I TY D ~ ~ ~ ~ ~ ~ ~]
    ::
    =.  NEXT.TBL      +(NEXT.TBL)
    =.  XRAYS.TBL     (~(PUT BY XRAYS.TBL) I X)
    =.  TYPE-MAP.TBL  (~(PUT BY TYPE-MAP.TBL) TY I)
    [I TBL]
  ::
  ::  CREATE AN NEW XRAY AND PUT IT IN THE XRAY TABLE. IF THERE'S ALREADY
  ::  A STUB XRAY UNDER THIS TYPE, REPLACE IT.  OTHERWISE, ALLOCATE A
  ::  NEW INDEX AND PUT IT THERE.
  ::
  ++  REPLACE-XRAY
    |=  [IMG=XTABLE X=XRAY]
    ^-  XTABLE
    IMG(XRAYS (~(PUT BY XRAYS.IMG) XKEY.X X))
  ::
  ::  GET AN XRAY, UPDATE ITS XDAT, AND PUT IT BACK IN.
  ::
  ++  SET-XRAY-XDAT
    |=  [IMG=XTABLE I=XKEY D=XDAT]
    ^-  XTABLE
    =/  X=XRAY  (FOCUS-ON IMG I)
    (REPLACE-XRAY IMG X(XDAT `D))
  ::
  ::  GET AN XRAY FROM AN `XTABLE`, GIVEN ITS `XKEY`.
  ::
  ++  FOCUS-ON
    |=  [IMG=XTABLE I=XKEY]
    ^-  XRAY
    =/  RES=(UNIT XRAY)  (~(GET BY XRAYS.IMG) I)
    ?~  RES  ~&  ['INTERNAL ERROR: INVALID XRAY REFERENCE' I]  !!
    U.RES
  ::
  ::  RETURN A LIST OF XRAYS REFERENCED BY AN XRAYED BATTERY. (THE CONTEXT
  ::  TYPE AND THE TYPE OF EACH ARM).
  ::
  ++  BATTERY-REFS
    |=  B=XBAT
    ^-  (LIST XKEY)
    %-  ZING
    %+  TURN  ~(VAL BY B)
    |=  [=WHAT =(MAP TERM XKEY)]
    ^-  (LIST XKEY)
    ~(VAL BY MAP)
  ::
  ::  JUST FOR DEBUGGING: PRINT AN XIMAGE AND THEN RETURN IT.
  ::
  ++  TRACE-XIMAGE
    |=  IMG=XIMAGE
    ^-  XIMAGE
    ~&  ['ROOT=' ROOT.IMG]
    ~&  %+  SORT  ~(TAP BY XRAYS.XTABLE.IMG)
        |=  [[XI=XKEY X=XRAY] [YI=XKEY Y=XRAY]]
        (LTH XI YI)
    IMG
  ::
  ::  ALL NON-FORK XRAYS REFERENCED BY A FORK XRAY. THIS WILL RECURSE
  ::  INTO FORKS-OF-FORKS (AND SO ON) AND CAN HANDLE INFINITE FORKS.
  ::
  ::  IF THIS IS CALLED ON A NON-FORK NODE, IT WILL RETURN A SET WITH JUST
  ::  THAT ONE NODE IN IT.
  ::
  ::  SEPARATING THIS OUT REALLY SIMPLIFIES THINGS, WITHOUT THIS HANDLING
  ::  INFINITE FORKS IS QUITE ERROR-PRONE.
  ::
  ::  XX SHOULD WE COLLECT FACE NODES INSTEAD OF RECURSING INTO THEM (FEELS
  ::  LIKE YES, BUT WHY DID I DO IT THE OTHER WAY BEFORE)?
  ::
  ::  XX THIS IS TURNING OUT TO BE USEFUL. SHOULD WE ADD A FIELD TO CACHE
  ::  THE RESULT OF THIS?
  ::
  ++  XRAY-BRANCHES
    |=  [IMG=XTABLE I=XKEY]
    ^-  (SET XKEY)
    ::
    =/  ACC=(SET XKEY)  ~
    =/  STK=(SET XKEY)  ~
    ::
    |-  ^-  (SET XKEY)
    ::
    ?:  (~(HAS IN ACC) I)  ACC
    ?:  (~(HAS IN STK) I)  ACC
    ::
    =.  STK  (~(PUT IN STK) I)
    ::
    =/  X=XRAY  (FOCUS-ON IMG I)
    =/  D=XDAT  (NEED XDAT.X)
    ::
    ?-  D
      %NOUN      (~(PUT IN ACC) I)
      %VOID      (~(PUT IN ACC) I)
      [%ATOM *]  (~(PUT IN ACC) I)
      [%CELL *]  (~(PUT IN ACC) I)
      [%CORE *]  (~(PUT IN ACC) I)
      [%FACE *]  $(I XRAY.D)
      [%PNTR *]  $(I XRAY.D)
      [%FORK *]  %+  (FOLD (SET XKEY) XKEY)
                   [ACC ~(TAP IN SET.D)]
                 |=  [=(SET XKEY) =XKEY]
                 ^$(ACC SET, I XKEY)
    ==
  ::
  +|  %ENTRY-POINT
  ::
  ::  THE TOP-LEVEL ROUTINE: TAKES A TYPE, AND XRAYS IT TO PRODUCE AN
  ::  XIMAGE.
  ::
  ::  WHEN WE ANALYZE A CORE, WE ALSO ANALYZE ITS CONTEXT. `CORE-DEPTH`
  ::  CONTROLS HOW DEEPLY WE WILL DIG INTO THE CONTEXT. WITH `CORE-DEPTH`
  ::  AT 0, WE JUST PRETEND THAT ALL CORES HAVE A CONTEXT OF TYPE `*`.
  ::
  ++  XRAY-TYPE
    |=  [CORE-DEPTH=@ =TYPE]
    ^-  XIMAGE
    ::  ~&  %ANALYZE-TYPE
    =/  =XIMAGE  (ANALYZE-TYPE CORE-DEPTH TYPE)
    ::  ~&  %CLEANUP
    =.  XIMAGE  (CLEANUP XIMAGE)
    ::  ~&  %DECORATE-XIMAGE-WITH-LOOPS
    =.  XIMAGE  (DECORATE-XIMAGE-WITH-LOOPS XIMAGE)
    ::  ~&  %DECORATE-XIMAGE-WITH-XPATS
    =.  XIMAGE  (DECORATE-XIMAGE-WITH-XPATS XIMAGE)
    ::  ~&  %DECORATE-XIMAGE-WITH-XSHAPES
    =.  XIMAGE  (DECORATE-XIMAGE-WITH-XSHAPES XIMAGE)
    ::  ~&  %TRACE-XIMAGE
    ::  =.  XIMAGE  (TRACE-XIMAGE XIMAGE)
    ::  ~&  %DECORATE-XIMAGE-WITH-XROLES
    (DECORATE-XIMAGE-WITH-XROLES XIMAGE)
    ::  ~&  %TRACE-XIMAGE
    ::  (TRACE-XIMAGE XIMAGE)
  ::
  +|  %ANALYSIS-PASSES
  ::
  ::  THE MAIN ANALYSIS CODE.
  ::
  ::  FOR EVERY TYPE WE ENCOUNTER,
  ::
  ::  - FIRST CHECK IF AN XRAY FOR THIS HAS ALREADY BEEN CREATED. THIS
  ::    COULD EITHER BE A RECURSIVE REFERENCE OR JUST SOMETHING WE'VE
  ::    ALREADY PROCESSED. AT THIS POINT WE DON'T CARE.
  ::
  ::  - NEXT, ALLOCATE A NEW XRAY FOR THIS TYPE WITH EMPTY XDAT. IF
  ::    WE ENCOUNTER THIS TYPE AGAIN RECURSIVELY, THAT'S FINE, THAT WILL
  ::    JUST PRODUCE A REFERENCE TO THIS XRAY AND IT WILL EVENTUALLY
  ::    HAVE XDAT.
  ::
  ::  - NEXT, RECURSE INTO ALL REFERENCED TYPES AND BUILD OUT GRAPH
  ::    NODES FOR THOSE.
  ::
  ::  - FINALLY, CREATE `XDAT` BASED ON THE ABOVE, AND UPDATE THE XRAY
  ::    TO HAVE THAT XDAT.
  ::
  ::  - THE TWO EDGE-CASES HERE ARE %HINT AND %HOLD. FOR THOSE, WE SIMPLY
  ::    DO EVERYTHING IN EXACTLY THE SAME WAY EXCEPT THAT `XDAT`
  ::    WILL BE SET TO `[%PNTR *]`. WE WILL RESOLVE ALL OF THESE
  ::    REFERENCES IN THE FIRST ANALYSIS PASS (`CLEANUP`).
  ::
  ++  ANALYZE-TYPE
    |=  [CORE-DEPTH=@UD =TOP=TYPE]
    ^-  XIMAGE
    ::
    |^  (MAIN [0 ~ ~] TOP-TYPE)
    ::
    ++  MAIN
      |=  [ST=XTABLE TY=TYPE]
      ^-  [XKEY XTABLE]
      ::
      =/  OLD  (~(GET BY TYPE-MAP.ST) TY)             ::  ALREADY DONE
      ?^  OLD  [U.OLD ST]
      ::
      =^  RES=XKEY  ST  (POST-XRAY ST TY ~)
      ::
      :-  RES
      ?-  TY
        %VOID      (SET-XRAY-XDAT ST RES %VOID)
        %NOUN      (SET-XRAY-XDAT ST RES %NOUN)
        [%ATOM *]  (SET-XRAY-XDAT ST RES TY)
        [%CELL *]  =^  HED=XKEY  ST  (MAIN ST P.TY)
                   =^  TYL=XKEY  ST  (MAIN ST Q.TY)
                   (SET-XRAY-XDAT ST RES [%CELL HED TYL])
        [%CORE *]  =^  D=XDAT   ST  (XRAY-CORE [P.TY Q.TY] ST)
                   (SET-XRAY-XDAT ST RES D)
        [%FACE *]  =^  I=XKEY  ST  (MAIN ST Q.TY)
                   (SET-XRAY-XDAT ST RES [%FACE P.TY I])
        [%FORK *]   =^  BR  ST  ((TRAVERSE-SET XTABLE TYPE XKEY) [ST P.TY] MAIN)
                   (SET-XRAY-XDAT ST RES [%FORK BR])
        [%HINT *]  =^  REF      ST  (MAIN ST Q.TY)
                   =^  UPDATED  ST  (HINT ST P.TY (FOCUS-ON ST RES))
                   (SET-XRAY-XDAT (REPLACE-XRAY ST UPDATED) RES [%PNTR REF])
        [%HOLD *]  =^  REF  ST  (MAIN ST ~(REPO UT TY))
                   (SET-XRAY-XDAT ST RES [%PNTR REF])
      ==
    ::
    ::  ANALYZE A %HINT TYPE.
    ::
    ::  THIS UPDATES THE `HELPS`, `STUDS`, AND/OR `RECIPE` FIELDS OF THE
    ::  GIVEN XRAY.
    ::
    ++  HINT
      |=  [ST=XTABLE [SUBJECT-OF-NOTE=TYPE =NOTE] X=XRAY]
      ^-  [XRAY XTABLE]
      ?-  -.NOTE
        %HELP  :_  ST  X(HELPS (~(PUT IN HELPS.X) P.NOTE))
        %KNOW  :_  ST  X(STUDS (~(PUT IN STUDS.X) P.NOTE))
        %MADE  =^  RECIPE  ST
                 ?~  Q.NOTE  [[%DIRECT P.NOTE] ST]
                 =^  PARAMS=(LIST XKEY)  ST
                   |-  ^-  [(LIST XKEY) XTABLE]
                   ?~  U.Q.NOTE  [~ ST]
                   =/  TSLD  [%TSLD [%LIMB %$] [%WING I.U.Q.NOTE]]
                   =/  PART  (~(PLAY UT SUBJECT-OF-NOTE) TSLD)
                   =^  THIS  ST  (MAIN ST PART)
                   =^  MORE  ST  $(U.Q.NOTE T.U.Q.NOTE)
                   [[THIS MORE] ST]
                 [[%SYNTHETIC P.NOTE PARAMS] ST]
               :_  ST  X(RECIPES (~(PUT IN RECIPES.X) RECIPE))
      ==
    ::
    ::  ANALYZE A CORE.
    ::
    ::  WHEN WE ANALYZE THE CONTEXT, WE DECREMENT `CORE-DEPTH`. IF THAT
    ::  EVER HITS ZERO, WE SUBSTITUTE `%NOUN` FOR THE TYPE OF THE CONTEXT.
    ::
    ::  THE REASON THAT WE SWITCH THE VARIANCE TO %GOLD IS BECAUSE THE
    ::  CORE WE'RE CREATING ISN'T AN ACTUAL CORE, WE'RE JUST USING THE ARMS
    ::  OF THIS CORE AS A NAMESPACE IN WHICH TO EVALUATE EACH ARM.
    ::
    ::  ALSO, IN GENERAL, THERE'S NO WAY TO DETERMINE THE TYPE OF AN ARM
    ::  OF A WET CORE, SO WE JUST ASSIGN ALL WET ARMS THE TYPE `%NOUN`.
    ::
    ::  THIS SEEMS TO WORK IN PRACTICE, BUT I DON'T THINK IT'S ACTUALLY
    ::  SOUND.
    ::
    ++  XRAY-CORE
      |=  [[=PAYLOAD=TYPE =COIL] ST=XTABLE]
      ^-  [XDAT XTABLE]
      ::
      =^  PAYLOAD-XKEY  ST  (MAIN ST PAYLOAD-TYPE)
      =/  CTX=TYPE  [%CORE PAYLOAD-TYPE COIL(R.P %GOLD)]
      ::
      =^  BATT  ST
        %+  (TRAVERSE-BATTERY XTABLE HOON XKEY)
          [ST Q.R.COIL]
        |=  [ST=XTABLE NM=TERM =HOON]
        ^-  [XKEY XTABLE]
        ?:  =(%WET Q.P.COIL)  (POST-XRAY ST %NOUN `%NOUN)
        ?:  =(0 CORE-DEPTH)   (POST-XRAY ST %NOUN `%NOUN)
        =.  CORE-DEPTH        (DEC CORE-DEPTH)
        (MAIN ST [%HOLD CTX HOON])
      ::
      [[%CORE P.COIL PAYLOAD-XKEY BATT] ST]
    ::
    --
  ::
  ::  REMOVE `%PNTR` NODES, REPLACING REFERENCES TO THEM WITH REFERENCES
  ::  TO WHAT THEY RESOLVE TO.
  ::
  ::  1. BUILD A LIST OF REACHABLE, NON-REFERENCE NODES.
  ::  2. BUILD A TABLE OF REFERENCES MAPPED TO THE NODE THEY RESOLVE TO.
  ::  3. IF THE ROOT NODE IS A POINTER, REPLACE IT WITH WHAT IT REFERENCES.
  ::  4. MAP OVER `TYPE-MAP`, AND REPLACE EVERY VALUE USING THE TABLE FROM #2.
  ::  5. MAP OVER THE XRAYS, DROP POINTER NODES, REPLACE EVERY REFERENCE
  ::     USING THE TABLE FROM #2.
  ::
  ++  CLEANUP
    |=  XT=XIMAGE
    ^-  XIMAGE
    ::
    =/  IMG=XTABLE  XTABLE.XT
    ::
    |^  =/  =XKEY          ROOT.XT
        ::  ~&  %BUILD-TABLE
        =/  TBL           (BUILD-TABLE XKEY)
        ::  ~&  %FIX-XKEY
        =.  XKEY           (FIX-XKEY TBL XKEY)
        ::  ~&  %FIX-TYPE-MAP
        =.  TYPE-MAP.IMG  (FIX-TYPE-MAP TBL TYPE-MAP.IMG)
        ::  ~&  %FIX-XRAYS
        =.  XRAYS.IMG     (FIX-XRAYS TBL XRAYS.IMG)
        ::  ~&  :*  %GC-RESULTS
        ::          %BEFORE  ~(WYT BY XRAYS.XTABLE.XT)
        ::          %AFTER   ~(WYT BY XRAYS.IMG)
        ::      ==
        [XKEY IMG]
    ::
    +$  TABLE
      [LIVE=(SET XKEY) REFS=(MAP XKEY XKEY) REFS-TO=(MAP XKEY (SET XKEY))]
    ::
    ::  GIVEN A NODE THAT MAY BE A POINTER, FOLLOW THE CHAIN OF POINTERS
    ::  UNTIL WE FIND A NON-POINTER NODE.
    ::
    ++  DEREF
      |=  [IMG=XTABLE K=XKEY]
      ^-  XKEY
      |-
      =/  X=XRAY  (FOCUS-ON IMG K)
      =/  D=XDAT  (NEED XDAT.X)
      ?.  ?=([%PNTR *] D)  XKEY.X
      $(K XRAY.D)
    ::
    ::  WALKS THE GRAPH STARTING AT THE ROOT, EVERYTHING THAT'S A %PNTR
    ::  NODE BECOMES A XKEY IN THE `REFS` TABLE AND ONE OF THE VALUES IN THE
    ::  `REFS-TO` TABLE.
    ::
    ++  BUILD-TABLE
      |^  |=  K=XKEY
          ^-  TABLE
          =/  T=TABLE    [~ ~ ~]
          =.  T          (RECUR T K)
          =.  REFS-TO.T  ((REVERSE-MAP XKEY XKEY) REFS.T)
          T
      ::
      ++  RECUR
        |=  [ACC=TABLE K=XKEY]
        ^-  TABLE
        ::
        ?:  (~(HAS IN LIVE.ACC) K)  ACC                 ::  ALREADY PROCESSED
        ?:  (~(HAS BY REFS.ACC) K)  ACC                 ::  ALREADY PROCESSED
        ::
        =/  X=XRAY  (FOCUS-ON IMG K)
        =/  D=XDAT  (NEED XDAT.X)
        ::
        =.  ACC  ?.  ?=([%PNTR *] D)
                   ACC(LIVE (~(PUT IN LIVE.ACC) K))
                 ACC(REFS (~(PUT BY REFS.ACC) K (DEREF IMG K)))
        ::
        ((FOLD TABLE XKEY) [ACC (XRAY-REFS K)] RECUR)
      --
    ::
    ::  REBUILD `TYPE-MAP`:
    ::
    ::  - IF A TYPE POINTS TO A POINTER XRAY, UPDATE IT TO POINT TO WHAT
    ::    THAT POINTER RESOLVES TO
    ::  - IF THE TYPE ISN'T REFERENCED FROM THE ROOT NODE, IGNORE IT.
    ::  - OTHERWISE, JUST COPY IT INTO THE RESULTING TABLE AS-IS.
    ::
    ++  FIX-TYPE-MAP
      |=  [TBL=TABLE =(MAP TYPE XKEY)]
      ^-  _MAP
      %+  (FOLD _MAP (PAIR TYPE XKEY))
        [*_MAP ~(TAP BY MAP)]
      |=  [ACC=_MAP [TY=TYPE K=XKEY]]
      =/  DEST  (~(GET BY REFS.TBL) K)
      ?^  DEST  (~(PUT BY ACC) TY U.DEST)
      ?.  (~(HAS IN LIVE.TBL) K)  ACC
      (~(PUT IN ACC) TY K)
    ::
    ::  REBUILD THE `XRAYS` TABLE.
    ::
    ::  - IF THE XRAY ISN'T IN THE `LIVE` SET (IT WONT BE THERE IF IT'S
    ::    A POINTER NODE OR IF IT'S INACCESSIBLE FROM THE ROOT NODE),
    ::    THEN IGNORE IT.
    ::  - OTHERWISE, COPY THE XRAY INTO THE RESULT MAP WHILE UPDATING
    ::    ALL ITS REFERENCES.
    ::
    ++  FIX-XRAYS
      |=  [TBL=TABLE XRAYS=(MAP XKEY XRAY)]
      ^-  _XRAYS
      %+  (FOLD (MAP XKEY XRAY) (PAIR XKEY XRAY))
        [*(MAP XKEY XRAY) ~(TAP BY XRAYS)]
      |=  [ACC=(MAP XKEY XRAY) [I=XKEY X=XRAY]]
      ?.  (~(HAS IN LIVE.TBL) I)  ACC                   ::  DROP UNUSED XRAYS
      (~(PUT BY ACC) I (FIX-XRAY TBL X))
    ::
    ::  ALL THE XRAYS WHICH ARE SIMPLY REFERENCES TO `I`.
    ::
    ++  ALL-REFS-TO
      |=  [TBL=TABLE I=XKEY]
      ^-  (SET XKEY)
      =/  RES  (~(GET BY REFS-TO.TBL) I)
      ?~(RES ~ U.RES)
    ::
    ::  THERE MAY BE `%HINT` XDAT ON THE `%PNTR` XRAYS. FIND ALL POINTER
    ::  NODES THAT REFERENCE THIS ONE, AND PUT ALL OF THEIR HINT-XDAT ONTO
    ::  THIS XRAY.
    ::
    ++  COLLECT-HINTS
      |=  [TBL=TABLE TARGET=XRAY]
      ^-  XRAY
      %+  (FOLD XRAY XKEY)
        [TARGET ~(TAP IN (ALL-REFS-TO TBL XKEY.TARGET))]
      |=  [ACC=XRAY REF=XKEY]
      =/  REF-XRAY=XRAY  (FOCUS-ON IMG REF)
      =/  HELPS    ^-  (SET HELP)    (~(UNI IN HELPS.ACC) HELPS.REF-XRAY)
      =/  RECIPES  ^-  (SET RECIPE)  (~(UNI IN RECIPES.ACC) RECIPES.REF-XRAY)
      ::
      =/  STUDS    ^-  (SET STUD)                       ::  TYPE SYSTEM HACK
                   %+  (FOLD (SET STUD) STUD)
                     [STUDS.ACC ~(TAP IN STUDS.REF-XRAY)]
                   |=  [ACC=(SET STUD) NEW=STUD]
                   (~(PUT IN ACC) NEW)
      ::
      ACC(HELPS HELPS, STUDS STUDS, RECIPES RECIPES)
    ::
    ::  NOTE THAT THE `XROLES` AND `PATS` FIELDS MAY CONTAIN REFERENCES
    ::  TO OTHER XRAYS AS WELL. WE DON'T BOTHER TO UPDATE THOSE, BECAUSE THIS
    ::  PASS RUNS BEFORE THOSE FIELDS ARE POPULATED.
    ::
    ++  FIX-XRAY
      |=  [TBL=TABLE X=XRAY]
      ^-  XRAY
      =.  X  (COLLECT-HINTS TBL X)
      %=  X
        XDAT     `(FIX-XDAT TBL (NEED XDAT.X))
        RECIPES  %-  ~(GAS IN *(SET RECIPE))
                 %+  TURN  ~(TAP IN RECIPES.X)
                 |=  R=RECIPE  (FIX-RECIPE TBL R)
      ==
    ::
    ::  UPDATE ALL THE REFERENCES IN THE `XDAT` FIELD.
    ::
    ++  FIX-XDAT
      |=  [TBL=TABLE D=XDAT]
      ^-  XDAT
      ::
      =/  FIX  |=(I=XKEY (FIX-XKEY TBL I))
      ::
      ?-  D
        %NOUN      D
        %VOID      D
        [%ATOM *]  D
        [%CELL *]  D(HEAD (FIX HEAD.D), TAIL (FIX TAIL.D))
        [%CORE *]  D(XRAY (FIX XRAY.D), BATT (FIX-BATTERY TBL BATT.D))
        [%FACE *]  D(XRAY (FIX XRAY.D))
        [%FORK *]  D(SET (~(GAS IN *(SET XKEY)) (TURN ~(TAP IN SET.D) FIX)))
        [%PNTR *]  D(XRAY (FIX XRAY.D))
      ==
    ::
    ++  FIX-BATTERY
      |=  [TBL=TABLE B=XBAT]
      ^-  XBAT
      %+  (TURN-BATTERY XKEY)  B
      |=  I=XKEY  (FIX-XKEY TBL I)
    ::
    ++  FIX-XKEY
      |=  [TBL=TABLE I=XKEY]
      ^-  XKEY
      =/  RES=(UNIT XKEY)  (~(GET BY REFS.TBL) I)
      ?^  RES  U.RES
      I
    ::
    ++  FIX-RECIPE
      |=  [TBL=TABLE R=RECIPE]
      ^-  RECIPE
      ?-  R
        [%DIRECT *]     R
        [%SYNTHETIC *]  R(LIST (TURN LIST.R |=(I=XKEY (FIX-XKEY TBL I))))
      ==
    ::
    ++  XRAY-REFS
      |=  I=XKEY
      ^-  (LIST XKEY)
      =/  X=XRAY  (FOCUS-ON IMG I)
      %-  ZING
      ^-  (LIST (LIST XKEY))
      :~  ?~(XDAT.X ~ (XDAT-REFS U.XDAT.X))
          (ZING (TURN ~(TAP IN RECIPES.X) RECIPE-REFS))
          ?~(XROLE.X ~ (XROLE-REFS U.XROLE.X))
      ==
    ::
    ++  RECIPE-REFS
      |=  R=RECIPE
      ^-  (LIST XKEY)
      ?-  R
        [%DIRECT *]     ~
        [%SYNTHETIC *]  LIST.R
      ==
    ::
    ++  XROLE-REFS
      |=  S=XROLE
      ^-  (LIST XKEY)
      ?@  S  ~
      ?-  -.S
        %CONSTANT     ~
        %INSTANCE     ~
        %OPTION       ~(VAL BY MAP.S)
        %UNION        ~(VAL BY MAP.S)
        %JUNCTION     ~[FLAT.S DEEP.S]
        %CONJUNCTION  ~[WIDE.S TALL.S]
        %MISJUNCTION  ~[ONE.S TWO.S]
      ==
    ::
    ++  XDAT-REFS
      |=  D=XDAT
      ^-  (LIST XKEY)
      ?-  D
        %NOUN      ~
        %VOID      ~
        [%ATOM *]  ~
        [%CELL *]  ~[HEAD.D TAIL.D]
        [%CORE *]  [XRAY.D (BATTERY-REFS BATT.D)]
        [%FACE *]  ~[XRAY.D]
        [%PNTR *]  ~[XRAY.D]
        [%FORK *]  ~(TAP IN SET.D)
      ==
    --
  ::
  ::  DETECT LOOPS.
  ::
  ::  THIS WORKS BY SIMPLY RECURSING THROUGH ALL THE REFERENCES WITHIN AN
  ::  XRAY WHILE KEEPING AN EXPLICIT RECURSION STACK: IF WE HIT A NODE
  ::  THAT'S IN THE STACK, THAT'S A LOOP. IF WE TOUCH EVERYTHING WITHOUT
  ::  HITTING A RECURSIVE REFERENCE, THEN IT'S NOT A LOOP.
  ::
  ::  IS THE SHORT-CIRCUITING SOUND? I'M NOT SURE NOW.
  ::
  ::    - WHEN COULD IT GO WRONG?
  ::    - THIS GRAPH, FOR EXAMPLE:
  ::
  ::      ```
  ::      X -> Y
  ::      Y -> Z
  ::      Y -> Y
  ::      Z -> X
  ::      ```
  ::
  ::    - LET'S SAY WE PROCESS THIS STARTING WITH Y, WE WILL SEE THAT `Y`
  ::      IS A LOOP, AND THEN WHEN WE GO TO PROCESS X, RECURSING INTO Y WILL BE
  ::      SHORT-CIRCUITED SINCE ITS `LOOP` FIELD IS ALREADY SET.
  ::
  ::    - WELL, MAYBE `X` WILL HAVE BEEN RECOGNIZED AS A LOOP DURING THE
  ::      PROCESSING OF `X`? I THINK IT DEPENDS ON WHETHER WE CONTINUE
  ::      TO TRACE THROUGH ALL REFERENCES FROM `Y` EVEN AFTER WE'VE FOUND
  ::      A LOOP, AND I THINK WE DO.
  ::
  ::    - PUT ANOTHER WAY, THIS WILL RECURSE INTO EVERYTHING REFERENCED
  ::      BY A TYPE, AND ONLY MARK LOOPS ONCE IT'S ENCOUNTERED THEM:
  ::      AFTER PROCESSING A TYPE, EVERY TYPE THAT IT REFERENCES
  ::      (TRANSITIVE CLOSURE) WILL HAVE BEEN PROCESSED CORRECTLY.
  ::
  ++  DECORATE-XIMAGE-WITH-LOOPS
    |=  XT=XIMAGE
    ^-  XIMAGE
    |^  XT(XTABLE DECORATED)
    ::
    ++  DECORATED
      ^-  XTABLE
      =/  ALL-INDICIES  ~(TAP IN ~(KEY BY XRAYS.XTABLE.XT))
      ((FOLD XTABLE XKEY) [XTABLE.XT ALL-INDICIES] DECORATE)
    ::
    ++  DECORATE
      |=  [IMG=XTABLE I=XKEY]
      ^-  XTABLE
      ::
      =/  TRACE=(SET XKEY)  ~
      |-  ^-  XTABLE
      ::
      =/  X    (FOCUS-ON IMG I)
      =/  DAT  (NEED XDAT.X)
      ::
      ?.  =(~ LOOP.X)          IMG                      ::  ALREADY DONE
      ?:  (~(HAS IN TRACE) I)  (REPLACE-XRAY IMG X(LOOP `%.Y))
      ::
      =.  TRACE  (~(PUT IN TRACE) I)
      ::
      =.  IMG
        ?-  DAT
          %NOUN      IMG
          %VOID      IMG
          [%ATOM *]  IMG
          [%CELL *]  =.  IMG  $(I HEAD.DAT)
                     $(I TAIL.DAT)
          [%CORE *]  =.  IMG  $(I XRAY.DAT)
                     %+  (FOLD XTABLE XKEY)
                       [IMG (BATTERY-REFS BATT.DAT)]
                     |=  [IMG=XTABLE I=XKEY]
                     ^$(IMG IMG, I I)
          [%FACE *]  $(I XRAY.DAT)
          [%PNTR *]  $(I XRAY.DAT)
          [%FORK *]  %+  (FOLD XTABLE XKEY)
                       [IMG ~(TAP IN SET.DAT)]
                     |=  [IMG=XTABLE I=XKEY]
                     ^$(IMG IMG, I I)
          ==
      ::
      =.  X  (FOCUS-ON IMG I)                           ::  GET UPDATED XRAY
      ?^  LOOP.X  IMG                                   ::  LOOP FOUND
      (REPLACE-XRAY IMG X(LOOP `%.N))                   ::  NO LOOP FOUND
    --
  ::
  ::  FILLS IN THE `XPATS` FIELDS IN EACH XRAY (WHERE POSSIBLE).
  ::
  ::  THIS HAS A LIST OF XPAT "MATCHERS", AND, FOR EACH XRAY IN THE
  ::  XIMAGE, IT TRIES EACH MATCHER UNTIL ONE OF THEM SUCCEEDS.
  ::
  ++  DECORATE-XIMAGE-WITH-XPATS
    |=  XT=XIMAGE
    ^-  XIMAGE
    ::
    =/  IMG=XTABLE  XTABLE.XT
    ::
    |^  =/  PAIRS  %+  TURN  ~(TAP BY XRAYS.XTABLE.XT)
                   |=  [I=XKEY X=XRAY]
                   ^-  [XKEY XRAY]
                   [I X(PATS (XRAY-PATS X))]
        XT(XRAYS.XTABLE (~(GAS BY *(MAP XKEY XRAY)) PAIRS))
    ::
    ++  XPATS
      ^-  (LIST $-(XRAY (UNIT XPAT)))
      :~  TREE-XPAT
          LIST-XPAT
          UNIT-XPAT
          CORE-XPAT
          SPEC-XPAT
          TYPE-XPAT
          MANX-XPAT
          VASE-XPAT
          HOON-XPAT
          JSON-XPAT
          NOCK-XPAT
          PLUM-XPAT
          SKIN-XPAT
      ==
    ::
    ++  XRAY-PATS
      |=  X=XRAY
      ^-  (UNIT XPAT)
      ::
      =/  I=XKEY  XKEY.X
      =/  T=TYPE  TYPE.X
      =/  D=XDAT  (NEED XDAT.X)
      ::
      ::  ATOM PRINTING WORKS JUST FINE USING THE XDAT FIELD.
      ?:  ?=([%ATOM *] D)  ~
      ::
      =/  MATCH  XPATS
      ::
      |-  ^-  (UNIT XPAT)
      ?~  MATCH  ~
      =/  PAT  (I.MATCH X)
      ?^  PAT  PAT
      $(MATCH T.MATCH)
    ::
    ++  SIMPLE-NEST-XPAT
      |=  [TY=TYPE PAT=XPAT]
      ^-  $-(XRAY (UNIT XPAT))
      |=  X=XRAY
      ^-  (UNIT XPAT)
      =/  SUBTYPE  (~(NEST UT TY) | TYPE.X)
      ?:(SUBTYPE `PAT ~)
    ::
    ++  TYPE-XPAT  (SIMPLE-NEST-XPAT -:!>(*TYPE) %TYPE)
    ++  SPEC-XPAT  (SIMPLE-NEST-XPAT -:!>(*SPEC) %SPEC)
    ++  MANX-XPAT  (SIMPLE-NEST-XPAT -:!>(*MANX) %MANX)
    ++  VASE-XPAT  (SIMPLE-NEST-XPAT -:!>(*VASE) %VASE)
    ++  HOON-XPAT  (SIMPLE-NEST-XPAT -:!>(*HOON) %HOON)
    ++  JSON-XPAT  (SIMPLE-NEST-XPAT -:!>(*JSON) %JSON)
    ++  NOCK-XPAT  (SIMPLE-NEST-XPAT -:!>(*NOCK) %NOCK)
    ++  PLUM-XPAT  (SIMPLE-NEST-XPAT -:!>(*PLUM) %PLUM)
    ++  SKIN-XPAT  (SIMPLE-NEST-XPAT -:!>(*SKIN) %SKIN)
    ::
    ++  FOCUS
      |=  I=XKEY
      ^-  XRAY
      (FOCUS-ON IMG I)
    ::
    ++  IS-NIL
      |=  I=XKEY
      ^-  ?
      =/  D=XDAT  (NEED XDAT:(FOCUS I))
      ?+  D  %.N
        [%ATOM *]  =(D [%ATOM ~.N `0])
        [%FACE *]  $(I XRAY.D)
      ==
    ::
    ::  IS `REF`, AFTER DEREFERENCING FACES, A LOOP-REFERENCE TO `TARGET`?
    ::
    ++  IS-REF-TO
      |=  [TARGET=XKEY REF=XKEY]
      ^-  ?
      ?:  =(TARGET REF)  %.Y
      =/  =XDAT  (NEED XDAT:(FOCUS REF))
      ?:  ?=([%FACE *] XDAT)  $(REF XRAY.XDAT)
      %.N
    ::
    ::  IS AN XRAY AN ATOM WITH THE SPECIFIED AURA?
    ::
    ++  IS-ATOM-WITH-AURA
      |=  [C=CORD I=XKEY]
      ^-  ?
      =/  =XDAT  (NEED XDAT:(FOCUS I))
      ?+  XDAT  %.N
        [%ATOM *]  =(XDAT [%ATOM AURA=C CONSTANT-UNIT=~])
        [%FACE *]  $(I XRAY.XDAT)
      ==
    ::
    ::  IF THE XRAY IS A EXACTLY TWO THINGS, NIL AND A CELL TYPE, THEN
    ::  YIELD THE XRAY FOR THE CELL TYPE.
    ::
    ++  FORK-OF-NIL-AND-CELL
      |=  X=XRAY
      ^-  (UNIT XKEY)
      ::
      =/  D=XDAT  (NEED XDAT.X)
      ::
      ?.  ?=([%FORK *] D)  ~
      ::
      =/  BRANCHES  ~(TAP IN SET.D)
      ?.  ?=([* * ~] BRANCHES)  ~
      ::
      =/  NIL   I.BRANCHES
      =/  NODE  I.T.BRANCHES
      |-
      ::
      ?:  (IS-NIL NODE)  $(NODE NIL, NIL NODE)
      ?.  (IS-NIL NIL)   ~
      ::
      `NODE
    ::
    ::  IS THIS XRAY A UNIT? (THE %UNIT XPAT)
    ::
    ::  THIS MATCHES STRICTLY. FOR EXAMPLE `[~ %A]` DOESN'T MATCH, BUT
    ::  `^-((UNIT @) [~ %A])` DOES.
    ::
    ++  UNIT-XPAT
      |^  |=  X=XRAY
          ^-  (UNIT XPAT)
          =/  ELEM  (MATCH-UNIT-TYPE-STRICT (FOCUS XKEY.X))
          ?~  ELEM  ~
          `[%UNIT U.ELEM]
      ::
      ++  MATCH-UNIT-TYPE-STRICT
        |=  =INPUT=XRAY
        ^-  (UNIT XKEY)
        ::
        =/  NODE=(UNIT XKEY)  (FORK-OF-NIL-AND-CELL INPUT-XRAY)
        ?~  NODE  ~
        ::
        =/  NODE-XDAT=XDAT  (NEED XDAT:(FOCUS U.NODE))
        ::
        ?.  ?=([%CELL *] NODE-XDAT)  ~
        ?.  (IS-NIL HEAD.NODE-XDAT)  ~
        =/  ELEM-XKEY                 TAIL.NODE-XDAT
        =/  ELEM-XDAT                (NEED XDAT:(FOCUS ELEM-XKEY))
        ?.  ?=([%FACE *] ELEM-XDAT)  ~
        ::
        `XRAY.ELEM-XDAT
      --
    ::
    ::  IS THIS XRAY A TREE? (THE %TREE XPAT)
    ::
    ++  TREE-XPAT
      |^  |=  =INPUT=XRAY
          ^-  (UNIT XPAT)
          =/  INPUT-XKEY=XKEY  XKEY.INPUT-XRAY
          =/  INXDAT=XDAT      (NEED XDAT.INPUT-XRAY)
          ?.  ?=([%FORK *] INXDAT)  ~
          =/  BRANCHES  ~(TAP IN SET.INXDAT)
          ?.  ?=([* * ~] BRANCHES)  ~
          =/  NIL   I.BRANCHES
          =/  NODE  I.T.BRANCHES
          |-
          ?:  (IS-NIL NODE)  $(NODE NIL, NIL NODE)
          ?.  (IS-NIL NIL)  ~
          =/  NODE-XDAT=XDAT  (NEED XDAT:(FOCUS NODE))
          ?.  ?=([%CELL *] NODE-XDAT)  ~
          ?.  (IS-PAIR-OF-REFS-TO INPUT-XKEY TAIL.NODE-XDAT)
            ~
          =/  ELEM-XDAT  (NEED XDAT:(FOCUS HEAD.NODE-XDAT))
          ?.  ?=([%FACE *] ELEM-XDAT)  ~
          `[%TREE XRAY.ELEM-XDAT]
      ::
      ++  IS-PAIR-OF-REFS-TO
        |=  [TARGET=XKEY CELL=XKEY]
        ^-  ?
        =/  =XDAT  (NEED XDAT:(FOCUS CELL))
        ?:  ?=([%FACE *] XDAT)  $(CELL XRAY.XDAT)
        ?.  ?=([%CELL *] XDAT)  %.N
        ?.  (IS-REF-TO TARGET HEAD.XDAT)  %.N
        ?.  (IS-REF-TO TARGET TAIL.XDAT)  %.N
        %.Y
      --
    ::
    ::
    ::  IS THIS XRAY A LIST? (A %LIST, %TAPE, %PATH, OR %TOUR XPAT)
    ::
    ::  THIS HANDLES THE SPECIAL CASE OF PATH LITERALS NOT HAVING A
    ::  LIST TYPE:  `/A/B` IS JUST A MACRO FOR `[%A %B ~]`, BUT DOESN'T
    ::  ACCEPT THIS FOR OTHER LISTS: WE DON'T WANT ['A' %N ~] TO BE PRINTED
    ::  AS `['A' ~[%N]]`. HOWEVER, WE WILL PRINT ['A' ~['B' 'C']] AS ~['A'
    ::  'B' 'C']. AND THAT'S WHAT `MATCH-LIST` MATCHES ON.
    ::
    ::  `MATCH-LIST` CHECKS IS A TYPE IS INFORMALLY A LIST: IS IT A
    ::  CELL WITH A (FORMAL OR INFORMAL) LIST IN ITS TAIL?
    ::
    ::  `MATCH-LIST-TYPE-STRICT` CHECKS IF A LIST LITERALLY HAS THE SHAPE
    ::  OF A `LIST TYPE`. IT MUST BE A LOOP REFERENCE AND FORK OF TWO
    ::  TYPES, ONE OF WHICH IS THE NIL TYPE AND THE OTHER IS A CELL WITH A
    ::  FACE IN ITS HEAD AND LOOP REFERENCE AS ITS TAIL.
    ::
    ++  LIST-XPAT
      |^  |=  X=XRAY
          ^-  (UNIT XPAT)
          =/  ELEM  (MATCH-LIST X)
          ?~  ELEM  ~
          ?:  (IS-ATOM-WITH-AURA 'TD' U.ELEM)   [~ %TAPE]
          ?:  (IS-ATOM-WITH-AURA 'TA' U.ELEM)   [~ %PATH]
          ?:  (IS-ATOM-WITH-AURA 'C' U.ELEM)    [~ %TOUR]
          ?:  (IS-ATOM-WITH-AURA 'TAS' U.ELEM)  [~ %PATH]
          `[%LIST U.ELEM]
      ::
      ++  MATCH-LIST
        |=  =INPUT=XRAY
        ^-  (UNIT XKEY)
        =/  D=XDAT  (NEED XDAT.INPUT-XRAY)
        ?+  D        ~
          [%FACE *]  (MATCH-LIST (FOCUS XRAY.D))
          [%FORK *]  (MATCH-LIST-TYPE-STRICT INPUT-XRAY)
          [%CELL *]  =/  ELEM-XKEY=(UNIT XKEY)
                       ?:  ?&((IS-NIL TAIL.D) (IS-ATOM-WITH-AURA 'TAS' HEAD.D))
                         `HEAD.D
                       (MATCH-LIST (FOCUS TAIL.D))
                     ?~  ELEM-XKEY                       ~
                     ?.  (IS-REF-TO U.ELEM-XKEY HEAD.D)  ~
                     `U.ELEM-XKEY
        ==
      ::
      ++  MATCH-LIST-TYPE-STRICT
        |=  =INPUT=XRAY
        ^-  (UNIT XKEY)
        ::
        =/  NODE=(UNIT XKEY)  (FORK-OF-NIL-AND-CELL INPUT-XRAY)
        ?~  NODE  ~
        ::
        =/  NODE-XDAT=XDAT                   (NEED XDAT:(FOCUS U.NODE))
        ?.  ?=([%CELL *] NODE-XDAT)          ~
        ?.  (IS-REF-TO XKEY.INPUT-XRAY TAIL.NODE-XDAT)  ~
        ::
        =/  ELEM-XDAT                        (NEED XDAT:(FOCUS HEAD.NODE-XDAT))
        ?.  ?=([%FACE *] ELEM-XDAT)          ~
        ::
        `XRAY.ELEM-XDAT
      --
    ::
    ::  A %GEAR IS ANY CORE WITH A CELL CONTEXT.
    ::
    ::  A %GATE IS A GEAR WITH ONE CHAPTER ('') WITH ONE ARM ('').
    ::
    ++  CORE-XPAT
      |^  |=  X=XRAY
          ^-  (UNIT XPAT)
          =.  X  (FOCUS XKEY.X)
          =/  GEAR  (MATCH-GEAR X)
          ?~  GEAR  ~
          =/  GATE  (MATCH-GATE X SAMPLE.U.GEAR BATT.U.GEAR)
          ?^  GATE  GATE
          ~  ::  XX  GEAR
      ::
      ++  MATCH-GEAR
        |=  =INPUT=XRAY
        ^-  (UNIT [%GEAR SAMPLE=XKEY CONTEXT=XKEY BATT=XBAT])
        ::
        =/  INPUT-XDAT  (NEED XDAT.INPUT-XRAY)
        ?.  ?=([%CORE *] INPUT-XDAT)  ~
        =/  CONTEXT-XKEY=XKEY  XRAY.INPUT-XDAT
        ::
        =/  CONTEXT-XDAT=XDAT  (NEED XDAT:(FOCUS CONTEXT-XKEY))
        ?.  ?=([%CELL *] CONTEXT-XDAT)  ~
        ::
        =/  SAMPLE-XKEY=XKEY  HEAD.CONTEXT-XDAT
        =.  CONTEXT-XKEY     TAIL.CONTEXT-XDAT
        `[%GEAR SAMPLE-XKEY CONTEXT-XKEY BATT.INPUT-XDAT]
      ::
      ++  MATCH-GATE
        |=  [=INPUT=XRAY SAMPLE=XKEY BATT=XBAT]
        ^-  (UNIT [%GATE XKEY XKEY])
        ::
        =/  INPUT-XDAT  (NEED XDAT.INPUT-XRAY)
        ?.  ?=([%CORE *] INPUT-XDAT)  ~
        =/  CHAPTERS  ~(TAP BY BATT)
        ::
        ?~  CHAPTERS            ~
        ?^  T.CHAPTERS          ~
        ?.  =(P.I.CHAPTERS '')  ~
        ::
        =/  ARMS=(LIST (PAIR TERM XKEY))  ~(TAP BY Q.Q.I.CHAPTERS)
        ::
        ?~  ARMS            ~
        ?^  T.ARMS          ~
        ?.  =(P.I.ARMS '')  ~
        ::
        =/  PRODUCT=XKEY  Q.I.ARMS
        ::
        `[%GATE SAMPLE PRODUCT]
      --
    ::
    --
  ::
  ::  DETERMINES THE LOOSE SHAPE OF EACH NODE IN AN XIMAGE.
  ::
  ::  THIS IS TRIVAL FOR EVERYTHING BESIDES FORKS, AND FOR FORKS, WE JUST
  ::  FIND ALL THE NON-FORK BRANCHES WITH `XRAY-BRANCHES` AND THEN CALCULATE
  ::  THE UNION TYPE WITH `COMBINE`.
  ::
  ::  HERE'S SOME PSEUDOCODE FOR THE ESSENCE OF THE LOGIC THAT WE'RE
  ::  TRYING TO IMPLEMENT HERE:
  ::
  ::      XDAT DATA = NOUN | VOID
  ::                | ATOM | CNST
  ::                | CELL DATA DATA
  ::                | FORK DATA DATA
  ::
  ::      XDAT SHAPE = NOUN | VOID | ATOM | CNST | CELL | JUNC
  ::
  ::      SHAPE :: DATA -> SHAPE
  ::      SHAPE NOUN       = NOUN
  ::      SHAPE VOID       = VOID
  ::      SHAPE ATOM       = ATOM
  ::      SHAPE CNST       = ATOM
  ::      SHAPE (CELL A B) = CELL
  ::      SHAPE (FORK X Y) = FORKSHAPE (SHAPE X) (SHAPE Y)
  ::
  ::      FORKSHAPE :: SHAPE -> SHAPE -> SHAPE
  ::      FORKSHAPE VOID X           = X
  ::      FORKSHAPE NOUN _           = NOUN
  ::      FORKSHAPE JUNC _           = JUNC
  ::      FORKSHAPE ATOM CELL        = JUNC
  ::      FORKSHAPE X    Y    | X==Y = X
  ::      FORKSHAPE X    Y           = FORKSHAPE Y X
  ::
  ++  DECORATE-XIMAGE-WITH-XSHAPES
    |^  |=  XT=XIMAGE
        ^-  XIMAGE
        =/  KEYS  ~(TAP IN ~(KEY BY XRAYS.XTABLE.XT))
        %=  XT  XTABLE
          %+  (FOLD XTABLE XKEY)
            [XTABLE.XT KEYS]
          |=  [ST=XTABLE I=XKEY]
          XTABLE:(XRAY-XSHAPE ST I)
        ==
    ::
    ::  CALCULATE THE XRAY
    ::
    ++  XRAY-XSHAPE
      |=  [ST=XTABLE I=XKEY]
      ^-  [XSHAPE =XTABLE]
      ::
      =/  X=XRAY  (FOCUS-ON ST I)
      =/  DAT  (NEED XDAT.X)
      ::
      ?^  XSHAPE.X  [U.XSHAPE.X ST]                     ::  ALREADY PROCESSED
      ::
      =^  RES=XSHAPE  ST
        ?-  DAT
          %NOUN      [%NOUN ST]
          %VOID      [%VOID ST]
          [%ATOM *]  [%ATOM ST]
          [%CELL *]  [%CELL ST]
          [%CORE *]  [%CELL ST]
          [%FORK *]  (FORK-XSHAPE ST (XRAY-BRANCHES ST XKEY.X))
          [%FACE *]  (XRAY-XSHAPE ST XRAY.DAT)
          [%PNTR *]  !!                                 ::  RUN `CLEANUP` FIRST
        ==
      ::
      =/  Y=XRAY    X                                   ::  TYPE SYSTEM HACK
      =.  XSHAPE.Y   `RES
      =.  XRAYS.ST  (~(PUT BY XRAYS.ST) XKEY.Y Y)
      [RES ST]
    ::
    ::  BECAUSE `BRANCHES` COMES FROM `XRAY-BRANCHES`, NONE OF THE XRAYS
    ::  WE'RE FOLDING OVER WILL BE FORKS, THEREFORE, WE NONE OF OUR CALLS
    ::  TO `XRAY-XSHAPE` WILL RECURSE: WE WON'T GET STUCK IN A LOOP.
    ::
    ++  FORK-XSHAPE
      |=  [ST=XTABLE BRANCHES=(SET XKEY)]
      ^-  [XSHAPE XTABLE]
      %+  (FOLD (PAIR XSHAPE XTABLE) XKEY)
        [[%VOID ST] ~(TAP IN BRANCHES)]
      |=  [ACC=(PAIR XSHAPE XTABLE) I=XKEY]
      ^-  [XSHAPE XTABLE]
      =^  RES  ST  (XRAY-XSHAPE Q.ACC I)
      [(COMBINE P.ACC RES) ST]
    ::
    ::  GIVEN THE XSHAPES OF TWO TYPES, DETERMINE THE XSHAPE OF THEIR UNION.
    ::
    ++  COMBINE
      |=  [X=XSHAPE Y=XSHAPE]
      ^-  XSHAPE
      ?:  =(X Y)      X
      ?:  =(X %VOID)  Y
      ?:  =(Y %VOID)  X
      ?:  =(X %NOUN)  %NOUN
      ?:  =(Y %NOUN)  %NOUN
      %JUNC
    --
  ::
  ::  DETERMINE THE `XROLE` OF EACH XRAY NODE, RESTRUCTURING FORKS TO MAKE
  ::  THEM COHERENT.
  ::
  ::  THIS IS FAIRLY SIMPLE FOR NON-ROLE TYPES, AND WE HANDLE FORKS THE
  ::  SAME WAY WE DO WITH `XSHAPE` DETECTION. THE BASIC MOVE IS TO GET ALL
  ::  OF THE NON-FORK BRANCHES USING `XRAY-BRANCHES`, MAKE A LIST OF THEM,
  ::  AND FOLD A FUNCTION OVER THAT. HOWEVER, THE FUNCTION WE'RE FOLDING WITH
  ::  IS MUCH MORE COMPLICATED.
  ::
  ::  ONE OF THE BIG SOURCES OF COMPLEXITY IS THAT WE NEED TO RESTRUCTURE
  ::  THE SHAPE OF FORKS, SO WE WILL BE CREATING A BUNCH OF NEW GRAPH
  ::  NODES, AND REARRANGING THEM. FOR EXAMPLE, IF WE WANT TO MERGE A
  ::  JUNCTION (A FORK OF AN ATOM AND A CELL) WITH AN ATOM TYPE, WE CREATE
  ::  A NEW JUNCTION XRAY THAT IS A FORK OF THE OLD CELL TYPE AND THE
  ::  UNION OF THE TWO CELL TYPES. THE FUNCTION WE FOLD WITH IS `MERGE`,
  ::  BUT THE BULK OF THE LOGIC LIVES IN `COMBINE`.
  ::
  ::  HERE'S SOME PSEUDOCODE FOR THE ESSENCE OF THE LOGIC THAT WE'RE
  ::  TRYING TO IMPLEMENT HERE. NOTE THAT THE CODE IS ACTUALLY SHAPED
  ::  QUITE DIFFERENTLY THAN THIS AND IS MUCH MORE DETAILED. SO, TRY
  ::  TO WRAP YOUR HEAD AROUND WHY THIS MAKES SENSE INSTEAD OF JUST
  ::  TRYING TO USE THIS A MAP FOR THE ACTUAL CODE.
  ::
  ::      XDAT DATA = NOUN | VOID
  ::                | ATOM | CNST
  ::                | CELL DATA DATA
  ::                | FORK DATA DATA
  ::
  ::      XDAT SHAPE = NOUN | VOID | ATOM | CNST | CELL | JUNC
  ::
  ::      XDAT ROLE = VOID | NOUN
  ::                | ATOM | CNST
  ::                | TALL | WIDE | INSTANCE
  ::                | OPTION | UNION | CONJUNC | JUNC
  ::                | MISJUNC
  ::
  ::      ROLE :: DATA -> UNIT ROLE
  ::      ROLE NOUN        = ~
  ::      ROLE VOID        = ~
  ::      ROLE ATOM        = ~
  ::      ROLE CNST        = ~
  ::      ROLE (CELL HD _) = `(CELLROLEBYHEAD (SHAPE HD))
  ::      ROLE (FORK X Y)  = `(FORKROLE (SHAPE X, ROLE X) (SHAPE Y, ROLE Y))
  ::
  ::      CELLROLEBYHEAD :: SHAPE -> UNIT ROLE
  ::      CELLROLEBYHEAD CELL = `WIDE
  ::      CELLROLEBYHEAD CNST = `INSTANCE
  ::      CELLROLEBYHEAD ATOM = `TALL
  ::      CELLROLEBYHEAD _    = ~
  ::
  ::      FORKROLE :: (SHAPE,ROLE) + (SHAPE,ROLE) -> ROLE
  ::      FORKROLE
  ::          OPTION  <- OPTION + OPTION
  ::          UNION   <- UNION  + UNION
  ::          CONJUNC <- TALL   + WIDE
  ::          JUNC    <- ATOM   + CELL
  ::          MISJUNC <- OTHERWISE
  ::        WHERE
  ::          OPTION = ROLE==OPTION || ROLE==INSTANCE
  ::          UNION  = SHAPE==CNST  || ROLE==UNION
  ::          ATOM   = SHAPE==ATOM  || SHAPE==CNST
  ::          CELL   = SHAPE==CELL
  ::          TALL   = ROLE==TALL
  ::          WIDE   = ROLE==WIDE
  ::          CELL   = SHAPE==CELL
  ::
  ++  DECORATE-XIMAGE-WITH-XROLES
    |^  |=  XT=XIMAGE
        ^-  XIMAGE
        ::
        =/  KEYS=(LIST XKEY)  ~(TAP IN ~(KEY BY XRAYS.XTABLE.XT))
        ::
        %=  XT  XTABLE
          %+  (FOLD XTABLE XKEY)  [XTABLE.XT KEYS]
          |=  [ST=XTABLE I=XKEY]
          ^-  XTABLE
          XTABLE:(XRAY-XROLE ST I)
        ==
    ::
    ::  GIVEN A TYPE AND XDAT, EITHER FIND THE XRAY CORRESPONDING TO THAT
    ::  TYPE, OR CREATE A NEW ONE.
    ::
    ::  THESE XRAYS ARE FOR INTERNAL TYPES THAT WE CREATE IN ORDER TO
    ::  RESTRUCTURE FORKS, THEREFORE THEY WILL NEVER BE LOOPS.
    ::
    ++  ALLOC-FORK-XRAY
      |=  [ST=XTABLE TY=TYPE D=XDAT]
      ^-  [XKEY XTABLE]
      =/  OLD=(UNIT XKEY)  (~(GET BY TYPE-MAP.ST) TY)
      ?^  OLD  [U.OLD ST]
      =/  XKEY          NEXT.ST
      =/  RES=XRAY     [XKEY TY `D ~ ~ ~ ~ ~ ~ `%.N]
      =.  NEXT.ST      +(XKEY)
      =.  XRAYS.ST     (~(PUT BY XRAYS.ST) XKEY.RES RES)
      =.  TYPE-MAP.ST  (~(PUT BY TYPE-MAP.ST) TYPE.RES XKEY.RES)
      [XKEY ST]
    ::
    ::  PRODUCES AN XTABLE UPDATED TO HAVE XROLE INFORMATION FOR A CERTAIN
    ::  NODE. FOR CONVENIENCE, IT ALSO RETURNS THE XROLE ITSELF.
    ::
    ::  NOTE THAT THE XROLE OF A CORE IS ALWAYS %WIDE, SINCE THE HEAD OF
    ::  A CORE IS A BATTERY, WHICH IS ALWAYS A CELL.
    ::
    ++  XRAY-XROLE
      |=  [ST=XTABLE I=XKEY]
      ^-  [=XROLE =XTABLE]
      =/  X=XRAY  (FOCUS-ON ST I)
      ::
      =/  OLD  XROLE.X
      ?^  OLD  [U.OLD ST]
      ::
      =/  DAT=XDAT  (NEED XDAT.X)
      ::
      =^  RES=XROLE  ST
        ?:  ?=([~ %VOID] XSHAPE.X)  [%VOID ST]          ::  OPTIMIZATION
        ?:  ?=([~ %NOUN] XSHAPE.X)  [%NOUN ST]          ::  OPTIMIZATION
        ?-  DAT
          %NOUN      :_  ST  %NOUN
          %VOID      :_  ST  %VOID
          [%ATOM *]  :_  ST  (ATOM-XROLE DAT)
          [%CELL *]  :_  ST  (CELL-XROLE-BY-HEAD (FOCUS-ON ST HEAD.DAT))
          [%CORE *]  :_  ST  %WIDE
          [%FACE *]  (XRAY-XROLE ST XRAY.DAT)
          [%PNTR *]  !!                                 ::  RUN `CLEANUP` FIRST.
          [%FORK *]  (FORK-XROLE ST (XRAY-BRANCHES ST XKEY.X))
        ==
      ::
      =.  XRAYS.ST  (~(PUT BY XRAYS.ST) XKEY.X X(XROLE `RES))
      [RES ST]
    ::
    ::  DETERMINES THE XROLE OF AN ATOM XRAY.
    ::
    ++  ATOM-XROLE
      |=  [%ATOM =AURA =CONSTANT=(UNIT @)]
      ^-  XROLE
      ?~  CONSTANT-UNIT  %ATOM
      [%CONSTANT U.CONSTANT-UNIT]
    ::
    ::  CALCULATE THE XROLE OF A %CELL XRAY.
    ::
    ::  XX I'M NOT SURE THIS IS CORRECT. SHOULD A CELL WITH A NOUN HEAD
    ::  BE %TALL? HOW ABOUT A %VOID HEAD?
    ::
    ::    - A %VOID HEAD SHOULD PROBABLY BE %VOID.
    ::    - A %NOUN HEAD SHOULD PROBABLY JUST BE %CELL, A XROLE SEPARATE FROM
    ::      (%WIDE AND %TALL) TO MAKE THE AMBIGUITY EXPLICIT. FOR EXAMPLE,
    ::      THE UNION OF `[* @] + [@ @]` SHOULD BE A MISJUNCTION, WHICH ISN'T
    ::      WHAT'S HAPPENING NOW.
    ::
    ::  XX ALSO! A CELL WITH A JUNCTION IN ITS HEAD SHOULD BE A
    ::  CONJUNCTION, RIGHT?
    ::
    ++  CELL-XROLE-BY-HEAD
      |=  HEAD=XRAY
      ^-  XROLE
     ::
      =/  =XSHAPE  (NEED XSHAPE.HEAD)
      =/  =XDAT   (NEED XDAT.HEAD)
     ::
      =/  CONST  ?.  ?=([%ATOM *] XDAT)  ~
                 CONSTANT.XDAT
      ::
      ?:  =(XSHAPE %CELL)  %WIDE
      ?^  CONST           [%INSTANCE U.CONST]
      %TALL
    ::
    ::  DETERMINE THE XROLE OF %FORK TYPE.
    ::
    ::  FOLD OVER ALL THE BRANCHES OFF A FORK USING THE `MERGE` FUNCTION,
    ::  AND THEN GRAB ITS `XROLE` USING `XRAY-XROLE`.
    ::
    ::  IN ANY NON-TRIVIAL CASES, THE XRAY RETURNED FROM `MERGE` WILL
    ::  ALREADY HAVE ITS `XROLE` SET, SO RECURSING INTO `XRAY-XROLE`
    ::  SHOULDN'T BE DANGEROUS.
    ::
    ::  XX THIS IS PROBABLY AN IMPORTANT PART OF THE CONTROL-FLOW, AND IT
    ::  MIGHT BE HELPFUL TO MAKE THIS INVARIANT MORE PROMINENT.
    ::
    ++  FORK-XROLE
      |=  [ST=XTABLE FORK=(SET XKEY)]
      ^-  [XROLE XTABLE]
      ::
      =^  VOID  ST  (POST-XRAY ST %VOID `%VOID)
      ::
      =^  I=XKEY  ST
        ^-  [XKEY XTABLE]
        %+  (FOLD {XKEY XTABLE} XKEY)
          [[VOID ST] ~(TAP IN FORK)]
        |=  [[K=XKEY TBL=XTABLE] BRANCH=XKEY]
        ^-  [XKEY XTABLE]
        (MERGE TBL K BRANCH)
      ::
      (XRAY-XROLE ST I)
    ::
    ::  RETURN AN XRAY OF THE UNION OF TWO XRAYS.
    ::
    ++  MERGE
      |=  [ST=XTABLE THIS=XKEY THAT=XKEY]
      ^-  [XKEY XTABLE]
      =/  THIS-XRAY=XRAY  (FOCUS-ON ST THIS)
      =/  THAT-XRAY=XRAY  (FOCUS-ON ST THAT)
      ?:  =(%VOID TYPE.THIS-XRAY)  [THAT ST]
      ?:  =(%VOID TYPE.THAT-XRAY)  [THIS ST]
      (COMBINE ST THIS THAT)
    ::
    ::  =COLLATE-UNION: MERGE UNION MAPS
    ::
    ++  COLLATE-UNION
      |^  |=  [ST=XTABLE THICK=(MAP ATOM XKEY) THIN=(MAP ATOM XKEY)]
          ^-  [(MAP ATOM XKEY) XTABLE]
          ::
          =/  LIST=(LIST (PAIR ATOM XKEY))  ~(TAP BY THIN)
          ::
          |-  ^-  [(MAP ATOM XKEY) XTABLE]
          ::
          ?~  LIST  [THICK ST]
          =/  ITEM=(UNIT XKEY)  (~(GET BY THICK) P.I.LIST)
          =^  MERGED=XKEY  ST  ?~  ITEM  [Q.I.LIST ST]
                              (MERGE-INSTANCES ST P.I.LIST U.ITEM Q.I.LIST)
          =/  NEW-THICK  (~(PUT BY THICK) P.I.LIST MERGED)
          $(LIST T.LIST, THICK NEW-THICK)
      ::
      ::  WE WANT TO MERGE TWO CELL-TYPES THAT HAVE THE SAME HEAD; GROSS.
      ::
      ::  FIRST, GET BOTH TAIL TYPES, MERGE THEM, PRODUCE A NEW CELL TYPE
      ::  WITH THE MERGED TAIL.
      ::
      ++  MERGE-INSTANCES
        |=  [ST=XTABLE =ATOM =X=XKEY =Y=XKEY]
        ^-  [XKEY XTABLE]
        ::
        =/  X-XRAY=XRAY    (FOCUS-ON ST X-XKEY)
        =/  X-XDAT=XDAT    (NEED XDAT.X-XRAY)
        |-  ^-  [XKEY XTABLE]
        ::
        ?:  ?=([%FACE *] X-XDAT)
          $(X-XDAT (NEED XDAT:(FOCUS-ON ST XRAY.X-XDAT)))
        ?>  ?=([%CELL *] X-XDAT)
        =/  X-TAIL=XKEY      TAIL.X-XDAT
        =/  HEAD-XRAY=XRAY  (FOCUS-ON ST HEAD.X-XDAT)
        ::
        =/  Y-XRAY=XRAY     (FOCUS-ON ST Y-XKEY)
        =/  Y-XDAT=XDAT     (NEED XDAT.Y-XRAY)
        |-  ^-  [XKEY XTABLE]
        ::
        ?:  ?=([%FACE *] Y-XDAT)
          $(Y-XDAT (NEED XDAT:(FOCUS-ON ST XRAY.Y-XDAT)))
        ?>  ?=([%CELL *] Y-XDAT)
        =/  Y-TAIL=XKEY      TAIL.Y-XDAT
        ::
        =^  MERGED-TAIL  ST  (MERGE ST X-TAIL Y-TAIL)
        =/  TAIL-XRAY=XRAY   (FOCUS-ON ST MERGED-TAIL)
        ::
        =/  RES-TY=TYPE    [%CELL TYPE.HEAD-XRAY TYPE.TAIL-XRAY]
        =/  RES-XDAT=XDAT  [%CELL XKEY.HEAD-XRAY XKEY.TAIL-XRAY]
        =^  RES-XKEY  ST   (ALLOC-FORK-XRAY ST RES-TY RES-XDAT)
        ::
        =/  RES-XRAY=XRAY    (FOCUS-ON ST RES-XKEY)
        =.  XSHAPE.RES-XRAY  `%CELL
        =.  XROLE.RES-XRAY   `[%INSTANCE ATOM]
        =.  XRAYS.ST         (~(PUT BY XRAYS.ST) RES-XKEY RES-XRAY)
        ::
        [XKEY.RES-XRAY ST]
      --
    ::
    ::  =COLLATE-OPTION: MERGE OPTION MAPS
    ::
    ++  COLLATE-OPTION
      |=  [ST=XTABLE THICK=(MAP ATOM XKEY) THIN=(MAP ATOM XKEY)]
      ^-  [(MAP ATOM XKEY) XTABLE]
      =/  LIST=(LIST (PAIR ATOM XKEY))  ~(TAP BY THIN)
      |-
      ^-  [(MAP ATOM XKEY) XTABLE]
      ?~  LIST  [THICK ST]
      =/  ITEM=(UNIT XKEY)  (~(GET BY THICK) P.I.LIST)
      =^  MERGED=XKEY  ST  ?~  ITEM  [Q.I.LIST ST]
                          (MERGE ST U.ITEM Q.I.LIST)
      =/  NEW-THICK  (~(PUT BY THICK) P.I.LIST MERGED)
      $(LIST T.LIST, THICK NEW-THICK)
    ::
    ::  CREATE A NEW XRAY THAT IS THE UNION OF TWO XRAYS, BUT WITH A
    ::  COHERENT `XROLE` (WHERE POSSIBLE, OTHERWISE A %MISJUNCTION).
    ::
    ::  THIS OFTEN NEEDS TO RESTRUCTURE THINGS. FOR EXAMPLE, IF WE ARE
    ::  COMBINING `{{~ ~} {%A ~}}` AND `{{~ ~} {%B ~}}`, WE SHOULD PRODUCE
    ::  `{{~ ~} ?%({%A ~} {%B ~})}`.
    ::
    ::  THIS IS A MASSIVE SWITCH ON THE XROLES OF THE TWO ARGUMENTS. THIS
    ::  IS *VERY* EASY TO GET WRONG, SO I STRUCTURED THINGS THIS IN A
    ::  VERBOSE AND EXPLICIT WAY, SO THAT YOU SHOULD BE ABLE TO EASILY GO
    ::  THROUGH EACH CASE AND VERIFY THAT IT'S DOING THE RIGHT THING.
    ::
    ++  COMBINE
      |^  |=  [ST=XTABLE =THIS=XKEY =THAT=XKEY]
          ^-  [XKEY XTABLE]
          ::
          ?:  =(THIS-XKEY THAT-XKEY)  [THIS-XKEY ST]
          ::
          =^  THIS-XROLE=XROLE  ST  (XRAY-XROLE ST THIS-XKEY)
          =^  THAT-XROLE=XROLE  ST  (XRAY-XROLE ST THAT-XKEY)
          ::
          =/  THIS=[=XKEY =XROLE]  [THIS-XKEY THIS-XROLE]
          =/  THAT=[=XKEY =XROLE]  [THAT-XKEY THAT-XROLE]
          ::
          ?:  ?=(%VOID XROLE.THIS)             [THAT-XKEY ST]
          ?:  ?=(%VOID XROLE.THAT)             [THIS-XKEY ST]
          ?:  ?=(%NOUN XROLE.THIS)             (NOUN-NOUN ST THIS THAT)
          ?:  ?=(%NOUN XROLE.THAT)             (NOUN-NOUN ST THAT THIS)
          ?:  ?=([%MISJUNCTION *] XROLE.THIS)  (MISJUNKIN ST THIS THAT)
          ?:  ?=([%MISJUNCTION *] XROLE.THAT)  (MISJUNKIN ST THIS THAT)
          ::
          ?-  XROLE.THAT
            %ATOM
              ?-  XROLE.THIS
                %ATOM             (ATOM-ATOM ST THAT THIS)
                %TALL             (ATOM-CELL ST THAT THIS)
                %WIDE             (ATOM-CELL ST THAT THIS)
                [%CONSTANT *]     (ATOM-ATOM ST THAT THIS)
                [%INSTANCE *]     (ATOM-CELL ST THAT THIS)
                [%OPTION *]       (ATOM-OPTN ST THAT THIS)
                [%UNION *]        (ATOM-CELL ST THAT THIS)
                [%JUNCTION *]     (ATOM-JUNC ST THAT THIS)
                [%CONJUNCTION *]  (ATOM-CELL ST THAT THIS)
              ==
            %TALL
              ?-  XROLE.THIS
                %ATOM             (ATOM-CELL ST THIS THAT)
                %TALL             (TALL-TALL ST THIS THAT)
                %WIDE             (WIDE-TALL ST THIS THAT)
                [%CONSTANT *]     (ATOM-CELL ST THIS THAT)
                [%INSTANCE *]     (TALL-TALL ST THIS THAT)
                [%OPTION *]       (ATOM-CELL ST THIS THAT)
                [%UNION *]        (TALL-TALL ST THIS THAT)
                [%JUNCTION *]     (CELL-JUNC ST THAT THIS)
                [%CONJUNCTION *]  (TALL-CONJ ST THAT THIS)
              ==
            %WIDE
              ?-  XROLE.THIS
                %ATOM             (ATOM-CELL ST THIS THAT)
                %TALL             (WIDE-TALL ST THAT THIS)
                %WIDE             (WIDE-WIDE ST THIS THAT)
                [%CONSTANT *]     (ATOM-CELL ST THIS THAT)
                [%INSTANCE *]     (WIDE-TALL ST THIS THAT)
                [%OPTION *]       (ATOM-CELL ST THIS THAT)
                [%UNION *]        (WIDE-TALL ST THAT THIS)
                [%JUNCTION *]     (CELL-JUNC ST THAT THIS)
                [%CONJUNCTION *]  (WIDE-CONJ ST THAT THIS)
              ==
            [%CONSTANT *]
              ?-  XROLE.THIS
                %ATOM             (ATOM-ATOM ST THAT THIS)
                %TALL             (ATOM-CELL ST THAT THIS)
                %WIDE             (ATOM-CELL ST THAT THIS)
                [%CONSTANT *]     (CNST-CNST ST THAT THIS)
                [%INSTANCE *]     (ATOM-CELL ST THAT THIS)
                [%OPTION *]       (CNST-OPTN ST THAT THIS)
                [%UNION *]        (ATOM-CELL ST THAT THIS)
                [%JUNCTION *]     (ATOM-JUNC ST THAT THIS)
                [%CONJUNCTION *]  (ATOM-CELL ST THAT THIS)
              ==
            [%INSTANCE *]
              ?-  XROLE.THIS
                %ATOM             (ATOM-CELL ST THIS THAT)
                %TALL             (TALL-TALL ST THIS THAT)
                %WIDE             (WIDE-TALL ST THIS THAT)
                [%CONSTANT *]     (ATOM-CELL ST THIS THAT)
                [%INSTANCE *]     (INST-INST ST THIS THAT)
                [%OPTION *]       (ATOM-CELL ST THIS THAT)
                [%UNION *]        (INST-UNIN ST THAT THIS)
                [%JUNCTION *]     (CELL-JUNC ST THAT THIS)
                [%CONJUNCTION *]  (TALL-CONJ ST THAT THIS)
              ==
            [%OPTION *]
              ?-  XROLE.THIS
                %ATOM             (ATOM-OPTN ST THIS THAT)
                %TALL             (ATOM-CELL ST THAT THIS)
                %WIDE             (ATOM-CELL ST THAT THIS)
                [%CONSTANT *]     (CNST-OPTN ST THIS THAT)
                [%INSTANCE *]     (ATOM-CELL ST THAT THIS)
                [%OPTION *]       (OPTN-OPTN ST THIS THAT)
                [%UNION *]        (ATOM-CELL ST THAT THIS)
                [%JUNCTION *]     (ATOM-JUNC ST THAT THIS)
                [%CONJUNCTION *]  (ATOM-CELL ST THAT THIS)
              ==
            [%UNION *]
              ?-  XROLE.THIS
                %ATOM             (ATOM-CELL ST THIS THAT)
                %TALL             (TALL-TALL ST THIS THAT)
                %WIDE             (WIDE-TALL ST THIS THAT)
                [%CONSTANT *]     (ATOM-CELL ST THIS THAT)
                [%INSTANCE *]     (INST-UNIN ST THIS THAT)
                [%OPTION *]       (ATOM-CELL ST THIS THAT)
                [%UNION *]        (UNIN-UNIN ST THIS THAT)
                [%JUNCTION *]     (CELL-JUNC ST THAT THIS)
                [%CONJUNCTION *]  (TALL-CONJ ST THAT THIS)
              ==
            [%JUNCTION *]
              ?-  XROLE.THIS
                %ATOM             (ATOM-JUNC ST THIS THAT)
                %TALL             (CELL-JUNC ST THIS THAT)
                %WIDE             (CELL-JUNC ST THIS THAT)
                [%CONSTANT *]     (ATOM-JUNC ST THIS THAT)
                [%INSTANCE *]     (CELL-JUNC ST THIS THAT)
                [%OPTION *]       (ATOM-JUNC ST THIS THAT)
                [%UNION *]        (CELL-JUNC ST THIS THAT)
                [%JUNCTION *]     (JUNC-JUNC ST THIS THAT)
                [%CONJUNCTION *]  (CELL-JUNC ST THIS THAT)
              ==
            [%CONJUNCTION *]
              ?-  XROLE.THIS
                %ATOM             (ATOM-CELL ST THIS THAT)
                %TALL             (TALL-CONJ ST THIS THAT)
                %WIDE             (WIDE-CONJ ST THIS THAT)
                [%CONSTANT *]     (ATOM-CELL ST THIS THAT)
                [%INSTANCE *]     (TALL-CONJ ST THIS THAT)
                [%OPTION *]       (ATOM-CELL ST THIS THAT)
                [%UNION *]        (TALL-CONJ ST THIS THAT)
                [%JUNCTION *]     (CELL-JUNC ST THAT THIS)
                [%CONJUNCTION *]  (CONJ-CONJ ST THIS THAT)
              ==
          ==
      ::
      ::  THIS GUY ACTUALLY CONSTRUCTS THE UNION TYPE BY CALLING `FORK`
      ::  FROM `HOON.HOON`. TO POPULATE THE `XDAT` FIELD, WE JUST CALL
      ::  `XRAY-BRANCHES` ON BOTH OF THE INPUT XRAYS AND UNION THE RESULT.
      ::
      ::  NODE THAT `XRAY-BRANCHES` PRODUCES A SINGLETON SET WHEN CALLED ON
      ::  A NODE THAT ISN'T A FORK, SO THIS WORKS CORRECTLY BOTH FOR
      ::  JOINING FORK NODE AND NON-FORK NODES.
      ::
      ++  JOIN
        |=  [ST=XTABLE THIS=XKEY THAT=XKEY]
        ^-  [XKEY XTABLE]
        ::
        ?:  =(THIS THAT)  [THIS ST]
        ::
        =/  THIS-XRAY=XRAY  (FOCUS-ON ST THIS)
        =/  THAT-XRAY=XRAY  (FOCUS-ON ST THAT)
        ::
        =/  UNION-TYPE=TYPE  (FORK ~[TYPE.THIS-XRAY TYPE.THAT-XRAY])
        ::
        =/  THIS-FORK  (XRAY-BRANCHES ST THIS)
        =/  THAT-FORK  (XRAY-BRANCHES ST THAT)
        =/  BRANCHES   (~(UNI IN THIS-FORK) THAT-FORK)
        ::
        (ALLOC-FORK-XRAY ST UNION-TYPE [%FORK BRANCHES])
      ::
      ::  CREATE THE JOIN OF TWO XRAYS WITH THE SPECIFIED `XROLE`.
      ::
      ++  JOINT
        |=  [ST=XTABLE X=XKEY Y=XKEY =XROLE]
        ^-  [XKEY XTABLE]
        ::
        =^  JOINED=XKEY  ST  (JOIN ST X Y)
        =/  JRAY            (FOCUS-ON ST JOINED)
        =.  ST              (REPLACE-XRAY ST JRAY(XROLE `XROLE))
        [XKEY.JRAY ST]
      ::
      ++  ATOM-ATOM                                     ::  CAN'T DISCRIMINATE
        |=  [ST=XTABLE [X=XKEY XROLE] [Y=XKEY XROLE]]
        (JOINT ST X Y [%MISJUNCTION X Y])
      ::
      ++  ATOM-CELL
        |=  [ST=XTABLE [A=XKEY XROLE] [C=XKEY XROLE]]
        (JOINT ST A C [%JUNCTION A C])
      ::
      ++  WIDE-TALL
        |=  [ST=XTABLE [W=XKEY XROLE] [T=XKEY XROLE]]
        (JOINT ST W T [%CONJUNCTION W T])
      ::
      ++  NOUN-NOUN                                     ::  CAN'T DISCRIMINATE
        |=  [ST=XTABLE [X=XKEY XROLE] [Y=XKEY XROLE]]
        (JOINT ST X Y [%MISJUNCTION X Y])
      ::
      ++  MISJUNKIN
        |=  [ST=XTABLE [X=XKEY XROLE] [Y=XKEY XROLE]]
        (JOINT ST X Y [%MISJUNCTION X Y])
      ::
      ++  ATOM-OPTN                                     ::  CAN'T DISCRIMINATE
        |=  [ST=XTABLE [X=XKEY XROLE] [Y=XKEY [%OPTION *]]]
        (JOINT ST X Y [%MISJUNCTION X Y])
      ::
      ++  CNST-OPTN
        |=  $:  ST=XTABLE
                [X=XKEY [%CONSTANT XV=ATOM]]
                [Y=XKEY [%OPTION YM=(MAP ATOM XKEY)]]
            ==
        =^  RES  ST  (COLLATE-OPTION ST [[XV X] ~ ~] YM)
        (JOINT ST X Y [%OPTION RES])
      ::
      ::  XX IF THE HAVE THE SAME XKEY, PRODUCE A NEW INSTANCE WHO'S TAIL
      ::  IS THE UNION OF BOTH TAILS.
      ::
      ++  INST-INST
        |=  $:  ST=XTABLE
                [X=XKEY [%INSTANCE XV=ATOM]]
                [Y=XKEY [%INSTANCE YV=ATOM]]
            ==
        =^  RES  ST  (COLLATE-UNION ST [[XV X] ~ ~] [[YV Y] ~ ~])
        (JOINT ST X Y [%UNION RES])
      ::
      ++  INST-UNIN
        |=  $:  ST=XTABLE
                [X=XKEY [%INSTANCE XV=ATOM]]
                [Y=XKEY [%UNION YM=(MAP ATOM XKEY)]]
            ==
        =^  RES  ST   (COLLATE-UNION ST [[XV X] ~ ~] YM)
        (JOINT ST X Y [%UNION RES])
      ::
      ++  JUNC-JUNC
        |=  $:  ST=XTABLE
                [X=XKEY [%JUNCTION XFLAT=XKEY XDEEP=XKEY]]
                [Y=XKEY [%JUNCTION YFLAT=XKEY YDEEP=XKEY]]
            ==
        =^  FLAT  ST  (MERGE ST XFLAT YFLAT)
        =^  DEEP  ST  (MERGE ST XDEEP YDEEP)
        (JOINT ST X Y [%JUNCTION FLAT DEEP])
      ::
      ::  XX JUSTIFY WHY THIS IS ALWAYS A MISJUNCTION. WHAT IF THEY HAVE
      ::  THE SAME HEAD? WOULDN'T PRODUCING A WIDE WITH THAT HEAD AND THE
      ::  UNION OF THE TWO TAILS BE COHERENT?
      ::
      ::  I *CAN* GET THE HEAD AND THE TAIL OF BOTH AND MERGE THEM,
      ::  WHY WOULD THIS NEVER MAKE SENSE?
      ::
      ++  TALL-TALL
        |=  [ST=XTABLE [X=XKEY XROLE] [Y=XKEY XROLE]]
        (JOINT ST X Y [%MISJUNCTION X Y])
      ::
      ++  UNIN-UNIN
        |=  $:  ST=XTABLE
                [X=XKEY [%UNION XM=(MAP ATOM XKEY)]]
                [Y=XKEY [%UNION YM=(MAP ATOM XKEY)]]
            ==
        =^  RES  ST  (COLLATE-UNION ST XM YM)
        (JOINT ST X Y [%UNION RES])
      ::
      ::  XX  CAN THIS EVER PRODUCE A COHERENT RESULT? IF IT CAN'T, SHOULD
      ::  THE RESULT BE A MISJUNCTION, OR SHOULD THE MISJUNCTION INSTEAD
      ::  EXIST IN THE WIDE PART OF THE RESULTING CONJUNCTION (WHAT THIS
      ::  CODE WILL DO)?
      ::
      ++  WIDE-CONJ
        |=  $:  ST=XTABLE
                [X=XKEY XROLE]
                [Y=XKEY [%CONJUNCTION YWIDE=XKEY YTALL=XKEY]]
            ==
        =^  NEW-WIDE  ST  (MERGE ST X YWIDE)
        (JOINT ST X Y [%CONJUNCTION NEW-WIDE YTALL])
      ::
      ::  XX JUSTIFY WHY THIS IS ALWAYS A MISJUNCTION. WHAT IF THEY HAVE
      ::  THE SAME HEAD? WOULDN'T PRODUCING A WIDE WITH THAT HEAD AND THE
      ::  UNION OF THE TWO TAILS BE COHERENT?
      ::
      ::  I *CAN* GET THE HEAD AND THE TAIL AND MERGE
      ::  THEM, WHY WOULD THIS NEVER MAKE SENSE?
      ::
      ++  WIDE-WIDE
        |=  [ST=XTABLE [X=XKEY XROLE] [Y=XKEY XROLE]]
        (JOINT ST X Y [%MISJUNCTION X Y])
      ::
      ++  CNST-CNST
        |=  $:  ST=XTABLE
                [X=XKEY [%CONSTANT XV=ATOM]]
                [Y=XKEY [%CONSTANT YV=ATOM]]
            ==
        =^  RES  ST  (COLLATE-OPTION ST [[XV X] ~ ~] [[YV Y] ~ ~])
        (JOINT ST X Y [%OPTION RES])
      ::
      ++  OPTN-OPTN
        |=  $:  ST=XTABLE
                [X=XKEY [%OPTION XM=(MAP ATOM XKEY)]]
                [Y=XKEY [%OPTION YM=(MAP ATOM XKEY)]]
            ==
        =^  RES  ST  (COLLATE-OPTION ST XM YM)
        (JOINT ST X Y [%OPTION RES])
      ::
      ++  TALL-CONJ
        |=  $:  ST=XTABLE
                [X=XKEY XROLE]
                [Y=XKEY [%CONJUNCTION YWIDE=XKEY YTALL=XKEY]]
                ==
        =^  NEW-TALL  ST  (MERGE ST X YTALL)
        (JOINT ST YWIDE NEW-TALL [%CONJUNCTION YWIDE NEW-TALL])
      ::
      ++  ATOM-JUNC
        |=  $:  ST=XTABLE
                [X=XKEY XROLE]
                [Y=XKEY [%JUNCTION YFLAT=XKEY YDEEP=XKEY]]
            ==
        =^  FLAT-MERGED  ST  (MERGE ST X YFLAT)
        (JOINT ST FLAT-MERGED YDEEP [%JUNCTION FLAT-MERGED YDEEP])
      ::
      ++  CELL-JUNC
        |=  $:  ST=XTABLE
                [X=XKEY XROLE]
                [Y=XKEY [%JUNCTION YFLAT=XKEY YDEEP=XKEY]]
            ==
        =^  DEEP-MERGED  ST  (MERGE ST X YDEEP)
        (JOINT ST YFLAT DEEP-MERGED [%JUNCTION YFLAT DEEP-MERGED])
      ::
      ++  CONJ-CONJ
        |=  $:  ST=XTABLE
                [X=XKEY [%CONJUNCTION XWIDE=XKEY XTALL=XKEY]]
                [Y=XKEY [%CONJUNCTION YWIDE=XKEY YTALL=XKEY]]
            ==
        =^  NEW-WIDE  ST  (MERGE ST XWIDE YWIDE)
        =^  NEW-TALL  ST  (MERGE ST XTALL YTALL)
        (JOINT ST NEW-WIDE NEW-TALL [%CONJUNCTION NEW-WIDE NEW-TALL])
      ::
      --
    --
  ::
  ::  CONVERT AN `XIMAGE` TO A SPEC FOR PRINTING.
  ::
  ++  XIMAGE-TO-SPEC
    |=  [=TOP=XKEY IMG=XTABLE]
    ^-  SPEC
    ::
    |^  (XRAY-TO-SPEC ~ TOP-XKEY)
    ::
    +$  TRACE  (SET XKEY)
    ::
    ++  XRAY-TO-SPEC
      |=  [TR=TRACE I=XKEY]
      ^-  SPEC
      =/  X=XRAY  (FOCUS-ON IMG I)
      =/  D=XDAT  (NEED XDAT.X)
      ?:  (~(HAS IN TR) I)  [%LOOP (SYNTHETIC I)]
      ?^  RECIPES.X  (RECIPE-TO-SPEC TR N.RECIPES.X)
      %+  WRAP-WITH-LOOP-BINDING  X
      =.  TR  (~(PUT IN TR) I)
      ^-  SPEC
      ?@  D  [%BASE D]
      ?-  -.D
        %ATOM  ?~  CONSTANT.D  [%BASE %ATOM AURA.D]
               ?:  &(=(%N AURA.D) =(`@`0 U.CONSTANT.D))  [%BASE %NULL]
               [%LEAF AURA.D U.CONSTANT.D]
        %CELL  =/  HD  `SPEC`$(I HEAD.D)
               =/  TL  `SPEC`$(I TAIL.D)
               =/  BOTH-BASIC  &(=([%BASE %NOUN] HD) =([%BASE %NOUN] TL))
               ?:  BOTH-BASIC      [%BASE %CELL]
               ?:  ?=(%BSCL -.TL)  [%BSCL HD +.TL]
               [%BSCL HD TL ~]
        %CORE  =/  PAYLD  $(I XRAY.D)
               =/  BATT   ^-  (MAP TERM SPEC)
                          %-  ~(RUN BY (FLATTEN-BATTERY BATT.D))
                          |=  =XKEY  ^$(I XKEY)
               ?-  R.GARB.D
                 %LEAD  [%BSZP PAYLD BATT]
                 %GOLD  [%BSDT PAYLD BATT]
                 %ZINC  [%BSTC PAYLD BATT]
                 %IRON  [%BSNT PAYLD BATT]
               ==
        %PNTR  !!
        %FACE  =/  =SPEC  $(I XRAY.D)
               ?^(FACE.D SPEC [%BSTS FACE.D SPEC])
        %FORK  =/  =XROLE  (NEED XROLE.X)
               |^  ?+  XROLE
                       ~&  [%UNEXPECTED-FORK-XROLE XKEY.X D XROLE CHOICES]
                       [%BSWT CHOICES]
                     %NOUN             [%BASE %NOUN]
                     %VOID             [%BASE %VOID]
                     [%OPTION *]       [%BSWT CHOICES]
                     [%UNION *]        [%BSCN CHOICES]
                     [%MISJUNCTION *]  [%BSWT CHOICES]
                     [%JUNCTION *]     :+  %BSVT
                                         ^$(I FLAT.XROLE)
                                       ^$(I DEEP.XROLE)
                     [%CONJUNCTION *]  :+  %BSKT
                                         ^$(I WIDE.XROLE)
                                       ^$(I TALL.XROLE)
                   ==
               ::
               ++  CHOICES
                 ^-  [I=SPEC T=(LIST SPEC)]
                 =-  ?>(?=(^ -) -)
                 (TURN ~(TAP IN SET.D) |=(=XKEY ^^$(I XKEY)))
               --
      ==
    ::
    ::  IF THIS XRAY REFERENCES ITSELF, GENERATE A $$ BINDING IN THE OUTPUT
    ::  SPEC, AND THEN WE CAN JUST REFERENCE OURSELVES BY NAME.
    ::
    ++  WRAP-WITH-LOOP-BINDING
      |=  [XR=XRAY SP=SPEC]
      ^-  SPEC
      ?.  (NEED LOOP.XR)  SP
      =/  NM  (SYNTHETIC XKEY.XR)
      [%BSBS [%LOOP NM] [[NM SP] ~ ~]]
    ::
    ::  IF WE HAVE A `RECIPE`, WE CAN GENERATE MUCH NICER OUTPUT.
    ::
    ++  RECIPE-TO-SPEC
      |=  [TR=TRACE R=RECIPE]
      ^-  SPEC
      ?-  -.R
        %DIRECT     [%LIKE [TERM.R ~] ~]
        %SYNTHETIC  =/  SUBS  %+  TURN  LIST.R
                              |=  =XKEY  (XRAY-TO-SPEC TR XKEY)
                    [%MAKE [%LIMB TERM.R] SUBS]
      ==
    ::
    ::  GENERATE SYMBOLS TO BE USED FOR LOOP REFERENCES.
    ::
    ::  GIVEN A SMALL ATOM (:NUMBER), CONSTRUCT A CORESPONDING SYMBOL
    ::  USING THE HEBREW ALPHABET.
    ::
    ++  SYNTHETIC
      |=  NUMBER=@UD
      ^-  @TAS
      =/  ALF/(LIST TERM)
          ^~  :~  %ALF  %BET  %GIM  %DAL  %HEJ  %VAV  %ZAY  %HET
                  %TET  %YOD  %KAF  %LAM  %MEM  %NUN  %SAM  %AYN
                  %PEJ  %SAD  %QOF  %RES  %SIN  %TAV
              ==
      ?:  (LTH NUMBER 22)
        (SNAG NUMBER ALF)
      (CAT 3 (SNAG (MOD NUMBER 22) ALF) $(NUMBER (DIV NUMBER 22)))
    ::
    ::  BATTERIES IN A `SPEC` DO NOT HAVE CHAPTERS, SO WE JUST IGNORE
    ::  THE CHAPTERS AND FLATTEN THE WHOLE BATTERY DOWN TO `(MAP TERM XKEY)`.
    ::
    ++  FLATTEN-BATTERY
      |=  BATT=(BATT-OF XKEY)
      ^-  (MAP TERM XKEY)
      =/  CHAPTERS  ~(TAP BY BATT)
      |-  ^-  (MAP TERM XKEY)
      ?~  CHAPTERS  ~
      (~(UNI BY Q.Q.I.CHAPTERS) $(CHAPTERS T.CHAPTERS))
    ::
    --
  ::
  --
::
::  THIS CODE PRETTY-PRINTS A VARIETY OF THINGS USING THE `XRAY` AND
::  `PLUM` LIBRARIES:
::
::  - `RENDER-VASE`: RENDERS THE DATA IN A VASE.=$-(VASE WAIN)
::  - `RENDER-HOON`: PRETTY-PRINTS A `HOON` AST AS HOON CODE.
::  - `RENDER-TYPE`: PRETTY-PRINTS A TYPE AS A HOON EXPRESSION.
::  - `RENDER-TYPE-SIMPLE`: DEBUG-PRINT FOR THE `TYPE` STRUCTURE.
::  - `RENDER-VASE-WITH-TYPE`: PRETTY PRINT A VASE: BOTH VALUE AND TYPE.
::
::  THERE'S A LOT OF LOGIC HERE, BUT MOST OF IT IS FAIRLY
::  STRAIGHT-FORWARD.
::
::  XX OUTPUT FOR CORDS IS UGLY. WHY ~~A INSTEAD OF 'A'?
::
++  LIBPPRINT
  ::
  |^  ^-  $:  RENDER-VASE=$-(VASE WAIN)
              RENDER-HOON=$-(HOON WAIN)
              RENDER-TYPE=$-(TYPE WAIN)
              TYPE-TO-PLUM=$-(TYPE PLUM)
              TYPE-TO-TANK=$-(TYPE TANK)
              VASE-TO-TANK=$-(VASE TANK)
              RENDER-TYPE-SIMPLE=$-(TYPE WAIN)
              RENDER-VASE-WITH-TYPE=$-(VASE WAIN)
          ==
      :*  RENDER-VASE
          RENDER-HOON
          RENDER-TYPE
          TYPE-TO-PLUM
          TYPE-TO-TANK
          VASE-TO-TANK
          RENDER-TYPE-SIMPLE
          RENDER-VASE-WITH-TYPE
      ==
  ::
  +|  %UTILS
  ::
  +$  BATTERY  (MAP TERM (PAIR WHAT (MAP TERM HOON)))
  ::
  +|  %RENDER
  ::
  ++  RENDER-VASE-WITH-TYPE
    |=  =VASE
    ^-  WAIN
    ::
    =/  =XIMAGE  (XRAY-TYPE:LIBXRAY 1 P.VASE)
    ::
    ::  ~&  %NOUN-TO-PLUM
    =/  VAL=PLUM  (NOUN-TO-PLUM XIMAGE Q.VASE)
    ::
    ::  ~&  %TYPE-TO-PLUM
    =/  TYP=PLUM  (SPEC-TO-PLUM (XIMAGE-TO-SPEC:LIBXRAY XIMAGE))
    ::
    =/  RESULT=PLUM
      (SEXP 'VASE' (SEXP 'TYPE' TYP ~) (SEXP 'VAL' VAL ~) ~)
    ::
    ::  ~&  %CONVERT-TO-WAIN
    ~(TALL PLUME RESULT)
  ::
  ++  RENDER-VASE
    |=  =VASE
    ^-  WAIN
    ~(TALL PLUME (VASE-TO-PLUM VASE))
  ::
  ++  RENDER-TYPE-SIMPLE
    |=  =TYPE
    ^-  WAIN
    ~(TALL PLUME (TYPE-TO-PLUM-SIMPLE TYPE 100))
  ::
  ++  RENDER-TYPE
    |=  =TYPE  ^-  WAIN
    ~(TALL PLUME (TYPE-TO-PLUM TYPE))
  ::
  ::  PRETTY-PRINT A HOON.
  ::
  ++  RENDER-HOON
    |=  =HOON  ^-  WAIN
    ~(TALL PLUME (HOON-TO-PLUM 999 HOON))
  ::
  ::  PRETTY-PRINT A TYPE GIVEN AS A STRING.
  ::
  ++  RENDER-TYPE-FROM-CORD
    |=  =CORD  ^-  WAIN
    =/  T=TYPE  -:(RIDE -:!>(..LIBXRAY) CORD)
    ~(TALL PLUME (TYPE-TO-PLUM T))
  ::
  ::  THIS IS JUST A HELPER FUNCTION FOR TESTING OUT THIS CODE.  IT JUST DIGS
  ::  THROUGH A TYPE AND FINDS HOON VALUES REFERENCED WITHIN THAT TYPE,
  ::  AND THEN RENDERS THE RESULT.
  ::
  ++  RENDER-ALL-HOONS-INSIDE-OF-TYPE
    |=  =TYPE
    ^-  WAIN
    ?.  ?=([%CORE *] TYPE)  [%ZPZP ~]
    =*  TOMES=(LIST TOME)  ~(VAL BY Q.R.Q.TYPE)
    =*  HOONS=(LIST HOON)  (TURN TOMES |=(T=TOME [%CLTR ~(VAL BY Q.T)]))
    ~(TALL PLUME (HOON-TO-PLUM 999 [%CLTR HOONS]))
  ::
  +|  %TO-PLUM
  ::
  ::  PRETTY-PRINT A VASE.
  ::
  ++  VASE-TO-PLUM
    |=  V=VASE
    ^-  PLUM
    (NOUN-TO-PLUM (XRAY-TYPE:LIBXRAY 1 P.V) Q.V)
  ::
  ::  PRETTY-PRINT A TYPE.
  ::
  ++  TYPE-TO-PLUM
    |=  T=TYPE
    ^-  PLUM
    (SPEC-TO-PLUM (XIMAGE-TO-SPEC:LIBXRAY (XRAY-TYPE:LIBXRAY 1 T)))
  ::
  ::  PRETTY-PRINT A TYPE TO A TANK.
  ::
  ++  TYPE-TO-TANK
    |=  T=TYPE
    ^-  TANK
    [%PLUM (TYPE-TO-PLUM T)]
  ::
  ::  PRETTY-PRINT A VASE TO A TANK.
  ::
  ++  VASE-TO-TANK
    |=  V=VASE
    ^-  TANK
    [%PLUM (VASE-TO-PLUM V)]
  ::
  ::  RENDER AN `AXIS`.
  ::
  ++  AXIS-TO-CORD
    |=  P=@
    ^-  CORD
    ?:  =(P 1)  '.'
    ?:  =(P 2)  '-'
    ?:  =(P 3)  '+'
    (CAT 3 '+' (SCOT %UD P))
  ::
  ::  RENDER A LIMB.  A LIMB IS EITHER AN EMPTY ATOM (WHICH IS RENDERED AS
  ::  '$') OR AN AXIS.
  ::
  ::  XX THE CODE FOR HANDLING THE `%|` ("BY NAME") CASE IS OBVIOUSLY
  ::  WRONG (THE `RUNT` CALL DOES NOTHING, FOR EXAMPLE), BUT I'M NOT SURE
  ::  WHAT IT WAS TRYING TO DO IN THE FIRST PLACE.
  ::
  ++  LIMB-TO-PLUM
    |=  =LIMB
    ^-  PLUM
    ?@  LIMB
      ?:  .=('' LIMB)  '$'
        LIMB
    ?-  -.LIMB
      %&  (AXIS-TO-CORD P.LIMB)
      ::  {%| P/@UD Q/(UNIT TERM) ]
      %|  (CRIP (RUNT [0 P.LIMB] ?~(Q.LIMB "," (TRIP U.Q.LIMB))))
    ==
  ::
  ::  RENDER A WING
  ::
  ++  WING-TO-PLUM
    |=  =WING
    ^-  PLUM
    :+  %TREE
      [WIDE=`['.' ~] TALL=~]
    (TURN `^WING`WING LIMB-TO-PLUM)
  ::
  ::  IN THE SPEC FOR A BATTERY, THERE'S A `(MAP TERM SPEC)`. THIS
  ::  TRANSFORMS ONE OF THOSE INTO A LIST OF PLUMS, ONE PER `TERM/SPEC`
  ::  PAIR.
  ::
  ++  BATTERY-SPEC-TO-PLUM-LIST
    |=  =(MAP TERM SPEC)
    %+  TURN  ~(TAP BY MAP)
    |=  [=TERM =SPEC]
    :-  %SBRK
    :+  %TREE
      [WIDE=~ TALL=`['' ~]]
    [TERM (SPEC-TO-PLUM SPEC) ~]
  ::
  ::  GIVEN A RUNE AND A SPEC FOR A CORE, TRANSFORM THAT INTO A PLUM.
  ::
  ++  CORE-SPEC-TO-PLUM
    |=  [=KNOT =SPEC =(MAP TERM SPEC)]
    ^-  PLUM
    :-  %SBRK
    :+  %TREE
      [~ `[KNOT ~]]
    :~  (SPEC-TO-PLUM SPEC)
        :+  %TREE
          [~ TALL=`['' `['++' '--']]]
        (BATTERY-SPEC-TO-PLUM-LIST MAP)
    ==
  ::
  ::  CONVERT A "STANDARD NAME" INTO A PLUM.
  ::
  ++  STUD-TO-PLUM
    |=  =STUD
    ^-  PLUM
    ?@  STUD  STUD
    :+  %TREE
      [WIDE=`['/' ~] TALL=~]
    `(LIST PLUM)`[AUTH.STUD TYPE.STUD]
  ::
  ::  CONVERT A WOOF (AN INTERPOLATED EXPRESSION INSIDE OF A STRING LITERAL)
  ::  TO A PLUM.
  ::
  ++  WOOF-TO-PLUM
    |=  =WOOF
    ^-  PLUM
    |^  ?@  WOOF  WOOF
        =*  FMT  [WIDE=`[' ' `['{' '}']] TALL=~]
        :+  %TREE  FMT
        (TURN (UNWRAP-WOOF-TUPLE +.WOOF) |=(H=HOON (HOON-TO-PLUM 999 H)))
    ::
    ::  WOOFS CONTAIN ONE OR MORE HOONS, AND IF THERE ARE MORE THAN ONE,
    ::  IT'S ENCODED WITH A %CLTR AST NODE. THIS JUST SIMPLIFIES BOTH
    ::  CASES DOWN INTO A LIST OF SUBHOONS.
    ::
    ++  UNWRAP-WOOF-TUPLE
      |=  =HOON
      ^-  (LIST ^HOON)
      ?:  ?=([%CLTR *] HOON)
        P.HOON
      ~[HOON]
    --
  ::
  ::  THIS IS JUST A TRIVIAL HELPER FUNCTION. IT'S ONLY HERE BECAUSE THIS
  ::  XPAT IS USED REPEATEDLY IN `HOON-TO-PLUM`.
  ::
  ++  HOONS-TO-PLUM-LIST
    |=  =HOON=(LIST HOON)
    ^.  (LIST PLUM)
    (TURN HOON-LIST |=(H=HOON (HOON-TO-PLUM 999 H)))
  ::
  ::  XX PLACEHOLDER FOR RENDERING A CHUM TO A PLUM.
  ::
  ++  CHUM-TO-PLUM
    |=  =CHUM
    ^-  PLUM
    %TODO-CHUM
  ::
  ::  XX PLACEHOLDER FOR RENDERING A TYRE TO A PLUM
  ::
  ++  TYRE-TO-PLUM
    |=  =TYRE
    ^-  PLUM
    %TODO-TYRE
  ::
  ::  GENERATE A LIST OF PLUMS FROM A LIST OF MATCHES. THIS WOULD BE
  ::  TRIVIAL, BUT WE ALSO NEED TO APPEND COMMAS ON EACH MATCH (BESIDES
  ::  THE LAST) WHEN `MATCHES` IS RENDERED IN WIDE MODE.
  ::
  ++  MATCHES-TO-PLUM-LIST
    |=  MATCHES=(LIST (PAIR SPEC HOON))
    ^-  (LIST PLUM)
    %-  ADD-TRAILING-COMMAS-TO-WIDE-FORM
    %+  TURN  MATCHES
    |=  [=SPEC =HOON]
    ^-  (PAIR PLUM PLUM)
    [(SPEC-TO-PLUM SPEC) (HOON-TO-PLUM 999 HOON)]
  ::
  ::  GENERATE A LIST OF PLUMS FROM A LIST OF UPDATES. THIS WOULD BE
  ::  TRIVIAL, BUT WE ALSO NEED TO APPEND COMMAS ON EACH UPDATE (BESIDES
  ::  THE LAST) WHEN THE UPDATE-LIST IS RENDERED IN WIDE MODE.
  ::
  ++  UPDATES-TO-PLUM-LIST
    |=  =UPDATE=(LIST (PAIR WING HOON))
    ^-  (LIST PLUM)
    %-  ADD-TRAILING-COMMAS-TO-WIDE-FORM
    %+  TURN  UPDATE-LIST
    |=  [=WING =HOON]
    ^-  (PAIR PLUM PLUM)
    [(WING-TO-PLUM WING) (HOON-TO-PLUM 999 HOON)]
  ::
  ::  THIS ADDS COMMAS TO A LIST OF PAIR OF HOONS, BUT ONLY IN WIDE FORM.
  ::
  ::  FOR EXAMPLE, IN WIDE FORM WITH COMMAS:
  ::
  ::    %=($ A 1, B 2)
  ::
  ::  IN TALL FORM WITHOUT COMMAS:
  ::
  ::    %=  $  A  1  B  2  ==
  ::
  ::  IT'S IMPORTANT THAT THIS NOT BE WRAPPED IN AN %SBRK, SINCE WE NEED
  ::  TO BE SURE THAT THIS IS RENDERED IN WIDE MODE IF-AND-ONLY-IF OUR
  ::  PARENT IS RENDERED IN WIDE MODE.
  ::
  ++  ADD-TRAILING-COMMAS-TO-WIDE-FORM
    |=  PLUMS=(LIST (PAIR PLUM PLUM))
    =|  ACC=(LIST (LIST PLUM))
    |^  ^-  (LIST PLUM)
      ?~  PLUMS  (ZING (FLOP ACC))
      =/  X=PLUM  P.I.PLUMS
      =/  Y=PLUM  Q.I.PLUMS
      ?~  T.PLUMS
        $(PLUMS T.PLUMS, ACC [~[X Y] ACC])
      $(PLUMS T.PLUMS, ACC [~[X (COMMA Y)] ACC])
    ++  COMMA
      |=  =SUB=PLUM
      ^-  PLUM
      :+  %TREE
        :-  [~ '' [~ '' ',']]  [~ '' ~]
      ~[SUB-PLUM]
    --
  ::
  ::  RENDER A HOON AS A PLUM.  GIVEN THE HELPER FUNCTIONS ABOVE, THIS IS
  ::  FAIRLY STRAIGHTFORWARD.  IT IS A BIG-ASS SWITCH, THOUGH.
  ::
  ++  HOON-TO-PLUM
    |=  [MAXDEPTH=@ X=HOON]
    |^  ^-  PLUM
      ?+    X
          %AUTOCONS
        [%$ @]     (AXIS-TO-CORD P.X)
        [%BASE *]  (SPEC [%BASE P.X])
        [%BUST *]  (SIMPLE-WIDE '*' '' '' (SPEC [%BASE P.X]) ~)
        [%DBUG *]  (HN Q.X)                             ::  P.X IS IRRELEVANT
        [%EROR *]  %ASSEMBLY-ERROR
        [%HAND *]  %AST-NODE-HAND
        [%NOTE *]  (HN Q.X)                             ::  P.X IS IRRELEVANT
        [%FITS *]  %AST-NODE-FITS
        [%KNIT *]  (SIMPLE-WIDE '"' '' '"' (TURN P.X WOOF-TO-PLUM))
        [%LEAF *]  (SPEC X)
        [%LIMB *]  P.X
        [%LOST *]  (HN P.X)                             ::  FOR INTERNAL USE
        [%ROCK *]  ?^  Q.X  !!  (CAT 3 '%' (CRIP (SCOW P.X `@`Q.X)))
        [%SAND *]  ?^  Q.X  !!  (CRIP (SCOW P.X `@`Q.X))
        [%TELL *]  (SIMPLE-WIDE '<' ' ' '>' (HOONS P.X))
        [%TUNE *]  ?@(P.X P.X %TODO-TUNE)
        [%WING *]  (SIMPLE-WIDE '' '.' '' (TURN P.X LIMB))
        [%YELL *]  (SIMPLE-WIDE '>' ' ' '<' (HOONS P.X))
        [%XRAY *]  (XRAY-TO-PLUM P.X)
        [%BRCB *]  (CHAPTER '|_' `(SPEC P.X) R.X)       ::  SKIP ALIASES
        [%BRCL *]  (RUNE '|:' ~ ~ (HOONS ~[P Q]:X))
        [%BRCN *]  (CHAPTER '|%' ~ Q.X)                 ::  IGNORING P.X
        [%BRDT *]  (RUNE '|.' ~ ~ (HOONS ~[P]:X))
        [%BRKT *]  (CHAPTER '|^' `(HN P.X) Q.X)
        [%BRHP *]  (RUNE '|-' ~ ~ (HN P.X) ~)
        [%BRSG *]  (RUNE '|~' ~ ~ (SPEC P.X) (HN Q.X) ~)
        [%BRTR *]  (RUNE '|*' ~ ~ (SPEC P.X) (HN Q.X) ~)
        [%BRTS *]  (RUNE '|=' ~ ~ (SPEC P.X) (HN Q.X) ~)
        [%BRVT *]  (CHAPTER '|@' ~ Q.X)                 ::  IGNORING P.X
        [%BRWT *]  (RUNE '|?' ~ ~ (HN P.X) ~)
        [%CLCB *]  (RUNE ':_' ~ ~ (HOONS ~[P Q]:X))
        [%CLKT *]  (RUNE ':^' ~ ~ (HOONS ~[P Q R S]:X))
        [%CLHP *]  (RUNE ':-' ~ `['[' SPC ']'] (HOONS ~[P Q]:X))
        [%CLLS *]  (RUNE ':+' ~ `['[' SPC ']'] (HOONS ~[P Q R]:X))
        [%CLSG *]  (RUNE ':~' `'==' `['~[' SPC ']'] (HOONS P.X))
        [%CLTR *]  ?~  P.X    '~'
                   ?~  +.P.X  (HN -.P.X)
                   (RUNE ':*' `'==' `['[' SPC ']'] (HOONS P.X))
        [%CNCB *]  (RUNE '%_' `'==' ~ (WING P.X) (UPDATES Q.X))
        [%CNDT *]  (RUNE '%.' ~ ~ (HOONS ~[P Q]:X))
        [%CNHP *]  (RUNE '%-' ~ `['(' SPC ')'] (HOONS ~[P Q]:X))
        [%CNCL *]  (RUNE '%:' `'==' `['(' SPC ')'] (HOONS [P Q]:X))
        [%CNTR *]  (RUNE '%*' `'==' ~ (WING P.X) (HN Q.X) (UPDATES R.X))
        [%CNKT *]  (RUNE '%^' ~ ~ (HOONS ~[P Q R S]:X))
        [%CNLS *]  (RUNE '%+' ~ ~ (HOONS ~[P Q R]:X))
        [%CNSG *]  (RUNE '%~' `'==' `['~(' SPC ')'] (WING P.X) (HOONS [Q R]:X))
        [%CNTS *]  ?~  Q.X  (WING P.X)
                   (RUNE '%=' `'==' ~ (WING P.X) (UPDATES Q.X))
        [%DTKT *]  (RUNE '.^' ~ ~ (SPEC P.X) (HN Q.X) ~)
        [%DTLS *]  (RUNE '.+' ~ `['+(' SPC ')'] (HOONS ~[P]:X))
        [%DTTR *]  (RUNE '.*' ~ ~ (HOONS ~[P Q]:X))
        [%DTTS *]  (RUNE '.=' ~ `['=(' SPC ')'] (HOONS ~[P Q]:X))
        [%DTWT *]  (RUNE '.?' ~ ~ (HOONS ~[P.X]))
        [%KTBR *]  (RUNE '^|' ~ ~ (HOONS ~[P.X]))
        [%KTCN *]  (RUNE '^%' ~ ~ (HOONS ~[P]:X))
        [%KTDT *]  (RUNE '^.' ~ ~ (HOONS ~[P Q]:X))
        [%KTLS *]  (RUNE '^+' ~ ~ (HOONS ~[P Q]:X))
        [%KTHP *]  (RUNE '^-' ~ ~ ~[(SPEC P.X) (HN Q.X)])
        [%KTPD *]  (RUNE '^&' ~ ~ (HOONS ~[P]:X))
        [%KTSG *]  (RUNE '^~' ~ ~ (HOONS ~[P]:X))
        [%KTTS *]  (RUNE '^=' ~ `['' '=' ''] ~[(SKIN P.X) (HN Q.X)])
        [%KTWT *]  (RUNE '^?' ~ ~ (HOONS ~[P]:X))
        [%KTTR *]  (RUNE '^*' ~ ~ ~[(SPEC P.X)])
        [%KTCL *]  (RUNE '^:' ~ ~ ~[(SPEC P.X)])
        [%SGBR *]  (RUNE '~|' ~ ~ (HOONS ~[P Q]:X))
        [%SGCB *]  (RUNE '~_' ~ ~ (HOONS ~[P Q]:X))
        [%SGCN *]  (RUNE '~%' ~ ~ (CHUM P.X) (HN Q.X) (TYRE R.X) (HN S.X) ~)
        [%SGNT *]  (RUNE '~/' ~ ~ (CHUM P.X) (HN Q.X) ~)
        [%SGLD *]  (RUNE '~<' ~ ~ (HINT P.X) (HN Q.X) ~)
        [%SGBN *]  (RUNE '~>' ~ ~ (HINT P.X) (HN Q.X) ~)
        [%SGBS *]  (RUNE '~$' ~ ~ P.X (HN Q.X) ~)
        [%SGLS *]  (RUNE '~+' ~ ~ (HN Q.X) ~)           ::  IGNORING P.X
        [%SGPD *]  (RUNE '~&' ~ ~ (HOONS ~[Q R]:X))     ::  IGNORING P.X
        [%SGTS *]  (RUNE '~=' ~ ~ (HOONS ~[P Q]:X))
        [%SGWT *]  (RUNE '~?' ~ ~ (HOONS ~[Q R S]:X))   ::  IGNORING P.X
        [%SGZP *]  (RUNE '~!' ~ ~ (HOONS ~[P Q]:X))
        [%MCTS *]  %AST-NODE-MCTS
        [%MCCL *]  (RUNE ';:' `'==' `[':(' SPC ')'] (HOONS [P Q]:X))
        [%MCNT *]  (RUNE ';/' ~ ~ (HOONS ~[P]:X))
        [%MCSG *]  (RUNE ';~' `'==' ~ (HOONS [P Q]:X))
        [%MCMC *]  (RUNE ';;' ~ ~ (HOONS ~[P Q]:X))
        [%TSBR *]  (RUNE ';;' ~ ~ ~[(SPEC P.X) (HN Q.X)])
        [%TSCL *]  (TISCOL-TO-PLUM P.X Q.X)
        [%TSNT *]  (RUNE '=/' ~ ~ (SKIN P.X) (HN Q.X) (HN R.X) ~)
        [%TSMC *]  (RUNE '=;' ~ ~ [(SKIN P.X) (HOONS ~[Q R]:X)])
        [%TSDT *]  (RUNE '=.' ~ ~ [(WING P.X) (HOONS ~[Q R]:X)])
        [%TSWT *]  (RUNE '=?' ~ ~ [(WING P.X) (HOONS ~[Q R S]:X)])
        [%TSLD *]  (RUNE '=>' ~ `['' ':' ''] (HOONS ~[P Q]:X))
        [%TSHP *]  (RUNE '=-' ~ ~ (HOONS ~[P Q]:X))
        [%TSBN *]  (RUNE '=<' ~ ~ (HOONS ~[P Q]:X))
        [%TSKT *]  (RUNE '=^' ~ ~ [(SKIN P.X) (WING Q.X) (HOONS ~[R S]:X)])
        [%TSLS *]  (RUNE '=+' ~ ~ (HOONS ~[P Q]:X))
        [%TSSG *]  (RUNE '=~' `'==' ~ (HOONS P:X))
        [%TSTR *]  ?~  Q.P.X
                     (RUNE '=*' ~ ~ P.P.X (HOONS ~[Q R]:X))
                   (RUNE '=*' ~ ~ (SPEC [%BSTS P.P.X U.Q.P.X]) (HOONS ~[Q R]:X))
        [%TSCM *]  (RUNE '=,' ~ ~ (HOONS ~[P Q]:X))
        [%WTBR *]  (RUNE '?|' `'--' `['|(' ' ' ')'] (HOONS P:X))
        [%WTHP *]  (RUNE '?-' `'==' ~ (WING P.X) (MATCHES Q.X))
        [%WTCL *]  (RUNE '?:' ~ ~ (HOONS ~[P Q R]:X))
        [%WTDT *]  (RUNE '?.' ~ ~ (HOONS ~[P Q R]:X))
        [%WTKT *]  (RUNE '?^' ~ ~ [(WING P.X) (HOONS ~[Q R]:X)])
        [%WTLD *]  (RUNE '?<' ~ ~ (HOONS ~[P Q]:X))
        [%WTBN *]  (RUNE '?>' ~ ~ (HOONS ~[P Q]:X))
        [%WTLS *]  (RUNE '?+' `'==' ~ (WING P.X) (HN Q.X) (MATCHES R.X))
        [%WTPD *]  (RUNE '?&' `'==' `['&(' ' ' ')'] (HOONS P:X))
        [%WTVT *]  (RUNE '?@' ~ ~ (WING P.X) (HOONS ~[Q R]:X))
        [%WTSG *]  (RUNE '?~' ~ ~ (WING P.X) (HOONS ~[Q R]:X))
        [%WTHX *]  (RUNE '?#' ~ ~ (SKIN P.X) (WING Q.X) ~)
        [%WTTS *]  (RUNE '?=' ~ ~ (SPEC P.X) (WING Q.X) ~)
        [%WTZP *]  (RUNE '?!' ~ `['!' '' ''] (HOONS ~[P]:X))
        [%ZPCM *]  (RUNE '!,' ~ ~ (HOONS ~[P Q]:X))
        [%ZPBN *]  (RUNE '!>' ~ ~ (HOONS ~[P]:X))
        [%ZPMC *]  (RUNE '!;' ~ ~ (HOONS ~[P Q]:X))
        [%ZPTS *]  (RUNE '!=' ~ ~ (HOONS ~[P]:X))
        [%ZPVT *]  (RUNE '!@' ~ ~ (WINGSEQ P.X) (HOONS ~[Q R]:X))
        [%ZPWT *]  (HN Q.X)                             ::  IGNORE P.X
        [%ZPZP ~]  '!!'
      ==
      ++  HOONS      HOONS-TO-PLUM-LIST
      ++  BATTERY    BATTERY-TO-PLUM-LIST
      ++  CHAPTER    CHAPTERS-TO-PLUM
      ++  CHUM       CHUM-TO-PLUM
      ++  HINT       HINT-TO-PLUM
      ++  HN         |=  H=HOON  (HOON-TO-PLUM (DEC MAXDEPTH) H)
      ++  LIMB       LIMB-TO-PLUM
      ++  MATCHES    MATCHES-TO-PLUM-LIST
      ++  SKIN       SKIN-TO-PLUM
      ++  SPC        ' '
      ++  SPEC       SPEC-TO-PLUM
      ++  TYRE       TYRE-TO-PLUM
      ++  UPDATES    UPDATES-TO-PLUM-LIST
      ++  WING       WING-TO-PLUM
      ++  WINGSEQ    WINGSEQ-TO-PLUM
      ::
      ::  HERE'S AN EXAMPLE OF WHAT A HINT LOOKS LIKE.
      ::
      ::      ~>(%MEAN.[%LEAF "NEED"] !!)
      ::
      ::  THE ACTUAL FORM THAT WE'RE PRINTING HERE LOOKS SOMETHING LIKE THIS:
      ::
      ::      %MEAN.[%LEAF "NEED"]
      ::
      ::  XX I'M NOT SURE IF THE `[%LEAF "NEED"]` BIT REPRESENTS A LITERAL
      ::  AST FRAGMENT OR AN EXPRESSION THAT EVALUATES TO `[%LEAF "NEED"]. I'M
      ::  GOING TO ASSUME THE LATTER FOR NOW.
      ::
      ++  TISCOL-TO-PLUM
        |=  [UPDATES=(LIST [^WING HOON]) BODY=HOON]
        ^-  PLUM
        =/  REM=(LIST (PAIR ^WING HOON))  UPDATES       ::  NOTE [TISCOL ORDER]
        =/  ACC=HOON  BODY
        %+  HOON-TO-PLUM  (DEC MAXDEPTH)
        |-  ^-  HOON
        ?~  REM  ACC
        $(REM T.REM, ACC `HOON`[%TSDT `^WING`P.I.REM `HOON`Q.I.REM `HOON`ACC])
        ::
        ::  NOTE [TISCOL ORDER]
        ::  ~~~~~~~~~~~~~~~~~~~
        ::  BY ACCUMULATING OVER THE UPDATES LIST FROM THE FRONT, WE ARE
        ::  EFFECTIVELY REVERSING THE ASSIGNMENT ORDER OF THE FORMS IN `.=`.
        ::  THIS IS SEMANTICALLY CORRECT:
        ::
        ::      > =A 3
        ::      > =B 4
        ::      > =:  A  4  B  A  ==  B
        ::      3
        ::      > +HOON-PRINTER !,  *HOON  =:  A  4  B  A  ==  B
        ::      <|=.(B A =.(A 4 B))|>
        ::      > =.(A 4 =.(B A B))
        ::      4
        ::      > =.(B A =.(A 4 B))
        ::      3
    --
  ::
  ::  PRETTY-PRINT A HINT.
  ::
  ++  HINT-TO-PLUM
    |=  HINT=$@(TERM (PAIR TERM HOON))
    ^-  PLUM
    ?@  HINT  (CAT 3 '%' HINT)
    :+  %TREE
      [WIDE=`['.' ~] TALL=~]
    :~  (CAT 3 '%' P.HINT)
        (HOON-TO-PLUM 999 Q.HINT)
    ==
  ::
  ::  PRETTY-PRINT A HOON BATTERY.
  ::
  ++  BATTERY-TO-PLUM-LIST
    |=  =(MAP TERM HOON)
    ^-  (LIST PLUM)
    %+  TURN  ~(TAP BY MAP)
    |=  [=TERM =HOON]
    =/  FMT  [WIDE=`['  ' ~] TALL=`['' ~]]
    :-  %SBRK
    :+  %TREE  FMT
    [TERM (HOON-TO-PLUM 999 HOON) ~]
  ::
  ::  PRETTY-PRINT A CORE.
  ::
  ++  CORE-TO-PLUM
    |=  [=KNOT HEAD=(UNIT PLUM) =(MAP TERM HOON)]
    ^-  PLUM
    =*  KIDS  (BATTERY-TO-PLUM-LIST MAP)
    :-  %SBRK
    :-  %TREE
      ?~  HEAD
        :-  [~ `[KNOT `['++' '--']]]
        KIDS
      :-  [~ `[KNOT ~]]
      :~  U.HEAD
          =*  BATTERY-FMT  [~ `['' `['++' '--']]]
          [%TREE BATTERY-FMT KIDS]
      ==
  ::
  ::  XX DOCUMENT THIS
  ::
  ::  XX WHAT'S A CLEANER WAY TO IMPLEMENT THIS?
  ::
  ++  CHAPTERS-TO-PLUM
    |=  [=KNOT HEAD=(UNIT PLUM) =(MAP TERM TOME)]
    ^-  PLUM
    =/  CHAPTERS=(LIST (PAIR TERM TOME))  ~(TAP BY MAP)
    =*  WITH-CHAPTERS  (CHAPTERS-TO-PLUM-VERBOSE KNOT HEAD MAP)
    =*  WITHOUT-CHAPS  (CORE-TO-PLUM KNOT HEAD Q.Q.I.CHAPTERS)
    ?~  CHAPTERS  WITH-CHAPTERS
    ?~  T.CHAPTERS
      ?:  .=('' P.I.CHAPTERS)  WITHOUT-CHAPS
      WITH-CHAPTERS
    WITH-CHAPTERS
  ::
  ::  XX DOCUMENT THIS.
  ::
  ++  CHAPTERS-TO-PLUM-VERBOSE
    |=  [=KNOT HEAD=(UNIT PLUM) =(MAP TERM TOME)]
    ^-  PLUM
    =/  CHAPS=(LIST (PAIR TERM TOME))
      ~(TAP BY MAP)
    :+  %TREE
      [~ `[KNOT `['' '--']]]
    =/  KIDS=(LIST PLUM)
      %+  TURN  CHAPS
      CHAPTER-TO-PLUM
    ?~  HEAD  KIDS
    [U.HEAD KIDS]
  ::
  ::  XX DOCUMENT THIS.
  ::
  ++  CHAPTER-TO-PLUM
    |=  [NM=KNOT [* BAT=(MAP TERM HOON)]]
    ^-  PLUM
    :+  %TREE
      [~ `['+|' ~]]
    :~  (CAT 3 '%' NM)
        :+  %TREE
          [~ `['' `['++' '']]]
        (BATTERY-TO-PLUM-LIST BAT)
    ==
  ::
  ::  XX DOCUMENT THIS.
  ::
  ++  CHAPTERS-TO-PLUM-LIST
    |=  =(MAP TERM TOME)
    ^-  (LIST PLUM)
    %+  TURN  ~(TAP BY MAP)
    |=  [=TERM [* HOONS=(^MAP TERM HOON)]]
    ^-  PLUM
    ?:  =(TERM '')
      :+  %TREE  [WIDE=~ TALL=[~ '' ~]]  (BATTERY-TO-PLUM-LIST HOONS)
    (RUNE '+|' ~ ~ [(CAT 3 '%' TERM) (BATTERY-TO-PLUM-LIST HOONS)])
  ::
  ::  XX DOCUMENT THIS.
  ::
  ++  XRAY-TO-PLUM
    |=  =MANX:HOOT
    ^-  PLUM
    %AST-NODE-XRAY                                      ::  XX PUNT
  ::
  ::  RENDER A PLUM TO A SKIN.
  ::
  ++  SKIN-TO-PLUM
    |=  =SKIN
    ^-  PLUM
    ?@  SKIN  SKIN
    %TODO-COMPLEX-SKIN                                  ::  XX PUNT
  ::
  ::  RENDER A LIST OF WINGS A PLUM THAT LOOKS SOMETHING LIKE "A:B:C"
  ::
  ++  WINGSEQ-TO-PLUM
    |=  =(LIST WING)
    ^-  PLUM
    =*  FMT  [WIDE=`[':' ~] TALL=~]
    [%TREE FMT (TURN LIST WING-TO-PLUM)]
  ::
  ::  RENDERS A SPEC TO A PLUM. SIMILARLY TO `HOON-TO-PLUM`, GIVEN ALL OF
  ::  THE HELPER FUNCTIONS THIS BECOMES QUITE SIMPLE. IT DOES HAVE A LOT OF
  ::  CASES, THOUGH.
  ::
  ++  SPEC-TO-PLUM
    |^  |=  =SPEC
        ^-  PLUM
        ?-  -.SPEC
          %BASE  ?-  P.SPEC
                   %NOUN  '*'
                   %CELL  '^'
                   %FLAG  '?'
                   %NULL  '~'
                   %VOID  '!!'
                   [%ATOM *]  (CAT 3 '@' P.P.SPEC)
                 ==
          %DBUG  $(SPEC Q.SPEC)
          %LEAF  =+((SCOT P.SPEC Q.SPEC) ?:(=('~' -) - (CAT 3 '%' -)))
          %LIKE  TREE/[[`[':' ~] ~] (TURN `(LIST WING)`+.SPEC WING-TO-PLUM)]
          %LOOP  (CAT 3 '$' P.SPEC)
          %NAME  $(SPEC Q.SPEC)
          %MADE  $(SPEC Q.SPEC)
          %OVER  $(SPEC Q.SPEC)
          %MAKE  =+  (LENT Q.SPEC)
                 :-  %SBRK
                 :+  %TREE
                   :-  WIDE=`[' ' `['(' ')']]
                   :-  ~
                   ?:  |((GTH - 3) =(- 0))
                     ['%:' `['' '==']]
                   :_  ~
                   ?:  =(- 3)  '%^'
                   ?:  =(- 2)  '%+'  '%-'
                 [(DOHOON P.SPEC) (TURN Q.SPEC ..$)]
          %BSBS  (CORE-SPEC-TO-PLUM '$$' P.SPEC Q.SPEC)
          %BSBR  (SUBTREE (FIXED '$|') $(SPEC P.SPEC) (DOHOON Q.SPEC) ~)
          %BSCB  (DOHOON P.SPEC)
          %BSCL  :-  %SBRK
                 :+  %TREE
                   [`[' ' `['[' ']']] `['$:' `['' '==']]]
                 (TURN `(LIST ^SPEC)`+.SPEC ..$)
          %BSCN  (SUBTREE (VARYING '$%' '==') (TURN `(LIST ^SPEC)`+.SPEC ..$))
          %BSDT  (CORE-SPEC-TO-PLUM '$.' P.SPEC Q.SPEC)
          %BSLD  (SUBTREE (FIXED '$<') $(SPEC P.SPEC) $(SPEC Q.SPEC) ~)
          %BSBN  (SUBTREE (FIXED '$>') $(SPEC P.SPEC) $(SPEC Q.SPEC) ~)
          %BSHP  (SUBTREE (FIXED '$-') $(SPEC P.SPEC) $(SPEC Q.SPEC) ~)
          %BSKT  (SUBTREE (FIXED '$^') $(SPEC P.SPEC) $(SPEC Q.SPEC) ~)
          %BSLS  (SUBTREE (FIXED '$+') (STUD-TO-PLUM P.SPEC) $(SPEC Q.SPEC) ~)
          %BSNT  (CORE-SPEC-TO-PLUM '$/' P.SPEC Q.SPEC)
          %BSMC  (SUBTREE (FIXED '$;') (DOHOON P.SPEC) ~)
          %BSPD  (SUBTREE (FIXED '$&') $(SPEC P.SPEC) (DOHOON Q.SPEC) ~)
          %BSSG  (SUBTREE (FIXED '$~') (DOHOON P.SPEC) $(SPEC Q.SPEC) ~)
          %BSTC  (CORE-SPEC-TO-PLUM '$`' P.SPEC Q.SPEC)
          %BSTS  :-  %SBRK
                 :+  %TREE
                   [`['=' ~] `['$=' ~]]
                 :~  (SKIN-TO-PLUM P.SPEC)
                     $(SPEC Q.SPEC)
                 ==
          %BSVT  (SUBTREE (FIXED '$@') $(SPEC P.SPEC) $(SPEC Q.SPEC) ~)
          %BSWT  :-  %SBRK
                 :+  %TREE
                    [`[' ' `['?(' ')']] `['$?' `['' '==']]]
                 (TURN `(LIST ^SPEC)`+.SPEC ..$)
          %BSZP  (CORE-SPEC-TO-PLUM '$.' P.SPEC Q.SPEC)
        ==
    ::
    ++  VARYING
      |=  [INTRO=KNOT FINAL=KNOT]
      [`[' ' `[(CAT 3 INTRO '(') ')']] `[INTRO `['' FINAL]]]
    ::
    ++  DOHOON
      |=  H=HOON  (HOON-TO-PLUM 999 H)
    ::
    --
  ::
  ++  NOUN-TO-PLUM
    |=  [XT=XIMAGE =TOP=NOUN]
    ^-  PLUM
    ::
    =/  IMG  XTABLE.XT
    ::
    |^  (MAIN ROOT.XT TOP-NOUN)
    ::
    ++  MAIN
      |=  [I=XKEY N=*]
      ^-  PLUM
      =/  X=XRAY  (FOCUS-ON:LIBXRAY IMG I)
      ?~  PATS.X  (RENDER-WITH-XDAT I (NEED XDAT.X) N)
      (RENDER-WITH-XPAT U.PATS.X N)
    ::
    ++  TREE-NOUN-TO-LIST
      |=  N=*
      ^-  (LIST *)
      ?@  N  ~
      :-  -.N
      %-  ZING
      :~  (TREE-NOUN-TO-LIST +.+.N)
          (TREE-NOUN-TO-LIST -.+.N)
      ==
    ::
    ++  NOUN-TO-LIST
      |=  N=*
      ^-  (LIST *)
      ?@  N  ~
      [-.N $(N +.N)]
    ::
    ++  RENDER-TREE
      |=  [ELT=XKEY NOUN=*]
      ^-  PLUM
      ?~  NOUN  '~'
      =/  NS=(LIST *)     (TREE-NOUN-TO-LIST NOUN)
      =/  PS=(LIST PLUM)  (TURN NS |=(N=* (MAIN ELT N)))
      =/  ELEMS=PLUM      (RUNE ':~' `'==' `['~[' ' ' ']'] PS)
      (RUNE '%-' ~ `['(' ' ' ')'] ~['TREE' ELEMS])
    ::
    ++  RENDER-LIST
      |=  [ELT=XKEY NOUN=*]
      ^-  PLUM
      ?~  NOUN  '~'
      =/  NS=(LIST *)     (NOUN-TO-LIST NOUN)
      =/  PS=(LIST PLUM)  (TURN NS |=(N=* (MAIN ELT N)))
      (RUNE ':~' `'==' `['~[' ' ' ']'] PS)
    ::
    ++  RENDER-UNIT
      |=  [I=XKEY N=*]
      ^-  PLUM
      ?~  N  '~'
      (TUPLE-PLUM ~['~' (MAIN I +:N)])
    ::
    ++  TUPLE-PLUM
      |=  KIDS=(LIST PLUM)
      ^-  PLUM
      =/  N  (LENT KIDS)
      (RUNE ':*' `['=='] `['[' ' ' ']'] KIDS)
    ::
    ++  RENDER-ATOM
     |=  [=AURA =ATOM]
     ^-  CORD
     ?:  =(AURA '')
       (SCOT %UD ATOM)
     (SCOT AURA ATOM)
    ::
    ++  RENDER-CONST
      |=  [=AURA CONST=@ =ATOM]
      ^-  PLUM
      ?:  =(~.N AURA)  '~'
      (CAT 3 '%' (RENDER-ATOM AURA ATOM))
    ::
    ++  UNTYPED-NOUN  ::  XX WHERE IS THE EXISTING CODE FOR DOING THIS?
      |=  [N=*]       ::  CAN I JUST USE THAT?
      ^-  PLUM
      ?@  N  (RENDER-ATOM 'UD' N)
      (TUPLE-PLUM ~[(UNTYPED-NOUN -:N) (UNTYPED-NOUN +:N)])
    ::
    ++  RENDER-TUPLE
      |=  [I=XKEY N=*]
      ^-  PLUM
      =/  ACC=(LIST PLUM)  ~
      %-  TUPLE-PLUM
      %-  FLOP
      |-
      ^-  (LIST PLUM)
      ::
      =/  X=XRAY  (FOCUS-ON:LIBXRAY IMG I)
      =/  D=XDAT  (NEED XDAT.X)
      ::
      ?^  PATS.X           [(MAIN I N) ACC]
      ?.  ?=([%CELL *] D)  [(MAIN I N) ACC]
      %=  $
        ACC  [(MAIN HEAD.D -:N) ACC]
        N    +:N
        I    TAIL.D
      ==
    ::
    ++  RENDER-WITH-XDAT
      |=  [I=XKEY D=XDAT N=*]
      ^-  PLUM
      ?-  D
        %VOID      '!!'
        %NOUN      (UNTYPED-NOUN N)
        [%CELL *]  (RENDER-TUPLE I N)
        [%ATOM *]  ?^  N  ~&  [%NOT-AN-ATOM I D N]  !!
                   ?~  CONSTANT.D  (RENDER-ATOM AURA.D N)
                   (RENDER-CONST AURA.D U.CONSTANT.D N)
        [%FACE *]  (MAIN XRAY.D N)
        [%PNTR *]  !!
        [%CORE *]  (RENDER-CORE GARB.D XRAY.D BATT.D)
        [%FORK *]  (RENDER-FORK I N)
      ==
    ::
    ++  RENDER-FORK
      |=  [I=XKEY N=*]
      ^-  PLUM
      ::
      =/  X=XRAY  (FOCUS-ON:LIBXRAY IMG I)
      ?~  XROLE.X  ~&  X  '%EVIL-FORK'
      =/  R=XROLE  U.XROLE.X
      ::
      ?-  R
        %VOID          !!
        %NOUN          !!
        %ATOM          !!
        %TALL          !!
        %WIDE          !!
        [%CONSTANT *]  !!
        [%INSTANCE *]  !!
        [%UNION *]
          ::  ~&  %RENDER-UNION
          ?>  ?=(^ N)
          =/  HD=*  -:N
          ?>  ?=(@ HD)
          ::
          =/  PAIRS=(LIST (PAIR ATOM XKEY))  ~(TAP BY MAP.R)
          |-
          ?~  PAIRS  '%BAD-UNION-FORK'
          ?.  =(P.I.PAIRS HD)  $(PAIRS T.PAIRS)
          (MAIN Q.I.PAIRS N)
        [%OPTION *]
          ::  ~&  %RENDER-OPTION
          =/  PAIRS=(LIST (PAIR ATOM XKEY))  ~(TAP BY MAP.R)
          |-
          ?~  PAIRS  '%BAD-OPTION-FORK'
          ?.  =(P.I.PAIRS N)  $(PAIRS T.PAIRS)
          (MAIN Q.I.PAIRS N)
        [%JUNCTION *]
          ::  ~&  %RENDER-JUNCTION
          (MAIN ?@(N FLAT.R DEEP.R) N)
        [%CONJUNCTION *]
          ::  ~&  %RENDER-CONJUNCTION
          ?>  ?=(^ N)
          =/  HD=*  -:N
          (MAIN ?@(HD TALL.R WIDE.R) N)
        [%MISJUNCTION *]
          ::  ~&  %RENDER-MISJUNCTION
          '%MISJUNCTION'
      ==
    ::
    ++  RENDER-GATE
      |=  [=SAMPLE=XKEY =PRODUCT=XKEY]
      ^-  PLUM
      %-  SPEC-TO-PLUM  :*
        %BSHP
        (XIMAGE-TO-SPEC:LIBXRAY SAMPLE-XKEY IMG)
        (XIMAGE-TO-SPEC:LIBXRAY PRODUCT-XKEY IMG)
      ==
    ::
    ++  RENDER-CORE
      |=  [=GARB XRAY=XKEY =XBAT]
      ^-  PLUM
      ::
      =/  CVT-ARMS
        |=  M=(MAP TERM XKEY)
        ^-  (MAP TERM HOON)
        %-  ~(GAS BY *(MAP TERM HOON))
        %+  TURN  ~(TAP BY M)
        |=  [T=TERM I=XKEY]
        =.  T  ?:(=('' T) '$' T)
        ^-  [TERM HOON]
        :-  T
        [%ZPZP ~]
      ::
      =/  BATT=(MAP TERM TOME)
        %-  ~(GAS BY *(MAP TERM TOME))
        %+  TURN  ~(TAP BY XBAT)
        |=  [NM=TERM W=WHAT ARMS=(MAP TERM XKEY)]
        [NM W (CVT-ARMS ARMS)]
      ::
      (HOON-TO-PLUM 999 [%BRCN P.GARB BATT])
    ::
    ++  PATH-TO-PLUM
      |=  =PATH
      ^-  PLUM
      =/  FMT=PLUMFMT  [[~ '/' [~ '/' '']] ~]
      [%TREE FMT PATH]
    ::
    ++  NOCK-TO-PLUM
      |=  N=NOCK
      ^-  PLUM
      (UNTYPED-NOUN N)
    ::
    ++  TOUR-TO-PLUM
      |=  T=TOUR
      ^-  PLUM
      '%TOUR'                                           ::  XX TODO
    ::
    ++  RENDER-WITH-XPAT
      |=  [P=XPAT N=*]
      ^-  PLUM
      ?-  P
        %HOON      (HOON-TO-PLUM 999 ((HARD HOON) N))
        %JSON      (JSON-TO-PLUM ((HARD JSON) N))
        %MANX      (MANX-TO-PLUM ((HARD MANX) N))
        %NOCK      (NOCK-TO-PLUM ((HARD NOCK) N))
        %PATH      (PATH-TO-PLUM ((HARD PATH) N))
        %PLUM      ((HARD PLUM) N)
        %SKIN      (SKIN-TO-PLUM ((HARD SKIN) N))
        %SPEC      (SPEC-TO-PLUM ((HARD SPEC) N))
        %TAPE      (TAPE-TO-PLUM ((HARD TAPE) N))
        %TOUR      (TOUR-TO-PLUM ((HARD TOUR) N))
        %TYPE      =/  TTP  TYPE-TO-PLUM
                   ((HARD PLUM) .*(TTP(+< N) [9 2 0 1]))
        %VASE      =/  VTP  VASE-TO-PLUM
                   =/  =PLUM  ((HARD PLUM) .*(VTP(+< N) [9 2 0 1]))
                   (RUNE '!>' ~ ~ ~[PLUM])
        [%GATE *]  (RENDER-GATE SAMPLE.P PRODUCT.P)
        [%GEAR *]  '%GEAR'                              ::  XX TODO
        [%LIST *]  (RENDER-LIST ITEM.P N)
        [%TREE *]  (RENDER-TREE ITEM.P N)
        [%UNIT *]  (RENDER-UNIT ITEM.P N)
      ==
    ::
    ++  TAPE-TO-PLUM
      |=  =TAPE
      ^-  PLUM
      (SIMPLE-WIDE '"' '' '"' `(LIST PLUM)`TAPE)
    ::
    --
  ::
  ++  TYPE-TO-PLUM-SIMPLE
    |^  MAIN
    ::
    ++  MAIN
      |=  [TY=TYPE MAXDEPTH=@UD]
      ^-  PLUM
      ?:  =(0 MAXDEPTH)  'DEEP'
      =/  D  (DEC MAXDEPTH)
      ?-  TY
        %VOID      '!!'
        %NOUN      '*'
        [%ATOM *]  (SEXP 'ATOM' P.TY ?~(Q.TY '~' (SCOT %UD U.Q.TY)) ~)
        [%CELL *]  (SEXP 'CONS' (MAIN P.TY D) (MAIN Q.TY D) ~)
        [%CORE *]  =/  PAYLOAD  (SEXP 'PAYLOAD' (MAIN P.TY D) ~)
                   (SEXP 'CORE' (ARMS Q.TY) PAYLOAD ~)
        [%FACE *]  (SEXP 'FACE' (TYPE-FACE-TO-PLUM P.TY) (MAIN Q.TY D) ~)
        [%FORK *]  =/  FORKS  %+  TURN  ~(TAP IN P.TY)  |=(T=TYPE (MAIN T D))
                   (SEXP 'FORK' FORKS)
        [%HINT *]  (SEXP 'HINT' 'HINT' (MAIN Q.TY D) ~)
        [%HOLD *]  'HOLD'
      ==
    ::
    ++  ARMS
      |=  =COIL
      ^-  PLUM
      =/  ARMS  (ARM-NAMES Q.R.COIL)
      =.  ARMS  (TURN ARMS |=(C=CORD ?:(=('' C) '$' C)))
      ?:  (GTE (LENT ARMS) 50)  'KERNEL'
      (SEXP 'ARMS' (CHAPTERS-TO-PLUM-LIST Q.R.COIL))
    ::
    ::  GIVEN A BATTERY EXPRESSION (FROM A HOON EXPRESSION), PRODUCE A LIST
    ::  OF ARM NAMES.
    ::
    ++  ARM-NAMES
      |=  =BATTERY
      ^-  (LIST TERM)
      %-  ZING
      %+  TURN  ~(VAL BY BATTERY)
      |=  [=WHAT ARMS=(MAP TERM HOON)]
      ^-  (LIST TERM)
      ~(TAP IN ~(KEY BY ARMS))
    ::
    ++  TYPE-FACE-TO-PLUM
      |=  F=$@(TERM TUNE)
      ^-  PLUM
      ?@  F  F
      (TUNE-TO-PLUM F)
    ::
    ++  TUNE-TO-PLUM
      |=  =TUNE
      ^-  PLUM
      =/  ALIASES  P.TUNE
      =/  BRIDGES  Q.TUNE
      =/  FMT  [[~ ' ' [~ '[' ']']] ~]
      =/  ALIASES
        :-  %SBRK
        [%TREE FMT 'ALIASES' (TURN ~(TAP BY P.TUNE) ALIAS-TO-PLUM)]
      =/  BRIDGES
        :-  %SBRK
        [%TREE FMT 'BRIDGES' (TURN Q.TUNE |=(H=HOON (HOON-TO-PLUM 999 H)))]
      :-  %SBRK
      [%TREE FMT 'TUNE' BRIDGES ALIASES ~]
    ::
    ++  ALIAS-TO-PLUM
      |=  [=TERM =(UNIT HOON)]
      ^-  PLUM
      =/  FMT  [[~ ' ' [~ '(' ')']] ~]
      [%SBRK [%TREE FMT 'ALIAS' TERM ?~(UNIT '~' (HOON-TO-PLUM 999 U.UNIT)) ~]]
    ::
    --
  ::
  ++  JSON-TO-PLUM
    ::
    ::  NOTE THAT `ARRAYFMT` AND `OBJFMT` USE CORE-LIKE FORMATTING IN
    ::  THE TALL CASE. THIS IS KIND-OF A HACK BUT WORKS WELL!
    ::
    =/  ARRFMT=PLUMFMT  :-  WIDE=`[' ' `['[' ']']]
                            TALL=`['[ ' `['' ']']]
    ::
    =/  OBJFMT=PLUMFMT  :-  WIDE=`[' ' `['{' '}']]
                            TALL=`['{ ' `['' '}']]
    ::
    ::  NOTE THAT `KIDFMT` USES THE MAGICAL "ACE-ACE" RUNE TO GET
    ::  4-SPACE INDENTATION.
    =/  KIDFMT=PLUMFMT  [WIDE=`['' ~] TALL=`['  ' `['' '']]]
    ::
    =/  COLFMT=PLUMFMT  [WIDE=`[' ' ~] TALL=`['' `['' '']]]
    ::
    |^  JSN
    ::
    ++  STR  |=  T=@T
             ^-  CORD
             (CAT 3 '"' (CAT 3 T '"'))                  ::  XX ESCAPING
    ::
    ++  KEY  |=  T=@T
             ^-  CORD
             (CAT 3 (STR T) ':')
    ::
    ++  KID  |=  KIDS=(LIST PLUM)
             ^-  PLUM
             [%TREE KIDFMT KIDS]
    ::
    ++  JSN  |=  J=JSON
             ^-  PLUM
             ?-  J
               ~       'NULL'
               [%A *]  (ARR P.J)
               [%B *]  ?:(P.J 'TRUE' 'FALSE')
               [%O *]  (OBJ P.J)
               [%N *]  P.J
               [%S *]  (STR P.J)
             ==
    ::
    ++  ARR  |=  L=(LIST JSON)
             ^-  PLUM
             [%SBRK [%TREE ARRFMT (SEQ (TURN L JSN))]]
    ::
    ++  OBJ  |=  M=(MAP @T JSON)
             ^-  PLUM
             [%SBRK [%TREE OBJFMT (SEQ (TURN ~(TAP BY M) COL))]]
    ::
    ++  COL  |=  [K=@T V=JSON]
             ^-  PLUM
             [%SBRK [%TREE COLFMT ~[(KEY K) (KID (JSN V) ~)]]]
    ::
    ::
    ::  ADDS A COMMA TO THE END OF EVERY PLUM BUT THE LAST.
    ::
    ++  SEQ  |=  PS=(LIST PLUM)
             ^-  (LIST PLUM)
             =/  ACC=(LIST PLUM)  ~
             |-
             ?~  PS    (FLOP ACC)
             ?~  T.PS  (FLOP [I.PS ACC])
             %=  $
               ACC  [(COM I.PS) ACC]
               PS   `(LIST PLUM)`T.PS
             ==
    ::
    ++  LST  |=  PS=(LIST PLUM)
             ^-  (LIST PLUM)
             =/  ACC=(LIST PLUM)  ~
             |-
             ?~  PS    (FLOP ACC)
             ?~  T.PS  (FLOP [(COM I.PS) ACC])
             %=  $
               ACC  [I.PS ACC]
               PS   `(LIST PLUM)`T.PS
             ==
    ::
    ::  ADDS A COMMA AT THE END OF A PLUM IN BOTH WIDE AND TALL MODES.
    ::
    ++  COM  |=  P=PLUM
             ^-  PLUM
             ?-  P
               @          (CAT 3 P ',')
               [%SBRK *]  [%SBRK (COM KID.P)]
               [%PARA *]  P
               [%TREE *]
                 ?.  ?&  ?=(^ TALL.FMT.P)
                         ?|  =('  ' INTRO.U.TALL.FMT.P)
                             =('' INTRO.U.TALL.FMT.P)
                         ==
                     ==
                   P(FMT (HAK FMT.P))
                 P(KIDS (LST KIDS.P))
             ==
    ::
    ::  NASTY HACK TO ADD A TRAILING COMMA TO AN ELEMENT IN A SEQUENCE.
    ::
    ::  EVERYTHING THAT CAN APPEAR IN A SEQUENCE HAS A PLUM THAT IS
    ::  EITHER A CORD OR HAS A `PLUMFMT` THAT CONTAINS A TERMINATOR
    ::  CHARACTER (POSSIBLY EMPTY) IN BOTH WIDE AND TALL FORMATS.
    ::
    ::  THIS ROUTINE FUDGES A `PLUMFMT` VALUE SO THAT A TRAILING COMMA
    ::  WILL BE INSERTED AT THE END
    ::
    ++  HAK  |=  FMT=PLUMFMT
             ^-  PLUMFMT
             ::
             %=  FMT
               WIDE  ?~  WIDE.FMT            WIDE.FMT
                     ?~  ENCLOSE.U.WIDE.FMT  WIDE.FMT
                     =.  Q.U.ENCLOSE.U.WIDE.FMT
                       (CAT 3 Q.U.ENCLOSE.U.WIDE.FMT ',')
                     WIDE.FMT
               TALL  ?~  TALL.FMT          TALL.FMT
                     ?~  INDEF.U.TALL.FMT  TALL.FMT
                     =.  FINAL.U.INDEF.U.TALL.FMT
                       (CAT 3 FINAL.U.INDEF.U.TALL.FMT ',')
                     TALL.FMT
             ==
    ::
    --
  ::
  ++  MANX-TO-PLUM
    |=  [[TAG-NAME=MANE ATTRS=MART] KIDS=MARL]
    ^-  PLUM
    |^  RESULT
    ::
    ++  RESULT  `PLUM`[%SBRK [%TREE OUTFMT TOPTAG CHILDS ~]]
    ++  OUTFMT  ^-  PLUMFMT  :-  `['' `['' ENDTAG]]  `['' [~ '' ENDTAG]]
    ::
    ++  TAGSTR  (MANE-TO-CORD TAG-NAME)
    ::
    ++  TOPTAG  =/  A  ATRIBS
                ?~  A  (CAT 3 TOPSTR '>')
                [%SBRK [%TREE TOPFMT A]]
    ::
    ++  TXTSTR  ^-  (UNIT PLUM)
                =/  RES  (MANX-TEXT [[TAG-NAME ATTRS] KIDS])
                ?~  RES  RES
                `(CRIP U.RES)
                ::  `[%PARA '' ~[(CRIP U.RES)]]
    ::
    ::  NOTE THAT `KIDFMT` USES "THE ACE-ACE RUNE" (SCARE QUOTES) TO
    ::  GET INDENTATION.
    ::
    ++  CHILDS  ^-  PLUM
                =/  BODY  TXTSTR
                ?~  BODY  [%TREE KIDFMT (TURN KIDS MANX-TO-PLUM)]
                    [%TREE KIDFMT [U.BODY (TURN KIDS MANX-TO-PLUM)]]
    ++  KIDFMT  ^-  PLUMFMT  :-  `['' `['' '']]  `['  ' `['' '']]
    ::
    ++  TOPFMT  =/  WIDETOPSTR  (CAT 3 TOPSTR ' ')
                :-  WIDE=[~ ' ' [~ WIDETOPSTR '>']]
                    TALL=[~ TOPSTR [~ '' '>']]
    ++  TOPSTR  (CAT 3 '<' TAGSTR)
    ++  ATRIBS  (TURN (DROP-BODY ATTRS) ATTR-TO-PLUM)
    ::
    ++  ENDTAG  (CAT 3 '</' (CAT 3 TAGSTR '>'))
    ++  ENDFMT  [[~ '' [~ '</' '>']] ~]
    ::
    ++  ATRFMT  [[~ '="' [~ '' '"']] ~]                 ::  XX ESCAPING
    ::
    ::  ALL ATTRIBUTES EXCEPT THE BULLSHIT '' ATTRIBUTE. (IT INDICATES
    ::  THE TAG BODY).
    ::
    ++  DROP-BODY
      |=  L=MART
      ^-  MART
      =/  ACC=MART  ~
      |-  ^-  MART
      ?~  L  (FLOP ACC)
      ?:  =('' N.I.L)  $(L T.L)
      $(L T.L, ACC [I.L ACC])
    ::
    ++  MANX-TEXT
      |=  [[=MANE =MART] =MARL]  ^-  (UNIT TAPE)
      ?~  MART  ~
      ?:  =('' N.I.MART)  `V.I.MART
      $(MART T.MART)
    ::
    ++  ATTR-TO-PLUM
      |=  [M=MANE T=TAPE]
      ^-  PLUM
      [%TREE ATRFMT (MANE-TO-CORD M) (CRIP T) ~]
    ::
    ++  MANE-TO-CORD
      |=  M=MANE
      ^-  CORD
      ?@  M  M
      (CAT 3 -:M (CAT 3 ':' +:M))
    ::
    --
  --
::
::  +SKOL  $-(TYPE TANK) USING `DUCK`.
::
++  SKOL
  |=  TYP/TYPE
  ^-  TANK
  ~(DUCK UT TYP)
::
::  +XSKOL  $-(TYPE TANK) USING `PPRINT`
::
++  XSKOL
  ^-  $-(TYPE TANK)
  TYPE-TO-TANK:LIBPPRINT
::
++  SLAM                                                ::  SLAM A GATE
  |=  {GAT/VASE SAM/VASE}  ^-  VASE
  =+  :-  ^=  TYP  ^-  TYPE
          [%CELL P.GAT P.SAM]
      ^=  GEN  ^-  HOON
      [%CNSG [%$ ~] [%$ 2] [%$ 3] ~]
  =+  GUN=(~(MINT UT TYP) %NOUN GEN)
  [P.GUN .*([Q.GAT Q.SAM] Q.GUN)]
::
++  SLAB                                                ::  TEST IF CONTAINS
  |=  {COG/@TAS TYP/TYPE}
  =(& -:(~(FIND UT TYP) %FREE [COG ~]))
::
++  SLAP
  |=  {VAX/VASE GEN/HOON}  ^-  VASE                     ::  UNTYPED VASE .*
  =+  GUN=(~(MINT UT P.VAX) %NOUN GEN)
  [P.GUN .*(Q.VAX Q.GUN)]
::
++  SLOG                                                ::  DEIFY PRINTF
  =|  PRI/@                                             ::  PRIORITY LEVEL
  |=  A/TANG  ^+  SAME                                  ::  .=  ~&(%A 1)
  ?~(A SAME ~>(%SLOG.[PRI I.A] $(A T.A)))               ::  ((SLOG ~[>%A<]) 1)
::                                                      ::
++  MEAN                                                ::  CRASH WITH TRACE
  |=  A/TANG
  ^+  !!
  ?~  A  !!
  ~_(I.A $(A T.A))
::
++  SLEW                                                ::  GET AXIS IN VASE
  |=  {AXE/@ VAX/VASE}  ^-  (UNIT VASE)
  ?.  |-  ^-  ?
      ?:  =(1 AXE)  &
      ?.  ?=(^ Q.VAX)  |
      $(AXE (MAS AXE), Q.VAX .*(Q.VAX [0 (CAP AXE)]))
    ~
  `[(~(PEEK UT P.VAX) %FREE AXE) .*(Q.VAX [0 AXE])]
::
++  SLIM                                                ::  IDENTICAL TO SEER?
  |=  OLD/VISE  ^-  VASE
  OLD
::
++  SLIT                                                ::  TYPE OF SLAM
  |=  {GAT/TYPE SAM/TYPE}
  ?>  (~(NEST UT (~(PEEK UT GAT) %FREE 6)) & SAM)
  (~(PLAY UT [%CELL GAT SAM]) [%CNSG [%$ ~] [%$ 2] [%$ 3] ~])
::
++  SLOB                                                ::  SUPERFICIAL ARM
  |=  {COG/@TAS TYP/TYPE}
  ^-  ?
  ?+  TYP  |
      {$HOLD *}  $(TYP ~(REPO UT TYP))
      {$HINT *}  $(TYP ~(REPO UT TYP))
      {$CORE *}
    |-  ^-  ?
    ?~  Q.R.Q.TYP  |
    ?|  (~(HAS BY Q.Q.N.Q.R.Q.TYP) COG)
        $(Q.R.Q.TYP L.Q.R.Q.TYP)
        $(Q.R.Q.TYP R.Q.R.Q.TYP)
    ==
  ==
::
++  SLOE                                                ::  GET ARMS IN CORE
  |=  TYP/TYPE
  ^-  (LIST TERM)
  ?+    TYP  ~
      {$HOLD *}  $(TYP ~(REPO UT TYP))
      {$CORE *}
    %-  ZING
    %+  TURN  ~(TAP BY Q.R.Q.TYP)
      |=  {* B/TOME}
    %+  TURN  ~(TAP BY Q.B)
      |=  {A/TERM *}
    A
  ==
::
++  SLOP                                                ::  CONS TWO VASES
  |=  {HED/VASE TAL/VASE}
  ^-  VASE
  [[%CELL P.HED P.TAL] [Q.HED Q.TAL]]
::
++  SLOT                                                ::  GOT AXIS IN VASE
  |=  {AXE/@ VAX/VASE}  ^-  VASE
  [(~(PEEK UT P.VAX) %FREE AXE) .*(Q.VAX [0 AXE])]
::
++  SLYM                                                ::  SLAM W+O SAMPLE-TYPE
  |=  {GAT/VASE SAM/*}  ^-  VASE
  (SLAP GAT(+<.Q SAM) [%LIMB %$])
::
++  SPED                                                ::  RECONSTRUCT TYPE
  |=  VAX/VASE
  ^-  VASE
  :_  Q.VAX
  ?@  Q.VAX  (~(FUSE UT P.VAX) [%ATOM %$ ~])
  ?@  -.Q.VAX
    ^=  TYP
    %-  ~(PLAY UT P.VAX)
    [%WTBN [%WTTS [%LEAF %TAS -.Q.VAX] [%& 2]~] [%$ 1]]
  (~(FUSE UT P.VAX) [%CELL %NOUN %NOUN])
::
::::  5D: PARSER
  ::
++  VANG                                                ::  SET ++VAST PARAMS
  |=  {BUG/? WER/PATH}                                  ::  BUG: DEBUG MODE
  %*(. VAST BUG BUG, WER WER)                           ::  WER: WHERE WE ARE
::
++  VAST                                                ::  MAIN PARSING CORE
  =+  [BUG=`?`| WER=*PATH]
  |%
  ++  GASH  %+  COOK                                    ::  PARSE PATH
              |=  A/(LIST TYKE)  ^-  TYKE
              ?~(A ~ (WELD I.A $(A T.A)))
            (MORE NET LIMP)
  ++  GASP  ;~  POSE                                    ::  PARSE =PATH= ETC.
              %+  COOK
                |=({A/TYKE B/TYKE C/TYKE} :(WELD A B C))
              ;~  PLUG
                (COOK |=(A/(LIST) (TURN A |=(B/* ~))) (STAR TIS))
                (COOK |=(A/HOON [[~ A] ~]) HASP)
                (COOK |=(A/(LIST) (TURN A |=(B/* ~))) (STAR TIS))
              ==
              (COOK |=(A/(LIST) (TURN A |=(B/* ~))) (PLUS TIS))
            ==
  ++  GLAM  ~+((GLUE ACE))
  ++  HASP  ;~  POSE                                    ::  PATH ELEMENT
              (IFIX [LAC RAC] WIDE)
              (STAG %CNCL (IFIX [LIT RIT] (MOST ACE WIDE)))
              (STAG %SAND (STAG %TAS (COLD %$ BUS)))
              (STAG %SAND (STAG %T QUT))
              %+  COOK
                |=(A/COIN [%SAND ?:(?=({~ $TAS *} A) %TAS %TA) ~(RENT CO A)])
              NUCK:SO
            ==
  ++  LIMP  %+  COOK
              |=  {A/(LIST) B/TYKE}
              ?~  A  B
              $(A T.A, B [`[%SAND %TAS %$] B])
            ;~(PLUG (STAR NET) GASP)
  ++  MOTA  %+  COOK
              |=({A/TAPE B/TAPE} (RAP 3 (WELD A B)))
            ;~(PLUG (STAR LOW) (STAR HIG))
  ++  GLOM
    |=  {WIT/WHIT TAW/WHIT}
    ^-  WHIT
    :*  ?~(LAB.WIT LAB.TAW LAB.WIT)
        ?~(BOY.WIT BOY.TAW BOY.WIT)
        (~(UNI BY DEF.WIT) DEF.TAW)
        (~(UNI IN USE.WIT) USE.TAW)
    ==
  ++  DOCS
    |%
    ::
    ::  ABOVE CORE
    ::
    ++  APEX
      ;~  PLUG
        =/  RON  (PUNT (INDO NOEL))
        (PUNT (IFIX [RON RON] (INTO HEAD)))             ::  LABEL
      ::
        =/  RON  (PUNT (INDO NULL))
        (IFIX [RON RON] (PUNT BODY))                    ::  BODY
      ::
        (COOK MALT (STAR FILL))                         ::  DEFINITIONS
        (EASY ~)                                        ::  DEFS USED (NONE)
      ==
    ::
    ::  BACKWARD LINE
    ::
    ++  APSE
      ;~  POSE
        %+  COOK  |=({A/TERM B/CORD} %*(. *WHIT DEF (MY [A B ~] ~)))
        (EXIT FINE)
      ::
        %+  COOK  |=(A/CORD %*(. *WHIT BOY `[A ~]))
        (EXIT LINE)
      ::
        (EASY *WHIT)
      ==
    ::
    ::
    ++  BEER
      |=  $:  LAB/(UNIT TERM)
              BOY/(UNIT (PAIR CORD (LIST SECT)))
              DEF/(LIST (PAIR (PAIR TERM CORD) (LIST SECT)))
          ==
      ^-  WHIT
      =;  DEF  [LAB BOY (MALT DEF) ~]
      (TURN DEF |=({{A/TERM B/CORD} C/(LIST SECT)} [A [B C]]))
    ::
    ::
    ++  BODY
      ;~  POSE
        ;~  PLUG                                        :: CAN DUPLICATE ::
          (INTO ;~(PFIX (PUNT ;~(PLUG NULL COL BAN STEP)) LINE))
          (EASY ~)
        ==
        ;~  PLUG
          (INTO ;~(PFIX STEP LINE))
          (RANT TEXT)
        ==
      ==
    ::
    ++  TEXT  (PICK LINE CODE)                          ::  TEXT LINE
    ++  LINE  ;~(LESS ACE (COOK CRIP (STAR PRN)))       ::  PROSE LINE
    ++  CODE  ;~(PFIX STEP STEP (COOK CRIP (STAR PRN))) ::  CODE LINE
    ++  NOEL  ;~(PLUG (PUNT ;~(PFIX STEP HAX)) NULL)    ::  HEADER PADDING
    ++  HEAD  ;~(PFIX HAX STEP CEN SYM)                 ::  HEADER LINE
    ++  NULL  (COLD ~ (STAR ACE))                       ::  BLANK LINE
    ++  FINE                                            ::  DEFINITION LINE
      ;~  (GLUE ;~(PLUG COL ACE))
        SYM
        (COOK CRIP (STAR PRN))
      ==
    ::
    ::
    ::  STEP: INDENT
    ::  INTO: :: AND INDENT TO END OF LINE, CONSUMING FOLLOWING SPACE.
    ::  INDO: :: TO END OF LINE, CONSUMING FOLLOWING SPACE.
    ::  EXIT: :: TO END OF LINE, NOT CONSUMING FOLLOWING SPACE.
    ::
    ++  STEP  ;~(PLUG ACE ACE)
    ++  INTO  |*(BOD/RULE (INDO ;~(PFIX STEP BOD)))
    ::
    ++  INDO
      |*  BOD/RULE
      ;~(PFIX COL BAN ;~(SFIX BOD (JUST `@`10) (PUNT GAP)))
    ::
    ++  EXIT
      |*  BOD/RULE
      ;~(PFIX (STAR ACE) COL LED STEP BOD)
    ::
    ::  FILL: FULL DEFINITION
    ::
    ++  FILL
      %+  COOK  |=({{A/TERM B/CORD} C/(LIST SECT) (UNIT ~)} [A B C])
      ;~  PLUG
        (INTO FINE)
        (RANT ;~(PFIX STEP TEXT))
        (PUNT (INDO NULL))
      ==
    ::
    ::  RANT: SERIES OF SECTIONS.
    ::
    ++  RANT
      |*  SEC/RULE
      %-  STAR
      ;~  PFIX
        (INDO NULL)
        (PLUS (INTO SEC))
      ==
    --
  ::
  ++  PLEX                                              ::  REPARSE STATIC PATH
    |=  GEN/HOON  ^-  (UNIT PATH)
    ?:  ?=({$DBUG *} GEN)                               ::  UNWRAP $DBUG
      $(GEN Q.GEN)
    ?.  ?=({$CLSG *} GEN)  ~                            ::  REQUIRE :~ HOON
    %+  REEL  P.GEN                                     ::  BUILD USING ELEMENTS
    |=  {A/HOON B/_`(UNIT PATH)`[~ U=/]}                ::  STARTING FROM JUST /
    ?~  B  ~
    ?.  ?=({$SAND ?($TA $TAS) @} A)  ~                  ::  /FOO CONSTANTS
    `[Q.A U.B]
  ::
  ++  PHAX
    |=  RUW/(LIST (LIST WOOF))
    =+  [YUN=*(LIST HOON) CAH=*(LIST @)]
    =+  WOD=|=({A/TAPE B/(LIST HOON)} ^+(B ?~(A B [[%MCNT %KNIT (FLOP A)] B])))
    |-  ^+  YUN
    ?~  RUW
      (FLOP (WOD CAH YUN))
    ?~  I.RUW  $(RUW T.RUW)
    ?@  I.I.RUW
      $(I.RUW T.I.RUW, CAH [I.I.RUW CAH])
    $(I.RUW T.I.RUW, CAH ~, YUN [P.I.I.RUW (WOD CAH YUN)])
  ::
  ++  POSH
    |=  {PRE/(UNIT TYKE) POF/(UNIT {P/@UD Q/TYKE})}
    ^-  (UNIT (LIST HOON))
    =-  ?^(- - ~&(%POSH-FAIL -))
    =+  WOM=(POOF WER)
    %+  BIFF
      ?~  PRE  `U=WOM
      %+  BIND  (POON WOM U.PRE)
      |=  MOZ/(LIST HOON)
      ?~(POF MOZ (WELD MOZ (SLAG (LENT U.PRE) WOM)))
    |=  YEZ/(LIST HOON)
    ?~  POF  `YEZ
    =+  ZEY=(FLOP YEZ)
    =+  [MOZ=(SCAG P.U.POF ZEY) GUL=(SLAG P.U.POF ZEY)]
    =+  ZOM=(POON (FLOP MOZ) Q.U.POF)
    ?~(ZOM ~ `(WELD (FLOP GUL) U.ZOM))
  ::
  ++  POOF                                              ::  PATH -> (LIST HOON)
    |=(PAX/PATH ^-((LIST HOON) (TURN PAX |=(A/@TA [%SAND %TA A]))))
  ::
  ::  TYKE IS =FOO== AS ~[~ `FOO ~ ~]
  ::  INTERPOLATE '=' PATH COMPONENTS
  ++  POON                                              ::  TRY TO REPLACE '='S
    |=  {PAG/(LIST HOON) GOO/TYKE}                      ::    DEFAULT TO PAG
    ^-  (UNIT (LIST HOON))                              ::    FOR NULL GOO'S
    ?~  GOO  `~                                         ::  KEEP EMPTY GOO
    %+  BOTH                                            ::  OTHERWISE HEAD COMES
      ?^(I.GOO I.GOO ?~(PAG ~ `U=I.PAG))                ::    FROM GOO OR PAG
    $(GOO T.GOO, PAG ?~(PAG ~ T.PAG))                   ::  RECURSE ON TAILS
  ::
  ++  POOR
    %+  SEAR  POSH
    ;~  PLUG
      (STAG ~ GASH)
      ;~(POSE (STAG ~ ;~(PFIX CEN PORC)) (EASY ~))
    ==
  ::
  ++  PORC
    ;~  PLUG
      (COOK |=(A/(LIST) (LENT A)) (STAR CEN))
      ;~(PFIX NET GASH)
    ==
  ::
  ++  RUMP
    %+  SEAR
      |=  {A/WING B/(UNIT HOON)}  ^-  (UNIT HOON)
      ?~(B [~ %WING A] ?.(?=({@ ~} A) ~ [~ [%ROCK %TAS I.A] U.B]))
    ;~(PLUG ROPE ;~(POSE (STAG ~ WEDE) (EASY ~)))
  ::
  ++  ROOD
    ;~  PFIX  NET
      (STAG %CLSG POOR)
    ==
  ::
  ++  RUPL
    %+  COOK
      |=  {A/? B/(LIST HOON) C/?}
      ?:  A
        ?:  C
          [%CLSG [%CLSG B] ~]
        [%CLSG B]
      ?:  C
        [%CLSG [%CLTR B] ~]
      [%CLTR B]
    ;~  PLUG
      ;~  POSE
        (COLD | (JUST '['))
        (COLD & (JEST '~['))
      ==
    ::
      ;~  POSE
        (IFIX [ACE GAP] (MOST GAP TALL))
        (MOST ACE WIDE)
      ==
    ::
      ;~  POSE
        (COLD & (JEST ']~'))
        (COLD | (JUST ']'))
      ==
    ==
  ::
  ::
  ++  SAIL                                              ::  XML TEMPLATE
    |=  IN-TALL-FORM/?  =|  LIN/?
    |%
    ::
    ++  APEX                                            ::  PRODUCT HOON
      %+  COOK
        |=  TUM/(EACH MANX:HOOT MARL:HOOT)  ^-  HOON
        ?-  -.TUM
          %&  [%XRAY P.TUM]
          %|  [%MCTS P.TUM]
        ==
      TOP-LEVEL
    ::
    ++  TOP-LEVEL                                       ::  ENTRY-POINT
      ;~(PFIX MIC ?:(IN-TALL-FORM TALL-TOP WIDE-TOP))
    ::
    ++  INLINE-EMBED                                    ::  BRACE INTERPOLATION
      %+  COOK  |=(A/TUNA:HOOT A)
      ;~  POSE
        ;~(PFIX MIC BRACKETED-ELEM(IN-TALL-FORM |))
        ;~(PLUG TUNA-MODE SUMP)
        (STAG %TAPE SUMP)
      ==
    ::
    ++  SCRIPT-OR-STYLE                                 ::  SCRIPT OR STYLE
      %+  COOK  |=(A/MARX:HOOT A)
      ;~  PLUG
        ;~(POSE (JEST %SCRIPT) (JEST %STYLE))
        WIDE-ATTRS
      ==
    ::
    ++  TUNA-MODE                                       ::  XML NODE(S) KIND
      ;~  POSE
        (COLD %TAPE HEP)
        (COLD %MANX LUS)
        (COLD %MARL TAR)
        (COLD %CALL CEN)
      ==
    ::
    ++  WIDE-TOP                                        ::  WIDE OUTER TOP
      %+  KNEE  *(EACH MANX:HOOT MARL:HOOT)  |.  ~+
      ;~  POSE
        (STAG %| WIDE-QUOTE)
        (STAG %| WIDE-PAREN-ELEMS)
        (STAG %& ;~(PLUG TAG-HEAD WIDE-TAIL))
      ==
    ::
    ++  WIDE-INNER-TOP                                  ::  WIDE INNER TOP
      %+  KNEE  *(EACH TUNA:HOOT MARL:HOOT)  |.  ~+
      ;~  POSE
        WIDE-TOP
        (STAG %& ;~(PLUG TUNA-MODE WIDE))
      ==
    ::
    ++  WIDE-ATTRS                                      ::  WIDE ATTRIBUTES
      %+  COOK  |=(A/(UNIT MART:HOOT) (FALL A ~))
      %-  PUNT
      %+  IFIX  [LIT RIT]
      %+  MORE  (JEST ', ')
      ;~((GLUE ACE) A-MANE HOPEFULLY-QUOTE)
    ::
    ++  WIDE-TAIL                                       ::  WIDE ELEMENTS
      %+  COOK  |=(A/MARL:HOOT A)
      ;~(POSE ;~(PFIX COL WRAPPED-ELEMS) (COLD ~ MIC) (EASY ~))
    ::
    ++  WIDE-ELEMS                                      ::  WIDE ELEMENTS
      %+  COOK  |=(A/MARL:HOOT A)
      %+  COOK  JOIN-TOPS
      (STAR ;~(PFIX ACE WIDE-INNER-TOP))
    ::
    ++  WIDE-PAREN-ELEMS                                ::  WIDE FLOW
      %+  COOK  |=(A/MARL:HOOT A)
      %+  COOK  JOIN-TOPS
      (IFIX [LIT RIT] (MORE ACE WIDE-INNER-TOP))
    ::
    ::+|
    ::
    ++  DROP-TOP
      |=  A/(EACH TUNA:HOOT MARL:HOOT)  ^-  MARL:HOOT
      ?-  -.A
        %&  [P.A]~
        %|  P.A
      ==
    ::
    ++  JOIN-TOPS
      |=  A/(LIST (EACH TUNA:HOOT MARL:HOOT))  ^-  MARL:HOOT
      (ZING (TURN A DROP-TOP))
    ::
    ::+|
    ::
    ++  WIDE-QUOTE                                      ::  WIDE QUOTE
      %+  COOK  |=(A/MARL:HOOT A)
      ;~  POSE
        ;~  LESS  (JEST '"""')
          (IFIX [YEL YEL] (COOK COLLAPSE-CHARS QUOTE-INNARDS))
        ==
      ::
        %-  INDE
        %+  IFIX  [(JEST '"""\0A') (JEST '\0A"""')]
        (COOK COLLAPSE-CHARS QUOTE-INNARDS(LIN |))
      ==
    ::
    ++  QUOTE-INNARDS                                   ::  WIDE+TALL FLOW
      %+  COOK  |=(A/(LIST $@(@ TUNA:HOOT)) A)
      %-  STAR
      ;~  POSE
        ;~(PFIX BAS ;~(POSE (MASK "-+*%;\{") BAS YEL BIX:AB))
        INLINE-EMBED
        ;~(LESS BAS LOB ?:(IN-TALL-FORM FAIL TOC) PRN)
        ?:(LIN FAIL ;~(LESS (JEST '\0A"""') (JUST '\0A')))
      ==
    ::
    ++  BRACKETED-ELEM                                  ::  BRACKETED ELEMENT
      %+  IFIX  [LOB ROB]
      ;~(PLUG TAG-HEAD WIDE-ELEMS)
    ::
    ++  WRAPPED-ELEMS                                   ::  WRAPPED TUNA
      %+  COOK  |=(A/MARL:HOOT A)
      ;~  POSE
        WIDE-PAREN-ELEMS
        (COOK |=(@T `MARL`[;/((TRIP +<))]~) QUT)
        (COOK DROP-TOP WIDE-TOP)
      ==
    ::
    ::+|
    ::
    ++  A-MANE                                          ::  MANE AS HOON
      %+  COOK
        |=  {A/@TAS B/(UNIT @TAS)}
        ?~(B A [A U.B])
      ;~  PLUG
        MIXED-CASE-SYMBOL
        ;~  POSE
          %+  STAG  ~
            ;~(PFIX CAB MIXED-CASE-SYMBOL)
          (EASY ~)
        ==
      ==
    ::
    ++  EN-CLASS
      |=  A/(LIST {$CLASS P/TERM})
      ^-  (UNIT {$CLASS TAPE})
      ?~  A  ~
      %-  SOME
      :-  %CLASS
      |-
      %+  WELP  (TRIP P.I.A)
      ?~  T.A  ~
      [' ' $(A T.A)]
    ::
    ++  TAG-HEAD                                        ::  TAG HEAD
      %+  COOK
        |=  {A/MANE:HOOT B/MART:HOOT C/MART:HOOT}
        ^-  MARX:HOOT
        [A (WELD B C)]
      ;~  PLUG
        A-MANE
      ::
        %+  COOK
          |=  A/(LIST (UNIT {TERM (LIST BEER:HOOT)}))
          ^-  (LIST {TERM (LIST BEER:HOOT)})
          :: DISCARD NULLS
          (MURN A SAME)
        ;~  PLUG
          (PUNT ;~(PLUG (COLD %ID HAX) (COOK TRIP SYM)))
          (COOK EN-CLASS (STAR ;~(PLUG (COLD %CLASS DOT) SYM)))
          (PUNT ;~(PLUG ;~(POSE (COLD %HREF NET) (COLD %SRC VAT)) SOIL))
          (EASY ~)
        ==
      ::
        WIDE-ATTRS
      ==
    ::
    ::+|
    ::
    ++  TALL-TOP                                        ::  TALL TOP
      %+  KNEE  *(EACH MANX:HOOT MARL:HOOT)  |.  ~+
      ;~  POSE
        (STAG %| ;~(PFIX (PLUS ACE) (COOK COLLAPSE-CHARS QUOTE-INNARDS)))
        (STAG %& ;~(PLUG SCRIPT-OR-STYLE SCRIPT-STYLE-TAIL))
        (STAG %& TALL-ELEM)
        (STAG %| WIDE-QUOTE)
        (STAG %| ;~(PFIX TIS TALL-TAIL))
        (STAG %& ;~(PFIX BAN GAP (STAG [%DIV ~] CRAM)))
        (STAG %| ;~(PLUG ;~((GLUE GAP) TUNA-MODE TALL) (EASY ~)))
        (EASY %| [;/("\0A")]~)
      ==
    ::
    ++  TALL-ATTRS                                      ::  TALL ATTRIBUTES
      %-  STAR
      ;~  PFIX  ;~(PLUG GAP TIS)
        ;~((GLUE GAP) A-MANE HOPEFULLY-QUOTE)
      ==
    ::
    ++  TALL-ELEM                                       ::  TALL PREFACE
      %+  COOK
        |=  {A/{P/MANE:HOOT Q/MART:HOOT} B/MART:HOOT C/MARL:HOOT}
        ^-  MANX:HOOT
        [[P.A (WELD Q.A B)] C]
      ;~(PLUG TAG-HEAD TALL-ATTRS TALL-TAIL)
    ::
    ::+|
    ::
    ::REVIEW IS THERE A BETTER WAY TO DO THIS?
    ++  HOPEFULLY-QUOTE                                 :: PREFER "QUOTE" FORM
      %+  COOK  |=(A/(LIST BEER:HOOT) A)
      %+  COOK  |=(A/HOON ?:(?=($KNIT -.A) P.A [~ A]~))
      WIDE
    ::
    ++  SCRIPT-STYLE-TAIL                               ::  UNESCAPED TALL TAIL
      %+  COOK  |=(A/MARL:HOOT A)
      %+  IFIX  [GAP ;~(PLUG GAP DUZ)]
      %+  MOST  GAP
      ;~  PFIX  MIC
        %+  COOK  |=(A/TAPE ;/(A))
        ;~  POSE
          ;~(PFIX ACE (STAR PRN))
          (EASY "\0A")
        ==
      ==
    ::
    ++  TALL-TAIL                                       ::  TALL TAIL
      ?>  IN-TALL-FORM
      %+  COOK  |=(A/MARL:HOOT A)
      ;~  POSE
        (COLD ~ MIC)
        ;~(PFIX COL WRAPPED-ELEMS(IN-TALL-FORM |))
        ;~(PFIX COL ACE (COOK COLLAPSE-CHARS(IN-TALL-FORM |) QUOTE-INNARDS))
        (IFIX [GAP ;~(PLUG GAP DUZ)] TALL-KIDS)
      ==
    ::
    ++  TALL-KIDS                                       ::  CHILD ELEMENTS
      %+  COOK  JOIN-TOPS
      ::  LOOK FOR SAIL FIRST, OR MARKDOWN IF NOT
      (MOST GAP ;~(POSE TOP-LEVEL (STAG %| CRAM)))
    ::
    ++  COLLAPSE-CHARS                                  ::  GROUP CONSEC CHARS
      |=  REB/(LIST $@(@ TUNA:HOOT))
      ^-  MARL:HOOT
      =|  {SIM/(LIST @) TUZ/MARL:HOOT}
      |-  ^-  MARL:HOOT
      ?~  REB
        =.  SIM
          ?.  IN-TALL-FORM   SIM
          [10 |-(?~(SIM SIM ?:(=(32 I.SIM) $(SIM T.SIM) SIM)))]
        ?~(SIM TUZ [;/((FLOP SIM)) TUZ])
      ?@  I.REB
        $(REB T.REB, SIM [I.REB SIM])
      ?~  SIM  [I.REB $(REB T.REB, SIM ~)]
      [;/((FLOP SIM)) I.REB $(REB T.REB, SIM ~)]
    --
  ++  CRAM                                              ::  PARSE UNMARK
    =>  |%
        ++  ITEM  (PAIR MITE MARL:HOOT)                 ::  XML NODE GENERATOR
        ++  COLM  @UD                                   ::  COLUMN
        ++  TARP  MARL:HOOT                             ::  NODE OR GENERATOR
        ++  MITE                                        ::  CONTEXT
          $?  $DOWN                                     ::  OUTER EMBED
              $LUNT                                     ::  UNORDERED LIST
              $LIME                                     ::  LIST ITEM
              $LORD                                     ::  ORDERED LIST
              $POEM                                     ::  VERSE
              $BLOC                                     ::  BLOCKQUOTE
              $HEAD                                     ::  HEADING
          ==                                            ::
        ++  TRIG                                        ::  LINE STYLE
          $:  COL/@UD                                   ::  START COLUMN
              STY/TRIG-STYLE                            ::  STYLE
          ==                                            ::
        ++  TRIG-STYLE                                  ::  TYPE OF PARSED LINE
          $%  $:  $END                                  ::  TERMINATOR
          $?  $DONE                                     ::  END OF INPUT
                  $STET                                 ::    == END OF MARKDOWN
                  $DENT                                 ::    OUTDENT
              ==  ==                                    ::
              $:  $ONE                                  ::  LEAF NODE
              $?  $RULE                                 ::    --- HORZ RULE
                  $FENS                                 ::    ``` CODE FENCE
                  $EXPR                                 ::    ;SAIL EXPRESSION
              ==  ==                                    ::
              {$NEW P/TRIG-NEW}                         ::  OPEN CONTAINER
              {$OLD $TEXT}                              ::  ANYTHING ELSE
          ==                                            ::
        ++  TRIG-NEW                                    ::  START A
          $?  $LITE                                     ::    + LINE ITEM
              $LINT                                     ::    - LINE ITEM
              $HEAD                                     ::  # HEADING
              $BLOC                                     ::  > BLOCK-QUOTE
              $POEM                                     ::    [ ]{8} POEM
          ==                                            ::
        ++  GRAF                                        ::  PARAGRAPH ELEMENT
          $%  {$BOLD P/(LIST GRAF)}                     ::  *BOLD*
              {$TALC P/(LIST GRAF)}                     ::  _ITALICS_
              {$QUOD P/(LIST GRAF)}                     ::  "DOUBLE QUOTE"
              {$CODE P/TAPE}                            ::  CODE LITERAL
              {$TEXT P/TAPE}                            ::  TEXT SYMBOL
              {$LINK P/(LIST GRAF) Q/TAPE}              ::  URL
              {$MAGE P/TAPE Q/TAPE}                     ::  IMAGE
              {$EXPR P/TUNA:HOOT}                       ::  INTERPOLATED HOON
          ==
        --
    =<  (NON-EMPTY:PARSE |=(NAIL `(LIKE TARP)`~($ MAIN +<)))
    |%
    ++  MAIN
      ::
      ::  STATE OF THE PARSING LOOP.  WE MAINTAIN A CONSTRUCTION
      ::  STACK FOR ELEMENTS AND A LINE STACK FOR LINES IN THE
      ::  CURRENT BLOCK.  A BLANK LINE CAUSES THE CURRENT BLOCK
      ::  TO BE PARSED AND THROWN IN THE CURRENT ELEMENT.  WHEN
      ::  THE INDENT COLUMN RETREATS, THE ELEMENT STACK ROLLS UP.
      ::
      ::  VERBOSE: DEBUG PRINTING ENABLED
      ::  ERR: ERROR POSITION
      ::  IND: OUTER AND INNER INDENT LEVEL
      ::  HAC: STACK OF ITEMS UNDER CONSTRUCTION
      ::  CUR: CURRENT ITEM UNDER CONSTRUCTION
      ::  PAR: CURRENT "PARAGRAPH" BEING READ IN
      ::  [LOC TXT]: PARSING STATE
      ::
      =/  VERBOSE  &
      =|  ERR/(UNIT HAIR)
      =|  IND/{OUT/@UD INR/@UD}
      =|  HAC/(LIST ITEM)
      =/  CUR/ITEM  [%DOWN ~]
      =|  PAR/(UNIT (PAIR HAIR WALL))
      |_  {LOC/HAIR TXT/TAPE}
      ::
      ++  $                                           ::  RESOLVE
        ^-  (LIKE TARP)
        =>  LINE
        ::
        ::  IF ERROR POSITION IS SET, PRODUCE ERROR
        ?.  =(~ ERR)
          ~&  ERR+ERR
          [+.ERR ~]
        ::
        ::  ALL DATA WAS CONSUMED
        =-  [LOC `[- [LOC TXT]]]
        =>  CLOSE-PAR
        |-  ^-  TARP
        ::
        ::  FOLD ALL THE WAY TO TOP
        ?~  HAC  CUR-TO-TARP
        $(..^$ CLOSE-ITEM)
      ::
      ::+|
      ::
      ++  CUR-INDENT
        ?-  P.CUR
          $DOWN  2
          $HEAD  0
          $LUNT  0
          $LIME  2
          $LORD  0
          $POEM  8
          $BLOC  2
        ==
      ::
      ++  BACK                                          ::  COLUMN RETREAT
        |=  LUC/@UD
        ^+  +>
        ?:  (GTE LUC INR.IND)  +>
        ::
        ::  NEX: NEXT BACKWARD STEP THAT TERMINATES THIS CONTEXT
        =/  NEX/@UD  CUR-INDENT  ::  REVIEW CODE AND POEM BLOCKS ARE
                                 ::  HANDLED ELSEWHERE
        ?:  (GTH NEX (SUB INR.IND LUC))
          ::
          ::  INDENTING PATTERN VIOLATION
          ~?  VERBOSE  INDENT-PATTERN-VIOLATION+[P.CUR NEX INR.IND LUC]
          ..^$(INR.IND LUC, ERR `[P.LOC LUC])
        =.  ..^$  CLOSE-ITEM
        $(INR.IND (SUB INR.IND NEX))
      ::
      ++  CUR-TO-TARP                                   ::  ITEM TO TARP
        ^-  TARP
        ?:  ?=(?($DOWN $HEAD $EXPR) P.CUR)
          (FLOP Q.CUR)
        =-  [[- ~] (FLOP Q.CUR)]~
        ?-  P.CUR
          $LUNT  %UL
          $LORD  %OL
          $LIME  %LI
          $POEM  %DIV ::REVIEW ACTUAL CONTAINER ELEMENT?
          $BLOC  %BLOCKQUOTE
        ==
      ::
      ++  CLOSE-ITEM  ^+  .                             ::  COMPLETE AND POP
        ?~  HAC  .
        %=  .
          HAC  T.HAC
          CUR  [P.I.HAC (WELD CUR-TO-TARP Q.I.HAC)]
        ==
      ::
      ++  READ-LINE                                     ::  CAPTURE RAW LINE
        =|  LIN/TAPE
        |-  ^+  [[LIN *(UNIT _ERR)] +<.^$]  :: PARSED TAPE AND HALT/ERROR
        ::
        ::  NO UNTERMINATED LINES
        ?~  TXT
          ~?  VERBOSE  %UNTERMINATED-LINE
          [[~ ``LOC] +<.^$]
        ?.  =(`@`10 I.TXT)
          ?:  (GTH INR.IND Q.LOC)
            ?.  =(' ' I.TXT)
              ~?  VERBOSE  EXPECTED-INDENT+[INR.IND LOC TXT]
              [[~ ``LOC] +<.^$]
            $(TXT T.TXT, Q.LOC +(Q.LOC))
          ::
          ::  SAVE BYTE AND REPEAT
          $(TXT T.TXT, Q.LOC +(Q.LOC), LIN [I.TXT LIN])
        =.  LIN
        ::
        ::  TRIM TRAILING SPACES
        |-  ^-  TAPE
          ?:  ?=({$' ' *} LIN)
            $(LIN T.LIN)
          (FLOP LIN)
          ::
        =/  EAT-NEWLINE/NAIL  [[+(P.LOC) 1] T.TXT]
        =/  SAW  LOOK(+<.$ EAT-NEWLINE)
        ::
        ?:  ?=({~ @ $END ?($STET $DENT)} SAW)           ::  STOP ON == OR DEDENT
          [[LIN `~] +<.^$]
        [[LIN ~] EAT-NEWLINE]
      ::
      ++  LOOK                                          ::  INSPECT LINE
        ^-  (UNIT TRIG)
        %+  BIND  (WONK (LOOK:PARSE LOC TXT))
        |=  A/TRIG  ^+  A
        ::
        ::  TREAT A NON-TERMINATOR AS A TERMINATOR
        ::  IF IT'S OUTDENTED
        ?:  =(%END -.STY.A)  A
        ?:  (LTH COL.A OUT.IND)
          A(STY [%END %DENT])
        A
      ::
      ++  CLOSE-PAR                                     ::  MAKE BLOCK
        ^+  .
        ::
        ::  EMPTY BLOCK, NO ACTION
        ?~  PAR  .
        ::
        ::  IF BLOCK IS VERSE
        ?:  ?=($POEM P.CUR)
          ::
          ::  ADD BREAK BETWEEN STANZAS
          =.  Q.CUR  ?~(Q.CUR Q.CUR [[[%BR ~] ~] Q.CUR])
          =-  CLOSE-ITEM(PAR ~, Q.CUR (WELD - Q.CUR), INR.IND (SUB INR.IND 8))
          %+  TURN  Q.U.PAR
          |=  TAPE  ^-  MANX
          ::
          ::  EACH LINE IS A PARAGRAPH
          :-  [%P ~]
          :_  ~
          ;/("{+<}\0A")
        ::
        ::  YEX: BLOCK RECOMPOSED, WITH NEWLINES
        =/  YEX/TAPE
          %-  ZING
          %+  TURN  (FLOP Q.U.PAR)
          |=  A/TAPE
          (RUNT [(DEC INR.IND) ' '] "{A}\0A")
        ::
        ::  VEX: PARSE OF PARAGRAPH
        =/  VEX/(LIKE TARP)
          ::
          ::  EITHER A ONE-LINE HEADER OR A PARAGRAPH
          %.  [P.U.PAR YEX]
          ?:  ?=($HEAD P.CUR)
            (FULL HEAD:PARSE)
          (FULL PARA:PARSE)
        ::
        ::  IF ERROR, PROPAGATE CORRECTLY
        ?~  Q.VEX
          ~?  VERBOSE  [%CLOSE-PAR P.CUR YEX]
          ..$(ERR `P.VEX)
        ::
        ::  FINISH TAG IF IT'S A HEADER
        =<  ?:(?=($HEAD P.CUR) CLOSE-ITEM ..$)
        ::
        ::  SAVE GOOD RESULT, CLEAR BUFFER
        ..$(PAR ~, Q.CUR (WELD P.U.Q.VEX Q.CUR))
      ::
      ++  LINE  ^+  .                                   ::  BODY LINE LOOP
        ::
        ::  ABORT AFTER FIRST ERROR
        ?:  !=(~ ERR)  .
        ::
        ::  SAW: PROFILE OF THIS LINE
        =/  SAW  LOOK
        ~?  [DEBUG=|]  [%LOOK IND=IND SAW=SAW TXT=TXT]
        ::
        ::  IF LINE IS BLANK
        ?~  SAW
          ::
          ::  BREAK SECTION
          =^  A/{TAPE FIN/(UNIT _ERR)}  +<.$  READ-LINE
          ?^  FIN.A
            ..$(ERR U.FIN.A)
          =>(CLOSE-PAR LINE)
        ::
        ::  LINE IS NOT BLANK
        =>  .(SAW U.SAW)
        ::
        ::  IF END OF INPUT, COMPLETE
        ?:  ?=($END -.STY.SAW)
          ..$(Q.LOC COL.SAW)
        ::
        =.  IND  ?~(OUT.IND [COL.SAW COL.SAW] IND)      ::  INIT INDENTS
        ::
        ?:  ?|  ?=(~ PAR)                          :: IF AFTER A PARAGRAPH OR
                ?&  ?=(?($DOWN $LIME $BLOC) P.CUR)  :: UNSPACED NEW CONTAINER
                    |(!=(%OLD -.STY.SAW) (GTH COL.SAW INR.IND))
            ==  ==
          =>  .(..$ CLOSE-PAR)
            ::
          ::  IF COLUMN HAS RETREATED, ADJUST STACK
          =.  ..$  (BACK COL.SAW)
            ::
          =^  COL-OK  STY.SAW
            ?+  (SUB COL.SAW INR.IND)  [| STY.SAW]      :: COLUMNS ADVANCED
              $0  [& STY.SAW]
              $8  [& %NEW %POEM]
            ==
          ?.  COL-OK
            ~?  VERBOSE  [%COLUMNS-ADVANCED COL.SAW INR.IND]
            ..$(ERR `[P.LOC COL.SAW])
        ::
          =.  INR.IND  COL.SAW
      ::
          ::  UNLESS ADDING A MATCHING ITEM, CLOSE LISTS
          =.  ..$
            ?:  ?|  &(?=($LUNT P.CUR) !?=($LINT +.STY.SAW))
                    &(?=($LORD P.CUR) !?=($LITE +.STY.SAW))
                ==
              CLOSE-ITEM
            ..$
        ::
          =<  LINE(PAR `[LOC ~])  ^+  ..$               ::  CONTINUE WITH PARA
          ?-    -.STY.SAW
              $ONE  (READ-ONE +.STY.SAW)                ::  PARSE LEAVES
              $NEW  (OPEN-ITEM P.STY.SAW)               ::  OPEN CONTAINERS
              $OLD  ..$                                 ::  JUST TEXT
          ==
        ::
        ::
        ::- - - FOO
        ::  DETECT BAD BLOCK STRUCTURE
        ?.  ::  FIRST LINE OF CONTAINER IS LEGAL
            ?~  Q.U.PAR  &
            ?-  P.CUR
        ::
            ::  CAN'T(/DIRECTLY) CONTAIN TEXT
              ?($LORD $LUNT)  ~|(BAD-LEAF-CONTAINER+P.CUR !!)
        ::
            ::  ONLY ONE LINE IN A HEADER
              $HEAD  |
          ::
            ::  INDENTED LITERALS NEED TO END WITH A BLANK LINE
              $POEM  (GTE COL.SAW INR.IND)
        ::
            ::  TEXT TARPS MUST CONTINUE ALIGNED
              ?($DOWN $LUNT $LIME $LORD $BLOC)  =(COL.SAW INR.IND)
          ==
          ~?  VERBOSE  BAD-BLOCK-STRUCTURE+[P.CUR INR.IND COL.SAW]
          ..$(ERR `[P.LOC COL.SAW])
        ::
        ::  ACCEPT LINE AND MAYBE CONTINUE
        =^  A/{LIN/TAPE FIN/(UNIT _ERR)}  +<.$  READ-LINE
        =.  PAR  PAR(Q.U [LIN.A Q.U.PAR])
        ?^  FIN.A  ..$(ERR U.FIN.A)
        LINE
      ++  PARSE-BLOCK                                   ::  EXECUTE PARSER
        |=  FEL/$-(NAIL (LIKE TARP))  ^+  +>
        =/  VEX/(LIKE TARP)  (FEL LOC TXT)
        ?~  Q.VEX
          ~?  VERBOSE  [%PARSE-BLOCK TXT]
          +>.$(ERR `P.VEX)
        =+  [RES LOC TXT]=U.Q.VEX
        %_  +>.$
          LOC  LOC
          TXT  TXT
          Q.CUR  (WELD (FLOP `TARP`RES) Q.CUR)          ::  PREPEND TO THE STACK
        ==
      ::
      ++  READ-ONE                                      ::  READ %ONE ITEM
        |=  STY/?($EXPR $RULE $FENS)  ^+  +>
        ?-  STY
          $EXPR  (PARSE-BLOCK EXPR:PARSE)
          $RULE  (PARSE-BLOCK HRUL:PARSE)
          $FENS  (PARSE-BLOCK (FENS:PARSE INR.IND))
        ==
      ::
      ++  OPEN-ITEM                                     ::  ENTER LIST/QUOTE
        |=  SAW/TRIG-NEW
        =<  +>.$:APEX
        |%
        ++  APEX  ^+  .                                 ::  OPEN CONTAINER
          ?-  SAW
            $POEM  (PUSH %POEM)                         ::  VERSE LITERAL
            $HEAD  (PUSH %HEAD)                         ::  HEADING
            $BLOC  (ENTR %BLOC)                         ::  BLOCKQUOTE LINE
            $LINT  (LENT %LUNT)                         ::  UNORDERED LIST
            $LITE  (LENT %LORD)                         ::  ORDERED LIST
          ==
        ::
        ++  PUSH                                        ::  PUSH CONTEXT
          |=(MITE +>(HAC [CUR HAC], CUR [+< ~]))
        ::
        ++  ENTR                                        ::  ENTER CONTAINER
          |=  TYP/MITE
          ^+  +>
          ::
          ::  INDENT BY 2
          =.  INR.IND  (ADD 2 INR.IND)
          ::
          ::  "PARSE" MARKER
          =.  TXT  (SLAG (SUB INR.IND Q.LOC) TXT)
          =.  Q.LOC  INR.IND
          ::
          (PUSH TYP)
        ::
        ++  LENT                                        ::  LIST ENTRY
          |=  ORD/?($LORD $LUNT)
          ^+  +>
          =>  ?:(=(ORD P.CUR) +>.$ (PUSH ORD))          ::  PUSH LIST IF NEW
          (ENTR %LIME)
        --
      --
    ::
    ++  PARSE                                           ::  INDIVIDUAL PARSERS
      |%
      ++  LOOK                                          ::  CLASSIFY LINE
        %+  COOK  |=(A/(UNIT TRIG) A)
        ;~  PFIX  (STAR ACE)
          %+  HERE                                      ::  REPORT INDENT
            |=({A/PINT B/?(~ TRIG-STYLE)} ?~(B ~ `[Q.P.A B]))
          ;~  POSE
            (COLD ~ (JUST `@`10))                       ::  BLANK LINE
          ::
            (FULL (EASY [%END %DONE]))                  ::  END OF INPUT
            (COLD [%END %STET] DUZ)                     ::  == END OF MARKDOWN
          ::
            (COLD [%ONE %RULE] ;~(PLUG HEP HEP HEP))    ::  --- HORIZONTAL RULER
            (COLD [%ONE %FENS] ;~(PLUG TEC TEC TEC))    ::  ``` CODE FENCE
            (COLD [%ONE %EXPR] MIC)                     ::  ;SAIL EXPRESSION
          ::
            (COLD [%NEW %HEAD] ;~(PLUG (STAR HAX) ACE)) ::  # HEADING
            (COLD [%NEW %LINT] ;~(PLUG HEP ACE))        ::  - LINE ITEM
            (COLD [%NEW %LITE] ;~(PLUG LUS ACE))        ::  + LINE ITEM
            (COLD [%NEW %BLOC] ;~(PLUG BAN ACE))        ::  > BLOCK-QUOTE
          ::
            (EASY [%OLD %TEXT])                         ::  ANYTHING ELSE
          ==
        ==
      ::
      ::
      ++  CALF                                          ::  CASH BUT FOR TEC TEC
        |*  TEM=RULE
        %-  STAR
        ;~  POSE
          WHIT
          ;~(PFIX BAS TEM)
          ;~(LESS TEM PRN)
        ==
      ++  CASH                                          ::  ESCAPED FENCE
        |*  TEM/RULE
        %-  ECHO
        %-  STAR
        ;~  POSE
          WHIT
          ;~(PLUG BAS TEM)
          ;~(LESS TEM PRN)
        ==
      ::
      ++  COOL                                          ::  REPARSE
        |*  $:  ::  FEX: PRIMARY PARSER
                ::  SAB: SECONDARY PARSER
                ::
                FEX/RULE
                SAB/RULE
            ==
        |=  {LOC/HAIR TXT/TAPE}
        ^+  *SAB
        ::
        ::  VEX: FENCED SPAN
        =/  VEX/(LIKE TAPE)  (FEX LOC TXT)
        ?~  Q.VEX  VEX
        ::
        ::  HAV: REPARSE FULL FENCED TEXT
        =/  HAV  ((FULL SAB) [LOC P.U.Q.VEX])
        ::
        ::  REPARSED ERROR POSITION IS ALWAYS AT START
        ?~  Q.HAV  [LOC ~]
        ::
        ::  THE COMPLETE TYPE WITH THE MAIN PRODUCT
        :-  P.VEX
        `[P.U.Q.HAV Q.U.Q.VEX]
      ::
      ::REVIEW SURELY THERE IS A LESS HACKY "FIRST OR AFTER SPACE" SOLUTION
      ++  EASY-SOL                                      ::  PARSE START OF LINE
        |*  A/*
        |=  B/NAIL
        ?:  =(1 Q.P.B)  ((EASY A) B)
        (FAIL B)
      ::
      ++  ECHO                                          ::  HOON LITERAL
        |*  SAB/RULE
        |=  {LOC/HAIR TXT/TAPE}
        ^-  (LIKE TAPE)
        ::
        ::  VEX: RESULT OF PARSING WIDE HOON
        =/  VEX  (SAB LOC TXT)
        ::
        ::  USE RESULT OF EXPRESSION PARSER
        ?~  Q.VEX  VEX
        =-  [P.VEX `[- Q.U.Q.VEX]]
        ::
        ::  BUT REPLACE PAYLOAD WITH BYTES CONSUMED
        |-  ^-  TAPE
        ?:  =(Q.Q.U.Q.VEX TXT)  ~
        ?~  TXT  ~
        [I.TXT $(TXT +.TXT)]
      ::
      ++  NON-EMPTY
        |*  A/RULE
        |=  TUB/NAIL  ^+  (A)
        =/  VEX  (A TUB)
        ~!  VEX
        ?~  Q.VEX  VEX
        ?.  =(TUB Q.U.Q.VEX)  VEX
        (FAIL TUB)
      ::
      ::
      ++  WORD                                          ::  TARP PARSER
        %+  KNEE  *(LIST GRAF)  |.  ~+
        %+  COOK
          |=  A/$%(GRAF [%LIST (LIST GRAF)])
          ^-  (LIST GRAF)
          ?:(?=(%LIST -.A) +.A [A ~])
        ;~  POSE
        ::
        ::  ORDINARY WORD
        ::
          %+  STAG  %TEXT
          ;~(PLUG ;~(POSE LOW HIG) (STAR ;~(POSE NUD LOW HIG HEP)))
        ::
        ::  NAKED \ESCAPE
        ::
          (STAG %TEXT ;~(PFIX BAS (COOK TRIP ;~(LESS ACE PRN))))
        ::
        ::  TRAILING \ TO ADD <BR>
        ::
          (STAG %EXPR (COLD [[%BR ~] ~] ;~(PLUG BAS (JUST '\0A'))))
        ::
        ::  *BOLD LITERAL*
        ::
          (STAG %BOLD (IFIX [TAR TAR] (COOL (CASH TAR) WERK)))
        ::
        ::  _ITALIC LITERAL_
        ::
          (STAG %TALC (IFIX [CAB CAB] (COOL (CASH CAB) WERK)))
        ::
        ::  "QUOTED TEXT"
        ::
          (STAG %QUOD (IFIX [YEL YEL] (COOL (CASH YEL) WERK)))
        ::
        ::  `CLASSIC MARKDOWN QUOTE`
        ::
          (STAG %CODE (IFIX [TEC TEC] (CALF TEC)))
        ::
        ::  ++ARM
        ::
          (STAG %CODE ;~(PLUG LUS LUS LOW (STAR ;~(POSE NUD LOW HEP))))
        ::
        ::  [ARBITRARY *CONTENT*](URL)
        ::
          %+  STAG  %LINK
          ;~  (GLUE (PUNT WHIT))
            (IFIX [LAC RAC] (COOL (CASH RAC) WERK))
            (IFIX [LIT RIT] (CASH RIT))
          ==
        ::
        ::  ![ALT TEXT](URL)
        ::
          %+  STAG  %MAGE
          ;~  PFIX  ZAP
            ;~  (GLUE (PUNT WHIT))
              (IFIX [LAC RAC] (CASH RAC))
              (IFIX [LIT RIT] (CASH RIT))
            ==
          ==
        ::
        ::  #HOON
        ::
          %+  STAG  %LIST
          ;~  PLUG
            (STAG %TEXT ;~(POSE (COLD " " WHIT) (EASY-SOL ~)))
            (STAG %CODE ;~(PFIX HAX (ECHO WIDE)))
            ;~(SIMU WHIT (EASY ~))
          ==
        ::
        ::  DIRECT HOON CONSTANT
        ::
          %+  STAG  %LIST
          ;~  PLUG
            (STAG %TEXT ;~(POSE (COLD " " WHIT) (EASY-SOL ~)))
          ::
            %+  STAG  %CODE
            %-  ECHO
            ;~  POSE
              ::REVIEW JUST COPY IN 0X... PARSERS DIRECTLY?
              ;~(SIMU ;~(PLUG (JUST '0') ALP) BISK:SO)
            ::
              TASH:SO
              ;~(PFIX DOT PERD:SO)
              ;~(PFIX SIG ;~(POSE TWID:SO (EASY [%$ %N 0])))
              ;~(PFIX CEN ;~(POSE SYM BUS PAD BAR QUT NUCK:SO))
            ==
          ::
            ;~(SIMU WHIT (EASY ~))
          ==
        ::
        ::  WHITESPACE
        ::
          (STAG %TEXT (COLD " " WHIT))
        ::
        ::  {INTERPOLATED} SAIL
        ::
          (STAG %EXPR INLINE-EMBED:(SAIL |))
        ::
        ::  JUST A BYTE
        ::
          (STAG %TEXT (COOK TRIP ;~(LESS ACE PRN)))
        ==
      ::
      ++  WERK  (COOK ZING (STAR WORD))                 ::  INDEFINITE TARP
      ::
      ++  DOWN                                          ::  PARSE INLINE TARP
        %+  KNEE  *TARP  |.  ~+
        =-  (COOK - WERK)
        ::
        ::  COLLECT RAW TARP INTO XML TAGS
        |=  GAF/(LIST GRAF)
        ^-  TARP
        =<  MAIN
        |%
        ++  MAIN
          ^-  TARP
          ?~  GAF  ~
          ?.  ?=($TEXT -.I.GAF)
            (WELD (ITEM I.GAF) $(GAF T.GAF))
          ::
          ::  FIP: ACCUMULATE TEXT BLOCKS
          =/  FIP/(LIST TAPE)  [P.I.GAF]~
          |-  ^-  TARP
          ?~  T.GAF  [;/((ZING (FLOP FIP))) ~]
          ?.  ?=($TEXT -.I.T.GAF)
            [;/((ZING (FLOP FIP))) ^$(GAF T.GAF)]
          $(GAF T.GAF, FIP :_(FIP P.I.T.GAF))
        ::
        ++  ITEM
          |=  NEX/GRAF
          ^-  TARP  ::CHECK CAN BE TUNA:HOOT?
          ?-  -.NEX
            $TEXT  !!  :: HANDLED SEPARATELY
            $EXPR  [P.NEX]~
            $BOLD  [[%B ~] ^$(GAF P.NEX)]~
            $TALC  [[%I ~] ^$(GAF P.NEX)]~
            $CODE  [[%CODE ~] ;/(P.NEX) ~]~
            $QUOD  ::
                   ::  SMART QUOTES
                   %=    ^$
                       GAF
                     :-  [%TEXT (TUFA ~-~201C. ~)]
                     %+  WELD  P.NEX
                     `(LIST GRAF)`[%TEXT (TUFA ~-~201D. ~)]~
                   ==
            $LINK  [[%A [%HREF Q.NEX] ~] ^$(GAF P.NEX)]~
            $MAGE  [[%IMG [%SRC Q.NEX] ?~(P.NEX ~ [%ALT P.NEX]~)] ~]~
          ==
        --
      ::
      ++  HRUL                                          ::  EMPTY BESIDES FENCE
        %+  COLD  [[%HR ~] ~]~
        ;~(PLUG (STAR ACE) HEP HEP HEP (STAR HEP) (JUST '\0A'))
      ::
      ++  TECS
        ;~(PLUG TEC TEC TEC (JUST '\0A'))
      ::
      ++  FENS
        |=  COL/@U  ~+
        =/  IND  (STUN [(DEC COL) (DEC COL)] ACE)
        =/  IND-TECS  ;~(PLUG IND TECS)
        %+  COOK  |=(TXT/TAPE `TARP`[[%PRE ~] ;/(TXT) ~]~)
        ::
        ::  LEADING OUTDENT IS OK SINCE CONTAINER MAY
        ::  HAVE ALREADY BEEN PARSED AND CONSUMED
        %+  IFIX  [;~(PLUG (STAR ACE) TECS) IND-TECS]
        %^  STIR  ""  |=({A/TAPE B/TAPE} "{A}\0A{B}")
        ;~  POSE
          %+  IFIX  [IND (JUST '\0A')]
          ;~(LESS TECS (STAR PRN))
        ::
          (COLD "" ;~(PLUG (STAR ACE) (JUST '\0A')))
        ==
      ::
      ++  PARA                                          ::  PARAGRAPH
        %+  COOK
          |=(A/TARP ?~(A ~ [[%P ~] A]~))
        ;~(PFIX (PUNT WHIT) DOWN)
      ::
      ++  EXPR                                          ::  EXPRESSION
        =>  (SAIL &)                                    ::  TALL-FORM
        %+  IFIX  [(STAR ACE) ;~(SIMU GAP (EASY))]      ::  LOOK-AHEAD FOR GAP
        (COOK DROP-TOP TOP-LEVEL)                       ::  LIST OF TAGS
        ::
      ::
      ++  WHIT                                          ::  WHITESPACE
        (COLD ' ' (PLUS ;~(POSE (JUST ' ') (JUST '\0A'))))
      ::
      ++  HEAD                                          ::  PARSE HEADING
        %+  COOK
          |=  {HAXES/TAPE KIDS/TARP}  ^-  TARP
          =/  TAG  (CRIP 'H' <(LENT HAXES)>)            ::  E.G. ### -> %H3
          =/  ID  (CONTENTS-TO-ID KIDS)
          [[TAG [%ID ID]~] KIDS]~
        ::
        ;~(PFIX (STAR ACE) ;~((GLUE WHIT) (STUN [1 6] HAX) DOWN))
      ::
      ++  CONTENTS-TO-ID                                ::  # TEXT INTO ELEM ID
        |=  A/(LIST TUNA:HOOT)  ^-  TAPE
        =;  RAW/TAPE
          %+  TURN  RAW
          |=  @TD
          ^-  @TD
          ?:  ?|  &((GTE +< 'A') (LTE +< 'Z'))
                  &((GTE +< '0') (LTE +< '9'))
              ==
            +<
          ?:  &((GTE +< 'A') (LTE +< 'Z'))
            (ADD 32 +<)
          '-'
        ::
        ::  COLLECT ALL TEXT IN HEADER TARP
        |-  ^-  TAPE
        ?~  A  ~
        %+  WELD
          ^-  TAPE
          ?-    I.A
              {{$$ {$$ *} ~} ~}                       ::  TEXT NODE CONTENTS
            (MURN V.I.A.G.I.A |=(A/BEER:HOOT ?^(A ~ (SOME A))))
              {^ *}  $(A C.I.A)                         ::  CONCATENATE CHILDREN
              {@ *}  ~                                  ::  IGNORE INTERPOLATION
          ==
        $(A T.A)
      --
    --
  ::
  ++  SCAD
    %+  KNEE  *SPEC  |.  ~+
    %-  STEW
    ^.  STET  ^.  LIMO
    :~
      :-  '_'
        ;~(PFIX CAB (STAG %BSCB WIDE))
      :-  ','
        ;~(PFIX COM (STAG %BSMC WIDE))
      :-  '$'
        ;~  POSE
          ;~  PFIX  BUS
            ;~  POSE
            ::  XX ALL THREE DEPRECATED
            ::
              (STAG %LEAF (STAG %TAS (COLD %$ BUS)))
              (STAG %LEAF (STAG %T QUT))
              (STAG %LEAF (SEAR |=(A/COIN ?:(?=($$ -.A) (SOME +.A) ~)) NUCK:SO))
            ==
          ==
          (STAG %LIKE (MOST COL ROPE))
        ==
      :-  '%'
        ;~  POSE
          ;~  PFIX  CEN
            ;~  POSE
              (STAG %LEAF (STAG %TAS (COLD %$ BUS)))
              (STAG %LEAF (STAG %F (COLD & PAD)))
              (STAG %LEAF (STAG %F (COLD | BAR)))
              (STAG %LEAF (STAG %T QUT))
              (STAG %LEAF (SEAR |=(A/COIN ?:(?=($$ -.A) (SOME +.A) ~)) NUCK:SO))
            ==
          ==
        ==
      :-  '('
        %+  COOK  |=(SPEC +<)
        %+  STAG  %MAKE
        %+  IFIX  [LIT RIT]
        ;~  PLUG
          WIDE
          ;~(POSE ;~(PFIX ACE (MOST ACE WYDE)) (EASY ~))
        ==
      :-  '{'
        ::  XX DEPRECATED
        ::
        (STAG %BSCL (IFIX [LOB ROB] (MOST ACE WYDE)))
      :-  '['
        (STAG %BSCL (IFIX [LAC RAC] (MOST ACE WYDE)))
      :-  '*'
        (COLD [%BASE %NOUN] TAR)
      :-  '/'
        ;~(PFIX NET (STAG %LOOP ;~(POSE (COLD %$ BUS) SYM)))
      :-  '@'
        ;~(PFIX VAT (STAG %BASE (STAG %ATOM MOTA)))
      :-  '?'
        ;~  POSE
          %+  STAG  %BSWT
          ;~(PFIX WUT (IFIX [LIT RIT] (MOST ACE WYDE)))
        ::
          (COLD [%BASE %FLAG] WUT)
        ==
      :-  '~'
        (COLD [%BASE %NULL] SIG)
      :-  '!'
        (COLD [%BASE %VOID] ;~(PLUG ZAP ZAP))
      :-  '^'
        ;~  POSE
          (STAG %LIKE (MOST COL ROPE))
          (COLD [%BASE %CELL] KET)
        ==
      :-  '='
        ;~  PFIX  TIS
          %+  SEAR
            |=  [=(UNIT TERM) =SPEC]
            %+  BIND
              ~(AUTONAME AX & SPEC)
            |=  =TERM
            =*  NAME  ?~(UNIT TERM (CAT 3 U.UNIT (CAT 3 '-' TERM)))
            [%BSTS NAME SPEC]
          ;~  POSE
            ;~(PLUG (STAG ~ ;~(SFIX SYM TIS)) WYDE)
            (STAG ~ WYDE)
          ==
        ==
      :-  ['A' 'Z']
        ;~  POSE
          (STAG %BSTS ;~(PLUG SYM ;~(PFIX ;~(POSE NET TIS) WYDE)))
          (STAG %LIKE (MOST COL ROPE))
        ==
    ==
  ::
  ++  SCAT
    %+  KNEE  *HOON  |.  ~+
    %-  STEW
    ^.  STET  ^.  LIMO
    :~
      :-  ','
        ;~  POSE
          (STAG %KTCL ;~(PFIX COM WYDE))
          (STAG %WING ROPE)
        ==
      :-  '!'
        ;~  POSE
          (STAG %WTZP ;~(PFIX ZAP WIDE))
          (STAG %ZPZP (COLD ~ ;~(PLUG ZAP ZAP)))
        ==
      :-  '_'
        ;~(PFIX CAB (STAG %KTCL (STAG %BSCB WIDE)))
      :-  '$'
        ;~  POSE
          ;~  PFIX  BUS
            ;~  POSE
              ::  XX: THESE ARE ALL OBSOLETE IN HOON 142
              ::
              (STAG %LEAF (STAG %TAS (COLD %$ BUS)))
              (STAG %LEAF (STAG %T QUT))
              (STAG %LEAF (SEAR |=(A/COIN ?:(?=($$ -.A) (SOME +.A) ~)) NUCK:SO))
            ==
          ==
          RUMP
        ==
      :-  '%'
        ;~  PFIX  CEN
          ;~  POSE
            (STAG %CLSG (SEAR |~({A/@UD B/TYKE} (POSH ~ ~ A B)) PORC))
            (STAG %ROCK (STAG %TAS (COLD %$ BUS)))
            (STAG %ROCK (STAG %F (COLD & PAD)))
            (STAG %ROCK (STAG %F (COLD | BAR)))
            (STAG %ROCK (STAG %T QUT))
            (COOK (JOCK &) NUCK:SO)
            (STAG %CLSG (SEAR |=(A/(LIST) (POSH ~ ~ (LENT A) ~)) (STAR CEN)))
          ==
        ==
      :-  '&'
        ;~  POSE
          (COOK |=(A/WING [%CNTS A ~]) ROPE)
          (STAG %WTPD ;~(PFIX PAD (IFIX [LIT RIT] (MOST ACE WIDE))))
          ;~(PLUG (STAG %ROCK (STAG %F (COLD & PAD))) WEDE)
          (STAG %SAND (STAG %F (COLD & PAD)))
        ==
      :-  '\''
        (STAG %SAND (STAG %T QUT))
      :-  '('
        (STAG %CNCL (IFIX [LIT RIT] (MOST ACE WIDE)))
      :-  '{'
        (STAG %KTCL (STAG %BSCL (IFIX [LOB ROB] (MOST ACE WYDE))))
      :-  '*'
        ;~  POSE
          (STAG %KTTR ;~(PFIX TAR WYDE))
          (COLD [%BASE %NOUN] TAR)
        ==
      :-  '@'
        ;~(PFIX VAT (STAG %BASE (STAG %ATOM MOTA)))
      :-  '+'
        ;~  POSE
          (STAG %DTLS ;~(PFIX LUS (IFIX [LIT RIT] WIDE)))
        ::
          %+  COOK
            |=  A/(LIST (LIST WOOF))
            :-  %MCNT
            [%KNIT |-(^-((LIST WOOF) ?~(A ~ (WELD I.A $(A T.A)))))]
          (MOST DOG ;~(PFIX LUS SOIL))
        ::
          (COOK |=(A/WING [%CNTS A ~]) ROPE)
        ==
      :-  '-'
        ;~  POSE
          (STAG %SAND TASH:SO)
        ::
          %+  COOK
            |=  A/(LIST (LIST WOOF))
            [%CLSG (PHAX A)]
          (MOST DOG ;~(PFIX HEP SOIL))
        ::
          (COOK |=(A/WING [%CNTS A ~]) ROPE)
        ==
      :-  '.'
        ;~  POSE
          (COOK (JOCK |) ;~(PFIX DOT PERD:SO))
          (COOK |=(A/WING [%CNTS A ~]) ROPE)
        ==
      :-  ['0' '9']
        %+  COOK
          |=  {A/DIME B/(UNIT HOON)}
          ?~(B [%SAND A] [[%ROCK A] U.B])
        ;~(PLUG BISK:SO (PUNT WEDE))
      :-  ':'
        ;~  PFIX  COL
          ;~  POSE
            (STAG %MCCL (IFIX [LIT RIT] (MOST ACE WIDE)))
            ;~(PFIX NET (STAG %MCNT WIDE))
          ==
        ==
      :-  '='
        ;~  PFIX  TIS
          ;~  POSE
            (STAG %DTTS (IFIX [LIT RIT] ;~(GLAM WIDE WIDE)))
          ::
            %+  SEAR
              ::  MAINLY USED FOR +SKIN FORMATION
              ::
              |=  =SPEC
              ^-  (UNIT HOON)
              %+  BIND  ~(AUTONAME AX & SPEC)
              |=(=TERM `HOON`[%KTTS TERM %KTTR SPEC])
            WYDE
          ==
        ==
      :-  '?'
        ;~  POSE
          %+  STAG  %KTCL
          (STAG %BSWT ;~(PFIX WUT (IFIX [LIT RIT] (MOST ACE WYDE))))
        ::
          (COLD [%BASE %FLAG] WUT)
        ==
      :-  '['
        RUPL
      :-  '^'
        ;~  POSE
          (STAG %WING ROPE)
          (COLD [%BASE %CELL] KET)
        ==
      :-  '`'
        ;~  PFIX  TEC
          ;~  POSE
            %+  COOK
              |=({A/@TA B/HOON} [%KTLS [%SAND A 0] [%KTLS [%SAND %$ 0] B]])
            ;~(PFIX VAT ;~(PLUG MOTA ;~(PFIX TEC WIDE)))
            ;~  PFIX  TAR
              (STAG %KTHP (STAG [%BASE %NOUN] ;~(PFIX TEC WIDE)))
            ==
            (STAG %KTHP ;~(PLUG WYDE ;~(PFIX TEC WIDE)))
            (STAG %KTLS ;~(PFIX LUS ;~(PLUG WIDE ;~(PFIX TEC WIDE))))
            (COOK |=(A/HOON [[%ROCK %N ~] A]) WIDE)
          ==
        ==
      :-  '"'
        %+  COOK
          |=  A/(LIST (LIST WOOF))
          [%KNIT |-(^-((LIST WOOF) ?~(A ~ (WELD I.A $(A T.A)))))]
        (MOST DOG SOIL)
      :-  ['A' 'Z']
        RUMP
      :-  '|'
        ;~  POSE
          (COOK |=(A/WING [%CNTS A ~]) ROPE)
          (STAG %WTBR ;~(PFIX BAR (IFIX [LIT RIT] (MOST ACE WIDE))))
          ;~(PLUG (STAG %ROCK (STAG %F (COLD | BAR))) WEDE)
          (STAG %SAND (STAG %F (COLD | BAR)))
        ==
      :-  '~'
        ;~  POSE
          RUPL
        ::
          ;~  PFIX  SIG
            ;~  POSE
              (STAG %CLSG (IFIX [LAC RAC] (MOST ACE WIDE)))
            ::
              %+  STAG  %CNSG
              %+  IFIX
                [LIT RIT]
              ;~(GLAM ROPE WIDE (MOST ACE WIDE))
            ::
              (COOK (JOCK |) TWID:SO)
              (STAG [%BUST %NULL] WEDE)
              (EASY [%BUST %NULL])
            ==
          ==
        ==
      :-  '/'
        ROOD
      :-  '<'
        (IFIX [LED BAN] (STAG %TELL (MOST ACE WIDE)))
      :-  '>'
        (IFIX [BAN LED] (STAG %YELL (MOST ACE WIDE)))
    ==
  ++  SOIL
    ;~  POSE
      ;~  LESS  (JEST '"""')
        %+  IFIX  [YEL YEL]
        %-  STAR
        ;~  POSE
          ;~(PFIX BAS ;~(POSE BAS YEL LOB BIX:AB))
          ;~(LESS YEL BAS LOB PRN)
          (STAG ~ SUMP)
        ==
      ==
    ::
      %-  INY  %+  IFIX
        [(JEST '"""\0A') (JEST '\0A"""')]
      %-  STAR
      ;~  POSE
        ;~(PFIX BAS ;~(POSE BAS LOB BIX:AB))
        ;~(LESS BAS LOB PRN)
        ;~(LESS (JEST '\0A"""') (JUST `@`10))
        (STAG ~ SUMP)
      ==
    ==
  ++  SUMP  (IFIX [LOB ROB] (STAG %CLTR (MOST ACE WIDE)))
  ++  NORM                                              ::  RUNE REGULAR FORM
    |=  TOL/?
    |%
    ++  STRUCTURE
      %-  STEW
      ^.  STET  ^.  LIMO
      :~  :-  '$'
            ;~  PFIX  BUS
              %-  STEW
              ^.  STET  ^.  LIMO
              :~  [':' (RUNE COL %BSCL EXQS)]
                  ['%' (RUNE CEN %BSCN EXQS)]
                  ['<' (RUNE LED %BSLD EXQB)]
                  ['>' (RUNE BAN %BSBN EXQB)]
                  ['^' (RUNE KET %BSKT EXQB)]
                  ['~' (RUNE SIG %BSSG EXQD)]
                  ['|' (RUNE BAR %BSBR EXQC)]
                  ['&' (RUNE PAD %BSPD EXQC)]
                  ['@' (RUNE VAT %BSVT EXQB)]
                  ['_' (RUNE CAB %BSCB EXPA)]
                  ['-' (RUNE HEP %BSHP EXQB)]
                  ['=' (RUNE TIS %BSTS EXQG)]
                  ['?' (RUNE WUT %BSWT EXQS)]
                  [';' (RUNE MIC %BSMC EXPA)]
              ==
            ==
        :-  '%'
          ;~  PFIX  CEN
            %-  STEW
            ^.  STET  ^.  LIMO
            :~  :-  '^'
                %+  COOK
                  |=  [%CNKT A/HOON B/SPEC C/SPEC D/SPEC]
                  [%MAKE A B C D ~]
                (RUNE KET %CNKT EXQY)
            ::
                :-  '+'
                %+  COOK
                  |=  [%CNLS A/HOON B/SPEC C/SPEC]
                  [%MAKE A B C ~]
                (RUNE LUS %CNLS EXQX)
            ::
                :-  '-'
                %+  COOK
                  |=  [%CNHP A/HOON B/SPEC]
                  [%MAKE A B ~]
                (RUNE HEP %CNHP EXQD)
            ::
                :-  ':'
                %+  COOK
                  |=  [%CNCL A/HOON B/(LIST SPEC)]
                  [%MAKE A B]
                (RUNE COL %CNCL EXQZ)
            ==
          ==
      ==
    ++  EXPRESSION
      %-  STEW
      ^.  STET  ^.  LIMO
      :~  :-  '|'
            ;~  PFIX  BAR
              %-  STEW
              ^.  STET  ^.  LIMO
              :~  ['_' (RUNE CAB %BRCB EXQR)]
                  ['%' (RUNO CEN %BRCN ~ EXPE)]
                  ['@' (RUNO VAT %BRVT ~ EXPE)]
                  [':' (RUNE COL %BRCL EXPB)]
                  ['.' (RUNE DOT %BRDT EXPA)]
                  ['-' (RUNE HEP %BRHP EXPA)]
                  ['^' (RUNE KET %BRKT EXPX)]
                  ['~' (RUNE SIG %BRSG EXQC)]
                  ['*' (RUNE TAR %BRTR EXQC)]
                  ['=' (RUNE TIS %BRTS EXQC)]
                  ['?' (RUNE WUT %BRWT EXPA)]
              ==
            ==
          :-  '$'
            ;~  PFIX  BUS
              %-  STEW
              ^.  STET  ^.  LIMO
              :~  ['@' (STAG %KTCL (RUNE VAT %BSVT EXQB))]
                  ['_' (STAG %KTCL (RUNE CAB %BSCB EXPA))]
                  [':' (STAG %KTCL (RUNE COL %BSCL EXQS))]
                  ['%' (STAG %KTCL (RUNE CEN %BSCN EXQS))]
                  ['<' (STAG %KTCL (RUNE LED %BSLD EXQB))]
                  ['>' (STAG %KTCL (RUNE BAN %BSBN EXQB))]
                  ['|' (STAG %KTCL (RUNE BAR %BSBR EXQC))]
                  ['&' (STAG %KTCL (RUNE PAD %BSPD EXQC))]
                  ['^' (STAG %KTCL (RUNE KET %BSKT EXQB))]
                  ['~' (STAG %KTCL (RUNE SIG %BSSG EXQD))]
                  ['-' (STAG %KTCL (RUNE HEP %BSHP EXQB))]
                  ['=' (STAG %KTCL (RUNE TIS %BSTS EXQG))]
                  ['?' (STAG %KTCL (RUNE WUT %BSWT EXQS))]
                  ['.' (RUNE DOT %KTTR EXQA)]
                  [',' (RUNE COM %KTCL EXQA)]
              ==
            ==
          :-  '%'
            ;~  PFIX  CEN
              %-  STEW
              ^.  STET  ^.  LIMO
              :~  ['_' (RUNE CAB %CNCB EXPH)]
                  ['.' (RUNE DOT %CNDT EXPB)]
                  ['^' (RUNE KET %CNKT EXPD)]
                  ['+' (RUNE LUS %CNLS EXPC)]
                  ['-' (RUNE HEP %CNHP EXPB)]
                  [':' (RUNE COL %CNCL EXPI)]
                  ['~' (RUNE SIG %CNSG EXPN)]
                  ['*' (RUNE TAR %CNTR EXPM)]
                  ['=' (RUNE TIS %CNTS EXPH)]
              ==
            ==
          :-  ':'
            ;~  PFIX  COL
              %-  STEW
              ^.  STET  ^.  LIMO
              :~  ['_' (RUNE CAB %CLCB EXPB)]
                  ['^' (RUNE KET %CLKT EXPD)]
                  ['+' (RUNE LUS %CLLS EXPC)]
                  ['-' (RUNE HEP %CLHP EXPB)]
                  ['~' (RUNE SIG %CLSG EXPS)]
                  ['*' (RUNE TAR %CLTR EXPS)]
              ==
            ==
          :-  '.'
            ;~  PFIX  DOT
              %-  STEW
              ^.  STET  ^.  LIMO
              :~  ['+' (RUNE LUS %DTLS EXPA)]
                  ['*' (RUNE TAR %DTTR EXPB)]
                  ['=' (RUNE TIS %DTTS EXPB)]
                  ['?' (RUNE WUT %DTWT EXPA)]
                  ['^' (RUNE KET %DTKT EXQN)]
              ==
            ==
          :-  '^'
            ;~  PFIX  KET
              %-  STEW
              ^.  STET  ^.  LIMO
              :~  ['|' (RUNE BAR %KTBR EXPA)]
                  ['.' (RUNE DOT %KTDT EXPB)]
                  ['-' (RUNE HEP %KTHP EXQC)]
                  ['+' (RUNE LUS %KTLS EXPB)]
                  ['&' (RUNE PAD %KTPD EXPA)]
                  ['~' (RUNE SIG %KTSG EXPA)]
                  ['=' (RUNE TIS %KTTS EXPJ)]
                  ['?' (RUNE WUT %KTWT EXPA)]
                  ['%' (RUNE CEN %KTCN EXPA)]
                  ['*' (RUNE TAR %KTTR EXQA)]
                  [':' (RUNE COL %KTCL EXQA)]
              ==
            ==
          :-  '~'
            ;~  PFIX  SIG
              %-  STEW
              ^.  STET  ^.  LIMO
              :~  ['|' (RUNE BAR %SGBR EXPB)]
                  ['$' (RUNE BUS %SGBS EXPF)]
                  ['_' (RUNE CAB %SGCB EXPB)]
                  ['%' (RUNE CEN %SGCN HIND)]
                  ['/' (RUNE NET %SGNT HINE)]
                  ['<' (RUNE LED %SGLD HINB)]
                  ['>' (RUNE BAN %SGBN HINB)]
                  ['+' (RUNE LUS %SGLS HINC)]
                  ['&' (RUNE PAD %SGPD HINF)]
                  ['?' (RUNE WUT %SGWT HING)]
                  ['=' (RUNE TIS %SGTS EXPB)]
                  ['!' (RUNE ZAP %SGZP EXPB)]
              ==
            ==
          :-  ';'
            ;~  PFIX  MIC
              %-  STEW
              ^.  STET  ^.  LIMO
              :~  [':' (RUNE COL %MCCL EXPI)]
                  ['/' (RUNE NET %MCNT EXPA)]
                  ['~' (RUNE SIG %MCSG EXPI)]
                  [';' (RUNE MIC %MCMC EXPB)]
              ==
            ==
          :-  '='
            ;~  PFIX  TIS
              %-  STEW
              ^.  STET  ^.  LIMO
              :~  ['|' (RUNE BAR %TSBR EXQC)]
                  ['.' (RUNE DOT %TSDT EXPQ)]
                  ['?' (RUNE WUT %TSWT EXPW)]
                  ['^' (RUNE KET %TSKT EXPT)]
                  [':' (RUNE COL %TSCL EXPP)]
                  ['/' (RUNE NET %TSNT EXPO)]
                  [';' (RUNE MIC %TSMC EXPO)]
                  ['<' (RUNE LED %TSLD EXPB)]
                  ['>' (RUNE BAN %TSBN EXPB)]
                  ['-' (RUNE HEP %TSHP EXPB)]
                  ['*' (RUNE TAR %TSTR EXPG)]
                  [',' (RUNE COM %TSCM EXPB)]
                  ['+' (RUNE LUS %TSLS EXPB)]
                  ['~' (RUNE SIG %TSSG EXPI)]
              ==
            ==
          :-  '?'
            ;~  PFIX  WUT
              %-  STEW
              ^.  STET  ^.  LIMO
              :~  ['|' (RUNE BAR %WTBR EXPS)]
                  [':' (RUNE COL %WTCL EXPC)]
                  ['.' (RUNE DOT %WTDT EXPC)]
                  ['<' (RUNE LED %WTLD EXPB)]
                  ['>' (RUNE BAN %WTBN EXPB)]
                  ['-' ;~(PFIX HEP (TOAD TXHP))]
                  ['^' ;~(PFIX KET (TOAD TKKT))]
                  ['=' ;~(PFIX TIS (TOAD TXTS))]
                  ['#' ;~(PFIX HAX (TOAD TXHX))]
                  ['+' ;~(PFIX LUS (TOAD TXLS))]
                  ['&' (RUNE PAD %WTPD EXPS)]
                  ['@' ;~(PFIX VAT (TOAD TKVT))]
                  ['~' ;~(PFIX SIG (TOAD TKSG))]
                  ['!' (RUNE ZAP %WTZP EXPA)]
              ==
            ==
          :-  '!'
            ;~  PFIX  ZAP
              %-  STEW
              ^.  STET  ^.  LIMO
              :~  [':' ;~(PFIX COL (TOAD EXPZ))]
                  ['.' ;~(PFIX DOT (TOAD |.(LOAF(BUG |))))]
                  [',' (RUNE COM %ZPCM EXPB)]
                  [';' (RUNE MIC %ZPMC EXPB)]
                  ['>' (RUNE BAN %ZPBN EXPA)]
                  ['@' (RUNE VAT %ZPVT EXPY)]
                  ['=' (RUNE TIS %ZPTS EXPA)]
                  ['?' (RUNE WUT %ZPWT HINH)]
              ==
            ==
      ==
    ::
    ++  BOOG  !:                                        ::  CORE ARMS
      %+  KNEE  [P=*TERM Q=*HOON]  |.  ~+
      ;~  POSE
        ;~  PFIX  ;~  POSE
                    (JEST '++')
                    (JEST '+-')   ::  XX DEPRECATED
                  ==
          ;~  PLUG
            ;~(PFIX GAP ;~(POSE (COLD %$ BUS) SYM))
            ;~(PFIX GAP LOAF)
          ==
        ==
      ::
        %+  COOK
          |=  {B/TERM D/SPEC}
          [B [%KTCL [%NAME B D]]]
        ;~  PFIX  ;~(POSE (JEST '+=') (JEST '+$'))
          ;~  PLUG
            ;~(PFIX GAP SYM)
            ;~(PFIX GAP LOAN)
          ==
        ==
      ::
        %+  COOK
          |=  [B=TERM C=(LIST TERM) E=SPEC]
          ^-  [TERM HOON]
          :*  B
              :+  %BRTR
                :-  %BSCL
                =-  ?>(?=(^ -) -)
                %+  TURN  C
                |=  =TERM
                ^-  SPEC
                :+  %BSTS
                  TERM
                [%BSHP [%BASE %NOUN] [%BASE %NOUN]]
              :-  %KTCL
              :+  %MADE
                [B C]
              E
          ==
        ;~  PFIX  (JEST '+*')
          ;~  PLUG
            ;~(PFIX GAP SYM)
            ;~(PFIX GAP (IFIX [LAC RAC] (MOST ACE SYM)))
            ;~(PFIX GAP LOAN)
          ==
        ==
      ==
    ::
    ++  WHAP  !:                                        ::  CHAPTER
      %+  COOK
        |=  A=(LIST (PAIR TERM HOON))
        |-  ^-  (MAP TERM HOON)
        ?~  A  ~
        =+  $(A T.A)
        %+  ~(PUT BY -)
          P.I.A
        ?:  (~(HAS BY -) P.I.A)
          [%EROR (WELD "DUPLICATE ARM: +" (TRIP P.I.A))]
        Q.I.A
      (MOST MUCK BOOG)
    ::
    ++  WHIP                                            ::  CHAPTER DECLARE
      ;~  PLUG
        (IFIX [CEN GAP] SYM)
        WHAP
      ==
    ::
    ++  WASP                                            ::  $BRCB ALIASES
      ;~  POSE
        %+  IFIX
          [;~(PLUG LUS TAR MUCK) MUCK]
        (MOST MUCK ;~(GUNK SYM LOAF))
      ::
        (EASY ~)
      ==
    ::
    ++  WISP  !:                                        ::  CORE TAIL
      ?.  TOL  FAIL
      %+  COOK
        |=  A=(LIST (PAIR TERM (MAP TERM HOON)))
        ^-  (MAP TERM TOME)
        =<  P
        |-  ^-  (PAIR (MAP TERM TOME) (MAP TERM HOON))
        ?~  A  [~ ~]
        =/  MOR  $(A T.A)
        =.  Q.I.A
          %-  ~(URN BY Q.I.A)
          |=  B=(PAIR TERM HOON)  ^+  +.B
          ?.  (~(HAS BY Q.MOR) P.B)  +.B
          [%EROR (WELD "DUPLICATE ARM: +" (TRIP P.B))]
        :_  (~(UNI BY Q.MOR) Q.I.A)
        %+  ~(PUT BY P.MOR)
          P.I.A
        :-  *WHAT
        ?.  (~(HAS BY P.MOR) P.I.A)
          Q.I.A
        [[%$ [%EROR (WELD "DUPLICATE CHAPTER: |" (TRIP P.I.A))]] ~ ~]
      ::
      ;~  POSE
        DUN
        ;~  SFIX
          ;~  POSE
            (MOST MUCK ;~(PFIX (JEST '+|') ;~(PFIX GAP WHIP)))
            ;~(PLUG (STAG %$ WHAP) (EASY ~))
          ==
          GAP
          DUN
        ==
      ==
    ::
    ++  TOAD                                            ::  UNTRAP PARSER EXP
      =+  HAR=EXPA
      |@  ++  $
            =+  DUR=(IFIX [LIT RIT] $:HAR(TOL |))
            ?:(TOL ;~(POSE ;~(PFIX GAP $:HAR(TOL &)) DUR) DUR)
      --
    ::
    ++  RUNE                                            ::  BUILD RUNE
      =+  [DIF=*RULE TUQ=** HAR=EXPA]
      |@  ++  $
            ;~(PFIX DIF (STAG TUQ (TOAD HAR)))
      --
    ::
    ++  RUNO                                            ::  RUNE PLUS
      =+  [DIF=*RULE HIL=** TUQ=** HAR=EXPA]
      |@  ++  $
            ;~(PFIX DIF (STAG HIL (STAG TUQ (TOAD HAR))))
      --
    ::
    ++  GLOP  ~+((GLUE MASH))                           ::  SEPARATED BY SPACE
    ++  GUNK  ~+((GLUE MUCK))                           ::  SEPARATED LIST
    ++  BUTT  |*  ZOR/RULE                              ::  CLOSING == IF TALL
              ?:(TOL ;~(SFIX ZOR ;~(PLUG GAP DUZ)) ZOR)
    ++  ULVA  |*  ZOR/RULE                              ::  CLOSING -- AND TALL
              ?.(TOL FAIL ;~(SFIX ZOR ;~(PLUG GAP DUN)))
    ++  HANK  (MOST MUCK LOAF)                          ::  GAPPED HOONS
    ++  HUNK  (MOST MUCK LOAN)                          ::  GAPPED SPECS
    ++  LORE  (SEAR |=(=HOON ~(FLAY AP HOON)) LOAF)     ::  SKIN
    ++  LOAF  ?:(TOL TALL WIDE)                         ::  TALL/WIDE HOON
    ++  LOAN  ?:(TOL TILL WYDE)                         ::  TALL/WIDE SPEC
    ++  LOMP  ;~(PLUG SYM (PUNT ;~(PFIX TIS WYDE)))     ::  TYPEABLE NAME
    ++  MASH  ?:(TOL GAP ;~(PLUG COM ACE))              ::  LIST SEPARATOR
    ++  MUCK  ?:(TOL GAP ACE)                           ::  GENERAL SEPARATOR
    ++  TEAK  %+  KNEE  *TIKI  |.  ~+                   ::  WING OR HOON
              =+  ^=  GUB
                  |=  {A/TERM B/$%({%& P/WING} {%| P/HOON})}
                  ^-  TIKI
                  ?-(-.B %& [%& [~ A] P.B], %| [%| [~ A] P.B])
              =+  ^=  WYP
                  ;~  POSE
                     %+  COOK  GUB
                     ;~  PLUG
                       SYM
                       ;~(PFIX TIS ;~(POSE (STAG %& ROPE) (STAG %| WIDE)))
                     ==
                  ::
                     (STAG %& (STAG ~ ROPE))
                     (STAG %| (STAG ~ WIDE))
                  ==
              ?.  TOL  WYP
              ;~  POSE
                WYP
              ::
                ;~  PFIX
                  ;~(PLUG KET TIS GAP)
                  %+  COOK  GUB
                  ;~  PLUG
                    SYM
                    ;~(PFIX GAP ;~(POSE (STAG %& ROPE) (STAG %| TALL)))
                  ==
                ==
              ::
                (STAG %| (STAG ~ TALL))
              ==
    ++  RACK  (MOST MASH ;~(GUNK LOAF LOAF))            ::  LIST [HOON HOON]
    ++  RUCK  (MOST MASH ;~(GUNK LOAN LOAF))            ::  LIST [SPEC HOON]
    ++  RICK  (MOST MASH ;~(GUNK ROPE LOAF))            ::  LIST [WING HOON]
    ::
    ::    HOON CONTENTS
    ::
    ++  EXPA  |.(LOAF)                                  ::  ONE HOON
    ++  EXPB  |.(;~(GUNK LOAF LOAF))                    ::  TWO HOONS
    ++  EXPC  |.(;~(GUNK LOAF LOAF LOAF))               ::  THREE HOONS
    ++  EXPD  |.(;~(GUNK LOAF LOAF LOAF LOAF))          ::  FOUR HOONS
    ++  EXPE  |.(WISP)                                  ::  CORE TAIL
    ++  EXPF  |.(;~(GUNK ;~(PFIX CEN SYM) LOAF))        ::  %TERM AND HOON
    ++  EXPG  |.(;~(GUNK LOMP LOAF LOAF))               ::  TERM/SPEC, TWO HOONS
    ++  EXPH  |.((BUTT ;~(GUNK ROPE RICK)))             ::  WING, [SPEC HOON]S
    ++  EXPI  |.((BUTT ;~(GUNK LOAF HANK)))             ::  ONE OR MORE HOONS
    ++  EXPJ  |.(;~(GUNK LORE LOAF))                    ::  SKIN AND HOON
    ++  EXPK  |.(;~(GUNK LOAF ;~(PLUG LOAF (EASY ~))))  ::  LIST OF TWO HOONS
    ++  EXPL  |.(;~(GUNK SYM LOAF LOAF))                ::  TERM, TWO HOONS
    ++  EXPM  |.((BUTT ;~(GUNK ROPE LOAF RICK)))        ::  SEVERAL [SPEC HOON]S
    ++  EXPN  |.  ;~  GUNK  ROPE  LOAF                  ::  WING, HOON,
                    ;~(PLUG LOAF (EASY ~))              ::  LIST OF ONE HOON
                  ==                                    ::
    ++  EXPO  |.(;~(GUNK WISE LOAF LOAF))               ::  =;
    ++  EXPP  |.(;~(GUNK (BUTT RICK) LOAF))             ::  [WING HOON]S, HOON
    ++  EXPQ  |.(;~(GUNK ROPE LOAF LOAF))               ::  WING AND TWO HOONS
    ++  EXPR  |.(;~(GUNK LOAF WISP))                    ::  HOON AND CORE TAIL
    ++  EXPS  |.((BUTT HANK))                           ::  CLOSED GAPPED HOONS
    ++  EXPT  |.(;~(GUNK WISE ROPE LOAF LOAF))          ::  =^
    ++  EXPU  |.(;~(GUNK ROPE LOAF (BUTT HANK)))        ::  WING, HOON, HOONS
    ++  EXPV  |.((BUTT RICK))                           ::  JUST CHANGES
    ++  EXPW  |.(;~(GUNK ROPE LOAF LOAF LOAF))          ::  WING AND THREE HOONS
    ++  EXPX  |.(;~(GUNK LOAF WISP))                    ::  HOON AND CORE TAIL
    ++  EXPY  |.(;~(GUNK ROPA LOAF LOAF))               ::  WINGS AND TWO HOONS
    ++  EXPZ  |.(LOAF(BUG &))                           ::  HOON WITH TRACING
    ::    SPEC CONTENTS
    ::
    ++  EXQA  |.(LOAN)                                  ::  ONE HOON
    ++  EXQB  |.(;~(GUNK LOAN LOAN))                    ::  TWO SPECS
    ++  EXQC  |.(;~(GUNK LOAN LOAF))                    ::  SPEC THEN HOON
    ++  EXQD  |.(;~(GUNK LOAF LOAN))                    ::  HOON THEN SPEC
    ++  EXQS  |.((BUTT HUNK))                           ::  CLOSED GAPPED SPECS
    ++  EXQG  |.(;~(GUNK SYM LOAN))                     ::  TERM AND SPEC
    ++  EXQK  |.(;~(GUNK LOAF ;~(PLUG LOAN (EASY ~))))  ::  HOON WITH ONE SPEC
    ++  EXQR  |.(;~(GUNK LOAN ;~(PLUG WASP WISP)))      ::  SPEC/ALIASES?/TAIL
    ++  EXQN  |.(;~(GUNK LOAN (STAG %CLTR (BUTT HANK))))::  AUTOCONSED HOONS
    ++  EXQW  |.(;~(GUNK LOAF LOAN))                    ::  HOON AND SPEC
    ++  EXQX  |.(;~(GUNK LOAF LOAN LOAN))               ::  HOON, TWO SPECS
    ++  EXQY  |.(;~(GUNK LOAF LOAN LOAN LOAN))          ::  HOON, THREE SPECS
    ++  EXQZ  |.(;~(GUNK LOAF (BUTT HUNK)))             ::  HOON, N SPECS
    ::
    ::    TIKI EXPANSION FOR %WT RUNES
    ::
    ++  TXHP  |.  %+  COOK  |=  {A/TIKI B/(LIST (PAIR SPEC HOON))}
                            (~(WTHP AH A) B)
                  (BUTT ;~(GUNK TEAK RUCK))
    ++  TKKT  |.  %+  COOK  |=  {A/TIKI B/HOON C/HOON}
                            (~(WTKT AH A) B C)
                  ;~(GUNK TEAK LOAF LOAF)
    ++  TXLS  |.  %+  COOK  |=  {A/TIKI B/HOON C/(LIST (PAIR SPEC HOON))}
                            (~(WTLS AH A) B C)
                  (BUTT ;~(GUNK TEAK LOAF RUCK))
    ++  TKVT  |.  %+  COOK  |=  {A/TIKI B/HOON C/HOON}
                            (~(WTVT AH A) B C)
                  ;~(GUNK TEAK LOAF LOAF)
    ++  TKSG  |.  %+  COOK  |=  {A/TIKI B/HOON C/HOON}
                            (~(WTSG AH A) B C)
                  ;~(GUNK TEAK LOAF LOAF)
    ++  TXTS  |.  %+  COOK  |=  {A/SPEC B/TIKI}
                            (~(WTTS AH B) A)
                  ;~(GUNK LOAN TEAK)
    ++  TXHX  |.  %+  COOK  |=  {A/SKIN B/TIKI}
                            (~(WTHX AH B) A)
                  ;~(GUNK LORE TEAK)
    ::
    ::    HINT SYNTAX
    ::
    ++  HINB  |.(;~(GUNK BONT LOAF))                    ::  HINT AND HOON
    ++  HINC  |.                                        ::  OPTIONAL =EN, HOON
              ;~(POSE ;~(GUNK BONY LOAF) (STAG ~ LOAF)) ::
    ++  HIND  |.(;~(GUNK BONK LOAF BONZ LOAF))          ::  JET HOON "BON"S HOON
    ++  HINE  |.(;~(GUNK BONK LOAF))                    ::  JET-HINT AND HOON
    ++  HINF  |.                                        ::  0-3 >S, TWO HOONS
      ;~  POSE
        ;~(GUNK (COOK LENT (STUN [1 3] BAN)) LOAF LOAF)
        (STAG 0 ;~(GUNK LOAF LOAF))
      ==
    ++  HING  |.                                        ::  0-3 >S, THREE HOONS
      ;~  POSE
        ;~(GUNK (COOK LENT (STUN [1 3] BAN)) LOAF LOAF LOAF)
        (STAG 0 ;~(GUNK LOAF LOAF LOAF))
      ==
    ++  BONK                                            ::  JET SIGNATURE
      ;~  PFIX  CEN
        ;~  POSE
          ;~(PLUG SYM ;~(PFIX COL ;~(PLUG SYM ;~(PFIX DOT ;~(PFIX DOT DEM)))))
          ;~(PLUG SYM ;~(PFIX COL ;~(PLUG SYM ;~(PFIX DOT DEM))))
          ;~(PLUG SYM ;~(PFIX DOT DEM))
          SYM
        ==
      ==
    ++  HINH  |.                                        ::  1/2 NUMBERS, HOON
        ;~  GUNK
          ;~  POSE
            DEM
            (IFIX [LAC RAC] ;~(PLUG DEM ;~(PFIX ACE DEM)))
          ==
          LOAF
        ==
    ++  BONT  ;~  (BEND)                                ::  TERM, OPTIONAL HOON
                ;~(PFIX CEN SYM)
                ;~(PFIX DOT ;~(POSE WIDE ;~(PFIX MUCK LOAF)))
              ==
    ++  BONY  (COOK |=(A/(LIST) (LENT A)) (PLUS TIS))   ::  BASE 1 =EN COUNT
    ++  BONZ                                            ::  TERM-LABELLED HOONS
      ;~  POSE
        (COLD ~ SIG)
        %+  IFIX
          ?:(TOL [;~(PLUG DUZ GAP) ;~(PLUG GAP DUZ)] [LIT RIT])
        (MORE MASH ;~(GUNK ;~(PFIX CEN SYM) LOAF))
      ==
    --
  ::
  ++  LANG                                              ::  LUNG SAMPLE
    $:  ROS/HOON
        $=  VIL
        $%  {$TIS P/HOON}
            {$COL P/HOON}
            {$KET P/HOON}
            {$LIT P/(LIST (PAIR WING HOON))}
        ==
    ==
  ::
  ++  LUNG
    ~+
    %-  BEND
    |:  $:LANG
    ^-  (UNIT HOON)
    ?-    -.VIL
      $COL  ?:(=([%BASE %FLAG] ROS) ~ [~ %TSLD ROS P.VIL])
      $LIT  (BIND ~(REEK AP ROS) |=(HYP/WING [%CNTS HYP P.VIL]))
      $KET  [~ ROS P.VIL]
      $TIS  =+  RUD=~(FLAY AP ROS)
            ?~(RUD ~ `[%KTTS U.RUD P.VIL])
    ==
  ::
  ++  LONG
    %+  KNEE  *HOON  |.  ~+
    ;~  LUNG
      SCAT
      ;~  POSE
        ;~(PLUG (COLD %TIS TIS) WIDE)
        ;~(PLUG (COLD %COL COL) WIDE)
        ;~(PLUG (COLD %KET KET) WIDE)
        ;~  PLUG
          (EASY %LIT)
          (IFIX [LIT RIT] LOBO)
        ==
      ==
    ==
  ::
  ++  LOBO  (MOST ;~(PLUG COM ACE) ;~(GLAM ROPE WIDE))
  ++  LOON  (MOST ;~(PLUG COM ACE) ;~(GLAM WIDE WIDE))
  ++  LUTE                                              ::  TALL [] NOUN
    ~+
    %+  COOK  |=(HOON +<)
    %+  STAG  %CLTR
    %+  IFIX
      [;~(PLUG LAC GAP) ;~(PLUG GAP RAC)]
    (MOST GAP TALL)
  ::
  ++  ROPA  (MOST COL ROPE)
  ++  ROPE                                              ::  WING FORM
    %+  KNEE  *WING
    |.  ~+
    %+  (SLUG |=({A/LIMB B/WING} [A B]))
      DOT
    ;~  POSE
      (COLD [%| 0 ~] COM)
      %+  COOK
        |=({A/(LIST) B/TERM} ?~(A B [%| (LENT A) `B]))
      ;~(PLUG (STAR KET) ;~(POSE SYM (COLD %$ BUS)))
    ::
      %+  COOK
        |=(A/AXIS [%& A])
      ;~  POSE
        ;~(PFIX LUS DIM:AG)
        ;~(PFIX PAD (COOK |=(A/@ ?:(=(0 A) 0 (MUL 2 +($(A (DEC A)))))) DIM:AG))
        ;~(PFIX BAR (COOK |=(A/@ ?:(=(0 A) 1 +((MUL 2 $(A (DEC A)))))) DIM:AG))
        VEN
        (COLD 1 DOT)
      ==
    ==
  ::
  ++  WISE
    ;~  POSE
      ;~  PFIX  TIS
        %+  SEAR
          |=  =SPEC
          ^-  (UNIT SKIN)
          %+  BIND  ~(AUTONAME AX & SPEC)
          |=  =TERM
          [%NAME TERM %SPEC SPEC %BASE %NOUN]
        WYDE
      ==
      %+  COOK
        |=  [=TERM =(UNIT SPEC)]
        ^-  SKIN
        ?~  UNIT
          TERM
        [%NAME TERM %SPEC U.UNIT %BASE %NOUN]
      ;~  PLUG  SYM
        ::  XX: NET DEPRECATED
        ::
        (PUNT ;~(PFIX ;~(POSE NET TIS) WYDE))
      ==
    ==
  ++  TALL                                              ::  FULL TALL FORM
    %+  KNEE  *HOON
    |.(~+((WART ;~(POSE EXPRESSION:(NORM &) LONG LUTE APEX:(SAIL &)))))
  ++  TILL                                              ::  MOLD TALL FORM
    %+  KNEE  *SPEC
    |.(~+((WERT ;~(POSE STRUCTURE:(NORM &) SCAD))))
  ++  WEDE                                              ::  WIDE BULB
    ::  XX: LUS DEPRECATED
    ::
    ;~(PFIX ;~(POSE LUS NET) WIDE)
  ++  WIDE                                              ::  FULL WIDE FORM
    %+  KNEE  *HOON
    |.(~+((WART ;~(POSE EXPRESSION:(NORM |) LONG APEX:(SAIL |)))))
  ++  WYDE                                              ::  MOLD WIDE FORM
    %+  KNEE  *SPEC
    |.(~+((WERT ;~(POSE STRUCTURE:(NORM |) SCAD))))
  ++  WART
    |*  ZOR/RULE
    %+  HERE
      |=  {A/PINT B/HOON}
      ?:(BUG [%DBUG [WER A] B] B)
    ZOR
  ++  WERT
    |*  ZOR/RULE
    %+  HERE
      |=  {A/PINT B/SPEC}
      ?:(BUG [%DBUG [WER A] B] B)
    ZOR
  --
::
++  VEST
  ~/  %VEST
  |=  TUB/NAIL
  ^-  (LIKE HOON)
  %.  TUB
  %-  FULL
  (IFIX [GAY GAY] TALL:VAST)
::
++  VICE
  |=  TXT/@TA
  ^-  HOON
  (RASH TXT WIDE:VAST)
::
++  MAKE                                                ::  COMPILE CORD TO NOCK
  |=  TXT/@
  Q:(~(MINT UT %NOUN) %NOUN (REAM TXT))
::
++  RAIN                                                ::  PARSE WITH % PATH
  |=  {BON/PATH TXT/@}
  ^-  HOON
  =+  VAZ=VAST
  ~|  BON
  (SCAN (TRIP TXT) (FULL (IFIX [GAY GAY] TALL:VAZ(WER BON))))
::
++  REAM                                                ::  PARSE CORD TO HOON
  |=  TXT/@
  ^-  HOON
  (RASH TXT VEST)
::
++  RECK                                                ::  PARSE HOON FILE
  |=  BON/PATH
  (RAIN BON .^(@T %CX (WELD BON `PATH`[%HOON ~])))
::
++  RIDE                                                ::  END-TO-END COMPILER
  |=  {TYP/TYPE TXT/@}
  ^-  (PAIR TYPE NOCK)
  ~>  %SLOG.[0 LEAF/"RIDE-PARSING"]
  =/  GEN  (REAM TXT)
  ~>  %SLOG.[0 LEAF/"RIDE-COMPILING"]
  =-  ~>  %SLOG.[0 LEAF/"RIDE-COMPILED"]
      -
  (~(MINT UT TYP) %NOUN GEN)
::
::::  5E: CACHING COMPILER
  ::
++  WA                                                  ::  CACHED COMPILE
  |_  WORM
  ++  NELL  |=(REF/TYPE (NEST [%CELL %NOUN %NOUN] REF)) ::  NEST IN CELL
  ++  NEST                                              ::  NEST:UT, CACHED
    |=  {SUT/TYPE REF/TYPE}
    ^-  {? WORM}
    ?:  (~(HAS IN NES) [SUT REF])  [& +>+<]
    ?.  (~(NEST UT SUT) | REF)
      ~&  %NEST-FAILED
      =+  FOO=(SKOL REF)
      =+  BAR=(SKOL SUT)
      ~&  %NETS-NEED
      ~>  %SLOG.[0 BAR]
      ~&  %NEST-HAVE
      ~>  %SLOG.[0 FOO]
      [| +>+<.$]
    [& +>+<(NES (~(PUT IN NES) [SUT REF]))]
  ::
  ++  CALL                                              ::  CALL GATE
    |=  {VAX/VASE NAM/TERM SOM/(EACH VASE ^)}
    ^-  {VASE WORM}
    =^  DUF  +>+<.$  (OPEN VAX NAM SOM)
    (SLAP DUF [%LIMB %$])
  ::
  ++  OPEN                                              ::  ASSEMBLE DOOR
    |=  {VAX/VASE NAM/TERM SOM/(EACH VASE ^)}
    ^-  {VASE WORM}
    =*  KEY  [%CNCB [[%& 2] ~] [[[%& 6] ~] [%$ 3]] ~]
    =^  DOR  +>+<.$  (SLAP VAX [%LIMB NAM])
    =^  MES  +>+<.$  (SLOT 6 DOR)
    =^  HIP  +>+<.$
      ?-  -.SOM
         %&  (NEST P.MES P.P.SOM)
         %|  (NETS P.MES -.P.SOM)
      ==
    ?>  HIP
    [[P.DOR Q.DOR(+6 +7.SOM)] +>+<.$]
  ::
  ++  NEAT                                              ::  TYPE COMPLIANCE
    |=  {TYP/TYPE SOM/(EACH VASE ^)}
    ^-  WORM
    =^  HIP  +>+<.$
      ?-  -.SOM
        %&  (NEST TYP P.P.SOM)
        %|  (NETS TYP -.P.SOM)
      ==
    ?>  HIP
    +>+<.$
  ::
  ++  NETS                                              ::  TYPELESS NEST
    |=  {SUT/* REF/*}
    ^-  {? WORM}
    ?:  (~(HAS IN NES) [SUT REF])  [& +>+<]
    =+  GAT=|=({A/TYPE B/TYPE} (~(NEST UT A) | B))
    ?.  (? (SLUM GAT [SUT REF]))
      ~&  %NETS-FAILED
      =+  TAG=`*`SKOL
      =+  FOO=(TANK (SLUM TAG REF))
      =+  BAR=(TANK (SLUM TAG SUT))
      ~&  %NETS-NEED
      ~>  %SLOG.[0 BAR]
      ~&  %NETS-HAVE
      ~>  %SLOG.[0 FOO]
      [| +>+<.$]
    [& +>+<.$(NES (~(PUT IN NES) [SUT REF]))]
  ::
  ++  PLAY                                              ::  PLAY:UT
    |=  {SUT/TYPE GEN/HOON}
    ^-  {TYPE WORM}
    =+  OLD=(~(GET BY PAY) [SUT GEN])
    ?^  OLD  [U.OLD +>+<.$]
    =+  NEW=(~(PLAY UT SUT) GEN)
    [NEW +>+<.$(PAY (~(PUT BY PAY) [SUT GEN] NEW))]
  ::
  ++  MINT                                              ::  MINT:UT TO NOUN
    |=  {SUT/TYPE GEN/HOON}
    ^-  {(PAIR TYPE NOCK) WORM}
    =+  OLD=(~(GET BY MIT) [SUT GEN])
    ?^  OLD  [U.OLD +>+<.$]
    =+  NEW=(~(MINT UT SUT) %NOUN GEN)
    [NEW +>+<.$(MIT (~(PUT BY MIT) [SUT GEN] NEW))]
  ::
  ++  SLAP                                              ::  ++SLAP, CACHED
    |=  {VAX/VASE GEN/HOON}
    ^-  {VASE WORM}
    =^  GUN  +>+<  (MINT P.VAX GEN)
    [[P.GUN .*(Q.VAX Q.GUN)] +>+<.$]
  ::
  ++  SLOT                                              ::  ++SLOT, CACHED
    |=  {AXE/@ VAX/VASE}
    ^-  {VASE WORM}
    =^  GUN  +>+<  (MINT P.VAX [%$ AXE])
    [[P.GUN .*(Q.VAX [0 AXE])] +>+<.$]
  ::
  ++  SLYM                                              ::  ++SLYM, CACHED
    |=  {GAT/VASE SAM/*}
    ^-  [VASE WORM]
    (SLAP GAT(+<.Q SAM) [%LIMB %$])
  ::
  ++  SPED                                              ::  SPECIALIZE VASE
    |=  VAX/VASE
    ^-  {VASE WORM}
    =+  ^=  GEN  ^-  HOON
      ?@  Q.VAX    [%WTTS [%BASE [%ATOM %$]] [%& 1]~]
      ?@  -.Q.VAX  [%WTTS [%LEAF %TAS -.Q.VAX] [%& 2]~]
      [%WTTS [%BASE %CELL] [%& 1]~]
    =^  TYP  +>+<.$  (PLAY P.VAX [%WTBN GEN [%$ 1]])
    [[TYP Q.VAX] +>+<.$]
  ::
  ++  SPOT                                              ::  SLOT THEN SPED
    |=  {AXE/@ VAX/VASE}
    ^-  {VASE WORM}
    =^  XAV  +>+<  (SLOT AXE VAX)
    (SPED XAV)
  ::
  ++  STOP                                              ::  SPED THEN SLOT
    |=  {AXE/@ VAX/VASE}
    ^-  {VASE WORM}
    =^  XAV  +>+<  (SPED VAX)
    (SLOT AXE XAV)
  --
::
::::  5F: MOLDS AND MOLD BUILDERS
  ::
++  MANE  $@(@TAS {@TAS @TAS})                          ::  XML NAME+SPACE
++  MANX  $~([[%$ ~] ~] {G/MARX C/MARL})                ::  DYNAMIC XML NODE
++  MARL  (LIST MANX)                                   ::  XML NODE LIST
++  MARS  {T/{N/$$ A/{I/{N/$$ V/TAPE} T/~}} C/~}        ::  XML CDATA
++  MART  (LIST {N/MANE V/TAPE})                        ::  XML ATTRIBUTES
++  MARX  $~([%$ ~] {N/MANE A/MART})                    ::  DYNAMIC XML TAG
++  MITE  (LIST @TA)                                    ::  MIME TYPE
++  MONK  (EACH SHIP {P/@TAS Q/@TA})                    ::  GENERAL IDENTITY
++  PASS  @                                             ::  PUBLIC KEY
++  RING  @                                             ::  PRIVATE KEY
++  SHIP  @P                                            ::  NETWORK IDENTITY
++  SHOP  (EACH SHIP (LIST @TA))                        ::  URBIT/DNS IDENTITY
++  SPUR  PATH                                          ::  SHIP DESK CASE SPUR
++  TIME  @DA                                           ::  GALACTIC TIME
::
::::  5G: PROFILING SUPPORT (XX MOVE)
  ::
::
++  PI-HECK
    |=  {NAM/@TAS DAY/DOSS}
    ^-  DOSS
    =+  LAM=(~(GET BY HIT.DAY) NAM)
    DAY(HIT (~(PUT BY HIT.DAY) NAM ?~(LAM 1 +(U.LAM))))
::
++  PI-NOON                                             ::  SAMPLE TRACE
  |=  {MOT/TERM PAZ/(LIST PATH) DAY/DOSS}
  =|  LAX/(UNIT PATH)
  |-  ^-  DOSS
  ?~  PAZ  DAY(MON (PI-MOPE MOT MON.DAY))
  %=    $
      PAZ  T.PAZ
      LAX  `I.PAZ
      CUT.DAY
    %+  ~(PUT BY CUT.DAY)  I.PAZ
    ^-  HUMP
    =+  NAX=`(UNIT PATH)`?~(T.PAZ ~ `I.T.PAZ)
    =+  HUP=`HUMP`=+(HUP=(~(GET BY CUT.DAY) I.PAZ) ?^(HUP U.HUP [*MOAN ~ ~]))
    :+  (PI-MOPE MOT MON.HUP)
      ?~  LAX  OUT.HUP
      =+  HAG=(~(GET BY OUT.HUP) U.LAX)
      (~(PUT BY OUT.HUP) U.LAX ?~(HAG 1 +(U.HAG)))
    ?~  NAX  INN.HUP
    =+  HAG=(~(GET BY INN.HUP) U.NAX)
    (~(PUT BY INN.HUP) U.NAX ?~(HAG 1 +(U.HAG)))
  ==
++  PI-MOPE                                             ::  ADD SAMPLE
  |=  {MOT/TERM MON/MOAN}
  ?+  MOT  MON
    $FUN  MON(FUN +(FUN.MON))
    $NOC  MON(NOC +(NOC.MON))
    $GLU  MON(GLU +(GLU.MON))
    $MAL  MON(MAL +(MAL.MON))
    $FAR  MON(FAR +(FAR.MON))
    $COY  MON(COY +(COY.MON))
    $EUQ  MON(EUQ +(EUQ.MON))
  ==
++  PI-MOTH                                             ::  COUNT SAMPLE
  |=  MON/MOAN  ^-  @UD
  :(ADD FUN.MON NOC.MON GLU.MON MAL.MON FAR.MON COY.MON EUQ.MON)
::
++  PI-MUMM                                             ::  PRINT SAMPLE
  |=  MON/MOAN  ^-  TAPE
  =+  TOT=(PI-MOTH MON)
  ;:  WELP
    ^-  TAPE
    ?:  =(0 NOC.MON)  ~
    (WELP (SCOW %UD (DIV (MUL 100 NOC.MON) TOT)) "N ")
  ::
    ^-  TAPE
    ?:  =(0 FUN.MON)  ~
    (WELP (SCOW %UD (DIV (MUL 100 FUN.MON) TOT)) "C ")
  ::
    ^-  TAPE
    ?:  =(0 GLU.MON)  ~
    (WELP (SCOW %UD (DIV (MUL 100 GLU.MON) TOT)) "G ")
  ::
    ^-  TAPE
    ?:  =(0 MAL.MON)  ~
    (WELP (SCOW %UD (DIV (MUL 100 MAL.MON) TOT)) "M ")
  ::
    ^-  TAPE
    ?:  =(0 FAR.MON)  ~
    (WELP (SCOW %UD (DIV (MUL 100 FAR.MON) TOT)) "F ")
  ::
    ^-  TAPE
    ?:  =(0 COY.MON)  ~
    (WELP (SCOW %UD (DIV (MUL 100 COY.MON) TOT)) "Y ")
  ::
    ^-  TAPE
    ?:  =(0 EUQ.MON)  ~
    (WELP (SCOW %UD (DIV (MUL 100 EUQ.MON) TOT)) "E ")
  ==
::
++  PI-TELL                                             ::  PRODUCE DUMP
  |=  DAY/DOSS
  ^-  (LIST TAPE)
  ?:  =(DAY *DOSS)  ~
  =+  TOT=(PI-MOTH MON.DAY)
  ;:  WELP
    [(WELP "EVENTS: " (PI-MUMM MON.DAY)) ~]
  ::
    %+  TURN
      %+  SORT  ~(TAP BY HIT.DAY)
      |=  {A/{* @} B/{* @}}
      (LTH +.A +.B)
    |=  {NAM/TERM NUM/@UD}
    :(WELP (TRIP NAM) ": " (SCOW %UD NUM))
    ["" ~]
  ::
    %-  ZING
    ^-  (LIST (LIST TAPE))
    %+  TURN
      %+  SORT  ~(TAP BY CUT.DAY)
      |=  {ONE/(PAIR PATH HUMP) TWO/(PAIR PATH HUMP)}
      (GTH (PI-MOTH MON.Q.ONE) (PI-MOTH MON.Q.TWO))
    |=  {PAX/PATH HUP/HUMP}
    =+  OTT=(PI-MOTH MON.HUP)
    ;:  WELP
      [(WELP "LABEL: " (SPUD PAX)) ~]
      [(WELP "PRICE: " (SCOW %UD (DIV (MUL 100 OTT) TOT))) ~]
      [(WELP "SHAPE: " (PI-MUMM MON.HUP)) ~]
    ::
      ?:  =(~ OUT.HUP)  ~
      :-  "INTO:"
      %+  TURN
        %+  SORT  ~(TAP BY OUT.HUP)
        |=({{* A/@UD} {* B/@UD}} (GTH A B))
      |=  {PAX/PATH NUM/@UD}
      ^-  TAPE
      :(WELP "  " (SPUD PAX) ": " (SCOW %UD NUM))
    ::
      ?:  =(~ INN.HUP)  ~
      :-  "FROM:"
      %+  TURN
        %+  SORT  ~(TAP BY INN.HUP)
        |=({{* A/@UD} {* B/@UD}} (GTH A B))
      |=  {PAX/PATH NUM/@UD}
      ^-  TAPE
      :(WELP "  " (SPUD PAX) ": " (SCOW %UD NUM))
    ::
      ["" ~]
      ~
    ==
  ==
--
