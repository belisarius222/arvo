::                                                      ::  ::
::::  /HOON/AMES/ARVO                                   ::::::  VANE PRELUDE
  !:                                                    ::  ::
|=  PIT/VASE                                            ::  KERNEL VASE
=>  =~                                                  ::
=,  XMAS
::                                                      ::  ::
::::                                                    ::::::  AMES STRUCTURES
  ::                                                    ::  ::
::
=*  PIPE  CHANNEL:ABLE:JAEL                             ::  SECURE CHANNEL
=*  GREE  FARM:PKI:JAEL                                 ::  PKI INFORMATION
|%                                                      ::
++  BAIT  {P/SKIN Q/@UD R/DOVE}                         ::  FMT NRECVD SPEC
++  BATH                                                ::  PER FRIEND
          $:  DET/PIPE                                  ::  SECURE CHANNEL
              LUN/(UNIT LANE)                           ::  LATEST ROUTE
              ZAM/SCAR                                  ::  OUTBOUND BOLES
              FON/(MAP BOLE LOCK)                       ::  INBOUND LOCKS
              SAL/(MAP BOLE COLT)                       ::  OUTBOUND FLOWS
          ==                                            ::
++  BOLE  BONE                                          ::  INBOUND OPAQUE
++  CAKE  {P/SOCK Q/SKIN R/@}                           ::  TOP LEVEL PACKET
++  CHAN  PATH                                          ::  CHANNEL
++  CLUE                                                ::  LIVE PACKET STATE
          $:  VIG/?                                     ::  TRUE IFF VIRGIN
              TEL/PART                                  ::  BLOCK IDENTITY
              FAP/FLAP                                  ::  FRAGMENT HASH
              DAT/ROCK                                  ::  FRAGMENT DATA
          ==                                            ::
++  COAL                                                ::  LIVE PACKET STATE
          $:  OUT/@DA                                   ::  SENT DATE
              LOD/@DA                                   ::  LOST-BY DEADLINE
              CLU/CLUE                                  ::  PACKET TO SEND
          ==                                            ::
++  COLT                                                ::  OUTBOUND STATE
          $:  SEQ/TICK                                  ::  NEXT TICK TO FILL
              LAC/TICK                                  ::  ACKED TICK UNTIL
              COB/(MAP TICK COMB)                       ::  LIVE MESSAGES
              MYN/MINI                                  ::  PACKET PUMP
          ==                                            ::
++  COMB                                                ::  LIVE MESSAGE
          $:  CUP/(UNIT COOP)                           ::  FINAL ACK
              CHA/PATH                                  ::  CHANNEL
              NUM/FRAG                                  ::  NUMBER OF FRAGMENTS
              ACK/FRAG                                  ::  NUMBER ACKED
              CLY/(LIST CLUE)                           ::  LEFT TO SEND
          ==                                            ::
++  DOVE  {P/@UD Q/(MAP @UD @)}                         ::  COUNT 13-BLOCKS
++  FLAP  @UVH                                          ::  NETWORK PACKET ID
++  FLEA  (PAIR BOLE TICK)                              ::  MESSAGE ID
++  FRAG  @UD                                           ::  FRAGMENT NUMBER
++  HAND  @UVH                                          ::  128-BIT HASH
++  LOCK                                                ::  INBOUND SEQUENCER
          $:  LAQ/TICK                                  ::  ACKNOWLEDGED UNTIL
              NYS/(MAP TICK BAIT)                       ::  INBOUND PARTIALS
              LAZ/(UNIT (TREL TICK FLAP LANE))          ::  AWAITING APP
              EXC/(MAP TICK ARES)                       ::  NEGATIVE ACKS
          ==                                            ::
++  MEAL                                                ::  PAYLOAD
          $%  {$BACK P/BONE Q/FLAP R/COOP S/@DR}        ::  ACKNOWLEDGMENT
              {$BOND P/FLEA Q/CHAN R/*}                 ::  MESSAGE
              {$CARP P/MOAN Q/(PAIR @UD @)}             ::  FRAGMENT
              {$FORE P/SHIP Q/(UNIT LANE) R/@}          ::  FORWARDED PACKET
          ==                                            ::
++  MINI                                                ::  PUMP DATA
          $:  SAW/STAT                                  ::  STATISTICS
              LIV/(QEU COAL)                            ::  LIVE PACKETS
              LOP/(QEU CLUE)                            ::  LOST PACKETS
          ==                                            ::
++  MOAN                                                ::  MESSAGE INVARIANT
          $:  {KOS/BOLE LIQ/TICK}                       ::  FLOW IDENTITY
              SYN/@                                     ::  SKIN NUMBER
              CNT/@                                     ::  NUMBER OF PACKETS
          ==                                            ::
++  MUTE                                                ::  AWAITING CHANNEL
          $:  INN/(LIST (PAIR LANE ROCK))               ::  INBOUND PACKETS
              OUT/(LIST (TREL DUCT CHAN *))             ::  OUTBOUND MESSAGES
          ==                                            ::
++  PART  (PAIR FRAG TICK)                              ::  FRAGMENT OF PACKET
++  ROCK  @UVO                                          ::  PACKET
++  SILO                                                ::  GLOBAL STATE
          $:  LYF/LIFE                                  ::  CURRENT VERSION
              WYR/(MAP LIFE RING)                       ::  PRIVATE KEYS
              ECH/(MAP SHIP MUTE)                       ::  WAITING PARTNERS
              POL/(MAP SHIP BATH)                       ::  OPEN PARTNERS
          ==                                            ::
++  SKIN  ?($NONE $OPEN $FAST $FULL)                    ::  ENCODING STEM
++  STAT                                                ::  PUMP STATISTICS
          $:  $:  CUR/@UD                               ::  WINDOW Q LENGTH
                  MAX/@UD                               ::  MAX PAX OUT
                  REY/@UD                               ::  RETRY Q LENGTH
              ==                                        ::
              $:  RTT/@DR                               ::  ROUNDTRIP ESTIMATE
                  LAS/@DA                               ::  LAST SENT
                  LAD/@DA                               ::  LAST DEADLINE
              ==                                        ::
          ==                                            ::
++  TICK  @UD                                           ::  MESSAGE SEQUENCE NO
--                                                      ::
::                                                      ::
::::                                                    ::::  ARVO STRUCTURES
  ::                                                    ::
|%                                                      ::
++  FLAM  |=(A/FLAP `@P`(MUG A))                        ::  DEBUG FLAP
++  MSEC  |=(A/@DR `@UD`(DIV A (DIV ~S1 1.000)))        ::  DEBUG @DR
++  MOVE  %+  PAIR                                      ::  LOCAL MOVE
            DUCT                                        ::
          (WIND NOTE:ABLE:XMAS GIFT:ABLE:XMAS)          ::
::                                                      ::
::::  LOFT                                              ::::  MAIN TRANSCEIVER
  ::                                                    ::
++  LOFT                                                ::
  =>  |%                                                ::
      ++  GIFT                                          ::  OUTPUT
        $%  {$EAST P/DUCT Q/SHIP R/CHAN S/*}            ::  NETWORK RESPONSE
            {$HOME P/LANE Q/@}                          ::  RESEND TO SELF
            {$LINE P/SHIP Q/@DA R/CODE}                 ::  ADD OUTBOUND KEY
            {$LINK P/SHIP Q/@DA R/CODE}                 ::  ADD INBOUND KEY
            {$MEET P/GREE}                              ::  ADD PUBLIC KEY(S)
            {$REST P/DUCT Q/COOP}                       ::  MESSAGE RESULT
            {$SEND P/LANE Q/@}                          ::  TRANSMIT PACKET
            {$VEIL P/SHIP}                              ::  CACHE CHANNEL
            {$WEST P/SHIP Q/BOLE R/CHAN S/*}            ::  OUTBOUND MESSAGE
        ==                                              ::
      ++  TASK                                          ::  INPUT
        $%  {$CLUE P/SHIP Q/PIPE}                       ::  UPDATE CHANNEL
            {$DONE P/SHIP Q/BOLE R/COOP}                ::  COMPLETION
            {$HEAR P/LANE Q/@}                          ::  INCOMING PACKET
            {$MESS P/SHIP Q/DUCT R/CHAN S/*}            ::  FORWARD MESSAGE
            {$REND P/SHIP Q/BOLE R/CHAN S/*}            ::  BACKWARD MESSAGE
            {$WAKE $~}                                  ::  WAKEUP
        ==
      --
  =|  $:  $:  NOW/@DA
              ENY/@
          ==
          SILO
          FEX/(LIST GIFT)
      ==
  =*  SYL  ->-
  |%                                                    ::
  ++  ABET  [(FLOP FEX) SYL]                            ::  RESOLVE
  ++  APEX                                              ::  COMPUTE
    |=  JOB/TASK
    ^+  +>
    ?-    -.JOB
        $CLUE  (DEAR P.JOB Q.JOB)
        $DONE  ABET:(DONE:(ETRE P.JOB) Q.JOB R.JOB)
        $HEAR
      =+  KEC=(BITE Q.JOB)
      ?>  =(OUR Q.P.KEC)
      =+  BUH=(~(GET BY POL) P.P.KEC)
      ?~  BUH
        ~&  [%AMES-FROM P.P.KEC]
        =+  NUT=(FALL (~(GET BY ECH) P.P.KEC) *MUTE)
        %_  +>.$
          FEX  [[%VEIL P.P.KEC] FEX]
          ECH  (~(PUT BY ECH) P.P.KEC NUT(INN [+.JOB INN.NUT]))
        ==
      ABET:(~(HEAR ET P.P.KEC U.BUH) P.JOB (SHAF %FLAP Q.JOB) Q.KEC R.KEC)
    ::
        $MESS
      =+  BUH=(~(GET BY POL) P.JOB)
      ?~  BUH
        ~&  [%AMES-UNTO P.JOB]
        =+  NUT=(FALL (~(GET BY ECH) P.JOB) *MUTE)
        %_  +>.$
          FEX  [[%VEIL P.JOB] FEX]
          ECH  (~(PUT BY ECH) P.JOB NUT(OUT [+>.JOB OUT.NUT]))
        ==
      =/  ETC  ~(. ET P.JOB U.BUH)
      =^  KOS  ETC  (BLOW:ETC Q.JOB)
      ABET:(MESS:ETC KOS R.JOB S.JOB)
    ::
        $REND
      ABET:(MESS:(ETRE P.JOB) Q.JOB R.JOB S.JOB)
    ::
        $WAKE
      |-  ^+  +>.^$
      ?~  POL  +>.^$
      =+  LEF=$(POL L.POL)
      =+  RYT=$(POL R.POL, FEX FEX.LEF)
      =+  TOP=~(TO-WAKE ET(FEX FEX.RYT) N.POL)
      +>.^$(FEX FEX.TOP, POL [+<.TOP POL.LEF POL.RYT])
    ==
  ::                                                    ::
  ++  DEAR                                              ::  NEIGHBOR UPDATE
    |=  {WHO/@P DET/PIPE}
    ^+  +>
    =+  NOZ=(~(GET BY ECH) WHO)
    ?~  NOZ
      ::
      ::  WE'RE NOT WAITING FOR THIS SHIP; WE MUST HAVE IT
      ::
      =+  BAH=(~(GOT BY POL) WHO)
      +>.$(POL (~(PUT BY POL) WHO BAH(DET DET)))
    ::
    ::  NEW NEIGHBOR; RUN ALL WAITING I/O
    ::
    =.  POL  (~(PUT BY POL) WHO [DET ~ [2 ~ ~] ~ ~])
    =+  [INN OUT]=[(FLOP INN.U.NOZ) (FLOP OUT.U.NOZ)]
    =.  +>.$
      |-  ^+  +>.^$
      ?~  INN  +>.^$
      $(INN T.INN, +>.^$ (APEX `TASK`[%HEAR I.INN]))
    |-  ^+  +>.^$
    ?~  OUT  +>.^$
    $(OUT T.OUT, +>.^$ (APEX `TASK`[%MESS WHO I.OUT]))
  ::
  ++  DOZE                                              ::  SLEEP UNTIL
    |-  ^-  (UNIT @DA)
    ?~  POL  ~
    ;:  (CURY HUNT LTH)
      $(POL L.POL)
      $(POL R.POL)
      ~(TO-WAIT ET P.N.POL Q.N.POL)
    ==
  ::                                                    ::
  ++  ETRE                                              ::  OLD NEIGHBOR
    |=  WHO/@P
    ~(. ET WHO (~(GOT BY POL) WHO))
  ::                                                    ::
  ++  ET                                                ::  PER NEIGHBOR
    |_  $:  WHO/SHIP
            BAH/BATH
        ==
    ++  ABET  +>(POL (~(PUT BY POL) WHO BAH))           ::  RESOLVE
    ++  ACME  |=(FIC/GIFT +>(FEX [FIC FEX]))            ::  EFFECT
    ++  BLOW                                            ::  REGISTER DUCT
      |=  HEN/DUCT
      ^-  {BOLE _+>}
      =+  KUS=(~(GET BY Q.ZAM.BAH) HEN)
      ?^  KUS  [U.KUS +>.$]
      :-  P.ZAM.BAH
      %=  +>.$
        P.ZAM.BAH  (ADD 2 P.ZAM.BAH)
        Q.ZAM.BAH  (~(PUT BY Q.ZAM.BAH) HEN P.ZAM.BAH)
        R.ZAM.BAH  (~(PUT BY R.ZAM.BAH) P.ZAM.BAH HEN)
      ==
    ::
    ++  DONE
      |=  {KOS/BOLE COP/COOP}
      ^+  +>
      (IN-TASK %DONE +<)
    ::                                                  ::
    ++  HAVE                                            ::  RECEIVE MESSAGE
      |=  {KOS/BOLE CHA/CHAN VAL/*}
      ^+  +>
      ?:  =(0 (END 0 1 KOS))
        =+  HEN=(~(GOT BY R.ZAM.BAH) KOS)
        ::
        ::  IF THE BOLE IS EVEN, THIS IS A BACKWARD FLOW,
        ::  LIKE A SUBSCRIPTION UPDATE; ACK AUTOMATICALLY.
        ::
        (ACME:(IN-TASK %DONE KOS ~) %EAST HEN WHO CHA VAL)
      ::
      ::  IF THE BOLE IS ODD, IT'S A FORWARD FLOW.  WE
      ::  NEED TO WAIT FOR THE TARGET TO ACTIVELY ACK IT.
      ::
      (ACME %WEST WHO KOS CHA VAL)
    ::
    ++  HEAR                                            ::
      |=  {LYN/LANE DAM/FLAP SYN/SKIN MSG/@}            ::  HEAR PACKET
      ^+  +>
      (IN-TASK %HEAR +<)
    ::                                                  ::
    ++  MESS                                            ::  SEND MESSAGE
      |=  {KOS/BOLE CHA/CHAN VAL/*}
      ^+  +>
      (TO-TASK KOS %MESS CHA VAL)
    ::                                                  ::
    ++  SACK                                            ::  SEND ACKNOWLEDGMENT
      |=  {KOS/BOLE DAM/FLAP COP/COOP}
      =+  ^=  YEX
          ((KNIT WHO LYF WYR DET.BAH) NOW ENY [%BACK (MIX KOS 1) DAM COP ~S0])
      =.  +>.$  (TO-GIFS P.YEX)
      |-  ^+  +>.^$
      ?~  Q.YEX  +>.^$
      $(Q.YEX T.Q.YEX, +>.^$ (SEND ~ I.Q.YEX))
    ::                                                  ::
    ++  SEND                                            ::  SEND PACKET
      |=  {URG/(UNIT LANE) PAC/ROCK}
      ^+  +>
      ?:  =(OUR WHO)  (ACME [%SEND *LANE PAC])
      =+  ZAW=SAX.DET.BAH
      |-  ^+  +>.^$
      ?~  ZAW  +>.^$
      =+  ^=  LUN  ^-  (UNIT LANE)
          ?:  (LTH I.ZAW 256)
            ::
            ::  GALAXIES ARE MAPPED INTO RESERVED IP SPACE,
            ::  WHICH THE INTERPRETER MAPS INTO A DNS REQUEST.
            ::
            [~ %IF ~2000.1.1 31.337 (MIX I.ZAW .0.0.1.0)]
          ?:  =(WHO I.ZAW)  LUN.BAH
          =+  HAB=(~(GET BY POL) I.ZAW)
          ?~(HAB ~ LUN.U.HAB)
      ?~  LUN
        $(ZAW T.ZAW)
      =.  PAC  ?:  &(=(I.ZAW WHO) =(~ URG))
                 PAC
               ::
               ::  FORWARDED PACKETS ARE NOT SIGNED/ENCRYPTED,
               ::  BECAUSE (A) WE DON'T NEED TO; (B) WE DON'T
               ::  WANT TO TURN ONE PACKET INTO TWO.  THE WRAPPED
               ::  PACKET MAY EXCEED 8192 BITS, BUT IT'S UNLIKELY
               ::  TO BLOW THE MTU (IP MTU == 1500).
               ::
               (SPIT [OUR I.ZAW] %NONE (JAM `MEAL`[%FORE WHO URG PAC]))
      =.  +>.^$  (ACME %SEND U.LUN PAC)
      ::
      ::  STOP IF WE HAVE AN %IF (DIRECT) ADDRESS;
      ::  CONTINUE IF WE ONLY HAVE %IX (FORWARDED).
      ::
      ?:(?=($IF -.U.LUN) +>.^$ $(ZAW T.ZAW))
    ::
    ++  IN-GIFT
      |=  HOX/GIFT:HOSE
      ^+  +>
      ?-    -.HOX
          $FORE
        ?:  =(OUR HER.HOX)
          (ACME %HOME ORG.HOX PAC.HOX)
        (SEND(WHO HER.HOX) [~ ORG.HOX] PAC.HOX)
      ::
          $HAVE  (HAVE +.HOX)
          $LINK  (ACME %LINK WHO EXP.HOX KEY.HOX)
          $MEET  (ACME HOX)
          $RACK  (TO-TASK KOS.HOX %BACK DAM.HOX COP.HOX ~S0)
          $ROUT  +>(LUN.BAH `LYN.HOX)
          $SACK  (SACK +.HOX)
      ==
    ::
    ++  IN-GIFS
      |=  HOZ/(LIST GIFT:HOSE)
      ?~  HOZ  +>
      $(HOZ T.HOZ, +> (IN-GIFT I.HOZ))
    ::
    ++  TO-GIFT
      |=  RAX/GIFT:RAIL
      ?-  -.RAX
        $LINE  (ACME %LINE WHO ~2018.1.1 Q.RAX)
        $MACK  (ACME %REST (~(GOT BY R.ZAM.BAH) P.RAX) Q.RAX)
        $SEND  (SEND ~ Q.RAX)
      ==
    ::
    ++  TO-GIFS
      |=  RAZ/(LIST GIFT:RAIL)
      ?~  RAZ  +>
      $(RAZ T.RAZ, +> (TO-GIFT I.RAZ))
    ::
    ++  IN-TASK
      |=  KYZ/TASK:HOSE
      ^+  +>
      =^  HOZ  FON.BAH  ABET:(~(APEX HOSE [WHO WYR DET.BAH] ~ FON.BAH) KYZ)
      (IN-GIFS HOZ)
    ::
    ++  TO-TASK
      |=  {KOS/BOLE KYZ/TASK:RAIL}
      ^+  +>
      =+  COT=((BOND |.(ZEAL:RAIL)) (~(GET BY SAL.BAH) KOS))
      =^  RAZ  COT  ABET:(WORK:(TO-RAIL KOS COT) KYZ)
      (TO-GIFS RAZ)
    ::
    ++  TO-RAIL
      |=  {KOS/BOLE COT/COLT}
      ~(. RAIL [[WHO LYF WYR DET.BAH] [NOW ENY] KOS (YAWN:PUMP MYN.COT) ~] COT)
    ::
    ++  TO-WAIT
      |-  ^-  (UNIT @DA)
      ?~  SAL.BAH  ~
      ;:  (CURY HUNT LTH)
        $(SAL.BAH L.SAL.BAH)
        $(SAL.BAH R.SAL.BAH)
        WAIT:(TO-RAIL P.N.SAL.BAH Q.N.SAL.BAH)
      ==
    ::
    ++  TO-WAKE
      |-  ^+  +.$
      ?~  SAL.BAH  +.$
      =+  LEF=$(SAL.BAH L.SAL.BAH)
      =+  RYT=$(SAL.BAH R.SAL.BAH, FEX FEX.LEF)
      =+  TOP=(WORK:(TO-RAIL(FEX FEX.RYT) P.N.SAL.BAH Q.N.SAL.BAH) %WAKE ~)
      +.$(FEX FEX.RYT, SAL.BAH [[KOS COT]:TOP SAL.BAH.LEF SAL.BAH.RYT])
    --
  --
  ::
  ::::  INBOUND CORES
    ::
::                                                      ::
::::  BITE                                              ::::  PACKET FORMAT
  ::                                                    ::
++  BITE                                                ::  PACKET TO CAKE
  |=  PAC/ROCK  ^-  CAKE
  =+  [MAG=(END 5 1 PAC) BOD=(RSH 5 1 PAC)]
  =+  :*  VEZ=(END 0 3 MAG)                             ::  PROTOCOL VERSION
          CHK=(CUT 0 [3 20] MAG)                        ::  CHECKSUM
          WIX=(BEX +((CUT 0 [23 2] MAG)))               ::  WIDTH OF RECEIVER
          VIX=(BEX +((CUT 0 [25 2] MAG)))               ::  WIDTH OF SENDER
          TAY=(CUT 0 [27 5] MAG)                        ::  MESSAGE TYPE
      ==
  ?>  =(7 VEZ)
  ?>  =(CHK (END 0 20 (MUG BOD)))
  :+  [(END 3 WIX BOD) (CUT 3 [WIX VIX] BOD)]
    (KINS TAY)
  (RSH 3 (ADD WIX VIX) BOD)
::
++  KINS  |=(TAY/@ (SNAG TAY `(LIST SKIN)`[%NONE %OPEN %FAST %FULL ~]))
++  KSIN  |=(SIN/SKIN `@`?-(SIN $NONE 0, $OPEN 1, $FAST 2, $FULL 3))
::
++  SPIT                                                ::  CAKE TO PACKET
  |=  KEC/CAKE  ^-  @
  =+  WIM=(MET 3 P.P.KEC)
  =+  DUM=(MET 3 Q.P.KEC)
  =+  YAX=?:((LTE WIM 2) 0 ?:((LTE WIM 4) 1 ?:((LTE WIM 8) 2 3)))
  =+  QAX=?:((LTE DUM 2) 0 ?:((LTE DUM 4) 1 ?:((LTE DUM 8) 2 3)))
  =+  WIX=(BEX +(YAX))
  =+  VIX=(BEX +(QAX))
  =+  BOD=:(MIX P.P.KEC (LSH 3 WIX Q.P.KEC) (LSH 3 (ADD WIX VIX) R.KEC))
  =+  TAY=(KSIN Q.KEC)
  %+  MIX
    %+  CAN  0
    :~  [3 7]
        [20 (MUG BOD)]
        [2 YAX]
        [2 QAX]
        [5 TAY]
    ==
  (LSH 5 1 BOD)
::                                                      ::
::::  NOSE                                              ::::  PACKET DECODER
  ::                                                    ::
++  NOSE  !:
  =>  |%
      ++  GIFT                                          ::  SIDE EFFECT
        $%  {$LINK EXP/@DA KEY/CODE}                    ::  LEARN SYMMETRIC KEY
            {$MEET DOY/GREE}                            ::  LEARN PUBLIC KEY(S)
        ==                                              ::
      --
  |=  $:  HIM/@P
          WYR/(MAP LIFE RING)
          DET/PIPE
      ==
  |=  {SYN/SKIN MSG/@}
  ^-  (PAIR (LIST GIFT) {AUT/? HAM/MEAL})
  |^  ?-    SYN
          $NONE  [~ | (MAUL MSG)]
          $FAST
        =+  [MAG=`HAND`(END 7 1 MSG) BOD=(RSH 7 1 MSG)]
        =+  KEY=Q:(~(GOT BY INN.DET) MAG)
        =+  CLR=(NEED (DE:CRUB:CRYPTO KEY BOD))
        [~ & (MAUL CLR)]
      ::
          $FULL
        =+  MEX=((HARD {P/{P/LIFE Q/LIFE} Q/GREE R/@}) (CUE MSG))
        =+  RIG=(~(GOT BY WYR) P.P.MEX)
        =+  PAS=(WHOM Q.P.MEX Q.MEX)
        =+  MES=(NEED (TEAR:AS:(NOL:NU:CRUB:CRYPTO RIG) PAS R.MEX))
        =+  [KEY OUT]=((HARD (PAIR @UX @UX)) (CUE MES))
        :-  :~  [%LINK ~2018.1.1 KEY]
                [%MEET Q.MEX]
            ==
        [& (MAUL OUT)]
      ::
          $OPEN
        =+  MEX=((HARD {P/{$~ Q/LIFE} Q/GREE R/@}) (CUE MSG))
        =+  PAS=(WHOM Q.P.MEX Q.MEX)
        =+  OUT=(NEED (SURE:AS:(COM:NU:CRUB:CRYPTO PAS) R.MEX))
        [[%MEET Q.MEX]~ & (MAUL R.MEX)]
      ==
  ++  MAUL  |=(@ `MEAL`((HARD MEAL) (CUE +<)))          ::  UNPACK MESSAGE
  ++  WHOM                                              ::  SELECT PUBLIC KEY
    |=  {LYF/LIFE GYR/GREE}
    ^-  PASS
    ::
    ::  IF WE HAVE THE PUBLIC KEY FOR THIS LIFE, USE IT.
    ::  OTHERWISE, USE THE KEY THE SENDER SENT, WITHOUT
    ::  WITHOUT CHECKING ITS VALIDITY.  INVALID PUBLIC-KEY
    ::  DATA WILL CRASH THE PACKET WHEN WE INSTALL IT.
    ::
    %-  (BOND |.(PUB.DAT:(~(GOT BY (~(GOT BY GYR) LYF)) HIM)))
    (BIND (~(GET BY PUB.DET) LYF) |=(CERT:PKI:JAEL PUB.DAT))
  --
::                                                      ::
::::  HOSE                                              ::
  ::                                                    ::
++  HOSE                                                ::  INPUT DECODER
  =>  |%                                                ::
      ++  GIFT                                          ::  ACTION
        $%  {$FORE HER/SHIP ORG/LANE PAC/ROCK}          ::  SEND FORWARD
            {$HAVE KOS/BOLE CHA/CHAN VAL/*}             ::  REPORT MESSAGE
            {$LINK EXP/@DA KEY/CODE}                    ::  LEARN SYMMETRIC KEY
            {$MEET DOY/GREE}                            ::  LEARN PUBLIC KEY
            {$RACK KOS/BOLE DAM/FLAP COP/COOP}          ::  REPORT ACK
            {$ROUT LYN/LANE}                            ::  LEARN ROUTE
            {$SACK KOS/BOLE DAM/FLAP COP/COOP}          ::  SEND ACK
        ==                                              ::
      ++  TASK                                          ::  EVENT
        $%  {$DONE KOS/BOLE COP/COOP}                   ::  COMMIT MESSAGE
            {$HEAR LYN/LANE DAM/FLAP SYN/SKIN MSG/@}    ::  RAW PACKET
        ==                                              ::
      --                                                ::
  =|  $:  $:  HIM/SHIP                                  ::
              WYR/(MAP LIFE RING)                       ::
              DET/PIPE                                  ::
          ==                                            ::
          FEX/(LIST GIFT)                               ::
          FON/(MAP BOLE LOCK)                           ::
      ==
  |%                                                    ::
  ++  ABET  [(FLOP FEX) FON]                            ::  RESOLVE
  ++  ACME  |=(FIC/GIFT +>(FEX [FIC FEX]))              ::  EFFECT
  ++  ACTS                                              ::  EFFECTS
    |=(FIX/(LIST GIFT) +>(FEX (WELD (FLOP FIX) FEX)))   ::
  ::                                                    ::
  ++  APEX                                              ::  INPUT
    |=  JOB/TASK
    ^+  +>
    ?-    -.JOB
        $DONE
      =+  LOC=(~(GOT BY FON) KOS.JOB)
      ?>  ?=(^ LAZ.LOC)
      =<  HY-ABET
      (~(HY-DONE HY [KOS.JOB P.U.LAZ.LOC] [& [Q R]:U.LAZ.LOC] LOC) COP.JOB)
    ::
        $HEAR
      =+  PET=((NOSE HIM WYR DET) SYN.JOB MSG.JOB)
      =.  +>.$  (ACTS P.PET)
      ::  IF PACKET IS AUTHENTICATED, USE ITS ROUTING INFO
      =.  +>.$  ?.(AUT.Q.PET +>.$ (ACME %ROUT LYN.JOB))
      ?-    -.HAM.Q.PET
          $BACK
        ~|  %UNSECURED-BACK
        ?>(AUT.Q.PET (ACME %RACK [P Q R]:HAM.Q.PET))
      ::
          $BOND
        =+  LOC=((BOND |.(*LOCK)) (~(GET BY FON) P.P.HAM.Q.PET))
        =<  HY-ABET
        %.  [Q R]:HAM.Q.PET
        ~(HY-BOND HY P.HAM.Q.PET [AUT.Q.PET [DAM LYN]:JOB] LOC)
      ::
          $CARP
        =+  LOC=((BOND |.(*LOCK)) (~(GET BY FON) KOS.P.HAM.Q.PET))
        =<  HY-ABET
        %.  [(KINS SYN.P.HAM.Q.PET) CNT.P.HAM.Q.PET Q.HAM.Q.PET]
        ~(HY-CARP HY [KOS LIQ]:P.HAM.Q.PET [AUT.Q.PET [DAM LYN]:JOB] LOC)
      ::
          $FORE
        (ACME %FORE P.HAM.Q.PET (BORN LYN.JOB Q.HAM.Q.PET) R.HAM.Q.PET)
      ==
    ==
  ::                                                    ::
  ++  BORN                                              ::  SET FORWARD ORIGIN
    |=  {LYN/LANE URG/(UNIT LANE)}
    ^-  LANE
    ::  A FORWARDED PACKET CONTAINS ITS ORIGIN ADDRESS,
    ::  BUT ONLY AFTER THE FIRST HOP.  IF THE ADDRESS
    ::  FIELD IS EMPTY, WE FILL IT IN WITH THE ADDRESS
    ::  WE RECEIVED THE PACKET FROM.  BUT WE REPLACE
    ::  %IF WITH %IX, TO SHOW THAT THE ULTIMATE RECEIVER
    ::  MAY NOT BE ABLE TO SEND BACK TO THE ORIGIN
    ::  (DUE TO NON-FULL-CONE NAT).
    ?~  URG  LYN
    ?.  ?=($IF -.U.URG)
      U.URG
    [%IX +.U.URG]
  ::
  ++  HY                                                ::  MESSAGE ASSEMBLER
    =|  $:  $:  KOS/BOLE                                ::  SENDER
                LIQ/TICK                                ::  MESSAGE NUMBER
            ==
            $:  AUT/?                                   ::  AUTHENTICATED
                DAM/FLAP                                ::  CRITICAL FLAP
                LYN/LANE                                ::  ORIGIN ADDRESS
            ==
            LOCK
        ==
    =*  LOQ  ->+
    |%                                                  ::
    ++  HY-ABET  ..HY(FON (~(PUT BY FON) KOS LOQ))      ::  RESOLVE
    ++  HY-ACME  |=(FIC/GIFT +>(+> (ACME FIC)))         ::  EFFECT
    ++  HY-ACTS  |=(FIX/(LIST GIFT) +>(+> (ACTS FIX)))  ::  EFFECTS
    ++  HY-BOND                                         ::  FULL MESSAGE
      |=   {CHA/CHAN VAL/*}
      ^+  +>
      ?:  (LTH LIQ LAQ)
        ::  WE ALREADY ACKED THIS MSG; ACK IT AGAIN
        ::  ~&  [%HI-BOND-LOW [KOS LIQ] LAQ]
        HY-CONG
      ?:  (GTH LIQ LAQ)
        ::  LATER THAN THE NEXT MSG; IGNORE
        ~&  [%HY-BOND-AFTER [KOS LIQ] LAQ]
        +>
      ?:  !=(~ LAZ)
        ::  THIS MSG IS ALREADY BEING PROCESSED; IGNORE
        ~&  [%HY-BOND-DURING [KOS LIQ] LAQ]
        +>
      ::  REPORT COMPLETED MESSAGE
      %.  [%HAVE KOS CHA VAL]
      %=  HY-ACME
        ::  DELETE PARTIAL MESSAGE
        NYS  (~(DEL BY NYS) LIQ)
        ::  RECORD MESSAGE IN APPLICATION PROCESSING
        LAZ  `[LIQ DAM LYN]
      ==
    ::                                                  ::
    ++  HY-DONE                                         ::  MESSAGE COMPLETED
      |=  COP/COOP
      ^+  +>
      (HY-CONE(LAQ +(LAQ), LAZ ~) COP)
    ::                                                  ::
    ++  HY-CARP                                         ::  PROCESS FRAGMENT
      |=  {SYN/SKIN CNT/@UD FAR/(PAIR @UD @)}
      ^+  +>
      ::  ~&  [%CARP FAP/`@P`(MUG FAP) SYN/SYN CNT/CNT FAR/P.FAR]
      ?:  (LTH LIQ LAQ)
        ::  FRAGMENT OF A MESSAGE WE'VE ALREADY ACKNOWLEDGED - ACK IT AGAIN.
        ::  ~&  [%HY-CARP-LATE LIQ LAQ]
        HY-CONG
      ?:  (GTH LIQ LAQ)
        ::  FRAGMENT OF A MESSAGE AFTER THE NEXT WE EXPECT - DROP IT.
        ::  ~&  [%HY-CARP-EARLY LIQ LAQ]
        +>
      ::  NEB: CURRENT INCOMPLETE MESSAGE
      =+  NEB=`BAIT`(FALL (~(GET BY NYS) LIQ) [SYN 0 [CNT ~]])
      ::  ALL FRAGMENTS MUST AGREE ON THE MESSAGE PARAMETERS
      ?>  &(=(P.NEB SYN) (GTH P.R.NEB P.FAR) =(P.R.NEB CNT))
      =+  DOY=(~(GET BY Q.R.NEB) P.FAR)
      ?^  DOY
        ::  WE'VE ALREADY HEARD THIS FRAGMENT
        (HY-CONK ~)
      ::  INSTALL FRAGMENT
      =:  Q.R.NEB  (~(PUT BY Q.R.NEB) P.FAR Q.FAR)
          Q.NEB    +(Q.NEB)
        ==
      ?.  =(Q.NEB P.R.NEB)
        ::  MESSAGE NOT YET COMPLETE, REINSTALL INCOMPLETE
        (HY-CONK(NYS (~(PUT BY NYS) LIQ NEB)) ~)
      ::  DECODE COMPLETE MESSAGE
      =+  PET=((NOSE HIM WYR DET) SYN (HY-GOLF R.NEB))
      ::  RECORD DECODER EFFECTS
      =.  +>.$  (HY-ACTS P.PET)
      =.  AUT  |(AUT AUT.Q.PET)
      ?-  -.HAM.Q.PET
        $BACK  ~|(%UNSECURED-BACK ?>(AUT (HY-ACME %RACK KOS [Q R]:HAM.Q.PET)))
        $CARP  ~|(%META-CARP !!)
        $FORE  (HY-ACME %FORE P.HAM.Q.PET (BORN LYN Q.HAM.Q.PET) R.HAM.Q.PET)
        $BOND  ~|  %BOGUS-ASSEMBLY
               ?>  &(AUT =([KOS LIQ] P.HAM.Q.PET))
               (HY-BOND [Q R]:HAM.Q.PET)
      ==
    ::
    ++  HY-CONG  (HY-CONK (~(GET BY EXC) LIQ))          ::  DUPLICATE ACK
    ++  HY-CONK                                         ::  ACK CURRENT
      |=(COP/COOP (HY-ACME %SACK KOS DAM COP))
    ++  HY-CONE                                         ::  RECORD ACK
      |=  COP/COOP
      =>  ?~(COP . .(EXC (~(PUT BY EXC) LIQ U.COP)))
      (HY-CONK COP)
    ::                                                  ::
    ++  HY-GOLF                                         ::  ASSEMBLE FRAGMENTS
      |=  DUV/DOVE
      =+  [NIX=0 RAX=*(LIST @)]
      |-  ^-  @
      ?:  =(P.DUV NIX)
        (CAN 13 (TURN (FLOP RAX) |=(A/@ [1 A])))
      $(NIX +(NIX), RAX [(NEED (~(GET BY Q.DUV) NIX)) RAX])
    --
  --
::                                                      ::
::::  OUTBOUND CORES                                    ::::
  ::                                                    ::
::
::::  PACKET PUMP
  ::
++  PUMP                                                ::  PACKET PUMP
  =>  |%                                                ::
      ++  GIFT                                          ::  EFFECT
        $%  {$GOOD P/FLAP Q/PART R/@DR S/COOP}          ::  LOGICAL ACK
            {$SEND P/FLAP Q/PART R/ROCK}                ::  RELEASE PACKET
        ==                                              ::
      ++  TASK                                          ::  EVENT
        $%  {$BACK P/FLAP Q/COOP R/@DR}                 ::  RAW ACK
            {$CULL P/TICK}                              ::  CANCEL MESSAGE
            {$PACK P/(LIST CLUE)}                       ::  SUBMIT PACKETS
            {$WAKE $~}                                  ::  RANDOM WAKEUP
        ==                                              ::
      --
  |%
  ++  YAWN                                              ::
    |=  MYN/MINI                                        ::
    ^+  ZU
    ~(. ZU ~ MYN)                                       ::
  ::
  ++  ZU                                                ::  STATE MACHINE
    |_  $:  FEX/(LIST GIFT)                             ::  EFFECTS
            MINI                                        ::  STATE
        ==
    ::                                                  ::
    ++  ABBA                                            ::  A OLDER THAN B
      |=  {A/PART B/PART}
      |((LTH Q.A Q.B) &(=(Q.A Q.B) (LTH P.A P.B)))
    ::                                                  ::
    ++  ABET                                            ::  RESOLVE
      ^-  {(LIST GIFT:PUMP) MINI}
      ::  =.  .  AVER
      [(FLOP FEX) +<+]
    ::                                                  ::
    ++  AVER                                            ::  VERIFY
      ?>  (LTE CUR.SAW MAX.SAW)
      ?>  !=(0 MAX.SAW)
      ?.  =(CUR.SAW (LENT ~(TAP TO LIV)))
        ~&  [%AVER-CUR CUR.SAW (LENT ~(TAP TO LIV))]
        !!
      ?>  =(REY.SAW (LENT ~(TAP TO LOP)))
      ?>  =+  |=  {A/COAL B/COAL}
              &((LTH OUT.A OUT.B) (LTH LOD.A LOD.B))
          |-  ?|  ?=($~ LIV)
                  ?&  ?|  ?=($~ R.LIV)
                          ?&  (+< N.R.LIV N.LIV)
                              $(LIV R.LIV)
                      ==  ==
                      ?|  ?=($~ L.LIV)
                          ?&  (+< N.LIV N.L.LIV)
                              $(LIV L.LIV)
                      ==  ==
                  ==
              ==
      ?>  =+  |=  {A/PART B/PART}
              |((LTH Q.A Q.B) &(=(Q.A Q.B) (LTH P.A P.B)))
          |-  ?|  ?=($~ LOP)
                  ?&  ?|  ?=($~ R.LOP)
                          ?&  (+< TEL.N.R.LOP TEL.N.LOP)
                              $(LOP R.LOP)
                      ==  ==
                      ?|  ?=($~ L.LOP)
                          ?&  (+< TEL.N.LOP TEL.N.L.LOP)
                              $(LOP L.LOP)
                      ==  ==
                  ==
              ==
      .
    ::                                                  ::
    ++  BACK                                            ::  PROCESS RAW ACK
      |=  {NOW/@DA DAM/FLAP COP/COOP LAG/@DR}
      ^+  +>
      =-  =/  RTT  ?~(ACK ~S0 (SUB NOW OUT.U.ACK))
          =.  RTT  ?:((GTH RTT LAG) (SUB RTT LAG) RTT)
          (DONE:(LOSE(LIV LOV) DED) ACK DAM COP RTT)
      |-  ^-  $:  ACK/(UNIT COAL)
                  DED/(LIST COAL)
                  LOV/(QEU COAL)
              ==
      ?~  LIV  [~ ~ ~]
      =+  RYT=$(LIV R.LIV)
      ?^  ACK.RYT
        ::
        ::  FOUND IN FRONT, NO NEED TO SEARCH BACK.
        ::
        [ACK.RYT DED.RYT [N.LIV L.LIV LOV.RYT]]
      ::
      ::  LOSE UNACKED PACKETS SENT BEFORE AN ACKED VIRGIN.
      ::
      =+  ^-  $:  TOP/?
                  ACK/(UNIT COAL)
                  DED/(LIST COAL)
                  LOV/(QEU COAL)
              ==
          ?:  =(DAM FAP.CLU.N.LIV)
            [| `N.LIV ~ L.LIV]
          [& $(LIV L.LIV)]
      ?~  ACK  [~ ~ LIV]
      =.  DED  ?:(TOP [N.LIV DED] DED)
      =?  DED  VIG.CLU.U.ACK  (WELD ~(TAP TO R.LIV) DED)
      =.  LOV  ?:(TOP [N.LIV LOV ~] LOV)
      [ACK DED LOV]
    ::                                                  ::
    ++  CLAP                                            ::  ORDERED ENQUEUE
      ::
      ::  THE `LOP` QUEUE ISN'T REALLY A QUEUE IN CASE OF
      ::  RESENT PACKETS; PACKETS FROM OLDER MESSAGES
      ::  NEED TO BE SENT FIRST.  UNFORTUNATELY HOON.HOON
      ::  LACKS A GENERAL SORTED/BALANCED HEAP RIGHT NOW.
      ::  SO WE IMPLEMENT A BALANCED QUEUE INSERT BY HAND.
      ::
      |=  CLU/CLUE
      %_    +>
          LOP
        |-  ^+  LOP
        ?~  LOP  [CLU ~ ~]
        ?:  ?|  (ABBA TEL.CLU TEL.N.LOP)
                ?&  =(TEL.CLU TEL.N.LOP)
                    (LTH FAP.CLU FAP.N.LOP)
            ==  ==
          [N.LOP L.LOP $(LOP R.LOP)]
        [N.LOP $(LOP L.LOP) R.LOP]
      ==
    ::                                                  ::
    ++  CULL                                            ::  CLEAR MESSAGE
      |=  TIQ/TICK
      %_    +>
          LIV
        |-  ^+  LIV
        ?~  LIV  ~
        =+  VIL=[N.LIV $(LIV L.LIV) $(LIV R.LIV)]
        ?.  =(TIQ Q.TEL.CLU.N.LIV)  VIL
        ~(NIP TO `(QEU COAL)`VIL)
      ::
          LOP
        |-  ^+  LOP
        ?~  LOP  ~
        =+  POL=[N.LOP $(LOP L.LOP) $(LOP R.LOP)]
        ?:  =(TIQ Q.TEL.N.LOP)  POL
        ~(NIP TO `(QEU CLUE)`POL)
      ==
    ::                                                  ::
    ++  DONE                                            ::  PROCESS COOKED ACK
      |=  {LYD/(UNIT COAL) DAM/FLAP COP/COOP RTT/@DR}
      ^+  +>
      ?~  LYD  +>
      %_  +>
        CUR.SAW  (DEC CUR.SAW)
        FEX      [[%GOOD DAM TEL.CLU.U.LYD RTT COP] FEX]
      ==
    ::                                                  ::
    ++  FIRE                                            ::  SEND A PACKET
      |=  {NOW/@DA CLU/CLUE}
      ^+  +>
      ?>  (LTH CUR.SAW MAX.SAW)
      =+  OUT=?:((LTE NOW LAS.SAW) +(LAS.SAW) NOW)
      =+  LOD=(ADD NOW (MUL 2 RTT.SAW))
      =.  LOD  ?:((GTH LOD LAD.SAW) LOD +(LAD.SAW))
      ::  ~&  [%FIRE (FLAM FAP.CLU) `@DA`OUT `@DA`LOD]
      %=  +>.$
        FEX      [[%SEND FAP.CLU TEL.CLU DAT.CLU] FEX]
        LAS.SAW  OUT
        LAD.SAW  LOD
        CUR.SAW  +(CUR.SAW)
        LIV      (~(PUT TO LIV) [OUT LOD CLU])
      ==
    ::                                                  ::
    ++  FLAY                                            ::  TIME OUT PACKETS
      |=  NOW/@DA
      ^+  +>
      =-  (LOSE(LIV Q.OLE) P.OLE)
      ^=  OLE
      =|  DED/(LIST COAL)
      |-  ^+  [P=DED Q=LIV]
      ?~  LIV  [DED ~]
      ?:  (GTE NOW LOD.N.LIV)
        ::
        ::  EVERYTHING IN FRONT OF A DEAD PACKET IS DEAD
        ::
        $(LIV L.LIV, DED (WELP ~(TAP TO R.LIV) [N.LIV DED]))
      =+  RYT=$(LIV R.LIV)
      [P.RYT [N.LIV L.LIV Q.RYT]]
    ::                                                  ::
    ++  LOSE                                            ::  ABANDON PACKETS
      |=  CUD/(LIST COAL)
      ^+  +>
      ?~  CUD  +>
      =.  +>  (CLAP CLU.I.CUD)
      %=    $
        CUD      T.CUD
        CUR.SAW  (DEC CUR.SAW)
        REY.SAW  +(REY.SAW)
      ==
    ::                                                  ::
    ++  SHIP                                            ::  SEND PACKETS
      |=  {NOW/@DA CLY/(LIST CLUE)}
      ^+  +>
      ?:  (GTE CUR.SAW MAX.SAW)  +>
      ?:  =(0 REY.SAW)
        ?~  CLY  +>
        $(CLY T.CLY, +> (FIRE NOW I.CLY))
      =^  CLU  LOP  ~(GET TO LOP)
      $(+> (FIRE(REY.SAW (DEC REY.SAW)) NOW CLU))
    ::                                                  ::
    ++  WAIT                                            ::  NEXT WAKEUP
      ^-  (UNIT @DA)
      =+  TUP=`(UNIT COAL)`~(TOP TO LIV)
      ?~(TUP ~ `LOD.U.TUP)
    ::                                                  ::
    ++  WANT                                            ::  WINDOW SPACE
      ^-  @UD
      ?:  (GTE CUR.SAW MAX.SAW)  0
      =+  GAP=(SUB MAX.SAW CUR.SAW)
      ?:  (GTE REY.SAW GAP)  0
      (SUB GAP REY.SAW)
    ::
    ++  WORK                                            ::
      |=  {NOW/@DA JOB/TASK}                            ::  PERFORM
      ^+  +>
      ?-  -.JOB
        $BACK  (BACK NOW [P Q R]:JOB)
        $CULL  (CULL P.JOB)
        $PACK  (SHIP NOW P.JOB)
        $WAKE  (FLAY NOW)
      ==
    --
  --
::                                                      ::
::::  KNIT                                              ::::  MESSAGE ENCODER
  ::                                                    ::
++  KNIT
  =>  |%
      ++  GIFT                                          ::  SIDE EFFECT
        $%  {$LINE EXP/@DA KEY/CODE}                    ::  SET SYMMETRIC KEY
        ==                                              ::
      --
  |=  {HER/@P LYF/LIFE WYR/(MAP LIFE RING) DET/PIPE}
  |=  {NOW/@DA ENY/@ HAM/MEAL}
  =+  HOM=(JAM HAM)
  ^-  (PAIR (LIST GIFT) (LIST ROCK))
  =<  WEFT
  |%
  ++  WAIN                                              ::  MESSAGE IDENTITY
    ^-  FLEA
    ?+  -.HAM  [0 0]
      $BOND  P.HAM
      $CARP  [KOS LIQ]:P.HAM
    ==
  ::
  ++  WASP  ^-({P/SKIN Q/@} [%NONE HOM])                ::  NULL SECURITY
  ++  WEFT                                              ::  FRAGMENT MESSAGE
    ^-  (PAIR (LIST GIFT) (LIST ROCK))
    =+  GUM=WISP
    :-  P.GUM
    =+  WIT=(MET 13 Q.Q.GUM)
    ?:  =(1 WIT)
      ::  MESSAGE FITS IN ONE PACKET, DON'T FRAGMENT
      [(SPIT [OUR HER] P.Q.GUM Q.Q.GUM) ~]
    =+  RUV=(RIP 13 Q.Q.GUM)
    =+  INX=0
    |-  ^-  (LIST ROCK)
    ?~  RUV  ~
    :_  $(RUV T.RUV, INX +(INX))
    %+  SPIT
      [OUR HER]
    WASP(HAM [%CARP [WAIN (KSIN P.Q.GUM) WIT] INX I.RUV])
  ::
  ++  WISP                                              ::  GENERATE MESSAGE
    ^-  (PAIR (LIST GIFT) (PAIR SKIN @))
    ?:  =(%CARP -.HAM)
      [~ WASP]
    ?^  OUT.DET
      :-  ~
      :-  %FAST
      %^  CAT  7
        P.U.OUT.DET
      (EN:CRUB:CRYPTO Q.Q.U.OUT.DET HOM)
    =+  CRY=(NOL:NU:CRUB:CRYPTO (~(GOT BY WYR) LYF))
    ?~  CUR.DET
      :-  ~
      :-  %OPEN
      %^    JAM
          [~ LYF]
        `GREE`!!
      (SIGN:AS:CRY HOM)
    =+  KEY=(SHAZ :(MIX (MUG HAM) NOW ENY))
    :-  [%LINE ~2018.1.1 KEY]~
    :-  %FULL
    %^    JAM
        [U.CUR.DET LYF]
      `GREE`!!
    (SEAL:AS:CRY PUB.DAT:(~(GOT BY PUB.DET) U.CUR.DET) (JAM KEY HOM))
  --
::                                                      ::
::::  RAIL                                              ::::  MESSAGE MANAGER
  ::                                                    ::
++  RAIL                                                ::
  =>  |%                                                ::
      ++  GIFT                                          ::
        $%  {$LINE P/@DA Q/CODE}                        ::  SENT KEY
            {$MACK P/BOLE Q/COOP}                       ::  MESSAGE ACK
            {$SEND P/FLAP Q/ROCK}                       ::  RELEASE PACKET
        ==                                              ::
      ++  TASK                                          ::
        $%  {$BACK P/FLAP Q/COOP R/@DR}                 ::  RAW ACK
            {$MESS P/CHAN Q/*}                          ::  SEND MESSAGE
            {$WAKE $~}                                  ::  RANDOM WAKEUP
        ==                                              ::
      --                                                ::
  =|  $:  $:  $:  HER/SHIP
                  LYF/LIFE
                  WYR/(MAP LIFE RING)
                  DET/PIPE
              ==
              $:  NOW/@DA
                  ENY/@
              ==
              KOS/BOLE
              MUP/_(YAWN:PUMP)
              FEX/(LIST GIFT)
          ==
          COLT
      ==
  =*  COT  ->
  |%                                                    ::
  ++  ABET  [(FLOP FEX) `COLT`COT]                      ::  RESOLVE
  ++  VIEW                                              ::  INSPECT
    |%                                                  ::
    ++  BULK                                            ::  QUEUE COUNT
      ^-  @UD
      |-(?~(COB 0 :(ADD 1 $(COB L.COB) $(COB R.COB))))
    ::                                                  ::
    ++  WAIT                                            ::  NEXT WAKEUP
      ^-  (UNIT @DA)
      WAIT:MUP
    --
  ::
  ++  WORK                                              ::
    |=  JOB/TASK                                        ::  COMPUTE
    ^+  +>
    =<  +>:WY-ABET:WY-WORK
    |%                                                  ::
    ++  WY-ABET  +:WY-ABLE                              ::  RESOLVE
    ++  WY-ABLE  WY-TIRE:WY-ABLY:WY-FEED:WY-ABLY        ::  CONVERGE
    ++  WY-ABLY                                         ::  DRAIN
      ^+  .
      =^  FIX  MYN  ABET:MUP
      =.  MUP  (YAWN:PUMP MYN)
      |-  ^+  +>.$
      ?~  FIX  +>.$
      $(FIX T.FIX, +>.$ (WY-ABUT I.FIX))
    ::                                                  ::
    ++  WY-ABUT                                         ::  PUMP EFFECT
      |=  FIC/GIFT:PUMP
      ^+  +>
      ?-    -.FIC
          $GOOD
        ~&  [%OK HER `@P`(MUG P.FIC) R.FIC]
        (WY-GOOD Q.FIC S.FIC)
      ::
          $SEND
        ~&  [%GO HER `@P`(MUG P.FIC) Q.FIC]
        +>(FEX [[%SEND P.FIC R.FIC] FEX])
      ==
    ::                                                  ::
    ++  WY-BACK                                         ::  HEAR AN ACK
      |=  {DAM/FLAP COP/COOP LAG/@DR}
      ~&  [%WY-BACK (FLAM DAM) COP LAG]
      +>(MUP (WORK:MUP NOW %BACK DAM COP LAG))
    ::                                                  ::
    ++  WY-FEED                                         ::  FEED PUMP
      ^+  .
      =^  CLY  .  (WY-FIND WANT.MUP)
      ~&  [%WY-FEED WANT.MUP (LENT CLY)]
      +(MUP (WORK:MUP NOW %PACK CLY))
    ::                                                  ::
    ++  WY-FIND                                         ::  COLLECT PACKETS
      |=  MAY/@UD
      ^-  {(LIST CLUE) _+>}
      =-  [(FLOP -<) ->]
      =+  [INX=LAC HAV=*(LIST CLUE)]
      |-  ^-  {(LIST CLUE) _+>.^$}
      ?:  |(=(0 MAY) =(INX SEQ))  [HAV +>.^$]
      =^  HEY  +>.^$  (WY-FLOW INX MAY HAV)
      $(INX +(INX), MAY P.HEY, HAV Q.HEY)
    ::                                                  ::
    ++  WY-FLOW                                         ::  COLLECT BY MESSAGE
      |=  {TIQ/TICK MAY/@UD HAV/(LIST CLUE)}
      =+  MOB=(~(GOT BY COB) TIQ)
      |-  ^-  {(PAIR @UD (LIST CLUE)) _+>.^$}
      ?:  |(=(0 MAY) ?=($~ CLY.MOB))
        [[MAY HAV] +>.^$(COB (~(PUT BY COB) TIQ MOB))]
      %=  $
        MAY      (DEC MAY)
        HAV      [I.CLY.MOB HAV]
        CLY.MOB  T.CLY.MOB
      ==
    ::                                                  ::
    ++  WY-GOOD                                         ::  MESSAGE ACK
      |=  {PAZ/PART COP/COOP}
      ^+  +>
      =+  BUM=(~(GET BY COB) Q.PAZ)
      ?:  |(?=($~ BUM) =(~ CLY.U.BUM))
        ~&  [%WY-GOOD-IGNORE PAZ ?=($~ COP)]
        +>.$
      ?^  COP
        ::
        ::  A FAILURE; SAVE THIS NACK, CLEAR THE MESSAGE
        ::
        ~&  [%WY-GOOD-FAIL Q.PAZ]
        %_  +>.$
          MUP  (WORK:MUP NOW %CULL Q.PAZ)
          COB  (~(PUT BY COB) Q.PAZ U.BUM(CLY ~, CUP `COP))
        ==
      ?>  (LTH ACK.U.BUM NUM.U.BUM)
      =.  ACK.U.BUM  +(ACK.U.BUM)
      =.  CUP.U.BUM  ?.(=(ACK.U.BUM NUM.U.BUM) ~ [~ ~])
      +>.$(COB (~(PUT BY COB) Q.PAZ U.BUM))
    ::                                                  ::
    ++  WY-MESS                                         ::  SEND
      |=  {CHA/CHAN VAL/*}
      ^+  +>
      =+  YEX=((KNIT HER LYF WYR DET) NOW ENY [%BOND [(MIX KOS 1) SEQ] CHA VAL])
      =.  FEX  (WELD (FLOP P.YEX) FEX)
      ~&  [?:(=(0 (END 0 1 KOS)) %TX %BX) HER KOS SEQ CHA (LENT FEX)]
      %_    +>.$
          SEQ  +(SEQ)
          COB
        %+  ~(PUT BY COB)
          SEQ
        ^-  COMB
        :*  ~
            CHA
            (LENT Q.YEX)
            0
            =+  INX=0
            |-  ?~  Q.YEX  ~
                :_  $(Q.YEX +.Q.YEX, INX +(INX))
                [& [INX SEQ] (SHAF %FLAP I.Q.YEX) I.Q.YEX]
        ==
      ==
    ::                                                  ::
    ++  WY-TIRE                                         ::  REPORT RESULTS
      |-  ^+  +
      =+  ZUP=(~(GET BY COB) LAC)
      ?~  ZUP  +.$
      ?~  CUP.U.ZUP  +.$
      ~&  [?:(=(0 (END 0 1 KOS)) %TA %BA) HER KOS LAC]
      %=  $
        LAC  +(LAC)
        COB  (~(DEL BY COB) LAC)
        FEX  :_(FEX [%MACK KOS `COOP`U.CUP.U.ZUP])
      ==
    ::                                                  ::
    ++  WY-WAKE                                         ::  TIMEOUT
      ^+  .
      .(MUP (WORK:MUP NOW %WAKE ~))
    ::
    ++  WY-WORK
      ^+  .
      ?-  -.JOB
        $BACK  (WY-BACK +.JOB)
        $MESS  (WY-MESS +.JOB)
        $WAKE  WY-WAKE
      ==
    --
  ::                                                    ::
  ++  ZEAL                                              ::  DEFAULT STATE
    ^-  COLT
    :*  0     ::  SEQ/TICK
        0     ::  LAC/TICK
        ~     ::  COB/(MAP TICK COMB)
        ^-  MINI
        :*  ^-  STAT
            :*  :*  0               :: CUR/@UD
                    2               :: MAX/@UD
                    0               :: REY/@UD
                ==
                :*  ~S5             :: RTT/@DR
                    ~2010.1.1       :: LAS/@DA
                    ~2010.1.1       :: LAD/@DA
            ==  ==
          ~
          ~
    ==  ==
  --
--
  .  ==
::                                                      ::
::::                                                    ::::  KERNEL INTERFACE
  ::                                                    ::
=|  $:  SYL/SILO                                        ::  KERNEL STATE
    ==                                                  ::
|=  {NOW/@DA ENY/@ SKI/SLEY}                            ::  CURRENT INVOCATION
=>  |%
    ++  LOVE  ~(. LOFT [NOW ENY] SYL ~)                 ::  CREATE LOFT
    ++  LUNG                                            ::  GIFT TO MOVE
      |=  GAX/GIFT:LOFT
      ^-  MOVE
      ?-    -.GAX
          $EAST  [P.GAX %GIVE [%EAST S.GAX]]
          $HOME  [~ %GIVE GAX]
          $LINK  [~ %PASS ~ %J GAX]
          $LINE  [~ %PASS ~ %J GAX]
          $MEET  [~ %PASS ~ %J GAX]
          $REST  [P.GAX %GIVE %REST Q.GAX]
          $SEND  [~ %GIVE GAX]
          $VEIL  [~ %PASS /DET/(SCOT %P P.GAX) %J GAX]
          $WEST
        =+  PAX=/MSG/(SCOT %P P.GAX)/(SCOT %UD Q.GAX)
        =+  CAD=[%WEST P.GAX +.R.GAX S.GAX]
        =+  DAT=?+(-.R.GAX !! $C [%C CAD], $E [%E CAD], $G [%G CAD])
        [~ %PASS PAX DAT]
      ==
    ::
    ++  WORK
      |=  JOB/TASK:LOFT
      ^-  {(LIST MOVE) Q/_..^$}
      =^  FEX  SYL  ABET:(APEX:LOVE JOB)
      [(TURN FEX LUNG) ..^$]
    --
|%                                                    ::  VANE INTERFACE
++  NEON
  |=  OUR/SHIP
  ^-  (VANE TASK:ABLE GIFT:ABLE SIGN:ABLE NOTE:ABLE SILO SILO)
  =|  SYL/SILO
  |%
  ++  LOAD  |=(SILO +>)
  ++  STAY  SYL
  ++  PLOW
    =|  $:  NOW/@DA
            ENY/@E
            SKY/ROOF
        ==
    |%
    ++  DOZE  ~
    ++  PEEK
      |=  $:  LYC/(UNIT (SET SHIP))
              CAR/TERM
              BEM/BEAM
          ==
      ^-  (UNIT (UNIT (CASK VASE)))
      ~
    ::
    ++  SPIN
      =|  $:  HEN/DUCT
              MOZ/(LIST MOVE)
          ==
      |%
      ++  CALL
        |=  TAC/TASK:ABLE
        ^+  +>
        =*  JOB  ^-  TASK:LOFT
            ?-  -.TAC
              $HEAR  TAC
              $MESS  [%MESS P.TAC HEN Q.TAC R.TAC]
              $WAKE  TAC
            ==
        =^  FEX  SYL  ABET:(APEX:LOVE JOB)
        +>.$(MOZ (WELD (TURN FEX LUNG) MOZ))
      ::
      ++  TAKE
        |=  {TEA/WIRE HIN/SIGN:ABLE}
        =*  JOB  ^-  TASK:LOFT
          ?+    -.TEA  !!
              $MSG
            ?>  ?=({@ @ $~} +.TEA)
            =+  [WHO KOS]=[(SLAV %P I.T.TEA) (SLAV %UD I.T.T.TEA)]
            ?-  +<.HIN
                $REND
              [%REND WHO KOS P.+.HIN Q.+.HIN]
                $MACK
              [%DONE WHO KOS ?~(P.+.HIN ~ `COOP`[~ `[%FAIL U.P.+.HIN]])]
            ==
          ==
        =^  FEX  SYL  ABET:(APEX:LOVE JOB)
        +>.$(MOZ (WELD (TURN FEX LUNG) MOZ))
      --
    --
  --
++  CALL                                              ::  HANDLE REQUEST
  |=  $:  HEN/DUCT
          HIC/(HYPO TASK:ABLE:XMAS)
      ==
  ^-  {P/(LIST MOVE) Q/_..^$}
  %-  WORK
  ^-  TASK:LOFT
  ?-  -.Q.HIC
    $HEAR  Q.HIC
    $MESS  [%MESS P.Q.HIC HEN Q.Q.HIC R.Q.HIC]
    $WAKE  Q.HIC
  ==
::
++  DOZE
  |=  {NOW/@DA HEN/DUCT}
  ^-  (UNIT @DA)
  DOZE:LOVE
::
++  LOAD
  |=  OLD/SILO
  ^+  ..^$
  ..^$(SYL OLD)
::
++  SCRY
  |=  {FUR/(UNIT (SET MONK)) REN/@TAS WHY/SHOP SYD/DESK LOT/COIN TYL/PATH}
  ^-  (UNIT (UNIT CAGE))
  ~
::
++  STAY  SYL
++  TAKE                                            ::  ACCEPT RESPONSE
  |=  {TEA/WIRE HEN/DUCT HIN/(HYPO SIGN-ARVO)}
  ^-  {P/(LIST MOVE) Q/_..^$}
  %-  WORK
  ?+    -.TEA  !!
      $MSG
    ?>  ?=({@ @ $~} +.TEA)
    =+  [WHO KOS]=[(SLAV %P I.T.TEA) (SLAV %UD I.T.T.TEA)]
    ?>  ?=(?($REND $MACK) +<.Q.HIN)
    ?-  +<.Q.HIN
      $REND  [%REND WHO KOS P.+.Q.HIN Q.+.Q.HIN]
      $MACK  [%DONE WHO KOS ?~(P.+.Q.HIN ~ `COOP`[~ `[%FAIL U.P.+.Q.HIN]])]
    ==
  ::
      $DET
    ?>  ?=({@ $~} +.TEA)
    =+  WHO=(SLAV %P I.T.TEA)
    ?>  ?=($VEIL +<.Q.HIN)
    [%CLUE WHO P.+.Q.HIN]
  ==
--
