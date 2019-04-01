::
|%
++  TEST
  $%  [%ARVO ~]       ::UNIMPLEMENTED
      [%MARKS ~]      ::UNIMPLEMENTED
      [%CORES P=PATH]
      [%HOONS P=PATH]
      [%NAMES P=PATH]
      [%RENDERS P=PATH]
  ==
--
::
|%
++  JOIN
  |=  {A/CORD B/(LIST CORD)}
  ?~  B  ''
  (RAP 3 |-([I.B ?~(T.B ~ [A $(B T.B)])]))
::
++  FAKE-FCGI  [%MANY [%BLOB *CRED:EYRE] $+[%N ~] ~]
--
::
=,  GALL
=,  FORD
=,  FORMAT
|_  {BOWL $~}
::
++  PEEK  _~
::
++  REPORT-ERROR
  |=  [=SPUR BUD=BUILD-RESULT]
  ^-  TANG
  =/  SHOULD-FAIL  (~(GET BY FAILING) (FLOP SPUR))
  ?-    -.BUD
      %SUCCESS
    ?~  SHOULD-FAIL  ~
    :~  LEAF+"WARN: EXPECTED FAILURE, {<`TAPE`U.SHOULD-FAIL>}"
        LEAF+"WARN: BUILT SUCCESFULLY"
        ?:  ?=(%BAKE +<.BUD)
          (SELL Q.CAGE.BUD)
        ?>  ?=(%CORE +<.BUD)
        (SELL VASE.BUD)
    ==
  ::
      %ERROR
    ?^  SHOULD-FAIL
      ~[>[%FAILED-KNOWN `TAPE`(WELD "TODO: " U.SHOULD-FAIL)]<]
    (FLOP MESSAGE.BUD)
  ==
::
++  MADE-A-CORE
  |=  [=SPUR @DA RES=MADE-RESULT]
  :_  +>.$
  ?:  ?=([%INCOMPLETE *] RES)
    ~&  INCOMPLETE-CORE+SPUR
    ((SLOG TANG.RES) ~)
  ?.  ?=([%COMPLETE %SUCCESS *] RES)
    ~&  UNSUCCESSFUL-CORE+SPUR
    ((SLOG MESSAGE.BUILD-RESULT.RES) ~)
  ?>  ?=(^ +<.BUILD-RESULT.RES)
  %-  (SLOG (REPORT-ERROR SPUR HEAD.BUILD-RESULT.RES))
  =/  NEX=(LIST ^SPUR)
    =<  P
    ;;  ,[%SUCCESS %$ %CONT * P=(LIST ^SPUR)]
    TAIL.BUILD-RESULT.RES
  ?~  NEX  ~&(%CORES-TESTED ~)
  [OST (BUILD-CORE NEX)]~
::
++  BUILD-CORE
  |=  [A=SPUR B=(LIST SPUR)]
  ~&  >>  (FLOP A)
  :-  %BUILD
  :+  A-CORE+A
    LIVE=|
  ^-  SCHEMATIC:FORD
  :-  [%CORE NOW-DISC %HOON A]
  [%$ %CONT !>(B)]
::
++  MADE-A-REND
  |=  [=SPUR @DA RES=MADE-RESULT]
  :_  +>.$
  ?>  ?=([REN=TERM ~] SPUR)
  =+  `[REN=TERM PAX=PATH]`?~(SPUR !! SPUR)
  ?:  ?=([%INCOMPLETE *] RES)
    ~&  INCOMPLETE-CORE+SPUR
    ((SLOG TANG.RES) ~)
  ?.  ?=([%COMPLETE %SUCCESS *] RES)
    ~&  UNSUCCESSFUL-CORE+SPUR
    ((SLOG MESSAGE.BUILD-RESULT.RES) ~)
  ?>  ?=(^ +<.BUILD-RESULT.RES)
  %-  (SLOG (REPORT-ERROR /[REN]/REN HEAD.BUILD-RESULT.RES))
  =/  NEX=(LIST TERM)
    =<  P
    ;;  ,[%SUCCESS %$ %CONT * P=(LIST TERM)]
    TAIL.BUILD-RESULT.RES
  ?~  NEX  ~&(%RENS-TESTED ~)
  [OST (BUILD-REND NEX)]~
::
++  BUILD-REND
  |=  [A=TERM B=(LIST TERM)]
  ~&  >>  [%REN A]
  :-  %BUILD
  :+  A-REND+/[A]
    LIVE=|
  ^-  SCHEMATIC:FORD
  =/  BEM=BEAM  (NEED (DE-BEAM %/EXAMPLE))
  =/  =RAIL  [[P Q] S]:BEM
  :-  [%BAKE A FAKE-FCGI RAIL]
  [%$ %CONT !>(B)]
::
++  POKE-NOUN
  |=  A=TEST
  :_  +>
  ?-    -.A
      %ARVO  ~|(%STUB !!) ::BASICALLY DOUBLE SOLID?
      %HOONS  ~&((LIST-HOONS P.A ~) ~)
      %CORES  [OST (BUILD-CORE [- +]:(LIST-HOONS P.A SKIP=(SY /SYS /REN /TESTS ~)))]~
      %NAMES  ~&((LIST-NAMES P.A) ~)
      %MARKS  ~|(%STUB !!) ::TODO RESTORE HISTORICAL HANDLER
      %RENDERS  [OST (BUILD-REND [- +]:(LIST-NAMES (WELD /REN P.A)))]~
  ==
::
++  LIST-NAMES
  |=  A/PATH  ^-  (LIST TERM)
  =/  HON  (LIST-HOONS A ~)
  %+  TURN  HON
  |=  B=SPUR
  (JOIN '-' (SLAG 1 (FLOP B)))
::
++  LIST-HOONS
  |=  [UNDER=PATH SKIPPING=(SET SPUR)]  ^-  (LIST SPUR)
  =/  SUP  (FLOP UNDER)
  ~&  [%FINDINING-HOONS UNDER=UNDER]
  |-  ^-  (LIST SPUR)
  %-  ZING
  %+  TURN
    =-  (SORT ~(TAP BY -) AOR)
    DIR:.^(ARCH %CY (EN-BEAM NOW-BEAK SUP))
  |=  [A=KNOT ~]  ^-  (LIST SPUR)
  =.  SUP  [A SUP]
  ?:  (~(HAS IN SKIPPING) (FLOP SUP))
    ~&(> [(FLOP SUP) %OUT-OF-SCOPE] ~)
  =/  DED  (~(GET BY SKIP-COMPLETELY) (FLOP SUP))
  ?^  DED
    ~&(> [(FLOP SUP) %SKIPPED `TAPE`U.DED] ~)
  ?~  [FIL:.^(ARCH %CY (EN-BEAM NOW-BEAK [%HOON SUP]))]
    ^$
  ~&  (FLOP SUP)
  [SUP ^$]
::
++  NOW-BEAK  %_(BYK R [%DA NOW])
++  NOW-DISC  `DISC:FORD`[P.BYK Q.BYK]
++  SKIP-COMPLETELY
  ^~  ^-  (MAP PATH TAPE)
  %-  MY  :~ ::TODO DON'T HARDCODE
    :-  /REN/CSS            "NOT MEANT TO BE CALLED OUTSIDE /WEB/PACK"
    :-  /REN/JS             "NOT MEANT TO BE CALLED OUTSIDE /WEB/PACK"
    :-  /REN/RUN            "NOT MEANT TO BE CALLED EXCEPT ON A (DIFFERENT) HOON FILE"
    :-  /REN/COLLECTIONS    "TEMPORARILY DISABLED"
    :-  /REN/TEST-GEN       "TEMPORARILY DISABLED"
    :-  /REN/URB            "TEMPORARILY DISABLED"
    :-  /REN/X-URB          "TEMPORARILY DISABLED"
    :-  /REN/X-HTM          "TEMPORARILY DISABLED"
    :-  /REN/X-COLLECTIONS-SNIP          "TEMPORARILY DISABLED"
    :-  /REN/X-COLLECTIONS-JSON          "TEMPORARILY DISABLED"
  ::
    :-  /WEB/LANDSCAPE      "/$ DOENSN'T WORK IN TESTS"
  ==
::
++  FAILING
  ^~  ^-  (MAP PATH TAPE)
  %-  MY  :~ ::TODO DON'T HARDCODE
  ::
    :-  /GEN/AL                "COMPILER TYPES OUT-OF-DATE"
    :-  /GEN/MUSK              "COMPILER TYPES OUT-OF-DATE"
  ::
    :-  /GEN/COSMETIC          "INCOMPLETE"
    :-  /GEN/LUST              "INCOMPLETE"
    :-  /GEN/SCANTASTIC        "INCOMPLETE"
  ==
--
