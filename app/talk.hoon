::                                                      ::  ::
::::  /APP/TALK/HOON                                    ::  ::
  ::                                                    ::  ::
::
::TODO  MAYBE KEEP TRACK OF RECEIVED GRAMS PER CIRCLE, TOO?
::
::TODO  [TYPE QUERY] => [PRESS TAB TO CYCLE SEARCH RESULTS, NEWEST-FIRST]
::      => [ESCAPE TO CLEAR]
::
::  THIS CLIENT IMPLEMENTATION MAKES USE OF THE %INBOX
::  FOR ALL ITS SUBSCRIPTIONS AND MESSAGING. ALL
::  RUMORS RECEIVED ARE EXCLUSIVELY ABOUT THE %INBOX,
::  SINCE THAT'S THE ONLY THING THE CLIENT EVER
::  SUBSCRIBES TO.
::
/-    SOLE-SUR=SOLE                                     ::  STRUCTURES
/+    *HALL, SOLE-LIB=SOLE                              ::  LIBRARIES
/=    SEED  /~  !>(.)
::
::::
  ::
=>  ::  #
    ::  #  %ARCH
    ::  #
    ::    DATA STRUCTURES
    ::
    |%
    ++  STATE                                           ::  APPLICATION STATE
      $:  ::  MESSAGING STATE                           ::
          GRAMS/(LIST TELEGRAM)                         ::  ALL HISTORY
          KNOWN/(MAP SERIAL @UD)                        ::  MESSAGES HEARD
          LAST/@UD                                      ::  LAST HEARD
          COUNT/@UD                                     ::  (LENT GRAMS)
          SOURCES/(SET CIRCLE)                          ::  OUR SUBSCRIPTIONS
          ::  CIRCLE DETAILS                            ::
          REMOTES/(MAP CIRCLE GROUP)                    ::  REMOTE PRESENCES
          MIRRORS/(MAP CIRCLE CONFIG)                   ::  REMOTE CONFIGS
          ::  UI STATE                                  ::
          NICKS/(MAP SHIP NICK)                         ::  HUMAN IDENTITIES
          BOUND/(MAP AUDIENCE CHAR)                     ::  BOUND CIRCLE GLYPHS
          BINDS/(JUG CHAR AUDIENCE)                     ::  CIRCLE GLYPH LOOKUP
          CLI/SHELL                                     ::  INTERACTION STATE
      ==                                                ::
    ++  SHELL                                           ::  CONSOLE SESSION
      $:  ID/BONE                                       ::  IDENTIFIER
          LATEST/@UD                                    ::  LATEST SHOWN MSG NUM
          SAY/SOLE-SHARE:SOLE-SUR                       ::  CONSOLE STATE
          ACTIVE/AUDIENCE                               ::  ACTIVE TARGETS
          SETTINGS/(SET TERM)                           ::  FRONTEND SETTINGS
          WIDTH/@UD                                     ::  DISPLAY WIDTH
          TIMEZ/(PAIR ? @UD)                            ::  TIMEZONE ADJUSTMENT
      ==                                                ::
    ++  MOVE  (PAIR BONE CARD)                          ::  ALL ACTIONS
    ++  LIME                                            ::  DIFF FRUIT
      $%  {$SOLE-EFFECT SOLE-EFFECT:SOLE-SUR}           ::
      ==                                                ::
    ++  PEAR                                            ::  POKE FRUIT
      $%  {$HALL-COMMAND COMMAND}                       ::
          {$HALL-ACTION ACTION}                         ::
      ==                                                ::
    ++  CARD                                            ::  GENERAL CARD
      $%  {$DIFF LIME}                                  ::
          {$POKE WIRE DOCK PEAR}                        ::
          {$PEER WIRE DOCK PATH}                        ::
          {$PULL WIRE DOCK ~}                          ::
      ==                                                ::
    ++  WORK                                            ::  INTERFACE ACTION
      $%  ::  CIRCLE MANAGEMENT                         ::
          {$JOIN (MAP CIRCLE RANGE)}                    ::  SUBSCRIBE TO
          {$LEAVE AUDIENCE}                             ::  UNSUBSCRIBE FROM
          {$CREATE SECURITY NAME CORD}                  ::  CREATE CIRCLE
          {$DELETE NAME (UNIT CORD)}                    ::  DELETE CIRCLE
          {$DEPICT NAME CORD}                           ::  CHANGE DESCRIPTION
          {$FILTER NAME ? ?}                            ::  CHANGE MESSAGE RULES
          {$INVITE NAME (SET SHIP)}                     ::  GIVE PERMISSION
          {$BANISH NAME (SET SHIP)}                     ::  DENY PERMISSION
          {$SOURCE NAME (MAP CIRCLE RANGE)}             ::  ADD SOURCE
          {$UNSOURCE NAME (MAP CIRCLE RANGE)}           ::  REMOVE SOURCE
          {$READ NAME @UD}                              ::  SET READ COUNT
          ::  PERSONAL METADATA                         ::
          {$ATTEND AUDIENCE (UNIT PRESENCE)}            ::  SET OUR PRESENCE
          {$NAME AUDIENCE HUMAN}                        ::  SET OUR NAME
          ::  MESSAGING                                 ::
          {$SAY (LIST SPEECH)}                          ::  SEND MESSAGE
          {$EVAL CORD HOON}                             ::  SEND #-MESSAGE
          {$TARGET P/AUDIENCE Q/(UNIT WORK)}            ::  SET ACTIVE TARGETS
          {$REPLY $@(@UD {@U @UD}) (LIST SPEECH)}       ::  REPLY TO
          ::  DISPLAYING INFO                           ::
          {$NUMBER $@(@UD {@U @UD})}                    ::  RELATIVE/ABSOLUTE
          {$WHO AUDIENCE}                               ::  PRESENCE
          {$WHAT (UNIT $@(CHAR AUDIENCE))}              ::  SHOW BOUND GLYPH
          {$CIRCLES ~}                                 ::  SHOW OUR CIRCLES
          {$SOURCES CIRCLE}                             ::  SHOW ACTIVE SOURCES
          ::  UI SETTINGS                               ::
          {$BIND CHAR (UNIT AUDIENCE)}                  ::  BIND GLYPH
          {$UNBIND CHAR (UNIT AUDIENCE)}                ::  UNBIND GLYPH
          {$NICK (UNIT SHIP) (UNIT CORD)}               ::  UN/SET/SHOW NICK
          {$SET TERM}                                   ::  ENABLE SETTING
          {$UNSET TERM}                                 ::  DISABLE SETTING
          {$WIDTH @UD}                                  ::  CHANGE DISPLAY WIDTH
          {$TIMEZ ? @UD}                                ::  ADJUST SHOWN TIMES
          ::  MISCELLANEOUS                             ::
          {$SHOW CIRCLE}                                ::  SHOW MEMBERSHIP
          {$HIDE CIRCLE}                                ::  HIDE MEMBERSHIP
          {$HELP ~}                                    ::  PRINT USAGE INFO
      ==                                                ::
    ++  GLYPHS  `WALL`~[">=+-" "}),." "\"'`^" "$%&@"]   ::  CIRCLE CHAR POOL '
    --
::
::  #
::  #  %WORK
::  #
::    FUNCTIONAL CORES AND ARMS.
::
|_  {BOL/BOWL:GALL $1 STATE}
::
::  #  %TRANSITION
::    PREP TRANSITION
+|  %TRANSITION
::
++  PREP
  ::  ADAPTS STATE
  ::
  =>  |%
      ++  STATES
        $%({$1 S/STATE} {$0 S/STATE-0})
      ::
      ++  STATE-0
        (CORK STATE |=(A/STATE A(MIRRORS (~(RUN BY MIRRORS.A) CONFIG-0))))
      ++  CONFIG-0
        {SRC/(SET SOURCE-0) CAP/CORD TAG/TAGS FIT/FILTER CON/CONTROL}
      ++  SOURCE-0
        {CIR/CIRCLE RAN/RANGE-0}
      ++  RANGE-0
        %-  UNIT
        $:  HED/PLACE-0
            TAL/(UNIT PLACE-0)
        ==
      ++  PLACE-0
        $%  {$DA @DA}
            {$UD @UD}
            {$SD @SD}
        ==
      --
  =|  MOS/(LIST MOVE)
  |=  OLD/(UNIT STATES)
  ^-  (QUIP MOVE _..PREP)
  ?~  OLD
    TA-DONE:TA-INIT:TA
  ?-  -.U.OLD
      $1
    [MOS ..PREP(+<+ U.OLD)]
  ::
      $0
    =.  MOS  [[OST.BOL %PULL /SERVER/INBOX SERVER ~] PEER-INBOX MOS]
    =-  $(OLD `[%1 S.U.OLD(MIRRORS -)])
    |^
      (~(RUN BY MIRRORS.S.U.OLD) PREP-CONFIG)
    ::
    ++  PREP-CONFIG
      |=  COF/CONFIG-0
      ^-  CONFIG
      =.  SRC.COF
        %-  ~(GAS IN *(SET SOURCE))
        (MURN ~(TAP IN SRC.COF) PREP-SOURCE)
      :*  SRC.COF
          CAP.COF
          TAG.COF
          FIT.COF
          CON.COF
          0
      ==
    ::
    ++  PREP-SOURCE
      |=  SRC/SOURCE-0
      ^-  (UNIT SOURCE)
      =+  NAN=(PREP-RANGE RAN.SRC)
      ?~  NAN
        ~&  [%FORGETTING-SOURCE SRC]
        ~
      `SRC(RAN U.NAN)
    ::
    ++  PREP-RANGE
      |=  RAN/RANGE-0
      ^-  (UNIT RANGE)
      ?~  RAN  `RAN
      ::  RANGES WITH A RELATIVE END AREN'T STORED BECAUSE THEY END
      ::  IMMEDIATELY, SO IF WE FIND ONE WE CAN SAFELY DISCARD IT.
      ?:  ?=({$~ {$SD @SD}} TAL.U.RAN)  ~
      ::  WE REPLACE RELATIVE RANGE STARTS WITH THE CURRENT DATE.
      ::  THIS IS PRACTICALLY CORRECT.
      ?:  ?=({$SD @SD} HED.U.RAN)
        `RAN(HED.U [%DA NOW.BOL])
      `RAN
    --
  ==
::
::  #
::  #  %UTILITY
::  #
::    SMALL UTILITY FUNCTIONS.
+|  %UTILITY
::
++  SELF
  (TRUE-SELF [OUR NOW OUR]:BOL)
::
++  SERVER
  ::  OUR HALL INSTANCE
  ^-  DOCK
  [SELF %HALL]
::
++  INBOX
  ::    CLIENT'S CIRCLE NAME
  ::
  ::  PRODUCES THE NAME OF THE CIRCLE USED BY THIS
  ::  CLIENT FOR ALL ITS OPERATIONS
  ^-  NAME
  %INBOX
::
++  INCIR
  ::    CLIENT'S CIRCLE
  ::
  ::  ++INBOX, EXCEPT A FULL CIRCLE.
  ^-  CIRCLE
  [SELF INBOX]
::
++  RENUM
  ::  FIND THE GRAMS LIST INDEX FOR GRAM WITH SERIAL.
  |=  SER/SERIAL
  ^-  (UNIT @UD)
  =+  NUM=(~(GET BY KNOWN) SER)
  ?~  NUM  ~
  `(SUB COUNT +(U.NUM))
::
++  RECALL
  ::  FIND A KNOWN GRAM WITH SERIAL {SER}.
  |=  SER/SERIAL
  ^-  (UNIT TELEGRAM)
  =+  NUM=(RENUM SER)
  ?~  NUM  ~
  `(SNAG U.NUM GRAMS)
::
++  BOUND-FROM-BINDS
  ::    BOUND FROM BINDS
  ::
  ::  USING A MAPPING OF CHARACTER TO AUDIENCES, CREATE
  ::  A MAPPING OF AUDIENCE TO CHARACTER.
  ::
  |:  BIN=BINDS
  ^+  BOUND
  %-  ~(GAS BY *(MAP AUDIENCE CHAR))
  =-  (ZING -)
  %+  TURN  ~(TAP BY BIN)
  |=  {A/CHAR B/(SET AUDIENCE)}
  (TURN ~(TAP BY B) |=(C/AUDIENCE [C A]))
::
++  GLYPH
  ::  FINDS A NEW GLYPH FOR ASSIGNMENT.
  ::
  |=  IDX/@
  =<  CHA
  %+  REEL  GLYPHS
  |=  {ALL/TAPE OLE/{CHA/CHAR NUM/@}}
  =+  NEW=(SNAG (MOD IDX (LENT ALL)) ALL)
  =+  NUM=~(WYT IN (~(GET JU BINDS) NEW))
  ?~  CHA.OLE  [NEW NUM]
  ?:  (LTH NUM.OLE NUM)
    OLE
  [NEW NUM]
::
++  PEER-CLIENT
  ::  UI STATE PEER MOVE
  ^-  MOVE
  :*  OST.BOL
      %PEER
      /SERVER/CLIENT
      SERVER
      /CLIENT
  ==
::
++  PEER-INBOX
  ^-  MOVE
  :*  OST.BOL
      %PEER
      /SERVER/INBOX
      SERVER
    ::
      %+  WELP  /CIRCLE/[INBOX]/GRAMS/CONFIG/GROUP
      ?.  =(0 COUNT)
        [(SCOT %UD LAST) ~]
      =+  HISTORY-MSGS=200
      [(CAT 3 '-' (SCOT %UD HISTORY-MSGS)) ~]
  ==
::
::  #
::  #  %ENGINES
::  #
::    MAIN CORES.
+|  %ENGINES
::
++  TA
  ::    PER TRANSACTION
  ::
  ::  FOR EVERY TRANSACTION/EVENT (POKE, PEER ETC.)
  ::  TALK RECEIVES, THE ++TA TRANSACTION CORE IS
  ::  CALLED.
  ::  IN PROCESSING TRANSACTIONS, ++TA MAY MODIFY APP
  ::  STATE, OR CREATE MOVES. THESE MOVES GET PRODUCED
  ::  UPON FINALIZING THE CORE'S WITH WITH ++TA-DONE.
  ::  WHEN MAKING CHANGES TO THE SHELL, THE ++SH CORE IS
  ::  USED.
  ::
  |_  ::  MOVES:  MOVES CREATED BY CORE OPERATIONS.
      ::
      MOVES/(LIST MOVE)
  ::
  ::  #  %RESOLVE
  +|  %RESOLVE
  ::
  ++  TA-DONE
    ::    RESOLVE CORE
    ::
    ::  PRODUCES THE MOVES STORED IN ++TA'S MOVES.
    ::  %SOLE-EFFECT MOVES GET SQUASHED INTO A %MOR.
    ::
    ^+  [*(LIST MOVE) +>]
    :_  +>
    ::  SEPERATE OUR SOLE-EFFECTS FROM OTHER MOVES.
    =/  YOP
      |-  ^-  (PAIR (LIST MOVE) (LIST SOLE-EFFECT:SOLE-SUR))
      ?~  MOVES  [~ ~]
      =+  MOR=$(MOVES T.MOVES)
      ?:  ?&  =(ID.CLI P.I.MOVES)
              ?=({$DIFF $SOLE-EFFECT *} Q.I.MOVES)
          ==
        [P.MOR [+>.Q.I.MOVES Q.MOR]]
      [[I.MOVES P.MOR] Q.MOR]
    ::  FLOP MOVES, FLOP AND SQUASH SOLE-EFFECTS INTO A %MOR.
    =+  MOZ=(FLOP P.YOP)
    =/  FOC/(UNIT SOLE-EFFECT:SOLE-SUR)
      ?~  Q.YOP  ~
      ?~  T.Q.YOP  `I.Q.YOP                             ::  SINGLE SOLE-EFFECT
      `[%MOR (FLOP Q.YOP)]                              ::  MORE SOLE-EFFECTS
    ::  PRODUCE MOVES OR SOLE-EFFECTS AND MOVES.
    ?~  FOC  MOZ
    ?~  ID.CLI  ~&(%CLIENT-NO-SOLE MOZ)
    [[ID.CLI %DIFF %SOLE-EFFECT U.FOC] MOZ]
  ::
  ::  #
  ::  #  %EMITTERS
  ::  #
  ::    ARMS THAT CREATE OUTWARD CHANGES.
  +|  %EMITTERS
  ::
  ++  TA-EMIL
    ::    EMIT MOVE LIST
    ::
    ::  ADDS MULTIPLE MOVES TO THE CORE'S LIST.
    ::  FLOPS TO EMULATE ++TA-EMIT.
    ::
    |=  MOL/(LIST MOVE)
    %_(+> MOVES (WELP (FLOP MOL) MOVES))
  ::
  ++  TA-EMIT
    ::  ADDS A MOVE TO THE CORE'S LIST.
    ::
    |=  MOV/MOVE
    %_(+> MOVES [MOV MOVES])
  ::
  ::  #
  ::  #  %INTERACTION-EVENTS
  ::  #
  ::    ARMS THAT APPLY EVENTS WE RECEIVED.
  +|  %INTERACTION-EVENTS
  ::
  ++  TA-INIT
    ::  SUBSCRIBES TO OUR HALL.
    ::
    %-  TA-EMIL
    ^-  (LIST MOVE)
    ~[PEER-CLIENT PEER-INBOX]
  ::
  ++  TA-TAKE
    ::  ACCEPT PRIZE
    ::
    |=  PIZ/PRIZE
    ^+  +>
    ?+  -.PIZ  +>
        $CLIENT
      %=  +>
        BINDS   GYS.PIZ
        BOUND   (BOUND-FROM-BINDS GYS.PIZ)
        NICKS   NIS.PIZ
      ==
    ::
        $CIRCLE
      %.  NES.PIZ
      %=  TA-UNPACK
        SOURCES   (~(RUN IN SRC.LOC.COS.PIZ) HEAD)
        MIRRORS   (~(PUT BY REM.COS.PIZ) INCIR LOC.COS.PIZ)
        REMOTES   (~(PUT BY REM.PES.PIZ) INCIR LOC.PES.PIZ)
      ==
    ==
  ::
  ++  TA-HEAR
    ::  APPLY CHANGE
    ::
    |=  RUM/RUMOR
    ^+  +>
    ?+  -.RUM  +>
        $CLIENT
      ?-  -.RUM.RUM
          $GLYPH
        (TA-CHANGE-GLYPH +.RUM.RUM)
      ::
          $NICK
        +>(NICKS (CHANGE-NICKS NICKS WHO.RUM.RUM NIC.RUM.RUM))
      ==
    ::
        $CIRCLE
      (TA-CHANGE-CIRCLE RUM.RUM)
    ==
  ::
  ++  TA-CHANGE-CIRCLE
    ::  APPLY CIRCLE CHANGE
    ::
    |=  RUM/RUMOR-STORY
    ^+  +>
    ?+  -.RUM
        ~&([%UNEXPECTED-CIRCLE-RUMOR -.RUM] +>)
    ::
        $GRAM
      (TA-OPEN NEV.RUM)
    ::
        $CONFIG
      =+  CUR=(FALL (~(GET BY MIRRORS) CIR.RUM) *CONFIG)
      =.  +>.$
        =<  SH-DONE
        %-  ~(SH-SHOW-CONFIG SH CLI)
        [CIR.RUM CUR DIF.RUM]
      =?  +>.$
          ?&  ?=($SOURCE -.DIF.RUM)
              ADD.DIF.RUM
              =(CIR.RUM INCIR)
          ==
        =*  CIR  CIR.SRC.DIF.RUM
        =+  REN=~(CR-PHAT CR CIR)
        =+  GYF=(~(GET BY BOUND) [CIR ~ ~])
        =<  SH-DONE
        =/  SHO
          ::  ONLY PRESENT IF WE'RE HERE INDEFINITELY.
          =*  RAN  RAN.SRC.DIF.RUM
          ?.  |(?=(~ RAN) ?=(~ TAL.U.RAN))
            ~(. SH CLI)
          %-  ~(SH-ACT SH CLI)
          [%NOTIFY [CIR ~ ~] `%HEAR]
        ?^  GYF
          (SH-NOTE:SHO "HAS GLYPH {[U.GYF ~]} FOR {REN}")
        ::  WE USE THE RENDERED CIRCLE NAME TO DETERMINE
        ::  THE GLYPH FOR HIGHER GLYPH CONSISTENCY WHEN
        ::  FEDERATING.
        =+  CHA=(GLYPH (MUG REN))
        (SH-WORK:SHO %BIND CHA `[CIR ~ ~])
      %=  +>.$
          SOURCES
        ?.  &(?=($SOURCE -.DIF.RUM) =(CIR.RUM INCIR))
          SOURCES
        %.  CIR.SRC.DIF.RUM
        ?:  ADD.DIF.RUM
          ~(PUT IN SOURCES)
        ~(DEL IN SOURCES)
      ::
          MIRRORS
        ?:  ?=($REMOVE -.DIF.RUM)  (~(DEL BY MIRRORS) CIR.RUM)
        %+  ~(PUT BY MIRRORS)  CIR.RUM
        (CHANGE-CONFIG CUR DIF.RUM)
      ==
    ::
        $STATUS
      =+  REM=(FALL (~(GET BY REMOTES) CIR.RUM) *GROUP)
      =+  CUR=(FALL (~(GET BY REM) WHO.RUM) *STATUS)
      =.  +>.$
        =<  SH-DONE
        %-  ~(SH-SHOW-STATUS SH CLI)
        [CIR.RUM WHO.RUM CUR DIF.RUM]
      %=  +>.$
          REMOTES
        %+  ~(PUT BY REMOTES)  CIR.RUM
        ?:  ?=($REMOVE -.DIF.RUM)  (~(DEL BY REM) WHO.RUM)
        %+  ~(PUT BY REM)  WHO.RUM
        (CHANGE-STATUS CUR DIF.RUM)
      ==
    ==
  ::
  ++  TA-CHANGE-GLYPH
    ::  APPLIES NEW SET OF GLYPH BINDINGS.
    ::
    |=  {BIN/? GYF/CHAR AUD/AUDIENCE}
    ^+  +>
    =+  NEK=(CHANGE-GLYPHS BINDS BIN GYF AUD)
    ?:  =(NEK BINDS)  +>.$                              ::  NO CHANGE
    =.  BINDS  NEK
    =.  BOUND  (BOUND-FROM-BINDS NEK)
    SH-DONE:~(SH-PROD SH CLI)
  ::
  ::  #
  ::  #  %MESSAGES
  ::  #
  ::    STORING AND UPDATING MESSAGES.
  +|  %MESSAGES
  ::
  ++  TA-UNPACK
    ::    OPEN ENVELOPES
    ::
    ::  THE CLIENT CURRENTLY DOESN'T CARE ABOUT NUMS.
    ::
    |=  NES/(LIST ENVELOPE)
    ^+  +>
    ?~  NES  +>
    $(NES T.NES, +> (TA-OPEN I.NES))
  ::
  ++  TA-OPEN
    ::  LEARN MESSAGE FROM AN ENVELOPE.
    ::
    |=  NEV/ENVELOPE
    ^+  +>
    =?  LAST  (GTH NUM.NEV LAST)  NUM.NEV
    (TA-LEARN GAM.NEV)
  ::
  ++  TA-LEARN
    ::    SAVE/UPDATE MESSAGE
    ::
    ::  STORE AN INCOMING TELEGRAM, UPDATING IF IT
    ::  ALREADY EXISTS.
    ::
    |=  GAM/TELEGRAM
    ^+  +>
    =+  OLD=(RENUM UID.GAM)
    ?~  OLD
      (TA-APPEND GAM)                                ::  ADD
    (TA-REVISE U.OLD GAM)                            ::  MODIFY
  ::
  ++  TA-APPEND
    ::  STORE A NEW TELEGRAM.
    ::
    |=  GAM/TELEGRAM
    ^+  +>
    =:  GRAMS  [GAM GRAMS]
        COUNT  +(COUNT)
        KNOWN  (~(PUT BY KNOWN) UID.GAM COUNT)
    ==
    =<  SH-DONE
    (~(SH-GRAM SH CLI) GAM)
  ::
  ++  TA-REVISE
    ::  MODIFY A TELEGRAM WE KNOW.
    ::
    |=  {NUM/@UD GAM/TELEGRAM}
    =+  OLD=(SNAG NUM GRAMS)
    ?:  =(GAM OLD)  +>.$                                ::  NO CHANGE
    =.  GRAMS
      %+  WELP
      (SCAG NUM GRAMS)
      [GAM (SLAG +(NUM) GRAMS)]
    ?:  =(SEP.GAM SEP.OLD)  +>.$                        ::  NO WORTHY CHANGE
    =<  SH-DONE
    (~(SH-GRAM SH CLI) GAM)
  ::
  ::  #
  ::  #  %CONSOLE
  ::  #
  ::    ARMS FOR SHELL FUNCTIONALITY.
  +|  %CONSOLE
  ::
  ++  TA-CONSOLE
    ::  INITIALIZE THE SHELL OF THIS CLIENT.
    ::
    ^+  .
    =|  SHE/SHELL
    =.  ID.SHE  OST.BOL
    ::  XXX: +SY SHOULD BE SMARTER THAN THIS
    =/  CIRCLE-LIST=(LIST CIRCLE)  [INCIR ~]
    =.  ACTIVE.SHE  (SY CIRCLE-LIST)
    =.  WIDTH.SHE  80
    SH-DONE:~(SH-PROD SH SHE)
  ::
  ++  TA-SOLE
    ::  APPLY SOLE INPUT
    ::
    |=  ACT/SOLE-ACTION:SOLE-SUR
    ^+  +>
    ?.  =(ID.CLI OST.BOL)
      ~&(%STRANGE-SOLE !!)
    SH-DONE:(~(SH-SOLE SH CLI) ACT)
  ::
  ++  SH
    ::    PER CONSOLE
    ::
    ::  SHELL CORE, RESPONSIBLE FOR HANDLING USER INPUT
    ::  AND THE RELATED ACTIONS, AND OUTPUTTING CHANGES
    ::  TO THE CLI.
    ::
    |_  $:  ::  SHE: CONSOLE STATE.
            ::
            SHE/SHELL
        ==
    ::
    ::  #  %RESOLVE
    +|  %RESOLVE
    ::
    ++  SH-DONE
      ::  STORES CHANGES TO THE CLI.
      ::
      ^+  +>
      +>(CLI SHE)
    ::
    ::  #
    ::  #  %EMITTERS
    ::  #
    ::    ARMS THAT CREATE OUTWARD CHANGES.
    +|  %EMITTERS
    ::
    ++  SH-FACT
      ::  ADDS A CONSOLE EFFECT TO ++TA'S MOVES.
      ::
      |=  FEC/SOLE-EFFECT:SOLE-SUR
      ^+  +>
      +>(MOVES [[ID.SHE %DIFF %SOLE-EFFECT FEC] MOVES])
    ::
    ++  SH-ACT
      ::  ADDS AN ACTION TO ++TA'S MOVES.
      ::
      |=  ACT/ACTION
      ^+  +>
      %=  +>
          MOVES
        :_  MOVES
        :*  OST.BOL
            %POKE
            /CLIENT/ACTION
            SERVER
            [%HALL-ACTION ACT]
        ==
      ==
    ::
    ::  #
    ::  #  %CLI-INTERACTION
    ::  #
    ::    PROCESSING USER INPUT AS IT HAPPENS.
    +|  %CLI-INTERACTION
    ::
    ++  SH-SOLE
      ::  APPLIES SOLE ACTION.
      ::
      |=  ACT/SOLE-ACTION:SOLE-SUR
      ^+  +>
      ?-  -.ACT
        $DET  (SH-EDIT +.ACT)
        $CLR  ..SH-SOLE :: (SH-PACT ~) :: XX CLEAR TO PM-TO-SELF?
        $RET  SH-OBEY
      ==
    ::
    ++  SH-EDIT
      ::    APPLY SOLE EDIT
      ::
      ::  CALLED WHEN TYPING INTO THE CLI PROMPT.
      ::  APPLIES THE CHANGE AND DOES SANITIZING.
      ::
      |=  CAL/SOLE-CHANGE:SOLE-SUR
      ^+  +>
      =^  INV  SAY.SHE  (~(TRANSCEIVE SOLE-LIB SAY.SHE) CAL)
      =+  FIX=(SH-SANE INV BUF.SAY.SHE)
      ?~  LIT.FIX
        +>.$
      :: JUST CAPITAL CORRECTION
      ?~  ERR.FIX
        (SH-SLUG FIX)
      :: ALLOW INTERIOR EDITS AND DELETES
      ?.  &(?=($DEL -.INV) =(+(P.INV) (LENT BUF.SAY.SHE)))
        +>.$
      (SH-SLUG FIX)
    ::
    ++  SH-READ
      ::    COMMAND PARSER
      ::
      ::  PARSES THE COMMAND LINE BUFFER. PRODUCES WORK
      ::  ITEMS WHICH CAN BE EXECUTED BY ++SH-WORK.
      ::
      =<  WORK
      ::  #  %PARSERS
      ::    VARIOUS PARSERS FOR COMMAND LINE INPUT.
      |%
      ++  EXPR
        ::  [CORD HOON]
        |=  TUB/NAIL  %.  TUB
        %+  STAG  (CRIP Q.TUB)
        WIDE:(VANG & [&1:% &2:% (SCOT %DA NOW.BOL) |3:%])
      ::
      ++  DARE
        ::  @DR
        %+  SEAR
          |=  A/COIN
          ?.  ?=({$$ $DR @} A)  ~
          (SOME `@DR`+>.A)
        NUCK:SO
      ::
      ++  SHIP  ;~(PFIX SIG FED:AG)                     ::  SHIP
      ++  SHIZ                                          ::  SHIP SET
        %+  COOK
          |=(A/(LIST ^SHIP) (~(GAS IN *(SET ^SHIP)) A))
        (MOST ;~(PLUG COM (STAR ACE)) SHIP)
      ::
      ++  CIRE                                          ::  LOCAL CIRCLE
        ;~(PFIX CEN URS:AB)
      ::
      ++  CIRC                                          ::  CIRCLE
        ;~  POSE
          (COLD INCIR COL)
          ;~(PFIX CEN (STAG SELF URS:AB))
          ;~(PFIX NET (STAG (^SEIN:TITLE SELF) URS:AB))
        ::
          %+  COOK
            |=  {A/@P B/(UNIT TERM)}
            [A ?^(B U.B %INBOX)]
          ;~  PLUG
            SHIP
            (PUNT ;~(PFIX NET URS:AB))
          ==
        ==
      ::
      ++  CIRCLES-FLAT                                  ::  COLLAPSE MIXED LIST
        |=  A/(LIST (EACH CIRCLE (SET CIRCLE)))
        ^-  (SET CIRCLE)
        ?~  A  ~
        ?-  -.I.A
          %&  (~(PUT IN $(A T.A)) P.I.A)
          %|  (~(UNI IN $(A T.A)) P.I.A)
        ==
      ::
      ++  CIRS                                          ::  NON-EMPTY CIRCLES
        %+  COOK  CIRCLES-FLAT
        %+  MOST  ;~(PLUG COM (STAR ACE))
        (^PICK CIRC (SEAR SH-GLYF GLYPH))
      ::
      ++  DRAT
        ::  @DA OR @DR
        ::
        ::  PAS: WHETHER @DR'S ARE IN THE PAST OR NOT.
        |=  PAS/?
        =-  ;~(PFIX SIG (SEAR - CRUB:SO))
        |=  A/^DIME
        ^-  (UNIT @DA)
        ?+  P.A  ~
          $DA   `Q.A
          $DR   :-  ~
                %.  [NOW.BOL Q.A]
                ?:(PAS SUB ADD)
        ==
      ::
      ++  PONT                                          ::  POINT FOR RANGE
        ::  HED: WHETHER THIS IS THE HEAD OR TAIL POINT.
        |=  HED/?
        ;~  POSE
          (COLD [%DA NOW.BOL] (JEST 'NOW'))
          (STAG %DA (DRAT HED))
          PLACER
        ==
      ::
      ++  RANG                                          ::  SUBSCRIPTION RANGE
        =+  ;~  POSE
              (COOK SOME ;~(PFIX NET (PONT |)))
              (EASY ~)
            ==
        ;~  POSE
          (COOK SOME ;~(PLUG ;~(PFIX NET (PONT &)) -))
          (EASY ~)
        ==
      ::
      ++  SORZ                                          ::  NON-EMPTY SOURCES
        %+  COOK  ~(GAS BY *(MAP CIRCLE RANGE))
        (MOST ;~(PLUG COM (STAR ACE)) ;~(PLUG CIRC RANG))
      ::
      ++  PICK                                          ::  MESSAGE REFERENCE
        ;~(POSE NUMP (COOK LENT (STAR MIC)))
      ::
      ++  NUMP                                          ::  NUMBER REFERENCE
        ;~  POSE
          ;~(PFIX HEP DEM:AG)
          ;~  PLUG
            (COOK LENT (PLUS (JUST '0')))
            ;~(POSE DEM:AG (EASY 0))
          ==
          (STAG 0 DEM:AG)
        ==
      ::
      ++  PORE                                          ::  SECURITY
        (PERK %CHANNEL %VILLAGE %JOURNAL %MAILBOX ~)
      ::
      ++  LOBE                                          ::  Y/N LOOB
        ;~  POSE
          (COLD %& ;~(POSE (JEST 'Y') (JEST '&') (JUST 'TRUE')))
          (COLD %| ;~(POSE (JEST 'N') (JEST '|') (JUST 'FALSE')))
        ==
      ::
      ++  MESSAGE                                       ::  EXP, LIN OR URL MSG
        ;~  POSE
          ;~(PLUG (COLD %EVAL HAX) EXPR)
          (STAG %SAY SPEECHES)
        ==
      ::
      ++  SPEECHES                                      ::  LIN OR URL MSGS
        %+  MOST  (JEST '•')
        ;~  POSE
          (STAG %URL AURF:DE-PURL:HTML)
          :(STAG %LIN & ;~(PFIX VAT TEXT))
          :(STAG %LIN | ;~(LESS MIC HAX TEXT))
        ==
      ::
      ++  TEXT                                          ::  MSG WITHOUT BREAK
        %+  COOK  CRIP
        (PLUS ;~(LESS (JEST '•') NEXT))
      ::
      ++  NICK  (COOK CRIP (PLUS NEXT))                 ::  NICKNAME
      ++  GLYPH  (MASK "/\\\{(<!?{(ZING GLYPHS)}")      ::  CIRCLE POSTFIX
      ++  SETTING                                       ::  SETTING FLAG
        %-  PERK  :~
          %NICKS
          %QUIET
          %NOTIFY
          %SHOWTIME
        ==
      ++  WORK                                          ::  FULL INPUT
        %+  KNEE  *^WORK  |.  ~+
        =-  ;~(POSE ;~(PFIX MIC -) MESSAGE)
        ;~  POSE
        ::
        ::  CIRCLE MANAGEMENT
        ::
          ;~((GLUE ACE) (PERK %READ ~) CIRE DEM:AG)
        ::
          ;~((GLUE ACE) (PERK %JOIN ~) SORZ)
        ::
          ;~((GLUE ACE) (PERK %LEAVE ~) CIRS)
        ::
          ;~  (GLUE ACE)  (PERK %CREATE ~)
            PORE
            CIRE
            QUT
          ==
        ::
          ;~  PLUG  (PERK %DELETE ~)
            ;~(PFIX ACE CIRE)
            ;~  POSE
              (COOK SOME ;~(PFIX ACE QUT))
              (EASY ~)
            ==
          ==
        ::
          ;~((GLUE ACE) (PERK %DEPICT ~) CIRE QUT)
        ::
          ;~((GLUE ACE) (PERK %FILTER ~) CIRE LOBE LOBE)
        ::
          ;~((GLUE ACE) (PERK %INVITE ~) CIRE SHIZ)
        ::
          ;~((GLUE ACE) (PERK %BANISH ~) CIRE SHIZ)
        ::
          ;~((GLUE ACE) (PERK %SOURCE ~) CIRE SORZ)
        ::
          ;~((GLUE ACE) (PERK %UNSOURCE ~) CIRE SORZ)
          ::TODO  WHY DO THESE NEST-FAIL WHEN DOING PERK WITH MULTIPLE?
        ::
        ::  PERSONAL METADATA
        ::
          ;~  (GLUE ACE)
            (PERK %ATTEND ~)
            CIRS
            ;~  POSE
              (COLD ~ SIG)
              (COOK SOME (PERK %GONE %IDLE %HEAR %TALK ~))
            ==
          ==
        ::
          ;~  PLUG
            (PERK %NAME ~)
            ;~(PFIX ACE CIRS)
            ;~(PFIX ACE ;~(POSE (COOK SOME QUT) (COLD ~ SIG)))
            ;~  POSE
              ;~  PFIX  ACE
                %+  COOK  SOME
                ;~  POSE
                  ;~((GLUE ACE) QUT (COOK SOME QUT) QUT)
                  ;~(PLUG QUT (COLD ~ ACE) QUT)
                ==
              ==
              ;~(PFIX ACE (COLD ~ SIG))
              (EASY ~)
            ==
          ==
        ::
        ::  DISPLAYING INFO
        ::
          ;~(PLUG (PERK %WHO ~) ;~(POSE ;~(PFIX ACE CIRS) (EASY ~)))
        ::
          ;~  PLUG
            (PERK %WHAT ~)
            ;~  POSE
              ;~(PFIX ACE (COOK SOME ;~(POSE GLYPH CIRS)))
              (EASY ~)
            ==
          ==
        ::
          ;~(PLUG (PERK %CIRCLES ~) (EASY ~))
        ::
          ;~((GLUE ACE) (PERK %SOURCES ~) CIRC)
        ::
          ;~((GLUE ACE) (PERK %SHOW ~) CIRC)
        ::
          ;~((GLUE ACE) (PERK %HIDE ~) CIRC)
        ::
        ::  UI SETTINGS
        ::
          ;~(PLUG (PERK %BIND ~) ;~(PFIX ACE GLYPH) (PUNT ;~(PFIX ACE CIRS)))
        ::
          ;~(PLUG (PERK %UNBIND ~) ;~(PFIX ACE GLYPH) (PUNT ;~(PFIX ACE CIRS)))
        ::
          ;~  PLUG  (PERK %NICK ~)
            ;~  POSE
              ;~  PLUG
                (COOK SOME ;~(PFIX ACE SHIP))
                (COLD (SOME '') ;~(PFIX ACE SIG))
              ==
              ;~  PLUG
                ;~  POSE
                  (COOK SOME ;~(PFIX ACE SHIP))
                  (EASY ~)
                ==
                ;~  POSE
                  (COOK SOME ;~(PFIX ACE NICK))
                  (EASY ~)
                ==
              ==
            ==
          ==
        ::
          ;~(PLUG (COLD %WIDTH (JEST 'SET WIDTH ')) DEM:AG)
        ::
          ;~  PLUG
            (COLD %TIMEZ (JEST 'SET TIMEZONE '))
          ::
            ;~  POSE
              (COLD %| (JUST '-'))
              (COLD %& (JUST '+'))
            ==
          ::
            %+  SEAR
              |=  A/@UD
              ^-  (UNIT @UD)
              ?:  &((GTE A 0) (LTE A 14))
              `A  ~
            DEM:AG
          ==
        ::
          ;~(PLUG (PERK %SET ~) ;~(POSE ;~(PFIX ACE SETTING) (EASY %$)))
        ::
          ;~(PLUG (PERK %UNSET ~) ;~(PFIX ACE SETTING))
        ::
        ::  MISCELLANEOUS
        ::
          ;~(PLUG (PERK %HELP ~) (EASY ~))
        ::
        ::  (PARSERS BELOW COME LAST BECAUSE THEY MATCH QUICKLY)
        ::
        ::  MESSAGING
        ::
          (STAG %TARGET ;~(PLUG CIRS (PUNT ;~(PFIX ACE MESSAGE))))
        ::
          (STAG %REPLY ;~(PLUG PICK ;~(PFIX ACE SPEECHES)))
        ::
        ::  DISPLAYING INFO
        ::
          (STAG %NUMBER PICK)
        ==
      --
    ::
    ++  SH-SANE
      ::    SANITIZE INPUT
      ::
      ::  PARSES CLI PROMPT INPUT USING ++SH-READ AND
      ::  SANITIZES WHEN INVALID.
      ::
      |=  {INV/SOLE-EDIT:SOLE-SUR BUF/(LIST @C)}
      ^-  {LIT/(LIST SOLE-EDIT:SOLE-SUR) ERR/(UNIT @U)}
      =+  RES=(ROSE (TUFA BUF) SH-READ)
      ?:  ?=(%| -.RES)  [[INV]~ `P.RES]
      :_  ~
      ?~  P.RES  ~
      =+  WOK=U.P.RES
      |-  ^-  (LIST SOLE-EDIT:SOLE-SUR)
      ?+  -.WOK
        ~
      ::
          $TARGET
        ?~(Q.WOK ~ $(WOK U.Q.WOK))
      ==
    ::
    ++  SH-SLUG
      ::  CORRECTS INVALID PROMPT INPUT.
      ::
      |=  {LIT/(LIST SOLE-EDIT:SOLE-SUR) ERR/(UNIT @U)}
      ^+  +>
      ?~  LIT  +>
      =^  LIC  SAY.SHE
          (~(TRANSMIT SOLE-LIB SAY.SHE) `SOLE-EDIT:SOLE-SUR`?~(T.LIT I.LIT [%MOR LIT]))
      (SH-FACT [%MOR [%DET LIC] ?~(ERR ~ [%ERR U.ERR]~)])
    ::
    ++  SH-OBEY
      ::    APPLY RESULT
      ::
      ::  CALLED UPON HITTING RETURN IN THE PROMPT. IF
      ::  INPUT IS INVALID, ++SH-SLUG IS CALLED.
      ::  OTHERWISE, THE APPROPRIATE WORK IS DONE AND
      ::  THE ENTERED COMMAND (IF ANY) GETS DISPLAYED
      ::  TO THE USER.
      ::
      =+  FIX=(SH-SANE [%NOP ~] BUF.SAY.SHE)
      ?^  LIT.FIX
        (SH-SLUG FIX)
      =+  JUB=(RUST (TUFA BUF.SAY.SHE) SH-READ)
      ?~  JUB  (SH-FACT %BEL ~)
      %.  U.JUB
      =<  SH-WORK
      =+  BUF=BUF.SAY.SHE
      =?  ..SH-OBEY  &(?=({$';' *} BUF) !?=($REPLY -.U.JUB))
        (SH-NOTE (TUFA `(LIST @)`BUF))
      =^  CAL  SAY.SHE  (~(TRANSMIT SOLE-LIB SAY.SHE) [%SET ~])
      %+  SH-FACT  %MOR
      :~  [%NEX ~]
          [%DET CAL]
      ==
    ::
    ::  #
    ::  #  %USER-ACTION
    ::  #
    ::    PROCESSING USER ACTIONS.
    +|  %USER-ACTION
    ::
    ++  SH-WORK
      ::    DO WORK
      ::
      ::  IMPLEMENTS WORKER ARMS FOR DIFFERENT TALK
      ::  COMMANDS.
      ::  WORKER ARMS MUST PRODUCE UPDATED STATE.
      ::
      |=  JOB/WORK
      ^+  +>
      =<  WORK
      |%
      ::
      ::  #
      ::  #  %HELPERS
      ::  #
      +|  %HELPERS
      ::
      ++  WORK
        ::  CALL CORRECT WORKER
        ?-  -.JOB
          ::  CIRCLE MANAGEMENT
          $JOIN    (JOIN +.JOB)
          $LEAVE   (LEAVE +.JOB)
          $CREATE  (CREATE +.JOB)
          $DELETE  (DELETE +.JOB)
          $DEPICT  (DEPICT +.JOB)
          $FILTER  (FILTER +.JOB)
          $INVITE  (PERMIT & +.JOB)
          $BANISH  (PERMIT | +.JOB)
          $SOURCE  (SOURCE & +.JOB)
          $UNSOURCE  (SOURCE | +.JOB)
          $READ  (READ +.JOB)
          ::  PERSONAL METADATA
          $ATTEND  (ATTEND +.JOB)
          $NAME    (SET-NAME +.JOB)
          ::  MESSAGING
          $SAY     (SAY +.JOB)
          $EVAL    (EVAL +.JOB)
          $TARGET  (TARGET +.JOB)
          $REPLY   (REPLY +.JOB)
          ::  DISPLAYING INFO
          $NUMBER  (NUMBER +.JOB)
          $WHO     (WHO +.JOB)
          $WHAT    (WHAT +.JOB)
          $CIRCLES  CIRCLES
          $SOURCES  (LIST-SOURCES +.JOB)
          ::  UI SETTINGS
          $BIND    (BIND +.JOB)
          $UNBIND  (UNBIND +.JOB)
          $NICK    (NICK +.JOB)
          $SET     (WO-SET +.JOB)
          $UNSET   (UNSET +.JOB)
          $WIDTH   (WIDTH +.JOB)
          $TIMEZ   (TIMEZ +.JOB)
          ::  MISCELANEOUS
          $SHOW    (PUBLIC & +.JOB)
          $HIDE    (PUBLIC | +.JOB)
          $HELP    HELP
        ==
      ::
      ++  ACTIVATE
        ::  PRINTS MESSAGE DETAILS.
        ::
        |=  GAM/TELEGRAM
        ^+  ..SH-WORK
        =+  TAY=~(. TR SETTINGS.SHE GAM)
        =.  ..SH-WORK  (SH-FACT TR-FACT:TAY)
        SH-PROD(ACTIVE.SHE AUD.GAM)
      ::
      ++  DELI
        ::  GETS ABSOLUTE MESSAGE NUMBER FROM RELATIVE.
        ::
        |=  {MAX/@UD NUL/@U FIN/@UD}
        ^-  @UD
        =+  DOG=|-(?:(=(0 FIN) 1 (MUL 10 $(FIN (DIV FIN 10)))))
        =.  DOG  (MUL DOG (POW 10 NUL))
        =-  ?:((LTE - MAX) - (SUB - DOG))
        (ADD FIN (SUB MAX (MOD MAX DOG)))
      ::
      ++  SET-GLYPH
        ::    NEW GLYPH BINDING
        ::
        ::  APPLIES GLYPH BINDING TO OUR STATE AND SENDS
        ::  AN ACTION.
        ::
        |=  {CHA/CHAR AUD/AUDIENCE}
        =:  BOUND  (~(PUT BY BOUND) AUD CHA)
            BINDS  (~(PUT JU BINDS) CHA AUD)
        ==
        SH-PROD:(SH-ACT %GLYPH CHA AUD &)
      ::
      ++  UNSET-GLYPH
        ::    REMOTE OLD GLYPH BINDING
        ::
        ::  REMOVES EITHER {AUD} OR ALL BINDINGS ON A
        ::  GLYPH AND SENDS AN ACTION.
        ::
        |=  {CHA/CHAR AUD/(UNIT AUDIENCE)}
        =/  OLE/(SET AUDIENCE)
          ?^  AUD  [U.AUD ~ ~]
          (~(GET JU BINDS) CHA)
        =.  ..SH-WORK  (SH-ACT %GLYPH CHA (FALL AUD ~) |)
        |-  ^+  ..SH-WORK
        ?~  OLE  ..SH-WORK
        =.  ..SH-WORK  $(OLE L.OLE)
        =.  ..SH-WORK  $(OLE R.OLE)
        %=  ..SH-WORK
          BOUND  (~(DEL BY BOUND) N.OLE)
          BINDS  (~(DEL JU BINDS) CHA N.OLE)
        ==
      ::
      ++  REVERSE-NICKS
        ::  FINDS ALL SHIPS WHOSE HANDLE MATCHES {NYM}.
        ::
        |=  NYM/^NICK
        ^-  (LIST SHIP)
        %+  MURN  ~(TAP BY NICKS)
        |=  {P/SHIP Q/^NICK}
        ?.  =(Q NYM)  ~
        [~ U=P]
      ::
      ++  HOON-HEAD
        ::    EVAL DATA
        ::
        ::  MAKES A VASE OF ENVIRONMENT DATA TO EVALUATE
        ::  AGAINST (FOR #-MESSAGES).
        ::
        ^-  VASE
        !>  ^-  {OUR/@P NOW/@DA ENY/@UVI}
        [SELF NOW.BOL (SHAS %ENY ENY.BOL)]
      ::
      ::  #
      ::  #  %CIRCLE-MANAGEMENT
      ::  #
      +|  %CIRCLE-MANAGEMENT
      ::
      ++  JOIN
        ::    %JOIN
        ::
        ::  CHANGE LOCAL MAILBOX CONFIG TO INCLUDE
        ::  SUBSCRIPTIONS TO {PAS}.
        ::
        |=  POS/(MAP CIRCLE RANGE)
        ^+  ..SH-WORK
        =+  PAS=~(KEY BY POS)
        =.  ..SH-WORK
          SH-PROD(ACTIVE.SHE PAS)
        ::  DEFAULT TO A DAY OF BACKLOG
        =.  POS
          %-  ~(RUN BY POS)
          |=  R/RANGE
          ?~(R `[DA+(SUB NOW.BOL ~D1) ~] R)
        (SH-ACT %SOURCE INBOX & POS)
      ::
      ++  LEAVE
        ::    %LEAVE
        ::
        ::  CHANGE LOCAL MAILBOX CONFIG TO EXCLUDE
        ::  SUBSCRIPTIONS TO {PAS}.
        ::
        |=  PAS/(SET CIRCLE)
        ^+  ..SH-WORK
        ::  REMOVE *ALL* SOURCES RELATING TO {PAS}.
        =/  POS
          %-  ~(GAS IN *(SET ^SOURCE))
          %-  ZING
          =/  SOS
            =-  ~(TAP IN SRC:-)
            (FALL (~(GET BY MIRRORS) INCIR) *CONFIG)
          %+  TURN  ~(TAP IN PAS)
          |=  C/CIRCLE
          %+  SKIM  SOS
          |=(S/^SOURCE =(CIR.S C))
        =.  ..SH-WORK
          (SH-ACT %SOURCE INBOX | POS)
        (SH-ACT %NOTIFY PAS ~)
      ::
      ++  CREATE
        ::    %CREATE
        ::
        ::  CREATES CIRCLE {NOM} WITH SPECIFIED CONFIG.
        ::
        |=  {SEC/SECURITY NOM/NAME TXT/CORD}
        ^+  ..SH-WORK
        =.  ..SH-WORK
          (SH-ACT %CREATE NOM TXT SEC)
        (JOIN [[[SELF NOM] ~] ~ ~])
      ::
      ++  DELETE
        ::    %DELETE
        ::
        ::  DELETES OUR CIRCLE {NOM}, AFTER OPTIONALLY
        ::  SENDING A LAST ANNOUNCE MESSAGE {SAY}.
        ::
        |=  {NOM/NAME SAY/(UNIT CORD)}
        ^+  ..SH-WORK
        (SH-ACT %DELETE NOM SAY)
      ::
      ++  DEPICT
        ::    %DEPICT
        ::
        ::  CHANGES THE DESCRIPTION OF {NOM} TO {TXT}.
        ::
        |=  {NOM/NAME TXT/CORD}
        ^+  ..SH-WORK
        (SH-ACT %DEPICT NOM TXT)
      ::
      ++  PERMIT
        ::    %INVITE / %BANISH
        ::
        ::  INVITES OR BANISHES {SIS} TO/FROM OUR
        ::  CIRCLE {NOM}.
        ::
        |=  {INV/? NOM/NAME SIS/(SET SHIP)}
        ^+  ..SH-WORK
        =.  ..SH-WORK  (SH-ACT %PERMIT NOM INV SIS)
        =-  (SH-ACT %PHRASE - [%INV INV [SELF NOM]]~)
        %-  ~(REP IN SIS)
        |=  {S/SHIP A/AUDIENCE}
        (~(PUT IN A) [S %I])
      ::
      ++  FILTER
        |=  {NOM/NAME CUS/? UTF/?}
        ^+  ..SH-WORK
        (SH-ACT %FILTER NOM CUS UTF)
      ::
      ++  SOURCE
        ::    %SOURCE
        ::
        ::  ADDS {PAS} TO {NOM}'S SRC.
        ::
        |=  {SUB/? NOM/NAME POS/(MAP CIRCLE RANGE)}
        ^+  ..SH-WORK
        (SH-ACT %SOURCE NOM SUB POS)
      ::
      ++  READ
        ::    %READ
        ::
        ::  SET {RED} FOR {NOM}
        ::
        |=  {NOM/NAME RED/@UD}
        ^+  ..SH-WORK
        (SH-ACT %READ NOM RED)
      ::
      ::  #
      ::  #  %PERSONAL-METADATA
      ::  #
      +|  %PERSONAL-METADATA
      ::
      ++  ATTEND
        ::  SETS OUR PRESENCE TO {PEC} FOR {AUD}.
        ::
        |=  {AUD/AUDIENCE PEC/(UNIT PRESENCE)}
        ^+  ..SH-WORK
        (SH-ACT %NOTIFY AUD PEC)
      ::
      ++  SET-NAME
        ::  SETS OUR NAME TO {MAN} FOR {AUD}.
        ::
        |=  {AUD/AUDIENCE MAN/HUMAN}
        ^+  ..SH-WORK
        (SH-ACT %NAMING AUD MAN)
      ::
      ::  #
      ::  #  %MESSAGING
      ::  #
      +|  %MESSAGING
      ::
      ++  SAY
        ::  SENDS MESSAGE.
        ::
        |=  SEP/(LIST SPEECH)
        ^+  ..SH-WORK
        (SH-ACT %PHRASE ACTIVE.SHE SEP)
      ::
      ++  EVAL
        ::    RUN
        ::
        ::  EXECUTES {EXE} AND SENDS BOTH ITS CODE AND
        ::  RESULT.
        ::
        |=  {TXT/CORD EXE/HOON}
        =>  |.([(SELL (SLAP (SLOP HOON-HEAD SEED) EXE))]~)
        =+  TAN=P:(MULE .)
        (SAY [%EXP TXT TAN] ~)
      ::
      ++  TARGET
        ::    %TARGET
        ::
        ::  SETS MESSAGING TARGET, THEN EXECUTE {WOE}.
        ::
        |=  {AUD/AUDIENCE WOE/(UNIT ^WORK)}
        ^+  ..SH-WORK
        =.  ..SH-PACT  (SH-PACT AUD)
        ?~(WOE ..SH-WORK WORK(JOB U.WOE))
      ::
      ++  REPLY
        ::    %REPLY
        ::
        ::  SEND A REPLY TO THE SELECTED MESSAGE.
        ::
        |=  {NUM/$@(@UD {P/@U Q/@UD}) SEP/(LIST SPEECH)}
        ^+  ..SH-WORK
        ::  =- (SAY (TURN ... [%IRE - S])) NEST-FAILS ON THE - ???
        ::TODO  WHAT'S FRIENDLIER, REPLY-TO-NULL OR ERROR?
        =/  SER/SERIAL
          ?@  NUM
            ?:  (GTE NUM COUNT)  0V0
            UID:(SNAG NUM GRAMS)
          ?:  (GTH Q.NUM COUNT)  0V0
          ?:  =(COUNT 0)  0V0
          =+  MSG=(DELI (DEC COUNT) NUM)
          UID:(SNAG (SUB COUNT +(MSG)) GRAMS)
        (SAY (TURN SEP |=(S/SPEECH [%IRE SER S])))
      ::
      ::  #
      ::  #  %DISPLAYING-INFO
      ::  #
      +|  %DISPLAYING-INFO
      ::
      ++  WHO
        ::    %WHO
        ::
        ::  PRINTS PRESENCE LISTS FOR {CIS} OR ALL.
        ::
        |=  CIS/(SET CIRCLE)  ^+  ..SH-WORK
        =<  (SH-FACT %MOR (MURN (SORT ~(TAP BY REMOTES) AOR) .))
        |=  {CIR/CIRCLE GOP/GROUP}  ^-  (UNIT SOLE-EFFECT:SOLE-SUR)
        ?.  |(=(~ CIS) (~(HAS IN CIS) CIR))  ~
        ?:  =(%MAILBOX SEC.CON:(FALL (~(GET BY MIRRORS) CIR) *CONFIG))  ~
        ?.  (~(HAS IN SOURCES) CIR)  ~
        =-  `[%TAN ROSE+[", " `~]^- LEAF+~(CR-FULL CR CIR) ~]
        =<  (MURN (SORT ~(TAP BY GOP) AOR) .)
        |=  {A/SHIP B/PRESENCE C/HUMAN}  ^-  (UNIT TANK)
        =?  C  =(HAN.C `(SCOT %P A))  [~ TRU.C]
        ?-  B
          $GONE  ~
          $IDLE  `LEAF+:(WELD "IDLE " (SCOW %P A) " " (TRIP (FALL HAN.C '')))
          $HEAR  `LEAF+:(WELD "HEAR " (SCOW %P A) " " (TRIP (FALL HAN.C '')))
          $TALK  `LEAF+:(WELD "TALK " (SCOW %P A) " " (TRIP (FALL HAN.C '')))
        ==
      ::
      ++  WHAT
        ::    %WHAT
        ::
        ::  PRINTS BINDING DETAILS. GOES BOTH WAYS.
        ::
        |=  QUR/(UNIT $@(CHAR AUDIENCE))
        ^+  ..SH-WORK
        ?^  QUR
          ?^  U.QUR
            =+  CHA=(~(GET BY BOUND) U.QUR)
            (SH-FACT %TXT ?~(CHA "NONE" [U.CHA]~))
          =+  PAN=~(TAP IN (~(GET JU BINDS) U.QUR))
          ?:  =(~ PAN)  (SH-FACT %TXT "~")
          =<  (SH-FACT %MOR (TURN PAN .))
          |=(A/AUDIENCE [%TXT ~(AR-PHAT AR A)])
        %+  SH-FACT  %MOR
        %-  ~(REP BY BINDS)
        |=  $:  {GYF/CHAR AUS/(SET AUDIENCE)}
                LIS/(LIST SOLE-EFFECT:SOLE-SUR)
            ==
        %+  WELD  LIS
        ^-  (LIST SOLE-EFFECT:SOLE-SUR)
        %-  ~(REP IN AUS)
        |=  {A/AUDIENCE L/(LIST SOLE-EFFECT:SOLE-SUR)}
        %+  WELD  L
        ^-  (LIST SOLE-EFFECT:SOLE-SUR)
        [%TXT [GYF ' ' ~(AR-PHAT AR A)]]~
      ::
      ++  NUMBER
        ::    %NUMBER
        ::
        ::  FINDS SELECTED MESSAGE, EXPAND IT.
        ::
        |=  NUM/$@(@UD {P/@U Q/@UD})
        ^+  ..SH-WORK
        |-
        ?@  NUM
          ?:  (GTE NUM COUNT)
            (SH-LAME "{(SCOW %S (NEW:SI | +(NUM)))}: NO SUCH TELEGRAM")
          =.  ..SH-FACT  (SH-FACT %TXT "? {(SCOW %S (NEW:SI | +(NUM)))}")
          (ACTIVATE (SNAG NUM GRAMS))
        ?.  (GTE Q.NUM COUNT)
          ?:  =(COUNT 0)
            (SH-LAME "0: NO MESSAGES")
          =+  MSG=(DELI (DEC COUNT) NUM)
          =.  ..SH-FACT  (SH-FACT %TXT "? {(SCOW %UD MSG)}")
          (ACTIVATE (SNAG (SUB COUNT +(MSG)) GRAMS))
        (SH-LAME "…{(REAP P.NUM '0')}{(SCOW %UD Q.NUM)}: NO SUCH TELEGRAM")
      ::
      ++  CIRCLES
        ::    %CIRCLES
        ::
        ::  LIST ALL LOCAL CIRCLES.
        ::
        ^+  ..SH-WORK
        =/  PIZ
          =-  .^(PRIZE %GX -)
          %+  WELD  /(SCOT %P OUR.BOL)/HALL/(SCOT %DA NOW.BOL)
          /CIRCLES/(SCOT %P OUR.BOL)/HALL-PRIZE
        ?>  ?=($CIRCLES -.PIZ)
        %+  SH-FACT  %MOR
        %+  TURN  (SORT ~(TAP IN CIS.PIZ) LTH)
        |=  A/NAME  [%TXT "%{(TRIP A)}"]
      ::
      ++  LIST-SOURCES
        ::    %SOURCES
        ::
        ::  DISPLAY THE ACTIVE SOURCES FOR OUR CIRCLE.
        ::
        |=  CIR/CIRCLE
        ^+  ..SH-WORK
        %+  SH-FACT  %MOR
        %+  TURN
          ::  MAKE SURE TO EXCLUDE {NOM} ITSELF.
          =-  ~(TAP IN (~(DEL IN SRC:-) [CIR ~]))
          (FALL (~(GET BY MIRRORS) CIR) *CONFIG)
        |=  S/^SOURCE
        ^-  SOLE-EFFECT:SOLE-SUR
        :-  %TXT
        %+  WELD  ~(CR-PHAT CR CIR.S)
        %+  ROLL  (RANGE-TO-PATH RAN.S)
        |=  {A/@TA B/TAPE}
        :(WELD B "/" (TRIP A))
      ::
      ::  #
      ::  #  %UI-SETTINGS
      ::  #
      +|  %UI-SETTINGS
      ::
      ++  BIND
        ::    %BIND
        ::
        ::  BINDS TARGETS {AUD} TO THE GLYPH {CHA}.
        ::
        |=  {CHA/CHAR AUD/(UNIT AUDIENCE)}
        ^+  ..SH-WORK
        ?~  AUD  $(AUD `ACTIVE.SHE)
        =+  OLE=(~(GET BY BOUND) U.AUD)
        ?:  =(OLE [~ CHA])  ..SH-WORK
        %.  "BOUND {<CHA>} {<U.AUD>}"
        SH-NOTE:SH-PROD:(SET-GLYPH CHA U.AUD)
      ::
      ++  UNBIND
        ::    %UNBIND
        ::
        ::  UNBINDS TARGETS {AUD} TO GLYPH {CHA}.
        ::
        |=  {CHA/CHAR AUD/(UNIT AUDIENCE)}
        ^+  ..SH-WORK
        ?.  ?|  &(?=(^ AUD) (~(HAS BY BOUND) U.AUD))
                &(?=(~ AUD) (~(HAS BY BINDS) CHA))
            ==
          ..SH-WORK
        %.  "UNBOUND {<CHA>}"
        SH-NOTE:SH-PROD:(UNSET-GLYPH CHA AUD)
      ::
      ++  NICK
        ::    %NICK
        ::
        ::  EITHER SHOWS, SETS OR UNSETS NICKNAMES
        ::  DEPENDING ON ARGUMENTS.
        ::
        |=  {HER/(UNIT SHIP) NYM/(UNIT ^NICK)}
        ^+  ..SH-WORK
        ::  NO ARGUMENTS, SHOW ALL
        ?:  ?=({~ ~} +<)
          %+  SH-FACT  %MOR
          %+  TURN  ~(TAP BY NICKS)
          |=  {P/SHIP Q/^NICK}
          :-  %TXT
          "{<P>}: {<Q>}"
        ::  SHOW HER NICK
        ?~  NYM
          ?>  ?=(^ HER)
          =+  ASC=(~(GET BY NICKS) U.HER)
          %+  SH-FACT  %TXT
          ?~  ASC  "{<U.HER>} UNBOUND"
          "{<U.HER>}: {<U.ASC>}"
        ::  SHOW NICK SHIP
        ?~  HER
          %+  SH-FACT  %MOR
          %+  TURN  (REVERSE-NICKS U.NYM)
          |=  P/SHIP
          [%TXT "{<P>}: {<U.NYM>}"]
        %.  [%NICK U.HER (FALL NYM '')]
        %=  SH-ACT
            NICKS
          ?~  U.NYM
            ::  UNSET NICKNAME
            (~(DEL BY NICKS) U.HER)
          ::  SET NICKNAME
          (~(PUT BY NICKS) U.HER U.NYM)
        ==
      ::
      ++  WO-SET
        ::    %SET
        ::
        ::  ENABLES UI SETTING FLAG.
        ::
        |=  SEG/TERM
        ^+  ..SH-WORK
        ?~  SEG
          %+  SH-FACT  %MOR
          %+  TURN  ~(TAP IN SETTINGS.SHE)
          |=  S/TERM
          [%TXT (TRIP S)]
        %=  ..SH-WORK
          SETTINGS.SHE  (~(PUT IN SETTINGS.SHE) SEG)
        ==
      ::
      ++  UNSET
        ::    %UNSET
        ::
        ::  DISABLES UI SETTING FLAG.
        ::
        |=  NEG/TERM
        ^+  ..SH-WORK
        %=  ..SH-WORK
          SETTINGS.SHE  (~(DEL IN SETTINGS.SHE) NEG)
        ==
      ::
      ++  WIDTH
        ::    ;SET WIDTH
        ::
        ::  CHANGE THE DISPLAY WIDTH IN CLI.
        ::
        |=  WID/@UD
        ^+  ..SH-WORK
        ..SH-WORK(WIDTH.SHE (MAX 30 WID))
      ::
      ++  TIMEZ
        ::    ;SET TIMEZONE
        ::
        ::  ADJUST THE DISPLAYED TIMESTAMP.
        ::
        |=  TIM/(PAIR ? @UD)
        ^+  ..SH-WORK
        ..SH-WORK(TIMEZ.SHE TIM)
      ::
      ::  #
      ::  #  %MISCELLANEOUS
      ::  #
      +|  %MISCELLANEOUS
      ::
      ++  PUBLIC
        ::    SHOW/HIDE MEMBERSHIP
        ::
        ::  ADDS OR REMOVES THE CIRCLE FROM THE PUBLIC
        ::  MEMBERSHIP LIST.
        ::
        |=  {ADD/? CIR/CIRCLE}
        (SH-ACT %PUBLIC ADD CIR)
      ::
      ++  HELP
        ::    %HELP
        ::
        ::  PRINTS HELP MESSAGE
        ::
        (SH-FACT %TXT "SEE HTTPS://URBIT.ORG/DOCS/LEARN/ARVO/ARVO-INTERNALS/MESSAGING/")
      --
    ::
    ++  SH-PACT
      ::    UPDATE ACTIVE AUD
      ::
      ::  CHANGE CURRENTLY SELECTED AUDIENCE TO {AUD}
      ::  AND UPDATE THE PROMPT.
      ::
      |=  AUD/AUDIENCE
      ^+  +>
      ::  ENSURE WE CAN SEE WHAT WE SEND.
      =+  ACT=(SH-PARE AUD)
      ?:  =(ACTIVE.SHE ACT)  +>.$
      SH-PROD(ACTIVE.SHE ACT)
    ::
    ++  SH-PARE
      ::    ADJUST TARGET LIST
      ::
      ::  IF THE AUDIENCE {AUD} DOES NOT CONTAIN A
      ::  CIRCLE WE'RE SUBSCRIBED TO, ADD OUR MAILBOX
      ::  TO THE AUDIENCE (SO THAT WE CAN SEE OUR OWN
      ::  MESSAGE).
      ::
      |=  AUD/AUDIENCE
      ?:  (SH-PEAR AUD)  AUD
      (~(PUT IN AUD) INCIR)
    ::
    ++  SH-PEAR
      ::    HEARBACK
      ::
      ::  PRODUCES TRUE IF ANY CIRCLE IS INCLUDED IN
      ::  OUR SUBSCRIPTIONS, MEANING, WE HEAR MESSAGES
      ::  SENT TO {AUD}.
      ::
      |=  AUD/AUDIENCE
      ?~  AUD  |
      ?|  (~(HAS IN SOURCES) `CIRCLE`N.AUD)
          $(AUD L.AUD)
          $(AUD R.AUD)
      ==
    ::
    ++  SH-GLYF
      ::    DECODE GLYPH
      ::
      ::  FINDS THE CIRCLE(S) THAT MATCH A GLYPH.
      ::
      |=  CHA/CHAR  ^-  (UNIT AUDIENCE)
      =+  LAX=(~(GET JU BINDS) CHA)
      ::  NO CIRCLE.
      ?:  =(~ LAX)  ~
      ::  SINGLE CIRCLE.
      ?:  ?=({* ~ ~} LAX)  `N.LAX
      ::  IN CASE OF MULTIPLE AUDIENCES, PICK THE MOST RECENTLY ACTIVE ONE.
      |-  ^-  (UNIT AUDIENCE)
      ?~  GRAMS  ~
      ::  GET FIRST CIRCLE FROM A TELEGRAM'S AUDIENCE.
      =+  PAN=(SILT ~(TAP IN AUD.I.GRAMS))
      ?:  (~(HAS IN LAX) PAN)  `PAN
      $(GRAMS T.GRAMS)
    ::
    ::  #
    ::  #  %DIFFERS
    ::  #
    ::    ARMS THAT CALCULATE DIFFERENCES BETWEEN DATASETS.
    +|  %DIFFERS
    ::
    ++  SH-GROUP-DIFF
      ::    GROUP DIFF PARTS
      ::
      ::  CALCULATES THE DIFFERENCE BETWEEN TWO PRESENCE
      ::  LISTS, PRODUCING LISTS OF REMOVED, ADDED AND
      ::  CHANGED PRESENCES.
      ::
      |=  {ONE/GROUP TWO/GROUP}
      =|  $=  RET
          $:  OLD/(LIST (PAIR SHIP STATUS))
              NEW/(LIST (PAIR SHIP STATUS))
              CHA/(LIST (PAIR SHIP STATUS))
          ==
      ^+  RET
      =.  RET
        =+  ENO=~(TAP BY ONE)
        |-  ^+  RET
        ?~  ENO  RET
        =.  RET  $(ENO T.ENO)
        ?:  =(%GONE PEC.Q.I.ENO)  RET
        =+  UNT=(~(GET BY TWO) P.I.ENO)
        ?~  UNT
          RET(OLD [I.ENO OLD.RET])
        ?:  =(%GONE PEC.U.UNT)
          RET(OLD [I.ENO OLD.RET])
        ?:  =(Q.I.ENO U.UNT)  RET
        RET(CHA [[P.I.ENO U.UNT] CHA.RET])
      =.  RET
        =+  OWT=~(TAP BY TWO)
        |-  ^+  RET
        ?~  OWT  RET
        =.  RET  $(OWT T.OWT)
        ?:  =(%GONE PEC.Q.I.OWT)  RET
        ?.  (~(HAS BY ONE) P.I.OWT)
          RET(NEW [I.OWT NEW.RET])
        ?:  =(%GONE PEC:(~(GOT BY ONE) P.I.OWT))
          RET(NEW [I.OWT NEW.RET])
        RET
      RET
    ::
    ++  SH-REMPE-DIFF
      ::    REMOTES DIFF
      ::
      ::  CALCULATES THE DIFFERENCE BETWEEN TWO REMOTE
      ::  PRESENCE MAPS, PRODUCING A LIST OF REMOVED,
      ::  ADDED AND CHANGED PRESENCES MAPS.
      ::
      |=  {ONE/(MAP CIRCLE GROUP) TWO/(MAP CIRCLE GROUP)}
      =|  $=  RET
          $:  OLD/(LIST (PAIR CIRCLE GROUP))
              NEW/(LIST (PAIR CIRCLE GROUP))
              CHA/(LIST (PAIR CIRCLE GROUP))
          ==
      ^+  RET
      =.  RET
        =+  ENO=~(TAP BY ONE)
        |-  ^+  RET
        ?~  ENO  RET
        =.  RET  $(ENO T.ENO)
        =+  UNT=(~(GET BY TWO) P.I.ENO)
        ?~  UNT
          RET(OLD [I.ENO OLD.RET])
        ?:  =(Q.I.ENO U.UNT)  RET
        RET(CHA [[P.I.ENO U.UNT] CHA.RET])
      =.  RET
        =+  OWT=~(TAP BY TWO)
        |-  ^+  RET
        ?~  OWT  RET
        =.  RET  $(OWT T.OWT)
        ?:  (~(HAS BY ONE) P.I.OWT)
          RET
        RET(NEW [I.OWT NEW.RET])
      RET
    ::
    ++  SH-REMCO-DIFF
      ::    CONFIG DIFF PARTS
      ::
      ::  CALCULATES THE DIFFERENCE BETWEEN TWO CONFIG
      ::  MAPS, PRODUCING LISTS OF REMOVED, ADDED AND
      ::  CHANGED CONFIGS.
      ::
      |=  {ONE/(MAP CIRCLE CONFIG) TWO/(MAP CIRCLE CONFIG)}
      =|  $=  RET
          $:  OLD/(LIST (PAIR CIRCLE CONFIG))
              NEW/(LIST (PAIR CIRCLE CONFIG))
              CHA/(LIST (PAIR CIRCLE CONFIG))
          ==
      ^+  RET
      =.  RET
        =+  ENO=~(TAP BY ONE)
        |-  ^+  RET
        ?~  ENO  RET
        =.  RET  $(ENO T.ENO)
        =+  UNT=(~(GET BY TWO) P.I.ENO)
        ?~  UNT
          RET(OLD [I.ENO OLD.RET])
        ?:  =(Q.I.ENO U.UNT)  RET
        RET(CHA [[P.I.ENO U.UNT] CHA.RET])
      =.  RET
        =+  OWT=~(TAP BY TWO)
        |-  ^+  RET
        ?~  OWT  RET
        =.  RET  $(OWT T.OWT)
        ?:  (~(HAS BY ONE) P.I.OWT)
          RET
        RET(NEW [I.OWT NEW.RET])
      RET
    ::
    ++  SH-SET-DIFF
      ::    SET DIFF
      ::
      ::  CALCULATES THE DIFFERENCE BETWEEN TWO SETS,
      ::  PROCUDING LISTS OF REMOVED AND ADDED ITEMS.
      ::
      |*  {ONE/(SET *) TWO/(SET *)}
      :-  ^=  OLD  ~(TAP IN (~(DIF IN ONE) TWO))
          ^=  NEW  ~(TAP IN (~(DIF IN TWO) ONE))
    ::
    ::  #
    ::  #  %PRINTERS
    ::  #
    ::    ARMS FOR PRINTING DATA TO THE CLI.
    +|  %PRINTERS
    ::
    ++  SH-LAME
      ::    SEND ERROR
      ::
      ::  JUST PUTS SOME TEXT INTO THE CLI AS-IS.
      ::
      |=  TXT/TAPE
      (SH-FACT [%TXT TXT])
    ::
    ++  SH-NOTE
      ::    SHELL MESSAGE
      ::
      ::  LEFT-PADS {TXT} WITH HEPS AND PRINTS IT.
      ::
      |=  TXT/TAPE
      ^+  +>
      =+  LIS=(SIMPLE-WRAP TXT (SUB WIDTH.SHE 16))
      %+  SH-FACT  %MOR
      =+  ?:((GTH (LENT LIS) 0) (SNAG 0 LIS) "")
      :-  TXT+(RUNT [14 '-'] '|' ' ' -)
      %+  TURN  (SLAG 1 LIS)
      |=(A/TAPE TXT+(RUNT [14 ' '] '|' ' ' A))
    ::
    ++  SH-PROD
      ::    SHOW PROMPT
      ::
      ::  MAKES AND STORES A MOVE TO MODIFY THE CLI
      ::  PROMPT TO DISPLAY THE CURRENT AUDIENCE.
      ::
      ^+  .
      %+  SH-FACT  %PRO
      :+  &  %TALK-LINE
      ^-  TAPE
      =/  REW/(PAIR (PAIR CORD CORD) AUDIENCE)
          [['[' ']'] ACTIVE.SHE]
      =+  CHA=(~(GET BY BOUND) Q.REW)
      ?^  CHA  ~[U.CHA ' ']
      =+  POR=~(AR-PROM AR Q.REW)
      (WELD `TAPE`[P.P.REW POR] `TAPE`[Q.P.REW ' ' ~])
    ::
    ++  SH-REND
      ::  PRINTS A TELEGRAM AS RENDERED BY ++TR-REND.
      ::
      |=  GAM/TELEGRAM
      ^+  +>
      =+  LIS=~(TR-REND TR SETTINGS.SHE GAM)
      ?~  LIS  +>.$
      %+  SH-FACT  %MOR
      %+  TURN  `(LIST TAPE)`LIS
      =+  NOM=(SCAG 7 (CITE:TITLE SELF))
      |=  T/TAPE
      ?.  ?&  (~(HAS IN SETTINGS.SHE) %NOTIFY)
              ?=(^ (FIND NOM (SLAG 15 T)))
          ==
        [%TXT T]
      [%MOR [%TXT T] [%BEL ~] ~]
    ::
    ++  SH-NUMB
      ::  PRINTS A MESSAGE NUMBER, LEFT-PADDED BY HEPS.
      ::
      |=  NUM/@UD
      ^+  +>
      =+  BUN=(SCOW %UD NUM)
      %+  SH-FACT  %TXT
      (RUNT [(SUB 13 (LENT BUN)) '-'] "[{BUN}]")
    ::
    ++  SH-CURE
      ::  RENDERS A SECURITY KIND.
      ::
      |=  A/SECURITY
      ^-  TAPE
      (SCOW %TAS A)
    ::
    ++  SH-SCIS
      ::    RENDER STATUS
      ::
      ::  GETS THE PRESENCE OF {SAZ} AS A TAPE.
      ::
      |=  SAT/STATUS
      ^-  TAPE
      ['%' (TRIP PEC.SAT)]
    ::
    ++  SH-SHOW-STATUS
      ::  PRINTS PRESENCE CHANGES TO THE CLI.
      ::
      |=  {CIR/CIRCLE WHO/SHIP CUR/STATUS DIF/DIFF-STATUS}
      ^+  +>
      ?:  (~(HAS IN SETTINGS.SHE) %QUIET)  +>
      %-  SH-NOTE
      %+  WELD
        (WELD ~(CR-PHAT CR CIR) ": ")
      ?-  -.DIF
          $FULL
        "HEY {(SCOW %P WHO)} {(SCOW %TAS PEC.SAT.DIF)}"
      ::
          $PRESENCE
        "SEE {(SCOW %P WHO)} {(SCOW %TAS PEC.DIF)}"
      ::
          $HUMAN
        %+  WELD  "NOM {(SCOW %P WHO)}"
        ?:  ?=($TRUE -.DIF.DIF)  ~
        =-  " '{(TRIP (FALL HAN.MAN.CUR ''))}' -> '{-}'"
        %-  TRIP
        =-  (FALL - '')
        ?-  -.DIF.DIF
          $FULL     HAN.MAN.DIF.DIF
          $HANDLE   HAN.DIF.DIF
        ==
      ::
          $REMOVE
        "BYE {(SCOW %P WHO)}"
      ==
    ::
    ++  SH-SHOW-CONFIG
      ::  PRINTS CONFIG CHANGES TO THE CLI.
      ::
      |=  {CIR/CIRCLE CUR/CONFIG DIF/DIFF-CONFIG}
      ^+  +>
      ?:  (~(HAS IN SETTINGS.SHE) %QUIET)  +>
      ?:  ?=($FULL -.DIF)
        =.  +>
          (SH-NOTE (WELD "NEW " (~(CR-SHOW CR CIR) ~)))
        =.  +>  $(DIF [%CAPTION CAP.COF.DIF])
        $(DIF [%FILTER FIT.COF.DIF])
      ?:  ?=($REMOVE -.DIF)
        (SH-NOTE (WELD "RIP " (~(CR-SHOW CR CIR) ~)))
      ?:  ?=($USAGE -.DIF)  +>
      %-  SH-NOTE
      %+  WELD
        (WELD ~(CR-PHAT CR CIR) ": ")
      ?-  -.DIF
          $SOURCE
        %+  WELD  ?:(ADD.DIF "ONN " "OFF ")
        ~(CR-FULL CR CIR.SRC.DIF)
      ::
          $CAPTION
        "CAP: {(TRIP CAP.DIF)}"
      ::
          $READ
        "RED: {(SCOW %UD RED.DIF)}"
      ::
          $FILTER
        ;:  WELD
          "FIT: CAPS:"
          ?:(CAS.FIT.DIF "Y" "N")
          " UNIC:"
          ?:(UTF.FIT.DIF "✔" "N")
        ==
      ::
          $SECURE
        "SEC {(TRIP SEC.CON.CUR)} -> {(TRIP SEC.DIF)}"
      ::
          $PERMIT
        %+  WELD
          =?  ADD.DIF
              ?=(?($CHANNEL $MAILBOX) SEC.CON.CUR)
            !ADD.DIF
          ?:(ADD.DIF "INV " "BAN ")
        ^-  TAPE
        %-  ~(REP IN SIS.DIF)
        |=  {S/SHIP T/TAPE}
        =?  T  ?=(^ T)  (WELD T ", ")
        (WELD T (CITE:TITLE S))
      ==
    ::
    ++  SH-GRAM
      ::    SHOW TELEGRAM
      ::
      ::  PRINTS THE TELEGRAM. EVERY FIFTH MESSAGE,
      ::  PRINT THE MESSAGE NUMBER ALSO.
      ::
      |=  GAM/TELEGRAM
      ^+  +>
      =+  NUM=(~(GOT BY KNOWN) UID.GAM)
      =.  +>.$
        ::  IF THE NUMBER ISN'T DIRECTLY AFTER LATEST, PRINT IT ALWAYS.
        ?.  =(NUM +(LATEST.SHE))
          (SH-NUMB NUM)
        ::  IF THE NUMBER IS DIRECTLY AFTER LATEST, PRINT EVERY FIFTH.
        ?.  =(0 (MOD NUM 5))  +>.$
        (SH-NUMB NUM)
      (SH-REND(LATEST.SHE NUM) GAM)
    ::
    ++  SH-GRAMS
      ::  PRINTS MULTIPLE TELEGRAMS.
      ::
      |=  GAZ/(LIST TELEGRAM)
      ^+  +>
      ?~  GAZ  +>
      $(GAZ T.GAZ, +> (SH-GRAM I.GAZ))
    --
  --
::
::  #
::  #  %RENDERERS
::  #
::    RENDERING CORES.
+|  %RENDERERS
::
++  CR
  ::    CIRCLE RENDERER
  ::
  ::  USED IN BOTH CIRCLE AND SHIP RENDERING.
  ::
  |_  ::  ONE: THE CIRCLE.
      ::
      ONE/CIRCLE
  ::
  ++  CR-BEAT
    ::    {ONE} MORE RELEVANT?
    ::
    ::  RETURNS TRUE IF ONE IS BETTER TO SHOW, FALSE
    ::  OTHERWISE. PRIORITIZES: OUR > MAIN > SIZE.
    ::
    |=  TWO/CIRCLE
    ^-  ?
    ::  THE CIRCLE THAT'S OURS IS BETTER.
    ?:  =(SELF HOS.ONE)
      ?.  =(SELF HOS.TWO)  &
      ?<  =(NOM.ONE NOM.TWO)
      ::  IF BOTH CIRCLES ARE OURS, THE MAIN STORY IS BETTER.
      ?:  =(%INBOX NOM.ONE)  &
      ?:  =(%INBOX NOM.TWO)  |
      ::  IF NEITHER ARE, PICK THE "LARGER" ONE.
      (LTH NOM.ONE NOM.TWO)
    ::  IF ONE ISN'T OURS BUT TWO IS, TWO IS BETTER.
    ?:  =(SELF HOS.TWO)  |
    ?:  =(HOS.ONE HOS.TWO)
      ::  IF THEY'RE FROM THE SAME SHIP, PICK THE "LARGER" ONE.
      (LTH NOM.ONE NOM.TWO)
    ::  IF THEY'RE FROM DIFFERENT SHIPS, NEITHER OURS, PICK HIERARCHICALLY.
    (LTH (XEB HOS.ONE) (XEB HOS.TWO))
  ::
  ++  CR-BEST
    ::  RETURNS THE MOST RELEVANT CIRCLE.
    ::
    |=  TWO/CIRCLE
    ?:((CR-BEAT TWO) ONE TWO)
  ::
  ++  CR-CURT
    ::    PRINTS A SHIP NAME IN 14 CHARACTERS.
    ::
    ::  LEFT-PADS WITH SPACES. {MUP} SIGNIFIES
    ::  "ARE THERE OTHER TARGETS BESIDES THIS ONE?"
    ::
    |=  MUP/?
    ^-  TAPE
    =+  RAW=(CITE:TITLE HOS.ONE)
    (RUNT [(SUB 14 (LENT RAW)) ' '] RAW)
  ::
  ++  CR-NICK
    ::    GET NICK FOR SHIP, OR SHORTNAME IF NO NICK.
    ::
    ::  LEFT-PADS WITH SPACES.
    ::
    |=  AUD/AUDIENCE
    ^-  TAPE
    =/  NIC/(UNIT CORD)
      ?:  (~(HAS BY NICKS) HOS.ONE)
        (~(GET BY NICKS) HOS.ONE)
      %-  ~(REP IN AUD)
      |=  {CIR/CIRCLE HAN/(UNIT CORD)}
      ?^  HAN  HAN
      =+  GOP=(~(GET BY REMOTES) CIR)
      ?~  GOP  ~
      HAN.MAN:(FALL (~(GET BY U.GOP) HOS.ONE) *STATUS)
    ?~  NIC  (CR-CURT |)
    =+  RAW=(SCAG 14 (TRIP U.NIC))
    =+  LEN=(SUB 14 (LENT RAW))
    (WELD (REAP LEN ' ') RAW)
  ::
  ::  TODO: FIGURE OUT WHY ENABLING THE DOCCORD CAUSES A NEST FAIL, EVEN WHEN
  ::  ATTACHED TO THE ARM INSTEAD OF THE PRODUCT.
  ::
  ++  CR-PHAT                                           :::  RENDER ACCURATELY
    :::  PRINTS A CIRCLE FULLY, BUT STILL TAKING
    :::  "SHORTCUTS" WHERE POSSIBLE:
    :::  ":" FOR LOCAL MAILBOX, "~SHIP" FOR FOREIGN
    :::  MAILBOX, "%CHANNEL" FOR LOCAL CIRCLE,
    :::  "/CHANNEL" FOR PARENT CIRCLE.
    ::
    ^-  TAPE
    ?:  =(HOS.ONE SELF)
      ?:  =(NOM.ONE INBOX)
        ":"
      ['%' (TRIP NOM.ONE)]
    =+  WUN=(CITE:TITLE HOS.ONE)
    ?:  =(NOM.ONE %INBOX)
      WUN
    ?:  =(HOS.ONE (^SEIN:TITLE SELF))
      ['/' (TRIP NOM.ONE)]
    :(WELP WUN "/" (TRIP NOM.ONE))
  ::
  ++  CR-FULL  (CR-SHOW ~)                              ::  RENDER FULL WIDTH
  ::
  ++  CR-SHOW
    ::  RENDERS A CIRCLE AS TEXT.
    ::
    ::  MOY:  MULTIPLE CIRCLES IN AUDIENCE?
    |=  MOY/(UNIT ?)
    ^-  TAPE
    ::  RENDER CIRCLE (AS GLYPH IF WE CAN).
    ?~  MOY
      =+  CHA=(~(GET BY BOUND) ONE ~ ~)
      =-  ?~(CHA - "{U.CHA ~} {-}")
      ~(CR-PHAT CR ONE)
    (~(CR-CURT CR ONE) U.MOY)
  --
::
++  AR
  ::    AUDIENCE RENDERER
  ::
  ::  USED FOR REPRESENTING AUDIENCES (SETS OF CIRCLES)
  ::  AS TAPES.
  ::
  |_  ::  AUD: MEMBERS OF THE AUDIENCE.
      ::
      AUD/AUDIENCE
  ::
  ++  AR-BEST
    ::  FIND THE MOST RELEVANT CIRCLE IN THE SET.
    ::
    ^-  (UNIT CIRCLE)
    ?~  AUD  ~
    :-  ~
    |-  ^-  CIRCLE
    =+  LEF=`(UNIT CIRCLE)`AR-BEST(AUD L.AUD)
    =+  RIT=`(UNIT CIRCLE)`AR-BEST(AUD R.AUD)
    =?  N.AUD  ?=(^ LEF)  (~(CR-BEST CR N.AUD) U.LEF)
    =?  N.AUD  ?=(^ RIT)  (~(CR-BEST CR N.AUD) U.RIT)
    N.AUD
  ::
  ++  AR-DEAF
    ::  REMOVE OURSELVES FROM THE AUDIENCE.
    ::
    ^+  .
    .(AUD (~(DEL IN AUD) `CIRCLE`INCIR))
  ::
  ++  AR-MAUD
    ::    MULTIPLE AUDIENCE
    ::
    ::  CHECKS IF THERE'S MULTIPLE CIRCLES IN THE
    ::  AUDIENCE VIA PATTERN MATCHING.
    ::
    ^-  ?
    =.  .  AR-DEAF
    !?=($@(~ {* ~ ~}) AUD)
  ::
  ++  AR-PHAT
    ::  RENDER ALL CIRCLES, NO GLYPHS.
    ::
    ^-  TAPE
    %-  ~(REP IN AUD)
    |=  {C/CIRCLE T/TAPE}
    =?  T  ?=(^ T)
      (WELD T ", ")
    (WELD T ~(CR-PHAT CR C))
  ::
  ++  AR-PROM
    ::  RENDER ALL CIRCLES, ORDERED BY RELEVANCE.
    ::
    ^-  TAPE
    =.  .  AR-DEAF
    =/  ALL
      %+  SORT  `(LIST CIRCLE)`~(TAP IN AUD)
      |=  {A/CIRCLE B/CIRCLE}
      (~(CR-BEAT CR A) B)
    =+  FIR=&
    |-  ^-  TAPE
    ?~  ALL  ~
    ;:  WELP
      ?:(FIR "" " ")
      (~(CR-SHOW CR I.ALL) ~)
      $(ALL T.ALL, FIR |)
    ==
  ::
  ++  AR-WHOM
    ::  RENDER SENDER AS THE MOST RELEVANT CIRCLE.
    ::
    (~(CR-SHOW CR (NEED AR-BEST)) ~ AR-MAUD)
  ::
  ++  AR-DIRE
    ::  RETURNS TRUE IF CIRCLE IS A MAILBOX OF OURS.
    ::
    |=  CIR/CIRCLE  ^-  ?
    ?&  =(HOS.CIR SELF)
        =+  SOT=(~(GET BY MIRRORS) CIR)
        &(?=(^ SOT) ?=($MAILBOX SEC.CON.U.SOT))
    ==
  ::
  ++  AR-GLYF
    ::  TODO: ANOTHER PLACE WHERE DOCCORDS BREAK THINGS.
    ::
    :::    AUDIENCE GLYPH
    :::
    :::  GET THE GLYPH THAT CORRESPONDS TO THE AUDIENCE.
    :::  FOR MAILBOX MESSAGES AND COMPLEX AUDIENCES, USE
    :::  RESERVED "GLYPHS".
    ::
    ^-  TAPE
    =+  CHA=(~(GET BY BOUND) AUD)
    ?^  CHA  ~[U.CHA]
    ?.  (LIEN ~(TAP BY AUD) AR-DIRE)
      "*"
    ?:  ?=({^ ~ ~} AUD)
      ":"
    ";"
  --
::
++  TR
  ::    TELEGRAM RENDERER
  ::
  ::  RESPONSIBLE FOR CONVERTING TELEGRAMS AND
  ::  EVERYTHING RELATING TO THEM TO TEXT TO BE
  ::  DISPLAYED IN THE CLI.
  ::
  |_  $:  ::  SEF: SETTINGS FLAGS.
          ::  WHO: AUTHOR.
          ::  SEN: UNIQUE IDENTIFIER.
          ::  AUD: AUDIENCE.
          ::  WEN: TIMESTAMP.
          ::  SEP: MESSAGE CONTENTS.
          ::
          SEF/(SET TERM)
          WHO/SHIP
          SEN/SERIAL
          AUD/AUDIENCE
          WEN/@DA
          SEP/SPEECH
      ==
  ::
  ++  TR-FACT
    ::    ACTIVATE EFFECT
    ::
    ::  PRODUCES SOLE-EFFECT FOR PRINTING MESSAGE
    ::  DETAILS.
    ::
    ^-  SOLE-EFFECT:SOLE-SUR
    ~[%MOR [%TAN TR-META] TR-BODY]
  ::
  ++  TR-REND
    ::    RENDERS A TELEGRAM
    ::
    ::  THE FIRST LINE WILL CONTAIN THE AUTHOR AND
    ::  OPTIONAL TIMESTAMP.
    ::
    ^-  (LIST TAPE)
    =/  WYD
      %+  SUB  WIDTH.CLI                                ::  TERMWIDTH,
      %+  ADD  14                                       ::  MINUS AUTHOR,
      ?:((~(HAS IN SEF) %SHOWTIME) 10 0)                ::  MINUS TIMESTAMP.
    =+  TXS=(TR-TEXT WYD)
    ?~  TXS  ~
    ::  RENDER THE AUTHOR.
    =/  NOM/TAPE
      ?:  (~(HAS IN SEF) %NICKS)
        (~(CR-NICK CR [WHO %INBOX]) AUD)
      (~(CR-CURT CR [WHO %INBOX]) |)
    ::  REGULAR INDENT.
    =/  DEN/TAPE
      (REAP (LENT NOM) ' ')
    ::  TIMESTAMP, IF DESIRED.
    =/  TAM/TAPE
      ?.  (~(HAS IN SEF) %SHOWTIME)  ""
      =.  WEN
        %.  [WEN (MUL Q.TIMEZ.CLI ~H1)]
        ?:(P.TIMEZ.CLI ADD SUB)
      =+  DAT=(YORE WEN)
      =/  T
        |=  A/@
        %+  WELD
          ?:((LTH A 10) "0" ~)
        (SCOW %UD A)
      =/  TIME
        ;:  WELD
          "~"  (T H.T.DAT)
          "."  (T M.T.DAT)
          "."  (T S.T.DAT)
        ==
      %+  WELD
        (REAP (SUB +(WYD) (MIN WYD (LENT (TUBA I.TXS)))) ' ')
      TIME
    %-  FLOP
    %+  ROLL  `(LIST TAPE)`TXS
    |=  {T/TAPE L/(LIST TAPE)}
    ?~  L  [:(WELD NOM T TAM) ~]
    [(WELD DEN T) L]
  ::
  ++  TR-META
    ::    METADATA
    ::
    ::  BUILDS STRING THAT DISPLAY METADATA, INCLUDING
    ::  MESSAGE SERIAL, TIMESTAMP, AUTHOR AND AUDIENCE.
    ::
    ^-  TANG
    =.  WEN  (SUB WEN (MOD WEN (DIV WEN ~S0..0001)))    :: ROUND
    =+  HED=LEAF+"{(SCOW %UV SEN)} AT {(SCOW %DA WEN)}"
    =/  CIS
      %+  TURN  ~(TAP IN AUD)
      |=  A/CIRCLE
      LEAF+~(CR-FULL CR A)
    [%ROSE [" " ~ ~] [HED >WHO< [%ROSE [", " "TO " ~] CIS] ~]]~
  ::
  ++  TR-BODY
    ::    MESSAGE CONTENT
    ::
    ::  LONG-FORM DISPLAY OF MESSAGE CONTENTS, SPECIFIC
    ::  TO EACH SPEECH TYPE.
    ::
    |-  ^-  SOLE-EFFECT:SOLE-SUR
    ?-  -.SEP
        $LIN
      TAN+~[LEAF+"{?:(PAT.SEP "@ " "")}{(TRIP MSG.SEP)}"]
    ::
        $URL
      URL+(CRIP (APIX:EN-PURL:HTML URL.SEP))
    ::
        $EXP
      MOR+~[TXT+"# {(TRIP EXP.SEP)}" TAN+RES.SEP]
    ::
        $IRE
      =+  NUM=(~(GET BY KNOWN) TOP.SEP)
      ?~  NUM  $(SEP SEP.SEP)
      =+  GAM=(SNAG (SUB COUNT +(U.NUM)) GRAMS)
      =-  MOR+[TAN+- $(SEP SEP.SEP) ~]
      %-  FLOP  %+  WELD
        :_  ~  :-  %LEAF
        %+  WELD  "IN REPLY TO: {(CITE:TITLE AUT.GAM)}: "
        "[{(SCOW %UD U.NUM)}]"
      %+  TURN  (~(TR-TEXT TR SEF GAM) WIDTH.CLI)
      |=(T/TAPE [%LEAF T])
    ::
        $FAT
      [%MOR $(SEP SEP.SEP) TAN+(TR-TACH TAC.SEP) ~]
    ::
        $INV
      :-  %TAN
      :_  ~
      :-  %LEAF
      %+  WELD
        ?:  INV.SEP
          "YOU HAVE BEEN INVITED TO "
        "YOU HAVE BEEN BANISHED FROM "
      ~(CR-PHAT CR CIR.SEP)
    ::
        $APP
      [%MOR TAN+~[LEAF+"[{(TRIP APP.SEP)}]: "] $(SEP SEP.SEP) ~]
    ==
  ::
  ++  TR-TACH
    ::  RENDERS AN ATTACHMENT.
    ::
    |=  ATT/ATTACHE
    ^-  TANG
    ?-  -.ATT
      $NAME  (WELP $(ATT TAC.ATT) LEAF+"= {(TRIP NOM.ATT)}" ~)
      $TANK  +.ATT
      $TEXT  (TURN (FLOP `(LIST CORD)`+.ATT) |=(B/CORD LEAF+(TRIP B)))
    ==
  ::
  ++  TR-CHOW
    ::    TRUNCATE
    ::
    ::  TRUNCATES THE {TXT} TO BE OF MAX {LEN}
    ::  CHARACTERS. IF IT DOES TRUNCATE, INDICATES IT
    ::  DID SO BY APPENDING _ OR ….
    ::
    |=  {LEN/@U TXT/TAPE}
    ^-  TAPE
    ?:  (GTH LEN (LENT TXT))  TXT
    =.  TXT  (SCAG LEN TXT)
    |-
    ?~  TXT  TXT
    ?:  =(' ' I.TXT)
      |-
      :-  '_'
      ?.  ?=({$' ' *} T.TXT)
        T.TXT
      $(TXT T.TXT)
    ?~  T.TXT  "…"
    [I.TXT $(TXT T.TXT)]
  ::
  ++  TR-TEXT
    ::    COMPACT CONTENTS
    ::
    ::  RENDERS JUST THE MOST IMPORTANT DATA OF THE
    ::  MESSAGE. IF POSSIBLE, THESE STAY WITHIN A SINGLE
    ::  LINE.
    ::
    ::  PRE:  REPLACE/APPEND LINE PREFIX
    ::TODO  THIS SHOULD PROBABLY BE REDONE SOMEDAY.
    =|  PRE/(UNIT (PAIR ? TAPE))
    |=  WYD/@UD
    ^-  (LIST TAPE)
    ?-  -.SEP
        $FAT
      %+  WELD  $(SEP SEP.SEP)
      ^-  (LIST TAPE)
      ?+  -.TAC.SEP  [" ATTACHED: ..." ~]
        $NAME  [(SCAG WYD " ATTACHED: {(TRIP NOM.TAC.SEP)}") ~]
      ==
    ::
        $EXP
      :-  (TR-CHOW WYD '#' ' ' (TRIP EXP.SEP))
      ?~  RES.SEP  ~
      =-  [' ' (TR-CHOW (DEC WYD) ' ' -)]~
      ~(RAM RE (SNAG 0 `(LIST TANK)`RES.SEP))
    ::
        $IRE
      $(SEP SEP.SEP, PRE `[| "^ "])
    ::
        $URL
      :_  ~
      =+  FUL=(APIX:EN-PURL:HTML URL.SEP)
      =+  PEF=Q:(FALL PRE [P=| Q=""])
      ::  CLEAN UP PREFIX IF NEEDED.
      =?  PEF  =((SCAG 1 (FLOP PEF)) " ")
        (SCAG (DEC (LENT PEF)) PEF)
      =.  PEF  (WELD "/" PEF)
      =.  WYD  (SUB WYD +((LENT PEF)))  ::  ACCOUNT FOR PREFIX.
      ::  IF THE FULL URL FITS, JUST RENDER IT.
      ?:  (GTE WYD (LENT FUL))  :(WELD PEF " " FUL)
      ::  IF IT DOESN'T, PREFIX WITH _ AND RENDER JUST (THE TAIL OF) THE DOMAIN.
      %+  WELD  (WELD PEF "_")
      =+  HOK=R.P.P.URL.SEP
      =-  (SWAG [A=(SUB (MAX WYD (LENT -)) WYD) B=WYD] -)
      ^-  TAPE
      =<  ?:  ?=(%& -.HOK)
            (REEL P.HOK .)
          +:(SCOW %IF P.HOK)
      |=  {A/KNOT B/TAPE}
      ?~  B  (TRIP A)
      (WELP B '.' (TRIP A))
    ::
        $LIN
      ::  GLYPH PREFIX
      =/  PEF/TAPE
        ?:  &(?=(^ PRE) P.U.PRE)  Q.U.PRE
        ?:  PAT.SEP  " "
        =-  (WELD - Q:(FALL PRE [P=| Q=" "]))
        %~  AR-GLYF  AR
        ?:  =(WHO SELF)  AUD
        (~(DEL IN AUD) [WHO %INBOX])
      =/  LIS/(LIST TAPE)
        %+  SIMPLE-WRAP
          `TAPE``(LIST @)`(TUBA (TRIP MSG.SEP))
        (SUB WYD (MIN (DIV WYD 2) (LENT PEF)))
      =+  LEF=(LENT PEF)
      =+  ?:((GTH (LENT LIS) 0) (SNAG 0 LIS) "")
      :-  (WELD PEF -)
      %+  TURN  (SLAG 1 LIS)
      |=(A/TAPE (RUNT [LEF ' '] A))
    ::
        $INV
      :_  ~
      %+  TR-CHOW  WYD
      %+  WELD
        ?:  INV.SEP
          " INVITED YOU TO "
        " BANISHED YOU FROM "
      ~(CR-PHAT CR CIR.SEP)
    ::
        $APP
      $(SEP SEP.SEP, PRE `[& "[{(TRIP APP.SEP)}]: "])
    ==
  --
::
::  #
::  #  %EVENTS
::  #
+|  %EVENTS
::
++  QUIT-SERVER-CLIENT
  |=  WIR/WIRE
  ^-  (QUIP MOVE _+>)
  [[PEER-CLIENT]~ +>]
::
++  QUIT-SERVER-INBOX
  |=  WIR/WIRE
  ^-  (QUIP MOVE _+>)
  [[PEER-INBOX]~ +>]
::
++  PEER
  ::  INCOMING SUBSCRIPTION ON PAX.
  ::
  |=  PAX/PATH
  ^-  (QUIP MOVE _+>)
  ?.  =(SRC.BOL OUR.BOL)
    ~!  [%PEER-TALK-STRANGER SRC.BOL]
    !!
  ?.  ?=({$SOLE *} PAX)
    ~!  [%PEER-TALK-STRANGE PAX]
    !!
  TA-DONE:TA-CONSOLE:TA
::
++  DIFF-HALL-PRIZE
  ::  ACCEPT QUERY ANSWER
  ::
  |=  {WAY/WIRE PIZ/PRIZE}
  ^-  (QUIP MOVE _+>)
  TA-DONE:(TA-TAKE:TA PIZ)
::
++  DIFF-HALL-RUMOR
  ::  ACCEPT QUERY CHANGE
  ::
  |=  {WAY/WIRE RUM/RUMOR}
  ^-  (QUIP MOVE _+>)
  TA-DONE:(TA-HEAR:TA RUM)
::
++  POKE-SOLE-ACTION
  ::  INCOMING SOLE ACTION. PROCESS IT.
  ::
  |=  ACT/SOLE-ACTION:SOLE-SUR
  TA-DONE:(TA-SOLE:TA ACT)
::
::TODO  FOR DEBUG PURPOSES. REMOVE EVENTUALLY.
::  USERS BEWARE, HERE BE DRAGONS.
++  POKE-NOUN
  |=  A/@T
  ^-  (QUIP MOVE _+>)
  ?:  =(A 'CHECK')
    ~&  'VERIFYING MESSAGE REFERENCE INTEGRITY...'
    =-  ~&(- [~ +>.$])
    ~&  [%COUNT--LENT COUNT (LENT GRAMS)]
    =+  %-  ~(REP BY KNOWN)
      |=  {{U/SERIAL A/@UD} K/@UD M/@UD}
      :-  ?:((GTH A K) A K)
      ?:  =(U UID:(SNAG (SUB COUNT +(A)) GRAMS))  M  +(M)
    :-  %CHECK-TALK
    [KNOWN=K MISMATCH=M]
  ?:  =(A 'REBUILD')
    ~&  'REBUILDING MESSAGE REFERENCES...'
    =+  %+  REEL  GRAMS
      |=  {T/TELEGRAM C/@UD K/(MAP SERIAL @UD)}
      [+(C) (~(PUT BY K) UID.T C)]
    [~ +>.$(COUNT C, KNOWN K)]
  ?:  =(A 'RECONNECT')
    ~&  'DISCONNECTING AND RECONNECTING TO HALL...'
    :_  +>
    :~  [OST.BOL %PULL /SERVER/CLIENT SERVER ~]
        [OST.BOL %PULL /SERVER/INBOX SERVER ~]
        PEER-CLIENT
        PEER-INBOX
    ==
  ?:  =(A 'RESET')
    ~&  'FULL RESET INCOMING, HOLD ON TO YOUR CLI...'
    :_  +>(GRAMS ~, KNOWN ~, COUNT 0, LAST 0)
    :~  [OST.BOL %PULL /SERVER/CLIENT SERVER ~]
        [OST.BOL %PULL /SERVER/INBOX SERVER ~]
        PEER-CLIENT
        PEER-INBOX
    ==
  ::  THIS DELETES A MESSAGE FROM YOUR BACKLOG, AND MAY
  ::  MAKE TALK THROW STACK TRACES.
  ::  **AKA DON'T RUN THIS!**
  ?:  =(A 'SCREW')
    ~&  'SCREWING THINGS UP...'
    :-  ~
    +>(GRAMS (OUST [0 1] GRAMS))
  [~ +>]
::
++  COUP-CLIENT-ACTION
  ::  ACCEPT N/ACK
  ::
  |=  {WIR/WIRE FAL/(UNIT TANG)}
  ^-  (QUIP MOVE _+>)
  ?~  FAL  [~ +>]
  %-  (SLOG LEAF+"ACTION FAILED: " U.FAL)
  [~ +>]
--
