::                                                      ::  ::
::::  /HOON/DOJO/APP                                    ::  ::::
  ::                                                    ::    ::
/?  309                                                 ::  ARVO KELVIN
/-  SOLE, LENS                                          ::  CONSOLE STRUCTURES
/+  SOLE                                                ::  CONSOLE LIBRARY
=,  SOLE
::                                                      ::  ::
::::                                                    ::  ::::
  ::                                                    ::    ::
=>  |%                                                  ::  EXTERNAL STRUCTURES
    ++  HOUSE                                           ::  ALL STATE
      $:  $5
          EGG/@U                                        ::  COMMAND COUNT
          HOC/(MAP BONE SESSION)                        ::  CONVERSATIONS
      ==                                                ::
    ++  SESSION                                         ::  PER CONVERSATION
      $:  SAY/SOLE-SHARE                                ::  COMMAND-LINE STATE
          DIR/BEAM                                      ::  ACTIVE PATH
          POY/(UNIT DOJO-PROJECT)                       ::  WORKING
          $:  ::  SUR: STRUCTURE IMPORTS
              ::
              SUR=(LIST CABLE:FORD)
              ::  LIB: LIBRARY IMPORTS
              ::
              LIB=(LIST CABLE:FORD)
          ==
          VAR/(MAP TERM CAGE)                           ::  VARIABLE STATE
          OLD/(SET TERM)                                ::  USED TLVS
          BUF/TAPE                                      ::  MULTILINE BUFFER
      ==                                                ::
    ++  MONKEY                                         ::  PER CONVERSATION
      $:  SAY/SOLE-SHARE                                ::  COMMAND-LINE STATE
          DIR/BEAM                                      ::  ACTIVE PATH
          POY/(UNIT DOJO-PROJECT)                       ::  WORKING
          VAR/(MAP TERM CAGE)                           ::  VARIABLE STATE
          OLD/(SET TERM)                                ::  USED TLVS
          BUF/TAPE                                      ::  MULTILINE BUFFER
      ==                                                ::
    ++  DOJO-COMMAND                                    ::
      $^  (PAIR DOJO-SINK DOJO-SOURCE)                  ::  ROUTE VALUE
      {$BREV P/TERM}                                    ::  UNBIND VARIABLE
    ::
    ++  DOJO-SINK                                       ::
      $%  {$FLAT P/PATH}                                ::  ATOM TO UNIX
          {$PILL P/PATH}                                ::  NOUN TO UNIX PILL
          ::  {$TREE P/PATH}                            ::  NOUN TO UNIX TREE
          {$FILE P/BEAM}                                ::  SAVE TO CLAY
          $:  $HTTP                                     ::  HTTP OUTBOUND
              P/?($POST $PUT)
              Q/(UNIT KNOT)
              R/PURL:EYRE
          ==
          {$POKE P/GOAL}                                ::  POKE APP
          {$SHOW P/?($0 $1 $2 $3 $4 $5)}                ::  VAL/TYPE/HOON/XRAY
          {$VERB P/TERM}                                ::  STORE VARIABLE
      ==                                                ::
    ++  DOJO-SOURCE                                     ::  CONSTRUCTION NODE
      $:  P/@UD                                         ::  ASSEMBLY INDEX
          Q/DOJO-BUILD                                  ::  GENERAL BUILD
      ==                                                ::
    ++  DOJO-BUILD                                      ::  ONE ARVO STEP
      $~  [%EX *HOON]
      $%  {$UR P/(UNIT KNOT) Q/PURL:EYRE}               ::  HTTP GET REQUEST
          {$GE P/DOJO-MODEL}                            ::  GENERATOR
          {$DV P/PATH}                                  ::  CORE FROM SOURCE
          {$EX P/HOON}                                  ::  HOON EXPRESSION
          {$SA P/MARK}                                  ::  EXAMPLE MARK VALUE
          {$AS P/MARK Q/DOJO-SOURCE}                    ::  SIMPLE TRANSMUTE
          {$DO P/HOON Q/DOJO-SOURCE}                    ::  GATE APPLY
          {$TU P/(LIST DOJO-SOURCE)}                    ::  TUPLE
      ==                                                ::
    ++  DOJO-MODEL                                      ::  DATA CONSTRUCTION
      $:  P/DOJO-SERVER                                 ::  CORE SOURCE
          Q/DOJO-CONFIG                                 ::  CONFIGURATION
      ==                                                ::
    ++  DOJO-SERVER                                     ::  NUMBERED DEVICE
      $:  P/@UD                                         ::  ASSEMBLY INDEX
          Q/PATH                                        ::  GATE PATH
      ==                                                ::
    ++  DOJO-CONFIG                                     ::  CONFIGURATION
      $:  P/(LIST DOJO-SOURCE)                          ::  BY ORDER
          Q/(MAP TERM (UNIT DOJO-SOURCE))               ::  BY KEYWORD
      ==                                                ::
    ++  DOJO-PROJECT                                    ::  CONSTRUCTION STATE
      $:  MAD/DOJO-COMMAND                              ::  OPERATION
          NUM/@UD                                       ::  NUMBER OF TASKS
          CUD/(UNIT DOJO-SOURCE)                        ::  NOW SOLVING
          PUX/(UNIT PATH)                               ::  FORD WORKING
          PRO/(UNIT VASE)                               ::  PROMPTING LOOP
          PER/(UNIT SOLE-EDIT)                          ::  PENDING REVERSE
          JOB/(MAP @UD DOJO-BUILD)                      ::  PROBLEMS
          REZ/(MAP @UD CAGE)                            ::  RESULTS
      ==                                                ::
    ++  BEAD  {P/(SET BEAM) Q/CAGE}                     ::  COMPUTED RESULT
    ++  GOAL  {P/SHIP Q/TERM}                           ::  FLAT APPLICATION
    ++  CLAP                                            ::  ACTION, USER
      $%  {$PEER P/PATH}                                ::  SUBSCRIBE
          {$POKE P/(CASK)}                              ::  APPLY
          {$PULL ~}                                    ::  UNSUBSCRIBE
      ==                                                ::
    ++  CLUB                                            ::  ACTION, SYSTEM
      $%  {$PEER P/PATH}                                ::  SUBSCRIBE
          {$POKE P/CAGE}                                ::  APPLY
          {$PULL ~}                                    ::  UNSUBSCRIBE
      ==                                                ::
    ++  CARD                                            ::  GENERAL CARD
      $%  {$DIFF $SOLE-EFFECT SOLE-EFFECT}              ::
          {$SEND WIRE {SHIP TERM} CLAP}                 ::
          $:  $HISS
              WIRE
              (UNIT KNOT)
              MARK
              {$HISS HISS:EYRE}
          ==
          [%BUILD WIRE ? SCHEMATIC:FORD]
          [%KILL WIRE ~]
          {$DEAL WIRE SOCK TERM CLUB}                   ::
          {$INFO WIRE TORO:CLAY}                        ::
      ==                                                ::
    ++  MOVE  (PAIR BONE CARD)                          ::  USER-LEVEL MOVE
    ++  SIGN                                            ::
      $%  ::  %MADE: BUILD RESULT; RESPONSE TO %BUILD +TASK
          ::
          $:  %MADE
              ::  DATE: FORMAL DATE OF THE BUILD
              ::
              DATE=@DA
              ::  RESULT: RESULT OF THE BUILD; EITHER COMPLETE BUILD, OR ERROR
              ::
              $=  RESULT
              $%  ::  %COMPLETE: CONTAINS THE RESULT OF THE COMPLETED BUILD
                  ::
                  [%COMPLETE BUILD-RESULT=BUILD-RESULT:FORD]
                  ::  %INCOMPLETE: COULDN'T FINISH BUILD; CONTAINS ERROR MESSAGE
                  ::
                  [%INCOMPLETE =TANG]
          ==  ==
          {$UNTO P/CUFT:GALL}
      ==
    --
=>
|%
::  |PARSER-AT: PARSERS FOR DOJO EXPRESSIONS USING :DIR AS WORKING DIRECTORY
::
++  PARSER-AT
  |=  [OUR=SHIP DIR=BEAM]
  |%
  ++  DEFAULT-APP         %HOOD
  ++  HOON-PARSER         (VANG | (EN-BEAM:FORMAT DIR))
  ++  OUR                 P.DIR
  ::
  ++  PARSE-COMMAND-LINE  ;~(SFIX PARSE-COMMAND (STAR ACE) (JUST '\0A'))
  ::
  ++  TO-COMMAND
    |=  [GOL=GOAL MOD=DOJO-MODEL]
    ^-  DOJO-COMMAND
    [[%POKE GOL] [0 [%GE MOD(Q.P [Q.GOL Q.P.MOD])]]]
  ::
  ++  PARSE-VARIABLE
    |*  [SYM=RULE SRC=RULE]
    %+  COOK
      |=  {A/TERM B/(UNIT DOJO-SOURCE)}
      ^-  DOJO-COMMAND
      ?~(B [%BREV A] [[%VERB A] U.B])
    ;~(PLUG SYM (PUNT SRC))
  ::
  ++  PARSE-COMMAND
    :: =<  ;~(LESS |-(;~(POSE (JEST '|*') ;~(PFIX NEXT (KNEE ** |.(^$))))) .)
    %+  KNEE  *DOJO-COMMAND  |.  ~+
    ;~  POSE
      ;~  PFIX  BAR
        %+  COOK  TO-COMMAND
        (STAG `GOAL`[OUR DEFAULT-APP] PARSE-MODEL)
      ==
    ::
      ;~  PFIX  COL
        %+  COOK
          |=  {A/GOAL B/$^(DOJO-MODEL DOJO-SOURCE)}
          ?@  -.B  [[%POKE A] B]
          (TO-COMMAND A B)
        ;~  PLUG
          PARSE-GOAL
          ;~  POSE
            ;~(PFIX BAR PARSE-MODEL)
            ;~(PFIX ACE PARSE-SOURCE)
          ==
        ==
      ==
    ::
      ;~  PFIX  TIS
        ;~  POSE
          (PARSE-VARIABLE (JEST %DIR) ;~(PFIX ACE :(STAG 0 %EX PARSE-ROOD)))
          (PARSE-VARIABLE SYM ;~(PFIX ACE PARSE-SOURCE))
        ==
      ==
    ::
      ;~  PFIX  NET
        ;~  POSE
          (PARSE-VARIABLE (COLD %SUR HEP) ;~(PFIX GAP PARSE-CABLES))
          (PARSE-VARIABLE (COLD %LIB LUS) ;~(PFIX GAP PARSE-CABLES))
        ==
      ==
    ::
      ;~((GLUE ACE) PARSE-SINK PARSE-SOURCE)
      (STAG [%SHOW %0] PARSE-SOURCE)
    ==
  ::
  ++  PARSE-SINK
    ;~  POSE
      ;~(PLUG (COLD %FILE TAR) PARSE-BEAM)
      ;~(PLUG (COLD %FLAT VAT) (MOST NET SYM))
      ;~(PLUG (COLD %PILL DOT) (MOST NET SYM))
      ;~(PLUG (COLD %HTTP LUS) (STAG %POST PARSE-IDEN-URL))
      ;~(PLUG (COLD %HTTP HEP) (STAG %PUT PARSE-IDEN-URL))
      (STAG %SHOW (COOK $?($1 $2 $3 $4 $5) (COOK LENT (STUN [1 5] WUT))))
    ==
  ::
  ++  PARSE-CABLES
    %+  COOK
      |=  CABLES=(LIST CABLE:FORD)
      :+  0  %EX
      ^-  HOON
      ::
      :-  %CLSG
      %+  TURN  CABLES
      |=  CABLE=CABLE:FORD
      ^-  HOON
      ::
      :+  %CLHP
        ?~  FACE.CABLE
          [%ROCK %N ~]
        [%CLHP [%ROCK %N ~] [%SAND %TAS U.FACE.CABLE]]
      [%SAND %TAS FILE-PATH.CABLE]
    (MOST ;~(PLUG COM GAW) PARSE-CABLE)
  ::
  ++  PARSE-CABLE
    %+  COOK  |=(A=CABLE:FORD A)
    ;~  POSE
      (STAG ~ ;~(PFIX TAR SYM))
      (COOK |=([FACE=TERM TIS=@ FILE=TERM] [`FACE FILE]) ;~(PLUG SYM TIS SYM))
      (COOK |=(A=TERM [`A A]) SYM)
    ==
  ++  PARSE-SOURCE  (STAG 0 PARSE-BUILD)
  ++  PARSE-BUILD
      %+  KNEE  *DOJO-BUILD  |.  ~+
      ;~  POSE
        ;~(PLUG (COLD %UR LUS) PARSE-IDEN-URL)
        ;~(PLUG (COLD %GE LUS) PARSE-MODEL)
        ;~(PLUG (COLD %AS PAD) SYM ;~(PFIX ACE PARSE-SOURCE))
        ;~(PLUG (COLD %DO CAB) PARSE-HOON ;~(PFIX ACE PARSE-SOURCE))
        PARSE-VALUE
      ==
  ::
  ++  PARSE-GOAL
    %+  COOK  |=(A/GOAL A)
    ;~  POSE
      ;~  PLUG
        ;~(PFIX SIG FED:AG)
        ;~(POSE ;~(PFIX NET SYM) (EASY DEFAULT-APP))
      ==
      %+  STAG  OUR
      ;~(POSE SYM (EASY DEFAULT-APP))
    ==
  ::
  ++  PARSE-BEAM
    %+  COOK
      |=  A=PATH
      ::  HACK: FIXUP PATHS THAT COME OUT OF THE HOON PARSER
      ::
      ::    WE CURRENTLY INVOKE THE HOON PARSER TO READ RELATIVE PATHS FROM
      ::    THE COMMAND LINE, AND THIS PARSER WILL PRODUCE LEADING ~ PATH
      ::    COMPONENTS WITH PATHS THAT START WITH A `/`.
      ::
      ::    THIS ENTIRE PATH IS NUTS AND WE SHOULDN'T BE REPRESENTING PATHS
      ::    AS ARBITRARY HOONS.
      ::
      =?  A  &(?=(^ A) =('' I.A))
        T.A
      (FALL (DE-BEAM:FORMAT A) [`BEAK`[P Q R]:DIR (FLOP A)])
    =+  VEZ=HOON-PARSER
    (SEAR PLEX:VEZ (STAG %CLSG POOR:VEZ))
  ::
  ++  PARSE-IDEN-URL
    %+  COOK
      |=([A=(UNIT KNOT) B=PURL:EYRE] [`(FALL A *KNOT) B])
    AURU:DE-PURL:HTML
    ::
  ++  PARSE-MODEL   ;~(PLUG PARSE-SERVER PARSE-CONFIG)
  ++  PARSE-SERVER  (STAG 0 (MOST NET SYM))
  ++  PARSE-HOON    TALL:HOON-PARSER
  ::
  ++  PARSE-ROOD
    ::  XX SHOULD THIS USE +HOON-PARSER INSTEAD TO NORMALIZE THE CASE?
    ::
    =>  (VANG | (EN-BEAM:FORMAT DIR))
    ;~  POSE
      ROOD
    ::
      ::  XX REFACTOR ++SCAT
      ::
      =-  ;~(PFIX CEN (STAG %CLSG -))
      %+  SEAR  |=([A=@UD B=TYKE] (POSH ~ ~ A B))
      ;~  POSE
        PORC
        (COOK |=(A=(LIST) [(LENT A) ~]) (STAR CEN))
      ==
    ==
  ++  PARSE-VALUE
    ;~  POSE
      (STAG %SA ;~(PFIX TAR PAD SYM))
      (STAG %EX PARSE-HOON)
      (STAG %TU (IFIX [LAC RAC] (MOST ACE PARSE-SOURCE)))
    ==
  ::
  ++  PARSE-CONFIG
    ;~  PLUG
      (STAR ;~(PFIX ACE (STAG 0 PARSE-VALUE)))
      %+  COOK
        ~(GAS BY *(MAP TERM (UNIT DOJO-SOURCE)))
      %-  STAR
      ;~  PLUG
        ;~(PFIX COM ACE TIS SYM)
        (PUNT ;~(PFIX ACE (STAG 0 PARSE-VALUE)))
      ==
    ==
  --
--
::                                                      ::
::::                                                    ::
  ::                                                    ::
=,  GALL
=+  FOO=*MONKEY
|_  $:  HID/BOWL                                        ::  SYSTEM STATE
        HOUSE                                           ::  PROGRAM STATE
    ==                                                  ::
++  HE                                                  ::  PER SESSION
  |_  {MOZ/(LIST MOVE) SESSION}                         ::
  ::
  ++  HE-BEAM
    ^-  BEAM
    ?.  =([%UD 0] R.DIR)
      DIR
    DIR(R [%DA NOW.HID])
  ::
  ++  HE-DISC    `DISC:FORD`[P Q]:HE-BEAM
  ++  HE-BEAK    `BEAK`[P Q R]:HE-BEAM
  ++  HE-RAIL    `RAIL:FORD`[[P Q] S]:HE-BEAM
  ++  HE-PARSER  (PARSER-AT OUR.HID HE-BEAM)
  ::
  ++  DY                                                ::  PROJECT WORK
    |_  DOJO-PROJECT                                    ::
    ++  DY-ABET  +>(POY `+<)                            ::  RESOLVE
    ++  DY-AMOK  +>(POY ~)                              ::  TERMINATE
    ++  DY-FORD                                         ::  SEND WORK TO FORD
      |=  [WAY=WIRE SCHEMATIC=SCHEMATIC:FORD]
      ^+  +>+>
      ?>  ?=($~ PUX)
      ::  PIN ALL BUILDS TO :NOW.HID SO THEY DON'T GET CACHED FOREVER
      ::
      (HE-CARD(POY `+>+<(PUX `WAY)) %BUILD WAY LIVE=%.N SCHEMATIC)
    ::
    ++  DY-EYRE                                         ::  SEND WORK TO EYRE
      |=  {WAY/WIRE USR/(UNIT KNOT) REQ/HISS:EYRE}
      ^+  +>+>
      ?>  ?=(~ PUX)
      (HE-CARD(POY `+>+<(PUX `WAY)) %HISS WAY USR %HTTR %HISS REQ)
    ::
    ++  DY-STOP                                         ::  STOP WORK
      ^+  +>
      =.  POY  ~
      ?~  PUX  +>
      %.  [%TXT "! CANCEL {<U.PUX>}"]
      HE-DIFF:(HE-CARD [%KILL U.PUX ~])
    ::
    ++  DY-SLAM                                         ::  CALL BY FORD
      |=  {WAY/WIRE GAT/VASE SAM/VASE}
      ^+  +>+>
      (DY-FORD WAY `SCHEMATIC:FORD`[%CALL [%$ %NOUN GAT] [%$ %NOUN SAM]])
    ::
    ++  DY-ERRD                                         ::  REJECT CHANGE, ABET
      |=  {REV/(UNIT SOLE-EDIT) ERR/@U}
      ^+  +>+>
      (HE-ERRD(POY `+>+<) REV ERR)
    ::
    ++  DY-DIFF                                         ::  SEND EFFECTS, ABET
      |=  FEC/SOLE-EFFECT
      ^+  +>+>
      (HE-DIFF(POY `+>+<) FEC)
    ::
    ++  DY-RASH                                         ::  SEND EFFECTS, AMOK
      |=  FEC/SOLE-EFFECT
      ^+  +>+>
      (HE-DIFF(POY ~) FEC)
    ::
    ++  DY-INIT-COMMAND                                 ::  ++DOJO-COMMAND
      |=  MAD/DOJO-COMMAND
      ^+  [MAD +>]
      ?@  -.MAD  [MAD +>.$]
      =.  Q.MAD
        ?+(-.P.MAD Q.MAD $HTTP [0 %AS %MIME Q.MAD])
      =^  SRC  +>.$  (DY-INIT-SOURCE Q.MAD)
      [MAD(Q SRC) +>.$]
    ::
    ++  DY-INIT-SOURCE                                  ::  ++DOJO-SOURCE
      |=  SRC/DOJO-SOURCE
      ^+  [SRC +>]
      =^  BUL  +>  (DY-INIT-BUILD Q.SRC)
      =:  P.SRC  NUM
          Q.SRC  BUL
        ==
      [SRC +>.$(NUM +(NUM), JOB (~(PUT BY JOB) -.SRC +.SRC))]
    ::
    ++  DY-INIT-SOURCE-UNIT                             ::  (UNIT DOJO-SOURCE)
      |=  URC/(UNIT DOJO-SOURCE)
      ^+  [URC +>]
      ?~  URC  [~ +>]
      =^  SRC  +>  (DY-INIT-SOURCE U.URC)
      [`SRC +>.$]
    ::
    ++  DY-INIT-BUILD                                   ::  ++DOJO-BUILD
      |=  BUL/DOJO-BUILD
      ^+  [BUL +>]
      ?-    -.BUL
        $EX  [BUL +>.$]
        $DV  [BUL +>.$]
        $SA  [BUL +>.$]
        $AS  =^(MOR +>.$ (DY-INIT-SOURCE Q.BUL) [BUL(Q MOR) +>.$])
        $DO  =^(MOR +>.$ (DY-INIT-SOURCE Q.BUL) [BUL(Q MOR) +>.$])
        $GE  =^(MOD +>.$ (DY-INIT-MODEL P.BUL) [[%GE MOD] +>.$])
        $UR  [BUL +>.$]
        $TU  =^  DOF  +>.$
                 |-  ^+  [P.BUL +>.^$]
                 ?~  P.BUL  [~ +>.^$]
                 =^  DIS  +>.^$  (DY-INIT-SOURCE I.P.BUL)
                 =^  MOR  +>.^$  $(P.BUL T.P.BUL)
                 [[DIS MOR] +>.^$]
             [[%TU DOF] +>.$]
      ==
    ::
    ++  DY-INIT-MODEL                                   ::  ++DOJO-MODEL
      |=  MOL/DOJO-MODEL
      ^+  [MOL +>]
      =^  ONE  +>.$  (DY-INIT-SERVER P.MOL)
      =^  TWO  +>.$  (DY-INIT-CONFIG Q.MOL)
      [[ONE TWO] +>.$]
    ::
    ++  DY-INIT-SERVER                                  ::  ++DOJO-SERVER
      |=  SRV/DOJO-SERVER
      =.  P.SRV  NUM
      [SRV +>.$(NUM +(NUM), JOB (~(PUT BY JOB) NUM [%DV [%GEN Q.SRV]]))]
    ::
    ++  DY-INIT-CONFIG                                  ::  PREPARE CONFIG
      |=  CIG/DOJO-CONFIG
      ^+  [CIG +>]
      =^  ORD  +>.$  (DY-INIT-ORDERED P.CIG)
      =^  KEY  +>.$  (DY-INIT-NAMED Q.CIG)
      [[ORD KEY] +>.$]
    ::
    ++  DY-INIT-ORDERED                                 ::  (LIST DOJO-SOURCE)
      |=  ORD/(LIST DOJO-SOURCE)
      ^+  [ORD +>]
      ?~  ORD  [~ +>.$]
      =^  FIR  +>.$  (DY-INIT-SOURCE I.ORD)
      =^  MOR  +>.$  $(ORD T.ORD)
      [[FIR MOR] +>.$]
    ::
    ++  DY-INIT-NAMED                                   ::  (MAP @TAS DOJO-SRC)
      |=  KEY/(MAP TERM (UNIT DOJO-SOURCE))
      ^+  [KEY +>.$]
      ?~  KEY  [~ +>.$]
      =^  TOP  +>.$  (DY-INIT-SOURCE-UNIT Q.N.KEY)
      =^  LEF  +>.$  $(KEY L.KEY)
      =^  RIT  +>.$  $(KEY R.KEY)
      [[[P.N.KEY TOP] LEF RIT] +>.$]
    ::
    ++  DY-INIT                                         ::  FULL INITIALIZE
      ^+  .
      =^(DAM . (DY-INIT-COMMAND MAD) +(MAD DAM))
    ::
    ++  DY-HAND                                         ::  COMPLETE STEP
      |=  CAG/CAGE
      ^+  +>+>
      ?>  ?=(^ CUD)
      (DY-STEP(CUD ~, REZ (~(PUT BY REZ) P.U.CUD CAG)) +(P.U.CUD))
    ::
    ++  DY-MEAL                                         ::  VASE TO CAGE
      |=  VAX/VASE
      ?.  &(?=(@ -.Q.VAX) ((SANE %TAS) -.Q.VAX))
        ~&  %DY-MEAL-CAGE
        (DY-RASH %BEL ~)
      (DY-HAND -.Q.VAX (SLOT 3 VAX))
    ::
    ++  DY-MADE-EDIT                                    ::  SOLE EDIT
      |=  CAG/CAGE
      ^+  +>+>
      ?>  ?=(^ PER)
      ?:  ?|  ?=(^ Q.Q.CAG)
              =((LENT BUF.SAY) Q.Q.CAG)
              !&(?=($DEL -.U.PER) =(+(P.U.PER) (LENT BUF.SAY)))
          ==
        DY-ABET(PER ~)
      (DY-ERRD(PER ~) PER Q.Q.CAG)
    ::
    ++  DY-DONE                                         ::  DIALOG SUBMIT
      |=  TXT/TAPE
      ?:  |(?=(^ PER) ?=(^ PUX) ?=(~ PRO))
        ~&  %DY-NO-PROMPT
        (DY-DIFF %BEL ~)
      (DY-SLAM /DIAL U.PRO !>(TXT))
    ::
    ++  DY-CAST
      |*  {TYP/_* BUN/VASE}
      |=  A/VASE  ^-  TYP
      ~|  [P.BUN P.A]
      ?>  (~(NEST UT P.BUN) & P.A)
      ;;(TYP Q.A)
    ::
    ++  DY-OVER                                         ::  FINISH CONSTRUCTION
      ^+  +>
      ::  XX NEEDS FILTER
      ::
      :: ?:  ?=({$SHOW $3} -.MAD)
      ::  (DY-RASH %TAN (DY-SHOW-SOURCE Q.MAD) ~)       ::  XX SEPARATE COMMAND
      ?:  ?=($BREV -.MAD)
        =.  VAR  (~(DEL BY VAR) P.MAD)
        =<  DY-AMOK
        ?+  P.MAD  .
          $?($ENY $NOW $OUR)  !!
          $LIB  .(LIB ~)
          $SUR  .(SUR ~)
          $DIR  .(DIR [[OUR.HID %HOME UD+0] /])
        ==
      =+  CAY=(~(GOT BY REZ) P.Q.MAD)
      ?-    -.P.MAD
          $VERB
        =.  VAR  (~(PUT BY VAR) P.P.MAD CAY)
        ~|  BAD-SET+[P.P.MAD P.Q.CAY]
        =<  DY-AMOK
        ?+  P.P.MAD  .
            $ENY  ~|(%ENTROPY-IS-ETERNAL !!)
            $NOW  ~|(%TIME-IS-IMMUTABLE !!)
            $OUR  ~|(%SELF-IS-IMMUTABLE !!)
            $LIB
          %_    .
              LIB
            ((DY-CAST (LIST CABLE:FORD) !>(*(LIST CABLE:FORD))) Q.CAY)
          ==
        ::
            $SUR
          %_    .
              SUR
            ((DY-CAST (LIST CABLE:FORD) !>(*(LIST CABLE:FORD))) Q.CAY)
          ==
        ::
            $DIR  =+  ^=  PAX  ^-  PATH
                      =+  PAX=((DY-CAST PATH !>(*PATH)) Q.CAY)
                      ?:  ?=(~ PAX)  ~[(SCOT %P OUR.HID) %HOME '0']
                      ?:  ?=({@ ~} PAX)  ~[I.PAX %HOME '0']
                      ?:  ?=({@ @ ~} PAX)  ~[I.PAX I.T.PAX '0']
                      PAX
                  =.  DIR  (NEED (DE-BEAM:FORMAT PAX))
                  =-  +>(..DY (HE-DIFF %TAN - ~))
                  ROSE+[" " `~]^~[LEAF+"=%" (SMYT (EN-BEAM:FORMAT HE-BEAK S.DIR))]
        ==
      ::
          $POKE
        %-  HE-CARD(POY ~)
        :*  %DEAL
            /POKE
            [OUR.HID P.P.P.MAD]
            Q.P.P.MAD
            %POKE
            CAY
        ==
      ::
          $FILE
        %-  HE-CARD(POY ~)  :*
          %INFO
          /FILE
          (FOAL:SPACE:USERLIB (EN-BEAM:FORMAT P.P.MAD) CAY)
        ==
      ::
          $FLAT
        ?^  Q.Q.CAY
          (DY-RASH %TAN [%LEAF "NOT AN ATOM"]~)
        (DY-RASH %SAV P.P.MAD Q.Q.CAY)
      ::
          $PILL
        (DY-RASH %SAG P.P.MAD Q.Q.CAY)
      ::
          $HTTP
        ?>  ?=($MIME P.CAY)
        =+  MIM=;;(MIME Q.Q.CAY)
        =+  MAF=(~(ADD JA *MATH:EYRE) %CONTENT-TYPE (EN-MITE:MIMES:HTML P.MIM))
        (DY-EYRE /SHOW Q.P.MAD [R.P.MAD P.P.MAD MAF ~ Q.MIM])
      ::
          $SHOW
        |^  (PRNT CAY NOTE)
        ++  PRNT  ?:  (GTE P.P.MAD 4)
                    DY-XPRINT
                  DY-PRINT
        ++  NOTE  ^-  TANG
                  ?-  P.P.MAD
                    %0  ~
                    %1  [[%ROSE [~ "  " ~] (SKOL P.Q.CAY) ~] MAAR]
                    ::  XX  ACTUALLY PRINT SOMETHING MEANINGFUL HERE
                    ::
                    %2  [[%ROSE [~ "  " ~] *TANK ~] MAAR]
                    %3  ~
                    %4  ~
                    %5  [[%ROSE [~ "  " ~] (XSKOL P.Q.CAY) ~] MAAR]
                  ==
        ++  MAAR  ?:  =(%NOUN P.CAY)  ~
                  [[%ROSE [~ "    " ~] >P.CAY< ~] ~]
        --
      ==
    ::
    ++  DY-SHOW  |=(CAY/CAGE (DY-PRINT CAY ~))
    ::
    ::  PRINT A VALUE (GIVEN AS A CAGE) AND A NOTE (GIVEN AS A TANG).
    ::
    ++  DY-XPRINT
      |=  {CAY/CAGE TAN/TANG}
      %+  DY-RASH  %TAN
      %-  WELP  :_  TAN
      ?+  P.CAY  [(XSELL Q.CAY)]~
        $TANG  ;;(TANG Q.Q.CAY)
        $HTTR
          =+  HIT=;;(HTTR:EYRE Q.Q.CAY)
          =-  (FLOP (TURN `WALL`- |=(A/TAPE LEAF+(DASH:US A '' ~))))
          :-  "HTTP {<P.HIT>}"
          %+  WELD
            (TURN Q.HIT |=({A/@T B/@T} "{(TRIP A)}: {(TRIP B)}"))
          :-  I=""
          T=(TURN `WAIN`?~(R.HIT ~ (TO-WAIN:FORMAT Q.U.R.HIT)) TRIP)
      ==
    ::
    ::  PRINT A VALUE (GIVEN AS A CAGE) AND A NOTE (GIVEN AS A TANG).
    ::
    ++  DY-PRINT
      |=  {CAY/CAGE TAN/TANG}
      %+  DY-RASH  %TAN
      %-  WELP  :_  TAN
      ?+  P.CAY  [(SELL Q.CAY)]~
        $TANG  ;;(TANG Q.Q.CAY)
        $HTTR
          =+  HIT=;;(HTTR:EYRE Q.Q.CAY)
          =-  (FLOP (TURN `WALL`- |=(A/TAPE LEAF+(DASH:US A '' ~))))
          :-  "HTTP {<P.HIT>}"
          %+  WELD
            (TURN Q.HIT |=({A/@T B/@T} "{(TRIP A)}: {(TRIP B)}"))
          :-  I=""
          T=(TURN `WAIN`?~(R.HIT ~ (TO-WAIN:FORMAT Q.U.R.HIT)) TRIP)
      ==
    ::
    ++  DY-EDIT                                         ::  HANDLE EDIT
      |=  CAL/SOLE-CHANGE
      ^+  +>+>
      =^  DAT  SAY  (~(TRANSCEIVE SOLE SAY) CAL)
      ?:  |(?=(^ PER) ?=(^ PUX) ?=(~ PRO))
        ~&  %DY-EDIT-BUSY
        =^  LIC  SAY  (~(TRANSMIT SOLE SAY) DAT)
        (DY-DIFF %MOR [%DET LIC] [%BEL ~] ~)
      (DY-SLAM(PER `DAT) /EDIT U.PRO !>((TUFA BUF.SAY)))
    ::
    ++  DY-TYPE                                         ::  SOLE ACTION
      |=  ACT/SOLE-ACTION
      ?-  -.ACT
        $DET  (DY-EDIT +.ACT)
        $RET  (DY-DONE (TUFA BUF.SAY))
        $CLR  DY-STOP
      ==
    ::
    ++  DY-CAGE       |=(NUM/@UD (~(GOT BY REZ) NUM))   ::  KNOWN CAGE
    ++  DY-VASE       |=(NUM/@UD Q:(DY-CAGE NUM))       ::  KNOWN VASE
    ++  DY-SILK-VASE  |=(VAX/VASE [%$ %NOUN VAX])       ::  VASE TO SILK
    ++  DY-SILK-SOURCES                                 ::  ARGLIST TO SILK
      |=  SRC/(LIST DOJO-SOURCE)
      ^-  SCHEMATIC:FORD
      ::
      :+  %$  %NOUN
      |-
      ?~  SRC  !>(~)
      (SLOP (DY-VASE P.I.SRC) $(SRC T.SRC))
    ::
    ++  DY-SILK-CONFIG                                  ::  CONFIGURE
      |=  {CAY/CAGE CIG/DOJO-CONFIG}
      ^-  [WIRE SCHEMATIC:FORD]
      ?.  (~(NEST UT [%CELL [%ATOM %$ ~] %NOUN]) | P.Q.CAY)
        ::
        ::  NAKED GATE
        ::
        ?.  &(?=({* ~} P.CIG) ?=(~ Q.CIG))
          ~|(%ONE-ARGUMENT !!)
        :-  /NOUN
        :+  %CALL  [%$ %NOUN Q.CAY]
        [%$ %NOUN (DY-VASE P.I.P.CIG)]
      ::
      ::  NORMAL GENERATOR
      ::
      :-  ?+  -.Q.Q.CAY  ~|(%BAD-GEN ~_((SELL (SLOT 2 Q.CAY)) !!))
            $SAY  /GENT
            $ASK  /DIAL
            $GET  /SCAR
          ==
      =+  GAT=(SLOT 3 Q.CAY)
      :+  %CALL  [%$ %NOUN GAT]
      :+  [%$ %NOUN !>([NOW=NOW.HID ENY=ENY.HID BEC=HE-BEAK])]
        (DY-SILK-SOURCES P.CIG)
      :+  %MUTE  [%$ %NOUN (FALL (SLEW 27 GAT) !>(~))]
      ^-  (LIST [WING SCHEMATIC:FORD])
      %+  TURN  ~(TAP BY Q.CIG)
      |=  {A/TERM B/(UNIT DOJO-SOURCE)}
      ^-  [WING SCHEMATIC:FORD]
      :-  [A ~]
      :+  %$  %NOUN
      ?~(B !>([~ ~]) (DY-VASE P.U.B))
    ::
    ++  DY-HOON-HEAD                                    ::  DYNAMIC STATE
      ::  TODO: HOW DO I SEPARATE THE TOPLEVEL 'DOJO STATE' COMMENT?
      ::  DOJO STATE
      ::
      ::  OUR: THE NAME OF THIS URBIT
      ::  NOW: THE CURRENT TIME
      ::  ENY: A PIECE OF RANDOM ENTROPY
      ::
      ^-  CAGE
      :-  %NOUN
      =+  SLOOP=|=({A/VASE B/VASE} ?:(=(*VASE A) B ?:(=(*VASE B) A (SLOP A B))))
      %+  SLOOP
        %-  ~(REP BY VAR)
        |=  {{A/TERM @ B/VASE} C/VASE}  ^-  VASE
        (SLOOP B(P FACE+[A P.B]) C)
      !>([OUR=OUR NOW=NOW ENY=ENY]:HID)
    ::
    ++  DY-MADE-DIAL                                    ::  DIALOG PRODUCT
      |=  CAG/CAGE
      ^+  +>+>
      ?.  ?=(^ Q.Q.CAG)
        (DY-ERRD ~ Q.Q.CAG)
      =+  TAN=((LIST TANK) +2.Q.Q.CAG)
      =.  +>+>.$  (HE-DIFF %TAN TAN)
      =+  VAX=(SPED (SLOT 3 Q.CAG))
      ?+    -.Q.VAX  !!
          %&
        ?~  +.Q.VAX
          ~&  %DY-MADE-DIAL-ABORT
          (DY-RASH %BEL ~)
        (DY-MEAL (SLOT 7 VAX))
      ::
          %|
        =<  HE-PONE
        %-  DY-DIFF(PRO `(SLAP (SLOT 7 VAX) [%LIMB %Q]))
        =+  POM=(SOLE-PROMPT +<.Q.VAX)
        [%PRO POM(CAD [':' ' ' CAD.POM])]
      ==
    ::
    ++  DY-MADE-SCAR                                    ::  SCRAPER PRODUCT
      |=  CAG/CAGE
      ^+  +>+>
      ?.  ?=(^ Q.Q.CAG)
        (DY-ERRD ~ Q.Q.CAG)
      =+  TAN=((LIST TANK) +2.Q.Q.CAG)
      =.  +>+>.$  (HE-DIFF %TAN TAN)
      =+  VAX=(SPED (SLOT 3 Q.CAG))
      ~_  (SELL Q.CAG)
      ?+    -.Q.VAX  !!
          %&
        ?~  +.Q.VAX
          ~&  %DY-MADE-SCAR-ABORT
          (DY-RASH %BEL ~)
        (DY-MEAL (SLOT 7 VAX))
      ::
          %|
        =>  .(VAX (SLAP VAX !,(*HOON ?>(?=(%| -) .))))  :: XX WORKING SPED  #72
        =+  TYP={%| (UNIT KNOT) HISS:EYRE *}
        =+  [* USR HIZ *]=((DY-CAST TYP !>($:TYP)) VAX)
        =.  ..DY  (HE-DIFF %TAN LEAF+"< {(EN-PURL:HTML P.HIZ)}" ~)
        (DY-EYRE(PRO `(SLAP (SLOT 15 VAX) LIMB+%R)) /SCAR USR HIZ)
      ==
    ::
    ++  DY-SIGH-SCAR                                    ::  SCRAPER RESULT
      |=  DAT/CAGE
      ?~  PRO
        ~&  %DY-NO-SCRAPER
        (DY-SHOW DAT)
      (DY-SLAM(PUX ~) /SCAR U.PRO Q.DAT)
    ::
    ++  DY-MADE-GENT                                    ::  GENERATOR PRODUCT
      |=  CAG/CAGE
      (DY-MEAL Q.CAG)
    ::
    ++  DY-MADE-NOUN                                    ::  GENERATOR PRODUCT
      |=  CAG/CAGE
      (DY-HAND %NOUN Q.CAG)
    ::
    ++  DY-MAKE                                         ::  BUILD STEP
      ^+  +>
      ?>  ?=(^ CUD)
      =+  BIL=Q.U.CUD                 ::  XX =*
      ?:  ?=($UR -.BIL)
        (DY-EYRE /HAND P.BIL [Q.BIL %GET ~ ~])
      %-  DY-FORD
      ^-  [PATH SCHEMATIC:FORD]
      ?-  -.BIL
        $GE  (DY-SILK-CONFIG (DY-CAGE P.P.P.BIL) Q.P.BIL)
        $DV  [/HAND [%CORE [HE-DISC (WELD /HOON (FLOP P.BIL))]]]
        $EX  [/HAND (DY-MARE P.BIL)]
        $SA  [/HAND [%BUNT HE-DISC P.BIL]]
        $AS  [/HAND [%CAST HE-DISC P.BIL [%$ (DY-CAGE P.Q.BIL)]]]
        $DO  [/HAND [%CALL (DY-MARE P.BIL) [%$ (DY-CAGE P.Q.BIL)]]]
        $TU  :-  /HAND
             :+  %$  %NOUN
             |-  ^-  VASE
             ?~  P.BIL  !!
             =+  HED=(DY-VASE P.I.P.BIL)
             ?~  T.P.BIL  HED
             (SLOP HED $(P.BIL T.P.BIL))
      ==
    ::
    ++  DY-HOON-MARK                                    ::  XX ARCHITECT
      =+  ^=  OPE
          |=  GEN/HOON  ^-  HOON
          ?:  ?=(?($SGLD $SGBN) -.GEN)
            $(GEN Q.GEN)
          =+  ~(OPEN AP GEN)
          ?.(=(GEN -) $(GEN -) GEN)
      |=  GEN/HOON  ^-  (UNIT MARK)
      =.  GEN  (OPE GEN)
      ?:  ?=({$CNTS {@ ~} ~} GEN)
        (BIND (~(GET BY VAR) I.P.GEN) HEAD)
      ~
    ::
    ++  DY-MARE                                         ::  BUILD EXPRESSION
      |=  GEN/HOON
      ^-  SCHEMATIC:FORD
      =+  TOO=(DY-HOON-MARK GEN)
      =-  ?~(TOO - [%CAST HE-DISC U.TOO -])
      :+  %RIDE  GEN
      :-  [%$ DY-HOON-HEAD]
      :^  %PLAN  HE-RAIL  `COIN`BLOB+**
      `SCAFFOLD:FORD`[HE-RAIL ZUSE SUR LIB ~ ~]
    ::
    ++  DY-STEP                                         ::  ADVANCE PROJECT
      |=  NEX/@UD
      ^+  +>+>
      ?>  ?=(~ CUD)
      ?:  =(NEX NUM)
        DY-OVER
      DY-MAKE(CUD `[NEX (~(GOT BY JOB) NEX)])
    --
  ::
  ++  HE-DOPE
    |=  TXT/TAPE                                        ::
    ^-  (EACH (UNIT (EACH DOJO-COMMAND TAPE)) HAIR)     ::  PREFIX+RESULT
    =+  LEN=+((LENT TXT))                               ::  LINE LENGTH
    =.  TXT  (WELD BUF `TAPE`(WELD TXT "\0A"))          ::
    =+  VEX=((FULL PARSE-COMMAND-LINE:HE-PARSER) [1 1] TXT)
    ?:  =(Q.P.VEX LEN)                                  ::  MATCHED TO LINE END
      [%& ~]                                            ::
    ?:  =(P.P.VEX +((LENT (SKIM TXT |=(A/@ =(10 A)))))) ::  PARSED ALL LINES
      [%& ~ ?~(Q.VEX [%| TXT] [%& P.U.Q.VEX])]          ::  NEW BUFFER+COMPLETE
    [%| P.P.VEX (DEC Q.P.VEX)]                          ::  SYNTAX ERROR
  ::
  ++  HE-DUKE                                           ::  ++HE-DOPE VARIANT
    |=  TXT/TAPE
    ^-  (EACH (UNIT (EACH DOJO-COMMAND TAPE)) @UD)
    =+  FOY=(HE-DOPE TXT)
    ?-  -.FOY
      %|  [%| Q.P.FOY]
      %&  [%& P.FOY]
    ==
  ::
  ++  HE-ABET                                           ::  RESOLVE
    [(FLOP MOZ) %_(+> HOC (~(PUT BY HOC) OST.HID +<+))]
  ::
  ++  HE-ABUT                                           ::  DISCARD
    =>  HE-STOP
    [(FLOP MOZ) %_(+> HOC (~(DEL BY HOC) OST.HID))]
  ::
  ++  HE-CARD                                           ::  EMIT GIFT
    |=  CAD/CARD
    ^+  +>
    %_(+> MOZ [[OST.HID CAD] MOZ])
  ::
  ++  HE-SEND
    |=  {WAY/WIRE HIM/SHIP DAP/TERM COP/CLAP}
    ^+  +>
    (HE-CARD %SEND WAY [HIM DAP] COP)
  ::
  ++  HE-DIFF                                           ::  EMIT UPDATE
    |=  FEC/SOLE-EFFECT
    ^+  +>
    (HE-CARD %DIFF %SOLE-EFFECT FEC)
  ::
  ++  HE-STOP                                           ::  ABORT WORK
    ^+  .
    ?~(POY . ~(DY-STOP DY U.POY))
  ::
  ++  HE-PEER                                           ::  SUBSCRIBE TO
    |=(PAX/PATH ?>(=(~ PAX) HE-PROM))
  ::
  ++  HE-PINE                                           ::  RESTORE PROMPT
    ^+  .
    ?^  POY  .
    HE-PROM:HE-PONE
  ::
  ++  HE-ERRD                                           ::  REJECT UPDATE
    |=  {REV/(UNIT SOLE-EDIT) ERR/@U}  ^+  +>
    =+  RED=(FALL REV [%NOP ~])       ::  REQUIRED FOR ERROR LOCATION SYNC
    =^  LIC  SAY  (~(TRANSMIT SOLE SAY) RED)
    (HE-DIFF %MOR [%DET LIC] [%ERR ERR] ~)
  ::
  ++  HE-PONE                                           ::  CLEAR PROMPT
    ^+  .
    =^  CAL  SAY  (~(TRANSMIT SOLE SAY) [%SET ~])
    (HE-DIFF %MOR [%DET CAL] ~)
  ::
  ++  HE-PROW                                           ::  WHERE WE ARE
    ^-  TAPE
    ?:  &(=(OUR.HID P.DIR) =(%HOME Q.DIR) =([%UD 0] R.DIR) =(~ S.DIR))  ~
    %+  WELD
      ?:  &(=(OUR.HID P.DIR) =([%UD 0] R.DIR))
        (WELD "/" (TRIP Q.DIR))
      ;:  WELD
        "/"  ?:(=(OUR.HID P.DIR) "=" (SCOW %P P.DIR))
        "/"  ?:(=(%HOME Q.DIR) "=" (TRIP Q.DIR))
        "/"  ?:(=([%UD 0] R.DIR) "=" (SCOW R.DIR))
      ==
    ?:(=(~ S.DIR) "" (SPUD (FLOP S.DIR)))
  ::
  ++  HE-PROM                                           ::  SEND PROMPT
    %-  HE-DIFF
    :-  %PRO
    [& %$ (WELD HE-PROW ?~(BUF "> " "< "))]
  ::
  ++  HE-MADE                                           ::  RESULT FROM FORD
    |=  $:  WAY=WIRE
            DATE=@DA
            $=  RESULT
            $%  [%COMPLETE BUILD-RESULT=BUILD-RESULT:FORD]
                [%INCOMPLETE =TANG]
        ==  ==
    ^+  +>
    ?>  ?=(^ POY)
    =<  HE-PINE
    ?-    -.RESULT
        %INCOMPLETE
      (HE-DIFF(POY ~) %TAN TANG.RESULT)
    ::
        %COMPLETE
      ?-    -.BUILD-RESULT.RESULT
          ::
          %SUCCESS
        ::
        %.  (RESULT-TO-CAGE:FORD BUILD-RESULT.RESULT)
        =+  DYE=~(. DY U.POY(PUX ~))
        ?+  WAY  !!
          {$HAND ~}  DY-HAND:DYE
          {$DIAL ~}  DY-MADE-DIAL:DYE
          {$GENT ~}  DY-MADE-GENT:DYE
          {$NOUN ~}  DY-MADE-NOUN:DYE
          {$SCAR ~}  DY-MADE-SCAR:DYE
          {$EDIT ~}  DY-MADE-EDIT:DYE
        ==
      ::
          %ERROR
        (HE-DIFF(POY ~) %TAN MESSAGE.BUILD-RESULT.RESULT)
    ==  ==
  ::
  ++  HE-SIGH                                           ::  RESULT FROM EYRE
    |=  {WAY/WIRE HIT/HTTR:EYRE}
    ^+  +>
    ?>  ?=(^ POY)
    =<  HE-PINE
    %.  [%HTTR !>(HIT)]
    =+  DYE=~(. DY U.POY(PUX ~))
    ?+  WAY  !!
      {$HAND ~}  DY-HAND:DYE
      {$SHOW ~}  DY-SHOW:DYE
      {$SCAR ~}  DY-SIGH-SCAR:DYE
    ==
  ::
  ++  HE-UNTO                                           ::  RESULT FROM BEHN
    |=  {WAY/WIRE CIT/CUFT:GALL}
    ^+  +>
    ?.  ?=($COUP -.CIT)
      ~&  [%STRANGE-UNTO CIT]
      +>
    ?~  P.CIT
      (HE-DIFF %TXT ">=")
    (HE-DIFF %TAN U.P.CIT)
  ::
  ++  HE-LENS
    |=  COM/COMMAND:LENS
    ^+  +>
    =+  ^-  SOURCE/DOJO-SOURCE
        =|  NUM/@
        =-  ?.  ?=($SEND-API -.SINK.COM)  ::  XX  NUM IS INCORRECT
              SOR
            :-  0
            :+  %AS  `MARK`(CAT 3 API.SINK.COM '-POKE')
            :-  1
            :+  %DO
              ^-  HOON
              :+  %BRTR  [%BASE %NOUN]
              :^  %CLLS  [%ROCK %TAS %POST]
                [%ROCK %$ ENDPOINT.SINK.COM]
              [%CNTS [%& 6]~ ~]
            SOR
        ^=  SOR
        |-  ^-  DOJO-SOURCE
        :-  NUM
        ?-    -.SOURCE.COM
            $DATA        [%EX %SAND %T DATA.SOURCE.COM]
            $DOJO
          %+  RASH  COMMAND.SOURCE.COM
          (IFIX [(PUNT GAP) (PUNT GAP)] PARSE-BUILD:HE-PARSER)
        ::
            $CLAY
          :-  %EX
          ^-  HOON
          :+  %DTKT
            [%BASE %NOUN]
          :+  %CLHP
            [%ROCK %TAS %CX]
          %+  RASH  PAX.SOURCE.COM
          ROOD:(VANG | /(SCOT %P OUR.HID)/HOME/(SCOT %DA NOW.HID))
        ::
            $URL         [%UR `~. URL.SOURCE.COM]
            $API         !!
            $GET-API
          :-  %EX
          ^-  HOON
          :+  %DTKT
            [%LIKE ~[%JSON] ~]
          :*  %CLSG
              [%ROCK %TAS %GX]
              [%SAND %TA (SCOT %P OUR.HID)]
              [%SAND %TAS API.SOURCE.COM]
              [%SAND %TA (SCOT %DA NOW.HID)]
              (TURN ENDPOINT.SOURCE.COM |=(A/@T [%SAND %TA A]))
          ==
        ::
            $LISTEN-API  !!
            $AS
          :*  %AS  MAR.SOURCE.COM
              $(NUM +(NUM), SOURCE.COM NEXT.SOURCE.COM)
          ==
        ::
            $HOON
          :*  %DO
              %+  RASH  CODE.SOURCE.COM
              TALL:(VANG | /(SCOT %P OUR.HID)/HOME/(SCOT %DA NOW.HID))
              $(NUM +(NUM), SOURCE.COM NEXT.SOURCE.COM)
          ==
        ::
            $TUPLE
          :-  %TU
          |-  ^-  (LIST DOJO-SOURCE)
          ?~  NEXT.SOURCE.COM
            ~
          =.  NUM  +(NUM)
          :-  ^$(SOURCE.COM I.NEXT.SOURCE.COM)
          $(NEXT.SOURCE.COM T.NEXT.SOURCE.COM)
        ==
    =+  |-  ^-  SINK/DOJO-SINK
        ?-  -.SINK.COM
          $STDOUT       [%SHOW %0]
          $OUTPUT-FILE  $(SINK.COM [%COMMAND (CAT 3 '@' PAX.SINK.COM)])
          $OUTPUT-PILL  $(SINK.COM [%COMMAND (CAT 3 '.' PAX.SINK.COM)])
          $OUTPUT-CLAY  [%FILE (NEED (DE-BEAM:FORMAT PAX.SINK.COM))]
          $URL          [%HTTP %POST `~. URL.SINK.COM]
          $TO-API       !!
          $SEND-API     [%POKE OUR.HID API.SINK.COM]
          $COMMAND      (RASH COMMAND.SINK.COM PARSE-SINK:HE-PARSER)
          $APP          [%POKE OUR.HID APP.SINK.COM]
        ==
    (HE-PLAN SINK SOURCE)
  ::
  ++  HE-LIKE                                           ::  ACCEPT LINE
    |=  BUF/(LIST @C)
    =(%& -:(HE-DOPE (TUFA BUF)))
  ::
  ++  HE-STIR                                           ::  APPLY CHANGE
    |=  CAL/SOLE-CHANGE
    ^+  +>
    ::  ~&  [%HIS-CLOCK LER.CAL]
    ::  ~&  [%OUR-CLOCK VEN.SAY]
    =^  DAT  SAY  (~(TRANSCEIVE SOLE SAY) CAL)
    ?.  ?&  ?=($DEL -.DAT)
            =(+(P.DAT) (LENT BUF.SAY))
        ==
      +>.$
    =+  FOY=(HE-DOPE (TUFA BUF.SAY))
    ?:  ?=(%& -.FOY)  +>.$
    ::  ~&  [%BAD-CHANGE DAT TED.CAL]
    ::  ~&  [%OUR-LEG LEG.SAY]
    (HE-ERRD `DAT Q.P.FOY)
  ::
  ++  HE-PLAN                                           ::  EXECUTE COMMAND
    |=  MAD/DOJO-COMMAND
    ^+  +>
    ?>  ?=(~ POY)
    HE-PINE:(DY-STEP:~(DY-INIT DY %*(. *DOJO-PROJECT MAD MAD)) 0)
  ::
  ++  HE-DONE                                           ::  PARSE COMMAND
    |=  TXT/TAPE
    ^+  +>
    ?~  TXT
      =<  HE-PROM(BUF ~)
      %-  HE-DIFF
      :~  %MOR
          [%TXT "> "]
          [%NEX ~]
      ==
    =+  DOY=(HE-DUKE TXT)
    ?-    -.DOY
        %|  (HE-ERRD ~ P.DOY)
        %&
      ?~  P.DOY
        (HE-ERRD ~ (LENT TXT))
      =+  OLD=(WELD ?~(BUF "> " "  ") (TUFA BUF.SAY))
      =^  CAL  SAY  (~(TRANSMIT SOLE SAY) [%SET ~])
      =.  +>.$   (HE-DIFF %MOR TXT+OLD NEX+~ DET+CAL ~)
      ?-  -.U.P.DOY
        %&  (HE-PLAN(BUF ~) P.U.P.DOY)
        %|  HE-PROM(BUF P.U.P.DOY)
      ==
    ==
  ::
  ++  HE-TYPE                                           ::  APPLY INPUT
    |=  ACT/SOLE-ACTION
    ^+  +>
    ?^  POY
      HE-PINE:(~(DY-TYPE DY U.POY) ACT)
    ?-  -.ACT
      $DET  (HE-STIR +.ACT)
      $RET  (HE-DONE (TUFA BUF.SAY))
      $CLR  HE-PINE(BUF "")
    ==
  ::
  ++  HE-LAME                                           ::  HANDLE ERROR
    |=  {WUT/TERM WHY/TANG}
    ^+  +>
    %-  (SLOG (FLOP `TANG`[>%DOJO-LAME WUT< WHY]))
    ?^  POY
      HE-PINE:~(DY-AMOK DY U.POY)
    HE-PINE                           ::  XX GIVE MEAN TO ORIGINAL KEYSTROKE
  --
::
++  PREP
  |=  OLD/(UNIT HOUSE)
  ^+  [~ ..PREP]
  ?~  OLD  `..PREP
  `..PREP(+<+ U.OLD)
::
::  PATTERN:  ++  FOO  |=(DATA HE-ABET:(~(HE-FOO HE (~(GOT BY HOC) OST)) DATA))
++  ARM  (ARM-SESSION ~ (~(GOT BY HOC) OST.HID))
++  ARM-SESSION
  |=  {MOZ/(LIST MOVE) SES/SESSION}
  =>  ~(. HE MOZ SES)
  =-  [WRAP=- +]
  =+  HE-ARM=HE-TYPE
  |@  ++  $
        |:  +<.HE-ARM
        ^-  (QUIP MOVE _..HE)
        HE-ABET:(HE-ARM +<)
  --
::
++  PEER-SOLE
  ~?  !=(OUR.HID SRC.HID)  [%DOJO-PEER-STRANGER OST.HID SRC.HID]
  ?>  (TEAM:TITLE OUR.HID SRC.HID)
  =^  MOZ  .
    ?.  (~(HAS BY HOC) OST.HID)  [~ .]
    ~&  [%DOJO-PEER-REPLACED OST.HID]
    ~(HE-ABUT HE ~ (~(GOT BY HOC) OST.HID))
  =+  SES=%*(. *SESSION -.DIR [OUR.HID %HOME UD+0])
  (WRAP HE-PEER):(ARM-SESSION MOZ SES)
::
++  POKE-SOLE-ACTION
  |=  ACT/SOLE-ACTION  ~|  POKE+ACT  %.  ACT
  (WRAP HE-TYPE):ARM
::
++  POKE-LENS-COMMAND
  |=  COM/COMMAND:LENS  ~|  POKE-LENS+COM  %.  COM
  (WRAP HE-LENS):ARM
::
++  POKE-JSON
  |=  JON=JSON
  ^-  [(LIST MOVE) _+>.$]
  ~&  JON=JON
  [~ +>.$]
::  +POKE-WIPE: CLEAR ALL DOJO SESSIONS
::
++  POKE-WIPE
  |=  *
  ^-  [(LIST MOVE) _+>.$]
  ~&  %DOJO-WIPE
  =.  HOC
    %-  ~(RUN BY HOC)
    |=  =SESSION
    %_  SESSION
      SUR  ~
      LIB  ~
      VAR  ~
      OLD  ~
    ==
  ::
  [~ +>.$]
::
++  MADE       (WRAP HE-MADE):ARM
++  SIGH-HTTR  (WRAP HE-SIGH):ARM
++  SIGH-TANG  |=({A/WIRE B/TANG} ~|(`TERM`(CAT 3 'SIGH-' -.A) (MEAN B)))
++  LAME       (WRAP HE-LAME):ARM
++  UNTO       (WRAP HE-UNTO):ARM
++  PULL
  |=  {PAX/PATH}
  ^-  (QUIP MOVE _+>)
  =^  MOZ  +>  ~(HE-ABUT HE ~ (~(GOT BY HOC) OST.HID))
  [MOZ +>.$(HOC (~(DEL BY HOC) OST.HID))]
--
