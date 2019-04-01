!:  ::  %GALL, AGENT EXECUTION
!?  163
::::
|=  PIT/VASE
=,  GALL
=>  =~
|%  ::::::::::::::::::::::::::::::::::::::::::::::::::::::    REST OF ARVO
    ::::::::::::::::::::::::::::::::::::::::::::::::::::::
++  VOLT  ?($LOW $HIGH)                                 ::  VOLTAGE
++  TORC  $@(?($IRON $GOLD) {$LEAD P/SHIP})             ::  SECURITY CONTROL
++  ROON                                                ::  REVERSE AMES MSG
  $%  {$D P/MARK Q/*}                                   ::  DIFF (DIFF)
      {$X ~}                                           ::
  ==                                                    ::
++  ROOK                                                ::  FORWARD AMES MSG
  $%  {$M P/MARK Q/*}                                   ::  MESSAGE
      {$L P/MARK Q/PATH}                                ::  "PEEL" SUBSCRIBE
      {$S P/PATH}                                       ::  SUBSCRIBE
      {$U ~}                                           ::  CANCEL+UNSUBSCRIBE
  ==                                                    ::
--                                                      ::
|%  ::::::::::::::::::::::::::::::::::::::::::::::::::::::    LOCAL ARVO
    ::::::::::::::::::::::::::::::::::::::::::::::::::::::
++  COTE                                                ::  ++AP NOTE
  $%  {$META P/@TAS Q/VASE}                             ::
      {$SEND P/SHIP Q/CUSH}                             ::
      {$HISS P/(UNIT KNOT) Q/MARK R/CAGE}               ::
  ==                                                    ::
++  COVE  (PAIR BONE (WIND COTE CUFT))                  ::  INTERNAL MOVE
++  MOVE  {P/DUCT Q/(WIND NOTE-ARVO GIFT-ARVO)}         ::  TYPED MOVE
--                                                      ::
|%  ::::::::::::::::::::::::::::::::::::::::::::::::::::::    %GALL STATE
    ::::::::::::::::::::::::::::::::::::::::::::::::::::::
++  AXLE-N  ?(AXLE)                                     ::  UPGRADE PATH
    ::::::::::::::::::::::::::::::::::::::::::::::::::::::  STATE PROPER
    ::::::::::::::::::::::::::::::::::::::::::::::::::::::
++  AXLE                                                ::  ALL STATE
  $:  $0                                                ::  STATE VERSION
      =MAST                                             ::  APPS BY SHIP
  ==                                                    ::
++  GEST                                                ::  SUBSCRIBER DATA
  $:  SUP/BITT                                          ::  INCOMING SUBSCRIBERS
      NEB/BOAT                                          ::  OUTGOING SUBSCRIBERS
      QEL/(MAP BONE @UD)                                ::  QUEUE METER
  ==                                                    ::
++  MAST                                                ::  SHIP STATE
  $:  MAK/*                                             ::  (DEPRECATED)
      SYS/DUCT                                          ::  SYSTEM DUCT
      SAP/(MAP SHIP SCAD)                               ::  FOREIGN CONTACTS
      BUM/(MAP DUDE SEAT)                               ::  RUNNING AGENTS
      WUB/(MAP DUDE SOFA)                               ::  WAITING QUEUE
  ==                                                    ::
++  FFUC                                                ::  NEW CUFF
    $:  P/(UNIT (SET SHIP))                             ::  DISCLOSING TO
        Q/SHIP                                          ::  ATTRIBUTED TO
    ==                                                  ::
++  PREY  (PAIR VOLT FFUC)                              ::  PRIVILEGE
++  SCAD                                                ::  FOREIGN CONNECTION
  $:  P/@UD                                             ::  INDEX
      Q/(MAP DUCT @UD)                                  ::  BY DUCT
      R/(MAP @UD DUCT)                                  ::  BY INDEX
  ==                                                    ::
++  SCAR                                                ::  OPAQUE INPUT
  $:  P/@UD                                             ::  BONE SEQUENCE
      Q/(MAP DUCT BONE)                                 ::  BY DUCT
      R/(MAP BONE DUCT)                                 ::  BY BONE
  ==                                                    ::
::                                                      ::
::  XX A HACK, REQUIRED TO BREAK A SUBSCRIPTION LOOP    ::
::  WHICH ARISES WHEN AN INVALID MARK CRASHES A DIFF.   ::
::  SEE USAGE IN AP-MISVALE.                            ::
++  MISVALE-DATA  (SET WIRE)                            ::  SUBSCRS W/ BAD MARKS
++  SEAT                                                ::  AGENT STATE
  $:  MISVALE/MISVALE-DATA                              ::  BAD REQS
      VEL/WORM                                          ::  CACHE
      ARMS=(MAP [TERM PATH] (UNIT (PAIR @UD TERM)))     ::  AP-FIND CACHE
      MOM/DUCT                                          ::  CONTROL DUCT
      LIV/?                                             ::  UNSTOPPED
      TOC/TORC                                          ::  PRIVILEGE
      TYC/STIC                                          ::  STATISTICS
      GED/GEST                                          ::  SUBSCRIBERS
      HAV/VASE                                          ::  RUNNING STATE
      BYK/BEAK                                          ::  UPDATE CONTROL
      PYL/(MAP BONE MARK)                               ::  REQ'D TRANSLATIONS
      ZAM/SCAR                                          ::  OPAQUE DUCTS
  ==                                                    ::
++  SOFA                                                ::  QUEUE FOR BLOCKED
  $:  KYS/(QEU (TREL DUCT PREY CLUB))                   ::  QUEUED KISSES
  ==                                                    ::
++  STIC                                                ::  STATISTICS
  $:  ACT/@UD                                           ::  CHANGE NUMBER
      ENY/@UVJ                                          ::  ENTROPY
      LAT/@DA                                           ::  TIME
  ==                                                    ::
--                                                      ::
    ::::::::::::::::::::::::::::::::::::::::::::::::::::::  VANE HEADER
    ::::::::::::::::::::::::::::::::::::::::::::::::::::::
.  ==
=|  ALL/AXLE                                            ::  ALL VANE STATE
|=  $:  OUR=SHIP                                        ::  IDENTITY
        NOW=@DA                                         ::  URBAN TIME
        ENY=@UVJ                                        ::  ENTROPY
        SKA=SLEY                                        ::  ACTIVATE
    ==                                                  ::  OPAQUE CORE
~%  %GALL-TOP  ..IS  ~
|%  ::::::::::::::::::::::::::::::::::::::::::::::::::::::  STATE MACHINE
    ::::::::::::::::::::::::::::::::::::::::::::::::::::::
++  MO
  ~%  %GALL-MO  +>  ~
  =*  MAS  MAST.ALL
  |_  $:  HEN=DUCT
          MOZ=(LIST MOVE)
      ==
  ++  MO-ABED                                           ::  INITIALIZE
    |=  =DUCT
    ^+  +>
    +>(HEN DUCT)
  ::
  ++  MO-ABET                                           ::  RESOLVE TO
    ^+  [*(LIST MOVE) +>+]
    :_  +>+
    %-  FLOP
    %+  TURN  MOZ
    |=  A/MOVE
    ?.  ?=($PASS -.Q.A)  A
    [P.A %PASS P.Q.A Q.Q.A]
  ::
  ++  MO-CONF                                           ::  CONFIGURE
    |=  {DAP/DUDE LUM/CULM}
    (MO-BOOT DAP P.P.LUM Q.P.LUM DA+NOW)
  ::
  ++  MO-PASS                                           ::  STANDARD PASS
    |=  {PAX/PATH NOH/NOTE-ARVO}
    %_(+> MOZ :_(MOZ [HEN %PASS PAX NOH]))
  ::
  ++  MO-GIVE
    |=  GIT/GIFT:ABLE
    %_(+> MOZ :_(MOZ [HEN %GIVE GIT]))
  ::
  ++  MO-OKAY                                           ::  VALID AGENT CORE
    ~/  %MO-OKAY
    |=  VAX/VASE
    ^-  ?
    =+  BOL=(SLEW 12 VAX)
    ?~  BOL  |
    (~(NEST UT P.U.BOL) %| -:!>(*BOWL))
  ::  +MO-RECEIVE-CORE: RECEIVES AN APP CORE BUILT BY FORD-TURBO
  ::
  ++  MO-RECEIVE-CORE
    ~/  %MO-RECEIVE-CORE
    |=  [DAP=DUDE BYK=BEAK MADE-RESULT=MADE-RESULT:FORD]
    ^+  +>
    ::
    ?:  ?=([%INCOMPLETE *] MADE-RESULT)
      (MO-GIVE %ONTO %| TANG.MADE-RESULT)
    ::
    =/  BUILD-RESULT  BUILD-RESULT.MADE-RESULT
    ::
    ?:  ?=([%ERROR *] BUILD-RESULT)
      (MO-GIVE %ONTO %| MESSAGE.BUILD-RESULT)
    ::
    =/  RESULT-CAGE=CAGE  (RESULT-TO-CAGE:FORD BUILD-RESULT)
    ::
    =/  APP-DATA=(UNIT SEAT)  (~(GET BY BUM.MAS) DAP)
    ?^  APP-DATA
      ::  UPDATE THE PATH
      ::
      =.  BUM.MAS  (~(PUT BY BUM.MAS) DAP U.APP-DATA(BYK BYK))
      ::  MAGIC UPDATE STRING FROM +MO-BOON, "COMPLETE OLD BOOT"
      ::
      AP-ABET:(AP-PEEP:(AP-ABED:AP DAP [%HIGH [~ OUR]]) Q.RESULT-CAGE)
    ::  FIRST INSTALL OF THE APP
    ::
    ?.  (MO-OKAY Q.RESULT-CAGE)
      (MO-GIVE %ONTO %| [%LEAF "{<DAP>}: BOGUS CORE"]~)
    =.  +>.$  (MO-BORN DAP BYK Q.RESULT-CAGE)
    =+  OLD=+>.$
    =+  WAG=(AP-PROP:(AP-ABED:AP DAP [%HIGH [~ OUR]]) ~)
    ?^  -.WAG
      =.  +>.$  OLD
      (MO-GIVE %ONTO %| U.-.WAG)
    =.  +>.$  AP-ABET:+.WAG
    (MO-GIVE:(MO-CLAW DAP) %ONTO %& DAP %BOOT NOW)
  ::
  ++  MO-BORN                                           ::  NEW SEAT
    |=  {DAP/DUDE BYK/BEAK HAV/VASE}
    =+  SAT=*SEAT
    %_    +>.$
        BUM.MAS
      %+  ~(PUT BY BUM.MAS)  DAP
      %_  SAT
        MOM  HEN
        BYK  BYK
        HAV  HAV
        P.ZAM  1
        Q.ZAM  [[[~ ~] 0] ~ ~]
        R.ZAM  [[0 [~ ~]] ~ ~]
      ==
    ==
  ::  +MO-BOOT: SENDS AN %EXEC TO FORD.
  ::
  ++  MO-BOOT                                           ::  CREATE SHIP
    |=  {DAP/DUDE BYK/BEAK}
    ^+  +>
    %+  MO-PASS  [%SYS %CORE DAP (SCOT %P P.BYK) Q.BYK (SCOT R.BYK) ~]
    ^-  NOTE-ARVO
    [%F %BUILD LIVE=%.Y [%CORE [[P Q]:BYK [%HOON DAP %APP ~]]]]
  ::
  ++  MO-AWAY                                           ::  FOREIGN REQUEST
    ~/  %MO-AWAY
    |=  {HIM/SHIP CAZ/CUSH}                             ::
    ^+  +>
    ::  ~&  [%MO-AWAY HIM CAZ]
    ?:  ?=($PUMP -.Q.CAZ)
      ::
      ::  YOU'D THINK THIS WOULD SEND AN ACK FOR THE DIFF
      ::  THAT CAUSED THIS PUMP.  IT WOULD, BUT WE ALREADY
      ::  SENT IT WHEN WE GOT THE DIFF IN ++MO-CYST.  THEN
      ::  WE'D HAVE TO SAVE THE NETWORK DUCT AND CONNECT IT
      ::  TO THIS RETURNING PUMP.
      ::
      +>
    ?:  ?=($PEER-NOT -.Q.CAZ)
      ::  SHORT CIRCUIT ERROR
      (MO-GIVE %UNTO %REAP (SOME P.Q.CAZ))
    =^  NUM  +>.$  (MO-BALE HIM)
    =+  ^=  ROC  ^-  ROOK
        ?-  -.Q.CAZ
          $POKE  [%M P.P.Q.CAZ Q.Q.P.Q.CAZ]
          $PULL  [%U ~]
          $PUFF  !!
          $PUNK  !!
          $PEEL  [%L P.Q.CAZ Q.Q.CAZ]
          $PEER  [%S P.Q.CAZ]
        ==
    %+  MO-PASS
      [%SYS %WAY -.Q.CAZ ~]
    `NOTE-ARVO`[%A %WANT HIM [%G %GE P.CAZ ~] [NUM ROC]]
  ::
  ++  MO-BAAL                                           ::  ERROR CONVERT A
    |=  ART/(UNIT ARES)
    ^-  ARES
    ?~(ART ~ ?~(U.ART `[%BLANK ~] U.ART))
  ::
  ++  MO-BABA                                           ::  ERROR CONVERT B
    |=  ARS/ARES
    ^-  (UNIT TANG)
    ?~  ARS  ~
    `[[%LEAF (TRIP P.U.ARS)] Q.U.ARS]
  ::
  ++  MO-AWED                                           ::  FOREIGN RESPONSE
    |=  {HIM/SHIP WHY/?($PEER $PEEL $POKE $PULL) ART/(UNIT ARES)}
    ^+  +>
    ::  ~&  [%MO-AWED HIM WHY ART]
    =+  TUG=(MO-BABA (MO-BAAL ART))
    ?-  WHY
      $PEEL  (MO-GIVE %UNTO %REAP TUG)
      $PEER  (MO-GIVE %UNTO %REAP TUG)
      $POKE  (MO-GIVE %UNTO %COUP TUG)
      $PULL  +>.$
    ==
  ::
  ++  MO-BALE                                           ::  ASSIGN OUTBONE
    |=  HIM/SHIP
    ^-  {@UD _+>}
    =+  SAD=(FALL (~(GET BY SAP.MAS) HIM) `SCAD`[1 ~ ~])
    =+  NOM=(~(GET BY Q.SAD) HEN)
    ?^  NOM  [U.NOM +>.$]
    :-  P.SAD
    %_    +>.$
        SAP.MAS
      %+  ~(PUT BY SAP.MAS)  HIM
      %_  SAD
        P  +(P.SAD)
        Q  (~(PUT BY Q.SAD) HEN P.SAD)
        R  (~(PUT BY R.SAD) P.SAD HEN)
      ==
    ==
  ::
  ++  MO-BALL                                           ::  OUTBONE BY INDEX
    |=  {HIM/SHIP NUM/@UD}
    ^-  DUCT
    (~(GOT BY R:(~(GOT BY SAP.MAS) HIM)) NUM)
  ::
  ++  MO-COME                                           ::  HANDLE LOCALLY
    |=  {HER/SHIP CAZ/CUSH}
    ^+  +>
    =+  PRY=`PREY`[%HIGH [~ HER]]
    (MO-CLUB P.CAZ PRY Q.CAZ)
  ::
  ++  MO-COUP                                           ::  BACK FROM MO-AWAY
    |=  {DAP/DUDE HIM/SHIP CUP/ARES}
    %^  MO-GIVE  %UNTO  %COUP
    ?~  CUP  ~
    [~ `TANG`[[%LEAF (TRIP P.U.CUP)] Q.U.CUP]]
  ::
  ++  MO-CHEW                                           ::  REVERSE BUILD PATH
    |=  PAX/PATH
    ^-  BEAK
    ?>  ?=({@ @ @ ~} PAX)
    [(SLAV %P I.PAX) I.T.PAX DA+(SLAV %DA I.T.T.PAX)]
  ::
  ++  MO-CYST                                           ::  TAKE IN /SYS
    ~/  %MO-CYST
    |=  {PAX/PATH SIH/SIGN-ARVO}
    ^+  +>
    ?+    -.PAX  !!
        $CORE
      ?>  ?=([%F %MADE *] SIH)
      ?>  ?=({@ @ @ @ ~} T.PAX)
      (MO-RECEIVE-CORE I.T.PAX (MO-CHEW T.T.PAX) RESULT.SIH)
    ::
        %PEL                                            ::  TRANSLATED PEER
      ?>  ?=({@ ~} T.PAX)
      =+  MAR=I.T.PAX
      ?>  ?=([%F %MADE *] SIH)
      ::
      ?:  ?=([%INCOMPLETE *] RESULT.SIH)
        (MO-GIVE %UNTO %COUP `TANG.RESULT.SIH)
      ::
      =/  BUILD-RESULT  BUILD-RESULT.RESULT.SIH
      ::
      ?:  ?=([%ERROR *] BUILD-RESULT)
        (MO-GIVE %UNTO %COUP `MESSAGE.BUILD-RESULT)
      ::
      (MO-GIVE %UNTO %DIFF (RESULT-TO-CAGE:FORD BUILD-RESULT))
    ::
        $RED                                            ::  DIFF ACK
      ?>  ?=({@ @ @ ~} T.PAX)
      ?.  ?=({$A $WOOT *} SIH)
        ~&  [%RED-WENT PAX]
        +>.$
      =+  :*  HIM=(SLAV %P I.T.PAX)
              DAP=I.T.T.PAX
              NUM=(SLAV %UD I.T.T.T.PAX)
          ==
      =>  .(PAX `PATH`[%REQ T.PAX])
      ?~  Q.+>.SIH
        (MO-PASS [%SYS PAX] %G %DEAL [HIM OUR] DAP %PUMP ~)
      :: SHOULD NOT HAPPEN (XX WAT MEAN?)
      ::
      %-  ?.  ?=([~ ~ %MACK *] Q.+>.SIH)
            ~&  [%DIFF-BAD-ACK Q.+>.SIH]
            SAME
          ~&  [%DIFF-BAD-ACK %MACK]
          (SLOG (FLOP Q.,.+>.Q.+>.SIH))
      =.  +>.$  (MO-PASS [%SYS PAX] %G %DEAL [HIM OUR] DAP %PULL ~)
      (MO-PASS [%SYS PAX] %A %WANT HIM [%G %GH DAP ~] [NUM %X ~])
    ::
        %REP                                            ::  REVERSE REQUEST
      ?>  ?=({@ @ @ ~} T.PAX)
      ?>  ?=([%F %MADE *] SIH)
      =+  :*  HIM=(SLAV %P I.T.PAX)
              DAP=I.T.T.PAX
              NUM=(SLAV %UD I.T.T.T.PAX)
          ==
      ::
      ?:  ?=([%INCOMPLETE *] RESULT.SIH)
        ::  "XX SHOULD CRASH"
        (MO-GIVE %MACK `TANG.RESULT.SIH)
      ::
      =/  BUILD-RESULT  BUILD-RESULT.RESULT.SIH
      ::
      ?:  ?=([%ERROR *] BUILD-RESULT)
        ::  "XX SHOULD CRASH"
        (MO-GIVE %MACK `MESSAGE.BUILD-RESULT)
      ::
      ::  "XX PUMP SHOULD ACK"
      =.  +>.$  (MO-GIVE %MACK ~)
      =*  RESULT-CAGE  (RESULT-TO-CAGE:FORD BUILD-RESULT)
      (MO-GIVE(HEN (MO-BALL HIM NUM)) %UNTO %DIFF RESULT-CAGE)
    ::
        $REQ                                            ::  INBOUND REQUEST
      ?>  ?=({@ @ @ ~} T.PAX)
      =+  :*  HIM=(SLAV %P I.T.PAX)
              DAP=I.T.T.PAX
              NUM=(SLAV %UD I.T.T.T.PAX)
          ==
      ?:  ?=({$F $MADE *} SIH)
        ?:  ?=([%INCOMPLETE *] RESULT.SIH)
          ::  "XX SHOULD CRASH"
          (MO-GIVE %MACK `TANG.RESULT.SIH)
        ::
        =/  BUILD-RESULT  BUILD-RESULT.RESULT.SIH
        ::
        ?:  ?=([%ERROR *] BUILD-RESULT)
          ::  "XX SHOULD CRASH"
          (MO-GIVE %MACK `MESSAGE.BUILD-RESULT)
        =/  CAY/CAGE  (RESULT-TO-CAGE:FORD BUILD-RESULT)
        (MO-PASS [%SYS PAX] %G %DEAL [HIM OUR] I.T.T.PAX %POKE CAY)
      ?:  ?=({$A $WOOT *} SIH)  +>.$                    ::  QUIT ACK, BORING
      ?>  ?=({$G $UNTO *} SIH)
      =+  CUF=`CUFT`+>.SIH
      ?-    -.CUF
        $COUP  (MO-GIVE %MACK P.CUF)
        $DIFF  %+  MO-PASS  [%SYS %RED T.PAX]
               [%A %WANT HIM [%G %GH DAP ~] [NUM %D P.P.CUF Q.Q.P.CUF]]
        $QUIT  %+  MO-PASS  [%SYS PAX]
               [%A %WANT HIM [%G %GH DAP ~] [NUM %X ~]]
        $REAP  (MO-GIVE %MACK P.CUF)
      ==
    ::
        %VAL                                            ::  INBOUND VALIDATE
      ?>  ?=({@ @ ~} T.PAX)
      =+  [HIM=(SLAV %P I.T.PAX) DAP=I.T.T.PAX]
      ?>  ?=([%F %MADE *] SIH)
      ::
      ?:  ?=([%INCOMPLETE *] RESULT.SIH)
        (MO-GIVE %UNTO %COUP `TANG.RESULT.SIH)
      ::
      =/  BUILD-RESULT  BUILD-RESULT.RESULT.SIH
      ::
      ?:  ?=([%ERROR *] BUILD-RESULT)
        (MO-GIVE %UNTO %COUP `MESSAGE.BUILD-RESULT)
      ::
      =*  RESULT-CAGE  (RESULT-TO-CAGE:FORD BUILD-RESULT)
      (MO-CLIP DAP `PREY`[%HIGH ~ HIM] [%POKE RESULT-CAGE])
    ::
        $WAY                                            ::  OUTBOUND REQUEST
      ?>  ?=({$A $WOOT *} SIH)
      ?>  ?=({@ ~} T.PAX)
      %-  MO-AWED
      :*  `SHIP`P.+>.SIH
          ;;(?($PEER $PEEL $POKE $PULL) I.T.PAX)
          +>+.SIH
      ==
    ==
  ::
  ++  MO-COOK                                           ::  TAKE IN /USE
    ~/  %MO-COOK
    |=  {PAX/PATH HIN/(HYPO SIGN-ARVO)}
    ^+  +>
    ?.  ?=({@ @ $?($INN $OUT $CAY) *} PAX)
      ~&  [%MO-COOK-BAD-PAX PAX]
      !!
    =+  DAP=`@TAS`I.PAX
    =+  PRY=`PREY`[%HIGH [~ (SLAV %P I.T.PAX)]]
    =+  PAP=(AP-ABED:AP DAP PRY)
    =+  VAX=(SLOT 3 `VASE`HIN)
    ?-  I.T.T.PAX
      $INN  AP-ABET:(AP-POUR:PAP T.T.T.PAX (SLOT 3 `VASE`HIN))
      $CAY  ?.  ?=({$E $SIGH *} Q.HIN)
              ~&  [%MO-COOK-WEIRD Q.HIN]
              ~&  [%MO-COOK-WEIRD-PATH PAX]
              +>.$
            AP-ABET:(AP-PURR:PAP +<.Q.HIN T.T.T.PAX +>.Q.HIN)
    ::
      $OUT  ?.  ?=({$G $UNTO *} Q.HIN)
              ~&  [%MO-COOK-WEIRD Q.HIN]
              ~&  [%MO-COOK-WEIRD-PATH PAX]
              +>.$
            AP-ABET:(AP-POUT:PAP T.T.T.PAX +>.Q.HIN)
    ==
  ::
  ++  MO-CLAW                                           ::  CLEAR QUEUE
    |=  DAP/DUDE
    ^+  +>
    ?.  (~(HAS BY BUM.MAS) DAP)  +>
    =+  SUF=(~(GET BY WUB.MAS) DAP)
    ?~  SUF  +>.$
    |-  ^+  +>.^$
    ?:  =(~ KYS.U.SUF)
      +>.^$(WUB.MAS (~(DEL BY WUB.MAS) DAP))
    =^  LEP  KYS.U.SUF  [P Q]:~(GET TO KYS.U.SUF)
    $(MOZ :_(MOZ [P.LEP %SLIP %G %DEAL [Q.Q.Q.LEP OUR] DAP R.LEP]))
    ::  $(+>.^$ (MO-CLIP(HEN P.LEP) DAP Q.LEP R.LEP))
  ::
  ++  MO-BEAK                                           ::  BUILD BEAK
    |=  DAP/DUDE
    =-  ?.(=(P OUR) - -(R [%DA NOW])) ::  SOFT DEPENDENCIES
    ^-  BEAK
    BYK:(~(GOT BY BUM.MAS) DAP)
  ::
  ++  MO-PEEK
    ~/  %MO-PEEK
    |=  {DAP/DUDE PRY/PREY REN/@TAS TYL/PATH}
    ^-  (UNIT (UNIT CAGE))
    (AP-PEEK:(AP-ABED:AP DAP PRY) REN TYL)
  ::
  ++  MO-CLIP                                           ::  APPLY CLUB
    |=  {DAP/DUDE PRY/PREY CUB/CLUB}
    ?:  ?=($PUFF -.CUB)
      %+  MO-PASS
        [%SYS %VAL (SCOT %P Q.Q.PRY) DAP ~]
      [%F %BUILD LIVE=%.N [%VALE [P Q]:(MO-BEAK DAP) +.CUB]]
    ?:  ?=($PUNK -.CUB)
      %+  MO-PASS
        [%SYS %VAL (SCOT %P Q.Q.PRY) DAP ~]
      :*  %F  %BUILD  LIVE=%.N
          ^-  SCHEMATIC:FORD
          [%CAST [P Q]:(MO-BEAK DAP) P.CUB [%$ Q.CUB]]
      ==
    ?:  ?=($PEER-NOT -.CUB)
      (MO-GIVE %UNTO %REAP (SOME P.CUB))
    AP-ABET:(AP-CLUB:(AP-ABED:AP DAP PRY) CUB)
  ::
  ++  MO-CLUB                                           ::  LOCAL ACTION
    |=  {DAP/DUDE PRY/PREY CUB/CLUB}
    ^+  +>
    ?:  |(!(~(HAS BY BUM.MAS) DAP) (~(HAS BY WUB.MAS) DAP))
      ~&  >>  [%MO-NOT-RUNNING DAP -.CUB]
      ::  ~&  [%MO-CLUB-QEU DAP CUB]
      =+  SYF=(FALL (~(GET BY WUB.MAS) DAP) *SOFA)
      +>.$(WUB.MAS (~(PUT BY WUB.MAS) DAP SYF(KYS (~(PUT TO KYS.SYF) [HEN PRY CUB]))))
    (MO-CLIP DAP PRY CUB)
  ::
  ++  MO-GAWK                                           ::  AMES FORWARD
    |=  {HIM/@P DAP/DUDE NUM/@UD ROK/ROOK}
    =.  +>  ?.(?=($U -.ROK) +> (MO-GIVE %MACK ~))
    %+  MO-PASS
      [%SYS %REQ (SCOT %P HIM) DAP (SCOT %UD NUM) ~]
    ^-  NOTE-ARVO
    ?-  -.ROK
      ::  %M  [%F %EXEC OUR ~ (MO-BEAK DAP) %VALE P.ROK Q.ROK]
      $M  [%G %DEAL [HIM OUR] DAP %PUFF P.ROK Q.ROK]
      $L  [%G %DEAL [HIM OUR] DAP %PEEL P.ROK Q.ROK]
      $S  [%G %DEAL [HIM OUR] DAP %PEER P.ROK]
      $U  [%G %DEAL [HIM OUR] DAP %PULL ~]
    ==
  ::
  ++  MO-GAWD                                           ::  AMES BACKWARD
    |=  {HIM/@P DAP/DUDE NUM/@UD RON/ROON}
    ?-    -.RON
        $D
      %+  MO-PASS
        [%SYS %REP (SCOT %P HIM) DAP (SCOT %UD NUM) ~]
      [%F %BUILD LIVE=%.N [%VALE [P Q]:(MO-BEAK DAP) P.RON Q.RON]]
    ::
        $X  =.  +>  (MO-GIVE %MACK ~)                  ::  XX SHOULD CRASH
            (MO-GIVE(HEN (MO-BALL HIM NUM)) %UNTO %QUIT ~)
    ==
  ::
  ++  AP                                                ::  AGENT ENGINE
    ~%  %GALL-AP  +>  ~
    |_  $:  $:  DAP/DUDE
                PRY/PREY
                OST/BONE
                ZIP/(LIST COVE)
                DUB/(LIST (EACH SUSS TANG))
            ==
            SEAT
        ==
    ::
    ++  AP-ABED                                         ::  INITIALIZE
      ~/  %AP-ABED
      |=  {DAP/DUDE PRY/PREY}
      ^+  +>
      =:  ^DAP   DAP
          ^PRY   PRY
          +>+<+  `SEAT`(~(GOT BY BUM.MAS) DAP)
        ==
      =+  UNT=(~(GET BY Q.ZAM) HEN)
      =:  ACT.TYC  +(ACT.TYC)
          ENY.TYC  (SHAZ (MIX (ADD DAP ACT.TYC) ENY))
          LAT.TYC  NOW
        ==
      ?^  UNT
        +>.$(OST U.UNT)
      %=  +>.$
        OST      P.ZAM
        P.ZAM    +(P.ZAM)
        Q.ZAM    (~(PUT BY Q.ZAM) HEN P.ZAM)
        R.ZAM    (~(PUT BY R.ZAM) P.ZAM HEN)
      ==
    ::
    ++  AP-ABET                                         ::  RESOLVE
      ^+  +>
      =>  AP-ABUT
      %_  +>
        BUM.MAS  (~(PUT BY BUM.MAS) DAP +<+)
        MOZ  :(WELD (TURN ZIP AP-AVER) (TURN DUB AP-AVID) MOZ)
      ==
    ::
    ++  AP-ABUT                                         ::  TRACK QUEUE
      ^+  .
      =+  [PYZ=ZIP FUL=*(SET BONE)]
      |-  ^+  +>
      ?^  PYZ
        ?.  ?=({$GIVE $DIFF *} Q.I.PYZ)
          $(PYZ T.PYZ)
        =^  VAD  +>  AP-FILL(OST P.I.PYZ)
        $(PYZ T.PYZ, FUL ?:(VAD FUL (~(PUT IN FUL) P.I.PYZ)))
      =+  DED=~(TAP IN FUL)
      |-  ^+  +>.^$
      ?~  DED  +>.^$
      =>  %*(. $(DED T.DED) OST I.DED)
      =+  TIB=(~(GET BY SUP.GED) OST)
      ?~  TIB  ~&([%AP-ABUT-BAD-BONE DAP OST] ..AP-KILL)
      AP-KILL(Q.Q.PRY P.U.TIB)
    ::
    ++  AP-AVER                                         ::  COVE TO MOVE
      ~/  %AP-AVER
      |=  COV/COVE
      ^-  MOVE
      :-  (~(GOT BY R.ZAM) P.COV)
      ?-    -.Q.COV
          ?($SLIP $SICK)  !!
          $GIVE
        ?<  =(0 P.COV)
        ?.  ?=($DIFF -.P.Q.COV)
          [%GIVE %UNTO P.Q.COV]
        =+  CAY=`CAGE`P.P.Q.COV
        =+  MAR=(FALL (~(GET BY PYL) P.COV) P.CAY)
        ?:  =(MAR P.CAY)  [%GIVE %UNTO P.Q.COV]
        :+  %PASS
          [%SYS %PEL DAP ~]
        [%F %BUILD LIVE=%.N [%CAST [P Q]:(MO-BEAK DAP) MAR [%$ CAY]]]
      ::
          $PASS
        :+  %PASS  `PATH`[%USE DAP P.Q.COV]
        ?-  -.Q.Q.COV
          $HISS  `NOTE-ARVO`[%E %HISS +.Q.Q.COV]
          $SEND  `NOTE-ARVO`[%G %DEAL [OUR P.Q.Q.COV] Q.Q.Q.COV]
          $META  `NOTE-ARVO`[`@TAS`P.Q.Q.COV %META `VASE`Q.Q.Q.COV]
        ==
      ==
    ::
    ++  AP-AVID                                         ::  ONTO RESULTS
      |=(A/(EACH SUSS TANG) [HEN %GIVE %ONTO A])
    ::
    ++  AP-CALL                                         ::  CALL INTO SERVER
      ~/  %AP-CALL
      |=  {COG/TERM ARG/VASE}
      ^-  {(UNIT TANG) _+>}
      =.  +>  AP-BOWL
      =^  ARM  +>.$  (AP-FARM COG)
      ?:  ?=(%| -.ARM)  [`P.ARM +>.$]
      =^  ZEM  +>.$  (AP-SLAM COG P.ARM ARG)
      ?:  ?=(%| -.ZEM)  [`P.ZEM +>.$]
      (AP-SAKE P.ZEM)
    ::
    ++  AP-PEEK
      ~/  %AP-PEEK
      |=  {REN/@TAS TYL/PATH}
      ^-  (UNIT (UNIT CAGE))
      =+  ?.  ?=($X REN)
            [MAR=%$ TYL=TYL]
          =+  `PATH`(FLOP TYL)
          ?>  ?=(^ -)
          [MAR=I TYL=(FLOP T)]
      =^  CUG  +>.$  (AP-FIND %PEEK REN TYL)
      ?~  CUG
        ((SLOG LEAF+"PEEK FIND FAIL" >TYL< >MAR< ~) [~ ~])
      =^  ARM  +>.$  (AP-FARM Q.U.CUG)
      ?:  ?=(%| -.ARM)  ((SLOG LEAF+"PEEK FARM FAIL" P.ARM) [~ ~])
      =^  ZEM  +>.$  (AP-SLAM Q.U.CUG P.ARM !>((SLAG P.U.CUG `PATH`[REN TYL])))
      ?:  ?=(%| -.ZEM)  ((SLOG LEAF+"PEEK SLAM FAIL" P.ZEM) [~ ~])
      ?+  Q.P.ZEM  ((SLOG LEAF+"PEEK BAD RESULT" ~) [~ ~])
        ~              ~
        {~ ~}         [~ ~]
        {~ ~ ^}
          =+  CAZ=(SPED (SLOT 7 P.ZEM))
          ?.  &(?=({P/@ *} Q.CAZ) ((SANE %TAS) P.Q.CAZ))
            ((SLOG LEAF+"SCRY: MALFORMED CAGE" ~) [~ ~])
          ?.  =(MAR P.Q.CAZ)
            [~ ~]
          ``[P.Q.CAZ (SLOT 3 CAZ)]
      ==
    ::
    ++  AP-CLUB                                         ::  APPLY EFFECT
      |=  CUB/CLUB
      ^+  +>
      ?-  -.CUB
        $PEEL   (AP-PEEL +.CUB)
        $POKE   (AP-POKE +.CUB)
        $PEER   (AP-PEER +.CUB)
        $PUFF   !!
        $PUNK   !!
        $PEER-NOT   !!
        $PULL   AP-PULL
        $PUMP   AP-FALL
      ==
    ::
    ++  AP-DIFF                                         ::  POUR A DIFF
      ~/  %AP-DIFF
      |=  {HER/SHIP PAX/PATH CAG/CAGE}
      ::  =.  Q.CAG  (SPED Q.CAG)
      =^  CUG  +>.$  (AP-FIND [%DIFF P.CAG +.PAX])
      ?~  CUG
        %.  [| HER +.PAX]
        AP-PUMP:(AP-LAME %DIFF (AP-SUCK "DIFF: NO {<`PATH`[P.CAG +.PAX]>}"))
      =+  ^=  ARG  ^-  VASE
          %-  SLOP
          ?:  =(0 P.U.CUG)
            [!>(`PATH`+.PAX) !>(CAG)]
          [!>((SLAG (DEC P.U.CUG) `PATH`+.PAX)) Q.CAG]
      =^  CAM  +>.$  (AP-CALL Q.U.CUG ARG)
      ?^  CAM
        (AP-PUMP:(AP-LAME Q.U.CUG U.CAM) | HER PAX)
      (AP-PUMP & HER PAX)
    ::
    ++  AP-PUMP                                         ::  UPDATE SUBSCRIPTION
      ~/  %AP-PUMP
      |=  {OAK/? HER/SHIP PAX/PATH}
      =+  WAY=[(SCOT %P HER) %OUT PAX]
      ?:  OAK
        (AP-PASS WAY %SEND HER -.PAX %PUMP ~)
      (AP-PASS:(AP-GIVE %QUIT ~) WAY %SEND HER -.PAX %PULL ~)
    ::
    ++  AP-FALL                                         ::  DROP FROM QUEUE
      ^+  .
      ?.  (~(HAS BY SUP.GED) OST)  .
      =+  SOY=(~(GET BY QEL.GED) OST)
      ?:  |(?=(~ SOY) =(0 U.SOY))
        ::  ~&  [%AP-FILL-UNDER [OUR DAP] Q.Q.PRY OST]
        +
      =.  U.SOY  (DEC U.SOY)
      ::  ~&  [%AP-FILL-SUB [[OUR DAP] Q.Q.PRY OST] U.SOY]
      ?:  =(0 U.SOY)
        +(QEL.GED (~(DEL BY QEL.GED) OST))
      +(QEL.GED (~(PUT BY QEL.GED) OST U.SOY))
    ::
    ++  AP-FARM                                         ::  PRODUCE ARM
      ~/  %AP-FARM
      |=  COG/TERM
      ^-  {(EACH VASE TANG) _+>}
      =+  PYZ=(MULE |.((~(MINT WA VEL) P.HAV [%LIMB COG])))
      ?:  ?=(%| -.PYZ)
        :_(+>.$ [%| +.PYZ])
      :_  +>.$(VEL `WORM`+>.PYZ)
      =+  TON=(MOCK [Q.HAV Q.+<.PYZ] AP-SLED)
      ?-  -.TON
        $0  [%& P.+<.PYZ P.TON]
        $1  [%| (TURN P.TON |=(A/* (SMYT (PATH A))))]
        $2  [%| P.TON]
      ==
    ::
    ++  AP-FILL                                         ::  ADD TO QUEUE
      ^-  {? _.}
      =+  SUY=(FALL (~(GET BY QEL.GED) OST) 0)
      ?:  =(20 SUY)
        [%| +]
      ::  ~?  !=(20 SUY)  [%AP-FILL-ADD [[OUR DAP] Q.Q.PRY OST] +(SUY)]
      [%& +(QEL.GED (~(PUT BY QEL.GED) OST +(SUY)))]
    ::
    ++  AP-FIND                                         ::  GENERAL ARM
      ~/  %AP-FIND
      |=  {COG/TERM PAX/PATH}
      ^-  [(UNIT (PAIR @UD TERM)) _+>]
      ::  CHECK CACHE
      ?^  MAYBE-RESULT=(~(GET BY ARMS) [COG PAX])
        [U.MAYBE-RESULT +>.$]
      ::
      =/  RESULT=(UNIT (PAIR @UD TERM))
        =+  DEP=0
        |-  ^-  (UNIT (PAIR @UD TERM))
        =+  ^=  SPU
            ?~  PAX  ~
            $(PAX T.PAX, DEP +(DEP), COG (AP-HYPE COG I.PAX))
        ?^  SPU  SPU
        ?.((AP-FOND COG) ~ `[DEP COG])
      ::
      =.  ARMS  (~(PUT BY ARMS) [COG PAX] RESULT)
      [RESULT +>.$]
    ::
    ++  AP-FOND                                         ::  CHECK FOR ARM
      ~/  %AP-FOND
      |=  COG/TERM
      ^-  ?
      (SLOB COG P.HAV)
    ::
    ++  AP-GIVE                                         ::  RETURN RESULT
      |=  CIT/CUFT
      ^+  +>
      +>(ZIP :_(ZIP [OST %GIVE CIT]))
    ::
    ++  AP-BOWL                                         ::  SET UP BOWL
      %_    .
          +12.Q.HAV
        ^-   BOWL
        :*  :*  OUR                               ::  HOST
                Q.Q.PRY                           ::  GUEST
                DAP                               ::  AGENT
            ==                                    ::
            :*  WEX=~                             ::  OUTGOING
                SUP=SUP.GED                       ::  INCOMING
            ==                                    ::
            :*  OST=OST                           ::  CAUSE
                ACT=ACT.TYC                       ::  TICK
                ENY=ENY.TYC                       ::  NONCE
                NOW=LAT.TYC                       ::  TIME
                BYK=BYK                           ::  SOURCE
        ==  ==                                    ::
      ==
    ::
    ++  AP-HYPE                                         ::  HYPHENATE
      ~/  %AP-HYPE
      |=({A/TERM B/TERM} `TERM`(CAT 3 A (CAT 3 '-' B)))
    ::
    ++  AP-MOVE                                         ::  PROCESS EACH MOVE
      ~/  %AP-MOVE
      |=  VAX/VASE
      ^-  {(EACH COVE TANG) _+>}
      ?@  Q.VAX    :_(+>.$ [%| (AP-SUCK "MOVE: INVALID MOVE (ATOM)")])
      ?^  -.Q.VAX  :_(+>.$ [%| (AP-SUCK "MOVE: INVALID MOVE (BONE)")])
      ?@  +.Q.VAX  :_(+>.$ [%| (AP-SUCK "MOVE: INVALID MOVE (CARD)")])
      =+  HUN=(~(GET BY R.ZAM) -.Q.VAX)
      ?.  &((~(HAS BY R.ZAM) -.Q.VAX) !=(0 -.Q.VAX))
        ~&  [Q-VAX+Q.VAX HAS-BY-R-ZAM+(~(HAS BY R.ZAM) -.Q.VAX)]
        :_(+>.$ [%| (AP-SUCK "MOVE: INVALID CARD (BONE {<-.Q.VAX>})")])
      =^  PEC  VEL  (~(SPOT WA VEL) 3 VAX)
      =^  CAV  VEL  (~(SLOT WA VEL) 3 PEC)
      ?+  +<.Q.VAX
               (AP-MOVE-PASS -.Q.VAX +<.Q.VAX CAV)
        $DIFF  (AP-MOVE-DIFF -.Q.VAX CAV)
        $HISS  (AP-MOVE-HISS -.Q.VAX CAV)
        $PEEL  (AP-MOVE-PEEL -.Q.VAX CAV)
        $PEER  (AP-MOVE-PEER -.Q.VAX CAV)
        $PULL  (AP-MOVE-PULL -.Q.VAX CAV)
        $POKE  (AP-MOVE-POKE -.Q.VAX CAV)
        $SEND  (AP-MOVE-SEND -.Q.VAX CAV)
        $QUIT  (AP-MOVE-QUIT -.Q.VAX CAV)
      ==
    ::
    ++  AP-MOVE-QUIT                                    ::  GIVE QUIT MOVE
      ~/  %QUIT
      |=  {STO/BONE VAX/VASE}
      ^-  {(EACH COVE TANG) _+>}
      :_  +>(SUP.GED (~(DEL BY SUP.GED) STO))
      ?^  Q.VAX  [%| (AP-SUCK "QUIT: IMPROPER GIVE")]
      [%& `COVE`[STO %GIVE `CUFT`[%QUIT ~]]]
    ::
    ++  AP-MOVE-DIFF                                    ::  GIVE DIFF MOVE
      ~/  %DIFF
      |=  {STO/BONE VAX/VASE}
      ^-  {(EACH COVE TANG) _+>}
      =^  PEC  VEL  (~(SPED WA VEL) VAX)
      ?.  &(?=(^ Q.PEC) ?=(@ -.Q.PEC) ((SANE %TAS) -.Q.PEC))
        :_(+>.$ [%| (AP-SUCK "DIFF: IMPROPER GIVE")])
      =^  TEL  VEL  (~(SLOT WA VEL) 3 PEC)
      :_(+>.$ [%& STO %GIVE %DIFF `CAGE`[-.Q.PEC TEL]])
    ::
    ++  AP-MOVE-HISS                                    ::  PASS %HISS
      ~/  %HISS
      |=  {STO/BONE VAX/VASE}
      ^-  {(EACH COVE TANG) _+>}
      ?.  &(?=({P/* Q/* R/@ S/{P/@ *}} Q.VAX) ((SANE %TAS) R.Q.VAX))
        =+  ARGS="[%HISS WIRE (UNIT KNOT) MARK CAGE]"
        :_(+>.$ [%| (AP-SUCK "HISS: BAD HISS ASK.{ARGS}")])
      =^  GAW  VEL  (~(SLOT WA VEL) 15 VAX)
      ?.  &(?=({P/@ *} Q.GAW) ((SANE %TAS) P.Q.GAW))
        :_(+>.$ [%| (AP-SUCK "HISS: MALFORMED CAGE")])
      =^  PAW  VEL  (~(STOP WA VEL) 3 GAW)
      =+  USR=((SOFT (UNIT KNOT)) Q.Q.VAX)
      ?.  &(?=(^ USR) ?~(U.USR & ((SANE %TA) U.U.USR)))
        :_(+>.$ [%| (AP-SUCK "HISS: MALFORMED (UNIT KNOT)")])
      =+  PUX=((SOFT PATH) P.Q.VAX)
      ?.  &(?=(^ PUX) (LEVY U.PUX (SANE %TA)))
        :_(+>.$ [%| (AP-SUCK "HISS: MALFORMED PATH")])
      :_  +>.$
      :^  %&  STO  %PASS
      :-  [(SCOT %P Q.Q.PRY) %CAY U.PUX]
      ~!  *COTE
      =-  ~!  -  `COTE`-
      [%HISS U.USR R.Q.VAX [P.Q.GAW PAW]]
    ::
    ++  AP-MOVE-MESS                                    ::  EXTRACT PATH, TARGET
      ~/  %MESS
      |=  VAX/VASE
      ^-  {(EACH (TREL PATH SHIP TERM) TANG) _+>}
      :_  +>.$
      ?.  ?&  ?=({P/* {Q/@ R/@} S/*} Q.VAX)
              (GTE 1 (MET 7 Q.Q.VAX))
          ==
        [%| (AP-SUCK "MESS: MALFORMED TARGET")]
      =+  PUX=((SOFT PATH) P.Q.VAX)
      ?.  &(?=(^ PUX) (LEVY U.PUX (SANE %TA)))
        [%| (AP-SUCK "MESS: MALFORMED PATH")]
      [%& [(SCOT %P Q.Q.VAX) %OUT R.Q.VAX U.PUX] Q.Q.VAX R.Q.VAX]
    ::
    ++  AP-MOVE-PASS                                    ::  PASS GENERAL MOVE
      ~/  %PASS
      |=  {STO/BONE WUT/* VAX/VASE}
      ^-  {(EACH COVE TANG) _+>}
      ?.  &(?=(@ WUT) ((SANE %TAS) WUT))
        :_(+>.$ [%| (AP-SUCK "PASS: MALFORMED CARD")])
      =+  PUX=((SOFT PATH) -.Q.VAX)
      ?.  &(?=(^ PUX) (LEVY U.PUX (SANE %TA)))
        :_(+>.$ [%| (AP-SUCK "PASS: MALFORMED PATH")])
      =+  HUJ=(AP-VAIN WUT)
      ?~  HUJ  :_(+>.$ [%| (AP-SUCK "MOVE: UNKNOWN NOTE {(TRIP WUT)}")])
      =^  TEL  VEL  (~(SLOT WA VEL) 3 VAX)
      :_  +>.$
      :^  %&  STO  %PASS
      :-  [(SCOT %P Q.Q.PRY) %INN U.PUX]
      [%META U.HUJ (SLOP (AP-TERM %TAS WUT) TEL)]
    ::
    ++  AP-MOVE-POKE                                    ::  PASS %POKE
      ~/  %POKE
      |=  {STO/BONE VAX/VASE}
      ^-  {(EACH COVE TANG) _+>}
      =^  YEP  +>.$  (AP-MOVE-MESS VAX)
      ?:  ?=(%| -.YEP)  :_(+>.$ YEP)
      =^  GAW  VEL  (~(SLOT WA VEL) 7 VAX)
      ?.  &(?=({P/@ Q/*} Q.GAW) ((SANE %TAS) P.Q.GAW))
        :_(+>.$ [%| (AP-SUCK "POKE: MALFORMED CAGE")])
      =^  PAW  VEL  (~(STOP WA VEL) 3 GAW)
      :_  +>.$
      :^  %&  STO  %PASS
      :-  P.P.YEP
      [%SEND Q.P.YEP R.P.YEP %POKE P.Q.GAW PAW]
    ::
    ++  AP-MOVE-PEEL                                    ::  PASS %PEEL
      ~/  %PEEL
      |=  {STO/BONE VAX/VASE}
      ^-  {(EACH COVE TANG) _+>}
      =^  YEP  +>.$  (AP-MOVE-MESS VAX)
      :_  +>.$
      ?:  ?=(%| -.YEP)  YEP
      =+  MAR=((SOFT MARK) +>-.Q.VAX)
      ?~  MAR
        [%| (AP-SUCK "PEEL: MALFORMED MARK")]
      =+  PUX=((SOFT PATH) +>+.Q.VAX)
      ?.  &(?=(^ PUX) (LEVY U.PUX (SANE %TA)))
        [%| (AP-SUCK "PEEL: MALFORMED PATH")]
      ?:  (~(HAS IN MISVALE) P.P.YEP)
        =/  ERR  [LEAF+"PEEL: MISVALIDATION ENCOUNTERED"]~
        :^  %&  STO  %PASS
        :-  P.P.YEP
        [%SEND Q.P.YEP R.P.YEP %PEER-NOT ERR]
      :^  %&  STO  %PASS
      :-  P.P.YEP
      [%SEND Q.P.YEP R.P.YEP %PEEL U.MAR U.PUX]
    ::
    ++  AP-MOVE-PEER                                    ::  PASS %PEER
      ~/  %PEER
      |=  {STO/BONE VAX/VASE}
      ^-  {(EACH COVE TANG) _+>}
      =^  YEP  +>.$  (AP-MOVE-MESS VAX)
      :_  +>.$
      ?:  ?=(%| -.YEP)  YEP
      =+  PUX=((SOFT PATH) +>.Q.VAX)
      ?.  &(?=(^ PUX) (LEVY U.PUX (SANE %TA)))
        [%| (AP-SUCK "PEER: MALFORMED PATH")]
      ?:  (~(HAS IN MISVALE) P.P.YEP)
        =/  ERR  [LEAF+"PEER: MISVALIDATION ENCOUNTERED"]~
        :^  %&  STO  %PASS
        :-  P.P.YEP
        [%SEND Q.P.YEP R.P.YEP %PEER-NOT ERR]
      :^  %&  STO  %PASS
      :-  P.P.YEP
      [%SEND Q.P.YEP R.P.YEP %PEER U.PUX]
    ::
    ++  AP-MOVE-PULL                                    ::  PASS %PULL
      ~/  %PULL
      |=  {STO/BONE VAX/VASE}
      ^-  {(EACH COVE TANG) _+>}
      =^  YEP  +>.$  (AP-MOVE-MESS VAX)
      :_  +>.$
      ?:  ?=(%| -.YEP)  YEP
      ?.  =(~ +>.Q.VAX)
        [%| (AP-SUCK "PULL: MALFORMED CARD")]
      :^  %&  STO  %PASS
      :-  P.P.YEP
      [%SEND Q.P.YEP R.P.YEP %PULL ~]
    ::
    ++  AP-MOVE-SEND                                    ::  PASS GALL ACTION
      ~/  %SEND
      |=  {STO/BONE VAX/VASE}
      ^-  {(EACH COVE TANG) _+>}
      ?.  ?&  ?=({P/* {Q/@ R/@} {S/@ T/*}} Q.VAX)
              (GTE 1 (MET 7 Q.Q.VAX))
              ((SANE %TAS) R.Q.VAX)
          ==
        :_(+>.$ [%| (AP-SUCK "SEND: IMPROPER ASK.[%SEND WIRE GILL CLUB]")])
      =+  PUX=((SOFT PATH) P.Q.VAX)
      ?.  &(?=(^ PUX) (LEVY U.PUX (SANE %TA)))
        :_(+>.$ [%| (AP-SUCK "SEND: MALFORMED PATH")])
      ?:  ?=($POKE S.Q.VAX)
        =^  GAV  VEL  (~(SPOT WA VEL) 7 VAX)
        ?>  =(%POKE -.Q.GAV)
        ?.  ?&  ?=({P/@ Q/*} T.Q.VAX)
                ((SANE %TAS) P.T.Q.VAX)
            ==
          :_(+>.$ [%| (AP-SUCK "SEND: MALFORMED POKE")])
        =^  VIG  VEL  (~(SPOT WA VEL) 3 GAV)
        =^  GEB  VEL  (~(SLOT WA VEL) 3 VIG)
        :_  +>.$
        :^  %&  STO  %PASS
        :-  [(SCOT %P Q.Q.VAX) %OUT R.Q.VAX U.PUX]
        ^-  COTE
        ::  ~&  [%AP-MOVE-SEND `PATH`[(SCOT %P Q.Q.VAX) %OUT R.Q.VAX U.PUX]]
        [%SEND Q.Q.VAX R.Q.VAX %POKE P.T.Q.VAX GEB]
      :_  +>.$
      =+  COB=((SOFT CLUB) [S T]:Q.VAX)
      ?~  COB
        [%| (AP-SUCK "SEND: MALFORMED CLUB")]
      :^  %&  STO  %PASS
      :-  [(SCOT %P Q.Q.VAX) %OUT R.Q.VAX U.PUX]
      ::  ~&  [%AP-MOVE-SEND `PATH`[(SCOT %P Q.Q.VAX) %OUT R.Q.VAX U.PUX]]
      [%SEND Q.Q.VAX R.Q.VAX U.COB]
    ::
    ++  AP-PASS                                         ::  REQUEST ACTION
      |=  {PAX/PATH COH/COTE}
      ^+  +>
      +>(ZIP :_(ZIP [OST %PASS PAX COH]))
    ::
    ++  AP-PEEP                                         ::  REINSTALL
      ~/  %AP-PEEP
      |=  VAX/VASE
      ^+  +>
      =+  PEP=(AP-PREP(HAV VAX) `HAV)
      ?~  -.PEP
        +.PEP
      (AP-LAME %PREP-FAILED U.-.PEP)
    ::
    ++  AP-PEEL
      |=  {MAR/MARK PAX/PATH}
      =.  PYL  (~(PUT BY PYL) OST MAR)
      (AP-PEER PAX)
    ::
    ++  AP-PEER                                         ::  APPLY %PEER
      ~/  %AP-PEER
      |=  PAX/PATH
      ^+  +>
      =.  SUP.GED  (~(PUT BY SUP.GED) OST [Q.Q.PRY PAX])
      =^  CUG  +>.$  (AP-FIND %PEER PAX)
      ?~  CUG  +>.$
      =+  OLD=ZIP
      =.  ZIP  ~
      =^  CAM  +>.$
          %+  AP-CALL  Q.U.CUG
          !>(`PATH`(SLAG P.U.CUG PAX))
      =.  ZIP  (WELD ZIP `(LIST COVE)`[[OST %GIVE %REAP CAM] OLD])
      ?^(CAM AP-PULE +>.$)
    ::
    ++  AP-POKE                                         ::  APPLY %POKE
      ~/  %AP-POKE
      |=  CAG/CAGE
      ^+  +>
      =^  CUG  +>.$  (AP-FIND %POKE P.CAG ~)
      ?~  CUG
        (AP-GIVE %COUP `(AP-SUCK "NO POKE ARM FOR {(TRIP P.CAG)}"))
      ::  ~&  [%AP-POKE DAP P.CAG CUG]
      =^  TUR  +>.$
          %+  AP-CALL  Q.U.CUG
          ?.  =(0 P.U.CUG)  Q.CAG
          (SLOP (AP-TERM %TAS P.CAG) Q.CAG)
      (AP-GIVE %COUP TUR)
    ::
    ++  AP-LAME                                         ::  POUR ERROR
      |=  {WUT/@TAS WHY/TANG}
      ^+  +>
      =^  CUG  +>.$  (AP-FIND /LAME)
      ?~  CUG
        =.  WHY  [>%AP-LAME DAP WUT< (TURN WHY |=(A/TANK ROSE+[~ "! " ~]^[A]~))]
        ~>  %SLOG.`ROSE+["  " "[" "]"]^(FLOP WHY)
        +>.$
      =^  CAM  +>.$
        %+  AP-CALL  Q.U.CUG
        !>([WUT WHY])
      ?^  CAM
        =.  WHY  [>%AP-LAME-LAME< (TURN U.CAM |=(A/TANK ROSE+[~ "! " ~]^[A]~))]
        ~>  %SLOG.`ROSE+["  " "[" "]"]^(WELP (FLOP WHY) LEAF+"." (FLOP U.CAM))
        +>.$
      +>.$
    ::
    ++  AP-MISVALE                                      ::  BROKEN VALE
      |=  WIR/WIRE
      ~&  [%AP-BLOCKING-MISVALE WIR]
      +>(MISVALE (~(PUT IN MISVALE) WIR))
    ::
    ++  AP-POUR                                         ::  GENERIC TAKE
      ~/  %AP-POUR
      |=  {PAX/PATH VAX/VASE}
      ^+  +>
      ?.  &(?=({@ *} Q.VAX) ((SANE %TAS) -.Q.VAX))
        (AP-LAME %POUR (AP-SUCK "POUR: MALFORMED CARD"))
      =^  CUG  +>.$  (AP-FIND [-.Q.VAX PAX])
      ?~  CUG
        (AP-LAME -.Q.VAX (AP-SUCK "POUR: NO {(TRIP -.Q.VAX)}: {<PAX>}"))
      =^  TEL  VEL  (~(SLOT WA VEL) 3 VAX)
      =^  CAM  +>.$
          %+  AP-CALL  Q.U.CUG
          %+  SLOP
            !>(`PATH`(SLAG P.U.CUG PAX))
          TEL
      ?^  CAM  (AP-LAME -.Q.VAX U.CAM)
      +>.$
    ::
    ++  AP-PURR                                         ::  UNWRAP TAKE
      ~/  %AP-PURR
      |=  {WHA/TERM PAX/PATH CAG/CAGE}
      ^+  +>
      =^  CUG  +>.$  (AP-FIND [WHA P.CAG PAX])
      ?~  CUG
        (AP-LAME WHA (AP-SUCK "{(TRIP WHA)}: NO {<`PATH`[P.CAG PAX]>}"))
      =+  ^=  ARG  ^-  VASE
          %-  SLOP
          ?:  =(0 P.U.CUG)
            [!>(`PATH`PAX) !>(CAG)]
          [!>((SLAG (DEC P.U.CUG) `PATH`PAX)) Q.CAG]
      =^  CAM  +>.$  (AP-CALL Q.U.CUG ARG)
      ?^  CAM   (AP-LAME Q.U.CUG U.CAM)
      +>.$
    ::
    ++  AP-POUT                                         ::  SPECIFIC TAKE
      |=  {PAX/PATH CUF/CUFT}
      ^+  +>
      ?-  -.CUF
        $COUP  (AP-TAKE Q.Q.PRY %COUP +.PAX `!>(P.CUF))
        $DIFF  (AP-DIFF Q.Q.PRY PAX P.CUF)
        $QUIT  (AP-TAKE Q.Q.PRY %QUIT +.PAX ~)
        $REAP  (AP-TAKE Q.Q.PRY %REAP +.PAX `!>(P.CUF))
      ==
    ::
    ++  AP-PREP                                         ::  INSTALL
      |=  VUX/(UNIT VASE)
      ^-  {(UNIT TANG) _+>}
      =^  GAC  +>.$  (AP-PROP VUX)
      :-  GAC
      %=    +>.$
          MISVALE
        ~?  !=(MISVALE *MISVALE-DATA)  MISVALE-DROP+MISVALE
        *MISVALE-DATA                 ::  NEW APP MIGHT MEAN NEW MARKS
      ::
          ARMS
        ~
      ::
          DUB
        :_(DUB ?~(GAC [%& DAP ?~(VUX %BOOT %BUMP) NOW] [%| U.GAC]))
      ==
    ::
    ++  AP-PROP                                         ::  INSTALL
      ~/  %AP-PROP
      |=  VUX/(UNIT VASE)
      ^-  {(UNIT TANG) _+>}
      ?.  (AP-FOND %PREP)
        ?~  VUX
          `+>.$
        =+  [NEW=P:(SLOT 13 HAV) OLD=P:(SLOT 13 U.VUX)]
        ?.  (~(NEST UT P:(SLOT 13 HAV)) %| P:(SLOT 13 U.VUX))
          :_(+>.$ `(AP-SUCK "PREP MISMATCH"))
        `+>.$(+13.Q.HAV +13.Q.U.VUX)
      =^  TUR  +>.$
          %+  AP-CALL  %PREP
          ?~(VUX !>(~) (SLOP !>(~) (SLOT 13 U.VUX)))
      ?~  TUR
        `+>.$
      :_(+>.$ `U.TUR)
    ::
    ++  AP-PULE                                         ::  SILENT DELETE
      =+  WIM=(~(GET BY SUP.GED) OST)
      ?~  WIM  +
      %_  +
        SUP.GED  (~(DEL BY SUP.GED) OST)
        QEL.GED  (~(DEL BY QEL.GED) OST)
      ==
    ::
    ++  AP-PULL                                         ::  LOAD DELETE
      =+  WIM=(~(GET BY SUP.GED) OST)
      ?~  WIM  +  ::  ~&(%AP-PULL-NONE +)
      =:  SUP.GED  (~(DEL BY SUP.GED) OST)
          QEL.GED  (~(DEL BY QEL.GED) OST)
        ==
      =^  CUG  ..AP-PULL  (AP-FIND %PULL Q.U.WIM)
      ?~  CUG  +>
      =^  CAM  +>
        %+  AP-CALL  Q.U.CUG
        !>((SLAG P.U.CUG Q.U.WIM))
      ?^  CAM  (AP-LAME Q.U.CUG U.CAM)
      +>+
    ::
    ++  AP-KILL                                         ::  QUEUE KILL
      ::  ~&  [%AP-KILL DAP OST]
      (AP-GIVE:AP-PULL %QUIT ~)
    ::
    ++  AP-TAKE                                         ::  NON-DIFF GALL TAKE
      ~/  %AP-TAKE
      |=  {HER/SHIP COG/TERM PAX/PATH VUX/(UNIT VASE)}
      ^+  +>
      =^  CUG  +>.$  (AP-FIND COG PAX)
      ?~  CUG
        ::  ~&  [%AP-TAKE-NONE COG PAX]
        +>.$
      =^  CAM  +>.$
        %+  AP-CALL  Q.U.CUG
        =+  DEN=!>((SLAG P.U.CUG PAX))
        ?~(VUX DEN (SLOP DEN U.VUX))
      ?^  CAM  (AP-LAME Q.U.CUG U.CAM)
      +>.$
    ::
    ++  AP-SAFE                                         ::  PROCESS MOVE LIST
      ~/  %AP-SAFE
      |=  VAX/VASE
      ^-  {(EACH (LIST COVE) TANG) _+>}
      ?~  Q.VAX  :_(+>.$ [%& ~])
      ?@  Q.VAX  :_(+>.$ [%| (AP-SUCK "MOVE: MALFORMED LIST")])
      =^  HED  VEL  (~(SLOT WA VEL) 2 VAX)
      =^  SUD  +>.$  (AP-MOVE HED)
      ?:  ?=(%| -.SUD)  :_(+>.$ SUD)
      =^  TEL  VEL  (~(SLOT WA VEL) 3 VAX)
      =^  RES  +>.$  $(VAX TEL)
      :_  +>.$
      ?:  ?=(%| -.RES)  RES
      [%& P.SUD P.RES]
    ::
    ++  AP-SAKE                                         ::  HANDLE RESULT
      ~/  %AP-SAKE
      |=  VAX/VASE
      ^-  {(UNIT TANG) _+>}
      ?:  ?=(@ Q.VAX)
        [`(AP-SUCK "SAKE: INVALID PRODUCT (ATOM)") +>.$]
      =^  HED  VEL  (~(SLOT WA VEL) 2 VAX)
      =^  MUZ  +>.$  (AP-SAFE HED)
      ?:  ?=(%| -.MUZ)  [`P.MUZ +>.$]
      =^  TEL  VEL  (~(SLOT WA VEL) 3 VAX)
      =^  SAV  +>.$  (AP-SAVE TEL)
      ?:  ?=(%| -.SAV)  [`P.SAV +>.$]
      :-  ~
      %_  +>.$
        ZIP  (WELD (FLOP P.MUZ) ZIP)
        HAV  P.SAV
      ==
    ::
    ++  AP-SAVE                                         ::  VERIFY CORE
      ~/  %AP-SAVE
      |=  VAX/VASE
      ^-  {(EACH VASE TANG) _+>}
      =^  GUD  VEL  (~(NEST WA VEL) P.HAV P.VAX)
      :_  +>.$
      ?.  GUD
        [%| (AP-SUCK "INVALID CORE")]
      [%& VAX]
    ::
    ++  AP-SLAM                                         ::  VIRTUAL SLAM
      ~/  %AP-SLAM
      |=  {COG/TERM GAT/VASE ARG/VASE}
      ^-  {(EACH VASE TANG) _+>}
      =+  ^=  WYZ  %-  MULE  |.
          (~(MINT WA VEL) [%CELL P.GAT P.ARG] [%CNSG [%$ ~] [%$ 2] [%$ 3] ~])
      ?:  ?=(%| -.WYZ)
        %-  =+  SAM=(~(PEEK UT P.GAT) %FREE 6)
            (SLOG >%AP-SLAM-MISMATCH< ~(DUCK UT P.ARG) ~(DUCK UT SAM) ~)
        :_(+>.$ [%| (AP-SUCK "CALL: {<COG>}: TYPE MISMATCH")])
      :_  +>.$(VEL +>.WYZ)
      =+  [TYP NOK]=+<.WYZ
      =+  TON=(MOCK [[Q.GAT Q.ARG] NOK] AP-SLED)
      ?-  -.TON
        $0  [%& TYP P.TON]
        $1  [%| (TURN P.TON |=(A/* (SMYT (PATH A))))]
        $2  [%| P.TON]
      ==
    ::
    ++  AP-SLED  (SLOY SKA)                             ::  NAMESPACE VIEW
    ++  AP-SUCK                                         ::  STANDARD TANG
      |=  MSG/TAPE
      ^-  TANG
      [%LEAF (WELD "GALL: {<DAP>}: " MSG)]~
    ::
    ++  AP-TERM                                         ::  ATOMIC VASE
      |=  {A/@TAS B/@}
      ^-  VASE
      [[%ATOM A `B] B]
    ::
    ++  AP-VAIN                                         ::  CARD TO VANE
      |=  SEP/@TAS
      ^-  (UNIT @TAS)
      ?+  SEP  ~&  [%AP-VAIN SEP]
               ~
        $BONK  `%A
        $BUILD  `%F
        $CASH  `%A
        $CONF  `%G
        $CRED  `%C
        $CREW  `%C
        $CROW  `%C
        $DEAL  `%G
        $DIRK  `%C
        $DROP  `%C
        $FLOG  `%D
        $INFO  `%C
        $KEEP  `%F
        $KILL  `%F
        $LOOK  `%J
        $MERG  `%C
        $MINT  `%J
        $MONT  `%C
        $NUKE  `%A
        $OGRE  `%C
        $PERM  `%C
        $REST  `%B
        $RULE  `%E
        $SERV  `%E
        $SNAP  `%J
        $THEM  `%E
        $WAIT  `%B
        $WANT  `%A
        $WARP  `%C
        $WELL  `%E
        $WELL  `%E
        $WIND  `%J
        $WIPE  `%F
      ==
    --
  --
++  CALL                                                ::  REQUEST
  ~%  %GALL-CALL  +>   ~
  |=  {HEN/DUCT HIC/(HYPO (HOBO TASK:ABLE))}
  ^+  [*(LIST MOVE) ..^$]
  =>  .(Q.HIC ?.(?=($SOFT -.Q.HIC) Q.HIC ((HARD TASK:ABLE) P.Q.HIC)))
  ?-    -.Q.HIC
      $CONF
    ?.  =(OUR P.P.Q.HIC)
      ~&  [%GALL-NOT-OURS P.P.Q.HIC]
      [~ ..^$]
    MO-ABET:(MO-CONF:(MO-ABED:MO HEN) Q.P.Q.HIC Q.Q.HIC)
  ::
      $DEAL
    =<  MO-ABET
    ?.  =(OUR Q.P.Q.HIC)                                ::  EITHER TO US
      ?>  =(OUR P.P.Q.HIC)                              ::  OR FROM US
      (MO-AWAY:(MO-ABED:MO HEN) Q.P.Q.HIC Q.Q.HIC)
    (MO-COME:(MO-ABED:MO HEN) P.P.Q.HIC Q.Q.HIC)
  ::
      $INIT
    [~ ..^$(SYS.MAST.ALL HEN)]
  ::
      $SUNK  [~ ..^$]
  ::
      $VEGA  [~ ..^$]
  ::
      $WEST
    ?>  ?=({?($GE $GH) @ ~} Q.Q.HIC)
    =*  DAP  I.T.Q.Q.HIC
    =*  HIM  P.Q.HIC
    ?:  ?=($GE I.Q.Q.HIC)
      =+  MES=((HARD {@UD ROOK}) R.Q.HIC)
      =<  MO-ABET
      (MO-GAWK:(MO-ABED:MO HEN) HIM DAP MES)
    =+  MES=((HARD {@UD ROON}) R.Q.HIC)
    =<  MO-ABET
    (MO-GAWD:(MO-ABED:MO HEN) HIM DAP MES)
  ::
      $WEGH
    =/  =MASS
      :+  %GALL  %|
      :~  FOREIGN+&+SAP.MAST.ALL
          :+  %BLOCKED  %|
          (SORT ~(TAP BY (~(RUN BY WUB.MAST.ALL) |=(SOFA [%& +<]))) AOR)
          :+  %ACTIVE   %|
          (SORT ~(TAP BY (~(RUN BY BUM.MAST.ALL) |=(SEAT [%& +<]))) AOR)
          DOT+&+ALL
      ==
    =/  =MOVE  [HEN %GIVE %MASS MASS]
    [[MOVE ~] ..^$]
  ==
::
++  LOAD                                                ::  RECREATE VANE
  |=  OLD/AXLE-N
  ^+  ..^$
  ?-  -.OLD
      $0  ..^$(ALL OLD)
  ==
::
++  SCRY
  ~/  %GALL-SCRY
  |=  {FUR/(UNIT (SET MONK)) REN/@TAS WHY/SHOP SYD/DESK LOT/COIN TYL/PATH}
  ^-  (UNIT (UNIT CAGE))
  ?.  ?=(%& -.WHY)  ~
  =*  HIS  P.WHY
  ?:  ?&  =(%U REN)
          =(~ TYL)
          =([%$ %DA NOW] LOT)
          =(OUR HIS)
          (~(HAS BY BUM.MAST.ALL) SYD)
      ==
    ``[%NULL !>(~)]
  ?.  =(OUR HIS)
    ~
  ?.  =([%$ %DA NOW] LOT)
    ~
  ?.  (~(HAS BY BUM.MAST.ALL) SYD)
    [~ ~]
  ?.  ?=(^ TYL)
    ~
  (MO-PEEK:MO-ABED:MO SYD HIGH+`HIS REN TYL)
::
++  STAY                                                ::  SAVE W+O CACHE
  `AXLE`ALL
::
++  TAKE                                                ::  RESPONSE
  ~/  %GALL-TAKE
  |=  {TEA/WIRE HEN/DUCT HIN/(HYPO SIGN-ARVO)}
  ^+  [*(LIST MOVE) ..^$]
  ~|  [%GALL-TAKE TEA]
  ?>  ?=([?($SYS $USE) *] TEA)
  =+  MOW=(MO-ABED:MO HEN)
  ?-  I.TEA
    $SYS  MO-ABET:(MO-CYST:MOW T.TEA Q.HIN)
    $USE  MO-ABET:(MO-COOK:MOW T.TEA HIN)
  ==
--
