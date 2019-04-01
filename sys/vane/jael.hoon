!:                                                      ::  /VAN/JAEL
::                                                      ::  %REFERENCE/0
!?  150
::
::
::  %JAEL: SECRETS AND PROMISES.
::
::  TODO:
::
::    - COMMUNICATION WITH OTHER VANES:
::      - ACTUALLY USE %BEHN FOR EXPIRING SECRETS
::      - REPORT %AMES PROPAGATION ERRORS TO USER
::
::    - NICE FEATURES:
::      - SCRY NAMESPACE
::      - TASK FOR CONVERTING INVITES TO TICKETS
::
|=  PIT/VASE
=,  PKI:JAEL
=,  RIGHTS:JAEL
=,  ABLE:JAEL
=,  CRYPTO
=,  JAEL
=,  ETHEREUM
=,  RPC
=,  AZIMUTH
::                                                      ::::
::::                    # MODELS                        ::  DATA STRUCTURES
  ::                                                    ::::
::  THE %JAEL STATE COMES IN TWO PARTS: ABSOLUTE
::  AND RELATIVE.
::
::  ++STATE-ABSOLUTE IS OBJECTIVE -- DEFINED WITHOUT
::  REFERENCE TO OUR SHIP.  IF YOU STEAL SOMEONE ELSE'S
::  PRIVATE KEYS, WE HAVE A PLACE TO PUT THEM.  WHEN
::  OTHERS MAKE PROMISES TO US, WE STORE THEM IN THE
::  SAME STRUCTURES WE USE TO MAKE PROMISES TO OTHERS.
::
::  ++STATE-RELATIVE IS SUBJECTIVE, DENORMALIZED AND
::  DERIVED.  IT CONSISTS OF ALL THE STATE WE NEED TO
::  MANAGE SUBSCRIPTIONS EFFICIENTLY.
::
=>  |%
++  STATE                                               ::  ALL VANE STATE
  $:  VER/$0                                            ::  VANE VERSION
      YEN/(SET DUCT)                                    ::  RAW OBSERVERS
      URB/STATE-ABSOLUTE                                ::  ALL ABSOLUTE STATE
      SUB/STATE-RELATIVE                                ::  ALL RELATIVE STATE
      ETN=STATE-ETH-NODE                                ::  ETH CONNECTION STATE
      SAP=STATE-SNAPSHOTS                               ::  STATE SNAPSHOTS
  ==                                                    ::
++  STATE-RELATIVE                                      ::  URBIT METADATA
  $:  $=  BAL                                           ::  BALANCE SHEET (VEST)
        $:  YEN/(SET DUCT)                              ::  TRACKERS
        ==                                              ::
      $=  OWN                                           ::  VAULT (VEIN)
        $:  YEN/(SET DUCT)                              ::  TRACKERS
            SIG=(UNIT OATH)                             ::  FOR A MOON
            :: XX RECONCILE WITH .DNS.ETH               ::
            TUF=(LIST TURF)                             ::  DOMAINS
            :: XX USE FOR ETH REPLAY                    ::
            BOQ=@UD                                     ::  BOOT BLOCK
            NOD=(UNIT PURL:EYRE)                        ::  ETH GATEWAY
            FAK/_|                                      ::  FAKE KEYS
            LYF/LIFE                                    ::  VERSION
            JAW/(MAP LIFE RING)                         ::  PRIVATE KEYS
        ==                                              ::
      $=  PUK                                           ::  PUBLIC KEYS (PUBS)
        $:  YEN=(JUG SHIP DUCT)                         ::  TRACKERS
            KYZ=(MAP SHIP PUBLIC)                       ::  PUBLIC KEY STATE
        ==                                              ::
      $=  ETH                                           ::  ETHEREUM (VENT)
        ::TODO  THE SUBSCRIBERS HERE NEVER HEAR DNS OR POS...
        $:  YEN=(SET DUCT)                              ::  TRACKERS
            DNS=DNSES                                   ::  ON-CHAIN DNS STATE
            POS=(MAP SHIP POINT)                        ::  ON-CHAIN SHIP STATE
            ::TODO  DO WE WANT (MAP SHIP DIFF-POINT) TOO?
        ==                                              ::
  ==                                                    ::
++  STATE-ABSOLUTE                                      ::  ABSOLUTE URBIT
  $:  PRY/(MAP SHIP (MAP SHIP SAFE))                    ::  PROMISES
  ==                                                    ::
++  STATE-SNAPSHOTS                                     ::  REWIND POINTS
  $:  INTERVAL=_100                                     ::  BLOCK INTERVAL
      MAX-COUNT=_10                                     ::  MAX SNAPS
      COUNT=@UD                                         ::  LENGTH OF SNAPS
      LAST-BLOCK=@UD                                    ::  NUMBER OF LAST SNAP
      SNAPS=(QEU [BLOCK-NUMBER=@UD SNAP=SNAPSHOT])      ::  OLD STATES
  ==                                                    ::
++  MESSAGE                                             ::  P2P MESSAGE
  $%  [%HAIL P=REMOTE]                                  ::  RESET RIGHTS
      [%NUKE ~]                                         ::  CANCEL TRACKERS
      [%VENT ~]                                         ::  VIEW ETHEREUM EVENTS
      [%VENT-RESULT P=VENT-RESULT]                      ::  TMP WORKAROUND
  ==                                                    ::
++  CARD                                                ::  I/O ACTION
  (WIND NOTE:ABLE GIFT)                                 ::
::                                                      ::
++  MOVE                                                ::  OUTPUT
  {P/DUCT Q/CARD}                                       ::
--  ::
::                                                      ::::
::::                    # LIGHT                         ::  LIGHT CORES
  ::                                                    ::::
=>  |%
::                                                      ::  ++PY
::::                    ## SPARSE/LIGHT                 ::  SPARSE RANGE
  ::                                                    ::::
++  PY
  ::  BECAUSE WHEN YOU'RE A STAR WITH 2^16 UNISSUED
  ::  PLANETS, A (SET) IS KIND OF LAME...
  ::
  |_  A/PILE
  ::                                                    ::  ++DIF:PY
  ++  DIF                                               ::  ADD/REMOVE A->B
    |=  B/PILE
    ^-  (PAIR PILE PILE)
    [(SUB(A B) A) (SUB B)]
  ::                                                    ::  ++DIV:PY
  ++  DIV                                               ::  ALLOCATE
    |=  B/@UD
    ^-  (UNIT (PAIR PILE PILE))
    =<  ?-(- %& [~ P], %| ~)
    |-  ^-  (EACH (PAIR PILE PILE) @U)
    ?:  =(0 B)
      [%& ~ A]
    ?~  A  [%| 0]
    =/  AL  $(A L.A)
    ?-    -.AL
        %&  [%& P.P.AL A(L Q.P.AL)]
        %|
      =.  B  (^SUB B P.AL)
      =/  TOP  +((^SUB Q.N.A P.N.A))
      ?:  =(B TOP)
        [%& A(R ~) R.A]
      ?:  (LTH B TOP)
        :+  %&  A(R ~, Q.N (ADD P.N.A (DEC B)))
        =.  P.N.A  (ADD P.N.A B)
        (UNI(A R.A) [N.A ~ ~])
      =/  AR  $(A R.A, B (^SUB B TOP))
      ?-    -.AR
          %&  [%& A(R P.P.AR) Q.P.AR]
          %|  [%| :(ADD TOP P.AL P.AR)]
      ==
    ==
  ::
  ++  GAS                                               ::  ++GAS:PY
    |=  B/(LIST @)  ^-  PILE                            ::  INSERT LIST
    ?~  B  A
    $(B T.B, A (PUT I.B))
  ::                                                    ::  ++GUD:PY
  ++  GUD                                               ::  VALIDATE
    =|  {BOT/(UNIT @) TOP/(UNIT @)}
    |-  ^-  ?
    ?~  A  &
    ?&  (LTE P.N.A Q.N.A)
        ?~(TOP & (LTH +(Q.N.A) U.TOP))
        ?~(BOT & (GTH P.N.A +(U.BOT)))
    ::
        ?~(L.A & (MOR P.N.A P.N.L.A))
        $(A L.A, TOP `P.N.A)
    ::
        ?~(L.A & (MOR P.N.A P.N.L.A))
        $(A R.A, BOT `Q.N.A)
    ==
  ::                                                    ::  ++INT:PY
  ++  INT                                               ::  INTERSECTION
    |=  B/PILE  ^-  PILE
    ?~  A  ~
    ?~  B  ~
    ?.  (MOR P.N.A P.N.B)  $(A B, B A)
    ?:  (GTH P.N.A Q.N.B)
      (UNI(A $(B R.B)) $(A L.A, R.B ~))
    ?:  (LTH Q.N.A P.N.B)
      (UNI(A $(B L.B)) $(A R.A, L.B ~))
    ?:  (GTE P.N.A P.N.B)
      ?:  (LTE Q.N.A Q.N.B)
        [N.A $(A L.A, R.B ~) $(A R.A, L.B ~)]
      [N.A(Q Q.N.B) $(A L.A, R.B ~) $(L.A ~, B R.B)]
    %-  UNI(A $(R.A ~, B L.B))
    ?:  (LTE Q.N.A Q.N.B)
      %-  UNI(A $(L.B ~, A R.A))
      [N.B(Q Q.N.A) ~ ~]
    %-  UNI(A $(L.A ~, B R.B))
    [N.B ~ ~]
  ::                                                    ::  ++PUT:PY
  ++  PUT                                               ::  INSERT
    |=  B/@  ^-  PILE
    (UNI [B B] ~ ~)
  ::                                                    ::  ++SUB:PY
  ++  SUB                                               ::  SUBTRACT
    |=  B/PILE  ^-  PILE
    ?~  B  A
    ?~  A  A
    ?:  (GTH P.N.A Q.N.B)
      $(B R.B, L.A $(A L.A, R.B ~))
    ?:  (LTH Q.N.A P.N.B)
      $(B L.B, R.A $(A R.A, L.B ~))
    %-  UNI(A $(A L.A, R.B ~))
    %-  UNI(A $(A R.A, L.B ~))
    ?:  (GTE P.N.A P.N.B)
      ?:  (LTE Q.N.A Q.N.B)
        ~
      $(B R.B, A [[+(Q.N.B) Q.N.A] ~ ~])
    ?:  (LTE Q.N.A Q.N.B)
      $(B L.B, A [[N.A(Q (MIN Q.N.A (DEC P.N.B)))] ~ ~])
    %-  UNI(A $(B R.B, A [[+(Q.N.B) Q.N.A] ~ ~]))
    $(B L.B, A [[N.A(Q (MIN Q.N.A (DEC P.N.B)))] ~ ~])
  ::                                                    ::  ++TAP:PY
  ++  TAP                                               ::  INTO FULL LIST
    =|  OUT/(LIST @)
    |-  ^+  OUT
    ?~  A  OUT
    $(A L.A, OUT (WELP (GULF N.A) $(A R.A)))
  ::                                                    ::  ++UNI:PY
  ++  UNI                                               ::  MERGE TWO PILES
    |=  B/PILE
    ^-  PILE
    ?~  B  A
    ?~  A  B
    ?.  (MOR P.N.A P.N.B)  $(A B, B A)
    ?:  (LTH +(Q.N.B) P.N.A)
      $(B R.B, L.A $(A L.A, R.B ~))
    ?:  (LTH +(Q.N.A) P.N.B)
      $(B L.B, R.A $(A R.A, L.B ~))
    ?:  =(N.A N.B)  [N.A $(A L.A, B L.B) $(A R.A, B R.B)]
    ?:  (LTH P.N.A P.N.B)
      ?:  (GTH Q.N.A Q.N.B)
        $(B L.B, A $(B R.B))
      $(B L.B, A $(B R.B, A $(B R.A, R.A ~, Q.N.A Q.N.B)))
    ?:  (GTH Q.N.A Q.N.B)
      $(A L.A, B $(A R.A, B $(A R.B, R.B ~, Q.N.B Q.N.A)))
    $(A L.A, B $(A R.A))
  --  ::PY
::                                                      ::  ++RY
::::                    ## RIGHTS/LIGHT                 ::  RIGHTS ALGEBRA
  ::                                                    ::::
++  RY
  ::
  ::  WE NEED TO BE ABLE TO COMBINE RIGHTS, AND
  ::  TRACK CHANGES BY TAKING DIFFERENCES BETWEEN THEM.
  ::
  ::  ++RY MUST ALWAYS CRASH WHEN YOU TRY TO MAKE IT
  ::  DO SOMETHING THAT MAKES NO SENSE.
  ::
  ::  LANGUAGE COMPROMISES: THE TYPE SYSTEM CAN'T ENFORCE
  ::  THAT LEF AND RYT MATCH, HENCE THE ASSERTS.
  ::
  =<  |_  $:  ::  LEF: OLD RIGHT
              ::  RYT: NEW RIGHT
              ::
              LEF/RITE
              RYT/RITE
          ==
      ::                                                ::  ++UNI:RY
      ++  UNI  ~(SUM +> LEF RYT)                        ::  ADD RIGHTS
      ::                                                ::  ++DIF:RY
      ++  DIF                                           ::  R->L: {ADD REMOVE}
        ^-  (PAIR (UNIT RITE) (UNIT RITE))
        [~(DIF +> RYT LEF) ~(DIF +> LEF RYT)]
      ::                                                ::  ++SUB:RY
      ++  SUB                                           ::  L - R
        ^-  (UNIT RITE)
        =/  VID  DIF
        ~|  VID
        ?>(?=($~ Q.VID) P.VID)
      --
  |_  $:  ::  LEF: OLD RIGHT
          ::  RYT: NEW RIGHT
          ::
          LEF/RITE
          RYT/RITE
      ==
  ::                                                    ::  ++SUB-BY:PY
  ++  SUB-BY                                            ::  SUBTRACT ELEMENTS
    |*  {NEW/(MAP) OLD/(MAP) SUB/$-(^ *)}  ^+  NEW
    %-  ~(REP BY NEW)
    |*  {{KEY/* VAL/*} ACC/_^+(NEW ~)}
    =>  .(+<- [KEY VAL]=+<-)
    =/  VAR  (~(GET BY OLD) KEY)
    =.  VAL  ?~(VAR VAL (SUB VAL U.VAR))
    ?~  VAL  ACC
    (~(PUT BY ,.ACC) KEY VAL)
  ::                                                    ::  ++DIF:RY
  ++  DIF                                               ::  IN R AND NOT L
    ^-  (UNIT RITE)
    |^  ?-  -.LEF
          $APPLE  ?>(?=($APPLE -.RYT) (TABLE %APPLE P.LEF P.RYT))
          $BLOCK  ?>(?=($BLOCK -.RYT) ~)
          $EMAIL  ?>(?=($EMAIL -.RYT) (SABLE %EMAIL P.LEF P.RYT))
          $FINAL  ?>(?=($FINAL -.RYT) (TABLE %FINAL P.LEF P.RYT))
          $FUNGI  ?>(?=($FUNGI -.RYT) (NOBLE %FUNGI P.LEF P.RYT))
          $GUEST  ?>(?=($GUEST -.RYT) ~)
          $HOTEL  ?>(?=($HOTEL -.RYT) (BIBLE %HOTEL P.LEF P.RYT))
          $JEWEL  ?>(?=($JEWEL -.RYT) (TABLE %JEWEL P.LEF P.RYT))
          $LOGIN  ?>(?=($LOGIN -.RYT) (SABLE %LOGIN P.LEF P.RYT))
          $PWORD  ?>(?=($PWORD -.RYT) (RUBLE %PWORD P.LEF P.RYT))
          $TOKEN  ?>(?=($TOKEN -.RYT) (RUBLE %TOKEN P.LEF P.RYT))
          $URBAN  ?>(?=($URBAN -.RYT) (TABLE %URBAN P.LEF P.RYT))
        ==
    ::                                                  ::  ++CABLE:DIF:RY
    ++  CABLE                                           ::  DIFF ATOM
      |*  {NUT/@TAS NEW/@ OLD/@}
      ^-  (UNIT RITE)
      ?:  =(NEW OLD)  ~
      `[NUT NEW]
    ::                                                  ::  ++BIBLE:DIF:RY
    ++  BIBLE                                           ::  DIFF PILE
      |*  {NUT/@TAS OLD/(MAP DORM PILE) NEW/(MAP DORM PILE)}
      ^-  (UNIT RITE)
      =;  MOR/_NEW
        ?~(MOR ~ `[NUT MOR])
      %^  SUB-BY  NEW  OLD
      |=({A/PILE B/PILE} (~(SUB PY A) B))
    ::                                                  ::  ++NOBLE:DIF:RY
    ++  NOBLE                                           ::  DIFF MAP OF @UD
      |*  {NUT/@TAS OLD/(MAP * @UD) NEW/(MAP * @UD)}
      ^-  (UNIT RITE)
      =;  MOR/_NEW
        ?~(MOR ~ `[NUT MOR])
      %^  SUB-BY  NEW  OLD
      |=({A/@U B/@U} (SUB A (MIN A B)))
    ::                                                  ::  ++RUBLE:DIF:RY
    ++  RUBLE                                           ::  DIFF MAP OF MAPS
      |*  {NUT/@TAS OLD/(MAP * (MAP)) NEW/(MAP * (MAP))}
      ^-  (UNIT RITE)
      =;  MOR/_NEW
        ?~(MOR ~ `[NUT MOR])
      %^  SUB-BY  NEW  OLD
      =*  VALU  (~(GOT BY NEW))
      |=  {A/_^+(VALU ~) B/_^+(VALU ~)}  ^+  A
      (SUB-BY A B |*({A2/* B2/*} A2))
    ::                                                  ::  ++SABLE:DIF:RY
    ++  SABLE                                           ::  DIFF SET
      |*  {NUT/@TAS OLD/(SET) NEW/(SET)}
      ^-  (UNIT RITE)
      =;  MOR  ?~(MOR ~ `[NUT MOR])
      (~(DIF IN NEW) OLD)
    ::                                                  ::  ++TABLE:DIF:RY
    ++  TABLE                                           ::  DIFF MAP
      |*  {NUT/@TAS OLD/(MAP) NEW/(MAP)}
      ^-  (UNIT RITE)
      =;  MOR  ?~(MOR ~ `[NUT MOR])
      (SUB-BY NEW OLD |*({A/* B/*} A))
    --  ::DIF
  ::                                                    ::  ++SUM:RY
  ++  SUM                                               ::  LEF NEW, RYT OLD
    ^-  RITE
    |^  ?-  -.LEF
          $APPLE  ?>(?=($APPLE -.RYT) [%APPLE (TABLE P.LEF P.RYT)])
          $BLOCK  ?>(?=($BLOCK -.RYT) [%BLOCK ~])
          $EMAIL  ?>(?=($EMAIL -.RYT) [%EMAIL (SABLE P.LEF P.RYT)])
          $FINAL  ?>(?=($FINAL -.RYT) [%FINAL (TABLE P.LEF P.RYT)])
          $FUNGI  ?>(?=($FUNGI -.RYT) [%FUNGI (NOBLE P.LEF P.RYT)])
          $GUEST  ?>(?=($GUEST -.RYT) [%GUEST ~])
          $HOTEL  ?>(?=($HOTEL -.RYT) [%HOTEL (BIBLE P.LEF P.RYT)])
          $JEWEL  ?>(?=($JEWEL -.RYT) [%JEWEL (TABLE P.LEF P.RYT)])
          $LOGIN  ?>(?=($LOGIN -.RYT) [%LOGIN (SABLE P.LEF P.RYT)])
          $PWORD  ?>(?=($PWORD -.RYT) [%PWORD (RUBLE P.LEF P.RYT)])
          $TOKEN  ?>(?=($TOKEN -.RYT) [%TOKEN (RUBLE P.LEF P.RYT)])
          $URBAN  ?>(?=($URBAN -.RYT) [%URBAN (TABLE P.LEF P.RYT)])
        ==
    ::                                                  ::  ++BIBLE:UNI:RY
    ++  BIBLE                                           ::  UNION PILE
      |=  {NEW/(MAP DORM PILE) OLD/(MAP DORM PILE)}
      ^+  NEW
      %-  (~(UNO BY OLD) NEW)
      |=  (TREL DORM PILE PILE)
      (~(UNI PY Q) R)
    ::                                                  ::  ++NOBLE:UNI:RY
    ++  NOBLE                                           ::  UNION MAP OF @UD
      |=  {NEW/(MAP TERM @UD) OLD/(MAP TERM @UD)}
      ^+  NEW
      %-  (~(UNO BY OLD) NEW)
      |=  (TREL TERM @UD @UD)
      (ADD Q R)
    ::                                                  ::  ++RUBLE:UNI:RY
    ++  RUBLE                                           ::  UNION MAP OF MAPS
      |=  {NEW/(MAP SITE (MAP @T @T)) OLD/(MAP SITE (MAP @T @T))}
      ^+  NEW
      %-  (~(UNO BY OLD) NEW)
      |=  (TREL SITE (MAP @T @T) (MAP @T @T))
      %-  (~(UNO BY Q) R)
      |=  (TREL @T @T @T)
      ?>(=(Q R) R)
    ::                                                  ::  ++SABLE:UNI:RY
    ++  SABLE                                           ::  UNION SET
      |*  {NEW/(SET) OLD/(SET)}
      ^+  NEW
      (~(UNI IN OLD) NEW)
    ::                                                  ::  ++TABLE:UNI:RY
    ++  TABLE                                           ::  UNION MAP
      |*  {NEW/(MAP) OLD/(MAP)}
      ^+  NEW
      %-  (~(UNO BY OLD) NEW)
      |=  (TREL _P.-<.NEW _Q.->.NEW _Q.->.NEW)
      ?>(=(Q R) R)
    --  ::UNI
  --  ::RY
::                                                      ::  ++UP
::::                    ## WALLET^LIGHT                 ::  WALLET ALGEBRA
  ::                                                    ::::
++  UP
  ::  A SET OF RITES IS STORED AS A TREE (++SAFE), SORTED
  ::  BY ++GOR ON THE STEM, BALANCED BY ++MOR ON THE STEM.
  ::  (THIS IS ESSENTIALLY A ++MAP WITH STEM AS KEY, BUT
  ::  ++MAP DOESN'T KNOW HOW TO LINK STEM AND BULB TYPES.)
  ::  THE GOAL OF THE DESIGN IS TO MAKE IT EASY TO ADD NEW
  ::  KINDS OF RITE WITHOUT A STATE ADAPTER.
  ::
  ::  WALLET OPERATIONS ALWAYS CRASH IF IMPOSSIBLE;
  ::  %JAEL HAS NO CONCEPT OF NEGATIVE RIGHTS.
  ::
  ::  PERFORMANCE ISSUES: ++DIFFER AND ++SPLICE, NAIVE.
  ::
  ::  EXTERNAL ISSUES: MUCH COPY AND PASTE FROM ++BY.  IT
  ::  WOULD BE NICE TO RESOLVE THIS SOMEHOW, BUT NOT URGENT.
  ::
  ::  LANGUAGE ISSUES: IF HOON HAD AN EQUALITY TEST
  ::  THAT INFORMED INFERENCE, ++EXPOSE COULD BE
  ::  PROPERLY INFERRED, ELIMINATING THE ?>.
  ::
  |_  PIG/SAFE
  ::                                                    ::  ++DELETE:UP
  ++  DELETE                                            ::  DELETE RIGHT
    |=  RYT/RITE
    ^-  SAFE
    ?~  PIG
      ~
    ?.  =(-.RYT -.N.PIG)
      ?:  (GOR -.RYT -.N.PIG)
        [N.PIG $(PIG L.PIG) R.PIG]
      [N.PIG L.PIG $(PIG R.PIG)]
    =/  DUB  ~(SUB RY N.PIG RYT)
    ?^  DUB  [U.DUB L.PIG R.PIG]
    |-  ^-  SAFE
    ?~  L.PIG  R.PIG
    ?~  R.PIG  L.PIG
    ?:  (MOR -.N.L.PIG -.N.R.PIG)
      [N.L.PIG L.L.PIG $(L.PIG R.L.PIG)]
    [N.R.PIG $(R.PIG L.R.PIG) R.R.PIG]
  ::                                                    ::  ++DIFFER:UP
  ++  DIFFER                                            ::  DELTA PIG->GOB
    |=  GOB/SAFE
    ^-  BUMP
    |^  [WAY WAY(PIG GOB, GOB PIG)]
    ++  WAY
      %-  INTERN(PIG ~)
      %+  SKIP  LINEAR(PIG GOB)
      |=(RITE (~(HAS IN PIG) +<))
    --
  ::                                                    ::  ++EXISTS:UP
  ++  EXISTS                                            ::  TEST PRESENCE
    |=  TAG/@TAS
    !=(~ (EXPOSE TAG))
  ::                                                    ::  ++EXPOSE:UP
  ++  EXPOSE                                            ::  TYPED EXTRACT
    |=  TAG/@TAS
    ^-  (UNIT RITE)
    ?~  PIG  ~
    ?:  =(TAG -.N.PIG)
      [~ U=N.PIG]
    ?:((GOR TAG -.N.PIG) $(PIG L.PIG) $(PIG R.PIG))
  ::                                                    ::  ++INSERT:UP
  ++  INSERT                                            ::  INSERT ITEM
    |=  RYT/RITE
    ^-  SAFE
    ?~  PIG
      [RYT ~ ~]
    ?:  =(-.RYT -.N.PIG)
      [~(UNI RY RYT N.PIG) L.PIG R.PIG]
    ?:  (GOR -.RYT -.N.PIG)
      =.  L.PIG  $(PIG L.PIG)
      ?>  ?=(^ L.PIG)
      ?:  (MOR -.N.PIG -.N.L.PIG)
        [N.PIG L.PIG R.PIG]
      [N.L.PIG L.L.PIG [N.PIG R.L.PIG R.PIG]]
    =.  R.PIG  $(PIG R.PIG)
    ?>  ?=(^ R.PIG)
    ?:  (MOR -.N.PIG -.N.R.PIG)
      [N.PIG L.PIG R.PIG]
    [N.R.PIG [N.PIG L.PIG L.R.PIG] R.R.PIG]
  ::                                                    ::  ++INTERN:UP
  ++  INTERN                                            ::  INSERT LIST
    |=  LIN/(LIST RITE)
    ^-  SAFE
    ?~  LIN  PIG
    =.  PIG  $(LIN T.LIN)
    (INSERT I.LIN)
  ::                                                    ::  ++LINEAR:UP
  ++  LINEAR                                            ::  CONVERT TO LIST
    =|  LIN/(LIST RITE)
    |-  ^+  LIN
    ?~  PIG  ~
    $(PIG R.PIG, LIN [N.PIG $(PIG L.PIG)])
  ::                                                    ::  ++REDACT:UP
  ++  REDACT                                            ::  CONCEAL SECRETS
    |-  ^-  SAFE
    ?~  PIG  ~
    :_  [$(PIG L.PIG) $(PIG R.PIG)]
    =*  RYS  N.PIG
    ^-  RITE
    ?+    -.RYS  RYS
        $APPLE
      [%APPLE (~(RUN BY P.RYS) |=(@ (SHAX +<)))]
    ::
        $FINAL
      [%FINAL (~(RUN BY P.RYS) |=(@ (SHAX +<)))]
    ::
        $LOGIN
      [%LOGIN ~]
    ::
        $PWORD
      :-  %PWORD
      %-  ~(RUN BY P.RYS)
      |=  (MAP @TA @T)
      (~(RUN BY +<) |=(@T (FIL 3 (MET 3 +<) '*')))
    ::
        $JEWEL
      [%JEWEL (~(RUN BY P.RYS) |=(@ (SHAX +<)))]
    ::
        $TOKEN
      :-  %TOKEN
      %-  ~(RUN BY P.RYS)
      |=((MAP @TA @) (~(RUN BY +<) |=(@ (SHAX +<))))
    ::
        $URBAN
      [%URBAN (~(RUN BY P.RYS) |=({@DA CODE:AMES} [+<- (SHAX +<+)]))]
    ==
  ::                                                    ::  ++REMOVE:UP
  ++  REMOVE                                            ::  PIG MINUS GOB
    |=  GOB/SAFE
    ^-  SAFE
    =/  BUV  ~(TAP BY GOB)
    |-  ?~  BUV  PIG
        $(BUV T.BUV, PIG (DELETE I.BUV))
  ::                                                    ::  ++SPLICE:UP
  ++  SPLICE                                            ::  PIG PLUS GOB
    |=  GOB/SAFE
    ^-  SAFE
    =/  BUV  ~(TAP BY GOB)
    |-  ?~  BUV  PIG
        $(BUV T.BUV, PIG (INSERT I.BUV))
  ::                                                    ::  ++UPDATE:UP
  ++  UPDATE                                            ::  ARBITRARY CHANGE
    |=  DEL/BUMP
    ^-  SAFE
    (SPLICE(PIG (REMOVE LES.DEL)) MOR.DEL)
  --
::                                                      ::  ++EZ
::::                    ## ETHEREUM^LIGHT               ::  WALLET ALGEBRA
  ::                                                    ::::
++  EZ
  ::  SIMPLE ETHEREUM-RELATED UTILITY ARMS.
  ::
  |%
  ::
  ::  +ORDER-EVENTS: SORT CHANGES BY BLOCK AND LOG NUMBERS
  ::
  ++  ORDER-EVENTS
    |=  LOZ=(LIST (PAIR EVENT-ID DIFF-AZIMUTH))
    ^+  LOZ
    %+  SORT  LOZ
    ::  SORT BY BLOCK NUMBER, THEN BY EVENT LOG NUMBER,
    ::TODO  THEN BY DIFF PRIORITY.
    |=  [[[B1=@UD L1=@UD] *] [[B2=@UD L2=@UD] *]]
    ?.  =(B1 B2)  (LTH B1 B2)
    ?.  =(L1 L2)  (LTH L1 L2)
    &
  --
--
::                                                      ::::
::::                    #  HEAVY                        ::  HEAVY ENGINES
  ::                                                    ::::
=>  |%
::                                                      ::  ++OF
::::                    ## MAIN^HEAVY                   ::  MAIN ENGINE
  ::                                                    ::::
++  OF
  ::  THIS CORE HANDLES ALL TOP-LEVEL %JAEL SEMANTICS,
  ::  CHANGING STATE AND RECORDING MOVES.
  ::
  ::  LOGICALLY WE COULD NEST THE ++SU AND ++UR CORES
  ::  WITHIN IT, BUT WE KEEP THEM SEPARATED FOR CLARITY.
  ::  THE ++CURD AND ++CURE ARMS COMPLETE RELATIVE AND
  ::  ABSOLUTE EFFECTS, RESPECTIVELY, AT THE TOP LEVEL.
  ::
  ::  A GENERAL PATTERN HERE IS THAT WE USE THE ++UR CORE
  ::  TO GENERATE ABSOLUTE EFFECTS (++CHANGE), THEN INVOKE
  ::  ++SU TO CALCULATE THE DERIVED EFFECT OF THESE CHANGES.
  ::
  ::  FOR ETHEREUM-RELATED EVENTS, THIS IS PRECEDED BY
  ::  INVOCATION OF ++ET, WHICH PRODUCES ETHEREUM-LEVEL
  ::  CHANGES (++CHAIN). THESE GET TURNED INTO ABSOLUTE
  ::  EFFECTS BY ++CUTE.
  ::
  ::  ARVO ISSUES: SHOULD BE MERGED WITH THE TOP-LEVEL
  ::  VANE INTERFACE WHEN THAT GETS CLEANED UP A BIT.
  ::
  =|  MOZ/(LIST MOVE)
  =|  $:  $:  ::  OUR: IDENTITY
              ::  NOW: CURRENT TIME
              ::  ENY: UNIQUE ENTROPY
              ::
              OUR=SHIP
              NOW=@DA
              ENY=@UVJ
          ==
          ::  ALL VANE STATE
          ::
          STATE
      ==
  ::  LEX: ALL DURABLE STATE
  ::  MOZ: PENDING ACTIONS
  ::
  =*  LEX  ->
  |%
  ::                                                    ::  ++ABET:OF
  ++  ABET                                              ::  RESOLVE
    [(FLOP MOZ) LEX]
  ::                                                    ::  ++BURB:OF
  ++  BURB                                              ::  PER SHIP
    |=  WHO/SHIP
    ~(ABLE ~(EX UR URB) WHO)
  ::                                                    ::  ++SCRY:OF
  ++  SCRY                                              ::  READ
    |=  {SYD/@TAS PAX/PATH}
    ~|  %JAEL-SCRY-OF-STUB
    =^  MAR  PAX  =/(A (FLOP PAX) [-.A (FLOP T.+.A)])
    !!
  ::                                                    ::  ++SEIN:OF
  ++  SEIN                                              ::  SPONSOR
    |=  WHO=SHIP
    ^-  SHIP
    ::  XX SAVE %DAWN SPONSOR IN .OWN.SUB, CHECK THERE
    ::
    =/  POT  (~(GET BY POS.ETH.SUB) WHO)
    ?:  ?&  ?=(^ POT)
            ?=(^ NET.U.POT)
        ==
      WHO.SPONSOR.U.NET.U.POT
    (^SEIN:TITLE WHO)
  ::                                                    ::  ++SAXO:OF
  ++  SAXO                                              ::  SPONSORSHIP CHAIN
    |=  WHO/SHIP
    ^-  (LIST SHIP)
    =/  DAD  (SEIN WHO)
    [WHO ?:(=(WHO DAD) ~ $(WHO DAD))]
  ::                                                    ::  ++CALL:OF
  ++  CALL                                              ::  INVOKE
    |=  $:  ::  HEN: EVENT CAUSE
            ::  TAC: EVENT DATA
            ::
            HEN/DUCT
            TAC/TASK
        ==
    ^+  +>
    ?-    -.TAC
    ::
    ::  DESTROY PROMISES
    ::    {$BURN P/SHIP Q/SAFE}
    ::
        $BURN
      %+  CURE  HEN
      ABET:ABET:(DEAL:(BURB OUR) P.TAC [~ Q.TAC])
    ::
    ::  BOOT FROM KEYS
    ::    $:  $DAWN
    ::        =SEED
    ::        SPON=SHIP
    ::        CZAR=(MAP SHIP [=LIFE =PASS])
    ::        TURF=(LIST TURF)}
    ::        BLOQ=@UD
    ::        NODE=PURL
    ::    ==
    ::
        %DAWN
      ::  SINGLE-HOMED
      ::
      ?>  =(OUR WHO.SEED.TAC)
      ::  SAVE OUR BOOT BLOCK
      ::
      =.  BOQ.OWN.SUB  BLOQ.TAC
      ::  SAVE OUR ETHEREUM GATEWAY (REQUIRED FOR GALAXIES)
      ::
      =.  NOD.OWN.SUB  NODE.TAC
      ::  SAVE OUR PARENT SIGNATURE (ONLY FOR MOONS)
      ::
      =.  SIG.OWN.SUB  SIG.SEED.TAC
      ::  IF WE'RE GIVEN A SNAPSHOT, RESTORE IT
      ::
      =.  +>.$
        ?~  SNAP.TAC  +>.$
        (RESTORE-SNAP HEN U.SNAP.TAC |)
      ::  LOAD OUR INITIAL PUBLIC KEY, OVERRIDING SNAPSHOT
      ::
      =.  KYZ.PUK.SUB
        =/  CUB  (NOL:NU:CRUB:CRYPTO KEY.SEED.TAC)
        %+  ~(PUT BY KYZ.PUK.SUB)
          OUR
        [LYF.SEED.TAC (MY [LYF.SEED.TAC PUB:EX:CUB] ~)]
      ::  OUR INITIAL PRIVATE KEY, AS A +TREE OF +RITE
      ::
      =/  RIT  (SY [%JEWEL (MY [LYF.SEED.TAC KEY.SEED.TAC] ~)] ~)
      =.  +>.$  $(TAC [%MINT OUR RIT])
      ::  OUR INITIAL GALAXY TABLE AS A +MAP FROM +LIFE TO +PUBLIC
      ::
      =/  KYZ
        %-  ~(RUN BY CZAR.TAC)
        |=([=LIFE =PASS] `PUBLIC`[LIFE (MY [LIFE PASS] ~)])
      =.  +>.$
        %-  CURD  =<  ABET
        (PUBS:~(FEEL SU HEN OUR URB SUB ETN SAP) KYZ)
      ::  XX SAVE SPONSOR IN .OWN.SUB
      ::  XX RECONCILE WITH .DNS.ETH
      ::  SET INITIAL DOMAINS
      ::
      =.  TUF.OWN.SUB  TURF.TAC
      ::
      =.  MOZ
        %+  WELD  MOZ
        ::  ORDER IS CRUCIAL!
        ::
        ::    %DILL MUST INIT AFTER %GALL
        ::    THE %GIVE INIT (FOR UNIX) MUST BE AFTER %DILL INIT
        ::    %JAEL INIT MUST BE DEFERRED (MAKES HTTP REQUESTS)
        ::
        ^-  (LIST MOVE)
        :~  [HEN %PASS /(SCOT %P OUR)/INIT %B %WAIT +(NOW)]
            [HEN %GIVE %INIT OUR]
            [HEN %SLIP %E %INIT OUR]
            [HEN %SLIP %D %INIT OUR]
            [HEN %SLIP %G %INIT OUR]
            [HEN %SLIP %C %INIT OUR]
            [HEN %SLIP %A %INIT OUR]
        ==
      +>.$
    ::
    ::  BOOT FAKE
    ::    [%FAKE =SHIP]
    ::
        %FAKE
      ::  SINGLE-HOMED
      ::
      ?>  =(OUR SHIP.TAC)
      ::  FAKE KEYS ARE DETERMINISTICALLY DERIVED FROM THE SHIP
      ::
      =/  CUB  (PIT:NU:CRUB:CRYPTO 512 OUR)
      ::  SAVE OUR PARENT SIGNATURE (ONLY FOR MOONS)
      ::
      ::    XX MOVE LOGIC TO ZUSE
      ::
      =.  SIG.OWN.SUB
        ?.  ?=(%EARL (CLAN:TITLE OUR))
          ~
        =/  YIG  (PIT:NU:CRUB:CRYPTO 512 (^SEIN:TITLE OUR))
        [~ (SIGN:AS:YIG (SHAF %EARL (SHAM OUR 1 PUB:EX:CUB)))]
      ::  OUR INITIAL PUBLIC KEY
      ::
      =.  KYZ.PUK.SUB
        (~(PUT BY KYZ.PUK.SUB) OUR [1 (MY [1 PUB:EX:CUB] ~)])
      ::  OUR PRIVATE KEY, AS A +TREE OF +RITE
      ::
      ::    PRIVATE KEY UPDATES ARE DISALLOWED FOR FAKE SHIPS,
      ::    SO WE DO THIS FIRST.
      ::
      =/  RIT  (SY [%JEWEL (MY [1 SEC:EX:CUB] ~)] ~)
      =.  +>.$  $(TAC [%MINT OUR RIT])
      ::  SET THE FAKE BIT
      ::
      =.  FAK.OWN.SUB  &
      ::  INITIALIZE OTHER VANES PER THE USUAL PROCEDURE
      ::
      ::    EXCEPT FOR OURSELVES!
      ::
      =.  MOZ
        %+  WELD  MOZ
        ^-  (LIST MOVE)
        :~  [HEN %GIVE %INIT OUR]
            [HEN %SLIP %E %INIT OUR]
            [HEN %SLIP %D %INIT OUR]
            [HEN %SLIP %G %INIT OUR]
            [HEN %SLIP %C %INIT OUR]
            [HEN %SLIP %A %INIT OUR]
        ==
      +>.$
    ::
    ::  REMOTE UPDATE
    ::    {$HAIL P/SHIP Q/REMOTE}
    ::
        $HAIL
      %+  CURE  HEN
      ABET:ABET:(HAIL:(BURB OUR) P.TAC Q.TAC)
    ::
    ::  SET ETHEREUM SOURCE
    ::    [%LOOK P=(EACH SHIP PURL)]
    ::
        %LOOK
      %+  CUTE  HEN  =<  ABET
      (~(LOOK ET HEN OUR NOW URB.LEX SUB.LEX ETN.LEX SAP.LEX) SRC.TAC)
    ::
    ::  CREATE PROMISES
    ::    {$MINT P/SHIP Q/SAFE}
    ::
        $MINT
      ~|  %FAKE-JAEL
      ?<  ?&  FAK.OWN.SUB
              (~(EXISTS UP Q.TAC) %JEWEL)
          ==
      %+  CURE  HEN
      ABET:ABET:(DEAL:(BURB OUR) P.TAC [Q.TAC ~])
    ::
    ::
    ::  MOVE PROMISES
    ::    {$MOVE P/SHIP Q/SHIP R/SAFE}
    ::
        $MOVE
      =.  +>
        %+  CURE  HEN
        ABET:ABET:(DEAL:(BURB OUR) P.TAC [~ R.TAC])
      =.  +>
        %+  CURE  HEN
        ABET:ABET:(DEAL:(BURB OUR) Q.TAC [R.TAC ~])
      +>
    ::
    ::  CANCEL ALL TRACKERS FROM DUCT
    ::    {$NUKE $~}
    ::
        $NUKE
      %_  +>
        YEN          (~(DEL IN YEN) HEN)
        YEN.BAL.SUB  (~(DEL IN YEN.BAL.SUB) HEN)
        YEN.OWN.SUB  (~(DEL IN YEN.OWN.SUB) HEN)
        YEN.ETH.SUB  (~(DEL IN YEN.ETH.SUB) HEN)
      ==
    ::
    ::  WATCH PUBLIC KEYS
    ::    [%PUBS =SHIP]
    ::
        %PUBS
      %-  CURD  =<  ABET
      (~(PUBS ~(FEED SU HEN OUR URB SUB ETN SAP) HEN) SHIP.TAC)
    ::
    ::  SEEN AFTER BREACH
    ::    [%MEET OUR=SHIP WHO=SHIP]
    ::
        %MEET
      %+  CURE  HEN
      [[%MEET SHIP.TAC LIFE.TAC PASS.TAC]~ URB]
    ::
    ::  RESTORE SNAPSHOT
    ::    [%SNAP SNAP=SNAPSHOT KICK=?]
        %SNAP
      (RESTORE-SNAP HEN SNAP.TAC KICK.TAC)
    ::
    ::  XX SHOULD BE A SUBSCRIPTION
    ::  XX RECONCILE WITH .DNS.ETH
    ::  REQUEST DOMAINS
    ::    [%TURF ~]
    ::
        %TURF
      ::  SHIPS WITH REAL KEYS MUST HAVE DOMAINS,
      ::  THOSE WITH FAKE KEYS MUST NOT
      ::
      ?<  =(FAK.OWN.SUB ?=(^ TUF.OWN.SUB))
      +>.$(MOZ [[HEN %GIVE %TURF TUF.OWN.SUB] MOZ])
    ::
    ::  LEARN OF KERNEL UPGRADE
    ::    [%VEGA ~]
    ::
        %VEGA
      +>.$
    ::
    ::  WATCH PRIVATE KEYS
    ::    {$VEIN $~}
    ::
        $VEIN
      (CURD ABET:~(VEIN ~(FEED SU HEN OUR URB SUB ETN SAP) HEN))
    ::
    ::  WATCH ETHEREUM EVENTS
    ::    [%VENT ~]
    ::
        %VENT
      =.  MOZ  [[HEN %GIVE %MACK ~] MOZ]
      (CURD ABET:~(VENT ~(FEED SU HEN OUR URB SUB ETN SAP) HEN))
    ::
    ::  MONITOR ASSETS
    ::    {$VEST $~}
    ::
        $VEST
      (CURD ABET:~(VEST ~(FEED SU HEN OUR URB SUB ETN SAP) HEN))
    ::
    ::  MONITOR ALL
    ::    {$VINE $~}
    ::
        $VINE
      +>(YEN (~(PUT IN YEN) HEN))
    ::
        %WEGH
      %_    +>
          MOZ
        :_  MOZ
        ^-  MOVE
        :^  HEN  %GIVE  %MASS
        ^-  MASS
        :+  %JAEL  %|
        :~  YEN+&+YEN
            URB+&+URB
            SUB+&+SUB
            ETN+&+ETN
            SAP+&+SAP
            DOT+&+LEX
        ==
      ==
    ::
    ::  AUTHENTICATED REMOTE REQUEST
    ::    {$WEST P/SHIP Q/PATH R/*}
    ::
        $WEST
      =*  HER  P.TAC
      =/  MES  (MESSAGE R.TAC)
      ?-    -.MES
      ::
      ::  RESET REMOTE RIGHTS
      ::    [%HAIL P=REMOTE]
      ::
          %HAIL
        %+  CURE  HEN
        ABET:ABET:(HAIL:(BURB OUR) HER P.MES)
      ::
      ::  CANCEL TRACKERS
      ::    [%NUKE ~]
      ::
          %NUKE
        $(TAC MES)
      ::
      ::  VIEW ETHEREUM EVENTS
      ::    [%VENT ~]
      ::
          %VENT
        $(TAC [%VENT ~])
      ::
      ::
          %VENT-RESULT
        ::  IGNORE IF NOT FROM CURRENTLY CONFIGURED SOURCE.
        ?.  &(-.SOURCE.ETN =(HER P.SOURCE.ETN))
          +>.$
        =.  MOZ  [[HEN %GIVE %MACK ~] MOZ]
        %+  CUTE  HEN  =<  ABET
        (~(HEAR-VENT ET HEN OUR NOW URB.LEX SUB.LEX ETN.LEX SAP.LEX) P.MES)
      ==
    ::
    ::  REWIND TO SNAPSHOT
    ::    {$WIND P/@UD}
    ::
        %WIND
      (WIND HEN P.TAC)
    ==
  ::
  ++  TAKE
    |=  [TEA=WIRE HEN=DUCT HIN=SIGN]
    ^+  +>
    ?>  ?=([@ *] TEA)
    =*  WIR  T.TEA
    ?-  HIN
        [%A %WOOT *]
      ?~  Q.HIN  +>.$
      ?~  U.Q.HIN  ~&(%ARES-FINE +>.$)
      ~&  [%WOOT-BAD P.U.U.Q.HIN]
      ~_  Q.U.U.Q.HIN
      ::TODO  FAIL:ET
      +>.$
    ::
        [%E %SIGH *]
      %+  CUTE  HEN  =<  ABET
      (~(SIGH ET HEN OUR NOW URB.LEX SUB.LEX ETN.LEX SAP.LEX) WIR P.HIN)
    ::
        [%B %WAKE ~]
      %+  CUTE  HEN
      ::  XX CLEANUP
      ::
      ?.  ?=([%INIT ~] WIR)
        ABET:~(WAKE ET HEN OUR NOW URB.LEX SUB.LEX ETN.LEX SAP.LEX)
      ABET:(~(INIT ET HEN OUR NOW [URB SUB ETN SAP]:LEX) OUR (SEIN OUR))
    ::
        [%J %VENT *]
      %+  CUTE  HEN  =<  ABET
      (~(HEAR-VENT ET HEN OUR NOW URB.LEX SUB.LEX ETN.LEX SAP.LEX) P.HIN)
    ==
  ::                                                    ::  ++CURD:OF
  ++  CURD                                              ::  RELATIVE MOVES
    |=  $:  MOZ/(LIST MOVE)
            SUB/STATE-RELATIVE
            ETN/STATE-ETH-NODE
            SAP/STATE-SNAPSHOTS
        ==
    +>(SUB SUB, ETN ETN, SAP SAP, MOZ (WELD (FLOP MOZ) ^MOZ))
  ::                                                    ::  ++CURE:OF
  ++  CURE                                              ::  ABSOLUTE EDITS
    |=  [HEN=DUCT HAB=(LIST CHANGE) URB=STATE-ABSOLUTE]
    ^+  +>
    =.  ^URB  URB
    (CURD ABET:(~(APEX SU HEN OUR URB SUB ETN SAP) HAB))
  ::                                                    ::  ++CUTE:OF
  ++  CUTE                                              ::  ETHEREUM CHANGES
    |=  $:  HEN=DUCT
            MOS=(LIST MOVE)
            VEN=CHAIN
            URB=STATE-ABSOLUTE
            SUB=STATE-RELATIVE
            ETN=STATE-ETH-NODE
            SAP=STATE-SNAPSHOTS
        ==
    ^+  +>
    =:  ^URB  URB
        ^SUB  SUB
        ^ETN  ETN
        ^SAP  SAP
    ==
    %-  CURE(MOZ (WELD (FLOP MOS) MOZ))
    [HEN ABET:(LINK:(BURB OUR) VEN)]
  ::                                                    ::  ++WIND:OF
  ++  WIND                                              ::  REWIND TO SNAP
    |=  [HEN=DUCT BLOCK=@UD]
    ^+  +>
    =.  +>.$  (RESTORE-BLOCK HEN BLOCK)
    %=    +>.$
        MOZ
      =-  [[HEN %PASS /WIND/LOOK %J %LOOK -] MOZ]
      ?-  -.SOURCE.ETN
        %&  &+P.SOURCE.ETN
        %|  |+NODE.P.SOURCE.ETN
      ==
    ==
  ::                                                    ::  ++RESTORE-BLOCK:OF
  ++  RESTORE-BLOCK                                     ::  REWIND BEFORE BLOCK
    |=  [HEN=DUCT BLOCK=@UD]
    %+  CUTE  HEN  =<  ABET
    (~(RESTORE-BLOCK ET HEN OUR NOW URB.LEX SUB.LEX ETN.LEX SAP.LEX) BLOCK)
  ::                                                    ::  ++RESTORE-SNAP:OF
  ++  RESTORE-SNAP                                      ::  RESTORE SNAPSHOT
    |=  [HEN=DUCT SNAP=SNAPSHOT LOOK=?]
    %+  CUTE  HEN  =<  ABET
    %-  ~(RESTORE-SNAP ET HEN OUR NOW URB.LEX SUB.LEX ETN.LEX SAP.LEX)
    [SNAP LOOK]
  --
::                                                      ::  ++SU
::::                    ## RELATIVE^HEAVY               ::  SUBJECTIVE ENGINE
  ::                                                    ::::
++  SU
      ::  THE ++SU CORE HANDLES ALL DERIVED STATE,
      ::  SUBSCRIPTIONS, AND ACTIONS.
      ::
      ::  ++FEED:SU REGISTERS SUBSCRIPTIONS.
      ::
      ::  ++FEEL:SU CHECKS IF A ++CHANGE SHOULD NOTIFY
      ::  ANY SUBSCRIBERS.
      ::
      ::  ++FIRE:SU GENERATES OUTGOING NETWORK MESSAGES.
      ::
      ::  ++FORM:SU GENERATES THE ACTUAL REPORT DATA.
      ::
  =|  MOZ/(LIST MOVE)
  =|  EVS=LOGS
  =|  $:  HEN/DUCT
          OUR/SHIP
          STATE-ABSOLUTE
          STATE-RELATIVE
          STATE-ETH-NODE
          STATE-SNAPSHOTS
      ==
  ::  MOZ: MOVES IN REVERSE ORDER
  ::  URB: ABSOLUTE URBIT STATE
  ::  SUB: RELATIVE URBIT STATE
  ::
  =*  URB  ->+<
  =*  SUB  ->+>-
  =*  ETN  ->+>+<
  =*  SAP  ->+>+>
  |%
  ::                                                    ::  ++ABET:SU
  ++  ABET                                              ::  RESOLVE
    ::TODO  WE REALLY WANT TO JUST SEND THE %GIVE, BUT AMES IS BEING A PAIN.
    :: =>  (EXEC YEN.ETH [%GIVE %VENT |+EVS])
    =>  ?~  EVS  .
        (VENT-PASS YEN.ETH CHAIN+|+EVS)
    [(FLOP MOZ) SUB ETN SAP]
  ::                                                    ::  ++APEX:SU
  ++  APEX                                              ::  APPLY CHANGES
    |=  HAB/(LIST CHANGE)
    ^+  +>
    ?~  HAB  +>
    %=    $
        HAB  T.HAB
        +>
      ?-  -.I.HAB
        %ETHE  (FILE CAN.I.HAB)
        %MEET  (MEET +.I.HAB)
        %RITE  (PAID +.I.HAB)
      ==
    ==
  ::                                                    ::  ++EXEC:SU
  ++  EXEC                                              ::  MASS GIFT
    |=  {YEN/(SET DUCT) CAD/CARD}
    =/  NOY  ~(TAP IN YEN)
    |-  ^+  ..EXEC
    ?~  NOY  ..EXEC
    $(NOY T.NOY, MOZ [[I.NOY CAD] MOZ])
  ::
  ++  VENT-PASS
    |=  [YEN=(SET DUCT) RES=VENT-RESULT]
    =+  YEZ=~(TAP IN YEN)
    |-  ^+  ..VENT-PASS
    ?~  YEZ  ..VENT-PASS
    =*  D  I.YEZ
    ?>  ?=([[%A @ @ *] *] D)
    =+  OUR=(SLAV %P I.T.I.D)
    =+  WHO=(SLAV %P I.T.T.I.D)
    %+  EXEC  [D ~ ~]
    :+  %PASS
      /(SCOT %P OUR)/VENT-RESULT
    ^-  NOTE:ABLE
    [%A %WANT WHO /J/(SCOT %P OUR)/VENT-RESULT %VENT-RESULT RES]
  ::
  ++  EXTRACT-SNAP                                    ::  EXTRACT REWIND POINT
    ^-  SNAPSHOT
    :*  KYZ.PUK.SUB
        [DNS POS]:ETH.SUB
        HEARD.ETN
        LATEST-BLOCK.ETN
    ==
  ::                                                    ::  ++FEED:SU
  ++  FEED                                              ::  SUBSCRIBE TO VIEW
    |_  ::  HEN: SUBSCRIPTION SOURCE
        ::
        HEN/DUCT
    ::
    ++  PUBS
      |=  WHO=SHIP
      ?:  FAK.OWN.SUB
        (PUBS:FAKE WHO)
      %_  ..FEED
        MOZ      =/  PUB  (~(GET BY KYZ.PUK) WHO)
                 ?~  PUB  MOZ
                 ?:  =(0 LIFE.U.PUB)  MOZ
                 [[HEN %GIVE %PUBS U.PUB] MOZ]
        YEN.PUK  (~(PUT JU YEN.PUK) WHO HEN)
      ==
    ::                                                  ::  ++VEIN:FEED:SU
    ++  VEIN                                            ::  PRIVATE KEYS
      %_  ..FEED
        MOZ      [[HEN %GIVE %VEIN [LYF JAW]:OWN] MOZ]
        YEN.OWN  (~(PUT IN YEN.OWN) HEN)
      ==
    ::                                                  ::  ++VEST:FEED:SU
    ++  VEST                                            ::  BALANCE
      %_  ..FEED
        MOZ      [[HEN %GIVE %VEST %& VEST:FORM] MOZ]
        YEN.BAL  (~(PUT IN YEN.BAL) HEN)
      ==
    ::
    ++  VENT
      =/  LAST-SNAP  EXTRACT-SNAP
      %.  [[HEN ~ ~] SNAP+LAST-SNAP]
      %_  VENT-PASS
      :: %_  ..FEED  ::TODO  SEE ++ABET
        :: MOZ      [[HEN %GIVE %VENT] MOZ]
        YEN.ETH  (~(PUT IN YEN.ETH) HEN)
      ==
    ::                                                  ::  ++FAKE:FEED:SU
    ++  FAKE                                            ::  FAKE SUBS AND STATE
      ?>  FAK.OWN.SUB
      |%
      ++  PUBS
        |=  WHO=SHIP
        =/  CUB  (PIT:NU:CRUB:CRYPTO 512 WHO)
        =/  PUB  [LIFE=1 (MY [1 PUB:EX:CUB] ~)]
        =.  MOZ  [[HEN %GIVE %PUBS PUB] MOZ]
        (PUBS:FEEL (MY [WHO PUB] ~))
      --
    --
  ::                                                    ::  ++FEEL:SU
  ++  FEEL                                              ::  UPDATE TRACKER
    |%
    ::                                                  ::  ++PUBS:FEEL:SU
    ++  PUBS                                            ::  KICK PUBLIC KEYS
      ::  PUZ: NEW PUBLIC KEY STATES
      ::
      |=  PUZ=(MAP SHIP PUBLIC)
      =/  PUS  ~(TAP BY PUZ)
      ::
      ::  PROCESS CHANGE FOR EACH SHIP SEPARATELY
      ::  XX CHECK FOR DIFFS BEFORE SENDING?
      ::
      |-  ^+  ..FEEL
      ?~  PUS  ..FEEL
      =;  FEL  $(PUS T.PUS, ..FEEL FEL)
      =*  WHO  P.I.PUS
      =*  PUB  Q.I.PUS
      ::
      ::  UPDATE PUBLIC KEY STORE AND NOTIFY SUBSCRIBERS
      ::  OF THE NEW STATE
      ::
      :: ~&  [%SENDING-PUBS-ABOUT WHO LIFE.PUB]
      %+  EXEC(KYZ.PUK (~(PUT BY KYZ.PUK) WHO PUB))
        (~(GET JU YEN.PUK) WHO)
      [%GIVE %PUBS PUB]
    ::                                                  ::  ++VEIN:FEEL:SU
    ++  VEIN                                            ::  KICK PRIVATE KEYS
      ^+  ..FEEL
      =/  YAM  VEIN:FORM
      ?:  &(=(LYF.OWN P.YAM) =(JAW.OWN Q.YAM))
        ..FEEL
      =.  LYF.OWN  P.YAM
      =.  JAW.OWN  Q.YAM
      (EXEC YEN.OWN [%GIVE %VEIN LYF.OWN JAW.OWN])
    ::                                                  ::  ++VEST:FEEL:SU
    ++  VEST                                            ::  KICK BALANCE
      |=  HUG/ACTION
      ^+  ..FEEL
      ?:  =([~ ~] +.Q.HUG)  ..FEEL
      ::
      ::  NOTIFY ALL LOCAL LISTENERS
      ::
      =.  ..FEEL  (EXEC YEN.BAL [%GIVE %VEST %| P.HUG Q.HUG])
      ::
      ::  PIG: PURSE REPORT FOR PARTNER
      ::
      ?.  ?=(%| -.Q.HUG)  ..FEEL
      =*  PIG  (~(LAWN UR URB) OUR P.HUG)
      %_    ..FEEL
          MOZ
        :_  MOZ
        :^  *DUCT  %PASS  /VEST/(SCOT %P P.HUG)
        :+  %A  %WANT
        :+  P.HUG  /J
        ^-  MESSAGE
        [%HAIL |+PIG]
      ==
    ::
    ++  VENT
      |=  VER=VENT-RESULT
      ^+  ..FEEL
      ::TODO  SEE ++ABET
      :: (EXEC YEN.ETH [%GIVE %VENT CAN])
      (VENT-PASS YEN.ETH VER)
    --
  ::                                                    ::  ++FORM:SU
  ++  FORM                                              ::  GENERATE REPORTS
    |%
    ::                                                  ::  ++VEIN:FORM:SU
    ++  VEIN                                            ::  PRIVATE KEY REPORT
      ^-  (PAIR LIFE (MAP LIFE RING))
      (~(LEAN UR URB) OUR)
    ::                                                  ::  ++VEST:FORM:SU
    ++  VEST                                            ::  BALANCE REPORT
      ^-  BALANCE
      :-  ::
          ::  RAW: ALL OUR LIABILITIES BY SHIP
          ::  DUD: DELETE LIABILITIES TO SELF
          ::  CUL: MASK SECRETS
          ::
          =*  RAW  =-(?~(- ~ U.-) (~(GET BY PRY.URB) OUR))
          =*  DUD  (~(DEL BY RAW) OUR)
          =*  CUL  (~(RUN BY DUD) |=(SAFE ~(REDACT UP +<)))
          CUL
      ::
      ::  FUB: ALL ASSETS BY SHIP
      ::  VEG: ALL NONTRIVIAL ASSETS, SECRETS MASKED
      ::
      =/  FUB
        ^-  (LIST (PAIR SHIP (UNIT SAFE)))
        %+  TURN
          ~(TAP BY PRY.URB)
        |=  (PAIR SHIP (MAP SHIP SAFE))
        [P (~(GET BY Q) OUR)]
      =*  VEG
        |-  ^-  (LIST (PAIR SHIP SAFE))
        ?~  FUB  ~
        =+  $(FUB T.FUB)
        ?~(Q.I.FUB - [[P.I.FUB ~(REDACT UP U.Q.I.FUB)] -])
      ::
      (~(GAS BY *(MAP SHIP SAFE)) VEG)
    --
  ::                                                    ::  ++PAID:SU
  ++  PAID                                              ::  TRACK ASSET CHANGE
    |=  $:  ::  REX: PROMISE FROM
            ::  PAL: PROMISE TO
            ::  DEL: CHANGE TO EXISTING
            ::
            REX/SHIP
            PAL/SHIP
            DEL/BUMP
        ==
    ^+  +>
    ::  IGNORE EMPTY DELTA; KEEP SECRETS OUT OF METADATA
    ::
    ?:  =([~ ~] DEL)  +>
    =.  DEL  [~(REDACT UP MOR.DEL) ~(REDACT UP LES.DEL)]
    ?.  =(OUR PAL)
      ::
      ::  TRACK PROMISES WE MADE TO OTHERS
      ::
      ?.  =(OUR REX)  +>
      ::
      ::  TRACK LIABILITIES
      ::
      (VEST:FEEL PAL %& DEL)
    ::
    ::  TRACK PRIVATE KEYS
    ::
    ?.  (~(EXISTS UP MOR.DEL) %JEWEL)  +>
    VEIN:FEEL
  ::                                                    ::  ++MEET:SU
  ++  MEET                                              ::  SEEN AFTER BREACH
    |=  [WHO=SHIP =LIFE =PASS]
    ^+  +>
    =;  NEW=PUBLIC
      (PUBS:FEEL (MY [WHO NEW] ~))
    ::
    =/  OLD=(UNIT PUBLIC)
      (~(GET BY KYZ.PUK) WHO)
    ?:  ?|  ?=(?(%EARL %PAWN) (CLAN:TITLE WHO))
            ::  XX SAVE %DAWN SPONSOR IN .OWN.SUB, CHECK THERE
            ::  XX OR MOVE SEIN:OF TO SEIN:SU?
            ::  XX FULL SAXO CHAIN?
            ::
            =(WHO (^SEIN:TITLE OUR))
        ==
      ?~  OLD
        [LIFE (MY [LIFE PASS] ~)]
      =/  FYL  LIFE.U.OLD
      =/  SAP  (~(GOT BY PUBS.U.OLD) FYL)
      ~|  [%MET-MISMATCH WHO LIFE=[OLD=FYL NEW=LIFE] PASS=[OLD=SAP NEW=PASS]]
      ?>  ?:  =(FYL LIFE)
            =(SAP PASS)
          =(+(FYL) LIFE)
      [LIFE (~(PUT BY PUBS.U.OLD) LIFE PASS)]
    ?.  ?=(^ OLD)
      ~|  [%MET-UNKNOWN-SHIP WHO]  !!
    =/  FYL  LIFE.U.OLD
    =/  SAP  (~(GOT BY PUBS.U.OLD) FYL)
    ~|  [%MET-MISMATCH WHO LIFE=[OLD=FYL NEW=LIFE] PASS=[OLD=SAP NEW=PASS]]
    ?>  &(=(FYL LIFE) =(SAP PASS))
    [LIFE PUBS.U.OLD]
  ::                                                    ::  ++FILE:SU
  ++  FILE                                              ::  PROCESS EVENT LOGS
    ::TODO  WHENEVER WE ADD SUBSCRIPTIONS FOR DATA,
    ::      OUTSOURCE THE UPDATING OF RELEVANT STATE
    ::      TO A ++FEEL ARM.
    |=  [NEW=? EVS=LOGS]
    ^+  +>
    =?  +>  NEW
      ::TODO  SHOULD WE BE MUTATING STATE HERE,
      ::      OR BETTER TO MOVE THIS INTO ++VENT:FEEL?
      +>(DNS.ETH *DNSES, POS.ETH ~, KYZ.PUK ~)
    =?  +>  |(NEW !=(0 ~(WYT BY EVS)))
      %-  VENT:FEEL
      :-  %CHAIN
      ?:(NEW &+EVS |+EVS)
    ::
    =+  VEZ=(ORDER-EVENTS:EZ ~(TAP BY EVS))
    =|  KYZ=(MAP SHIP PUBLIC)
    |^  ?~  VEZ  (PUBS:FEEL KYZ)
        =^  KYN  ..FILE  (FILE-EVENT I.VEZ)
        $(VEZ T.VEZ, KYZ KYN)
    ::
    ++  GET-PUBLIC
      |=  WHO=SHIP
      ^-  PUBLIC
      %+  FALL  (~(GET BY KYZ) WHO)
      ::NOTE  WE CAN ONLY DO THIS BECAUSE ++PUBS:FEEL
      ::      SENDS OUT ENTIRE NEW STATE, RATHER THAN
      ::      JUST THE PROCESSED CHANGES.
      %+  FALL  (~(GET BY KYZ.PUK) WHO)
      *PUBLIC
    ::
    ++  FILE-KEYS
      |=  [WHO=SHIP =LIFE =PASS]
      ^+  KYZ
      =/  PUB  (GET-PUBLIC WHO)
      =/  PUK  (~(GET BY PUBS.PUB) LIFE)
      ?^  PUK
        ::  KEY KNOWN, NOTHING CHANGES
        ~|  [%KEY-MISMATCH WHO LIFE `@UX`U.PUK `@UX`PASS (GET-PUBLIC ~ZOD)]
        ?>(=(U.PUK PASS) KYZ)
      %+  ~(PUT BY KYZ)  WHO
      :-  (MAX LIFE LIFE.PUB)
      (~(PUT BY PUBS.PUB) LIFE PASS)
    ::
    ++  FILE-DISCONTINUITY
      |=  WHO=SHIP
      ^+  KYZ
      =+  (GET-PUBLIC WHO)
      (~(PUT BY KYZ) WHO -)
    ::
    ++  FILE-EVENT
      |=  [WER=EVENT-ID DIF=DIFF-AZIMUTH]
      ^+  [KYZ ..FILE]
      ?:  (~(HAS IN HEARD) WER)
        ~&  %IGNORING-ALREADY-HEARD-EVENT
        [KYZ ..FILE]
      ::
      ::  SANITY CHECK, SHOULD NEVER FAIL IF WE OPERATE CORRECTLY
      ::
      ?>  (GTE BLOCK.WER LATEST-BLOCK)
      =:  EVS           (~(PUT BY EVS) WER DIF)
          HEARD         (~(PUT IN HEARD) WER)
          LATEST-BLOCK  (MAX LATEST-BLOCK BLOCK.WER)
      ==
      =^  KYZ  ..FILE
        ?-  -.DIF
          %POINT  ~|(WER=WER (FILE-POINT +.DIF))
          %DNS    [KYZ (FILE-DNS +.DIF)]
        ==
      [KYZ (FILE-SNAP WER)]
    ::
    ++  FILE-POINT
      |=  [WHO=SHIP DIF=DIFF-POINT]
      ^+  [KYZ ..FILE]
      =-  ::TODO  =; WITH JUST THE TYPE
        =.  POS.ETH  (~(PUT BY POS.ETH) WHO PON)
        ::  NEW KEYS
        ::
        ?:  ?=(%& -.NEW)
          [(FILE-KEYS WHO P.NEW) ..FILE]
        ::  KEPT CONTINUITY (NO-OP)
        ::
        ?:  P.NEW
          [KYZ ..FILE]
        ::  DISCONTINUITY
        ::
        :-  (FILE-DISCONTINUITY WHO)
        %=  ..FILE
          ::  THESE MUST BE APPENDED HERE; +ABET FLOPS THEM
          ::
          MOZ  =/  LYF=LIFE
                 ~|  SUNK-UNKNOWN+WHO
                 LIFE:(~(GOT BY KYZ.PUK))
               %+  WELD  MOZ
               ^-  (LIST MOVE)
               :~  [HEN %SLIP %A %SUNK WHO LYF]
                   [HEN %SLIP %C %SUNK WHO LYF]
                   [HEN %SLIP %D %SUNK WHO LYF]
                   [HEN %SLIP %E %SUNK WHO LYF]
                   [HEN %SLIP %F %SUNK WHO LYF]
                   [HEN %SLIP %G %SUNK WHO LYF]
               ==
        ==
      ::  PON: UPDATED POINT
      ::  NEW: NEW KEYPAIR OR "KEPT CONTINUITY?" (YES IS NO-OP)
      ^-  [PON=POINT NEW=(EACH (PAIR LIFE PASS) ?)]
      =+  POT=(FALL (~(GET BY POS.ETH) WHO) *POINT)
      ::
      ::  SANITY CHECKS, SHOULD NEVER FAIL IF WE OPERATE CORRECTLY
      ::
      ~|  [%DIFF-ORDER-INSANITY -.DIF WHO (~(GET BY POS.ETH) WHO)]
      ?>  ?+  -.DIF  &
            %SPAWNED      ?>  ?=(^ KID.POT)
                          !(~(HAS IN SPAWNED.U.KID.POT) WHO.DIF)
            %KEYS         ?>  ?=(^ NET.POT)
                          =(LIFE.DIF +(LIFE.U.NET.POT))
            %CONTINUITY   ?>  ?=(^ NET.POT)
                          =(NEW.DIF +(CONTINUITY-NUMBER.U.NET.POT))
          ==
      ::
      ::  APPLY POINT CHANGES, CATCH CONTINUITY AND KEY CHANGES
      ::
      :-  (APPLY-POINT-DIFF POT DIF)
      =*  NOP  |+&  ::  NO-OP
      ?+  -.DIF  NOP
        %CONTINUITY   |+|
        %KEYS         &+[LIFE PASS]:DIF
        %FULL         ?~  NET.NEW.DIF  NOP
                      ::TODO  DO WE WANT/NEED TO DO A DIFF-CHECK
                      &+[LIFE PASS]:U.NET.NEW.DIF
      ==
    ::
    ++  FILE-DNS
      |=  DNS=DNSES
      ..FILE(DNS.ETH DNS)
    ::
    ++  FILE-SNAP                                       ::  SAVE SNAPSHOT
      |=  WER=EVENT-ID
      ^+  ..FILE
      =?    SAP
          %+  LTH  2
          %+  SUB.ADD
            (DIV BLOCK.WER INTERVAL.SAP)
          (DIV LAST-BLOCK.SAP INTERVAL.SAP)
        :: ~&  :*  %SNAP
        ::         COUNT=COUNT.SAP
        ::         MAX-COUNT=MAX-COUNT.SAP
        ::         LAST-BLOCK=LAST-BLOCK.SAP
        ::         INTERVAL=INTERVAL.SAP
        ::         LENT=(LENT ~(TAP TO SNAPS.SAP))
        ::     ==
        %=  SAP
          SNAPS       (~(PUT TO SNAPS.SAP) BLOCK.WER EXTRACT-SNAP)
          COUNT       +(COUNT.SAP)
          LAST-BLOCK  BLOCK.WER
        ==
      =?  SAP  (GTH COUNT.SAP MAX-COUNT.SAP)
        ~&  :*  %DUMP
                COUNT=COUNT.SAP
                MAX-COUNT=MAX-COUNT.SAP
                LENT=(LENT ~(TAP TO SNAPS.SAP))
            ==
        %=  SAP
          SNAPS  +:~(GET TO SNAPS.SAP)
          COUNT  (DEC COUNT)
        ==
      ..FILE
    --
  --
::                                                      ::  ++UR
::::                    ## ABSOLUTE^HEAVY               ::  OBJECTIVE ENGINE
  ::                                                    ::::
++  UR
      ::  THE ++UR CORE HANDLES PRIMARY, ABSOLUTE STATE.
      ::  IT IS THE BEST REFERENCE FOR THE SEMANTICS OF
      ::  THE URBIT PKI.
      ::
      ::  IT IS ABSOLUTELY VERBOTEN TO USE [OUR] IN ++UR.
      ::
  =|  HAB/(LIST CHANGE)
  =|  STATE-ABSOLUTE
  ::
  ::  HAB: SIDE EFFECTS, REVERSED
  ::  URB: ALL URBIT STATE
  ::
  =*  URB  -
  |%
  ::                                                    ::  ++ABET:UR
  ++  ABET                                              ::  RESOLVE
    [(FLOP HAB) `STATE-ABSOLUTE`URB]
  ::
  ++  LINK
    |=  VEN=CHAIN
    %_  +>
      HAB   [[%ETHE VEN] HAB]
    ==
  ::                                                    ::  ++LAWN:UR
  ++  LAWN                                              ::  DEBTS, REX TO PAL
    |=  {REX/SHIP PAL/SHIP}
    ^-  SAFE
    (LAWN:~(ABLE EX REX) PAL)
  ::                                                    ::  ++LEAN:UR
  ++  LEAN                                              ::  PRIVATE KEYS
    |=  REX/SHIP
    ^-  (PAIR LIFE (MAP LIFE RING))
    LEAN:~(ABLE EX REX)
  ::                                                    ::  ++EX:UR
  ++  EX                                                ::  SERVER ENGINE
    ::  SHY: PRIVATE STATE
    ::  RUG: DOMESTIC WILL
    ::
    =|  $:  SHY/(MAP SHIP SAFE)
        ==
    =|  ::  REX: SERVER SHIP
        ::
        REX/SHIP
    |%
    ::                                                  ::  ++ABET:EX:UR
    ++  ABET                                            ::  RESOLVE
      %_  ..EX
        PRY  (~(PUT BY PRY) REX SHY)
      ==
    ::                                                  ::  ++ABLE:EX:UR
    ++  ABLE                                            ::  INITIALIZE
      %_  .
        SHY  (FALL (~(GET BY PRY) REX) *(MAP SHIP SAFE))
      ==
    ::                                                  ::  ++DEAL:EX:UR
    ++  DEAL                                            ::  ALTER RIGHTS
      |=  {PAL/SHIP DEL/BUMP}
      ^+  +>
      =/  GOB  (FALL (~(GET BY SHY) PAL) *SAFE)
      =*  HEP  (~(UPDATE UP GOB) DEL)
      %_  +>.$
        SHY  (~(PUT BY SHY) PAL HEP)
        HAB  [[%RITE REX PAL DEL] HAB]
      ==
    ::
    ++  HAIL                                            ::  ++HAIL:EX:UR
      |=  {PAL/SHIP REM/REMOTE}                         ::  REPORT RIGHTS
      ^+  +>
      =/  GOB  (FALL (~(GET BY SHY) PAL) *SAFE)
      ::  YER: PAIR OF CHANGE AND UPDATED SAFE.
      =/  YER  ^-  (PAIR BUMP SAFE)
        ?-  -.REM
          ::  CHANGE: ADD REM. RESULT: OLD + REM.
          %&  [[P.REM ~] (~(SPLICE UP GOB) P.REM)]
          ::  CHANGE: DIFFERENCE. RESULT: REM.
          %|  [(~(DIFFER UP GOB) P.REM) P.REM]
        ==
      %_  +>.$
        SHY  (~(PUT BY SHY) PAL Q.YER)
        HAB  [[%RITE REX PAL P.YER] HAB]
      ==
    ::                                                  ::  ++LEAN:EX:UR
    ++  LEAN                                            ::  PRIVATE KEYS
      ^-  (PAIR LIFE (MAP LIFE RING))
      ::
      ::  PAR: PROMISES BY REX, TO REX
      ::  JEL: %JEWEL RIGHTS
      ::  LYF: LATEST LIFE OF
      ::
      =*  PAR  (~(GOT BY SHY) REX)
      =/  JEL=RITE  (NEED (~(EXPOSE UP PAR) %JEWEL))
      ?>  ?=($JEWEL -.JEL)
      =;  LYF=LIFE
        [LYF P.JEL]
      %+  ROLL  ~(TAP IN ~(KEY BY P.JEL))
      |=  [LIV=LIFE MAX=LIFE]
      ?:((GTH LIV MAX) LIV MAX)
    ::                                                  ::  ++LAWN:EX:UR
    ++  LAWN                                            ::  LIABILITIES TO PAL
      |=  PAL/SHIP
      ^-  SAFE
      =-(?~(- ~ U.-) (~(GET BY SHY) PAL))
    --
  --
::                                                      ::  ++ET
::::                    ## ETHEREUM^HEAVY               ::  ETHEREUM ENGINE
  ::                                                    ::::
++  ET
  ::
  ::  THE ++ET CORE HANDLES ALL LOGIC NECESSARY TO MAINTAIN THE
  ::  ABSOLUTE RECORD OF ON-CHAIN STATE CHANGES, "EVENTS".
  ::
  ::  WE EITHER SUBSCRIBE TO A PARENT SHIP'S EXISTING RECORD, OR
  ::  COMMUNICATE DIRECTLY WITH AN ETHEREUM NODE.
  ::
  ::  MOVES: EFFECTS; EITHER BEHN TIMERS, SUBSCRIPTIONS,
  ::         OR ETHEREUM NODE RPC REQUESTS.
  ::  RESET: WHETHER THE FOUND CHANGES ASSUME A FRESH STATE.
  ::  CHANGES: ON-CHAIN CHANGES HEARD FROM OUR SOURCE.
  ::
  =|  MOVES=(LIST MOVE)
  =+  RESET=|
  =|  CHANGES=LOGS
  =|  REWIND-BLOCK=(UNIT @UD)
  =|  $:  HEN=DUCT
          OUR=SHIP
          NOW=@DA
          STATE-ABSOLUTE
          STATE-RELATIVE
          STATE-ETH-NODE
          STATE-SNAPSHOTS
      ==
  =*  URB  ->+>-
  =*  SUB  ->+>+<
  =*  ETN  ->+>+>-
  =*  SAP  ->+>+>+
  ::
  ::  +|  OUTWARD
  |%
  ::
  ::  +ABET: PRODUCE RESULTS
  ::
  ++  ABET
    ^-  $:  (LIST MOVE)  CHAIN  STATE-ABSOLUTE  STATE-RELATIVE
            STATE-ETH-NODE  STATE-SNAPSHOTS
        ==
    =.  .
      ?~  REWIND-BLOCK
        .
      ::  IF WE'RE REWINDING TO A BLOCK, THEN WE THROW AWAY ANY MOVES
      ::  AND CHANGES WE WERE GOING TO MAKE.
      ::
      =:  MOVES    *(LIST MOVE)
          CHANGES  *LOGS
        ==
      (RESTORE-BLOCK U.REWIND-BLOCK)
    [(FLOP MOVES) ?:(RESET &+CHANGES |+CHANGES) URB SUB ETN SAP]
  ::
  ::  +PUT-MOVE: STORE SIDE-EFFECT
  ::
  ++  PUT-MOVE
    |=  MOV=MOVE
    %_(+> MOVES [MOV MOVES])
  ::
  ::  +PUT-REQUEST: STORE RPC REQUEST TO ETHEREUM NODE
  ::
  ++  PUT-REQUEST
    |=  [WIR=WIRE ID=(UNIT @T) REQ=REQUEST]
    (PUT-MOVE (RPC-HISS WIR (REQUEST-TO-JSON ID REQ)))
  ::
  ::  +PUT-CHANGE: STORE CHANGE MADE BY EVENT
  ::
  ++  PUT-CHANGE
    |=  [CAUSE=EVENT-ID DIF=DIFF-AZIMUTH]
    ?:  (~(HAS BY CHANGES) CAUSE)  ::  ONE DIFF PER EVENT
      ~&  [%DUPLICATE-CAUSE CAUSE]
      !!
    +>(CHANGES (~(PUT BY CHANGES) CAUSE DIF))
  ::
  ::  +|  MOVE-GENERATION
  ::
  ::  +WRAP-NOTE: %PASS A NOTE USING A MADE-UP DUCT
  ::
  ++  WRAP-NOTE
    |=  [WIR=WIRE NOT=NOTE:ABLE]
    ^-  MOVE
    :-  [/JAEL/ETH-LOGIC ~ ~]
    [%PASS (WELD /(SCOT %P OUR) WIR) NOT]
  ::
  ::  +RPC-HISS: MAKE AN HTTP REQUEST TO OUR ETHEREUM RPC SOURCE
  ::
  ++  RPC-HISS
    |=  [WIR=WIRE JON=JSON]
    ^-  MOVE
    %+  WRAP-NOTE  WIR
    :^  %E  %HISS  ~
    :+  %HTTR  %HISS
    ?>  ?=(%| -.SOURCE)
    !>  (JSON-REQUEST NODE.P.SOURCE JON)
  ::
  ::  +|  SOURCE-OPERATIONS
  ::
  ::  +LISTEN-TO-SHIP: DEPEND ON WHO FOR ETHEREUM EVENTS
  ::
  ++  LISTEN-TO-SHIP
    |=  [OUR=SHIP WHO=SHIP]
    %-  PUT-MOVE(SOURCE &+WHO)
    %+  WRAP-NOTE  /VENT/(SCOT %P WHO)
    [%A %WANT WHO /J/(SCOT %P OUR)/VENT `*`[%VENT ~]]
  ::
  ::  +UNSUBSCRIBE-FROM-SOURCE: STOP LISTENING TO CURRENT SOURCE SHIP
  ::
  ++  UNSUBSCRIBE-FROM-SOURCE
    |=  OUR=SHIP
    %-  PUT-MOVE
    ?>  ?=(%& -.SOURCE)
    %+  WRAP-NOTE  /VENT/(SCOT %P P.SOURCE)
    ::TODO  SHOULD WE MAYBE HAVE A %NUKE-VENT,
    ::      OR DO WE HAVE A UNIQUE DUCT HERE?
    [%A %WANT P.SOURCE /J/(SCOT %P OUR)/VENT `*`[%NUKE ~]]
  ::
  ::  +LISTEN-TO-NODE: START SYNCING FROM A NODE
  ::
  ::    GET LATEST BLOCK FROM ETH NODE AND COMPARE TO OUR OWN LATEST BLOCK.
  ::    GET INTERVENING BLOCKS IN CHUNKS UNTIL WE'RE CAUGHT UP, THEN SET
  ::    UP A FILTER GOING FORWARD.
  ::
  ++  LISTEN-TO-NODE
    |=  URL=PURL:EYRE
    GET-LATEST-BLOCK(SOURCE |+%*(. *NODE-SRC NODE URL))
  ::
  ::  +|  CATCH-UP-OPERATIONS
  ::
  ::  +GET-LATEST-BLOCK
  ::
  ::    GET LATEST KNOWN BLOCK NUMBER FROM ETH NODE.
  ::
  ++  GET-LATEST-BLOCK
    (PUT-REQUEST /CATCH-UP/BLOCK-NUMBER `'BLOCK NUMBER' %ETH-BLOCK-NUMBER ~)
  ::
  ::  +CATCH-UP: GET NEXT CHUNK
  ::
  ++  CATCH-UP
    |=  FROM-BLOCK=@UD
    ?:  (GTE FROM-BLOCK FOREIGN-BLOCK)
      NEW-FILTER
    =/  NEXT-BLOCK  (MIN FOREIGN-BLOCK (ADD FROM-BLOCK 5.760)) ::  ~D1
    ~&  [%CATCHING-UP FROM=FROM-BLOCK TO=FOREIGN-BLOCK]
    %-  PUT-REQUEST
    :+  /CATCH-UP/STEP/(SCOT %UD FROM-BLOCK)/(SCOT %UD NEXT-BLOCK)
      `'CATCH UP'
    :*  %ETH-GET-LOGS
        `NUMBER+FROM-BLOCK
        `NUMBER+NEXT-BLOCK
        ~[AZIMUTH:CONTRACTS]
        ~
    ==
  ::
  ::  +|  FILTER-OPERATIONS
  ::
  ::  +NEW-FILTER: REQUEST A NEW POLLING FILTER
  ::
  ::    LISTENS ONLY TO THE AZIMUTH STATE CONTRACT, AND ONLY FROM
  ::    THE LAST-HEARD BLOCK ONWARD.
  ::
  ++  NEW-FILTER
    %-  PUT-REQUEST
    :+  /FILTER/NEW  `'NEW FILTER'
    :*  %ETH-NEW-FILTER
        `NUMBER+LATEST-BLOCK
        ::  XX WE WANT TO LOAD FROM A SNAPSHOT AT LEAST 40 BLOCKS BEHIND, THEN
        ::  REPLAY TO THE PRESENT
        ::  `[%NUMBER ?:((LTE LATEST-BLOCK 40) 0 (SUB.ADD LATEST-BLOCK 40))]
        ::TODO  OR AZIMUTH ORIGIN BLOCK WHEN 0
        ~  ::TODO  WE SHOULD PROBABLY CHUNCK THESE, MAYBE?
        ::  HTTPS://STACKOVERFLOW.COM/Q/49339489
        ~[AZIMUTH:CONTRACTS]
        ~
    ==
  ::
  ::  +READ-FILTER: GET ALL EVENTS THE FILTER CAPTURES
  ::
  ++  READ-FILTER
    ?>  ?=(%| -.SOURCE)
    %-  PUT-REQUEST
    :+  /FILTER/LOGS  `'FILTER LOGS'
    [%ETH-GET-FILTER-LOGS FILTER-ID.P.SOURCE]
  ::
  ::  +POLL-FILTER: GET ALL NEW EVENTS SINCE THE LAST POLL (OR FILTER CREATION)
  ::
  ++  POLL-FILTER
    ?>  ?=(%| -.SOURCE)
    ?:  =(0 FILTER-ID.P.SOURCE)
      ~&  %NO-FILTER-BAD-POLL
      .
    %-  PUT-REQUEST
    :+  /FILTER/CHANGES  `'POLL FILTER'
    [%ETH-GET-FILTER-CHANGES FILTER-ID.P.SOURCE]
  ::
  ::  +WAIT-POLL: REMIND US TO POLL IN FOUR MINUTES
  ::
  ::    FOUR MINUTES BECAUSE ETHEREUM RPC FILTERS TIME OUT AFTER FIVE.
  ::    WE DON'T CHECK FOR AN EXISTING TIMER OR CLEAR AN OLD ONE HERE,
  ::    SANE FLOWS SHOULDN'T SEE THIS BEING CALLED SUPERFLUOUSLY.
  ::
  ++  WAIT-POLL
    ?>  ?=(%| -.SOURCE)
    =+  WEN=(ADD NOW ~M4)
    %-  PUT-MOVE(POLL-TIMER.P.SOURCE WEN)
    (WRAP-NOTE /POLL %B %WAIT WEN)
  ::
  ::  +CANCEL-WAIT-POLL: REMOVE POLL REMINDER
  ::
  ++  CANCEL-WAIT-POLL
    ?>  ?=(%| -.SOURCE)
    %-  PUT-MOVE(POLL-TIMER.P.SOURCE *@DA)
    %+  WRAP-NOTE  /POLL/CANCEL
    [%B %REST POLL-TIMER.P.SOURCE]
  ::
  ::  +|  CONFIGURATION
  ::
  ::  +INIT: INITIALIZE WITH DEFAULT ETHEREUM CONNECTION
  ::
  ::    FOR GALAXIES, WE DEFAULT TO A LOCALHOST GETH NODE.
  ::    FOR STARS AND UNDER, WE DEFAULT TO THE PARENT SHIP.
  ::
  ++  INIT
    |=  [OUR=SHIP BOS=SHIP]
    ^+  +>
    ::  TODO: SHIP OR NODE AS SAMPLE?
    ::
    =.  LATEST-BLOCK  (MAX LATEST-BLOCK LAUNCH:CONTRACTS)
    ?:  |(=(OUR BOS) ?=(^ NOD.OWN))
      ~|  %JAEL-INIT-NODE
      (LISTEN-TO-NODE (NEED NOD.OWN))
    (LISTEN-TO-SHIP OUR BOS)
  ::
  ::  +LOOK: CONFIGURE THE SOURCE OF ETHEREUM EVENTS
  ::
  ++  LOOK
    |=  SRC=(EACH SHIP PURL:EYRE)
    ^+  +>
    =.  +>
      ?:  ?=(%| -.SOURCE)
        CANCEL-WAIT-POLL
      (UNSUBSCRIBE-FROM-SOURCE OUR)
    ?:  ?=(%| -.SRC)
      (LISTEN-TO-NODE P.SRC)
    (LISTEN-TO-SHIP OUR P.SRC)
  ::
  ::  +|  SUBSCRIPTION-RESULTS
  ::
  ::  +HEAR-VENT: PROCESS INCOMING EVENTS
  ::
  ++  HEAR-VENT
    |=  =VENT-RESULT
    ^+  +>
    ?-  -.VENT-RESULT
        ::  `LOOK` CAN BE | BECAUSE WE KNOW WE'RE LISTENING TO A SHIP
        ::  RATHER THAN A NODE, SO THE SUBSCRIPTION WAS NEVER BROKEN
        ::
        %SNAP  (RESTORE-SNAP SNAP.VENT-RESULT |)
        %CHAIN
      ?-  -.CAN.VENT-RESULT
        %&   (ASSUME P.CAN.VENT-RESULT)
        ::
          %|
        =+  EVS=~(TAP BY P.CAN.VENT-RESULT)
        |-
        ?~  EVS  +>.^$
        =.  +>.^$  (ACCEPT I.EVS)
        $(EVS T.EVS)
      ==
    ==
  ::
  ::  +ASSUME: CLEAR STATE AND PROCESS EVENTS
  ::
  ++  ASSUME
    |=  EVS=LOGS
    ^+  +>
    %.  CHAIN+|+EVS
    %_  HEAR-VENT
      HEARD         ~
      LATEST-BLOCK  0
      RESET         &
    ==
  ::
  ::  +ACCEPT: PROCESS SINGLE EVENT
  ::
  ++  ACCEPT
    |=  [CAUSE=EVENT-ID DIF=DIFF-AZIMUTH]
    ^+  +>
    ?:  (~(HAS IN HEARD) CAUSE)
      ~&  %ACCEPT-IGNORING-DUPLICATE-EVENT
      +>.$
    (PUT-CHANGE CAUSE DIF)
  ::
  ::  +|  FILTER-RESULTS
  ::
  ::  +WAKE: KICK POLLING, UNLESS WE CHANGED SOURCE
  ::
  ++  WAKE
    ?.  ?=(%| -.SOURCE)  .
    POLL-FILTER
  ::
  ::  +SIGH: PARSE RPC RESPONSE AND PROCESS IT
  ::
  ++  SIGH
    |=  [CUZ=WIRE MAR=MARK RES=VASE]
    ^+  +>
    ?:  ?=(%& -.SOURCE)  +>
    ?:  ?=(%TANG MAR)
      ::TODO  PROPER ERROR HANDLING
      ~_  Q.RES
      ~&  [%YIKES CUZ]
      +>.$
    ?>  ?=(%HTTR MAR)
    =+  RAW-REP=~|(RES ((HARD HTTR:EYRE) Q.RES))
    =+  REP=(HTTR-TO-RPC-RESPONSE RAW-REP)
    ?:  ?=(%FAIL -.REP)
      ?:  =(405 P.HIT.REP)
        ~&  'HTTP 405 ERROR (EXPECTED IF USING INFURA)'
        +>.$
      ?.  =(5 (DIV P.HIT.REP 100))
        ~&  [%HTTP-ERROR HIT.REP]
        +>.$
      ?+  CUZ
        ~&  [%RETRYING-NODE ((SOFT TANG) Q.RES)]
        WAIT-POLL
          [%CATCH-UP %STEP @TA @TA ~]
        ~&  %RETRYING-CATCH-UP
        (CATCH-UP (SLAV %UD `@TA`I.T.T.CUZ))
      ==
    ?+  CUZ  ~|([%WEIRD-SIGH-WIRE CUZ] !!)
        [%FILTER %NEW *]
      (TAKE-NEW-FILTER REP)
    ::
        [%FILTER *]
      (TAKE-FILTER-RESULTS REP)
    ::
        [%CATCH-UP %BLOCK-NUMBER ~]
      (TAKE-BLOCK-NUMBER REP)
    ::
        [%CATCH-UP %STEP @TA @TA ~]
      =/  FROM-BLOCK  (SLAV %UD `@TA`I.T.T.CUZ)
      =/  NEXT-BLOCK  (SLAV %UD `@TA`I.T.T.T.CUZ)
      (TAKE-CATCH-UP-STEP REP FROM-BLOCK NEXT-BLOCK)
    ==
  ::
  ::  HTTR-TO-RPC-RESPONSE
  ::
  ++  HTTR-TO-RPC-RESPONSE
    |=  HIT/HTTR:EYRE
    ^-  RESPONSE:RPC:JSTD
    ~|  HIT
    ?.  ?=($2 (DIV P.HIT 100))
      FAIL+HIT
    =/  A=JSON  (NEED (DE-JSON:HTML Q:(NEED R.HIT)))
    =,  DEJS-SOFT:FORMAT
    ^-  RESPONSE:RPC:JSTD
    =;  DERE
      =+  RES=((AR DERE) A)
      ?~  RES  (NEED (DERE A))
      [%BATCH U.RES]
    |=  A=JSON
    ^-  (UNIT RESPONSE:RPC:JSTD)
    =/  RES=(UNIT [@T JSON])
      ::TODO  BREAKS WHEN NO ID PRESENT
      ((OT ID+SO RESULT+SOME ~) A)
    ?^  RES  `[%RESULT U.RES]
    ~|  A
    :+  ~  %ERROR  %-  NEED
    ((OT ID+SO ERROR+(OT CODE+NO MESSAGE+SO ~) ~) A)
  ::
  ::  +TAKE-NEW-FILTER: STORE FILTER-ID AND READ IT
  ::
  ++  TAKE-NEW-FILTER
    |=  REP=RESPONSE:RPC:JSTD
    ^+  +>
    ~|  REP
    ?<  ?=(%BATCH -.REP)
    ?<  ?=(%FAIL -.REP)
    ?:  ?=(%ERROR -.REP)
      ~&  [%FILTER-ERROR--RETRYING MESSAGE.REP]
      NEW-FILTER
    ?>  ?=(%| -.SOURCE)
    =-  READ-FILTER(FILTER-ID.P.SOURCE -)
    (PARSE-ETH-NEW-FILTER-RES RES.REP)
  ::
  ::  +TAKE-FILTER-RESULTS: PARSE RESULTS INTO EVENT-LOGS AND PROCESS THEM
  ::
  ++  TAKE-FILTER-RESULTS
    |=  REP=RESPONSE:RPC:JSTD
    ^+  +>
    ?<  ?=(%BATCH -.REP)
    ?<  ?=(%FAIL -.REP)
    ?:  ?=(%ERROR -.REP)
      ?.  ?|  =('FILTER NOT FOUND' MESSAGE.REP)  ::  GETH
              =('FILTER NOT FOUND' MESSAGE.REP)  ::  PARITY
          ==
        ~&  [%UNHANDLED-FILTER-ERROR +.REP]
        +>
      ::~&  [%FILTER-TIMED-OUT--RECREATING BLOCK=LATEST-BLOCK +.REP]
      ::  ARGUABLY SHOULD REWIND 40 BLOCKS ON THE OFF CHANCE THE CHAIN REORGANIZED
      ::  WHEN WE BLINKED.  THIS WILL ALSO RESTART THE FILTER.
      ::
      ::  (RESTORE-BLOCK ?:((LTH LATEST-BLOCK 40) 0 (SUB.ADD LATEST-BLOCK 40)))
      ::
      ::  COUNTER-ARGUMENT: IT'S A ROYAL PAIN TO RESTORE FROM A SNAPSHOT
      ::  EVERY TIME YOU CAN'T PING THE NODE FOR 5 MINUTES.  THIS IS LIKELY
      ::  TO DESTABILIZE THE NETWORK.  BETTER TO MANUALLY RESTORE IF WE
      ::  NOTICE AN ANOMALY.
      ::
      ::  THIRD WAY: DON'T TRUST ANYTHING THAT DOESN'T HAVE 40 CONFIRMATIONS
      ::
      NEW-FILTER
    ::  KICK POLLING TIMER, ONLY IF IT HASN'T ALREADY BEEN.
    =?  +>  ?&  ?=(%| -.SOURCE)
                (GTH NOW POLL-TIMER.P.SOURCE)
            ==
      WAIT-POLL
    (TAKE-EVENTS REP)
  ::
  ::  +TAKE-BLOCK-NUMBER: TAKE BLOCK NUMBER AND START CATCHING UP
  ::
  ++  TAKE-BLOCK-NUMBER
    |=  REP=RESPONSE:RPC:JSTD
    ^+  +>
    ?<  ?=(%BATCH -.REP)
    ?<  ?=(%FAIL -.REP)
    ?:  ?=(%ERROR -.REP)
      ~&  [%TAKE-BLOCK-NUMBER-ERROR--RETRYING MESSAGE.REP]
      GET-LATEST-BLOCK
    =.  FOREIGN-BLOCK  (PARSE-ETH-BLOCK-NUMBER RES.REP)
    ~&  [%SETTING-FOREIGN-BLOCK FOREIGN-BLOCK]
    (CATCH-UP LATEST-BLOCK)
  ::
  ::  +TAKE-CATCH-UP-STEP: PROCESS CHUNK
  ::
  ++  TAKE-CATCH-UP-STEP
    |=  [REP=RESPONSE:RPC:JSTD FROM-BLOCK=@UD NEXT-BLOCK=@UD]
    ^+  +>
    ?<  ?=(%BATCH -.REP)
    ?<  ?=(%FAIL -.REP)
    ?:  ?=(%ERROR -.REP)
      ~&  [%CATCH-UP-STEP-ERROR--RETRYING MESSAGE.REP]
      (CATCH-UP FROM-BLOCK)
    =.  +>.$  (TAKE-EVENTS REP)
    (CATCH-UP NEXT-BLOCK)
  ::
  ::  +TAKE-EVENTS: PROCESS EVENTS
  ::
  ++  TAKE-EVENTS
    |=  REP=RESPONSE:RPC:JSTD
    ^+  +>
    ?<  ?=(%BATCH -.REP)
    ?<  ?=(%FAIL -.REP)
    ?<  ?=(%ERROR -.REP)
    ?.  ?=(%A -.RES.REP)
      ~&  [%EVENTS-NOT-ARRAY REP]
      !!
    =*  CHANGES  P.RES.REP
    ~?  (GTH (LENT CHANGES) 0)
      :*  %PROCESSING-CHANGES
          CHANGES=(LENT CHANGES)
          BLOCK=LATEST-BLOCK
          ID=?.(?=(%| -.SOURCE) ~ `@UX`FILTER-ID.P.SOURCE)
      ==
    |-  ^+  +>.^$
    ?~  CHANGES  +>.^$
    =.  +>.^$
      (TAKE-EVENT-LOG (PARSE-EVENT-LOG I.CHANGES))
    $(CHANGES T.CHANGES)
  ::
  ::  +TAKE-EVENT-LOG: OBTAIN CHANGES FROM EVENT-LOG
  ::
  ++  TAKE-EVENT-LOG
    |=  LOG=EVENT-LOG
    ^+  +>
    ?~  MINED.LOG
      ~&  %IGNORING-UNMINED-EVENT
      +>
    =*  PLACE  U.MINED.LOG
    ?:  (~(HAS IN HEARD) BLOCK-NUMBER.PLACE LOG-INDEX.PLACE)
      ?.  REMOVED.U.MINED.LOG
        ::  ~&  [%IGNORING-DUPLICATE-EVENT TX=TRANSACTION-HASH.U.MINED.LOG]
        +>
      ::  BLOCK WAS REORGANIZED AWAY, SO REWIND TO THIS BLOCK AND
      ::  START SYNCING AGAIN.
      ::
      ~&  :*  'REMOVED EVENT!  PERHAPS CHAIN HAS REORGANIZED?'
              TX-HASH=TRANSACTION-HASH.U.MINED.LOG
              BLOCK-NUMBER=BLOCK-NUMBER.U.MINED.LOG
              BLOCK-HASH=BLOCK-HASH.U.MINED.LOG
          ==
      %=    +>
          REWIND-BLOCK
        :-  ~
        ?~  REWIND-BLOCK
          BLOCK-NUMBER.PLACE
        (MIN BLOCK-NUMBER.PLACE U.REWIND-BLOCK)
      ==
    =+  CUZ=[BLOCK-NUMBER.PLACE LOG-INDEX.PLACE]
    ::
    ?:  =(I.TOPICS.LOG CHANGED-DNS:AZIMUTH-EVENTS)
      =+  ^-  [PRI=TAPE SEC=TAPE TER=TAPE]
        %+  DECODE-RESULTS  DATA.LOG
        ~[%STRING %STRING %STRING]
      %+  PUT-CHANGE  CUZ
      [%DNS (CRIP PRI) (CRIP SEC) (CRIP TER)]
    ::
    =+  DIF=(EVENT-LOG-TO-POINT-DIFF LOG)
    ?~  DIF  +>.$
    (PUT-CHANGE CUZ %POINT U.DIF)
  ::                                                    ::  ++RESTORE-BLOCK:ET
  ++  RESTORE-BLOCK                                     ::  REWIND BEFORE BLOCK
    |=  BLOCK=@UD
    ^+  +>
    =/  OLD-QEU  SNAPS.SAP
    =:  SNAPS.SAP       ~
        COUNT.SAP       0
        LAST-BLOCK.SAP  0
      ==
    =^  SNAP=SNAPSHOT  +>.$
      ?:  |(=(~ OLD-QEU) (LTH BLOCK BLOCK-NUMBER:(NEED ~(TOP TO OLD-QEU))))
        [%*(. *SNAPSHOT LATEST-BLOCK LAUNCH:CONTRACTS) +>.$]
      |-  ^-  [SNAPSHOT _+>.^$]
      =^  SNAP=[BLOCK-NUMBER=@UD SNAP=SNAPSHOT]  OLD-QEU
        ~(GET TO OLD-QEU)
      =:  COUNT.SAP       +(COUNT.SAP)
          LAST-BLOCK.SAP  BLOCK-NUMBER.SNAP
          SNAPS.SAP       (~(PUT TO SNAPS.SAP) SNAP)
        ==
      ?:  |(=(~ OLD-QEU) (LTH BLOCK BLOCK-NUMBER:(NEED ~(TOP TO OLD-QEU))))
        [SNAP.SNAP +>.^$]
      $
    ~&  [%RESTORING-BLOCK BLOCK LATEST-BLOCK.SNAP ~(WYT BY POS.ETH.SNAP)]
    (RESTORE-SNAP SNAP &)
  ::                                                    ::  ++RESTORE-SNAP:ET
  ++  RESTORE-SNAP                                      ::  RESTORE SNAPSHOT
    |=  [SNAP=SNAPSHOT LOOK=?]
    ^+  +>
    ::  UPDATE PUB SUBSCRIBERS
    ::
    =.  +>.$
      =/  SUBS=(LIST (PAIR SHIP (SET DUCT)))
        ~(TAP BY YEN.PUK.SUB)
      |-  ^+  +>.^$
      ?~  SUBS  +>.^$
      =/  PUB  (FALL (~(GET BY KYZ.SNAP) P.I.SUBS) *PUBLIC)
      =.  +>.^$  (EXEC Q.I.SUBS [%GIVE %PUBS PUB])
      $(SUBS T.SUBS)
    ::  UPDATE VENT SUBSCRIBERS
    ::
    =.  +>.$  (VENT-PASS YEN.ETH SNAP+SNAP)
    ::  KEEP THE FOLLOWING IN SYNC WITH ++EXTRACT-SNAP:FILE:SU
    ::
    %=    +>.$
        HEARD.ETN         HEARD.SNAP
        LATEST-BLOCK.ETN  LATEST-BLOCK.SNAP
        KYZ.PUK.SUB       KYZ.SNAP
        DNS.ETH.SUB       DNS.ETH.SNAP
        POS.ETH.SUB       POS.ETH.SNAP
        SAP               SAP(LAST-BLOCK 0)
        MOVES
      ?.  LOOK  MOVES
      =-  [[HEN %PASS /WIND/LOOK %J %LOOK -] MOVES]
      ?-  -.SOURCE.ETN
        %&  &+P.SOURCE.ETN
        %|  |+NODE.P.SOURCE.ETN
      ==
    ==
  ::                                                    ::  ++EXEC:ET
  ++  EXEC                                              ::  MASS GIFT
    |=  {YEN/(SET DUCT) CAD/CARD}
    =/  NOY  ~(TAP IN YEN)
    |-  ^+  ..EXEC
    ?~  NOY  ..EXEC
    $(NOY T.NOY, MOVES [[I.NOY CAD] MOVES])
  ::                                                    ::  ++VENT-PASS:ET
  ++  VENT-PASS                                         ::  "GIVE" VENT
    |=  [YEN=(SET DUCT) RES=VENT-RESULT]
    =+  YEZ=~(TAP IN YEN)
    |-  ^+  ..VENT-PASS
    ?~  YEZ  ..VENT-PASS
    =*  D  I.YEZ
    ?>  ?=([[%A @ @ *] *] D)
    =+  OUR=(SLAV %P I.T.I.D)
    =+  WHO=(SLAV %P I.T.T.I.D)
    %+  EXEC  [D ~ ~]
    :+  %PASS
      /(SCOT %P OUR)/VENT-RESULT
    ^-  NOTE:ABLE
    [%A %WANT WHO /J/(SCOT %P OUR)/VENT-RESULT %VENT-RESULT RES]
  ::                                                    ::  ++FEED:SU
  --
--
::                                                      ::::
::::                    #  VANE                         ::  INTERFACE
  ::                                                    ::::
::
::  LEX: ALL DURABLE %JAEL STATE
::
=|  LEX/STATE
|=  $:  ::
        ::  OUR: IDENTITY
        ::  NOW: CURRENT TIME
        ::  ENY: UNIQUE ENTROPY
        ::  SKI: NAMESPACE RESOLVER
        ::
        OUR=SHIP
        NOW=@DA
        ENY=@UVJ
        SKI=SLEY
    ==
|%
::                                                      ::  ++CALL
++  CALL                                                ::  REQUEST
  |=  $:  ::  HEN: CAUSE OF THIS EVENT
          ::  HIC: EVENT DATA
          ::
          HEN/DUCT
          HIC/(HYPO (HOBO TASK:ABLE))
      ==
  ^-  [(LIST MOVE) _..^$]
  =/  =TASK:ABLE
    ?.  ?=($SOFT -.Q.HIC)
      Q.HIC
    (TASK:ABLE P.Q.HIC)
  =^  DID  LEX
    ABET:(~(CALL OF [OUR NOW ENY] LEX) HEN TASK)
  [DID ..^$]
::                                                      ::  ++LOAD
++  LOAD                                                ::  UPGRADE
  |=  $:  ::  OLD: PREVIOUS STATE
          ::
          OLD/STATE
      ==
  ^+  ..^$
  ..^$(LEX OLD)
::                                                      ::  ++SCRY
++  SCRY                                                ::  INSPECT
  |=  $:  ::  FUR: EVENT SECURITY
          ::  REN: ACCESS MODE
          ::  WHY: OWNER
          ::  SYD: DESK (BRANCH)
          ::  LOT: CASE (VERSION)
          ::  TYL: REST OF PATH
          ::
          FUR/(UNIT (SET MONK))
          REN/@TAS
          WHY/SHOP
          SYD/DESK
          LOT/COIN
          TYL/SPUR
      ==
  ^-  (UNIT (UNIT CAGE))
  ::  XX REVIEW FOR SECURITY, STABILITY, CASES OTHER THAN NOW
  ::
  ?.  =(LOT [%$ %DA NOW])  ~
  ?.  =(%$ REN)  [~ ~]
  ?+    SYD
      ~
  ::
      %CODE
    ?.  ?=([@ ~] TYL)  [~ ~]
    ?.  ?&  ?=(%& -.WHY)
            (~(HAS BY PRY.URB.LEX) P.WHY)
        ==
      [~ ~]
    =/  WHO  (SLAW %P I.TYL)
    ?~  WHO  [~ ~]
    =/  SEC  (~(GOT BY JAW.OWN.SUB.LEX) LYF.OWN.SUB.LEX)
    =/  CUB  (NOL:NU:CRUB:CRYPTO SEC)
    ::  XX USE PAC:EX:CUB?
    ::
    ``[%NOUN !>((END 6 1 (SHAF %PASS (SHAX SEC:EX:CUB))))]
  ::
      %LIFE
    ?.  ?=([@ ~] TYL)  [~ ~]
    ?.  ?&  ?=(%& -.WHY)
            (~(HAS BY PRY.URB.LEX) P.WHY)
        ==
      [~ ~]
    =/  WHO  (SLAW %P I.TYL)
    ?~  WHO  [~ ~]
    ::  FAKE SHIPS ALWAYS HAVE LIFE=1
    ::
    ?:  FAK.OWN.SUB.LEX
      ``[%ATOM !>(1)]
    ?:  =(U.WHO P.WHY)
      ``[%ATOM !>(LYF.OWN.SUB.LEX)]
    =/  PUB  (~(GET BY KYZ.PUK.SUB.LEX) U.WHO)
    ?~  PUB  ~
    ``[%ATOM !>(LIFE.U.PUB)]
  ::
      %DEED
    ?.  ?=([@ @ ~] TYL)  [~ ~]
    ?.  &(?=(%& -.WHY) =(P.WHY OUR))
      [~ ~]
    =/  WHO  (SLAW %P I.TYL)
    =/  LYF  (SLAW %UD I.T.TYL)
    ?~  WHO  [~ ~]
    ?~  LYF  [~ ~]
    =/  RAC  (CLAN:TITLE U.WHO)
    ::
    ?:  ?=(%PAWN RAC)
      ?.  =(U.WHO P.WHY)
        [~ ~]
      ?.  =(1 U.LYF)
        [~ ~]
      =/  SEC  (~(GOT BY JAW.OWN.SUB.LEX) U.LYF)
      =/  CUB  (NOL:NU:CRUB:CRYPTO SEC)
      =/  SIG  (SIGN:AS:CUB (SHAF %SELF (SHAM [U.WHO 1 PUB:EX:CUB])))
      :^  ~  ~  %NOUN
      !>  ^-  DEED:AMES
      [1 PUB:EX:CUB `SIG]
    ::
    ?:  ?=(%EARL RAC)
      ?.  =(U.WHO P.WHY)
        [~ ~]
      ?:  (GTH U.LYF LYF.OWN.SUB.LEX)
        ~
      ?:  (LTH U.LYF LYF.OWN.SUB.LEX)
        [~ ~]
      =/  SEC  (~(GOT BY JAW.OWN.SUB.LEX) U.LYF)
      =/  CUB  (NOL:NU:CRUB:CRYPTO SEC)
      :^  ~  ~  %NOUN
      !>  ^-  DEED:AMES
      [U.LYF PUB:EX:CUB SIG.OWN.SUB.LEX]
    ::
    =/  PUB  (~(GET BY KYZ.PUK.SUB.LEX) U.WHO)
    ?~  PUB
      ~
    ?:  (GTH U.LYF LIFE.U.PUB)
      ~
    =/  PAS  (~(GET BY PUBS.U.PUB) U.LYF)
    ?~  PAS
      ~
    :^  ~  ~  %NOUN
    !>  `DEED:AMES`[U.LYF U.PAS ~]
  ::
      %EARL
    ?.  ?=([@ @ @ ~] TYL)  [~ ~]
    ?.  ?&  ?=(%& -.WHY)
            (~(HAS BY PRY.URB.LEX) P.WHY)
        ==
      [~ ~]
    =/  WHO  (SLAW %P I.TYL)
    =/  LYF  (SLAW %UD I.T.TYL)
    =/  PUB  (SLAW %UX I.T.T.TYL)
    ?~  WHO  [~ ~]
    ?~  LYF  [~ ~]
    ?~  PUB  [~ ~]
    ?:  (GTH U.LYF LYF.OWN.SUB.LEX)
      ~
    ?:  (LTH U.LYF LYF.OWN.SUB.LEX)
      [~ ~]
    :: XX CHECK THAT WHO/LYF HASN'T BEEN BOOTED
    ::
    =/  SEC  (~(GOT BY JAW.OWN.SUB.LEX) U.LYF)
    =/  CUB  (NOL:NU:CRUB:CRYPTO SEC)
    =/  SIG  (SIGN:AS:CUB (SHAF %EARL (SHAM U.WHO U.LYF U.PUB)))
    ``[%ATOM !>(SIG)]
  ::
      %SEIN
    ?.  ?=([@ ~] TYL)  [~ ~]
    ?.  ?&  ?=(%& -.WHY)
            (~(HAS BY PRY.URB.LEX) P.WHY)
        ==
      [~ ~]
    =/  WHO  (SLAW %P I.TYL)
    ?~  WHO  [~ ~]
    :^  ~  ~  %ATOM
    !>  ^-  SHIP
    (~(SEIN OF [OUR NOW ENY] LEX) U.WHO)
  ::
      %SAXO
    ?.  ?=([@ ~] TYL)  [~ ~]
    ?.  ?&  ?=(%& -.WHY)
            (~(HAS BY PRY.URB.LEX) P.WHY)
        ==
      [~ ~]
    =/  WHO  (SLAW %P I.TYL)
    ?~  WHO  [~ ~]
    :^  ~  ~  %NOUN
    !>  ^-  (LIST SHIP)
    (~(SAXO OF [OUR NOW ENY] LEX) U.WHO)
  ::
      %ETH-STATUS
    ?.  ?=(~ TYL)  [~ ~]
    :^  ~  ~  %NOUN  !>
    ^-  [LATEST-BLOCK=@UD SOURCE=(EACH SHIP NODE-SRC)]
    [LATEST-BLOCK.ETN.LEX SOURCE.ETN.LEX]
  ::
      %SNAP
    ?.  ?=(~ TYL)  [~ ~]
    ?:  =(~ SNAPS.SAP.LEX)
      `~
    :^  ~  ~  %NOUN  !>
    |-  ^-  SNAPSHOT
    =^  SNAP=[@UD SNAP=SNAPSHOT]  SNAPS.SAP.LEX
      ~(GET TO SNAPS.SAP.LEX)
    ?:  =(~ SNAPS.SAP.LEX)
      SNAP.SNAP
    $
  ==
::                                                      ::  ++STAY
++  STAY                                                ::  PRESERVE
  LEX
::                                                      ::  ++TAKE
++  TAKE                                                ::  ACCEPT
  |=  $:  ::  TEA: ORDER
          ::  HEN: CAUSE
          ::  HIN: RESULT
          ::
          TEA/WIRE
          HEN/DUCT
          HIN/(HYPO SIGN)
      ==
  ^-  [(LIST MOVE) _..^$]
  =^  DID  LEX  ABET:(~(TAKE OF [OUR NOW ENY] LEX) TEA HEN Q.HIN)
  [DID ..^$]
--
