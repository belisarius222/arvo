!:  ::  AMES (4A), NETWORKING
::
  |=  PIT=VASE
  =>  =~
::  STRUCTURES
=,  AMES
::  THIS NUMBER NEEDS TO BE BELOW 8
::
=+  PROTOCOL-VERSION=2
|%
+=  MOVE  [P=DUCT Q=(WIND NOTE:ABLE GIFT:ABLE)]         ::  LOCAL MOVE
::  |PACT: INTERNAL PACKET STRUCTURES
::
++  PACT
  |%
  +$  FULL  [LYF=[TO=LIFE FROM=LIFE] LAW=(UNIT DEED) TXT=@]
  +$  OPEN  [LYF=[TO=~ FROM=LIFE] LAW=(UNIT DEED) TXT=@]
  --
--
  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  ::              SECTION 4AA, IDENTITY LOGIC           ::
  ::              REMOVED IN FAVOR OF JAEL/ETHEREUM     ::
  ::
  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  ::              SECTION 4AB, PACKET FORMAT            ::
  ::
  |%
  ++  BITE                                              ::  PACKET TO CAKE
    |=  PAC=ROCK  ^-  CAKE
    =+  [MAG=(END 5 1 PAC) BOD=(RSH 5 1 PAC)]
    =+  :*  VEZ=(END 0 3 MAG)                           ::  PROTOCOL VERSION
            CHK=(CUT 0 [3 20] MAG)                      ::  CHECKSUM
            WIX=(BEX +((CUT 0 [23 2] MAG)))             ::  WIDTH OF RECEIVER
            VIX=(BEX +((CUT 0 [25 2] MAG)))             ::  WIDTH OF SENDER
            TAY=(CUT 0 [27 5] MAG)                      ::  MESSAGE TYPE
        ==
    ?>  =(PROTOCOL-VERSION VEZ)
    ?>  =(CHK (END 0 20 (MUG BOD)))
    :+  [(END 3 WIX BOD) (CUT 3 [WIX VIX] BOD)]
      (KINS TAY)
    (RSH 3 (ADD WIX VIX) BOD)
  ::
  ++  KINS  |=(TAY=@ (SNAG TAY `(LIST SKIN)`[%NONE %OPEN %FAST %FULL ~]))
  ++  KSIN  |=(SIN=SKIN `@`?-(SIN %NONE 0, %OPEN 1, %FAST 2, %FULL 3))
  ++  SPIT                                              ::  CAKE TO PACKET
    |=  KEC=CAKE  ^-  @
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
      :~  [3 PROTOCOL-VERSION]
          [20 (MUG BOD)]
          [2 YAX]
          [2 QAX]
          [5 TAY]
      ==
    (LSH 5 1 BOD)
  --
  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  ::              SECTION 4AC, PKI ENGINE               ::
  ::
  |%
  ++  GO                                                ::    GO
    |_  TON=TOWN                                        ::  AMES STATE
    ++  AS                                              ::    AS:GO
      |_  OUR=SHIP                                      ::  PER SERVER
      ++  LAX                                           ::    LAX:AS:GO
        |_  [HER=SHIP DUR=DORE]                         ::  PER CLIENT
        ++  CLUY                                        ::    CLUY:LAX:AS:GO
          ^-  [LYF=LIFE CUB=ACRU]                       ::  CLIENT CRYPTO
          ?>  ?=(^ LEW.WOD.DUR)
          [LIFE.U.LEW.WOD.DUR (COM:NU:CRUB:CRYPTO PASS.U.LEW.WOD.DUR)]
        ::
        ++  CLON
          ^-  LIFE
          ::  IF WE DON'T HAVE A +DEED FOR :HER, WE GUESS 1
          ::
          ?~(LEW.WOD.DUR 1 LIFE.U.LEW.WOD.DUR)
        ::
        ++  GRIZ                                        ::    GRIZ:LAX:AS:GO
          |=  NOW=@DA                                   ::  GENERATE KEY FOR
          ^-  [P=CODE Q=_+>]
          =+  KEY=(SHAS %ENTY (MIX NOW ANY.TON))
          :-  KEY
          %=  +>.$
            ANY.TON      (SHAX (MIX NOW ANY.TON))
            HEG.CAQ.DUR  (~(PUT BY HEG.CAQ.DUR) (SHAF %HAND KEY) KEY)
          ==
        ::
        ++  PODE                                        ::    PODE:LAX:AS:GO
          |=  NOW=@DA                                   ::  TIMEOUT ROUTE
          ^+  +>
          ?:  (LTH HER 256)  +>(LUN.WOD.DUR [~ %IF ~2000.1.1 0 (MIX HER .0.0.1.0)])
          +>(LUN.WOD.DUR ~)
        ::
        ++  KUCH                                        ::    KUCH:LAX:AS:GO
          |=  HAD=HAND                                  ::  HEAR KEY TAG
          ^-  (UNIT [CODE _+>])
          =+  WEY=(~(GET BY HEG.CAQ.DUR) HAD)
          ?^  WEY
            =+  KEY=U.WEY
            :+  ~  KEY
            %=    ..KUCH
                YED.CAQ.DUR  [~ HAD U.WEY]
                HEG.CAQ.DUR  (~(DEL BY HEG.CAQ.DUR) HAD)
                QIM.CAQ.DUR  (~(PUT BY QIM.CAQ.DUR) HAD KEY)
            ==
          =+  DYV=(~(GET BY QIM.CAQ.DUR) HAD)
          ?~  DYV  ~
          [~ U.DYV ..KUCH]
        ::
        ++  WASC                                        ::    WASC:LAX:AS:GO
          |=  KEY=CODE                                  ::  HEAR FOREIGN CODE
          ^+  +>
          =+  HAD=(SHAF %HAND KEY)
          %_  ..WASC
            YED.CAQ.DUR  [~ HAD KEY]
            QIM.CAQ.DUR  (~(PUT BY QIM.CAQ.DUR) HAD KEY)
          ==
        ::
        ++  WAST                                        ::    WAST:LAX:AS:GO
          |=  RYN=LANE                                  ::  SET ROUTE
          ^+  +>
          %=    +>
              LUN.WOD.DUR
            ?:  ?=([%IX *] RYN)
              ?:  ?|  ?=(~ LUN.WOD.DUR)
                      ?=([%IX *] U.LUN.WOD.DUR)
                      ?&  ?=([%IF *] U.LUN.WOD.DUR)
                          (GTH P.RYN (ADD ~S10 P.U.LUN.WOD.DUR))
                      ==
                  ==
                [~ RYN]
              LUN.WOD.DUR
            [~ RYN]
          ==
        ::
        ++  WIST                                        ::    WIST:LAX:AS:GO
          |=  $:  NOW=@DA                                ::  ROUTE VIA
                  WAZ=(LIST @P)
                  RYN=(UNIT LANE)
                  PAC=ROCK
              ==
          ^-  (LIST BOON)
          ?:  =(OUR HER)  [[%OUZO *LANE PAC] ~]
          ?~  WAZ  ~
          =+  DYR=?:(=(HER I.WAZ) DUR (GUR I.WAZ))
          ?.  ?&  !=(OUR I.WAZ)
                  ?=(^ LUN.WOD.DYR)
              ==
            $(WAZ T.WAZ)
          :_  ?:  ?=(%IX -.U.LUN.WOD.DYR)
                $(WAZ T.WAZ)
              ~
          :+  %OUZO  U.LUN.WOD.DYR
          ?:  &(=(I.WAZ HER) =(~ RYN))  PAC
          =+  MAL=(JAM `MEAL`[%FORE HER RYN PAC])
          %-  SPIT
          ^-  CAKE
          :*  [OUR I.WAZ]
              ?~  YED.CAQ.DYR  [%NONE MAL]
              :-  %FAST
              %^  CAT  7
                P.U.YED.CAQ.DYR
              (EN:CRUB:CRYPTO Q.U.YED.CAQ.DYR MAL)
          ==
        ::
        ++  ZUUL                                        ::    ZUUL:LAX:AS:GO
          |=  [NOW=@DA SEG=SHIP HAM=MEAL]               ::  ENCODE MESSAGE
          ^-  [P=(LIST ROCK) Q=_+>]
          =<  WEFT
          |%
          ++  WASP                                      ::  NULL SECURITY
            ^-([P=SKIN Q=@] [%NONE (JAM HAM)])
          ::
          ++  WEFT                                      ::  FRAGMENT MESSAGE
            ^-  [P=(LIST ROCK) Q=_+>.$]
            =^  GIM  ..WEFT  WISP
            :_  +>.$
            ^-  (LIST ROCK)
            =+  WIT=(MET 13 Q.GIM)
            ?<  =(0 WIT)
            ?:  =(1 WIT)
              =+  YUP=(SPIT [OUR HER] P.GIM Q.GIM)
              [YUP ~]
            =+  RUV=(RIP 13 Q.GIM)
            =+  GOM=(SHAF %THUG Q.GIM)
            =+  INX=0
            |-  ^-  (LIST ROCK)
            ?~  RUV  ~
            =+  ^=  VIE
                %+  SPIT
                  [OUR HER]
                WASP(HAM [%CARP (KSIN P.GIM) INX WIT GOM I.RUV])
            :-  VIE
            $(RUV T.RUV, INX +(INX))
          ::
          ++  WISP                                      ::  GENERATE MESSAGE
            ^-  [[P=SKIN Q=@] Q=_..WISP]
            ?:  =(%CARP -.HAM)
              [WASP ..WISP]
            ?:  !=(~ YED.CAQ.DUR)
              ?>  ?=(^ YED.CAQ.DUR)
              :_  ..WISP
              :-  %FAST
              %^  CAT  7
                P.U.YED.CAQ.DUR
              (EN:CUB:CLUY Q.U.YED.CAQ.DUR (JAM HAM))
            ?:  &(=(~ LEW.WOD.DUR) =(%BACK -.HAM))
              [WASP ..WISP]
            ::  WE INCLUDE OUR DEED IN ASYMMETRIC SKINS (%OPEN AND %FULL)
            ::  IF WE'RE A COMET OR MOON, OR IF WE'RE SPONSORING HER
            ::
            =/  BIL=(UNIT DEED)
              =/  RAC  (CLAN:TITLE OUR)
              ?.  ?|  ?=(?(%EARL %PAWN) RAC)
                      &(!?=(%CZAR RAC) =(OUR SEG))
                  ==
                ~
              `LAW.TON
            =/  YIG  SEN
            =/  HOM  (JAM HAM)
            ?:  =(~ LEW.WOD.DUR)
              :_  ..WISP
              :-  %OPEN
              %-  JAM
              ^-  OPEN:PACT
              :+  [~ LYF.YIG]
                BIL
              (SIGN:AS:CUB.YIG HOM)
            =/  CAY  CLUY
            :: :TUY: SYMMETRIC KEY PROPOSAL
            ::
            =^  TUY  +>.$  (GRIZ NOW)
            :_  ..WISP
            :-  %FULL
            %-  JAM
            ^-  FULL:PACT
            :+  [LYF.CAY LYF.YIG]
              BIL
            (SEAL:AS:CUB.YIG PUB:EX:CUB.CAY (JAM TUY HOM))
          --                                            ::  --ZUUL:LAX:AS:GO
        --                                              ::  --LAX:AS:GO
      ::
      ++  GUR                                           ::  DEFAULT DORE
        |=  HER=SHIP
        ^-  DORE
        =+  DEF=?.((LTH HER 256) ~ [~ %IF ~2000.1.1 0 (MIX HER .0.0.1.0)])
        [[~2100.1.1 DEF ~] *CLOT]
      ::
      ++  MYX                                           ::  DORE BY SHIP
        |=  HER=SHIP
        ^+  LAX
        =/  FOD=DORE
          (FALL (~(GET BY HOC.TON) HER) (GUR HER))
        ~(. LAX [HER FOD])
      ::
      ++  NUX                                           ::  INSTALL DORE
        |=  NEW=_LAX
        ^+  +>
        +>(HOC.TON (~(PUT BY HOC.TON) HER.NEW DUR.NEW))
      ::
      ++  SEN                                           ::  CURRENT CRYPTO
        ^-  [LYF=LIFE CUB=ACRU]
        ?~(VAL.TON !! [P.I.VAL.TON R.I.VAL.TON])
      ::
      ++  SEV                                           ::  CRYPTO BY LIFE
        |=  MAR=LIFE
        ^-  [P=? Q=ACRU]
        ?~  VAL.TON  !!
        ?:  =(MAR P.I.VAL.TON)
          [& R.I.VAL.TON]
        ?>  (LTH MAR P.I.VAL.TON)
        :-  |
        |-  ^-  ACRU
        ?>  ?=(^ T.VAL.TON)
        ?:  =(MAR P.I.T.VAL.TON)
          R.I.T.VAL.TON
        $(T.VAL.TON T.T.VAL.TON)
      --                                                ::  --AS:GO
    ::
    ++  SU                                              ::  INSTALL SAFE
      |=(NEW=_AS `TOWN`TON.NEW)
    ::
    ++  TI                                              ::  EXPIRE BY TIME
      |=  NOW=@DA
      ^-  TOWN
      !!
    ::
    ++  US                                              ::  PRODUCE SAFE
      |=(OUR=SHIP `_AS`~(. AS OUR))
    --                                                ::  --GO
  --
  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  ::              SECTION 4AF, PACKET PUMP             ::
  |%
  ++  PU                                                ::  PACKET PUMP
    |_  SHED
    ++  ABET  +<
    ++  AHOY                                            ::    AHOY:PU
      ^+  .                                             ::  INITIALIZE
      %_    .
          RTT  ~S1
          RTO  ~S4
          RTN  ~
          RUE  ~
          NUS  0
          NIF  0
          NEP  0
          CAW  2
          CAG  64
          DIQ  ~
          PYZ  ~
          PUQ  ~
      ==
    ::
    ++  BICK                                            ::    BICK:PU
      |=  [NOW=@DA FAP=FLAP]                            ::  ACK BY HASH
      ^-  [[P=(UNIT SOUP) Q=(LIST ROCK)] _+>]
      =+  SUN=(~(GET BY DIQ) FAP)
      ?~  SUN
        ::  ~&  [%BICK-NONE `@P`(MUG FAP)]              ::  NOT A REAL ERROR
        [[~ ~] +>.$]
      ::  ~&  [%BICK-GOOD `@P`(MUG FAP) U.SUN]
      =.  DIQ  (~(DEL BY DIQ) FAP)
      =^  GUB  +>.$  (BOCK NOW U.SUN)
      =^  YOP  +>.$  (HARV NOW)
      [[GUB YOP] +>.$]
    ::
    ++  BILK                                            ::    BILK:PU
      |=  NOW=@DA                                       ::  INBOUND PACKET
      ^+  +>
      =+  TRT=(MUL 2 RTT)
      %=  +>.$
        RUE  [~ NOW]
        RTO  TRT
        RTN  ?~(PUQ ~ [~ (ADD NOW TRT)])
      ==
    ::
    ++  BOOM                                            ::    BOOM:PU
      |=  NOW=@DA  ^-  ?                                ::  ADDRESS TIMEOUT
      |(?=(~ RUE) (GTE (SUB NOW U.RUE) ~M1))
    ::
    ++  BUST                                            ::    BUST:PU
      ^-  ?                                             ::  NOT RESPONDING
      &(?=(^ RTN) (GTE RTO ~S16))
    ::
    ++  BIKE                                            ::    BIKE:PU
      ^+  .                                             ::  CHECK STATS
      ?>  .=  NIF
          |-  ^-  @
          ?~  PUQ  0
          :(ADD !LIV.Q.N.PUQ $(PUQ L.PUQ) $(PUQ R.PUQ))
      .
    ::
    ++  BEET                                            ::    BEET:PU
      ^+  .                                             ::  ADVANCE UNACKED
      =-  +(NEP ?~(FOH NUS U.FOH))
      ^=  FOH
      |-  ^-  (UNIT @UD)
      ?~  PUQ  ~
      ?:  (LTE P.N.PUQ NEP)  $(PUQ L.PUQ)
      =+  RIG=$(PUQ R.PUQ)
      ?^(RIG RIG [~ P.N.PUQ])
    ::
    ++  BINE                                            ::    BINE:PU
      |=  [NOW=@DA NUM=@UD]                             ::  APPLY ACK
      ^-  [(UNIT SOUP) _+>]
      ?~  PUQ  !!
      ?.  =(NUM P.N.PUQ)
        ?:  (GTH NUM P.N.PUQ)
          =+  LEF=$(PUQ L.PUQ)
          [-.LEF +.LEF(PUQ [N.PUQ PUQ.LEF R.PUQ])]
        =+  RIG=$(PUQ R.PUQ)
        [-.RIG +.RIG(PUQ [N.PUQ L.PUQ PUQ.RIG])]
      =:  RTT  ?.  &(LIV.Q.N.PUQ =(1 NUX.Q.N.PUQ))  RTT
               =+  GAP=(SUB NOW LYS.Q.N.PUQ)
               ::  ~&  [%BOCK-TRIP NUM (DIV GAP (DIV ~S1 1.000))]
               (DIV (ADD (MUL 2 RTT) GAP) 3)
          NIF  (SUB NIF !LIV.Q.N.PUQ)
        ==
      =+  LEZ=(DEC (NEED (~(GET BY PYZ) GOM.Q.N.PUQ)))
      =^  GUB  PYZ
          ?:  =(0 LEZ)
            [[~ GOM.Q.N.PUQ] (~(DEL BY PYZ) GOM.Q.N.PUQ)]
          [~ (~(PUT BY PYZ) GOM.Q.N.PUQ LEZ)]
      :-  GUB
      +>.$(PUQ ~(NAP TO PUQ))
    ::
    ++  BOCK                                            ::    BOCK:PU
      |=  [NOW=@DA NUM=@UD]                             ::  ACK BY SEQUENCE
      ^-  [(UNIT SOUP) _+>]
      =^  GYM  +>  (BINE NOW NUM)
      :-  GYM
      ?:  (GTH NUM NEP)
        =+  CAM=(MAX 2 (DIV CAW 2))
        ::  ~&  [%BOCK-HOLE NUM NEP CAM]
        BEET:(WEPT(NEP NUM, CAG CAM, CAW CAM) NEP NUM)
      =.  CAW  ?:  (LTH CAW CAG)  +(CAW)
               (ADD CAW !=(0 (MOD (MUG NOW) CAW)))
      ?:  =(NUM NEP)
        ::  ~&  [%BOCK-FINE NUM NIF CAW CAG]
        BEET
      ::  ~&  [%BOCK-FILL NUM NIF CAW CAG]
      +>.$
    ::
    ++  HARV                                            ::    HARV:PU
      |=  NOW=@DA                                       ::  HARVEST QUEUE
      ^-  [(LIST ROCK) _+>]
      ?:  =(~ PUQ)  [~ +>(RTN ~)]
      ?.  (GTH CAW NIF)  [~ +>]
      =+  WID=(SUB CAW NIF)
      =|  RUB=(LIST ROCK)
      =<  ABET  =<  APSE
      |%
      ++  ABET
        ?~  RUB  [~ +>.$]
        [(FLOP RUB) +>.$(RTN [~ (ADD RTO NOW)])]
      ::
      ++  APSE
        ^+  .
        ?~  PUQ  .
        ?:  =(0 WID)  .
        =>  RIGT  =<  LEFT
        ?>  ?=(^ PUQ)
        ?:  =(0 WID)  .
        ?.  =(| LIV.Q.N.PUQ)  .
        ::  ~&  [%HARV NUX.Q.N.PUQ P.N.PUQ]
        %_    .
          WID          (DEC WID)
          RUB          [PAC.Q.N.PUQ RUB]
          NIF          +(NIF)
          LIV.Q.N.PUQ  &
          NUX.Q.N.PUQ  +(NUX.Q.N.PUQ)
          LYS.Q.N.PUQ  NOW
        ==
      ::
      ++  LEFT
        ?>  ?=(^ PUQ)
        ^+(. =+(LEF=APSE(PUQ L.PUQ) LEF(PUQ [N.PUQ PUQ.LEF R.PUQ])))
      ++  RIGT
        ?>  ?=(^ PUQ)
        ^+(. =+(RIG=APSE(PUQ R.PUQ) RIG(PUQ [N.PUQ L.PUQ PUQ.RIG])))
      --
    ::
    ++  WACK                                            ::    WACK:PU
      |=  NOW=@DA                                       ::  WAKEUP (TIMEOUT)
      ^-  [(LIST ROCK) _+>]
      ?.  &(!=(~ RTN) ?>(?=(^ RTN) (GTE NOW U.RTN)))  [~ +>]
      ::  ~&  [%SLOW (DIV RTO (DIV ~S1 1.000))]
      =.  +>  (WEPT 0 NUS)
      ?>  =(0 NIF)
      =:  CAW  2
          RTO  ;:  MIN
                 (MUL 2 RTO)
                 ~M2
                 (MUL ~S16 ?~(RUE 1 +((DIV (SUB NOW U.RUE) ~D1))))
               ==
        ==
      (HARV NOW)
    ::
    ++  WEPT                                            ::    WEPT:PU
      |=  [FIP=@UD LAP=@UD]                             ::  FIP THRU LAP-1
      =<  ABET  =<  APSE
      |%
      ++  ABET  +>.$
      ++  APSE
        ^+  .
        ?~  PUQ  .
        ?:  (LTH P.N.PUQ FIP)  ?~(L.PUQ . LEFT)
        ?:  (GTE P.N.PUQ LAP)  ?~(R.PUQ . RIGT)
        =>  RIGT  =<  LEFT
        ?>  ?=(^ PUQ)
        ?.(LIV.Q.N.PUQ . .(NIF (DEC NIF), LIV.Q.N.PUQ |))
      ::
      ++  LEFT
        ?>  ?=(^ PUQ)
        ^+(. =+(LEF=APSE(PUQ L.PUQ) LEF(PUQ [N.PUQ PUQ.LEF R.PUQ])))
      ++  RIGT
        ?>  ?=(^ PUQ)
        ^+(. =+(RIG=APSE(PUQ R.PUQ) RIG(PUQ [N.PUQ L.PUQ PUQ.RIG])))
      --
    ::
    ++  WHAP                                            ::    WHAP:PU
      |=  [NOW=@DA GOM=SOUP WYV=(LIST ROCK)]            ::  SEND A MESSAGE
      ^-  [(LIST ROCK) _+>]
      =.  PYZ  (~(PUT BY PYZ) GOM (LENT WYV))
      =.  +>
        |-  ^+  +>.^$
        ?~  WYV  +>.^$
        %=  $
          WYV  T.WYV
          NUS  +(NUS)
          DIQ  (~(PUT BY DIQ) (SHAF %FLAP I.WYV) NUS)
          PUQ  (~(PUT TO PUQ) [NUS `SOUL`[GOM 0 | ~2000.1.1 I.WYV]])
        ==
      (HARV NOW)
    --
  --
  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  ::              SECTION 4AG, PROTOCOL ENGINE          ::
  ::
  |%
  ++  AM                                                ::    AM
    ~%  %AMES-AM  ..IS  ~
    |_  [OUR=SHIP NOW=@DA FOX=FORT SKI=SLEY]            ::  PROTOCOL ENGINE
    ::  +DEED-SCRY: FOR A +DEED AT A +LIFE
    ::
    ++  DEED-SCRY
      ~/  %DEED-SCRY
      |=  [WHO=SHIP LYF=LIFE]
      ^-  (UNIT DEED)
      =;  DED
        ?~(DED ~ U.DED)
      ;;  (UNIT (UNIT DEED))
      %-  (SLOY-LIGHT SKI)
      =/  PUR=SPUR
        /(SCOT %UD LYF)/(SCOT %P WHO)
      [[151 %NOUN] %J OUR %DEED DA+NOW PUR]
    ::  +LIFE-SCRY: FOR A +LIFE
    ::
    ++  LIFE-SCRY
      ~/  %LIFE-SCRY
      |=  WHO=SHIP
      ^-  (UNIT LIFE)
      =;  LYF
        ?~(LYF ~ U.LYF)
      ;;  (UNIT (UNIT LIFE))
      %-  (SLOY-LIGHT SKI)
      =/  PUR=SPUR
        /(SCOT %P WHO)
      [[151 %NOUN] %J OUR %LIFE DA+NOW PUR]
    ::  +SEIN-SCRY: FOR SPONSOR
    ::
    ++  SEIN-SCRY
      ~/  %SEIN
      |=  WHO=SHIP
      ;;  SHIP
      %-  NEED  %-  NEED
      %-  (SLOY-LIGHT SKI)
      [[151 %NOUN] %J OUR %SEIN DA+NOW /(SCOT %P WHO)]
    ::  +SAXO-SCRY: FOR SPONSORSHIP CHAIN
    ::
    ++  SAXO-SCRY
      ~/  %SAXO
      |=  WHO=SHIP
      ;;  (LIST SHIP)
      %-  NEED  %-  NEED
      %-  (SLOY-LIGHT SKI)
      [[151 %NOUN] %J OUR %SAXO DA+NOW /(SCOT %P WHO)]
    ::
    ++  VEIN                                            ::    VEIN:AM
      ~/  %VEIN
      |=  [=LIFE VEIN=(MAP LIFE RING)]                  ::  NEW PRIVATE KEYS
      ^-  FORT
      ::
      ?.  ?&  (~(HAS BY VEIN) LIFE)
              =(LIFE (ROLL ~(TAP IN ~(KEY BY VEIN)) MAX))
          ==
        ~|  [%VEIN-MISMATCH +<]  !!
      %=  FOX
          HOC.TON
        ::  RESET CONNECTIONS
        ::
        (~(RUN BY HOC.TON.FOX) |=(=DORE DORE(CAQ *CLOT)))
      ::
          SEH.TON
        ::  RESET SYMMETRIC KEY CACHE
        ::
        ~
      ::
      ::  SAVE OUR SECRETS, READY FOR ACTION
          LAW.TON
        ::  SAVE OUR DEED (FOR COMET/MOON COMMUNICATION)
        ::
        (NEED (DEED-SCRY OUR LIFE))
      ::
          VAL.TON
        ::  SAVE OUR SECRETS, READY FOR ACTION
        ::
        ^-  WUND
        %+  TURN
          %+  SORT
            ~(TAP BY VEIN)
          |=  [A=[=^LIFE =RING] B=[=^LIFE =RING]]
          (GTH LIFE.A LIFE.B)
        |=  [=^LIFE =RING]
        [LIFE RING (NOL:NU:CRUB:CRYPTO RING)]
      ==
    ::
    ++  GNAW                                            ::    GNAW:AM
      ~/  %GNAW
      |=  [KAY=CAPE RYN=LANE PAC=ROCK]                  ::  PROCESS PACKET
      ^-  [P=(LIST BOON) Q=FORT]
      ?.  =(PROTOCOL-VERSION (END 0 3 PAC))  [~ FOX]
      =+  KEC=(BITE PAC)
      ?:  (GOOP P.P.KEC)
        [~ FOX]
      ?.  =(OUR Q.P.KEC)
        [~ FOX]
      =;  ZAP=[P=(LIST BOON) Q=FORT]
        [(WELD P.ZAP NEXT) Q.ZAP]
      =<  ZORK
      =<  ZANK
      ::  ~&  [%HEAR P.P.KEC RYN `@P`(MUG (SHAF %FLAP PAC))]
      %-  ~(CHEW LA:(HO:UM P.P.KEC) KAY RYN %NONE (SHAF %FLAP PAC))
      [Q.KEC R.KEC]
    ::
    ++  GOOP                                            ::  BLACKLIST
      |=  HIM=SHIP
      |
    ::
    ++  KICK                                            ::    KICK:AM
      |=  HEN=DUCT                                      ::  REFRESH NET
      ^-  [P=(LIST BOON) Q=FORT]
      ZORK:(KICK:UM HEN)
    ::
    ++  NEXT
      ^-  (LIST BOON)
      =/  DOZ=(UNIT @DA)  [~ (ADD NOW ~S32)]
      =.  DOZ
        |-  ^+  DOZ
        ?~  WAB.ZAC.FOX  DOZ
        =.  DOZ  $(WAB.ZAC.FOX L.WAB.ZAC.FOX)
        =.  DOZ  $(WAB.ZAC.FOX R.WAB.ZAC.FOX)
        =+  BAH=Q.N.WAB.ZAC.FOX
        (HUNT LTH DOZ RTN.SOP.BAH)
      =/  NEX  (HUNT LTH DOZ TIM.FOX)
      ?:  =(TIM.FOX NEX)
        ~
      [%PITO (NEED NEX)]~
    ::
    ++  RACK                                            ::    RACK:AM
      ~/  %RACK
      |=  [HER=SHIP CHA=PATH COP=COOP]                  ::  E2E ACK
      =/  OH  (HO:UM HER)
      =^  GUD  OH  (COOK:OH COP CHA ~)
      ?.  GUD  OH
      (CANS:OH CHA)
    ::
    ++  WAKE                                            ::    WAKE:AM
      ~/  %WAKE
      |=  HEN=DUCT                                      ::  HARVEST PACKETS
      ^-  [P=(LIST BOON) Q=FORT]
      =.  TIM.FOX  ~
      =/  NEB=(LIST SHIP)  ~(TAP IN ~(KEY BY WAB.ZAC.FOX))
      =|  BIN=(LIST BOON)
      |-  ^-  [P=(LIST BOON) Q=FORT]
      ?~  NEB
        =^  BAN  FOX  (KICK HEN)
        [:(WELD BIN P.BAN NEXT) FOX]
      =/  FRO=(LIST SHIP)  (SAXO-SCRY OUR)
      =/  HOZ  (HO:UM I.NEB)
      =^  BUN  FOX  ZORK:ZANK:(THAW:HOZ FRO)
      $(NEB T.NEB, BIN (WELD P.BUN BIN))
    ::
    ++  WISE                                            ::    WISE:AM
      |=  [HEN=DUCT HER=SHIP CHA=PATH VAL=*]            ::  SEND A STATEMENT
      ^-  [P=(LIST BOON) Q=FORT]
      =^  BAN  FOX  ZORK:ZANK:(WOOL:(HO:UM HER) HEN CHA VAL)
      [(WELD P.BAN NEXT) FOX]
    ::
    ++  UM                                              ::  PER SERVER
      =/  GUS   (~(US GO TON.FOX) OUR)
      =/  WEG=CORN  ZAC.FOX
      =|  BIN=(LIST BOON)
      |%
      ++  HO                                            ::    HO:UM:AM
        |=  HER=SHIP                                    ::  PER FRIEND
        =+  DIZ=(MYX:GUS HER)
        =+  BAH=(~(GET BY WAB.WEG) HER)
        =+  PUZ=?~(BAH AHOY:PU %*(. PU +< SOP.U.BAH))
        =>  .(BAH `BATH`?~(BAH [ABET:PUZ ~ ~] U.BAH))
        |%
        ++  BUSK                                        ::    BUSK:HO:UM:AM
          |=  [WAZ=(LIST SHIP) PAX=(LIST ROCK)]         ::  SEND PACKETS
          %_    +>
              BIN
            |-  ^+  BIN
            ?~  PAX  BIN
            $(PAX T.PAX, BIN (WELD (FLOP (WIST:DIZ NOW WAZ ~ I.PAX)) BIN))
          ==
        ::
        ++  CANS                                        ::    CANS:HO:UM:AM
          |=  CHA=PATH
          =+  RUM=(NEED (~(GET BY RAZ.BAH) CHA))
          =.  RUM
            %=  RUM
              DID  +(DID.RUM)
              MIS  (~(DEL BY MIS.RUM) DID.RUM)
            ==
          (COAT CHA RUM)
        ::
        ++  COAT                                        ::    COAT:HO:UM:AM
          |=  [CHA=PATH RUM=RACE]                       ::  UPDATE INPUT RACE
          ^+  +>
          =+  CUN=(~(GET BY MIS.RUM) DID.RUM)
          ?:  |(!DOD.RUM ?=(~ CUN))
            ::
            ::  IF WE HAVE NOT YET RECEIVED THE CURRENT MESSAGE,
            ::  OR IF WE ARE NOT IDLE, JUST WAIT.
            ::
            +>.$(RAZ.BAH (~(PUT BY RAZ.BAH) CHA RUM))
          ?.  =(%GOOD P.U.CUN)
            ::
            ::  IF WE ARE RECORDING A FAILED MESSAGE, ACKNOWLEDGE
            ::  IT NOW, SINCE IT OBVIOUSLY WON'T BE PROCESSED.
            ::
            ~&  [%FAIL-ACK DID.RUM]
            =^  GUD  +>.$
              (COOK ``[%DEAD-MESSAGE ~] CHA `[Q.U.CUN R.U.CUN])
            ?.  GUD  +>.$
            %=    +>.$
                RAZ.BAH
              %+  ~(PUT BY RAZ.BAH)  CHA
              %=  RUM
                DID  +(DID.RUM)
                MIS  (~(DEL BY MIS.RUM) DID.RUM)
              ==
            ==
          ::
          ::  THE MESSAGE IS GOOD.  SEND IT TO BE PROCESSED.
          ::
          ?>  ?=(^ S.U.CUN)
          %=    +>.$
              RAZ.BAH  (~(PUT BY RAZ.BAH) CHA RUM(DOD |))
              BIN
            :_  BIN
            :^    %MILK
                HER
              `SOAP`[[LYF:SEN:GUS CLON:DIZ] CHA DID.RUM]
            U.S.U.CUN
          ==
        ::
        ++  COOK                                        ::    COOK:HO:UM:AM
          |=  [COP=COOP CHA=PATH RAM=(UNIT [RYN=LANE DAM=FLAP])]
          ^-  [GUD=? CON=_+>]                        ::  ACKNOWLEDGMENT
          ::  ~&  [%AMES-COOK COP CHA RAM]
          =+  RUM=(NEED (~(GET BY RAZ.BAH) CHA))
          =+  LAT=(~(GET BY MIS.RUM) DID.RUM)
          ?:  &(?=(~ LAT) ?=(~ RAM))
            ~&  %ACK-LATE-OR-REDUNDANT
            [%| +>.$]
          :-  %&
          =+  ^-  [RYN=LANE DAM=FLAP]
              ?^  RAM  [RYN.U.RAM DAM.U.RAM]
              ?<  ?=(~ LAT)
              [Q R]:U.LAT
          =.  RAZ.BAH
            ?^  RAM  RAZ.BAH
            %+  ~(PUT BY RAZ.BAH)  CHA
            RUM(DOD &, BUM ?~(COP BUM.RUM (~(PUT BY BUM.RUM) DID.RUM U.COP)))
          =/  SEG  (SEIN-SCRY HER)
          =^  ROC  DIZ  (ZUUL:DIZ NOW SEG [%BACK COP DAM ~S0])
          =/  FRO=(LIST SHIP)  (SAXO-SCRY OUR)
          (BUSK(DIZ (WAST:DIZ RYN)) (XONG FRO) ROC)
        ::  XX MOVE THIS LOGIC INTO %ZUSE, NAMESPACED UNDER %JAEL?
        ::
        ++  DENG                                        ::    DENG:HO:UM:AM
          |=  LAW=(UNIT DEED)                           ::  ACCEPT INLINE DEED
          ^+  DIZ
          ?:  |(=(~ LAW) =(LEW.WOD.DUR.DIZ LAW))
            DIZ
          ~|  [%DENG-FAIL HER]
          ?>  ?=(^ LAW)
          =*  WED  U.LAW
          ?>  ^-  ?
              ?-    (CLAN:TITLE HER)
                  %EARL
                ::  SIGNED BY PARENT
                ::
                =/  SEG  (^SEIN:TITLE HER)
                =/  YIG
                  ?:  =(OUR SEG)
                    SEN:GUS
                  CLUY:(MYX:GUS SEG)
                ?&  =(LYF.YIG LIFE.WED)
                    ?=(^ OATH.WED)
                    .=  (NEED (SURE:AS:CUB.YIG U.OATH.WED))
                    (SHAF %EARL (SHAM [HER LIFE.WED PASS.WED]))
                ==
              ::
                  %PAWN
                ::  SELF-SIGNED, LIFE 1, ADDRESS IS FINGERPRINT
                ::
                =/  CUB=ACRU  (COM:NU:CRUB:CRYPTO PASS.WED)
                ?&  =(`@`FIG:EX:CUB HER)
                    ?=(%1 LIFE.WED)
                    ?=(^ OATH.WED)
                    ::  XX DO WE CARE ABOUT THIS SIGNATURE AT ALL?
                    ::
                    .=  (NEED (SURE:AS:CUB U.OATH.WED))
                    (SHAF %SELF (SHAM [HER LIFE.WED PASS.WED]))
                ==
              ::
                  *
                ::  OUR SPONSOR
                ::
                ?&  !?=(%CZAR (CLAN:TITLE OUR))
                    =(HER (SEIN-SCRY OUR))
                ==
              ==
          DIZ(LEW.WOD.DUR LAW)
        ::
        ++  DONE                                        ::    DONE:HO:UM:AM
          |=  [CHA=PATH NUM=@UD]                        ::  COMPLETE OUTGOING
          ^-  [(UNIT DUCT) _+>]
          ::  ~&  [%AMES-DONE CHA NUM]
          =+  ROL=(NEED (~(GET BY RYL.BAH) CHA))
          =+  RIX=(~(GET BY SAN.ROL) NUM)
          ?~  RIX  [~ +>.$]
          :-  RIX
          %_    +>.$
              RYL.BAH
            (~(PUT BY RYL.BAH) CHA ROL(SAN (~(DEL BY SAN.ROL) NUM)))
          ==
        ::
        ++  LA                                          ::    LA:HO:UM:AM
          |_  [KAY=CAPE RYN=LANE AUT=SKIN DAM=FLAP]     ::  PER PACKET
          ::
          ++  CHEW                                      ::    CHEW:LA:HO:UM:AM
            |=  [SIN=SKIN MSG=@]                        ::  RECEIVE
            ^+  +>
            =<  ABED
            |%
            ::  +ABED: CHECK THAT WE HAVE THE KEYS TO COMMUNICATE WITH :HER
            ::
            ++  ABED
              ^+  +>.$
              ::  IF WE DON'T HAVE A DEED, SUBSCRIBE FOR PUBLIC KEY UPDATES
              ::
              ::    XX UPDATE STATE SO WE ONLY ASK ONCE?
              ::
              =?  +>.$  ?=(~ LEW.WOD.DUR.DIZ)
                (EMIT %BEER HER)
              ::  IF WE DON'T HAVE A DEED, SCRY FOR IT
              ::  (TO AVOID DROPPING THE PACKET, IF POSSIBLE).
              ::
              =?  LEW.WOD.DUR.DIZ  ?=(~ LEW.WOD.DUR.DIZ)
                =/  LIFE  (LIFE-SCRY HER)
                ?~(LIFE ~ (DEED-SCRY HER U.LIFE))
              ::  IF WE HAVE A DEED, PROCEED
              ::
              ?^  LEW.WOD.DUR.DIZ
                APSE
              ::  IF :HER IS OUR INITIAL SPONSOR, PROCEED (TOFU)
              ::
              ::    XX TOFU IS UNNECESSARY IF WE INCLUDE KEYS
              ::    FOR THE FULL SPONSORSHIP CHAIN IN THE BOOT EVENT
              ::
              ?:  =(HER (SEIN-SCRY OUR))
                APSE
              ::  IF :HER IS A COMET, OR A MOON OF A KNOWN SHIP, PROCEED
              ::
              =/  =RANK:TITLE  (CLAN:TITLE HER)
              ?:  ?|  ?=(%PAWN RANK)
                      ?&  ?=(%EARL RANK)
                          !=(~ LEW.WOD.DUR:(MYX:GUS (SEIN-SCRY HER)))
                  ==  ==
                APSE
              ::  OTHERWISE, DROP THE PACKET
              ::
              +>.$
            ::  +APSE: PROCESS THE PACKET, NOTIFY IF :HER STATUS CHANGED
            ::
            ++  APSE
              ^+  +>.$
              =/  OUB  BUST:PUZ
              =/  NEG  =(~ YED.CAQ.DUR.DIZ)
              =.  +>.$  EAST
              =/  ENG  =(~ YED.CAQ.DUR.DIZ)
              =/  BOU  BUST:PUZ
              =?  +>.$  &(OUB !BOU)
                (EMIT [%WINE HER " IS OK"])
              ::  THE PRESENCE OF A SYMMETRIC KEY INDICATES NEIGHBORING
              ::  XX USE DEED INSTEAD?
              ::
              =?  +>.$  &(NEG !ENG)
                %-  EMIR  :~
                  [%WINE HER " IS YOUR NEIGHBOR"]
                  ?>  ?=(^ LEW.WOD.DUR.DIZ)
                  [%RAKI HER [LIFE PASS]:U.LEW.WOD.DUR.DIZ]
                ==
              +>.$
            ::
            ++  EAST
              ^+  +>.$
              ?-    SIN
                  %NONE
                ::  ~&  %CHEW-NONE
                =.  PUZ  (BILK:PUZ NOW)
                (CHOW ((HARD MEAL) (CUE MSG)))
              ::
                  %FAST
                ::  ~&  %CHEW-FAST
                =+  [MAG=`HAND`(END 7 1 MSG) BOD=(RSH 7 1 MSG)]
                =/  DEY  (KUCH:DIZ MAG)
                ::  IGNORE UNKNOWN KEY
                ::
                ?~  DEY  +>.$
                =.  PUZ  (BILK:PUZ NOW)
                =^  KEY  DIZ  U.DEY
                (CHOW(AUT SIN) ((HARD MEAL) (CUE (DY:CUB:SEN:GUS KEY BOD))))
              ::
                  %FULL
                ::  ~&  %CHEW-FULL
                =/  MEX  ((HARD FULL:PACT) (CUE MSG))
                =.  DIZ  (DENG LAW.MEX)
                =/  WUG  CLUY:DIZ
                ?>  =(LYF.WUG FROM.LYF.MEX)
                =/  GEY  (SEV:GUS TO.LYF.MEX)
                =/  SEM  (NEED (TEAR:AS:Q.GEY PUB:EX:CUB.WUG TXT.MEX))
                =/  MES  ((HARD (PAIR @ @)) (CUE SEM))
                =.  DIZ  (WASC:DIZ P.MES)
                =.  PUZ  (BILK:PUZ NOW)
                (WEST(MSG Q.MES))
              ::
                  %OPEN
                ::  ~&  %CHEW-OPEN
                =/  MEX  ((HARD OPEN:PACT) (CUE MSG))
                =.  DIZ  (DENG LAW.MEX)
                =/  WUG  CLUY:DIZ
                ?>  =(LYF.WUG FROM.LYF.MEX)
                =/  MES  (NEED (SURE:AS:CUB.WUG TXT.MEX))
                =.  PUZ  (BILK:PUZ NOW)
                (WEST(MSG MES))
              ==
            ++  WEST
              |=  ~
              =+  VIB=(CUE MSG)
              =+  MAL=(MEAL VIB)
              ?.  =(MAL VIB)
                ~&  [%BAD-MEAL HER]
                +>.^$
              (CHOW(AUT SIN) MAL)
            --
          ::
          ++  CHOW                                      ::    CHOW:LA:HO:UM:AM
            |=  FUD=MEAL                                ::  INTERPRET MEAL
            ^+  +>
            =.  DIZ  ?:(=(%NONE AUT) DIZ (WAST:DIZ RYN))
            (DINE FUD)
          ::
          ++  COCK                                      ::    COCK:LA:HO:UM:AM
            ^+  .                                       ::  SEND NEW ACK
            ::  ~&  [%BACK KAY DAM]
            =*  COP  `COOP`?:(=(%GOOD KAY) ~ ``[%DEAD-PACKET ~])
            =/  SEG  (SEIN-SCRY HER)
            =^  PAX  DIZ  (ZUUL:DIZ NOW SEG [%BACK COP DAM ~S0])
            =/  FRO=(LIST SHIP)  (SAXO-SCRY OUR)
            ..COCK(+> (BUSK(DIZ (WAST:DIZ RYN)) (XONG FRO) PAX))
          ::
          ++  DEER                                      ::    DEER:LA:HO:UM:AM
            |=  [CHA=PATH NUM=@UD DUT=(UNIT)]           ::  INTERPRET MESSAGE
            ^+  +>
            =+  RUM=(FALL (~(GET BY RAZ.BAH) CHA) *RACE)
            ::  ~&  [%RX KAY CHA NUM [DOD.RUM DID.RUM] ?=(~ DUT)]
            =*  BAD  (~(HAS IN BAD.FOX) HER)
            =.  KAY  ?.((~(HAS IN BAD.FOX) HER) KAY ~&(%BLOCKED %DEAD))
            %=    +>.$
                +>
              ?:  (LTH NUM DID.RUM)
                ::
                ::  THIS MESSAGE ALREADY ACKNOWLEDGED; REPEAT OLD ACK,
                ::  OR NEGATIVE ACK IF THIS SHIP IS BLOCKED
                ::
                =*  COP  ^-  COOP
                  %+  FALL
                    (~(GET BY BUM.RUM) NUM)
                  ?:(BAD ~ ``[%BLOCKED ~])
                CON:(COOK (~(GET BY BUM.RUM) NUM) CHA `[RYN DAM])
              ::
              ::  INSERT THIS MESSAGE IN UNPROCESSED SET
              ::
              =.  MIS.RUM  (~(PUT BY MIS.RUM) NUM [KAY RYN DAM DUT])
              ::
              ::  IF SHIP IS BLOCKED, ADVANCE POINTER TO LATEST MESSAGE
              ::
              =.  DID.RUM  ?.(BAD DID.RUM NUM)
              ::
              ::  PROCESS UPDATE
              ::
              (COAT CHA RUM)
            ==
          ::
          ++  DINE                                      ::    DINE:LA:HO:UM:AM
            |=  FUD=MEAL                                ::  INTERPRET MEAL
            ^+  +>
            ?-    -.FUD
                %BACK
              =.  +>  ?.(=(%FULL AUT) +> COCK)          ::  FINISH HANDSHAKE
              +>(..LA (TOCK P.FUD Q.FUD R.FUD))
            ::
                %BOND
              ::  ~&  [%BOND P.FUD Q.FUD]
              (DEER P.FUD Q.FUD ?-(KAY %DEAD ~, %GOOD [~ R.FUD]))
            ::
                %CARP
              ::  =+  ZOL=(~(GET BY OLZ.WEG) S.FUD)
              ::  ?^  ZOL  COCK(KAY U.ZOL)
              =^  NEB  NYS.WEG
                  =+  NEB=(~(GET BY NYS.WEG) S.FUD)
                  ?^  NEB  [U.NEB NYS.WEG]
                  =+  NEB=`BAIT`[(KINS P.FUD) 0 R.FUD ~]
                  [NEB (~(PUT BY NYS.WEG) S.FUD NEB)]
              ?>  (LTH Q.FUD P.R.NEB)
              ?>  =((KINS P.FUD) P.NEB)
              ?>  =(R.FUD P.R.NEB)
              =+  DOY=`(UNIT @)`(~(GET BY Q.R.NEB) Q.FUD)
              ?^  DOY  COCK
              =>  ^+  .   %=  .
                    Q.R.NEB  (~(PUT BY Q.R.NEB) Q.FUD T.FUD)
                    Q.NEB    +(Q.NEB)
                  ==
              ::  ~&  [%CARP Q.FUD S.FUD Q.NEB P.R.NEB]
              ?:  =(Q.NEB P.R.NEB)
                =:  NYS.WEG  (~(DEL BY NYS.WEG) S.FUD)
                ::  OLZ.WEG  (~(PUT BY OLZ.WEG) S.FUD KAY)
                  ==
                (GOLF P.NEB R.NEB)
              =.  +>.$  COCK
              +>.$(NYS.WEG (~(PUT BY NYS.WEG) S.FUD NEB))
            ::
                %FORE
              =+  ^=  LYN  ^-  LANE
                  ?~  Q.FUD  RYN
                  ?.  ?=(%IF -.U.Q.FUD)  U.Q.FUD
                  [%IX +.U.Q.FUD]
                  ::  U.Q.FUD
              ?:  =(OUR P.FUD)
                (EMIT %MEAD LYN R.FUD)
              =/  ZID  (MYX:GUS P.FUD)
              =/  ZON  %*(XONG ..XONG HER P.FUD)
              =/  FRO=(LIST SHIP)  (SAXO-SCRY OUR)
              (EMIR (WIST:ZID NOW (ZON FRO) [~ LYN] R.FUD))
            ==
          ::
          ++  EMIR                                      ::    EMIR:LA:HO:UM:AM
            |=  BEN=(LIST BOON)                         ::  EMIT BOONS
            ^+  +>
            ?~(BEN +> $(BEN T.BEN, BIN [I.BEN BIN]))
          ::
          ++  EMIT                                      ::    EMIT:LA:HO:UM:AM
            |=  BUN=BOON                                ::  EMIT A BOON
            +>(BIN [BUN BIN])
          ::
          ++  GOLF                                      ::    GOLF:LA:HO:UM:AM
            |=  [SIN=SKIN DUV=DOVE]                     ::  ASSEMBLE FRAGMENTS
            ^+  +>
            %+  CHEW  SIN
            =+  [NIX=0 RAX=*(LIST @)]
            |-  ^-  @
            ?:  =(P.DUV NIX)
              (CAN 13 (TURN (FLOP RAX) |=(A=@ [1 A])))
            $(NIX +(NIX), RAX [(NEED (~(GET BY Q.DUV) NIX)) RAX])
          --                                            ::  --LA:HO:UM:AM
        ::
        ++  PONG                                        ::    PONG:HO:UM:AM
          |=  HEN=DUCT                                  ::  TEST CONNECTION
          ^+  +>
          ?.  ?&  =(~ PUQ.PUZ)
                  ?|  BUST:PUZ
                      ?=(~ RUE.PUZ)
                      (GTH NOW (ADD ~S32 U.RUE.PUZ))
                      (LTH U.RUE.PUZ HOP.FOX)
                  ==
              ==
            +>.$
          (WOOL [/A/PING HEN] /A/PI ~ |)
        ::
        ++  THAW                                        ::    THAW:HO:UM:AM
          |=  FRO=(LIST SHIP)
          ^+  +>                                        ::  WAKEUP BOMB
          =+  OUB=BUST:PUZ
          =^  YEM  PUZ  (WACK:PUZ NOW)
          =+  BOU=BUST:PUZ
          =.  BIN
              ?.  &(BOU !OUB)  BIN
              :_(BIN [%WINE HER " NOT RESPONDING STILL TRYING"])
          =.  DIZ  ?:((BOOM:PUZ NOW) (PODE:DIZ NOW) DIZ)
          (BUSK (XONG FRO) YEM)
        ::
        ++  TOCK                                        ::    TOCK:HO:UM:AM
          |=  [COP=COOP FAP=FLAP COT=@DR]               ::  E2E ACK BY HASH
          ^+  +>
          =^  YOH  PUZ  (BICK:PUZ NOW FAP)
          =.  +>.$
            ?~  P.YOH  +>.$
            =^  HUD  +>.$
              (DONE P.U.P.YOH Q.U.P.YOH)
            ?~  HUD  +>.$
            %=    +>.$
                BIN
              :_  BIN
              `BOON`[%CAKE HER [[LYF:SEN:GUS CLON:DIZ] U.P.YOH] COP U.HUD]
            ==
          =/  FRO=(LIST SHIP)  (SAXO-SCRY OUR)
          (BUSK (XONG FRO) Q.YOH)
        ::
        ++  WIND                                        ::    WIND:HO:UM:AM
          |=  [GOM=SOUP HAM=MEAL]
          ::  ~&  [%WIND HER GOM]
          ^+  +>
          =/  SEG  (SEIN-SCRY HER)
          =^  WYV  DIZ  (ZUUL:DIZ NOW SEG HAM)
          =^  FEH  PUZ  (WHAP:PUZ NOW GOM WYV)
          =/  FRO=(LIST SHIP)  (SAXO-SCRY OUR)
          (BUSK (XONG FRO) FEH)
        ::
        ++  WOOL                                        ::    WOOL:HO:UM:AM
          |=  [HEN=DUCT CHA=PATH VAL=*]                 ::  SEND A STATEMENT
          ^+  +>
          =/  ROL=RILL  (FALL (~(GET BY RYL.BAH) CHA) *RILL)
          =/  SEX=@UD  SED.ROL
          ::  ~&  [%TX [OUR HER] CHA SEX]
          ::  IF WE DON'T HAVE A PUBLIC KEY FOR :HER,
          ::  SUBSCRIBE TO %JAEL FOR KEYS AND PROCEED
          ::
          ::    XX UPDATE STATE SO WE ONLY ASK ONCE?
          ::
          =?  BIN  =(~ LEW.WOD.DUR.DIZ)  :_(BIN [%BEER HER])
          ::  IF WE DON'T HAVE A PUBLIC KEY FOR :HER,
          ::  SCRY INTO %JAEL FOR THEM.
          ::  (SKIN WILL ONLY BE %OPEN IF THE SCRY IS ~)
          ::
          =?  LEW.WOD.DUR.DIZ  =(~ LEW.WOD.DUR.DIZ)
              =/  LIFE  (LIFE-SCRY HER)
              ?~(LIFE ~ (DEED-SCRY HER U.LIFE))
          =.  RYL.BAH
              %+  ~(PUT BY RYL.BAH)  CHA
              %=  ROL
                SED  +(SED.ROL)
                SAN  (~(PUT BY SAN.ROL) SEX HEN)
              ==
          %+  WIND  [CHA SEX]
          [%BOND CHA SEX VAL]
        ::
        ++  ZEST                                        ::    ZEST:HO:UM:AM
          :~  :~  :*  [%RTT RTT.SOP.BAH]
                      [%RTO RTO.SOP.BAH]
                      [%RTN RTN.SOP.BAH]
                      [%RUE RUE.SOP.BAH]
                  ==
                  :*  [%NUS NUS.SOP.BAH]
                      [%NIF NIF.SOP.BAH]
                      [%NEP NEP.SOP.BAH]
                      [%CAW CAW.SOP.BAH]
                      [%CAG CAG.SOP.BAH]
                  ==
                  =+  QUP=~(TAP TO PUQ.SOP.BAH)
                  :-  %QUP
                  %+  TURN  QUP
                  |=  [A=@UD B=SOUL]
                  :*  A
                      NUX.B
                      LIV.B
                      LYS.B
                      `@P`(MUG (SHAF %FLAP PAC.B))
                      GOM.B
                  ==
              ==
          ::
              :-  %RAZ
              =+  ZAR=~(TAP BY RAZ.BAH)
              %+  TURN  ZAR
              |=  [A=PATH B=RACE]
              :+  A
                DID.B
              =+  CIY=~(TAP BY MIS.B)
              %+  TURN  CIY
              |=  [C=@UD D=[P=CAPE Q=LANE R=FLAP S=(UNIT)]]
              [C P.D R.D]
          ::
              [%RYL ~(TAP TO RYL.BAH)]
              [%LUN LUN.WOD.DUR.DIZ]
              [%CAQ CAQ.DUR.DIZ]
              [%LEW LEW.WOD.DUR.DIZ]
          ==
        ::
        ++  ZANK                                        ::    ZANK:HO:UM:AM
          %=  +>.$                                      ::  RESOLVE
            GUS      (NUX:GUS DIZ)
            WAB.WEG  (~(PUT BY WAB.WEG) HER BAH(SOP ABET:PUZ))
          ==
        ::
        ++  XONG                                        ::    XONG:HO:UM:AM
          |=  FRO=(LIST SHIP)
          ^-  (LIST SHIP)                               ::  ROUTE UNTO
          =/  TOO  (SAXO-SCRY HER)
          =+  ^=  OOT  ^-  (LIST SHIP)
              =|  OOT=(LIST SHIP)
              |-  ^+  OOT
              ?~  TOO  ~
              ?:  (LIEN FRO |=(A=SHIP =(A I.TOO)))  ~
              [I.TOO $(TOO T.TOO)]
          ::  ~&  [%XONG-TO [OUR HER] (WELD OOT ?>(?=(^ FRO) T.FRO))]
          (WELD OOT ?>(?=(^ FRO) T.FRO))
        --                                              ::  --HO:UM:AM
      ::
      ++  KICK                                          ::    KICK:UM:AM
        |=  HEN=DUCT                                    ::  TEST CONNECTION
        ^+  +>
        =/  HOY  (TAIL (SAXO-SCRY OUR))
        |-  ^+  +>.^$
        ?~  HOY
          +>.^$
        $(HOY T.HOY, +>.^$ (PONG I.HOY HEN))
      ::
      ++  PALS                                          ::    PALS:UM:AM
        ^-  (LIST @P)                                   ::  ACTIVE NEIGHBORS
        %+  TURN
          %+  SKIM  ~(TAP BY WAB.WEG)
          |=  [A=SHIP B=BATH]
          !(~(BOOM PU SOP.B) NOW)
        |=([A=SHIP B=BATH] A)
      ::
      ++  PONG                                          ::    PONG:UM:AM
        |=  [HER=SHIP HEN=DUCT]                         ::  TEST NEIGHBOR
        ^+  +>
        ZANK:(PONG:(HO HER) HEN)
      ::
      ++  ZORK                                          ::    ZORK:UM:AM
        ^-  [P=(LIST BOON) Q=FORT]                      ::  RESOLVE
        :-  (FLOP BIN)
        %_  FOX
          TON  (~(SU GO TON.FOX) GUS)
          ZAC  WEG
        ==
      --                                                ::  --UM:AM
    --                                                  ::  --AM
  --
  .  ==
  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  ::              SECTION 4AH, PROTOCOL VANE            ::
  ::
  =|  $:  FOX=FORT                                      ::  KERNEL STATE
      ==                                                ::
  |=  [OUR=SHIP NOW=@DA ENY=@UVJ SKI=SLEY]              ::  CURRENT INVOCATION
  ^?                                                    ::  OPAQUE CORE
  =<
    ~%  %AMES-PROTOCOL  ..IS  ~
    |%                                                  ::  VANE INTERFACE
    ++  CALL                                            ::  HANDLE REQUEST
      ~/  %CALL
      |=  $:  HEN=DUCT
              TYPE=*
              WRAPPED-TASK=(HOBO TASK:ABLE)
          ==
      ^-  [(LIST MOVE) _..^$]
      =/  TASK=TASK:ABLE
        ?.  ?=(%SOFT -.WRAPPED-TASK)
          WRAPPED-TASK
        ((HARD TASK:ABLE) P.WRAPPED-TASK)
      =.  ANY.TON.FOX  ENY
      =^  DUY  ..KNOB  (KNOB HEN TASK)
      [DUY ..^$]
    ::
    ++  LOAD
      |=  OLD=FORT
      ..^$(FOX OLD)
    ::
    ++  SCRY
      |=  [FUR=(UNIT (SET MONK)) REN=@TAS WHY=SHOP SYD=DESK LOT=COIN TYL=PATH]
      ^-  (UNIT (UNIT CAGE))
      ?.  ?=(%& -.WHY)  [~ ~]
      ?~  TYL  [~ ~]
      =+  HUN=(SLAW %P I.TYL)
      ?~  HUN  [~ ~]
      ?.  =(`@`0 REN)  ~
      ?.  ?=([$$ %DA @] LOT)
        ~
      ?.  =(NOW Q.P.LOT)  ~
      (TEMP U.HUN [SYD T.TYL])
    ::
    ++  STAY  FOX
    ++  TAKE                                            ::  ACCEPT RESPONSE
      ~/  %TAKE
      |=  [TEA=WIRE HEN=DUCT HIN=(HYPO SIGN:ABLE)]
      ^-  [(LIST MOVE) _..^$]
      =.  ANY.TON.FOX  ENY
      =^  DUY  ..KNAP
        (KNAP TEA HEN Q.HIN)
      [DUY ..^$]
    --
  ~%  %AMES-IMPL  ..IS  ~
  |%
  ++  CLOP
    ~/  %CLOP
    |=  [NOW=@DA HEN=DUCT BON=BOON]
    ^-  [(LIST MOVE) FORT]
    ?-    -.BON
        %BEER
      =/  =WIRE  /PUBS/(SCOT %P P.BON)
      :_  FOX  [HEN [%PASS WIRE %J %PUBS P.BON]]~
    ::
        %BOCK
      :_  FOX  [HEN %GIVE %TURF TUF.FOX]~
    ::
        %BREW
      :_  FOX  [HEN [%PASS / %J %TURF ~]]~
    ::
        %CAKE
      ::  ~?  ?=(^ R.BON)  [%CAKE-WOOT-BAD HEN R.BON]
      :_  FOX
      :~  [S.BON %GIVE %WOOT P.BON R.BON]
      ==
    ::
        %MEAD
      =^  MOZ  +>.$  (KNOB HEN [%HEAR P.BON Q.BON])
      [MOZ FOX]
    ::
        %MILK
      ::  ~&  [%MILK P.BON Q.BON]
      ?>  ?=([@ @ *] Q.Q.BON)
      ?>  ?=(?(%A %C %E %G %J) I.Q.Q.BON)
      =/  =WIRE  [(SCOT %P OUR) (SCOT %P P.BON) Q.Q.BON]
      :_  FOX  [HEN %PASS WIRE I.Q.Q.BON %WEST P.BON T.Q.Q.BON R.BON]~
    ::
        %OUZO
      ::  ~&  [%SEND NOW P.BON `@P`(MUG (SHAF %FLAP Q.BON))]
      ~|  [%AMES-BAD-DUCT DUCT=GAD.FOX LANE=P.BON]
      ?>  ?=(^ GAD.FOX)
      :_  FOX
      [[GAD.FOX [%GIVE %SEND P.BON Q.BON]] ~]
    ::
        %PITO
      :_  FOX(TIM `P.BON)
      %-  FLOP
      ^-  (LIST MOVE)
      :-  [GAD.FOX %PASS /AMES %B %WAIT P.BON]
      ?~  TIM.FOX  ~
      [GAD.FOX %PASS /AMES %B %REST U.TIM.FOX]~
    ::
        %RAKI
      =*  HER  P.BON
      =/  MOZ=(LIST MOVE)
        [HEN [%PASS / %J %MEET HER LIFE=Q.BON PASS=R.BON]]~
      ::  POKE :DNS WITH AN INDIRECT BINDING IF HER IS A PLANET WE'RE SPNSORING
      ::
      =?  MOZ  ?&  ?=(%DUKE (CLAN:TITLE HER))
                   ?=(%KING (CLAN:TITLE OUR))
                   =(OUR (~(SEIN-SCRY AM [OUR NOW FOX SKI]) HER))
               ==
        =/  CMD  [%MEET HER]
        =/  POK  [%DNS %POKE `CAGE`[%DNS-COMMAND !>(CMD)]]
        :_  MOZ  [HEN [%PASS / %G %DEAL [OUR OUR] POK]]
      [MOZ FOX]
    ::
        %SAKE
      =/  =WIRE  /OUR/(SCOT %P OUR)
      :_  FOX  [HEN [%PASS WIRE %J %VEIN ~]]~
    ::
        %WINE
      :_  FOX
      =+  FOM=~(REND CO %$ %P P.BON)
      :~  :-  HEN
          :+  %SLIP  %D
          :+  %FLOG  %TEXT
          ;:  WELD
            "; "
            FOM
            Q.BON
          ==
      ==
    ==
  ::
  ++  KNAP
    ~/  %KNAP
    |=  [TEA=WIRE HEN=DUCT SIH=SIGN:ABLE]
    ^-  [(LIST MOVE) _+>]
    ?-  +<.SIH
        %CRUD  [[[HEN [%SLIP %D %FLOG +.SIH]] ~] +>]
    ::
        %MACK  ?~  +>.SIH  $(SIH [%G %NICE ~])          ::  XX USING OLD CODE
               $(SIH [%G %MEAN `[%MACK +>+.SIH]])
    ::
        %TURF
      =.  TUF.FOX  TURF.SIH
      [~ +>.$]
    ::
        %PUBS
      ?.  ?=([%PUBS @ ~] TEA)
        ~&  [%STRANGE-PUBS TEA]
        [~ +>]
      =/  HER=SHIP  (SLAV %P I.T.TEA)
      =/  GUS  (~(US GO TON.FOX) OUR)
      =/  DIZ  (MYX:GUS HER)
      ?:  =(0 LIFE.SIH)
          ::  THIS SHOULD CLEAR LEW.WOD.DUR.DIZ BECAUSE IT MEANS
          ::  WE NO LONGER TRUST THAT THEIR PUBLIC KEY CAME TO
          ::  US HONESTLY (BECUSE OF A %JAEL SNAPSHOT RESTORE).
          ::  IN PRACTICE, THAT CRASHES IN ++CLUY:LAS:AS:GO, SO
          ::  WE IGNORE FOR NOW.
          ~&  [%AMES-HEAR-EMPTY-PUB HER]
          [~ +>.$]
      =/  DED=DEED
        [LIFE.SIH (~(GOT BY PUBS.SIH) LIFE.SIH) OATH=~]
      =.  LEW.WOD.DUR.DIZ  `DED
      =.  TON.FOX  (~(SU GO TON.FOX) (NUX:GUS DIZ))
      [~ +>.$]
    ::
        %UNTO  [~ +>]
    ::
        %VEIN
      ?.  ?=([%OUR @ ~] TEA)
        ~&  [%STRANGE-VEIN TEA]
        [~ +>]
      =.  FOX  (~(VEIN AM [OUR NOW FOX SKI]) LIFE.SIH VEIN.SIH)
      [~ +>.$]
    ::
        %WOOT  [~ +>]
    ::
        *
      =+  ^=  FUY
        ^-  [P=(LIST BOON) Q=FORT]
        ?-  +<.SIH
        ::
            %WAKE
          (~(WAKE AM [OUR NOW FOX SKI]) HEN)
        ::
            ?(%MEAN %NICE)                              ::  XX OBSOLETE
          ?:  ?=([%YE ~] TEA)
            [~ FOX]
          ?>  ?=([@ @ @ *] TEA)
          =/  HER  (SLAV %P I.T.TEA)
          =*  PAX  T.T.TEA
          =<  ZORK  =<  ZANK
          %^  ~(RACK AM [OUR NOW FOX SKI])  HER  PAX
          ::  ~&  [%KNAP-ACK ?-(+<.SIH %MEAN `P.+.SIH, %NICE ~)]
          ?-(+<.SIH %MEAN `P.+.SIH, %NICE ~)
        ==
      =>  %_(. FOX Q.FUY)
      =|  OUT=(LIST MOVE)
      |-  ^-  [P=(LIST MOVE) Q=_+>.^$]
      ?~  P.FUY
        [(FLOP OUT) +>.^$]
      =^  TOE  FOX  (CLOP NOW HEN I.P.FUY)
      $(P.FUY T.P.FUY, OUT (WELD (FLOP TOE) OUT))
    ==
  ::
  ++  KNOB
    ~/  %KNOB
    |=  [HEN=DUCT KYZ=TASK:ABLE]
    ^-  [(LIST MOVE) _+>]
    ?:  ?=(%CRUD -.KYZ)
      [[[HEN [%SLIP %D %FLOG KYZ]] ~] +>]
    ?:  ?=(%WEST -.KYZ)
      ?>  ?=([%PI ~] Q.KYZ)
      :_  +>.$
      [[HEN %GIVE %MACK ~] ~]
    ?:  ?=(%WEGH -.KYZ)
      ~&  %AMES-WEIGHING
      [[HEN %GIVE %MASS WEGH]~ +>]
    =+  ^=  FUY
        ^-  [P=(LIST BOON) Q=FORT]
        ?-    -.KYZ
            %BARN
          :_  FOX(GAD HEN)
          [%BOCK ~]~
        ::
            %BONK
          :_  FOX
          ?~  TIM.FOX
            ~&  %AMES-BONK-E
            ~
          [%PITO U.TIM.FOX]~
        ::
            %HEAR
          (~(GNAW AM [OUR NOW FOX SKI]) %GOOD P.KYZ Q.KYZ)
        ::
            %HALO
          (~(GNAW AM [OUR NOW FOX SKI]) %DEAD P.KYZ Q.KYZ)
        ::
            %HOLE
          (~(GNAW AM [OUR NOW FOX SKI]) %DEAD P.KYZ Q.KYZ)
        ::
            %INIT
          :_  FOX  [[%SAKE ~] [%BREW ~] ~]
        ::
            %KICK
          =^  BAN  FOX  (~(KICK AM [OUR NOW FOX(HOP P.KYZ) SKI]) HEN)
          ::  +NEXT:AM CALLED HERE BECAUSE +WAKE CALLS +KICK IN A LOOP
          ::
          [(WELD P.BAN ~(NEXT AM [OUR NOW FOX SKI])) FOX]
        ::
            %NUKE
          :-  ~
          ?:  (~(HAS IN BAD.FOX) P.KYZ)
            ~&  [%UNBLOCK P.KYZ]
            FOX(BAD (~(DEL IN BAD.FOX) P.KYZ))
          ~&  [%BLOCK P.KYZ]
          FOX(BAD (~(PUT IN BAD.FOX) P.KYZ))
        ::
            %SUNK
          =*  WHO  P.KYZ
          =*  LYF  Q.KYZ
          ?:  =(OUR WHO)
            ?:  (LTH LYF P:(HEAD VAL.TON.FOX))
              ::  REPLAYING OUR OLD SINKAGE, IGNORE
              ::  XX REVIEW
              ::
              [~ FOX]
            ::  XX INCLUDE SOME HELPFUL INSTRUCTIONS HERE
            ::
            :_  FOX
            [%WINE WHO ", YOU HAVE SUNK"]~
          ::
          =:  HOC.TON.FOX  (~(DEL BY HOC.TON.FOX) WHO)
              WAB.ZAC.FOX  (~(DEL BY WAB.ZAC.FOX) WHO)
            ==
          [[%WINE WHO " HAS SUNK"]~ FOX]
        ::
            %VEGA
          ::  RE-INITIALIZE OUR CRYPTOSUITE B CORES
          ::
          =/  =WUND
            %+  TURN
              VAL.TON.FOX
            |=  [=LIFE =RING *]
            [LIFE RING (NOL:NU:CRUB:CRYPTO RING)]
          [~ FOX(VAL.TON WUND)]
        ::
            %WAKE
          (~(WAKE AM [OUR NOW FOX SKI]) HEN)
        ::
            %WANT
          (~(WISE AM [OUR NOW FOX SKI]) HEN P.KYZ Q.KYZ R.KYZ)
        ==
    =>  %_(. FOX Q.FUY)
    =|  OUT=(LIST MOVE)
    |-  ^-  [P=(LIST MOVE) Q=_+>.^$]
    ?~  P.FUY
      [(FLOP OUT) +>.^$]
    =^  TOE  FOX  (CLOP NOW HEN I.P.FUY)
    $(P.FUY T.P.FUY, OUT (WELD (FLOP TOE) OUT))
  ::
  ++  TEMP
    ~/  %TEMP
    |=  [HIS=SHIP TYL=PATH]
    ^-  (UNIT (UNIT CAGE))
    ?:  ?=([?(%SHOW %TELL) *] TYL)
      ?^  T.TYL  [~ ~]
      =+  ZET=ZEST:(HO:~(UM AM [OUR NOW FOX SKI]) HIS)
      ``[%NOUN ?:(=(%SHOW I.TYL) !>(>ZET<) !>(ZET))]
    ?:  ?=([%PALS ~] TYL)
      ?.  =(OUR HIS)
        ~
      ``[%NOUN !>(PALS:~(UM AM [OUR NOW FOX SKI]))]
    ?:  ?=([%TIME ~] TYL)
      ?.  =(OUR HIS)
        ~
      ``[%NOUN !>(TIM.FOX)]
    ~
  ::
  ++  WEGH
    ^-  MASS
    :+  %AMES  %|
    :~  :+  %TOWN  %|
        =>  TON.FOX
        :~  WUND+&+VAL
            DEED+&+LAW
            FAST+&+SEH
            THEM+&+HOC
        ==
        :+  %CORN  %|
        =>  ZAC.FOX
        :~  INCOMING+&+NYS
            COMPLETE+&+OLZ
            NEIGHBOR+&+WAB
        ==
        DOT+&+FOX
    ==
  --
