::
::::  /LIB/HALL/HOON
  ::
/-    *HALL
::
::::
  ::
|_  BOL/BOWL:GALL
::
::TODO  ADD TO ZUSE?
++  TRUE-SELF
  |=  [OUR/SHIP NOW/@DA WHO/SHIP]
  ?.  ?=($EARL (CLAN:TITLE WHO))  WHO
  (SEIN:TITLE OUR NOW WHO)
::
++  ABOVE
  |=  [OUR/SHIP NOW/@DA WHO/SHIP]
  ?:  ?=($CZAR (CLAN:TITLE WHO))  ~ZOD
  (SEIN:TITLE OUR NOW WHO)
::
++  SAID-URL                                            ::  APP URL
  |=  URL/PURL:EYRE
  :^  OST.BOL  %POKE  /SAID-URL
  :+  [OUR.BOL %HALL]  %HALL-ACTION
  ^-  ACTION
  :+  %PHRASE
    [[OUR.BOL %INBOX] ~ ~]
  [%APP DAP.BOL %LIN | (CRIP (EN-PURL:HTML URL))]~   :: XX
::
++  SAID                                                ::  APP MESSAGE
  |=  MES/(LIST TANK)
  :-  %HALL-ACTION
  ^-  ACTION
  :-  %PHRASE
  :-  [[OUR.BOL %INBOX] ~ ~]
  |-  ^-  (LIST SPEECH)
  ?~  MES  ~
  :_  $(MES T.MES)
  ^-  SPEECH
  [%APP DAP.BOL %LIN | (CRIP ~(RAM RE I.MES))]
::
++  UNIQ
  ^-  {SERIAL _ENY.BOL}
  [(SHAF %SERIAL ENY.BOL) (SHAX ENY.BOL)]
::
::TODO  ADD TO ZUSE?
++  SIMPLE-WRAP
  |=  {TXT/TAPE WYD/@UD}
  ^-  (LIST TAPE)
  ?~  TXT  ~
  =+  ^-  {END/@UD NEX/?}
    ?:  (LTE (LENT TXT) WYD)  [(LENT TXT) &]
    =+  ACE=(FIND " " (FLOP (SCAG +(WYD) `TAPE`TXT)))
    ?~  ACE  [WYD |]
    [(SUB WYD U.ACE) &]
  :-  (TUFA (SCAG END `(LIST @)`TXT))
  $(TXT (SLAG ?:(NEX +(END) END) `TAPE`TXT))
::
++  RANGE-TO-PATH
  ::    MSG RANGE TO PATH
  ::
  ::  TURNS A RANGE STRUCTURE INTO A PATH USED FOR
  ::  SUBSCRIPTIONS.
  ::
  |=  RAN/RANGE
  ^-  PATH
  ?~  RAN  ~
  :-  (PLACE-TO-KNOT HED.U.RAN)
  ?~  TAL.U.RAN  ~
  [(PLACE-TO-KNOT U.TAL.U.RAN) ~]
::
++  PLACE-TO-KNOT
  ::    MSG POINTER TO PATH COMPONENT
  ::
  ::  TURNS A PLACE STRUCTURE INTO A KNOT FOR USE IN
  ::  SUBSCRIPTION PATHS.
  ::
  |=  PLA/PLACE
  ^-  KNOT
  ?.  ?=($SD -.PLA)  (SCOT -.PLA +.PLA)
  (CAT 3 '-' (SCOT %UD (ABS:SI +.PLA)))
::
++  PATH-TO-RANGE
  ::    PATH TO MSG RANGE
  ::
  ::  TURNS THE TAIL OF A SUBSCRIPTION PATH INTO A
  ::  RANGE STRUCTURE, SKIPPING OVER NON-RANGE TERMS.
  ::
  |=  PAX/PATH
  ^-  RANGE
  ?~  PAX  ~
  =/  HES/(UNIT PLACE)  (RUSH I.PAX PLACER)
  ::  SKIP PAST NON-NUMBER PARTS OF PATH.
  ?~  HES  $(PAX T.PAX)
  :+  ~  U.HES
  ?~  T.PAX  ~
  (RUSH I.T.PAX PLACER)
::
++  PLACER
  ::  PARSE A RANGE PLACE
  ;~  POSE
    (STAG %UD DEM:AG)
  ::
    =-  (STAG %DA (SEAR - CRUB:SO))
    |=  A/DIME
    ^-  (UNIT @DA)
    ?:(?=($DA P.A) `Q.A ~)
  ::
    %+  STAG  %SD
    %+  COOK  (CURY NEW:SI |)
    ;~(PFIX HEP DEM:AG)
  ==
::
++  CHANGE-GLYPHS                                       ::  ...
  ::
  |=  {GYS/(JUG CHAR AUDIENCE) BIN/? GYF/CHAR AUD/AUDIENCE}
  ^+  GYS
  ::  SIMPLE BIND.
  ?:  BIN  (~(PUT JU GYS) GYF AUD)
  ::  UNBIND ALL OF GLYPH.
  ?~  AUD  (~(DEL BY GYS) GYF)
  ::  UNBIND SINGLE.
  (~(DEL JU GYS) GYF AUD)
::
++  CHANGE-NICKS
  ::    CHANGE NICK MAP
  ::
  ::  CHANGES A NICKNAME IN A MAP, ADDING IF IT DOESN'T
  ::  YET EXIST, REMOVING IF THE NICKNAME IS EMPTY.
  ::
  |=  {NIS/(MAP SHIP CORD) WHO/SHIP NIC/CORD}
  ^+  NIS
  ?:  =(NIC '')
    (~(DEL BY NIS) WHO)
  (~(PUT BY NIS) WHO NIC)
::
++  CHANGE-CONFIG
  ::  APPLIES A CONFIG DIFF TO THE GIVEN CONFIG.
  ::
  |=  {COF/CONFIG DIF/DIFF-CONFIG}
  ^+  COF
  ?-  -.DIF
    $FULL     COF.DIF
    $CAPTION  COF(CAP CAP.DIF)
    $FILTER   COF(FIT FIT.DIF)
    $REMOVE   COF
    $READ     COF(RED RED.DIF)
  ::
      $USAGE
    %=  COF
        TAG
      %.  TAS.DIF
      ?:  ADD.DIF
        ~(UNI IN TAG.COF)
      ~(DIF IN TAG.COF)
    ==
  ::
      $SOURCE
    %=  COF
        SRC
      %.  SRC.DIF
      ?:  ADD.DIF
        ~(PUT IN SRC.COF)
      ~(DEL IN SRC.COF)
    ==
  ::
      $PERMIT
    %=  COF
        SIS.CON
      %.  SIS.DIF
      ?:  ADD.DIF
        ~(UNI IN SIS.CON.COF)
      ~(DIF IN SIS.CON.COF)
    ==
  ::
      $SECURE
    %=  COF
        SEC.CON
      SEC.DIF
    ::
        SIS.CON
      ?.  .=  ?=(?($WHITE $GREEN) SEC.DIF)
              ?=(?($WHITE $GREEN) SEC.CON.COF)
        ~
      SIS.CON.COF
    ==
  ==
::
++  CHANGE-STATUS
  ::  APPLIES A STATUS DIFF TO THE GIVEN STATUS.
  ::
  |=  {SAT/STATUS DIF/DIFF-STATUS}
  ^+  SAT
  ?-  -.DIF
    $FULL       SAT.DIF
    $PRESENCE   SAT(PEC PEC.DIF)
    $REMOVE     SAT
  ::
      $HUMAN
    %=  SAT
        MAN
      ?-  -.DIF.DIF
        $FULL     MAN.DIF.DIF
        $TRUE     [HAN.MAN.SAT TRU.DIF.DIF]
        $HANDLE   [HAN.DIF.DIF TRU.MAN.SAT]
      ==
    ==
  ==
::
::TODO  ANNOTATE ALL!
++  DEPA                                              ::  DE-PATHING CORE
  =>  |%  ++  GRUB  *                                 ::  RESULT
          ++  WEIR  (LIST COIN)                       ::  PARSED WIRE
          ++  FIST  $-(WEIR GRUB)                     ::  REPARSER INSTANCE
      --
  |%
  ::
  ++  AL
    |*  {HED/$-(COIN *) TAL/FIST}
    |=  WIR/WEIR  ^+  [*HED *TAL]
    ?~  WIR  !!
    [(HED I.WIR) (TAL T.WIR)]
  ::
  ++  AT
    |*  TYP/{@TAS (POLE @TAS)}
    =+  [I-TYP T-TYP]=TYP
    |=  WER/WEIR
    ^-  (TUP:DRAY:WIRED I-TYP T-TYP)  ::  IE, (TUP %P %TAS ~) IS {@P @TAS}
    ?~  WER  !!
    ?~  T-TYP
      ?^  T.WER  !!
      ((DO I-TYP) I.WER)
    :-  ((DO I-TYP) I.WER)
    (^$(TYP T-TYP) T.WER)
  ::
  ++  MU                                              ::  TRUE UNIT
    |*  WIT/FIST
    |=  WER/WEIR
    ?~(WER ~ (SOME (WIT WER)))
  ::
  ++  AF                                              ::  OBJECT AS FROND
    |*  BUK/(POLE {CORD FIST})
    |=  WER/WEIR
    ?>  ?=({{$$ $TAS @TAS} *} WER)
    ?~  BUK  !!
    =+  [[TAG WIT] T-BUK]=BUK
    ?:  =(TAG Q.P.I.WER)
      [TAG ~|(TAG+`@TAS`TAG (WIT T.WER))]
    ?~  T-BUK  ~|(BAD-TAG+`@TAS`Q.P.I.WER !!)
    (^$(BUK T-BUK) WER)
  ::
  ++  OR
    =+  TYP=$:|-($@(@TAS {@TAS $}))
    |@  ++  $
          |=  CON/COIN
          ::^-  _(SNAG *@ (TURN (LIMO TYP) |*(A/@TAS [A (ODO:RAID:WIRED A)])))
          ?>  ?=($$ -.CON)
          =/  I-TYP  ?@(TYP TYP -.TYP)
          ?:  =(I-TYP P.P.CON)
            :-  I-TYP
            ^-  (ODO:RAID:WIRED I-TYP)
            Q.P.CON
          ?@  TYP  ~|(%BAD-ODOR !!)
          (^$(TYP +.TYP) CON)
    --
  ::
  ++  DO
    |*  TYP/@TAS
    =/  TYPECHECK  `@TAS`TYP
    |=  CON/COIN
    ^-  (ODO:RAID:WIRED TYP)
    ?.  ?=($$ -.CON)  ~|(%NOT-DIME !!)
    ?.  =(TYP P.P.CON)  ~|(BAD-ODOR+`@TAS`P.P.CON !!)
    Q.P.CON
  ::
  ++  UL                                              ::  NULL
    |=(WER/WEIR ?~(WER ~ !!))
  ::
  ++  UN
    |*  WIT/$-(COIN *)
    |=  WER/WEIR  ^+  *WIT
    ?~  WER  !!
    ?^  T.WER  !!
    (WIT I.WER)
  --
--
