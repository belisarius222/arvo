::
::::  /HOON/METAL/GEN
  ::
/?    310
::
::::
  !:
:-  %SAY
|=  $:  {NOW/@DA * BEC/BEAK}
        {{WHO/@P ~} TRY/_| ~}
    ==
::
::  WE'RE CREATING AN EVENT SERIES E WHOSE LIFECYCLE CAN BE COMPUTED
::  WITH THE URBIT LIFECYCLE FORMULA L, `[2 [0 3] [0 2]]`.  THAT IS:
::  IF E IS THE LIST OF EVENTS PROCESSED BY A COMPUTER IN ITS LIFE,
::  ITS FINAL STATE IS S, WHERE S IS NOCK(E L).
::
::  IN PRACTICE, THE FIRST FIVE NOUNS IN E ARE: TWO BOOT FORMULAS,
::  A HOON COMPILER AS A NOCK FORMULA, THE SAME COMPILER AS SOURCE,
::  AND THE ARVO KERNEL AS SOURCE.
::
::  AFTER THE FIRST FIVE SPECIAL EVENTS, WE ENTER AN ITERATIVE
::  SEQUENCE OF REGULAR EVENTS WHICH CONTINUES FOR THE REST OF THE
::  COMPUTER'S LIFE.  DURING THIS SEQUENCE, EACH STATE IS A FUNCTION
::  THAT, PASSED THE NEXT EVENT, PRODUCES THE NEXT STATE.
::
::  EACH EVENT IS A `[DATE WIRE TYPE DATA]` TUPLE, WHERE `DATE` IS A
::  128-BIT URBIT DATE; `WIRE` IS AN OPAQUE PATH WHICH OUTPUT CAN
::  MATCH TO TRACK CAUSALITY; `TYPE` IS A SYMBOL DESCRIBING THE TYPE
::  OF INPUT; AND `DATA` IS INPUT DATA SPECIFIC TO `TYPE`.
::
::  IN REAL LIFE WE DON'T ACTUALLY RUN THE LIFECYCLE LOOP,
::  SINCE REAL LIFE IS UPDATED INCREMENTALLY AND ALSO CARES
::  ABOUT THINGS LIKE OUTPUT.  WE COUPLE TO THE INTERNAL
::  STRUCTURE OF THE STATE MACHINE AND WORK DIRECTLY WITH
::  THE UNDERLYING ARVO ENGINE.
::
::  THIS ARVO CORE, WHICH IS AT `+7` (LISP `CDDR`) OF THE STATE
::  FUNCTION (SEE ITS PUBLIC INTERFACE IN `SYS/ARVO`), GIVES US
::  EXTRA FEATURES, LIKE OUTPUT, WHICH ARE RELEVANT TO RUNNING
::  A REAL-LIFE URBIT VM, BUT DON'T AFFECT THE FORMAL DEFINITION.
::
::  SO A REAL-LIFE URBIT INTERPRETER IS COUPLED TO THE SHAPE OF
::  THE ARVO CORE.  IT BECOMES VERY HARD TO CHANGE THIS SHAPE.
::  FORTUNATELY, IT IS NOT A VERY COMPLEX INTERFACE.
::
:-  %NOUN
::
::  BOOT-ONE: LIFECYCLE FORMULA
::
=+  ^=  BOOT-ONE
    ::
    ::  EVENT 1 IS THE LIFECYCLE FORMULA WHICH COMPUTES THE FINAL
    ::  STATE FROM THE FULL EVENT SEQUENCE.
    ::
    ::  THE FORMAL URBIT STATE IS ALWAYS JUST A GATE (FUNCTION)
    ::  WHICH, PASSED THE NEXT EVENT, PRODUCES THE NEXT STATE.
    ::
    =>  [BOOT-FORMULA=* FULL-SEQUENCE=*]
    !=  ::
        ::  FIRST WE USE THE BOOT FORMULA (EVENT 1) TO SET UP
        ::  THE PAIR OF STATE FUNCTION AND MAIN SEQUENCE.  THE BOOT
        ::  FORMULA PEELS OFF THE FIRST N (CURRENTLY 3) EVENTS
        ::  TO SET UP THE LIFECYCLE LOOP.
        ::
        =+  [STATE-GATE MAIN-SEQUENCE]=.*(FULL-SEQUENCE BOOT-FORMULA)
        ::
        ::  IN THIS LIFECYCLE LOOP, WE REPLACE THE STATE FUNCTION
        ::  WITH ITS PRODUCT, CALLED ON THE NEXT EVENT, UNTIL
        ::  WE RUN OUT OF EVENTS.
        ::
        |-  ?@  MAIN-SEQUENCE
              STATE-GATE
            %=  $
              MAIN-SEQUENCE  +.MAIN-SEQUENCE
              STATE-GATE  .*(STATE-GATE [%9 2 %10 [6 %1 -.MAIN-SEQUENCE] %0 1])
            ==
::
::  BOOT-TWO: STARTUP FORMULA
::
=+  ^=  BOOT-TWO
    ::
    ::  EVENT 2 IS THE STARTUP FORMULA, WHICH VERIFIES THE COMPILER
    ::  AND STARTS THE MAIN LIFECYCLE.
    ::
    =>  :*  ::  EVENT 3: A FORMULA PRODUCING THE HOON COMPILER
            ::
            COMPILER-FORMULA=**
            ::
            ::  EVENT 4: HOON COMPILER SOURCE, COMPILING TO EVENT 2
            ::
            COMPILER-SOURCE=*@T
            ::
            ::  EVENT 5: ARVO KERNEL SOURCE
            ::
            ARVO-SOURCE=*@T
            ::
            ::  EVENTS 6..N: MAIN SEQUENCE WITH NORMAL SEMANTICS
            ::
            MAIN-SEQUENCE=**
        ==
    !=  :_  MAIN-SEQUENCE
        ::
        ::  ACTIVATE THE COMPILER GATE.  THE PRODUCT OF THIS FORMULA
        ::  IS SMALLER THAN THE FORMULA.  SO YOU MIGHT THINK WE SHOULD
        ::  SAVE THE GATE ITSELF RATHER THAN THE FORMULA PRODUCING IT.
        ::  BUT WE HAVE TO RUN THE FORMULA AT RUNTIME, TO REGISTER JETS.
        ::
        ::  AS ALWAYS, WE HAVE TO USE RAW NOCK AS WE HAVE NO TYPE.
        ::  THE GATE IS IN FACT ++RIDE.
        ::
        ~>  %SLOG.[0 LEAF+"1-B"]
        =+  ^=  COMPILER-GATE
            .*(0 COMPILER-FORMULA)
        ::
        ::  COMPILE THE COMPILER SOURCE, PRODUCING (PAIR SPAN NOCK).
        ::  THE COMPILER IGNORES ITS INPUT SO WE USE A TRIVIAL SPAN.
        ::
        ~>  %SLOG.[0 LEAF+"1-C"]
        =+  ^=  COMPILER-TOOL
            .*(COMPILER-GATE [%9 2 %10 [6 %1 [%NOUN COMPILER-SOURCE]] %0 1])
        ::
        ::  SWITCH TO THE SECOND-GENERATION COMPILER.  WE WANT TO BE
        ::  ABLE TO GENERATE MATCHING REFLECTION NOUNS EVEN IF THE
        ::  LANGUAGE CHANGES -- THE FIRST-GENERATION FORMULA WILL
        ::  GENERATE LAST-GENERATION SPANS FOR `!>`, ETC.
        ::
        ~>  %SLOG.[0 LEAF+"1-D"]
        =.  COMPILER-GATE  .*(0 +:COMPILER-TOOL)
        ::
        ::  GET THE SPAN (TYPE) OF THE KERNEL CORE, WHICH IS THE CONTEXT
        ::  OF THE COMPILER GATE.  WE JUST COMPILED THE COMPILER,
        ::  SO WE KNOW THE SPAN (TYPE) OF THE COMPILER GATE.  ITS
        ::  CONTEXT IS AT TREE ADDRESS `+>` (IE, `+7` OR LISP `CDDR`).
        ::  WE USE THE COMPILER AGAIN TO INFER THIS TRIVIAL PROGRAM.
        ::
        ~>  %SLOG.[0 LEAF+"1-E"]
        =+  ^=  KERNEL-SPAN
            -:.*(COMPILER-GATE [%9 2 %10 [6 %1 [-.COMPILER-TOOL '+>']] %0 1])
        ::
        ::  COMPILE THE ARVO SOURCE AGAINST THE KERNEL CORE.
        ::
        ~>  %SLOG.[0 LEAF+"1-F"]
        =+  ^=  KERNEL-TOOL
            .*(COMPILER-GATE [%9 2 %10 [6 %1 [KERNEL-SPAN ARVO-SOURCE]] %0 1])
        ::
        ::  CREATE THE ARVO KERNEL, WHOSE SUBJECT IS THE KERNEL CORE.
        ::
        ~>  %SLOG.[0 LEAF+"1-G"]
        .*(+>:COMPILER-GATE +:KERNEL-TOOL)
::
::  SYS: ROOT PATH TO BOOT SYSTEM, `/~ME/[DESK]/NOW/SYS`
::
=+  SYS=`PATH`/(SCOT %P P.BEC)/[Q.BEC]/(SCOT %DA NOW)/SYS
::
::  COMPILER-SOURCE: HOON SOURCE FILE PRODUCING COMPILER, `SYS/HOON`
::
=+  COMPILER-SOURCE=.^(@T %CX (WELP SYS /HOON/HOON))
::
::  COMPILER-TWIG: COMPILER AS HOON EXPRESSION
::
~&  %METAL-PARSING
=+  COMPILER-TWIG=(REAM COMPILER-SOURCE)
~&  %METAL-PARSED
::
::  COMPILER-FORMULA: COMPILER AS NOCK FORMULA
::
~&  %METAL-COMPILING
=+  COMPILER-FORMULA=Q:(~(MINT UT %NOUN) %NOUN COMPILER-TWIG)
~&  %METAL-COMPILED
::
::  ARVO-SOURCE: HOON SOURCE FILE PRODUCING ARVO KERNEL, `SYS/ARVO`
::
=+  ARVO-SOURCE=.^(@T %CX (WELP SYS /ARVO/HOON))
::
::  MAIN-MOVES: INSTALLATION ACTIONS
::
=+  ^=  MAIN-MOVES
    |^  ^-  (LIST OVUM)
        :~  ::
            ::  CONFIGURE IDENTITY
            ::
            [[%NAME (SCOT %P WHO) ~] [%VEAL WHO]]
            ::
            ::  SYS/ZUSE: STANDARD LIBRARY
            ::
            (VENT %$ /ZUSE)
            ::
            ::  SYS/VANE/AMES: NETWORK
            ::
            (VENT %A /VANE/AMES)
            ::
            ::  SYS/VANE/BEHN: TIMER
            ::
            (VENT %B /VANE/BEHN)
            ::
            ::  SYS/VANE/CLAY: REVISION CONTROL
            ::
            (VENT %C /VANE/CLAY)
            ::
            ::  SYS/VANE/DILL: CONSOLE
            ::
            (VENT %D /VANE/DILL)
            ::
            ::  SYS/VANE/EYRE: WEB
            ::
            (VENT %E /VANE/EYRE)
            ::
            ::  SYS/VANE/FORD: BUILD
            ::
            (VENT %F /VANE/FORD)
            ::
            ::  SYS/VANE/GALL: APPLICATIONS
            ::
            (VENT %G /VANE/GALL)
            ::
            ::  SYS/VANE/JAEL: SECURITY
            ::
            (VENT %J /VANE/JAEL)
            ::
            ::  LEGACY BOOT EVENT
            ::
            [[%$ %TERM '1' ~] [%BOOT %SITH WHO `@UW`WHO &]]
            ::
            ::  USERSPACE:
            ::
            ::    /APP    %GALL APPLICATIONS
            ::    /GEN    :DOJO GENERATORS
            ::    /LIB    %FORD LIBRARIES
            ::    /MAR    %FORD MARKS
            ::    /SUR    %FORD STRUCTURES
            ::    /REN    %FORD RENDERERS
            ::    /WEB    %EYRE WEB CONTENT
            ::    /SYS    SYSTEM FILES
            ::
            (USER /APP /GEN /LIB /MAR /REN /SEC /SUR /SYS /WEB ~)
        ==
    ::                                                  ::
    ++  USER                                            ::  USERSPACE LOADING
      |=  ::  SAL: ALL SPURS TO LOAD FROM
          ::
          SAL/(LIST SPUR)
      ^-  OVUM
      ::
      ::  HAV: ALL USER FILES
      ::
      =;  HAV  ~&  USER-FILES+(LENT HAV)
               [[%$ %SYNC ~] [%INTO %$ & HAV]]
      =|  HAV/MODE:CLAY
      |-  ^+  HAV
      ?~  SAL  ~
      =.  HAV  $(SAL T.SAL)
      ::
      ::  TYL: SPUR
      ::
      =/  TYL  I.SAL
      |-  ^+  HAV
      ::
      ::  PAX: FULL PATH AT `TYL`
      ::  LON: DIRECTORY AT `TYL`
      ::
      =/  PAX  (EN-BEAM:FORMAT BEC TYL)
      =/  LON  .^(ARCH %CY PAX)
      =?  HAV  ?=(^ FIL.LON)
          ?.  ?=({$HOON *} TYL)
            ::
            ::  INSTALL ONLY HOON FILES FOR NOW
            ::
            HAV
          ::
          ::  COT: FILE AS PLAIN-TEXT OCTET-STREAM
          ::
          =;  COT  [[(FLOP `PATH`TYL) `[/TEXT/PLAIN COT]] HAV]
          ^-  OCTS
          ?-    TYL
              {$HOON *}
            =/  DAT  .^(@T %CX PAX)
            [(MET 3 DAT) DAT]
          ==
      =/  ALL  ~(TAP BY DIR.LON)
      |-  ^-  MODE:CLAY
      ?~  ALL  HAV
      $(ALL T.ALL, HAV ^$(TYL [P.I.ALL TYL]))
    ::
    ++  VENT
      |=  {ABR/TERM DEN/PATH}
      =+  PAX=(WELD SYS DEN)
      =+  TXT=.^(@ %CX (WELP PAX /HOON))
      `OVUM`[[%VANE DEN] [%VEER ABR PAX TXT]]
    --
::
::  MAIN-EVENTS: FULL EVENTS WITH ADVANCING TIMES
::
=.  NOW  ~2017.3.1
=+  ^=  MAIN-EVENTS
    |-  ^-  (LIST (PAIR @DA OVUM))
    ?~  MAIN-MOVES  ~
    :-  [NOW I.MAIN-MOVES]
    $(MAIN-MOVES T.MAIN-MOVES, NOW (ADD NOW (BEX 48)))
::
~?  TRY
  ~&  %METAL-TESTING
  =+  ^=  YOP
      ^-  @P
      %-  MUG
      .*  :*  BOOT-ONE
              BOOT-TWO
              COMPILER-FORMULA
              COMPILER-SOURCE
              ARVO-SOURCE
              MAIN-EVENTS
          ==
      [2 [0 3] [0 2]]
  [%METAL-TESTED YOP]
::
:*  BOOT-ONE
    BOOT-TWO
    COMPILER-FORMULA
    COMPILER-SOURCE
    ARVO-SOURCE
    MAIN-EVENTS
==
