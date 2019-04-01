::
::::  /LIB/HALL-JSON/HOON
  ::
/-    HALL
=,    HALL
::
|_  BOL/BOWL:GALL
++  EN-TAPE                                             :::  SUR TO TAPE
  |%
  ++  CIRC                                              :::  CIRCLE
    |=  A/CIRCLE
    :(WELD (SCOW %P HOS.A) "/" (TRIP NOM.A))
  ::
  ++  RANG                                              :::  RANGE
    |=  A/RANGE
    ?~  A  ~
    ;:  WELD
      "/"  (SCOW HED.U.A)
      ?~  TAL.U.A  ~
      (SCOW U.TAL.U.A)
    ==
  ::
  ++  SORC                                              :::  SOURCE
    |=  A/SOURCE
    (WELD (CIRC CIR.A) (RANG RAN.A))
  --
::
++  DE-TAPE                                             :::  TAPE TO SUR (PARSE)
  |%
  ++  CIRC                                              :::  CIRCLE
    ;~((GLUE NET) ;~(PFIX SIG FED:AG) URS:AB)
  ::
  ++  PONT
    ;~  PFIX  NET
      %+  SEAR
        |=  A/COIN
        ^-  (UNIT PLACE)
        ?+  A  ~
          [%$ %DA @DA]  `P.A
          [%$ %UD @UD]  `P.A
        ==
      NUCK:SO
    ==
  ::
  ++  SORC
    ;~(PLUG CIRC (PUNT ;~(PLUG PONT (PUNT PONT))))
  --
::
++  ENJS                                                :::  SUR TO JSON
  =,  ENJS:FORMAT
  |%
  ::TODO  THESE FIRST FEW SHOULD PROBABLY MAKE THEIR WAY
  ::      INTO THE STDLIB...
  ++  SA                                                :::  SET AS ARRAY
    |*  {A/(SET) B/$-(* JSON)}
    ^-  JSON
    [%A (TURN ~(TAP IN A) B)]
  ::
  ++  MO                                                :::  MAP AS OBJECT
    |*  {A/(MAP) B/$-(* @T) C/$-(* JSON)}
    ^-  JSON
    =-  (PAIRS (TURN ~(TAP BY A) -))
    |*  {K/* V/*}  [(B K) (C V)]
  ::
  ++  LANK                                              :::  TANK AS STRING ARR
    |=  A/TANK
    ^-  JSON
    A+(TURN (WASH [0 1.024] A) TAPE)
  ::
  ++  DANK                                              :::  TANK
    |=  A/TANK
    ?:  ?=($LEAF -.A)  (FROND %LEAF (TAPE P.A))
    ::  TODO: NO IDEA WHAT A PLUM IS, BUT IT WAS RECENTLY ADDED
    ::
    ?:  ?=($PLUM -.A)  (FROND %PLUM [%O ~])
    %+  FROND  -.A
    %-  PAIRS
    ?-  -.A
        $PALM
      :+  :-  %STYLE
          %-  PAIRS  :~
            MID+(TAPE P.P.A)
            CAP+(TAPE Q.P.A)
            OPEN+(TAPE R.P.A)
            CLOSE+(TAPE S.P.A)
          ==
        LINES+A+(TURN Q.A DANK)
      ~
        $ROSE
      :+  :-  %STYLE
          %-  PAIRS  :~
            MID+(TAPE P.P.A)
            OPEN+(TAPE Q.P.A)
            CLOSE+(TAPE R.P.A)
          ==
        LINES+A+(TURN Q.A DANK)
      ~
    ==
  ::
  ++  CORD                                              :::  STRING FROM CORD
    |=  A/@T
    S+A
  ::
  ++  MABE                                              :::  NULL OR VALUE
    |*  {A/(UNIT) B/$-(* JSON)}
    ^-  JSON
    ?~(A ~ (B U.A))
  ::
  :::  ||
  :::  ||  %QUERY-MODELS
  :::  ||
  :::    MODELS RELATING TO QUERIES, THEIR RESULTS AND UPDATES.
  ::+|
  ::
  ++  PICI                                              :::  PRIZE-CLIENT
    |=  A/PRIZE-CLIENT
    ^-  JSON
    %-  PAIRS  :~
      :-  %GYS
      =-  (PAIRS ~(TAP BY (~(RUN BY GYS.A) -)))
      |=((SET (SET CIRCLE)) (SA +< AUDI))
      ::
      NIS+(MO NIS.A (CURY SCOT %P) CORD)
    ==
  ::
  ++  RUCI                                              :::  RUMOR-CLIENT
    |=  A/RUMOR-CLIENT
    ^-  JSON
    %+  FROND  -.A
    ?-  -.A
      $GLYPH  (DIGY +.A)
      $NICK   (DINI +.A)
    ==
  ::
  ++  PACK                                              :::  PACKAGE
    |=  A/PACKAGE
    ^-  JSON
    %-  PAIRS  :~
      NES+A+(TURN NES.A ENVE)  ::TODO  MAYBE MAP
      COS+(LOBY COS.A)
      PES+(CROW PES.A)
    ==
  ::
  ++  DIGY                                              :::  DIFF-GLYPH
    |=  A/DIFF-GLYPH
    ^-  JSON
    %-  PAIRS  :~
      BIN+B+BIN.A
      GYF+S+GYF.A
      AUD+(AUDI AUD.A)
    ==
  ::
  ++  DINI                                              :::  DIFF-NICK
    |=  A/DIFF-NICK
    ^-  JSON
    (PAIRS WHO+(SHIP WHO.A) NIC+S+NIC.A ~)
  ::
  ++  RUSO                                              :::  RUMOR-STORY
    |=  A/RUMOR-STORY
    ^-  JSON
    %+  FROND  -.A
    ?+  -.A  !!
      $NEW      (CONF COF.A)
      ::  $BEAR NOT NEEDED
      $CONFIG   (PAIRS CIR+(CIRC CIR.A) DIF+(DICO DIF.A) ~)
      $STATUS   %-  PAIRS  :~
                  CIR+(CIRC CIR.A)
                  WHO+(SHIP WHO.A)
                  DIF+(DISA DIF.A)
                ==
      $REMOVE   B+&
      $GRAM     (ENVE NEV.A)
    ==
  ::
  ++  DICO                                              :::  DIFF-CONFIG
    |=  A/DIFF-CONFIG
    ^-  JSON
    %+  FROND  -.A
    ?-  -.A
      $FULL     (CONF COF.A)
      $SOURCE   (PAIRS ADD+B+ADD.A SRC+(SORC SRC.A) ~)
      $CAPTION  S+CAP.A
      $USAGE    (PAIRS ADD+B+ADD.A TAS+(SA TAS.A CORD) ~)
      $FILTER   (FILT FIT.A)
      $SECURE   S+SEC.A
      $PERMIT   (PAIRS ADD+B+ADD.A SIS+(SA SIS.A SHIP) ~)
      $REMOVE   B+&
      $READ     (NUMB RED.A)
    ==
  ::
  ++  DISA                                              :::  DIFF-STATUS
    |=  A/DIFF-STATUS
    ^-  JSON
    %+  FROND  -.A
    ?-  -.A
      $FULL       (STAT SAT.A)
      $PRESENCE   S+PEC.A
      $HUMAN      (DIHU DIF.A)
      $REMOVE     B+&
    ==
  ::
  ++  DIHU                                              :::  DIFF-HUMAN
    |=  A/DIFF-HUMAN
    ^-  JSON
    %+  FROND  -.A
    ?-  -.A
      $FULL     (HUMA MAN.A)
      $HANDLE   (FROND %HAN (MABE HAN.A CORD))
      $TRUE     (FROND %TRU (MABE TRU.A TRUN))
    ==
  ::
  :::  ||
  :::  ||  %CIRCLES
  :::  ||
  :::    MESSAGING TARGETS AND THEIR METADATA
  ::+|
  ::
  ++  CIRC                                              :::  CIRCLE
    |=  A/CIRCLE
    ^-  JSON
    S+(CRIP (CIRC:EN-TAPE A))
  ::
  ++  LOBY                                              :::  LOBBY
    |=  A/LOBBY
    %-  PAIRS  :~
      LOC+(CONF LOC.A)
      REM+(MO REM.A (CORK CIRC:EN-TAPE CRIP) CONF)
    ==
  ::
  ++  CONF                                              :::  CONFIG
    |=  A/CONFIG
    ^-  JSON
    %-  PAIRS  :~
      SRC+(SA SRC.A SORC)
      CAP+S+CAP.A
      TAG+(SA TAG.A CORD)
      FIT+(FILT FIT.A)
      CON+(CONT CON.A)
      RED+(NUMB RED.A)
    ==
  ::
  ++  SORC                                              :::  SOURCE
    |=  A/SOURCE
    ^-  JSON
    S+(CRIP (SORC:EN-TAPE A))
  ::
  ++  FILT                                              :::  FILTER
    |=  A/FILTER
    ^-  JSON
    (PAIRS CAS+B+CAS.A UTF+B+UTF.A ~)
  ::
  ++  CONT                                              :::  CONTROL
    |=  A/CONTROL
    ^-  JSON
    (PAIRS SEC+S+SEC.A SIS+(SA SIS.A SHIP) ~)
  ::
  ++  CROW                                              :::  CROWD
    |=  A/CROWD
    ^-  JSON
    %-  PAIRS  :~
      LOC+(GROP LOC.A)
      REM+(MO REM.A (CORK CIRC:EN-TAPE CRIP) GROP)
    ==
  ::
  ++  GROP                                              :::  GROUP
    |=  A/GROUP
    ^-  JSON
    (MO A (CURY SCOT %P) STAT)
  ::
  ++  STAT                                              :::  STATUS
    |=  A/STATUS
    ^-  JSON
    (PAIRS PEC+S+PEC.A MAN+(HUMA MAN.A) ~)
  ::
  ++  HUMA                                              :::  HUMAN
    |=  A/HUMAN
    ^-  JSON
    (PAIRS HAN+(MABE HAN.A CORD) TRU+(MABE TRU.A TRUN) ~)
  ::
  ++  TRUN                                              :::  TRUENAME
    |=  A/TRUENAME
    ^-  JSON
    (PAIRS FIR+S+FIR.A MID+(MABE MID.A CORD) LAS+S+LAS.A ~)
  ::
  :::  ||
  :::  ||  %MESSAGE-DATA
  :::  ||
  :::    STRUCTURES FOR CONTAINING MAIN MESSAGE DATA
  ::+|
  ::
  ++  ENVE                                              :::  ENVELOPE
    |=  A/ENVELOPE
    ^-  JSON
    (PAIRS NUM+(NUMB NUM.A) GAM+(GRAM GAM.A) ~)
  ::
  ++  GRAM                                              :::  TELEGRAM
    |=  A/TELEGRAM
    ^-  JSON
    %-  PAIRS  :~
      AUT+(SHIP AUT.A)
      ::TODO  CAN WE AVOID THIS CODE DUPLICATION SOMEHOW?
      UID+S+(SCOT %UV UID.A)
      AUD+(AUDI AUD.A)
      WEN+(TIME WEN.A)
      SEP+(SPEC SEP.A)
    ==
  ::
  ++  THOT                                              :::  THOUGHT
    |=  A/THOUGHT
    ^-  JSON
    %-  PAIRS  :~
      UID+S+(SCOT %UV UID.A)
      AUD+(AUDI AUD.A)
      WEN+(TIME WEN.A)
      SEP+(SPEC SEP.A)
    ==
  ::
  ++  SPEC                                              :::  SPEECH
    |=  A/SPEECH
    ^-  JSON
    ::  ONLY %URL HAS JUST A SINGLE PIECE OF DATA.
    ?:  ?=($URL -.A)
      (FROND %URL S+(CRIP (APIX:EN-PURL:HTML URL.A)))
    %+  FROND  -.A
    %-  PAIRS
    ?-  -.A
      $LIN  ~[PAT+B+PAT.A MSG+S+MSG.A]
      $EXP  ~[EXP+S+EXP.A RES+A+(TURN RES.A LANK)]
      $IRE  ~[TOP+S+(SCOT %UV TOP.A) SEP+(SPEC SEP.A)]  ::TODO  @UV AS NUMBER?
      $FAT  ~[TAC+(ATTA TAC.A) SEP+(SPEC SEP.A)]
      $INV  ~[INV+B+INV.A CIR+(CIRC CIR.A)]
      $APP  ~[APP+S+APP.A SEP+(SPEC SEP.A)]
    ==
  ::
  ++  ATTA                                              :::  ATTACHE
    |=  A/ATTACHE
    ^-  JSON
    %+  FROND  -.A
    ?-  -.A
      $NAME  (PAIRS NOM+S+NOM.A TAC+(ATTA TAC.A) ~)
      $TEXT  S+(OF-WAIN:FORMAT +.A)
      $TANK  A+(TURN +.A LANK)
    ==
  ::
  :::  ||
  :::  ||  %MESSAGE-METADATA
  :::  ||
  :::    STRUCTURES FOR CONTAINING MESSAGE METADATA
  ::+|
  ::
  ++  AUDI                                              :::  AUDIENCE
    |=  A/AUDIENCE
    ^-  JSON
    (SA A CIRC)
  --
::
++  DEJS                                                :::  JSON TO SUR
  =,  DEJS-SOFT:FORMAT
  |%
  ::TODO  THESE FIRST FEW SHOULD MAYBE MAKE THEIR WAY
  ::      INTO THE STDLIB...
  ++  RE                                                :::  RECURSIVE REPARSERS
    |*  {GAR/* SEF/_|.(FIST)}
    |=  JON/JSON
    ^-  (UNIT _GAR)
    =-  ~!  GAR  ~!  (NEED -)  -
    ((SEF) JON)
  ::
  ++  AS                                                :::  ARRAY AS SET
    |*  A/FIST
    (CU ~(GAS IN *(SET _(NEED *A))) (AR A))
  ::
  ++  DANK                                              :::  TANK
    ^-  $-(JSON (UNIT TANK))
    %+  RE  *TANK  |.  ~+
    %-  OF  :~
      LEAF+SA
      PALM+(OT STYLE+(OT MID+SA CAP+SA OPEN+SA CLOSE+SA ~) LINES+(AR DANK) ~)
      ROSE+(OT STYLE+(OT MID+SA OPEN+SA CLOSE+SA ~) LINES+(AR DANK) ~)
    ==
  ::
  :::  ||
  :::  ||  %QUERY-MODELS
  :::  ||
  :::    MODELS RELATING TO QUERIES, THEIR RESULTS AND UPDATES.
  ::+|
  ::
  ++  PICI                                              :::  PRIZE-CLIENT
    ^-  $-(JSON (UNIT PRIZE-CLIENT))
    %-  OT  :~
      GYS+(OM (AS (AS CIRC)))
      NIS+(OP FED:AG SO)
    ==
  ::
  ++  RUCI                                              :::  RUMOR-CLIENT
    ^-  $-(JSON (UNIT RUMOR-CLIENT))
    %-  OF  :~
      GLYPH+DIGY
      NICK+DINI
    ==
  ::
  ++  PACK                                              :::  PACKAGE
    ^-  $-(JSON (UNIT PACKAGE))
    %-  OT  :~
      NES+(AR ENVE)
      COS+LOBY
      PES+CROW
    ==
  ::
  ++  DIGY                                              :::  DIFF-GLYPH
    ^-  $-(JSON (UNIT DIFF-GLYPH))
    (OT BIN+BO GYF+SO AUD+AUDI ~)
  ::
  ++  DINI                                              :::  DIFF-NICK
    ^-  $-(JSON (UNIT DIFF-NICK))
    (OT WHO+(SU FED:AG) NIC+SO ~)
  ::
  ++  RUSO                                              :::  RUMOR-STORY
    ^-  $-(JSON (UNIT RUMOR-STORY))
    %-  OF  :~
      NEW+CONF
      ::  BEAR NOT NEEDED
      CONFIG+(OT CIR+CIRC DIF+DICO ~)
      STATUS+(OT CIR+CIRC WHO+(SU FED:AG) DIF+DISA ~)
      REMOVE+UL
      GRAM+(OT SRC+CIRC NEV+ENVE ~)
    ==
  ::
  ++  DICO                                              :::  DIFF-CONFIG
    ^-  $-(JSON (UNIT DIFF-CONFIG))
    %-  OF  :~
      FULL+CONF
      SOURCE+(OT ADD+BO SRC+SORC ~)
      USAGE+(OT ADD+BO TAS+(AS SO) ~)
      CAPTION+SO
      FILTER+FILT
      SECURE+SECU
      PERMIT+(OT ADD+BO SIS+(AS (SU FED:AG)) ~)
      REMOVE+UL
    ==
  ::
  ++  DISA                                              :::  DIFF-STATUS
    ^-  $-(JSON (UNIT DIFF-STATUS))
    %-  OF  :~
      FULL+(OT PEC+PRES MAN+HUMA ~)
      PRESENCE+PRES
      HUMAN+DIHU
      REMOVE+UL
    ==
  ::
  ++  DIHU                                              :::  DIFF-HUMAN
    ^-  $-(JSON (UNIT DIFF-HUMAN))
    %-  OF  :~
      FULL+HUMA
      HANDLE+(MU SO)
      TRUE+(MU TRUN)
    ==
  ::
  :::  ||
  :::  ||  %CIRCLES
  :::  ||
  :::    MESSAGING TARGETS AND THEIR METADATA.
  ::+|
  ::
  ::TODO  MAYBE JUST AN OBJECT?
  ++  CIRC                                              :::  CIRCLE
    ^-  $-(JSON (UNIT CIRCLE))
    (SU CIRC:DE-TAPE)
  ::
  ++  LOBY                                              :::  LOBBY
    ^-  $-(JSON (UNIT LOBBY))
    (OT LOC+CONF REM+(OP CIRC:DE-TAPE CONF) ~)
  ::
  ++  CONF                                              :::  CONFIG
    ^-  $-(JSON (UNIT CONFIG))
    %-  OT  :~
      SRC+(AS SORC)
      CAP+SO
      TAG+(AS SO)
      FIT+FILT
      CON+CONT
      RED+NI
    ==
  ::
  ::TODO  MAYBE JUST AN OBJECT?
  ++  SORC                                              :::  SOURCE
    ^-  $-(JSON (UNIT SOURCE))
    (SU SORC:DE-TAPE)
  ::
  ++  FILT                                              :::  FILTER
    ^-  $-(JSON (UNIT FILTER))
    (OT CAS+BO UTF+BO ~)
  ::
  ++  CONT                                              :::  CONTROL
    ^-  $-(JSON (UNIT CONTROL))
    (OT SEC+SECU SIS+(AS (SU FED:AG)) ~)
  ::
  ++  SECU                                              :::  SECURITY
    ^-  $-(JSON (UNIT SECURITY))
    (SU (PERK %CHANNEL %VILLAGE %JOURNAL %MAILBOX %CUSTOM ~))
  ::
  ++  CROW                                              :::  CROWD
    ^-  $-(JSON (UNIT CROWD))
    (OT LOC+GROP REM+(OP CIRC:DE-TAPE GROP) ~)
  ::
  ++  GROP                                              :::  GROUP
    ^-  $-(JSON (UNIT GROUP))
    (OP FED:AG STAT)
  ::
  ++  STAT                                              :::  STATUS
    ^-  $-(JSON (UNIT STATUS))
    (OT PEC+PRES MAN+HUMA ~)
  ::
  ++  PRES                                              :::  PRESENCE
    ^-  $-(JSON (UNIT PRESENCE))
    (SU (PERK %GONE %IDLE %HEAR %TALK ~))
  ::
  ++  HUMA                                              :::  HUMAN
    ^-  $-(JSON (UNIT HUMAN))
    (OT HAN+(MU SO) TRU+(MU TRUN) ~)
  ::
  ++  TRUN                                              :::  TRUENAME
    ^-  $-(JSON (UNIT TRUENAME))
    (OT FIR+SO MID+(MU SO) LAS+SO ~)
  ::
  :::  ||
  :::  ||  %MESSAGE-DATA
  :::  ||
  :::    STRUCTURES FOR CONTAINING MAIN MESSAGE DATA.
  ::+|
  ::
  ++  ENVE                                              :::  ENVELOPE
    ^-  $-(JSON (UNIT ENVELOPE))
    (OT NUM+NI GAM+GRAM ~)
  ::
  ++  GRAM                                              :::  TELEGRAM
    ^-  $-(JSON (UNIT TELEGRAM))
    %-  OT  :~
      AUT+(SU FED:AG)
      ::TODO  CAN WE DO ANYTHING ABOUT THIS DUPLICATION?
      UID+SERI
      AUD+AUDI
      WEN+DI
      SEP+SPEC
    ==
  ::
  ++  THOT                                              :::  THOUGHT
    ^-  $-(JSON (UNIT THOUGHT))
    %-  OT  :~
      UID+SERI
      AUD+AUDI
      WEN+DI
      SEP+SPEC
    ==
  ::
  ++  SPEC                                              :::  SPEECH
    ^-  $-(JSON (UNIT SPEECH))
    %+  RE  *SPEECH  |.  ~+
    %-  OF  :~
      LIN+(OT PAT+BO MSG+SO ~)
      URL+(SU AURF:DE-PURL:HTML)
      EXP+EVAL
      IRE+(OT TOP+SERI SEP+SPEC ~)
      FAT+(OT TAC+ATTA SEP+SPEC ~)
      INV+(OT INV+BO CIR+CIRC ~)
      APP+(OT APP+SO SEP+SPEC ~)
    ==
  ::
  ++  EVAL                                              :::  %EXP SPEECH
    :::  EXTRACT CONTENTS OF AN %EXP SPEECH, EVALUATING
    :::  THE {EXP} IF THERE IS NO {RES} YET.
    ::
    |=  A/JSON
    ^-  (UNIT {CORD (LIST TANK)})
    =+  EXP=((OT EXP+SO ~) A)
    ?~  EXP  ~
    :+  ~  U.EXP
    =+  RES=((OT RES+(AR DANK) ~) A)
    ?^  RES  U.RES
    P:(MULE |.([(SELL (SLAP !>(..ZUSE) (REAM U.EXP)))]~))  ::TODO  OLDZ
  ::
  ++  ATTA                                              :::  ATTACHE
    ^-  $-(JSON (UNIT ATTACHE))
    %+  RE  *ATTACHE  |.  ~+
    %-  OF  :~
      NAME+(OT NOM+SO TAC+ATTA ~)
      TEXT+(CU TO-WAIN:FORMAT SO)
      TANK+(AR DANK)
    ==
  ::
  :::  ||
  :::  ||  %MESSAGE-METADATA
  :::  ||
  ::     STRUCTURES FOR CONTAINING MESSAGE METADATA.
  ::+|
  ::
  ++  SERI                                              :::  SERIAL
    ^-  $-(JSON (UNIT SERIAL))
    (CI (SLAT %UV) SO)
  ::
  ++  AUDI                                              :::  AUDIENCE
    ^-  $-(JSON (UNIT AUDIENCE))
    (AS CIRC)
  --
--
