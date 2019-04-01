!:
::  DILL (4D), TERMINAL HANDLING
::
|=  PIT/VASE
=,  DILL
=>  |%                                                  ::  INTERFACE TILES
++  GILL  (PAIR SHIP TERM)                              ::  GENERAL CONTACT
--                                                      ::
=>  |%                                                  ::  CONSOLE PROTOCOL
++  ALL-AXLE  ?(AXLE)                                   ::
++  AXLE                                                ::
  $:  $0                                                ::
      HEY/(UNIT DUCT)                                   ::  DEFAULT DUCT
      DUG/(MAP DUCT AXON)                               ::  CONVERSATIONS
      $=  HEF                                           ::  OTHER WEIGHTS
      $:  A/(UNIT MASS)                                 ::
          B/(UNIT MASS)                                 ::
          C/(UNIT MASS)                                 ::
          E/(UNIT MASS)                                 ::
          F/(UNIT MASS)                                 ::
          G/(UNIT MASS)                                 ::
          J/(UNIT MASS)                                 ::
      ==                                                ::
  ==                                                    ::
++  AXON                                                ::  DILL PER DUCT
  $:  RAM/TERM                                          ::  CONSOLE PROGRAM
      TEM/(UNIT (LIST DILL-BELT))                       ::  PENDING, REVERSE
      WID/_80                                           ::  TERMINAL WIDTH
      POS/@UD                                           ::  CURSOR POSITION
      SEE/(LIST @C)                                     ::  CURRENT LINE
  ==                                                    ::
--  =>                                                  ::
|%                                                      ::  PROTOCOL OUTWARD
++  MESS                                                ::
  $%  {$DILL-BELT P/(HYPO DILL-BELT)}                   ::
  ==                                                    ::
++  MOVE  {P/DUCT Q/(WIND NOTE GIFT:ABLE)}              ::  LOCAL MOVE
++  NOTE-AMES                                           ::  WEIRD AMES MOVE
  $%  {$WEGH $~}                                        ::
  ==                                                    ::
++  NOTE-BEHN                                           ::
  $%  {$WEGH $~}                                        ::
  ==                                                    ::
++  NOTE-CLAY                                           ::
  $%  {$MERG P/@TAS Q/@P R/@TAS S/CASE T/GERM:CLAY}     ::  MERGE DESKS
      {$WARP P/SHIP Q/RIFF:CLAY}                        ::  WAIT FOR CLAY HACK
      {$WEGH $~}                                        ::
      {$PERM P/DESK Q/PATH R/RITE:CLAY}                 ::  CHANGE PERMISSIONS
  ==                                                    ::
++  NOTE-DILL                                           ::  NOTE TO SELF, ODD
  $%  {$CRUD P/@TAS Q/(LIST TANK)}                      ::
      {$HEFT $~}                                        ::
      {$INIT P/SHIP}                                    ::
      {$LYRA P/@T Q/@T}                                 ::  UPGRADE KERNEL
      {$TEXT P/TAPE}                                    ::
      {$VEER P/@TA Q/PATH R/@T}                         ::  INSTALL VANE
      {$VERB $~}                                        ::  VERBOSE MODE
  ==                                                    ::
++  NOTE-EYRE                                           ::
  $%  {$WEGH $~}                                        ::
  ==                                                    ::
++  NOTE-FORD                                           ::
  $%  {$WEGH $~}                                        ::
  ==                                                    ::
++  NOTE-GALL                                           ::
  $%  {$CONF DOCK $LOAD SHIP DESK}                      ::
      {$DEAL P/SOCK Q/CUSH:GALL}                        ::
      {$WEGH $~}                                        ::
  ==                                                    ::
++  NOTE-JAEL                                           ::
  $%  $:  %DAWN                                         ::  BOOT FROM KEYS
          =SEED:ABLE:JAEL                               ::    IDENTITY PARAMS
          SPON=SHIP                                     ::    SPONSOR
          CZAR=(MAP SHIP [=LIFE =PASS])                 ::    GALAXY TABLE
          TURF=(LIST TURF)                              ::    DOMAINS
          BLOQ=@UD                                      ::    BLOCK NUMBER
          NODE=(UNIT PURL:EYRE)                         ::    GATEWAY URL
          SNAP=(UNIT SNAPSHOT:JAEL)                     ::    HEAD START
      ==                                                ::
      [%FAKE OUR=SHIP]                                  ::  BOOT FAKE
      [%WEGH ~]
  ==                                                    ::
++  NOTE                                                ::  OUT REQUEST $->
  $%  {$A NOTE-AMES}                                    ::
      {$B NOTE-BEHN}                                    ::
      {$C NOTE-CLAY}                                    ::
      {$D NOTE-DILL}                                    ::
      {$E NOTE-EYRE}                                    ::
      {$F NOTE-FORD}                                    ::
      {$G NOTE-GALL}                                    ::
      {$J NOTE-JAEL}                                    ::
  ==                                                    ::
++  SIGN-AMES                                           ::
  $%  {$NICE $~}                                        ::
      {$SEND P/LANE:AMES Q/@}                           ::
      {$MASS P/MASS}                                    ::
  ==                                                    ::
++  SIGN-BEHN                                           ::
  $%  {$MASS P/MASS}                                    ::
  ==                                                    ::
++  SIGN-CLAY                                           ::
  $%  {$MERE P/(EACH (SET PATH) (PAIR TERM TANG))}      ::
      {$NOTE P/@TD Q/TANK}                              ::
      {$WRIT P/RIOT:CLAY}                               ::
      {$MASS P/MASS}                                    ::
      {$MACK P/(UNIT TANG)}                             ::
  ==                                                    ::
++  SIGN-DILL                                           ::
  $%  {$BLIT P/(LIST BLIT)}                             ::
  ==                                                    ::
++  SIGN-EYRE                                           ::
  $%  {$MASS P/MASS}                                    ::
  ==                                                    ::
++  SIGN-FORD                                           ::
  $%  {$MASS P/MASS}                                    ::
  ==                                                    ::
++  SIGN-GALL                                           ::
  $%  {$ONTO P/(EACH SUSS:GALL TANG)}                   ::
      {$UNTO P/CUFT:GALL}                               ::
      {$MASS P/MASS}                                    ::
  ==                                                    ::
++  SIGN-JAEL                                           ::
  $%  [%INIT P=SHIP]                                    ::
      [%MASS P=MASS]
  ==                                                    ::
++  SIGN                                                ::  IN RESULT $<-
  $%  {$A SIGN-AMES}                                    ::
      {$B SIGN-BEHN}                                    ::
      {$C SIGN-CLAY}                                    ::
      {$D SIGN-DILL}                                    ::
      {$E SIGN-EYRE}                                    ::
      {$F SIGN-FORD}                                    ::
      {$G SIGN-GALL}                                    ::
      {%J SIGN-JAEL}                                    ::
  ==
::::::::                                                ::  DILL TILES
--
=|  ALL/AXLE
|=  [OUR=SHIP NOW=@DA ENY=@UVJ SKI=SLEY]                ::  CURRENT INVOCATION
=>  |%
    ++  AS                                              ::  PER CAUSE
      =|  MOZ/(LIST MOVE)
      |_  [HEN=DUCT AXON]
      ++  ABET                                          ::  RESOLVE
        ^-  {(LIST MOVE) AXLE}
        [(FLOP MOZ) ALL(DUG (~(PUT BY DUG.ALL) HEN +<+))]
      ::
      ++  CALL                                          ::  RECEIVE INPUT
        |=  KYZ/TASK:ABLE
        ^+  +>
        ?+    -.KYZ  ~&  [%STRANGE-KISS -.KYZ]  +>
          $FLOW  +>
          $HARM  +>
          $HAIL  (SEND %HEY ~)
          $BELT  (SEND `DILL-BELT`P.KYZ)
          $TEXT  (FROM %OUT (TUBA P.KYZ))
          $CRUD  ::  (SEND `DILL-BELT`[%CRU P.KYZ Q.KYZ])
                 (CRUD P.KYZ Q.KYZ)
          $BLEW  (SEND %REZ P.P.KYZ Q.P.KYZ)
          $HEFT  HEFT
          $LYRA  (DUMP KYZ)
          $VEER  (DUMP KYZ)
          $VERB  (DUMP KYZ)
        ==
      ::
      ++  CRUD
        |=  {ERR/@TAS TAC/(LIST TANK)}
        =+  ^=  WOL  ^-  WALL
            :-  (TRIP ERR)
            (ZING (TURN (FLOP TAC) |=(A/TANK (~(WIN RE A) [0 WID]))))
        |-  ^+  +>.^$
        ?~  WOL  +>.^$
        $(WOL T.WOL, +>.^$ (FROM %OUT (TUBA I.WOL)))
      ::
      ++  DUMP                                          ::  PASS DOWN TO HEY
        |=  GIT/GIFT:ABLE
        ?>  ?=(^ HEY.ALL)
        +>(MOZ [[U.HEY.ALL %GIVE GIT] MOZ])
      ::
      ++  DONE                                          ::  RETURN GIFT
        |=  GIT/GIFT:ABLE
        +>(MOZ :_(MOZ [HEN %GIVE GIT]))
      ::
      ++  FROM                                          ::  RECEIVE BELT
        |=  BIT/DILL-BLIT
        ^+  +>
        ?:  ?=($MOR -.BIT)
          |-  ^+  +>.^$
          ?~  P.BIT  +>.^$
          $(P.BIT T.P.BIT, +>.^$ ^$(BIT I.P.BIT))
        ?:  ?=($OUT -.BIT)
          %+  DONE  %BLIT
          :~  [%LIN P.BIT]
              [%MOR ~]
              [%LIN SEE]
              [%HOP POS]
          ==
        ?:  ?=($KLR -.BIT)
          %+  DONE  %BLIT
          :~  [%LIN (CVRT:ANSI P.BIT)]
              [%MOR ~]
              [%LIN SEE]
              [%HOP POS]
          ==
        ?:  ?=($PRO -.BIT)
          (DONE(SEE P.BIT) %BLIT [[%LIN P.BIT] [%HOP POS] ~])
        ?:  ?=($POM -.BIT)
          =.  SEE  (CVRT:ANSI P.BIT)
          (DONE %BLIT [[%LIN SEE] [%HOP POS] ~])
        ?:  ?=($HOP -.BIT)
          (DONE(POS P.BIT) %BLIT [BIT ~])
        ?:  ?=($QIT -.BIT)
          (DUMP %LOGO ~)
        (DONE %BLIT [BIT ~])
      ::
      ++  ANSI
        |%
        ++  CVRT                                        ::  STUB TO (LIST @C)
          |=  A/STUB                                    ::  WITH ANSI CODES
          ^-  (LIST @C)
          %-  ZING  %+  TURN  A
          |=  A/(PAIR STYE (LIST @C))
          ^-  (LIST @C)
          ;:  WELD
              ?:  =(0 ~(WYT IN P.P.A))  ~
              `(LIST @C)`(ZING (TURN ~(TAP IN P.P.A) EF))
              (BG P.Q.P.A)
              (FG Q.Q.P.A)
              Q.A
              ?~(P.P.A ~ (EF ~))
              (BG ~)
              (FG ~)
          ==
        ::
        ++  EF  |=(A/^DECO (SCAP (DECO A)))             ::  ANSI EFFECT
        ::
        ++  FG  |=(A/^TINT (SCAP (TINT A)))             ::  ANSI FOREGROUND
        ::
        ++  BG                                          ::  ANSI BACKGROUND
          |=  A/^TINT
          %-  SCAP
          =>((TINT A) [+(P) Q])                         ::  (ADD 10 FG)
        ::
        ++  SCAP                                        ::  ANSI ESCAPE SEQ
          |=  A/$@(@ (PAIR @ @))
          %-  (LIST @C)
          :+  27  '['                                   ::  "\033[{A}M"
          ?@(A :~(A 'M') :~(P.A Q.A 'M'))
        ::
        ++  DECO                                        ::  ANSI EFFECTS
          |=  A/^DECO  ^-  @
          ?-  A
            ~   '0'
            $BR  '1'
            $UN  '4'
            $BL  '5'
          ==
        ::
        ++  TINT                                        ::  ANSI COLORS (FG)
          |=  A/^TINT
          ^-  (PAIR @ @)
          :-  '3'
          ?-  A
            $K  '0'
            $R  '1'
            $G  '2'
            $Y  '3'
            $B  '4'
            $M  '5'
            $C  '6'
            $W  '7'
            ~  '9'
          ==
        --
      ::
      ++  HEFT
        %_    .
            MOZ
          :*  [HEN %PASS /HEFT/AMES %A %WEGH ~]
              [HEN %PASS /HEFT/BEHN %B %WEGH ~]
              [HEN %PASS /HEFT/CLAY %C %WEGH ~]
              [HEN %PASS /HEFT/EYRE %E %WEGH ~]
              [HEN %PASS /HEFT/FORD %F %WEGH ~]
              [HEN %PASS /HEFT/GALL %G %WEGH ~]
              [HEN %PASS /HEFT/JAEL %J %WEGH ~]
              MOZ
          ==
        ==
      ::  XX MOVE
      ::
      ++  SEIN
        |=  WHO=SHIP
        ;;  SHIP
        %-  NEED  %-  NEED
        %-  (SLOY-LIGHT SKI)
        [[151 %NOUN] %J OUR %SEIN DA+NOW /(SCOT %P WHO)]
      ::
      ++  INIT                                          ::  INITIALIZE
        ~&  [%DILL-INIT OUR RAM]
        ^+  .
        =/  MYT  (FLOP (NEED TEM))
        =/  CAN  (CLAN:TITLE OUR)
        =.  TEM  ~
        =.  MOZ  :_(MOZ [HEN %PASS / %C %MERG %HOME OUR %BASE DA+NOW %INIT])
        =.  MOZ  :_(MOZ [HEN %PASS ~ %G %CONF [[OUR RAM] %LOAD OUR %HOME]])
        =.  +>  (SYNC %HOME OUR %BASE)
        =.  +>  ?:  ?=(?($CZAR $PAWN) CAN)  +>
                (SYNC %BASE (SEIN OUR) %KIDS)
        =.  +>  ?.  ?=(?($DUKE $KING $CZAR) CAN)  +>
                ::  MAKE KIDS DESK PUBLICLY READABLE, SO SYNCS WORK.
                ::
                (SHOW %KIDS):(SYNC %KIDS OUR %BASE)
        =.  +>  AUTOLOAD
        =.  +>  PEER
        |-  ^+  +>+
        ?~  MYT  +>+
        $(MYT T.MYT, +>+ (SEND I.MYT))
      ::
      ++  INTO                                          ::  PREINITIALIZE
        |=  GYL/(LIST GILL)
        %_    +>
            TEM  `(TURN GYL |=(A/GILL [%YOW A]))
            MOZ
          :_  MOZ
          [HEN %PASS / %C %WARP OUR %BASE `[%SING %Y [%UD 1] /]]
        ==
      ::
      ++  SEND                                          ::  SEND ACTION
        |=  BET/DILL-BELT
        ?^  TEM
          +>(TEM `[BET U.TEM])
        %_    +>
            MOZ
          :_  MOZ
          [HEN %PASS ~ %G %DEAL [OUR OUR] RAM %POKE [%DILL-BELT -:!>(BET) BET]]
        ==
      ++  PEER
        %_    .
            MOZ
          :_(MOZ [HEN %PASS ~ %G %DEAL [OUR OUR] RAM %PEER /DRUM])
        ==
      ::
      ++  SHOW                                          ::  PERMIT READS ON DESK
        |=  DES/DESK
        %_    +>.$
            MOZ
          :_  MOZ
          [HEN %PASS /SHOW %C %PERM DES / R+`[%BLACK ~]]
        ==
      ::
      ++  SYNC
        |=  SYN/{DESK SHIP DESK}
        %_    +>.$
            MOZ
          :_  MOZ
          :*  HEN  %PASS  /SYNC  %G  %DEAL  [OUR OUR]
              RAM  %POKE  %HOOD-SYNC  -:!>(SYN)  SYN
          ==
        ==
      ::
      ++  AUTOLOAD
        %_    .
            MOZ
          :_  MOZ
          :*  HEN  %PASS  /AUTOLOAD  %G  %DEAL  [OUR OUR]
              RAM  %POKE  %KILN-START-AUTOLOAD  [%ATOM %N `~]  ~
          ==
        ==
      ::
      ++  PUMP                                          ::  SEND DIFF ACK
        %_    .
            MOZ
          :_(MOZ [HEN %PASS ~ %G %DEAL [OUR OUR] RAM %PUMP ~])
        ==
      ::
      ++  TAKE                                          ::  RECEIVE
        |=  SIH/SIGN
        ^+  +>
        ?-    SIH
            {?($A $B $C $E $F $G $J) $MASS *}
          (WEGH -.SIH P.SIH)
        ::
            {$A $NICE *}
          ::  ~&  [%TAKE-NICE-AMES SIH]
          +>
        ::
            [%J %INIT *]
          ::  PASS THRU TO UNIX
          ::
          +>(MOZ :_(MOZ [HEN %GIVE +.SIH]))
        ::
            {$A $SEND *}
          +>(MOZ :_(MOZ [HEN %GIVE +.SIH]))
        ::
            {$C $MERE *}
          ?:  ?=(%& -.P.SIH)
            +>.$
          (MEAN >%DILL-MERE-FAIL< >P.P.P.SIH< Q.P.P.SIH)
        ::
            {$G $ONTO *}
          ::  ~&  [%TAKE-GALL-ONTO +>.SIH]
          ?-  -.+>.SIH
            %|  (CRUD %ONTO P.P.+>.SIH)
            %&  (DONE %BLIT [%LIN (TUBA "{<P.P.SIH>}")]~)
          ==
        ::
            {$G $UNTO *}
          ::  ~&  [%TAKE-GALL-UNTO +>.SIH]
          ?-  -.+>.SIH
            $COUP  ?~(P.P.+>.SIH +>.$ (CRUD %COUP U.P.P.+>.SIH))
            $QUIT  PEER
            $REAP  ?~  P.P.+>.SIH
                     +>.$
                   (DUMP:(CRUD %REAP U.P.P.+>.SIH) %LOGO ~)
            $DIFF  PUMP:(FROM ((HARD DILL-BLIT) Q:`VASE`+>+>.SIH))
          ==
        ::
            {$C $NOTE *}
          (FROM %OUT (TUBA P.SIH ' ' ~(RAM RE Q.SIH)))
        ::
            {$C $WRIT *}
          INIT
        ::
            {$C $MACK *}
          ?~  P.SIH  +>.$
          (MEAN >%DILL-CLAY-NACK< U.P.SIH)
        ::
            {$D $BLIT *}
          (DONE +.SIH)
        ==
      ::  +WEGH: RECEIVE A MEMORY REPORT FROM A VANE AND MAYBE EMIT FULL REPORT
      ::
      ++  WEGH
        |=  {LAL/?($A $B $C $E $F $G $J) MAS/MASS}
        ^+  +>
        ::  UPDATE OUR LISTING OF VANE RESPONSES WITH THIS NEW ONE
        ::
        =.  HEF.ALL
          ?-  LAL
            $A  ~?(?=(^ A.HEF.ALL) %DOUBLE-MASS-A HEF.ALL(A `MAS))
            $B  ~?(?=(^ B.HEF.ALL) %DOUBLE-MASS-B HEF.ALL(B `MAS))
            $C  ~?(?=(^ C.HEF.ALL) %DOUBLE-MASS-C HEF.ALL(C `MAS))
            $E  ~?(?=(^ E.HEF.ALL) %DOUBLE-MASS-E HEF.ALL(E `MAS))
            $F  ~?(?=(^ F.HEF.ALL) %DOUBLE-MASS-F HEF.ALL(F `MAS))
            $G  ~?(?=(^ G.HEF.ALL) %DOUBLE-MASS-G HEF.ALL(G `MAS))
            $J  ~?(?=(^ J.HEF.ALL) %DOUBLE-MASS-J HEF.ALL(J `MAS))
          ==
        ::  IF NOT ALL VANES HAVE RESPONDED YET, NO-OP
        ::
        ?.  ?&  ?=(^ A.HEF.ALL)
                ?=(^ B.HEF.ALL)
                ?=(^ C.HEF.ALL)
                ?=(^ E.HEF.ALL)
                ?=(^ F.HEF.ALL)
                ?=(^ G.HEF.ALL)
                ?=(^ J.HEF.ALL)
            ==
          +>.$
        ::  CLEAR VANE REPORTS FROM OUR STATE BEFORE WEIGHING OURSELF
        ::
        ::    OTHERWISE, THE STATE OF VANES PRINTED AFTER THIS ONE GET ABSORBED
        ::    INTO DILL'S %DOT CATCHALL REPORT.
        ::
        =/  VEN=(LIST MASS)  ~[U.A U.B U.C U.E U.G U.F U.J]:HEF.ALL
        =>  .(HEF.ALL [~ ~ ~ ~ ~ ~ ~])
        ::  WEGH OURSELF NOW THAT OUR STATE DOESN'T INCLUDE OTHER MASSES
        ::
        =/  SELF=MASS
          :+  %DILL  %|
          :~  HEY+&+HEY.ALL
              DUG+&+DUG.ALL
              DOT+&+ALL
          ==
        ::  PRODUCE THE MEMORY REPORT FOR ALL VANES
        ::
        (DONE %MASS %VANES %| [SELF VEN])
      --
    ::
    ++  AX                                              ::  MAKE ++AS
      |=  HEN/DUCT
      ^-  (UNIT _AS)
      =/  NUX  (~(GET BY DUG.ALL) HEN)
      ?~  NUX  ~
      (SOME ~(. AS HEN U.NUX))
    --
|%                                                      ::  POKE+PEEK PATTERN
++  CALL                                                ::  HANDLE REQUEST
  |=  $:  HEN=DUCT
          TYPE=*
          WRAPPED-TASK=(HOBO TASK:ABLE)
      ==
  ^+  [*(LIST MOVE) ..^$]
  =/  TASK=TASK:ABLE
    ?.  ?=(%SOFT -.WRAPPED-TASK)
      WRAPPED-TASK
    ((HARD TASK:ABLE) P.WRAPPED-TASK)
  ::  THE BOOT EVENT PASSES THRU %DILL FOR INITIAL DUCT DISTRIBUTION
  ::
  ?:  ?=(%BOOT -.TASK)
    ?>  ?=(?(%DAWN %FAKE) -.P.TASK)
    ?>  =(~ HEY.ALL)
    =.  HEY.ALL  `HEN
    =/  BOOT  ((SOFT NOTE-JAEL) P.TASK)
    ?~  BOOT
      ~|  INVALID-BOOT-EVENT+HEN  !!
    :_(..^$ [HEN %PASS / %J U.BOOT]~)
  ::  WE ARE SUBSEQUENTLY INITIALIZED. SINGLE-HOME
  ::
  ?:  ?=(%INIT -.TASK)
    ?>  =(~ DUG.ALL)
    ::  CONFIGURE NEW TERMINAL, SETUP :HOOD AND %CLAY
    ::
    =*  DUC  (NEED HEY.ALL)
    =/  APP  %HOOD
    =/  SEE  (TUBA "<AWAITING {(TRIP APP)}, THIS MAY TAKE A MINUTE>")
    =/  ZON=AXON  [APP INPUT=[~ ~] WIDTH=80 CURSOR=0 SEE]
    ::
    =^  MOZ  ALL  ABET:(~(INTO AS DUC ZON) ~)
    [MOZ ..^$]
  ::  %FLOG TASKS ARE UNWRAPPED AND SENT BACK TO US ON OUR DEFAULT DUCT
  ::
  ?:  ?=(%FLOG -.TASK)
    ?~  HEY.ALL
      [~ ..^$]
    ::  THIS LETS LIB/HELM SEND %HEFT A LA |MASS
    ::
    =?  P.TASK  ?=([%CRUD %HAX-HEFT ~] P.TASK)  [%HEFT ~]
    ::
    $(HEN U.HEY.ALL, WRAPPED-TASK P.TASK)
  ::  A %SUNK NOTIFICATION FROM %JAIL COMES IN ON AN UNFAMILIAR DUCT
  ::
  ?:  ?=(%SUNK -.TASK)
    [~ ..^$]
  ::  A %VEGA NOTIFICATION ON KERNEL UPGRADE COMES IN ON AN UNFAMILIAR DUCT
  ::
  ?:  ?=(%VEGA -.TASK)
    [~ ..^$]
  ::
  =/  NUS  (AX HEN)
  ?~  NUS
    ::  :HEN IS AN UNRECOGNIZED DUCT
    ::  COULD BE BEFORE %BOOT (OR %BOOT FAILED)
    ::
    ~&  [%DILL-CALL-NO-FLOW HEN -.TASK]
    =/  TAN  ?:(?=(%CRUD -.TASK) Q.TASK ~)
    [((SLOG (FLOP TAN)) ~) ..^$]
  ::
  =^  MOZ  ALL  ABET:(CALL:U.NUS TASK)
  [MOZ ..^$]
::
++  LOAD                                                ::  TRIVIAL
  |=  OLD/ALL-AXLE
  ..^$(ALL OLD)
::
++  SCRY
  |=  {FUR/(UNIT (SET MONK)) REN/@TAS WHY/SHOP SYD/DESK LOT/COIN TYL/PATH}
  ^-  (UNIT (UNIT CAGE))
  ?.  ?=(%& -.WHY)  ~
  =*  HIS  P.WHY
  [~ ~]
::
++  STAY  ALL
::
++  TAKE                                                ::  PROCESS MOVE
  |=  {TEA/WIRE HEN/DUCT HIN/(HYPO SIGN)}
  ^+  [*(LIST MOVE) ..^$]
  =/  NUS  (AX HEN)
  ?~  NUS
    ::  :HEN IS AN UNRECOGNIZED DUCT
    ::  COULD BE BEFORE %BOOT (OR %BOOT FAILED)
    ::
    ~&  [%DILL-TAKE-NO-FLOW HEN -.Q.HIN +<.Q.HIN]
    [~ ..^$]
  =^  MOZ  ALL  ABET:(TAKE:U.NUS Q.HIN)
  [MOZ ..^$]
--
