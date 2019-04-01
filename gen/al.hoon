!:
:-  %SAY
|=  *
:-  %NOUN
=-  %HELLO
=>  |%
    ++  TOPE                                            ::  TOPOGRAPHIC TYPE
      $@  $?  %&                                        ::  CELL OR ATOM
              %|                                        ::  ATOM
          ==                                            ::
      (PAIR TOPE TOPE)                                  ::  CELL
    --
|%
++  AX
  =+  :*  DOM=`AXIS`1
          DOC=*(LIST WHAT)
      ==
  |_  MOD/TILE
  ++  HOME
    ::  EXPRESS A HOON AGAINST THE ORIGINAL SUBJECT
    ::
    |=(GEN/HOON ^-(HOON ?:(=(1 DOM) GEN [%TSGR [%$ DOM] GEN])))
  ::
  ++  DEFAULT
    ::  PRODUCE A HOON THAT MAKES THE MODEL'S DEFAULT VALUE, UNTYPED
    ::
    |-  ^-  HOON
    ?-    MOD
        {^ *}
      [$(MOD -.MOD) $(MOD +.MOD)]
    ::
        {$AXIL *}
      ?+  P.MOD  [%ROCK %$ 0]
        $CELL  [[%ROCK %$ 0] [%ROCK %$ 0]]
        $VOID  [%ZPZP ~]
      ==
    ::
        {$BARK *}
      $(MOD Q.MOD)
    ::
        {$HERB *}
      =+  CYS=~(BOIL AP P.MOD)
      ?:  ?=($HERB -.CYS)
        (HOME [%TSGL [%LIMB %$] P.MOD])
      $(MOD CYS)
    ::
        {$DEET *}
      $(MOD Q.MOD)
    ::
        {$FERN *}
      ::  LAST ENTRY IS THE DEFAULT VALUE
      ::
      |-  ^-  HOON
      ?~(T.P.MOD ^$(MOD I.P.MOD) $(I.P.MOD I.T.P.MOD, T.P.MOD T.T.P.MOD))
    ::
        {$KELP *}
      ::  LAST ENTRY IS THE DEFAULT VALUE
      ::
      |-  ^-  HOON
      ?~(T.P.MOD ^$(MOD I.P.MOD) $(I.P.MOD I.T.P.MOD, T.P.MOD T.T.P.MOD))
    ::
        {$LEAF *}
      [%ROCK P.MOD Q.MOD]
    ::
        {$PLOW *}
      $(MOD Q.MOD)
    ::
        {$REED *}
      $(MOD P.MOD)
    ::
        {$VINE *}
      $(MOD Q.MOD)
    ::
        {$WEED *}
      (HOME P.MOD)
    ==
  ::
  ++  TRIVIAL
    ::  ERSATZ BY TRIVIAL CONSTRUCTION
    ::
    ^-  HOON
    :+  %TSLS
      [%BUST %NOUN]
    ~(CONSTRUCT SAMPLE [2 %|])
  ::
  ++  BASIC
    |=  BAS/BASE
    ?-    BAS
    ::
        {$ATOM *}
      ::  TRIVIAL ZERO
      ::
      [%SAND P.BAS 0]
    ::
        $NOUN
      ::  RAW NOCK PRODUCES NOUN TYPE
      ::
      =+([%ROCK %$ 0] [%KTLS [%DTTR - - [%ROCK %$ 1]] -])
    ::
        $CELL
      ::  REDUCE TO PAIR OF NOUNS
      ::
      =+($(MOD [%AXIL %NOUN]) [- -])
    ::
        $BEAN
      ::  COMPARISON PRODUCES BOOLEAN TYPE
      ::
      =+([%ROCK %$ 0] [%KTLS [%DTTS - -] -])
    ::
        $NULL
      [%ROCK %N 0]
    ::
        $VOID
      ::  SHOULD NOT ACTUALLY BE A THING
      ::
      [%ZPZP ~]
    ==
  ::
  ++  DECORATE
    ::  DOCUMENT
    ::
    |=  GEN/HOON
    ^-  HOON
    ?~  DOC  GEN
    =/  FIN  $(DOC T.DOC)
    ?~(I.DOC GEN [%DOCS U.I.DOC GEN])
  ::
  ++  ERSATZ
    ::  PRODUCE A CORRECTLY TYPED INSTANCE WITHOUT SUBJECT
    ::
    ^-  HOON
    ?-    MOD
        {^ *}
      %-  DECORATE
      =.  DOC  ~
      [ERSATZ(MOD -.MOD) ERSATZ(MOD +.MOD)]
    ::
        {$AXIL *}
      (DECORATE (BASIC P.MOD))
    ::
        {$BARK *}
      [%KTTS P.MOD ERSATZ(MOD Q.MOD)]
    ::
        {$HERB *}
      %-  DECORATE
      =.  DOC  ~
      =+  CYS=~(BOIL AP P.MOD)
      ?:  ?=($HERB -.CYS)
        (HOME [%TSGL [%LIMB %$] P.MOD])
      ERSATZ(MOD CYS)
    ::
        {$DEET *}
      [%DBUG P.MOD ERSATZ(MOD Q.MOD)]
    ::
        {$FERN *}
      TRIVIAL
    ::
        {$KELP *}
      TRIVIAL
    ::
        {$LEAF *}
      (DECORATE [%ROCK P.MOD Q.MOD])
    ::
        {$PLOW *}
      ERSATZ(MOD Q.MOD, DOC [P.MOD DOC])
    ::  ATOM/CELL, $@
    ::
        {$REED *}
      TRIVIAL
    ::  PAIR/SWITCH, $^
    ::
        {$VINE *}
      TRIVIAL
    ::
        {$WEED *}
      (HOME P.MOD)
    ==
  ::
  ++  FACTORY
    ::  PRODUCE A NORMALIZING GATE (MOLD)
    ::
    ^-  HOON
    :^  %BRTS  ~^~
      [%BASE %NOUN]
    ~(CONSTRUCT SAMPLE [6 %&])
  ::
  ++  SAMPLE
    ::  NORMALIZE A SAMPLE OF THE SUBJECT
    ::
    |_  $:  ::  AXE: AXIS TO SAMPLE
            ::  TOP: TOPOGRAPHIC TYPE OF SAMPLE
            ::
            AXE/AXIS
            TOP/TOPE
        ==
    ++  BASIC
      |=  BAS/BASE
      ::  APPLY DOCUMENTATION
      ::
      ?^  DOC  DOCUMENT
      ?-    BAS
          {%ATOM *}
        ::  REZ: FAKE INSTANCE
        ::
        =/  REZ  ERSATZ
        ?^  TOP  REZ
        ?:  =(%| TOP)
          ::  XX SANITIZE
          ::
          FETCH
        [%WTPT FETCH-WING FETCH REZ]
      ::
          $NOUN
        FETCH
      ::
          $CELL
        ?^  TOP  FETCH
        ::  REZ: FAKE INSTANCE
        ::
        =/  REZ  ERSATZ
        ?:  =(%| TOP)
          REZ
        [%WTPT FETCH-WING REZ FETCH]
      ::
          $BEAN
        ?^  TOP  ERSATZ
        :^    %WTCL
            [%DTTS [%ROCK %$ |] [%$ AXE]]
          [%ROCK %F |]
        [%ROCK %F &]
      ::
          $NULL
        ERSATZ
      ::
          $VOID
        ERSATZ
      ==
    ++  FETCH
      ::  LOAD THE SAMPLE
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
              ONE/TILE
              REP/(LIST TILE)
          ==
      ^-  HOON
      ::  IF NO OTHER CHOICES, CONSTRUCT HEAD
      ::
      ?~  REP  CONSTRUCT(MOD ONE)
      ::  FIN: LOOP COMPLETION
      ::
      =/  FIN/HOON  $(ONE I.REP, REP T.REP)
      ::  NEW: TRIAL PRODUCT
      ::  OLD: ORIGINAL SUBJECT
      ::
      =/  NEW  [%$ 2]
      =*  OLD  [%$ 3]
      ::  BUILD TRIAL NOUN
      ::
      :+  %TSLS
        ::  BUILD THE SAMPLE WITH THE FIRST OPTION
        ::
        CONSTRUCT(MOD ONE)
      ::  BUILD TEST
      ::
      :^    %WTCL
          ::  IF THE TRIAL NOUN EQUALS THE SAMPLE
          ::
          [%DTTS NEW FETCH]
        ::  PRODUCE THE TRIAL NOUN
        ::
        NEW
      ::  CONTINUE WITH THE ORIGINAL SUBJECT
      ::
      [%TSGR OLD FIN]
    ::
    ++  SWITCH
      |=  $:  ::  ONE: FIRST FORMAT
              ::  TWO: MORE FORMATS
              ::
              ONE/LINE
              REP/(LIST LINE)
          ==
      ^-  HOON
      ::  IF NO OTHER CHOICES, CONSTRUCT HEAD
      ::
      ?~  REP  CONSTRUCT(MOD `TILE`ONE)
      ::  FIN: LOOP COMPLETION
      ::
      =/  FIN/HOON  $(ONE I.REP, REP T.REP)
      ::  INTERROGATE THIS INSTANCE
      ::
      :^    %WTCL
          ::  TEST IF WE MATCH THIS WING
          ::
          [%WTTS P.I.REP FETCH-WING]
        ::  USE THIS FORMAT
        ::
        :-  `HOON`P.I.REP
        CONSTRUCT(MOD Q.I.REP, TOP &, AXE (PEG AXE 3))
      ::  CONTINUE IN THE LOOP
      ::
      FIN
    ::
    ++  PROBE
      ::  PROBE FOR CELL OR DEFAULT
      ::
      ^-  HOON
      ::  AGAINST CONSTRUCTOR
      ::
      :+  %TSGR
        ::  CONSTRUCTOR TRAP
        ::
        :+  %BRDT  ~^~
        ::  CONSTRUCT WITHIN TRAP
        ::
        %=  CONSTRUCT
        ::  OLD CONTEXT WITHIN TRAP CONTEXT
        ::
          DOM  (PEG 3 DOM)
        ::  OLD SAMPLE WITHIN TRAP SAMPLE
        ::
          AXE  (PEG 3 AXE)
        ::  ONLY KICK TRAP IF SAMPLE IS KNOWN CELL
        ::
          TOP  [& &]
        ==
      ::  BOC: CALL CONSTRUCTOR
      ::  BUT: DEFAULT, BUT COERCE TYPE TO CALL
      ::
      =/  BOC/HOON  [%LIMB %$]
      =/  BUT/HOON  [%KTLS BOC DEFAULT]
      ?:  =(& TOP)
        ::  MAY BE ATOM OR CELL; DEFAULT OR CONSTRUCT
        ::
        [%WTPT FETCH-WING BUT BOC]
      ::  MUST BE ATOM; CONSTRUCT
      ::
      BUT
    ::
    ++  DOCUMENT
      ::  DOCUMENT AND CONSTRUCT
      ::
      |-  ^-  HOON
      ?~  DOC  CONSTRUCT
      =/  FIN  $(DOC T.DOC)
      ?~(I.DOC FIN [%DOCS U.I.DOC FIN])
    ::
    ++  CONSTRUCT
      ::  CONSTRUCTOR AT ARBITRARY SAMPLE
      ::
      ^-  HOON
      ?-    MOD
      ::
      ::  CELL
      ::
          {^ *}
        ::  APPLY HELP
        ::
        ?^  DOC  DOCUMENT
        ::  PROBE UNLESS WE KNOW THE SAMPLE IS A CELL
        ::
        ?@  TOP  PROBE
        ::  IF KNOWN CELL, DESCEND DIRECTLY
        ::
        :-  CONSTRUCT(MOD -.MOD, TOP P.TOP, AXE (PEG AXE 2))
        CONSTRUCT(MOD +.MOD, TOP Q.TOP, AXE (PEG AXE 3))
      ::
      ::  BASE
      ::
          {$AXIL *}
        (BASIC P.MOD)
      ::
      ::  NAME, $=
      ::
          {$BARK *}
        [%KTTS P.MOD CONSTRUCT(MOD Q.MOD)]
      ::
      ::  DEBUG
      ::
          {$DEET *}
        [%DBUG P.MOD CONSTRUCT(MOD Q.MOD)]
      ::
      ::  CHOICE, $?
      ::
          {$FERN *}
        (CHOICE I.P.MOD T.P.MOD)
      ::
      ::  SYNTHESIS, $;
      ::
          {$HERB *}
        ?^  DOC  DOCUMENT
        =+  CYS=~(BOIL AP P.MOD)
        ?:  ?=($HERB -.CYS)
          [%CNHP (HOME P.MOD) FETCH ~]
        CONSTRUCT(MOD CYS)
      ::
      ::  SWITCH, $%
      ::
          {$KELP *}
        ::  IF ATOM OR UNKNOWN, PROBE
        ::
        ?@  TOP  PROBE
        ::  IF CELL, ENTER SWITCH DIRECTLY
        ::
        (SWITCH I.P.MOD T.P.MOD)
      ::
      ::  CONSTANT
      ::
          {$LEAF *}
        (DECORATE [%ROCK P.MOD Q.MOD])
      ::
      ::  DOCUMENTATION
      ::
          {$PLOW *}
        CONSTRUCT(DOC [P.MOD DOC], MOD Q.MOD)
      ::
      ::  BRANCH, $@
      ::
          {$REED *}
        ?^  DOC  DOCUMENT
        ?@  TOP
          ?:  =(%| TOP)
            CONSTRUCT(MOD P.MOD)
          [%WTPT FETCH-WING CONSTRUCT(MOD P.MOD) CONSTRUCT(MOD Q.MOD)]
        CONSTRUCT(MOD Q.MOD)
      ::
      ::  BRIDGE, $^
      ::
          {$VINE *}
        ?^  DOC  DOCUMENT
        ?@  TOP  PROBE
        :^    %WTPT
            FETCH-WING(AXE (PEG AXE 2))
          CONSTRUCT(MOD Q.MOD)
        CONSTRUCT(MOD P.MOD)
      ::
      ::  WEED, $_
      ::
          {$WEED *}
        (DECORATE (HOME P.MOD))
      ==
    --
  --
--
