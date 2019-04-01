::
::::  /HOON/GLASS/GEN
  ::
/?    310
::
::::
  ::
:-  %SAY
|=  $:  {NOW/@DA ENY/@UVJ BEC/BEAK}
        *
    ==
=<  [%NOUN ~]
=>  |%
    ++  WASP                                            ::  ARVO EFFECT
      $%  {$WACK P/@UVJ}                                ::  ADD ENTROPY
          {$WHAT P/(LIST (PAIR PATH (PAIR TERM NOUN)))} ::  RESET REPTILE
          {$WHOM P/@P}                                  ::  ID AND BOOT
      ==
    --
::
::  DETERMINISTIC TEST
::
=.  ENY  0V0
::
::  BUILD ARVO WITH EXISTING COMPILER
::
|^  ^-  *
    ::
    ::  NEO: ROOT PATH TO BOOT SYSTEM, `/~ME/[DESK]/NOW/NEO`
    ::
    =+  NEO=`PATH`/(SCOT %P P.BEC)/[Q.BEC]/(SCOT %DA NOW)/NEO
    ::
    ::  ARVO-SOURCE: HOON SOURCE FILE PRODUCING ARVO KERNEL, `NEO/ARVO`
    ::
    =+  ARVO-SOURCE=.^(@T %CX (WELP NEO /ARVO/HOON))
    ::
    ::  ARVO-TWIG: PARSED ARVO SOURCE
    ::
    ~&  [%PARSING `@P`(MUG ARVO-SOURCE)]
    =+  ARVO-TWIG=(REAM ARVO-SOURCE)
    ~&  %PARSED
    ::
    ::  ARVO-KERNEL: A LIVING URBIT
    ::
    ~&  [%COMPILING `@P`(MUG ARVO-TWIG)]
    =+  ARVO-KERNEL=+:(SLAP !>(..REAM) ARVO-TWIG)
    ~&  %COMPILED
    ::
    ::  EVENTS: LIST OF EVENTS TO FEED OUR URBIT
    ::
    ~&  %LOADING
    =+  EVENTS=MAIN-EVENTS
    ~&  [%LOADED `@P`(MUG EVENTS)]
    ::
    ::  EXECUTE EVENTS
    ::
    =+  NUMBER=0
    |-  ^-  *
    ?~  EVENTS  ARVO-KERNEL
    ~&  NUMBER+NUMBER
    %=  $
      EVENTS       T.EVENTS
      NUMBER       +(NUMBER)
      ARVO-KERNEL  .*(ARVO-KERNEL(+< I.EVENTS) -.ARVO-KERNEL)
    ==
::
++  MAIN-EVENTS
  =.  NOW  ~2017.3.1
  =+  MOV=MAIN-MOVES
  |-  ^-  (LIST (PAIR @DA OVUM))
  ?~  MOV  ~
  :-  [NOW I.MOV]
  $(MOV T.MOV, NOW (ADD NOW (BEX 48)))
::
++  MAIN-MOVES
  ^-  (LIST OVUM)
  :~  [[%$ ~] [%WHAT BOOT-FILES]]
      ::  [[%$ ~] [%WHOM ~ZOD]]
  ==
++  BOOT-FILES
  ^-  (LIST (PAIR PATH (PAIR TERM NOUN)))
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
  ::    /NEO    NEW SYSTEM FILES
  ::
  (USER-FILES /NEO ~)
::
++  USER-FILES                                      ::  USERSPACE LOADING
  |=  ::  SAL: ALL SPURS TO LOAD FROM
      ::
      SAL/(LIST SPUR)
  ^-  (LIST (PAIR PATH (PAIR TERM NOUN)))
  ::
  ::  HAV: ALL USER FILES
  ::
  =|  HAV/(LIST (PAIR PATH (PAIR TERM NOUN)))
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
      ::
      ::  INSTALL ONLY HOON FILES FOR NOW
      ::
      ?.  ?=({$HOON *} TYL)  HAV
      :_(HAV [(FLOP `PATH`T.TYL) [%HOON .^(@T %CX PAX)]])
  ::
  =/  ALL  ~(TAP BY DIR.LON)
  |-  ^+  HAV
  ?~  ALL  HAV
  $(ALL T.ALL, HAV ^$(TYL [P.I.ALL TYL]))
--
