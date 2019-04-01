::                                                      ::  ::
::::  /APP/HALL/HOON                                    ::  ::
  ::                                                    ::  ::
::
::TODO  DOCUMENT GATE SAMPLES FULLY.
::
::TODO  FOR USING MOONS AS TMP IDENTITIES FOR FRIENDS: STORIES MAY WANT TO KEEP
::      LISTS OF MOONS (OR JUST SHIPS IN GENERAL?) THAT WE DEFINE AS "STANDALONE"
::      SO THAT THE "CONVERT TO TRUE IDENTITY" DOESN'T HAPPEN FOR THEM.
::
/-    HALL-SUR=HALL                                     ::  STRUCTURES
/+    HALL-LIB=HALL, HALL-LEGACY                        ::  LIBRARIES
/=    SEED  /~  !>(.)
/=    FILTER-GRAM
      /^  $-({TELEGRAM:HALL-SUR BOWL:GALL} TELEGRAM:HALL-SUR)
      /|  /:  /%/FILTER  /!NOUN/
          /~  |=({T/TELEGRAM:HALL-SUR BOWL:GALL} T)
      ==
/=    CUSTOM-RULES
      /^  (MAP KNOT $-({SHIP ?($R %W) BOWL:GALL} ?))
      /:  /%/RULES  /_  /!NOUN/
::
::::
=,  HALL-SUR
=>  ::  #
    ::  #  %ARCH
    ::  #
    ::    DATA STRUCTURES
    ::
    |%
    ::  #  %STATE
    ::    STATE DATA STRUCTURES
    ++  STATE                                           ::  APPLICATION STATE
      $:  STORIES/(MAP NAME STORY)                      ::  CONVERSATIONS
          OUTBOX/(MAP SERIAL TRACKING)                  ::  SENT MESSAGES
          LOG/(MAP NAME @UD)                            ::  LOGGED TO CLAY
          NICKS/(MAP SHIP NICK)                         ::  LOCAL NICKNAMES
          BINDS/(JUG CHAR AUDIENCE)                     ::  CIRCLE GLYPH LOOKUP
          PUBLIC/(SET CIRCLE)                           ::  PUBLICLY MEMBER OF
          RIR/WIRE                                      ::  CURRENT RUMOR WIRE
      ==                                                ::
    ++  STORY                                           ::  WIRE CONTENT
      $:  COUNT/@UD                                     ::  (LENT GRAMS)
          GRAMS/(LIST TELEGRAM)                         ::  ALL MESSAGES
          KNOWN/(MAP SERIAL @UD)                        ::  MESSAGES HEARD
          SOURCED/(MAP CIRCLE (LIST @UD))               ::  HEARD FROM
          SEQUENCE/(MAP CIRCLE @UD)                     ::  LAST-HEARD P CIRCLE
          LOCALS/GROUP                                  ::  LOCAL STATUS
          REMOTES/(MAP CIRCLE GROUP)                    ::  REMOTE STATUS
          SHAPE/CONFIG                                  ::  CONFIGURATION
          MIRRORS/(MAP CIRCLE CONFIG)                   ::  REMOTE CONFIG
          PEERS/(JAR SHIP QUERY)                        ::  SUBSCRIBERS
          INHERITED/_|                                  ::  FROM PARENT?
      ==                                                ::
    ::  #  %DELTAS
    ::    CHANGES TO STATE
    ++  DELTA                                           ::
      $%  ::  PUBLIC STATE                              ::
          {$PUBLIC ADD/? CIR/CIRCLE}                    ::  SHOW/HIDE MEMBERSHIP
          ::  MESSAGING STATE                           ::
          {$OUT CIR/CIRCLE OUT/(LIST THOUGHT)}          ::  SEND MSGS TO CIRCLE
          $:  $DONE                                     ::  SET DELIVERY STATE
              CIR/CIRCLE                                ::
              SES/(LIST SERIAL)                         ::
              RES/DELIVERY                              ::
          ==                                            ::
          ::  SHARED UI STATE                           ::
          {$GLYPH DIFF-GLYPH}                           ::  UN/BOUND GLYPH
          {$NICK DIFF-NICK}                             ::  CHANGED NICKNAME
          ::  STORY STATE                               ::
          {$STORY NOM/NAME DET/DELTA-STORY}             ::  CHANGE TO STORY
          ::  SIDE-EFFECTS                              ::
          {$INIT ~}                                    ::  INITIALIZE
          {$OBSERVE WHO/SHIP}                           ::  WATCH BURDEN BEARER
          $:  $PRESENT                                  ::  SEND %PRESENT CMD
              HOS/SHIP                                  ::
              NOS/(SET NAME)                            ::
              DIF/DIFF-STATUS                           ::
          ==                                            ::
      ==                                                ::
    ++  DELTA-STORY                                     ::  STORY DELTA
      $%  {$INHERITED IHR/?}                            ::  INHERITED FLAG
          {$FOLLOW SUB/? SRS/(SET SOURCE)}              ::  UN/SUBSCRIBE
          {$SEQUENT CIR/CIRCLE NUM/@UD}                 ::  UPDATE LAST-HEARD
          {$GRAM SRC/CIRCLE GAM/TELEGRAM}               ::  NEW/CHANGED MSGS
          {$SOURCED SRC/CIRCLE NUM/@UD}                 ::  NEW HEARD-FROM
          DIFF-STORY                                    ::  BOTH IN & OUTWARD
      ==                                                ::
    ::  #  %OUT
    ::    OUTGOING DATA
    ++  MOVE  (PAIR BONE CARD)                          ::  ALL ACTIONS
    ++  LIME                                            ::  DIFF FRUIT
      $%  {$HALL-PRIZE PRIZE}                           ::
          {$HALL-RUMOR RUMOR}                           ::
      ==                                                ::
    ++  PEAR                                            ::  POKE FRUIT
      $%  {$HALL-COMMAND COMMAND}                       ::
          {$HALL-ACTION ACTION}                         ::TODO  SEE ++GENTLE-QUIT
      ==                                                ::
    ++  CARD                                            ::  GENERAL CARD
      $%  {$DIFF LIME}                                  ::
          {$INFO WIRE TERM NORI:CLAY}                   ::
          {$PEER WIRE DOCK PATH}                        ::
          {$POKE WIRE DOCK PEAR}                        ::
          {$PULL WIRE DOCK ~}                          ::
          {$QUIT ~}                                    ::
      ==                                                ::
    ++  WEIR                                            ::  PARSED WIRE
      $%  {$REPEAT CIR/CIRCLE SES/(LIST SERIAL)}        ::  MESSAGING WIRE
          {$CIRCLE NOM/NAME SRC/SOURCE}                 ::  SUBSCRIPTION WIRE
      ==                                                ::
    --
::
::  #
::  #  %WORK
::  #
::    FUNCTIONAL CORES AND ARMS.
::
~%  %HALL-DOOR  ..IS  ~
|_  {BOL/BOWL:GALL $1 STATE}
::
::  #  %TRANSITION
::    PREP TRANSITION
::
++  PREP
  ::  ADAPTS STATE.
  ::
  =>  |%
      ++  STATES
        $%({$1 S/STATE} {$0 S/STATE-0})
      ::
      ++  STATE-0
        (CORK STATE |=(A/STATE A(STORIES (~(RUN BY STORIES.A) STORY-0))))
      ++  STORY-0
        %+  CORK  STORY
        |=  A/STORY
        %=  A
          SHAPE     *CONFIG-0
          MIRRORS   (~(RUN BY MIRRORS.A) CONFIG-0)
          PEERS     (~(RUN BY PEERS.A) |=(A/(LIST QUERY) (TURN A QUERY-0)))
        ==
      ++  QUERY-0
        $%  $:  $CIRCLE
                NOM/NAME
                WER/(UNIT CIRCLE)
                WAT/(SET CIRCLE-DATA)
                RAN/RANGE-0
            ==
            QUERY
        ==
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
    %-  PRE-BAKE
    TA-DONE:TA-INIT:TA
  ?-  -.U.OLD
      $1
    [MOS ..PREP(+<+ U.OLD)]
  ::
      $0
    =-  $(OLD `[%1 S.U.OLD(STORIES -)])
    |^  %-  ~(RUN BY STORIES.S.U.OLD)
        |=  SOY/STORY-0
        ^-  STORY
        %=  SOY
          SHAPE     (PREP-CONFIG SHAPE.SOY)
          MIRRORS   (~(RUN BY MIRRORS.SOY) PREP-CONFIG)
          PEERS     %-  ~(RUN BY PEERS.SOY)
                    |=  A/(LIST QUERY-0)
                    ^-  (LIST QUERY)
                    (MURN A PREP-QUERY)
        ==
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
    ++  PREP-QUERY
      |=  QUE/QUERY-0
      ^-  (UNIT QUERY)
      ?.  ?=($CIRCLE -.QUE)  `QUE
      =+  NAN=(PREP-RANGE RAN.QUE)
      ?~  NAN
        ~&  [%FORGETTING-QUERY QUE]
        ~
      `QUE(RAN U.NAN)
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
::  #  %ENGINES
::    MAIN CORES.
::
++  TA
  ::  THINKER CORE, USED FOR PROCESSING POKES INTO DELTAS.
  ::
  ~/  %HALL-TA
  |_  ::  DELTAS: DELTAS CREATED BY CORE OPERATIONS.
      ::
      DELTAS/(LIST DELTA)
  ::  #  %RESOLVE
  ::
  ++  TA-DONE
    ::    RESOLVE CORE
    ::
    ::  PRODUCES THE MOVES STORED IN ++TA'S MOVES.
    ::  THEY ARE PRODUCED IN REVERSE ORDER BECAUSE
    ::  ++TA-EMIL AND ++TA-EMIT ADD THEM TO THE HEAD OF
    ::  THE {MOVES}.
    ::
    ::  WE DON'T PRODUCE ANY NEW STATE, BECAUSE ++TA
    ::  DOESN'T MAKE ANY CHANGES TO IT ITSELF.
    ::
    ^-  (LIST DELTA)
    (FLOP DELTAS)
  ::
  ::  #
  ::  #  %EMITTERS
  ::  #
  ::    ARMS THAT CREATE OUTWARD CHANGES.
  ::
  ++  TA-DELTA
    ::  ADDS A DELTA TO THE HEAD OF {DELTAS}.
    ::
    ~/  %HALL-TA-DELTA
    |=  DET/DELTA
    %_(+> DELTAS [DET DELTAS])
  ::
  ++  TA-DELTAS
    ::    ADDS MULTIPLE DELTAS TO THE HEAD OF {DELTAS}.
    ::
    ::  FLOPS TO STAY CONSISTENT WITH ++TA-DELTA.
    ::
    ~/  %HALL-TA-DELTAS
    |=  DES/(LIST DELTA)
    %_(+> DELTAS (WELP (FLOP DES) DELTAS))
  ::
  ++  TA-SPEAK
    ::  SENDS {SEP} AS AN %APP MESSAGE TO THE USER'S INBOX.
    ::
    ~/  %HALL-TA-SPEAK
    |=  SEP/SPEECH
    %+  TA-ACTION  %PHRASE
    :-  [[OUR.BOL %INBOX] ~ ~]
    [%APP DAP.BOL SEP]~
  ::
  ++  TA-GRIEVE
    ::  SENDS A STACK TRACE TO THE USER'S INBOX.
    ::
    ~/  %HALL-TA-GRIEVE
    |=  {MSG/TAPE FAL/TANG}
    %^  TA-SPEAK  %FAT
      [%NAME 'STACK TRACE' %TANK FAL]
    [%LIN | (CRIP MSG)]
  ::
  ++  TA-NOTE
    ::  SENDS {MSG} TO THE USER'S INBOX.
    ::
    ~/  %HALL-TA-NOTE
    |=  MSG/TAPE
    (TA-SPEAK %LIN | (CRIP MSG))
  ::
  ++  TA-EVIL
    ::  TRACING PRINTF AND CRASH.
    ::
    ~/  %HALL-TA-EVIL
    |=  MSG/CORD
    ~|  [%HALL-TA-EVIL MSG]
    !!
  ::
  ::  #
  ::  #  %DATA
  ::  #
  ::    UTILITY FUNCTIONS FOR DATA RETRIEVAL.
  ::
  ++  TA-KNOW
    ::    STORY MONAD
    ::
    ::  PRODUCES A GILL THAT TAKES A GATE. IF THE STORY
    ::  {NOM} EXISTS, CALLS THE GATE WITH A STORY CORE.
    ::  IF IT DOESN'T, DOES NOTHING.
    ::
    ~/  %HALL-TA-KNOW
    |=  NOM/NAME
    |:  FUN=^|(|:(SO TA))
    ^+  +>+>
    =+  PUR=(~(GET BY STORIES) NOM)
    ?~  PUR
      %-  TA-EVIL
      (CRIP "NO STORY '{(TRIP NOM)}'")
    (FUN ~(. SO NOM ~ U.PUR))
  ::
  ::  #
  ::  #  %INTERACTION-EVENTS
  ::  #
  ::    ARMS THAT APPLY EVENTS WE RECEIVED.
  ::
  ++  TA-INIT
    ::    INITIALIZE APP
    ::
    ::  POPULATE STATE ON FIRST BOOT. CREATES OUR DEFAULT MAILBOX AND JOURNAL.
    ::
    ::  CREATE DEFAULT CIRCLES.
    =>  %+  ROLL
          ^-  (LIST {SECURITY NAME CORD})
          :~  [%MAILBOX %INBOX 'DEFAULT HOME']
              [%JOURNAL %PUBLIC 'VISIBLE ACTIVITY']
              [%MAILBOX %I 'DM INVITES']
          ==
        |:  [[TYP=*SECURITY NOM=*NAME DES=*CORD] TA]
        (TA-ACTION [%CREATE NOM DES TYP])
    %-  TA-DELTAS
    ::  IF NEEDED, SUBSCRIBE TO OUR PARENT'S /BURDEN.
    =+  SEN=(ABOVE:HALL-LIB [OUR NOW OUR]:BOL)
    ?:  ?|  !=(%CZAR (CLAN:TITLE SEN))
            =(SEN OUR.BOL)
            =(%PAWN (CLAN:TITLE OUR.BOL))
        ==
      ~
    [%INIT ~]~
  ::
  ++  TA-APPLY
    ::  APPLIES THE COMMAND SENT BY {SRC}.
    ::
    ~/  %HALL-TA-APPLY
    |=  {SRC/SHIP COD/COMMAND}
    ^+  +>
    ?-  -.COD
      ::  %PUBLISH COMMANDS PROMPT US (AS A CIRCLE HOST)
      ::  TO VERIFY AND DISTRIBUTE MESSAGES.
      $PUBLISH  (TA-THINK | SRC +.COD)
      ::  %PRESENT COMMANDS ARE USED TO ASK US TO SET
      ::  SOMEONE'S STATUS IN THE INDICATED STORIES.
      $PRESENT  (TA-PRESENT SRC +.COD)
      ::  %BEARING COMMANDS ARE USED BY OUR CHILDREN TO
      ::  LET US KNOW THEY'RE BEARING OUR /BURDEN. WE
      ::  NEED TO WATCH THEM TO ALLOW CHANGES TO GO UP.
      $BEARING  (TA-OBSERVE SRC)  ::TODO  ISN'T THIS REDUNDANT WITH TA-SUBSCRIBE?
    ==
  ::
  ++  TA-PRESENT
    ::    UPDATE A STATUS
    ::
    ::  SETS STATUS FOR THE INDICATED STORIES,
    ::  BUT ONLY IF THEY HAVE WRITE PERMISSION THERE.
    ::
    ~/  %HALL-TA-PRESENT
    |=  {WHO/SHIP NOS/(SET NAME) DIF/DIFF-STATUS}
    ^+  +>
    =+  NOL=~(TAP IN NOS)
    |-
    ?~  NOL  +>.^$
    =.  +>.^$
      ?.  (~(HAS BY STORIES) I.NOL)  +>.^$
      =+  SOY=(~(GOT BY STORIES) I.NOL)
      SO-DONE:(~(SO-PRESENT SO I.NOL ~ SOY) WHO DIF)
    $(NOL T.NOL)
  ::
  ++  TA-ACTION
    ::  PERFORMS ACTION SENT BY A CLIENT.
    ::
    ~/  %HALL-TA-ACTION
    |=  ACT/ACTION
    ^+  +>
    =<  WORK
    ::  #
    ::  #  %ACTIONS
    ::  #
    ::    ACTION PROCESSING CORE
    ::
    ::  ++WORK CALLS THE APPROPRIATE ACTION PROCESSING
    ::  ARM. MOST USE ++AFFECT TO RETRIEVE THE AFFECTED
    ::  STORY, CRASHING IF IT DOESN'T EXIST.
    ~%  %HALL-TA-ACTION-INNER  +  ~
    |%
    ::  #  %UTILITY
    ++  WORK                                            ::  PERFORM ACTION
      ^+  ..TA-ACTION
      ?-  -.ACT
        ::  CIRCLE CONFIGURATION
        $CREATE  (ACTION-CREATE +.ACT)
        $DESIGN  (ACTION-DESIGN +.ACT)
        $SOURCE  (ACTION-SOURCE +.ACT)
        $DEPICT  (ACTION-DEPICT +.ACT)
        $FILTER  (ACTION-FILTER +.ACT)
        $PERMIT  (ACTION-PERMIT +.ACT)
        $DELETE  (ACTION-DELETE +.ACT)
        $USAGE   (ACTION-USAGE +.ACT)
        $READ    (ACTION-READ +.ACT)
        $NEWDM   (ACTION-NEWDM +.ACT)
        ::  MESSAGING
        $CONVEY  (ACTION-CONVEY +.ACT)
        $PHRASE  (ACTION-PHRASE +.ACT)
        ::  PERSONAL METADATA
        $NOTIFY  (ACTION-NOTIFY +.ACT)
        $NAMING  (ACTION-NAMING +.ACT)
        ::  CHANGING SHARED UI
        $GLYPH   (ACTION-GLYPH +.ACT)
        $NICK    (ACTION-NICK +.ACT)
        ::  MISC CHANGES
        $PUBLIC  (ACTION-PUBLIC +.ACT)
      ==
    ::
    ++  AFFECT
      ::    DELTA TO STORY
      ::
      ::  STORE A DELTA ABOUT A STORY. IF THE STORY
      ::  DOES NOT EXIST, CRASH.
      ::
      ~/  %HALL-AFFECT
      |=  {NOM/NAME DET/DELTA-STORY}
      ?:  (~(HAS BY STORIES) NOM)
        (IMPACT NOM DET)
      (TA-EVIL (CRIP "NO STORY {(TRIP NOM)}"))
    ::
    ++  IMPACT
      ::    DELTA FOR STORY
      ::
      ::  STORE A DELTA ABOUT A STORY.
      ::
      ~/  %HALL-IMPACT
      |=  {NOM/NAME DET/DELTA-STORY}
      (TA-DELTA %STORY NOM DET)
    ::
    ++  PRESENT
      ::  SEND STATUS UPDATE
      ::
      ~/  %HALL-PRESENT
      |=  {AUD/AUDIENCE DIF/DIFF-STATUS}
      ^+  ..TA-ACTION
      =/  CIC
        ^-  (JUG SHIP NAME)
        %-  ~(REP IN AUD)
        |=  {C/CIRCLE M/(JUG SHIP NAME)}
        (~(PUT JU M) HOS.C NOM.C)
      =?  ..TA-ACTION  (~(HAS BY CIC) OUR.BOL)
        =+  NOS=~(TAP IN (~(GET JU CIC) OUR.BOL))
        (TA-PRESENT OUR.BOL (~(GET JU CIC) OUR.BOL) DIF)
      =.  CIC  (~(DEL BY CIC) OUR.BOL)
      %-  TA-DELTAS
      %-  ~(REP BY CIC)
      |=  {{H/SHIP S/(SET NAME)} L/(LIST DELTA)}
      :_  L
      [%PRESENT H S DIF]
    ::
    ::  #  %CIRCLE-CONFIGURATION
    ++  ACTION-CREATE
      ::  CREATES A STORY WITH THE SPECIFIED PARAMETERS.
      ::
      ~/  %HALL-ACTION-CREATE
      |=  {NOM/NAME DES/CORD TYP/SECURITY}
      ^+  ..TA-ACTION
      ?.  (~(HAS BY STORIES) NOM)
        %^  IMPACT  NOM  %NEW
        :*  [[[OUR.BOL NOM] ~] ~ ~]
            DES
            ~
            *FILTER
            :-  TYP
            ?.  ?=(?($VILLAGE $JOURNAL) TYP)  ~
            [OUR.BOL ~ ~]
            0
        ==
      (TA-EVIL (CRIP "{(TRIP NOM)}: ALREADY EXISTS"))
    ::
    ++  ACTION-DESIGN
      ::  CREATES A STORY WITH THE SPECIFIED CONFIG.
      ::
      ~/  %HALL-ACTION-DESIGN
      |=  {NOM/NAME COF/CONFIG}
      ?.  (~(HAS BY STORIES) NOM)
        (IMPACT NOM %NEW COF)
      (TA-EVIL (CRIP "{(TRIP NOM)}: ALREADY EXISTS"))
    ::
    ++  ACTION-DELETE
      ::    DELETE + ANNOUNCE
      ::
      ::  DELETE STORY {NOM}, OPTIONALLY ANNOUNCING THE
      ::  EVENT WITH MESSAGE {MES}.
      ::
      ~/  %HALL-ACTION-DELETE
      |=  {NOM/NAME MES/(UNIT CORD)}
      ^+  ..TA-ACTION
      =?  ..TA-ACTION  ?=(^ MES)
        %+  ACTION-PHRASE
          [[OUR.BOL NOM] ~ ~]
        [%LIN | U.MES]~
      (AFFECT NOM %REMOVE ~)
    ::
    ++  ACTION-DEPICT
      ::  CHANGE DESCRIPTION OF STORY {NOM} TO {DES}.
      ::
      ~/  %HALL-DEPICT
      |=  {NOM/NAME CAP/CORD}
      (AFFECT NOM %CONFIG [OUR.BOL NOM] %CAPTION CAP)
    ::
    ++  ACTION-FILTER
      ::    CHANGE MESSAGE RULES
      ::
      ::  REPLACES THE STORY'S CURRENT FILTER WITH THE
      ::  SPECIFIED ONE.
      ::
      ~/  %HALL-ACTION-FILTER
      |=  {NOM/NAME FIT/FILTER}
      (AFFECT NOM %CONFIG [OUR.BOL NOM] %FILTER FIT)
    ::
    ++  ACTION-PERMIT
      ::  INVITE TO/BANISH FROM STORY {NOM} ALL {SIS}.
      ::
      ~/  %HALL-ACTION-PERMIT
      |=  {NOM/NAME INV/? SIS/(SET SHIP)}
      =+  SOY=(~(GET BY STORIES) NOM)
      ?~  SOY
        (TA-EVIL (CRIP "NO STORY {(TRIP NOM)}"))
      SO-DONE:(~(SO-PERMIT SO NOM ~ U.SOY) INV SIS)
    ::
    ++  ACTION-SOURCE
      ::  ADD/REMOVE {POS} AS SOURCES FOR STORY {NOM}.
      ::
      ~/  %HALL-ACTION-SOURCE
      |=  {NOM/NAME SUB/? SRS/(SET SOURCE)}
      =+  SOY=(~(GET BY STORIES) NOM)
      ?~  SOY
        (TA-EVIL (CRIP "NO STORY {(TRIP NOM)}"))
      SO-DONE:(~(SO-SOURCES SO NOM ~ U.SOY) SUB SRS)
    ::
    ++  ACTION-USAGE
      ::  ADD OR REMOVE USAGE TAGS.
      ::
      ~/  %HALL-ACTION-USAGE
      |=  {NOM/NAME ADD/? TAS/TAGS}
      =+  SOY=(~(GET BY STORIES) NOM)
      ?~  SOY
        (TA-EVIL (CRIP "NO STORY {(TRIP NOM)}"))
      SO-DONE:(~(SO-USAGE SO NOM ~ U.SOY) ADD TAS)
    ::
    ++  ACTION-READ
      ::  SET THE READ MESSAGE NUMBER
      ::
      ~/  %HALL-ACTION-READ
      |=  {NOM/NAME RED/@UD}
      =+  SOY=(~(GET BY STORIES) NOM)
      ?~  SOY
        (TA-EVIL (CRIP "NO STORY {(TRIP NOM)}"))
      SO-DONE:(~(SO-READ SO NOM ~ U.SOY) RED)
    ::
    ++  ACTION-NEWDM
      ::  COPY ALL BEHAVIOR OF CREATE, PERMIT, AND SOURCE IN THAT ORDER
      ::
      ~/  %HALL-ACTION-NEWDM
      |=  SIS/(SET SHIP)
      ::  GENERATE CIRCLE NAME FROM SIS AS A DOT SEPERATED LIST OF SHIP NAMES
      ::  IN ALPHABETICAL ORDER
      ::
      =/  NOM/NAME
      %^  RSH  3  1
      %+  ROLL
        %+  SORT  %+  TURN  ~(TAP IN (~(PUT IN SIS) OUR.BOL))
        |=  P/SHIP
        ^-  CORD
        (SCOT %P P)
        AOR
      |=  {P/CORD NAM/NAME}
      ^-  @TAS
      (CRIP "{(TRIP `@T`NAM)}.{(SLAG 1 (TRIP P))}")
      ::  IF WE'VE ALREADY CREATED THIS CIRCLE, NO-OP
      ::
      ?:  (~(HAS IN ~(KEY BY STORIES)) NOM)
        (TA-DELTAS ~)
      ::  CHECK IF WE ALREADY HAVE AN INVITE TO THIS DM GROUP
      ::  OR IF WE ARE CREATING IT
      ::
      =/  INV=(LIST TELEGRAM)
      %+  SKIM  GRAMS:(~(GOT BY STORIES) %I)
      |=  G=TELEGRAM
      ^-  ?
      ?.  ?=({$INV *} SEP.G)     %.N
      ?.  =(NOM NOM.CIR.SEP.G)   %.N
      ?.  (~(HAS IN SIS) AUT.G)  %.N
      %.Y
      ::
      =.  INV  %+  SORT  INV
        |=  {A/TELEGRAM B/TELEGRAM}
        (LTE WEN.A WEN.B)
      ::  CREATE OUR SIDE OF THE DM AND SOURCE IT TO OUR INBOX
      ::
      =/  DELS/(LIST DELTA)
      :~  :*  %STORY
              %INBOX
              %FOLLOW
              &
              [[[OUR.BOL NOM] ~] ~ ~]
          ==
          :*  %STORY
              NOM
              %NEW
              [[[OUR.BOL NOM] ~] ~ ~]
              'DM'
              ~
              *FILTER
              [%VILLAGE (~(PUT IN SIS) OUR.BOL)]
              0
          ==
      ==
      ::  IF WE DID INITIATE THE DM, SEND OUT INVITES
      ::
      ?:  ?=(~ INV)
        =.  ..TA-ACTION  (TA-DELTAS DELS)
        %-  ACTION-CONVEY
        ^-  (LIST THOUGHT)
        %+  TURN  ~(TAP IN (~(DEL IN SIS) OUR.BOL))
        |=  A=SHIP
        ^-  THOUGHT
        :*  UID=(SHAF A ENY.BOL)
            AUD=(SY [A %I] ~)
            WEN=NOW.BOL
            SEP=[%INV & [OUR.BOL NOM]]
        ==
      ::  IF WE DID NOT INITIATE THE DM, SOURCE TO THE INITIATORS COPY
      ::
      =.  DELS
      :_  DELS
      :*  %STORY
          NOM
          %FOLLOW
          &
          [[[AUT.I.INV NOM] ~] ~ ~]
      ==
      (TA-DELTAS DELS)
    ::
    ::  #  %MESSAGING
    ++  ACTION-CONVEY
      ::    POST EXACT
      ::
      ::  SENDS THE MESSAGES PROVIDED IN THE ACTION.
      ::
      ~/  %HALL-ACTION-CONVEY
      |=  TOS/(LIST THOUGHT)
      (TA-THINK & OUR.BOL TOS)
    ::
    ++  ACTION-PHRASE
      ::    POST EASY
      ::
      ::  SENDS THE MESSAGE CONTENTS PROVIDED IN THE
      ::  ACTION GENERATING A SERIAL AND SETTING A
      ::  TIMESTAMP.
      ::
      ~/  %HALL-ACTION-PHRASE
      |=  {AUD/AUDIENCE SES/(LIST SPEECH)}
      ^+  ..TA-ACTION
      =-  (TA-THINK & OUR.BOL TOS)
      |-  ^-  TOS/(LIST THOUGHT)
      ?~  SES  ~
      =^  SIR  ENY.BOL  ~(UNIQ HALL-LIB BOL)
      :_  $(SES T.SES)
      [SIR AUD [NOW.BOL I.SES]]
    ::
    ::  #  %PERSONAL-METADATA
    ::
    ++  ACTION-NOTIFY
      ::    OUR PRESENCE UPDATE
      ::
      ::  NOTIFY THE AUDIENCE OF OUR NEW PRESENCE STATE,
      ::  OR TELL THEM TO REMOVE US IF {PES} IS ~.
      ::
      ~/  %HALL-ACTION-NOTIFY
      |=  {AUD/AUDIENCE PES/(UNIT PRESENCE)}
      ^+  ..TA-ACTION
      ?~  PES  (PRESENT AUD %REMOVE ~)
      (PRESENT AUD %PRESENCE U.PES)
    ::
    ++  ACTION-NAMING
      ::  OUR NAME UPDATE
      ::
      ~/  %HALL-ACTION-NAMING
      |=  {AUD/AUDIENCE MAN/HUMAN}
      ^+  ..TA-ACTION
      (PRESENT AUD %HUMAN %FULL MAN)
    ::
    ::  #  %CHANGING-SHARED-UI
    ++  ACTION-NICK
      ::    NEW IDENTITY
      ::
      ::  ASSIGNS A NEW LOCAL IDENTITY ("NICKNAME") TO THE
      ::  TARGET SHIP.
      ::
      ~/  %HALL-ACTION-NICK
      |=  {WHO/SHIP NIC/NICK}
      ^+  ..TA-ACTION
      ?.  =((~(GET BY NICKS) WHO) `NIC)  ..TA-ACTION    ::  NO CHANGE
      (TA-DELTA %NICK WHO NIC)
    ::
    ++  ACTION-GLYPH
      ::  UN/BIND GLYPH {LIF} TO AUDIENCE {AUD}.
      ::
      ~/  %HALL-ACTION-GLYPH
      |=  {LIF/CHAR AUD/AUDIENCE BIN/?}
      (TA-DELTA %GLYPH BIN LIF AUD)
    ::
    ++  ACTION-PUBLIC
      ::    SHOW/HIDE MEMBERSHIP
      ::
      ::  ADD OR REMOVE A CIRCLE FROM THE PUBLIC MEMBERSHIP LIST.
      ::
      ~/  %HALL-ACTION-PUBLIC
      |=  {ADD/? CIR/CIRCLE}
      (TA-DELTA %PUBLIC ADD CIR)
    --
  ::
  ::  #
  ::  #  %SUBSCRIPTION-EVENTS
  ::  #
  ::    ARMS THAT REACT TO SUBSCRIPTION EVENTS.
  ::
  ++  TA-OBSERVE
    ::    WATCH BURDEN BEARER
    ::
    ::  SUBSCRIBE TO A CHILD WHO IS BEARING OUR BURDEN.
    ::TODO  EVERYONE SHOULD BE ABLE TO BEAR IF THEY SO DESIRE.
    ::
    ~/  %HALL-TA-OBSERVE
    |=  WHO/SHIP
    ^+  +>
    ?.  =(OUR.BOL (ABOVE:HALL-LIB OUR.BOL NOW.BOL WHO))
      ~&([%NOT-OUR-BEARER WHO] +>)
    (TA-DELTA %OBSERVE WHO)
  ::
  ++  TA-SUBSCRIBE
    ::    LISTEN TO
    ::
    ::  REACTION TO INCOMING SUBSCRIPTIONS.
    ::
    ~/  %HALL-TA-SUBSCRIBE
    |=  {HER/SHIP QER/QUERY}
    ^+  +>
    ?+  -.QER  +>
      $BURDEN   (TA-OBSERVE HER)
      $CIRCLE   %+  TA-DELTA  %STORY
                [NOM.QER %PEER & HER QER]
    ==
  ::
  ++  TA-GREET
    ::    SUBSCRIPTION SUCCESS
    ::
    ::  STORE A STARTED SUBSCRIPTION AS SOURCE.
    ::
    ~/  %HALL-TA-GREET
    |=  {NOM/NAME SRC/SOURCE}
    %-  (TA-KNOW NOM)  |=  SOR/_SO  =<  SO-DONE
    (SO-GREET:SOR SRC)
  ::
  ++  TA-LEAVE
    ::    SUBSCRIPTION FAILED
    ::
    ::  REMOVES {SRC} FROM STORY {NOM}'S SOURCES.
    ::
    ~/  %HALL-TA-LEAVE
    |=  {NOM/NAME SRC/SOURCE}
    %-  (TA-KNOW NOM)  |=  SOR/_SO  =<  SO-DONE
    (SO-LEAVE:SOR SRC)
  ::
  ++  TA-TAKE
    ::    APPLY PRIZE
    ::
    ::  FOR A %BURDEN PRIZE, BEAR THE BURDEN IN A NEW
    ::  OR EXISTING STORY.
    ::  FOR A %CIRCLE PRIZE, USE ++SO TO ACCEPT IT.
    ::  FOR A %REPORT PRIZE, SILENTLY IGNORE.
    ::
    ~/  %HALL-TA-TAKE
    |=  {WIR/WIRE PIZ/PRIZE}
    ^+  +>
    ?+  -.PIZ  ~&([%IGNORING-PRIZE -.PIZ] +>)
        $REPORT
      +>
    ::
        $BURDEN
      =+  SOS=~(TAP BY SOS.PIZ)
      |-  ^+  ..TA-TAKE
      ?~  SOS  ..TA-TAKE
      =.  ..TA-TAKE
        =+  (FALL (~(GET BY STORIES) P.I.SOS) *STORY)
        =>  (~(SO-BEAR SO P.I.SOS ~ -) Q.I.SOS)
        =.  ACS  (FLOP ACS)
        |-  ^+  ..TA-TAKE
        ?~  ACS  ..TA-TAKE
        =.  ..TA-TAKE  (TA-ACTION I.ACS)
        $(ACS T.ACS)
      $(SOS T.SOS)
      ::TODO  RUNTIME ERROR
      ::%+  ROLL  ~(TAP BY SOS.PIZ)
      ::|=  {{N/NAME B/BURDEN} _..TA-TAKE}
      ::=+  (FALL (~(GET BY STORIES) N) *STORY)
      ::SO-DONE:(~(SO-BEAR SO N ~ -) B)
    ::
        $CIRCLE
      =+  WER=(ETCH WIR)
      ?>  ?=($CIRCLE -.WER)
      %-  (TA-KNOW NOM.WER)  |=  SOR/_SO  =<  SO-DONE
      (SO-TAKE:SOR CIR.SRC.WER +.PIZ)
    ==
  ::
  ++  TA-HEAR
    ::    APPLY RUMOR
    ::
    ::  APPLY CHANGES FROM A RUMOR TO OUR STATE.
    ::  FOR %BURDEN, AUTHORATIVELY APPLY THE STORY
    ::  DIFF. IF IT'S A NEW ONE, BEAR IT.
    ::  FOR %CIRCLE, APPLY THE STORY DIFF NORMALLY.
    ::
    ~/  %HALL-TA-HEAR
    |=  {WIR/WIRE RUM/RUMOR}
    ^+  +>
    ?+  -.RUM
      ~&([%IGNORING-RUMOR -.RUM] +>)
    ::
        $BURDEN
      ?+  -.RUM.RUM
        %-  (TA-KNOW NOM.RUM)  |=  SOR/_SO  =<  SO-DONE
        (SO-HEAR:SOR & [OUR.BOL NOM.RUM] RUM.RUM)
      ::
          $NEW
        =?  +>  !(~(HAS BY STORIES) NOM.RUM)
          (TA-DELTA %STORY +.RUM)
        =>  =+  (FALL (~(GET BY STORIES) NOM.RUM) *STORY)
            %-  ~(SO-BEAR SO NOM.RUM ~ -)
            [~ [COF.RUM.RUM ~] [~ ~]]
        =.  ACS  (FLOP ACS)
        |-  ^+  +>+
        ?~  ACS  +>+
        =.  +>+  (TA-ACTION I.ACS)
        $(ACS T.ACS)
        ::TODO  RUNTIME ERROR
        ::=<  SO-DONE
        ::%-  ~(SO-BEAR SO NOM.RUM ~ (FALL (~(GET BY STORIES) NOM.RUM) *STORY))
        ::[~ [COF.RUM.RUM ~] [~ ~]]
      ==
    ::
        $CIRCLE
      =+  WER=(ETCH WIR)
      ?>  ?=($CIRCLE -.WER)
      %-  (TA-KNOW NOM.WER)  |=  SOR/_SO  =<  SO-DONE
      (SO-HEAR:SOR | CIR.SRC.WER RUM.RUM)
    ==
  ::
  ++  TA-REPEAT
    ::    MESSAGE DELIVERED
    ::
    ::  MESSAGE GOT DELIVERED. IF AN ERROR WAS RETURNED
    ::  MARK THE MESSAGE AS REJECTED. IF NOT, RECEIVED.
    ::
    ~/  %HALL-TA-REPEAT
    |=  {WHO/CIRCLE SES/(LIST SERIAL) FAL/(UNIT TANG)}
    ^+  +>
    ?~  FAL
      (TA-DELTA %DONE WHO SES %ACCEPTED)
    =.  +>  (TA-DELTA %DONE WHO SES %REJECTED)
    =-  (TA-GRIEVE - U.FAL)
    %+  WELD  "{(SCOW %UD (LENT SES))} MESSAGE(S) "
    "REJECTED BY {(SCOW %P HOS.WHO)}/{(TRIP NOM.WHO)}"
  ::
  ++  TA-RESUB
    ::    SUBSCRIPTION DROPPED
    ::
    ::  WHEN A SUBSCRIPTION GETS DROPPED BY GALL, WE
    ::  RESUBSCRIBE.
    ::
    ~/  %HALL-TA-RESUB
    |=  {NOM/NAME SRC/SOURCE}
    ^+  +>
    %-  (TA-KNOW NOM)  |=  SOR/_SO  =<  SO-DONE
    (SO-RESUB:SOR SRC)
  ::
  ::  #
  ::  #  %MESSAGING
  ::  #
  ::    ARMS FOR SENDING AND PROCESSING MESSAGES.
  ::
  ++  TA-THINK
    ::    PUBLISH OR REVIEW
    ::
    ::  CONSUMES EACH THOUGHT.
    ::
    ~/  %HALL-TA-THINK
    |=  {PUB/? AUT/SHIP TOS/(LIST THOUGHT)}
    ^+  +>
    ?~  TOS  +>
    $(TOS T.TOS, +> (TA-CONSUME PUB AUT I.TOS))
  ::
  ++  TA-CONSUME
    ::    TO EACH AUDIENCE
    ::
    ::  CONDUCTS THOUGHT {TOT} TO EACH CIRCLE IN ITS AUDIENCE.
    ::
    ~/  %HALL-TA-CONSUME
    |=  {PUB/? AUT/SHIP TOT/THOUGHT}
    =+  AUD=~(TAP IN AUD.TOT)
    |-  ^+  +>.^$
    ?~  AUD  +>.^$
    $(AUD T.AUD, +>.^$ (TA-CONDUCT PUB AUT I.AUD TOT))
  ::
  ++  TA-CONDUCT
    ::    THOUGHT TO CIRCLE
    ::
    ::  EITHER PUBLISHES OR RECORDS A THOUGHT.
    ::
    ~/  %HALL-TA-CONDUCT
    |=  {PUB/? AUT/SHIP CIR/CIRCLE TOT/THOUGHT}
    ^+  +>
    ?:  PUB
      ?.  (TEAM:TITLE OUR.BOL AUT)
        (TA-NOTE "STRANGE AUTHOR {(SCOW %P AUT)}")
      =.  AUT  OUR.BOL
      ?:  =(AUT HOS.CIR)
        ?:  (~(HAS BY STORIES) NOM.CIR)
          (TA-RECORD NOM.CIR HOS.CIR TOT)
        ::TODO  AVENUE FOR ABUSE?
        (TA-NOTE "HAVE NO STORY {(SCOW %TAS NOM.CIR)}")
      (TA-TRANSMIT CIR TOT)
    ?.  =(OUR.BOL HOS.CIR)  +>
    (TA-RECORD NOM.CIR AUT TOT)
  ::
  ++  TA-RECORD
    ::    ADD TO STORY
    ::
    ::  ADD OR UPDATE TELEGRAM {GAM} IN STORY {NOM}.
    ::
    ~/  %HALL-TA-RECORD
    |=  {NOM/NAME GAM/TELEGRAM}
    %-  (TA-KNOW NOM)  |=  SOR/_SO  =<  SO-DONE
    (SO-LEARN:SOR [OUR.BOL NOM] GAM)
  ::
  ++  TA-TRANSMIT
    ::  SENDS THOUGHT {TOT} TO {CIR}.
    ::
    ~/  %HALL-TA-TRANSMIT
    |=  {CIR/CIRCLE TOT/THOUGHT}
    ^+  +>
    (TA-DELTA %OUT CIR TOT ~)
  ::
  ::  #
  ::  #  %STORIES
  ::  #
  ::    ARMS FOR MODIFYING STORIES.
  ::
  ++  SO
    ::  STORY CORE, USED FOR DOING WORK ON A STORY.
    ::
    ~/  %HALL-SO
    |_  ::  NOM: STORY NAME IN {STORIES}.
        ::  ACS: HALL ACTIONS ISSUED DUE TO CHANGES.
        ::  STORY IS FACELESS TO EASE DATA ACCESS.
        ::
        $:  NOM/NAME
            ACS/(LIST ACTION)
            STORY
        ==
    ::
    ::  #  %RESOLVE
    ++  SO-DONE
      ::  APPLY ACTIONS GENERATED BY STORY OPERATIONS.
      ::TODO  MAYBE PRODUCE LIST OF ACTIONS, APPLY IN ++TA
      ::
      ^+  +>
      =.  ACS  (FLOP ACS)
      |-  ^+  +>+
      ?~  ACS  +>+
      =.  +>+  (TA-ACTION I.ACS)
      $(ACS T.ACS)
    ::
    ::  #
    ::  #  %EMITTERS
    ::  #
    ::    ARMS THAT CREATE OUTWARD CHANGES.
    ::
    ++  SO-ACT
      ::  STORES A HALL ACTION.
      ::
      ~/  %HALL-SO-ACT
      |=  ACT/ACTION
      ^+  +>
      +>(ACS [ACT ACS])
    ::
    ++  SO-NOTE
      ::  SENDS {MSG} AS AN %APP MESSAGE TO THE USER'S INBOX.
      ::
      ~/  %HALL-SO-NOTE
      |=  MSG/CORD
      ^+  +>
      %+  SO-ACT  %PHRASE
      :-  [[OUR.BOL %INBOX] ~ ~]
      [%APP DAP.BOL %LIN | MSG]~
    ::
    ++  SO-DELTA
      ::  STORE DELTA IN ++TA CORE.
      ::
      ~/  %HALL-SO-DELTA
      |=  DET/DELTA
      ^+  +>
      +>(DELTAS [DET DELTAS])
    ::
    ++  SO-DELTAS
      ::  STORE MULTIPLE DELTAS IN ++TA CORE.
      ::
      ~/  %HALL-SO-DELTAS
      |=  DES/(LIST DELTA)
      %_(+> DELTAS (WELP (FLOP DES) DELTAS))
    ::
    ++  SO-DELTA-OUR
      ::  ADDS A DELTA ABOUT THIS STORY.
      ::
      ~/  %HALL-SO-DELTA-OUR
      |=  DET/DELTA-STORY
      ^+  +>
      (SO-DELTA %STORY NOM DET)
    ::
    ++  SO-DELTAS-OUR
      ::  ADDS MULTIPLE DELTAS ABOUT THIS STORY.
      ::
      ~/  %HALL-SO-DELTAS-OUR
      |=  DES/(LIST DELTA-STORY)
      ^+  +>
      %-  SO-DELTAS
      %+  TURN  DES
      |=  D/DELTA-STORY
      [%STORY NOM D]
    ::
    ::  #
    ::  #  %DATA
    ::  #
    ::    UTILITY FUNCTIONS FOR DATA RETRIEVAL.
    ::
    ++  SO-CIR  [OUR.BOL NOM]                           ::  US AS CIRCLE
    ::
    ::  #
    ::  #  %INTERACTION-EVENTS
    ::  #
    ::    ARMS THAT APPLY EVENTS WE RECEIVED.
    ::
    ++  SO-TAKE
      ::  APPLY THE PRIZE AS IF IT WERE RUMORS.
      ::
      ~/  %HALL-SO-TAKE
      |=  {SRC/CIRCLE NES/(LIST ENVELOPE) COS/LOBBY PES/CROWD}
      ^+  +>
      =.  +>.$
        (SO-HEAR | SRC %CONFIG SRC %FULL LOC.COS)
      =.  +>.$
        =+  LOS=~(TAP BY LOC.PES)
        |-
        ?~  LOS  +>.^$
        =.  +>.^$
          (SO-HEAR | SRC %STATUS SRC P.I.LOS %FULL Q.I.LOS)
        $(LOS T.LOS)
        ::TODO  IDEALLY YOU'D JUST DO THIS, BUT THAT RUNTIME ERRORS...
        ::%-  ~(REP IN LOC.PES)
        ::|=  {{W/SHIP S/STATUS} _+>.$}
        ::(SO-HEAR | SRC %STATUS SRC W %FULL S)
      (SO-UNPACK SRC NES)
    ::
    ++  SO-HEAR
      ::  APPLY CHANGES FROM A RUMOR TO THIS STORY.
      ::
      ~/  %HALL-SO-HEAR
      |=  {BUR/? SRC/CIRCLE RUM/RUMOR-STORY}
      ::TODO  TALL-FORM GATE COMMENTS LIKE THIS FOR EVERYTHING?
      ::|=  $:  ::  BUR: WHETHER THE STORY IS INHERITED
      ::        ::  SRC: STORY TO CHANGE
      ::        ::  RUM: CHANGE TO THIS STORY
      ::        ::
      ::        BUR/?
      ::        SRC/CIRCLE
      ::        RUM/RUMOR-STORY
      ::    ==
      ^+  +>
      ?-  -.RUM
        $BEAR     (SO-BEAR BUR.RUM)
        $PEER     (SO-DELTA-OUR RUM)
        $GRAM     (SO-OPEN SRC NEV.RUM)
        $REMOVE   ::TODO  SHOULD ALSO REMOVE FROM {REMOTES}?
                  (SO-DELTA-OUR %CONFIG SRC %REMOVE ~)
      ::
          $NEW
        ?:  =(SRC SO-CIR)
          (SO-CONFIG-FULL ~ COF.RUM)
        $(RUM [%CONFIG SRC %FULL COF.RUM])
      ::
          $CONFIG
        ::  WE ONLY SUBSCRIBE TO REMOTES' CONFIGS.
        ?.  =(SRC CIR.RUM)
          ~!  %UNEXPECTED-REMOTE-CONFIG-FROM-REMOTE
          !!
        =/  OLD/(UNIT CONFIG)
          ?:  =(CIR.RUM SO-CIR)  `SHAPE
          (~(GET BY MIRRORS) CIR.RUM)
        ::  IGNORE IF IT WON'T RESULT IN CHANGE.
        ?.  ?|  &(?=($REMOVE -.DIF.RUM) ?=(^ OLD))
                ?=(~ OLD)
                !=(U.OLD (CHANGE-CONFIG:HALL-LIB U.OLD DIF.RUM))
            ==
          +>.$
        ::  FULL CHANGES TO US NEED TO GET SPLIT UP.
        ?:  &(=(CIR.RUM SO-CIR) ?=($FULL -.DIF.RUM))
          (SO-CONFIG-FULL `SHAPE COF.DIF.RUM)
        (SO-DELTA-OUR RUM)
      ::
          $STATUS
        ::  WE ONLY SUBSCRIBE TO REMOTES' LOCALS.
        ?.  |(=(SRC CIR.RUM) =(SRC SO-CIR))
          ~!  %UNEXPECTED-REMOTE-STATUS-FROM-REMOTE
          !!
        =/  OLD/(UNIT STATUS)
          ?:  =(CIR.RUM SO-CIR)  (~(GET BY LOCALS) WHO.RUM)
          =-  (~(GET BY -) WHO.RUM)
          (FALL (~(GET BY REMOTES) CIR.RUM) *GROUP)
        ::  IGNORE IF IT WON'T RESULT IN CHANGE.
        ?.  ?|  &(?=($REMOVE -.DIF.RUM) ?=(^ OLD))
                ?=(~ OLD)
                !=(U.OLD (CHANGE-STATUS:HALL-LIB U.OLD DIF.RUM))
            ==
          +>.$
        (SO-DELTA-OUR RUM)
      ==
    ::
    ++  SO-BEAR
      ::    ACCEPT BURDEN
      ::
      ::  ADD WHAT WAS PUSHED DOWN FROM ABOVE TO OUR
      ::  STATE. IN CASE OF CONFLICT, EXISTING DATA IS
      ::  OVERWRITTEN.
      ::
      ::NOTE  WE DON'T USE ++ROLL HERE BECAUSE OF URBIT/ARVO#447.
      ::
      ~/  %HALL-SO-BEAR
      |=  {GAZ/(LIST TELEGRAM) COS/LOBBY PES/CROWD}
      ^+  +>
      =*  SELF  +>
      ::
      ::  LOCAL CONFIG
      =.  SELF
        (SO-CONFIG-FULL `SHAPE LOC.COS)
      ::
      ::  REMOTE CONFIG
      =.  SELF
        =+  REM=~(TAP BY REM.COS)
        |-  ^+  SELF
        ?~  REM  SELF
        =*  WER  P.I.REM
        =*  COF  Q.I.REM
        ::  ONLY MAKE A DELTA IF IT ACTUALLY CHANGED.
        =?  SELF  !=(`COF (~(GET BY MIRRORS) WER))
          (SO-DELTA-OUR %CONFIG WER %FULL COF)
        $(REM T.REM)
      ::
      ::  LOCAL STATUS
      =.  SELF
        =+  SAS=~(TAP BY LOC.PES)
        |-  ^+  SELF
        ?~  SAS  SELF
        =*  WHO  P.I.SAS
        =*  SAT  Q.I.SAS
        ::  ONLY MAKE A DELTA IF IT ACTUALLY CHANGED.
        =?  DELTAS  !=(`SAT (~(GET BY LOCALS) WHO))
          :_  DELTAS
          :^  %STORY  NOM  %STATUS
          [[OUR.BOL NOM] WHO %FULL SAT]
        $(SAS T.SAS)
      ::
      ::  REMOTE STATUS
      =.  SELF
        =+  REM=~(TAP BY REM.PES)
        |-  ^+  SELF
        ?~  REM  SELF
        =*  WER  P.I.REM
        =*  GOU  Q.I.REM
        ::  ONLY MAKE DELTAS IF IT ACTUALLY CHANGED.
        =?  DELTAS  !=(`GOU (~(GET BY REMOTES) WER))
          %+  WELP  DELTAS
          =+  GOP=~(TAP BY GOU)
          =+  HAV=(FALL (~(GET BY REMOTES) WER) *GROUP)
          =|  L/(LIST DELTA)
          |-  ^+  L
          ?~  GOP  L
          =*  WHO  P.I.GOP
          =*  SAT  Q.I.GOP
          ::  ONLY MAKE A DELTA IF IT ACTUALLY CHANGED.
          =?  L  !=(`SAT (~(GET BY HAV) WHO))
            [[%STORY NOM %STATUS WER WHO %FULL SAT] L]
          $(GOP T.GOP)
        $(REM T.REM)
      ::
      ::  TELEGRAMS
      =.  SELF
        %_  SELF
            DELTAS
          %+  WELP  DELTAS
          %-  FLOP
          ^-  (LIST DELTA)
          %+  MURN  GAZ
          |=  T/TELEGRAM
          ^-  (UNIT DELTA)
          ::  IN AUDIENCE, REPLACE ABOVE WITH US.
          ::TODO  THIS REALLY SHOULD BE DONE BY THE SENDER.
          =.  AUD.T
            =+  DEM=[(ABOVE:HALL-LIB [OUR NOW OUR]:BOL) NOM]
            ?.  (~(HAS IN AUD.T) DEM)  AUD.T
            =+  (~(DEL IN AUD.T) DEM)
            (~(PUT IN -) SO-CIR)
          =+  NUM=(~(GET BY KNOWN) UID.T)
          ?:  &(?=(^ NUM) =(T (SNAG U.NUM GRAMS)))  ~
          ::TODO  THIS REALLY SHOULD HAVE SENT US THE MESSAGE
          ::      SRC AS WELL BUT THAT'S NOT AN EASY FIX.
          `[%STORY NOM %GRAM [(ABOVE:HALL-LIB [OUR NOW OUR]:BOL) NOM] T]
        ==
      ::  INHERITED FLAG
      %_(SELF DELTAS [[%STORY NOM %INHERITED &] DELTAS])
      ::TODO  RUNTIME ERROR
      ::(SO-DELTA-OUR %INHERITED &)
    ::
    ::  #
    ::  #  %CHANGES
    ::  #
    ::    ARMS THAT MAKE MISCELLANEOUS CHANGES TO THIS STORY.
    ::
    ++  SO-PRESENT
      ::  ACCEPT STATUS DIFF
      ~/  %HALL-SO-PRESENT
      |=  {WHO/SHIP DIF/DIFF-STATUS}
      ^+  +>
      ::  ONLY HAVE PRESENCE IF YOU HAVE WRITE PERMISSION.
      ?.  |((SO-ADMIRE WHO) ?=($REMOVE -.DIF))  +>
      ::  IGNORE IF IT WON'T RESULT IN CHANGE,
      ::  OR IF IT SETS AN IMPERSONATING HANDLE.
      ?.  ?:  ?=($REMOVE -.DIF)  (~(HAS BY LOCALS) WHO)
          ?|  !(~(HAS BY LOCALS) WHO)
            ::
              =+  OLD=(~(GOT BY LOCALS) WHO)
              =+  NEW=(CHANGE-STATUS:HALL-LIB - DIF)
              ?&  !=(OLD NEW)
                ::
                  ?=  ~
                  (RUSH (FALL HAN.MAN.NEW '') ;~(PFIX SIG FED:AG))
                  ::TODO  CALLING WITH %+ GIVES SYNTAX ERROR
              ==
          ==
        +>
      (SO-DELTA-OUR %STATUS SO-CIR WHO DIF)
    ::
    ++  SO-CONFIG-FULL
      ::    SPLIT FULL CONFIG
      ::
      ::  SPLIT A %FULL CONFIG DELTA UP INTO MULTIPLE
      ::  SMALLER ONES, FOR EASIER APPLICATION.
      ::
      ~/  %HALL-SO-CONFIG-FULL
      |=  {OLD/(UNIT CONFIG) COF/CONFIG}
      ^+  +>
      ~?  &(?=(^ OLD) !=(SRC.U.OLD SRC.COF))
        %MAYBE-MISSING-SRC-CHANGES
      %-  SO-DELTAS
      =-  %+  TURN  -
          |=  D/DIFF-CONFIG
          [%STORY NOM [%CONFIG SO-CIR D]]
      ^-  (LIST DIFF-CONFIG)
      ::TODO  FIGURE OUT HOW TO DEAL WITH SRC CHANGES HERE.
      ::      %FOLLOW WILL PROBABLY BEHAVE A BIT IFFY IN SOME CASES.
      ?~  OLD
        ::  IF WE HAVE NO PREVIOUS CONFIG, ALL DIFFS APPLY.
        :~  [%CAPTION CAP.COF]
            [%USAGE & TAG.COF]
            [%FILTER FIT.COF]
            [%SECURE SEC.CON.COF]
            [%PERMIT & SIS.CON.COF]
            [%READ RED.COF]
        ==
      =-  (MURN - SAME)
      ^-  (LIST (UNIT DIFF-CONFIG))
      =*  COL  U.OLD
      ::  IF WE HAVE PREVIOUS CONFIG, FIGURE OUT THE CHANGES.
      :~  ?:  =(CAP.COL CAP.COF)  ~
          `[%CAPTION CAP.COF]
        ::
          =+  GON=(~(DIF IN TAG.COL) TAG.COF)
          ?~  GON  ~
          `[%USAGE | GON]
        ::
          =+  NEW=(~(DIF IN TAG.COF) TAG.COL)
          ?~  NEW  ~
          `[%USAGE & NEW]
        ::
          ?:  =(FIT.COL FIT.COF)  ~
          `[%FILTER FIT.COF]
        ::
          ?:  =(SEC.CON.COL SEC.CON.COF)  ~
          `[%SECURE SEC.CON.COF]
        ::
          =+  GON=(~(DIF IN SIS.CON.COL) SIS.CON.COF)
          ?~  GON  ~
          `[%PERMIT | GON]
        ::
          =+  NEW=(~(DIF IN SIS.CON.COF) SIS.CON.COL)
          ?~  NEW  ~
          `[%PERMIT & NEW]
      ==
    ::
    ++  SO-SOURCES
      ::    CHANGE SOURCE
      ::
      ::  ADDS OR REMOVES {SRS} FROM OUR SOURCES,
      ::  SKIPPING OVER ONES WE ALREADY (DON'T) HAVE.
      ::
      ~/  %HALL-SO-SOURCES
      |=  {ADD/? SRS/(SET SOURCE)}
      ^+  +>
      =/  SUS/(SET SOURCE)
        %.  SRC.SHAPE
        ?:(ADD ~(DIF IN SRS) ~(INT IN SRS))
      ::  WE ONLY MAKE A DELTA FOR REMOVALS HERE,
      ::  BECAUSE WE DON'T NEED TO WAIT FOR ++REAP WHEN
      ::  PULLING SUBSCRIPTIONS.
      =?  +>.$  !ADD
        =+  SOS=~(TAP IN SUS)
        |-  ^+  +>.^$
        ?~  SOS  +>.^$
        =.  +>.^$  (SO-DELTA-OUR %CONFIG SO-CIR %SOURCE | I.SOS)
        $(SOS T.SOS)
        ::TODO  IDEALLY BELOW, BUT UNEXPLAINED RUNTIME ERROR AT `SO-DELTA-OUR`
        ::%+  ROLL  ~(TAP IN SUS)
        ::|=  {SRC/SOURCE _+>.$}
        ::^+  +>.^$
        ::(SO-DELTA-OUR %CONFIG SO-CIR %SOURCE | SRC)
      ?~  SUS  +>.$
      (SO-DELTA-OUR %FOLLOW ADD SUS)
    ::
    ++  SO-DEPICT
      ::    CHANGE DESCRIPTION
      ::
      ::  MODIFIES OUR CAPTION.
      ::
      ~/  %HALL-SO-DEPICT
      |=  CAP/CORD
      ^+  +>
      ?:  =(CAP CAP.SHAPE)  +>
      (SO-DELTA-OUR %CONFIG SO-CIR %CAPTION CAP)
    ::
    ++  SO-USAGE
      ::  ADD OR REMOVE USAGE TAGS.
      ::
      ~/  %HALL-SO-USAGE
      |=  {ADD/? TAS/TAGS}
      ^+  +>
      =/  SAS/TAGS
        %.  TAG.SHAPE
        ?:(ADD ~(DIF IN TAS) ~(INT IN TAS))
      ?~  SAS  +>.$
      (SO-DELTA-OUR %CONFIG SO-CIR %USAGE ADD SAS)
    ::
    ++  SO-READ
      ::  SET THE READ MESSAGE NUMBER IN CIRCLE CONFIG
      ~/  %HALL-SO-READ
      |=  {RED/@UD}
      ^+  +>
      ?:  =(RED RED.SHAPE)  +>
      (SO-DELTA-OUR %CONFIG SO-CIR %READ RED)
    ::
    ++  SO-FILTER
      ::    CHANGE MESSAGE RULES
      ::
      ::  MODIFIES OUR FILTER.
      ::
      ~/  %HALL-SO-FILTER
      |=  FIT/FILTER
      ^+  +>
      ?:  =(FIT FIT.SHAPE)  +>
      (SO-DELTA-OUR %CONFIG SO-CIR %FILTER FIT)
    ::
    ++  SO-DELETE
      ::    DELETE STORY
      ::
      ::  DELETES THIS STORY. REMOVES IT FROM {STORIES}
      ::  AND UNSUBSCRIBES FROM ALL SRC.
      ::
      (SO-DELTA-OUR %REMOVE ~)
    ::
    ::  #
    ::  #  %SUBSCRIPTIONS
    ::  #
    ::    ARMS FOR STARTING AND ENDING SUBSCRIPTIONS
    ::
    ++  SO-GREET
      ::    SUBSCRIPTION STARTED
      ::
      ::  STORE A STARTED SUBSCRIPTION AS SOURCE.
      ::
      ~/  %HALL-SO-GREET
      |=  SRC/SOURCE
      ^+  +>
      ?:  (~(HAS IN SRC.SHAPE) SRC)  +>
      (SO-DELTA-OUR %CONFIG SO-CIR %SOURCE & SRC)
    ::
    ++  SO-LEAVE
      ::    SUBSCRIPTION ENDED
      ::
      ::  DELETE {SRC} FROM OUR SOURCES.
      ::
      ~/  %HALL-SO-LEAVE
      |=  SRC/SOURCE
      ^+  +>
      ?.  (~(HAS IN SRC.SHAPE) SRC)  +>
      (SO-DELTA-OUR %CONFIG SO-CIR %SOURCE | SRC)
    ::
    ++  SO-RESUB
      ::    SUBSCRIPTION REVIVED
      ::
      ::  RE-SUBSCRIBE TO A DROPPED SUBSCRIPTION.
      ::  IF IT WAS ALREADY ACTIVE, WE CONTINUE WHERE
      ::  WE LEFT OFF.
      ::
      ~/  %HALL-SO-RESUB
      |=  SRC/SOURCE
      ^+  +>
      =+  SEQ=(~(GET BY SEQUENCE) CIR.SRC)
      =/  NER/RANGE
        ?~  SEQ  RAN.SRC
        =-  `[[%UD U.SEQ] -]
        ?~  RAN.SRC  ~
        TAL.U.RAN.SRC
      ::  IF OUR SUBSCRIPTION CHANGES OR ENDS, REMOVE
      ::  THE ORIGINAL SOURCE.
      =?  +>.$  !=(NER RAN.SRC)
        (SO-DELTA-OUR %CONFIG SO-CIR %SOURCE | SRC)
      ::  IF WE'RE PAST THE RANGE, DON'T RESUBSCRIBE.
      ?:  ?&  ?=(^ RAN.SRC)
              ?=(^ TAL.U.RAN.SRC)
            ::
              ?-  -.U.TAL.U.RAN.SRC
                $SD   &
                $DA   (GTE NOW.BOL +.U.TAL.U.RAN.SRC)
                $UD   ?&  ?=(^ SEQ)
                          (GTE U.SEQ +.U.TAL.U.RAN.SRC)
                      ==
              ==
          ==
        +>.$
      (SO-DELTA-OUR %FOLLOW & [[CIR.SRC -] ~ ~])
    ::
    ++  SO-FIRST-GRAMS
      ::    BEGINNING OF STREAM
      ::
      ::  FIND ALL GRAMS THAT FALL WITHIN THE RANGE.
      ::
      ~/  %HALL-SO-FIRST-GRAMS
      |=  RAN/RANGE
      ^-  (LIST TELEGRAM)
      =+  [NUM=0 GAZ=GRAMS ZEG=*(LIST TELEGRAM)]
      ::  FILL IN EMPTY RANGES TO SELECT ALL GRAMS,
      ::  AND CALCULATE ABSOLUTES FOR RELATIVE PLACES.
      =.  RAN
        ?~  RAN  `[[%UD 0] `[%UD COUNT]]
        =*  HED  HED.U.RAN
        =?  HED  ?=($SD -.HED)
          [%UD (SUB COUNT (MIN COUNT (ABS:SI +.HED)))]
        ?~  TAL.U.RAN  `[HED `[%UD COUNT]]
        =*  TAL  U.TAL.U.RAN
        =?  TAL  ?=($SD -.TAL)
          [%UD (SUB COUNT (MIN COUNT (ABS:SI +.TAL)))]
        RAN
      ::  NEVER FAILS, BUT COMPILER NEEDS IT.
      ?>  &(?=(^ RAN) ?=(^ TAL.U.RAN))
      =*  HED  HED.U.RAN
      =*  TAL  U.TAL.U.RAN
      %-  FLOP
      |-  ^-  (LIST TELEGRAM)
      ?~  GAZ  ZEG
      ?:  ?-  -.U.TAL.U.RAN                             ::  AFTER THE END
            $UD  (LTH +.U.TAL.U.RAN NUM)
            $DA  (LTH +.U.TAL.U.RAN WEN.I.GAZ)
            $SD  !!  ::  CAUGHT ABOVE
          ==
        ::  IF PAST THE RANGE, WE'RE DONE SEARCHING.
        ZEG
      ?:  ?-  -.HED.U.RAN                               ::  BEFORE THE START
            $UD  (LTH NUM +.HED.U.RAN)
            $DA  (LTH WEN.I.GAZ +.HED.U.RAN)
            $SD  !!  ::  CAUGHT ABOVE
          ==
        ::  IF BEFORE THE RANGE, CONTINUE ONWARD.
        $(NUM +(NUM), GAZ T.GAZ)
      ::  IF IN THE RANGE, ADD THIS GRAM AND CONTINUE.
      $(NUM +(NUM), GAZ T.GAZ, ZEG [I.GAZ ZEG])
    ::
    ++  SO-IN-RANGE
      ::    PLACE IN RANGE?
      ::
      ::  PRODUCES TWO BOOLEANS: WHETHER WE'RE
      ::  CURRENTLY IN THE RANGE, AND WHETHER THE RANGE
      ::  HAS PASSED.
      ::TODO  TO DEAL WITH CHANGED MESSAGES, WE'LL WANT
      ::      TO BE ABLE TO PASS IN A NUM.
      ::
      ~/  %HALL-SO-IN-RANGE
      |=  RAN/RANGE
      ^-  {IN/? DONE/?}
      ?~  RAN  [& |]
      =/  MIN
        ?-  -.HED.U.RAN
          $SD  &  ::  RELATIVE IS ALWAYS IN.
          $UD  (GTH COUNT +.HED.U.RAN)
          $DA  (GTH NOW.BOL +.HED.U.RAN)
        ==
      ?~  TAL.U.RAN
        [MIN |]
      =-  [&(MIN -) !-]
      ?-  -.U.TAL.U.RAN
        $SD  |  ::  RELATIVE IS ALWAYS DONE.
        $UD  (GTE +(+.U.TAL.U.RAN) COUNT)
        $DA  (GTE +.U.TAL.U.RAN NOW.BOL)
      ==
    ::
    ::  #
    ::  #  %MESSAGING
    ::  #
    ::    ARMS FOR ADDING TO THIS STORY'S MESSAGES.
    ::
    ++  SO-SANE
      ::  SANITIZE %LIN SPEECH ACCORDING TO OUR SETTINGS.
      ::
      ~/  %HALL-SO-SANE
      |=  SEP/SPEECH
      ^-  SPEECH
      ?+  -.SEP  SEP
          ?($IRE $FAT $APP)
        SEP(SEP $(SEP SEP.SEP))
      ::
          $LIN
        =-  SEP(MSG -)
        %-  CRIP
        %-  TUFA
        %+  TURN  (TUBA (TRIP MSG.SEP))
        |=  A/@C
        ::  ALWAYS REPLACE CONTROL CHARACTERS.
        ?:  |((LTH A 32) =(A `@C`127))
          `@`'?'
        ::  IF DESIRED, REMOVE UPPERCASING.
        ?:  ?&  !CAS.FIT.SHAPE
                (GTE A 'A')
                (LTE A 'Z')
            ==
          (ADD A 32)
        ::  IF DESIRED, REPLACE NON-ASCII CHARACTERS.
        ?:  ?&  !UTF.FIT.SHAPE
                (GTH A 127)
            ==
          `@`'?'
        A
      ==
    ::
    ++  SO-UNPACK
      ::    PROCESS ENVELOPES
      ::
      ::  LEARN TELEGRAMS FROM LIST OF ENVELOPES AND
      ::  UPDATE THE SEQUENCE OF THE SOURCE IF NEEDED.
      ::
      ~/  %HALL-SO-UNPACK
      |=  {SRC/CIRCLE NES/(LIST ENVELOPE)}
      ^+  +>
      =.  +>  (SO-LESSON SRC (TURN NES TAIL))
      =/  NUM
        %+  ROLL  NES
        |=  {NEV/ENVELOPE MAX/@UD}
        ?:((GTH NUM.NEV MAX) NUM.NEV MAX)
      ?.  (GTH NUM (FALL (~(GET BY SEQUENCE) SRC) 0))
        +>.$
      (SO-DELTA-OUR %SEQUENT SRC NUM)
    ::
    ++  SO-OPEN
      ::    PROCESS ENVELOPE
      ::
      ::  LEARN TELEGRAM FROM ENVELOPE AND UPDATE THE
      ::  SEQUENCE OF THE SOURCE IF NEEDED.
      ::
      ~/  %HALL-SO-OPEN
      |=  {SRC/CIRCLE NEV/ENVELOPE}
      ^+  +>
      =.  +>  (SO-LEARN SRC GAM.NEV)
      ?.  (GTH NUM.NEV (FALL (~(GET BY SEQUENCE) SRC) 0))
        +>
      (SO-DELTA-OUR %SEQUENT SRC NUM.NEV)
    ::
    ++  SO-LESSON
      ::  LEARN ALL TELEGRAMS IN A LIST.
      ::
      ~/  %HALL-SO-LESSON
      |=  {SRC/CIRCLE GAZ/(LIST TELEGRAM)}
      ^+  +>
      ?~  GAZ  +>
      $(GAZ T.GAZ, +> (SO-LEARN SRC I.GAZ))
    ::
    ++  SO-LEARN
      ::    SAVE/UPDATE MESSAGE
      ::
      ::  STORE AN INCOMING TELEGRAM, UPDATING IF IT
      ::  ALREADY EXISTS.
      ::
      ~/  %HALL-SO-LEARN
      |=  {SRC/CIRCLE GAM/TELEGRAM}
      ^+  +>
      ::  CHECK FOR WRITE PERMISSIONS.
      ::TODO  WE WANT TO !! INSTEAD OF SILENTLY FAILING,
      ::      SO THAT ++COUP-REPEAT OF THE CALLER GETS
      ::      AN ERROR. BUT THE CALLER MAY NOT BE THE
      ::      AUTHOR. IF WE CHECK FOR THAT TO BE TRUE,
      ::      CAN WE GUARANTEE IT'S NOT AN OLDER MESSAGE
      ::      GETTING RESENT? DOES THAT MATTER? THINK.
      ?.  (SO-ADMIRE AUT.GAM)  +>
      ::  CLEAN UP THE MESSAGE TO CONFORM TO OUR RULES.
      =.  SEP.GAM  (SO-SANE SEP.GAM)
      ::
      =.  GAM  (FILTER-GRAM GAM BOL)
      ::  IF WE ALREADY HAVE IT, IGNORE.
      =+  OLD=(~(GET BY KNOWN) UID.GAM)
      ?.  &(?=(^ OLD) =(GAM (SNAG U.OLD GRAMS)))
        (SO-DELTA-OUR %GRAM SRC GAM)
      =+  SED=(~(GET BY SOURCED) SRC)
      ?:  |(?=(~ SED) ?=(~ (FIND [U.OLD]~ U.SED)))
        (SO-DELTA-OUR %SOURCED SRC U.OLD)
      +>.$
    ::
    ::  #
    ::  #  %PERMISSIONS
    ::  #
    ::    ARMS RELATING TO STORY PERMISSIONS.
    ::
    ++  SO-PERMIT
      ::    INVITE/BANISH
      ::
      ::  UPDATE CONFIG TO DIS/ALLOW SHIPS PERMISSION.
      ::
      ~/  %HALL-SO-PERMIT
      |=  {INV/? SIS/(SET SHIP)}
      ^+  +>
      ::  WYT:  WHITELIST?
      ::  ADD:  ADD TO LIST?
      =/  WYT/?  ?=(?($VILLAGE $JOURNAL) SEC.CON.SHAPE)
      =/  ADD/?  =(INV WYT)
      =/  SUS/(SET SHIP)
        %.  SIS.CON.SHAPE
        ?:(ADD ~(DIF IN SIS) ~(INT IN SIS))
      ?~  SUS  +>.$
      ::  IF BANISHED, REMOVE THEIR PRESENCES.
      =?  +>.$  !INV
        %-  SO-DELTAS-OUR
        %+  TURN  ~(TAP IN `(SET SHIP)`SUS)
        |=  S/SHIP
        :+  %STATUS  SO-CIR
        [S %REMOVE ~]
      (SO-DELTA-OUR %CONFIG SO-CIR %PERMIT [ADD SUS])
    ::
    ++  SO-ADMIRE
      ::    ACCEPT FROM
      ::
      ::  CHECKS {HER} WRITE PERMISSIONS.
      ::
      ~/  %HALL-SO-ADMIRE
      |=  HER/SHIP
      ^-  ?
      ?-  SEC.CON.SHAPE
        $CHANNEL  !(~(HAS IN SIS.CON.SHAPE) HER)        ::  BLACKLIST
        $VILLAGE  (~(HAS IN SIS.CON.SHAPE) HER)         ::  WHITELIST
        $JOURNAL  (~(HAS IN SIS.CON.SHAPE) HER)         ::  AUTHOR WHITELIST
        $MAILBOX  !(~(HAS IN SIS.CON.SHAPE) HER)        ::  AUTHOR BLACKLIST
        $CUSTOM                                         ::  CUSTOM RULE
          =/  RUL/$-({SHIP ?($R $W) BOWL:GALL} ?)
            (FALL (~(GET BY CUSTOM-RULES) NOM) |=(* |))
          (RUL HER %W BOL)
      ==
    ::
    ++  SO-VISIBLE
      ::  CHECKS {HER} READ PERMISSIONS.
      ::
      ~/  %HALL-SO-VISIBLE
      |=  HER/SHIP
      ^-  ?
      ?-  SEC.CON.SHAPE
        $CHANNEL  !(~(HAS IN SIS.CON.SHAPE) HER)        ::  BLACKLIST
        $VILLAGE  (~(HAS IN SIS.CON.SHAPE) HER)         ::  WHITELIST
        $JOURNAL  &                                     ::  ALL
        $MAILBOX  (TEAM:TITLE OUR.BOL HER)              ::  OUR TEAM
        $CUSTOM                                         ::  CUSTOM RULE
          =/  RUL/$-({SHIP ?($R $W) BOWL:GALL} ?)
            (FALL (~(GET BY CUSTOM-RULES) NOM) |=(* |))
          (RUL HER %R BOL)
      ==
    --
  --
::
++  DA
  ::    DELTA APPLICATION
  ::
  ::  CORE FOR DOING THINGS, MOSTLY APPLYING DELTAS TO
  ::  APPLICATION STATE, BUT ALSO DEALING WITH EVENTS
  ::  THAT AREN'T POKES.
  ::  WHERE APPROPRIATE, CREATES MOVES. THOSE GET
  ::  PRODUCED WHEN FINALIZING WITH ++DA-DONE.
  ::
  ~/  %HALL-DA
  |_  ::  MOVES: MOVES CREATED BY CORE OPERATIONS.
      ::
      MOVES/(LIST MOVE)
  ::  #  %RESOLVE
  ::
  ++  DA-DONE
    ::    RESOLVE CORE
    ::
    ::  PRODUCES THE MOVES STORED IN ++DA'S MOVES.
    ::  THEY ARE PRODUCED IN REVERSE ORDER BECAUSE
    ::  ++DA-EMIL AND ++DA-EMIT ADD THEM TO THE HEAD OF
    ::  THE {MOVES}.
    ::
    ^-  (QUIP MOVE _+>)
    [(FLOP MOVES) +>]
  ::
  ::  #
  ::  #  %EMITTERS
  ::  #
  ::    ARMS THAT CREATE OUTWARD CHANGES.
  ::
  ++  DA-EMIL
    ::    EMIT MOVE LIST
    ::
    ::  ADDS MULTIPLE MOVES TO THE HEAD OF {MOVES}.
    ::  FLOPS TO STAY CONSISTENT WITH ++TA-EMIT.
    ::
    ~/  %HALL-DA-EMIL
    |=  MOL/(LIST MOVE)
    %_(+> MOVES (WELP (FLOP MOL) MOVES))
  ::
  ++  DA-EMIT
    ::    EMIT A MOVE
    ::
    ::  ADDS A MOVE TO THE HEAD OF {MOVES}.
    ::
    ~/  %HALL-DA-EMIT
    |=  MOV/MOVE
    %_(+> MOVES [MOV MOVES])
  ::
  ++  DA-PRESENT
    ::  SEND %PRESENT CMD
    ::
    ~/  %HALL-DA-PRESENT
    |=  {HOS/SHIP NOS/(SET NAME) DIF/DIFF-STATUS}
    ^+  +>
    %-  DA-EMIT
    :*  OST.BOL
        %POKE
        /PRESENT
        [HOS DAP.BOL]
        [%HALL-COMMAND %PRESENT NOS DIF]
    ==
  ::
  ::  #
  ::  #  %CHANGE-APPLICATION
  ::  #
  ::    ARMS THAT CHANGE THE APPLICATION STATE.
  ::
  ++  DA-CHANGE
    ::    APPLY DELTA
    ::
    ::  MODIFIES APPLICATION STATE ACCORDING TO THE
    ::  CHANGE SPECIFIED IN {DIF}.
    ::
    ~/  %HALL-DA-CHANGE
    |=  DET/DELTA
    ^+  +>
    ?-  -.DET
      $PUBLIC   (DA-CHANGE-PUBLIC +.DET)
      $OUT      (DA-CHANGE-OUT +.DET)
      $DONE     (DA-CHANGE-DONE +.DET)
      $GLYPH    (DA-CHANGE-GLYPH +.DET)
      $NICK     (DA-CHANGE-NICK +.DET)
      $STORY    (DA-CHANGE-STORY +.DET)
      $INIT     DA-INIT
      $OBSERVE  (DA-OBSERVE +.DET)
      $PRESENT  (DA-PRESENT +.DET)
    ==
  ::
  ++  DA-INIT
    ::    STARTUP SIDE-EFFECTS
    ::
    ::  APPLY %INIT DELTA, QUERYING THE /BURDEN OF THE
    ::  SHIP ABOVE US.
    ::
    (DA-EMIT (WIRE-TO-PEER /BURDEN))
  ::
  ++  DA-OBSERVE
    ::    WATCH BURDEN BEARER
    ::
    ::  APPLY %OBSERVE DELTA, QUERYING THE /REPORT OF
    ::  {WHO} BELOW US.
    ::
    ~/  %HALL-DA-OBSERVE
    |=  WHO/SHIP
    (DA-EMIT (WIRE-TO-PEER /REPORT/(SCOT %P WHO)))
  ::
  ++  DA-CHANGE-PUBLIC
    ::    SHOW/HIDE MEMBERSHIP
    ::
    ::  ADD/REMOVE A CIRCLE TO/FROM THE PUBLIC
    ::  MEMBERSHIP LIST.
    ::
    ~/  %HALL-DA-CHANGE-PUBLIC
    |=  {ADD/? CIR/CIRCLE}
    ^+  +>
    =-  +>.$(PUBLIC -)
    ?:  ADD  (~(PUT IN PUBLIC) CIR)
    (~(DEL IN PUBLIC) CIR)
  ::
  ++  DA-CHANGE-OUT
    ::    OUTGOING MESSAGES
    ::
    ::  APPLY AN %OUT DELTA, SENDING A MESSAGE.
    ::
    ~/  %HALL-DA-CHANGE-OUT
    |=  {CIR/CIRCLE OUT/(LIST THOUGHT)}
    ^+  +>
    =+  SES=(TURN OUT HEAD)
    =.  OUTBOX
      ::  FOR EVERY SERIAL, ADD %PENDING STATE.
      %+  ROLL  SES
      |=  {S/SERIAL O/_OUTBOX}
      =?  O  ?=(~ O)  OUTBOX
      =+  T=(FALL (~(GET BY O) S) *TRACKING)
      %+  ~(PUT BY O)  S
      (~(PUT BY T) CIR %PENDING)
    %+  DA-EMIT  OST.BOL
    :*  %POKE
        /REPEAT/(SCOT %P HOS.CIR)/[NOM.CIR]/(SCOT %UD (JAM SES))
        [HOS.CIR DAP.BOL]
        [%HALL-COMMAND %PUBLISH OUT]
    ==
  ::
  ++  DA-CHANGE-DONE
    ::    DELIVERED MESSAGES
    ::
    ::  APPLY A %DONE DELTA, SETTING NEW DELIVERY STATE
    ::  FOR MESSAGES.
    ::
    ~/  %HALL-DA-CHANGE-DONE
    |=  {CIR/CIRCLE SES/(LIST SERIAL) RES/DELIVERY}
    ^+  +>
    %_  +>
        OUTBOX
      ::  FOR EVERY SERIAL, SET NEW DELIVERY STATE.
      %-  ~(GAS BY OUTBOX)
      %+  TURN  SES
      |=  S/SERIAL
      :-  S
      %+  ~(PUT BY (~(GOT BY OUTBOX) S))
      CIR  RES
    ==
  ::
  ++  DA-CHANGE-GLYPH
    ::    UN/BOUND GLYPH
    ::
    ::  APPLY A %GLYPH DELTA, UN/BINDING A GLYPH TO/FROM
    ::  AN AUDIENCE.
    ::
    ~/  %HALL-DA-CHANGE-GLYPH
    |=  {BIN/? GYF/CHAR AUD/AUDIENCE}
    ^+  +>
    ?:  BIN
      %_  +>
        BINDS  (~(PUT JU BINDS) GYF AUD)
      ==
    =/  OLE/(LIST AUDIENCE)
      ?.  =(AUD ~)  [AUD ~]
      ~(TAP IN (~(GET JU BINDS) GYF))
    |-  ^+  +>.^$
    ?~  OLE  +>.^$
    %_  $
      BINDS  (~(DEL JU BINDS) GYF I.OLE)
      OLE  T.OLE
    ==
  ::
  ++  DA-CHANGE-NICK
    ::    CHANGED NICKNAME
    ::
    ::  APPLY A %NICK DELTA, SETTING A NICKNAME FOR A
    ::  SHIP.
    ::
    ~/  %HALL-DA-CHANGE-NICK
    |=  {WHO/SHIP NIC/NICK}
    ^+  +>
    +>(NICKS (CHANGE-NICKS:HALL-LIB NICKS WHO NIC))
  ::
  ::  #
  ::  #  %STORIES
  ::  #
  ::    ARMS FOR MODIFYING STORIES.
  ::
  ++  DA-CHANGE-STORY
    ::    APPLY CIRCLE DELTA
    ::
    ::  APPLY A %STORY DELTA, REDIRECTING THE DELTA
    ::  ITSELF TO ++SA-CHANGE.
    ::  IN CASE OF A NEW OR DELETED STORY, SPECIALIZED
    ::  ARMS ARE CALLED.
    ::
    ~/  %HALL-DA-CHANGE-STORY
    |=  {NOM/NAME DET/DELTA-STORY}
    ^+  +>
    ?+  -.DET
      =<  SA-DONE
      %.  DET
      =+  (FALL (~(GET BY STORIES) NOM) *STORY)
      ~(SA-CHANGE SA NOM -)
    ::
      $NEW      (DA-CREATE NOM +.DET)
      $BEAR     ~&(%UNEXPECTED-UNSPLIT-BEAR +>)
      $REMOVE   (DA-DELETE NOM)
    ==
  ::
  ++  DA-CREATE
    ::    CONFIGURE STORY
    ::
    ::  CREATES STORY {NOM} WITH CONFIG {CON}.
    ::
    ~/  %HALL-DA-CREATE
    |=  {NOM/NAME COF/CONFIG}
    ^+  +>
    =<  SA-DONE
    %-  ~(SA-CHANGE SA NOM *STORY)
    [%CONFIG [OUR.BOL NOM] %FULL COF]
  ::
  ++  DA-DELETE
    ::    DELETE STORY
    ::
    ::  CALLS THE STORY CORE TO DELETE STORY {NOM}.
    ::
    ~/  %HALL-DA-DELETE
    |=  NOM/NAME
    ^+  +>
    =.  +>
      %-  DA-EMIL
      ~(SA-DELETE SA NOM (~(GOT BY STORIES) NOM))
    +>(STORIES (~(DEL BY STORIES) NOM))
  ::
  ++  SA
    ::    STORY DELTA CORE
    ::
    ::  STORY CORE, USED FOR DOING WORK ON A STORY.
    ::
    ~/  %HALL-SA
    |_  ::  NOM: STORY NAME IN {STORIES}.
        ::  STORY IS FACELESS TO EASE DATA ACCESS.
        ::
        $:  NOM/NAME
            STORY
        ==
    ::  #  %RESOLVE
    ::
    ++  SA-DONE
      ::    APPLY CHANGES
      ::
      ::  PUT CHANGED STORY BACK INTO THE MAP.
      ::
      +>(STORIES (~(PUT BY STORIES) NOM +<+))
    ::
    ::  #
    ::  #  %EMITTERS
    ::  #
    ::    ARMS THAT CREATE OUTWARD CHANGES.
    ::
    ++  SA-EMIL
      ::    EMIT MOVE LIST
      ::
      ::  ADDS MULTIPLE MOVES TO THE HEAD OF {MOVES}.
      ::  FLOPS TO STAY CONSISTENT WITH ++TA-EMIT.
      ::
      ~/  %HALL-SA-EMIL
      |=  MOL/(LIST MOVE)
      %_(+> MOVES (WELP (FLOP MOL) MOVES))
    ::
    ++  SA-EMIT
      ::    EMIT A MOVE
      ::
      ::  ADDS A MOVE TO THE HEAD OF {MOVES}.
      ::
      ~/  %HALL-SA-EMIT
      |=  MOV/MOVE
      %_(+> MOVES [MOV MOVES])
    ::
    ++  SA-SAUCE
      ::  CARDS TO MOVES.
      ::
      ~/  %HALL-SA-SAUCE
      |=  {OST/BONE CUB/(LIST CARD)}
      ^-  (LIST MOVE)
      (FLOP (TURN CUB |=(A/CARD [OST A])))
    ::
    ::  #
    ::  #  %DATA
    ::  #
    ::    UTILITY FUNCTIONS FOR DATA RETRIEVAL.
    ::
    ++  SA-CIR  [OUR.BOL NOM]
    ::
    ::  #
    ::  #  %DELTA-APPLICATION
    ::  #
    ::    ARMS FOR APPLYING DELTAS.
    ::
    ++  SA-DELETE
      ::    DELETION OF STORY
      ::
      ::  APPLY A %REMOVE STORY DELTA, UNSUBSCRIBING
      ::  THIS STORY FROM ALL ITS ACTIVE SOURCES.
      ::
      %+  WELD
        (SA-ABJURE SRC.SHAPE)
      (SA-EJECT ~(KEY BY PEERS))
    ::
    ++  SA-CHANGE
      ::    APPLY CIRCLE DELTA
      ::
      ::  FIGURE OUT WHETHER TO APPLY A %STORY DELTA TO
      ::  LOCAL OR REMOTE DATA.
      ::
      ~/  %HALL-SA-CHANGE
      |=  DET/DELTA-STORY
      ^+  +>
      %.  DET
      ?:  ?&  ?=(?($CONFIG $STATUS) -.DET)
              !=(CIR.DET SA-CIR)
          ==
        SA-CHANGE-REMOTE
      SA-CHANGE-LOCAL
    ::
    ++  SA-CHANGE-LOCAL
      ::    APPLY OUR DELTA
      ::
      ::  APPLY A %STORY DELTA TO LOCAL DATA.
      ::
      ~/  %HALL-SA-CHANGE-LOCAL
      |=  DET/DELTA-STORY
      ^+  +>
      ?+  -.DET
        ~&([%UNEXPECTED-DELTA-LOCAL -.DET] !!)
      ::
          $INHERITED
        +>(INHERITED IHR.DET)
      ::
          $PEER
        ?:  ADD.DET
          +>(PEERS (~(ADD JA PEERS) WHO.DET QER.DET))
        =+  QES=(~(GET JA PEERS) WHO.DET)
        =.  QES
          =+  RES=(FIND ~[QER.DET] QES)
          ?~  RES  QES
          (OUST [U.RES 1] QES)
        ?~  QES  +>.$(PEERS (~(DEL BY PEERS) WHO.DET))
        +>.$(PEERS (~(PUT IN PEERS) WHO.DET QES))
      ::
          $FOLLOW
        (SA-EMIL (SA-FOLLOW-EFFECTS SUB.DET SRS.DET))
      ::
          $SEQUENT
        +>(SEQUENCE (~(PUT BY SEQUENCE) CIR.DET NUM.DET))
      ::
          $GRAM
        (SA-CHANGE-GRAM +.DET)
      ::
          $SOURCED
        (SA-ADD-GRAM-SOURCE +.DET)
      ::
          $CONFIG
        =.  +>
          %-  SA-EMIL
          (SA-CONFIG-EFFECTS SHAPE DIF.DET)
        +>(SHAPE (CHANGE-CONFIG:HALL-LIB SHAPE DIF.DET))
      ::
          $STATUS
        %_  +>
            LOCALS
          ?:  ?=($REMOVE -.DIF.DET)
            (~(DEL BY LOCALS) WHO.DET)
          %+  ~(PUT BY LOCALS)  WHO.DET
          %+  CHANGE-STATUS:HALL-LIB
            (FALL (~(GET BY LOCALS) WHO.DET) *STATUS)
          DIF.DET
        ==
      ==
    ::
    ++  SA-ADD-GRAM-SOURCE
      ::    REMEMBER MESSAGE SOURCE
      ::
      ::  IF IT'S NOT ALREADY KNOWN, MAKE NOTE OF THE
      ::  FACT THAT MESSAGE {NUM} WAS HEARD FROM {SRC}.
      ::
      ~/  %HALL-SA-ADD-GRAM-SOURCE
      |=  {SRC/CIRCLE NUM/@UD}
      ^+  +>
      =-  +>.$(SOURCED -)
      =+  SED=(FALL (~(GET BY SOURCED) SRC) ~)
      ?^  (FIND ~[NUM] SED)  SOURCED
      (~(PUT BY SOURCED) SRC [NUM SED])
    ::
    ++  SA-CHANGE-GRAM
      ::    SAVE/UPDATE MESSAGE
      ::
      ::  APPLY A %GRAM DELTA, EITHER APPENDING OR
      ::  UPDATING A MESSAGE.
      ::
      ~/  %HALL-SA-CHANGE-GRAM
      |=  {SRC/CIRCLE GAM/TELEGRAM}
      ^+  +>
      ::TODO  MOVE "KNOWN" LOGIC UP INTO ++SO? THAT WAY,
      ::      WE CAN ATTACH MESSAGE NUMBERS TO CHANGES.
      =+  OLD=(~(GET BY KNOWN) UID.GAM)
      ?~  OLD
        ::  NEW MESSAGE
        %.  [SRC COUNT]
        %_  SA-ADD-GRAM-SOURCE
          GRAMS    (WELP GRAMS [GAM ~])
          COUNT    +(COUNT)
          KNOWN    (~(PUT BY KNOWN) UID.GAM COUNT)
        ==
      ::  CHANGED MESSAGE
      %.  [SRC U.OLD]
      %_  SA-ADD-GRAM-SOURCE
        GRAMS    %+  WELP
                 (SCAG U.OLD GRAMS)
                 [GAM (SLAG +(U.OLD) GRAMS)]
      ==
    ::
    ++  SA-CHANGE-REMOTE
      ::    APPLY REMOTE'S DELTA
      ::
      ::  APPLY A STORY DIFF TO REMOTE DATA.
      ::
      ~/  %HALL-SA-CHANGE-REMOTE
      |=  DET/DELTA-STORY
      ^+  +>
      ?+  -.DET
        ~&([%UNEXPECTED-DELTA-REMOTE -.DET] !!)
      ::
          $CONFIG
        ?:  ?=($REMOVE -.DIF.DET)
          +>(MIRRORS (~(DEL BY MIRRORS) CIR.DET))
        =/  NEW/CONFIG
          %+  CHANGE-CONFIG:HALL-LIB
          (FALL (~(GET BY MIRRORS) CIR.DET) *CONFIG)
          DIF.DET
        +>.$(MIRRORS (~(PUT BY MIRRORS) CIR.DET NEW))
      ::
          $STATUS
        %_  +>.$
            REMOTES
          %+  ~(PUT BY REMOTES)  CIR.DET
          =+  OLE=(FALL (~(GET BY REMOTES) CIR.DET) *GROUP)
          ?:  ?=($REMOVE -.DIF.DET)  (~(DEL BY OLE) WHO.DET)
          =+  OLD=(FALL (~(GET BY OLE) WHO.DET) *STATUS)
          (~(PUT BY OLE) WHO.DET (CHANGE-STATUS:HALL-LIB OLD DIF.DET))
        ==
      ==
    ::
    ++  SA-CONFIG-EFFECTS
      ::  APPLY SIDE-EFFECTS FOR A %CONFIG DELTA.
      ::
      ~/  %HALL-SA-CHANGE-EFFECTS
      |=  {OLD/CONFIG DIF/DIFF-CONFIG}
      ^-  (LIST MOVE)
      ?+  -.DIF  ~
        $PERMIT   (SA-PERMIT-EFFECTS SEC.CON.OLD SIS.CON.OLD +.DIF)
        ::NOTE  WHEN DOING A LONE %SECURE, CALCULATE THE
        ::      NECESSARY %PERMIT DELTAS ALONGSIDE IT.
      ==
    ::
    ++  SA-FOLLOW-EFFECTS
      ::    UN/SUBSCRIBE
      ::
      ::  APPLY SIDE-EFFECTS FOR A %FOLLOW DELTA,
      ::  UN/SUBSCRIBING THIS STORY TO/FROM {COS}.
      ::
      ~/  %HALL-SA-FOLLOW-EFFECTS
      |=  {SUB/? SRS/(SET SOURCE)}
      ^-  (LIST MOVE)
      %.  SRS
      ?:(SUB SA-ACQUIRE SA-ABJURE)
    ::
    ++  SA-PERMIT-EFFECTS
      ::    NOTIFY PERMITTED
      ::
      ::  APPLY SIDE-EFFECTS FOR A %PERMIT DELTA,
      ::  KICKING THE SUBSCRIPTIONS OF {SIS} IF THEY
      ::  ARE BEING BANISHED.
      ::
      ~/  %HALL-SA-PERMIT-EFFECTS
      |=  {SEC/SECURITY OLD/(SET SHIP) ADD/? SIS/(SET SHIP)}
      ^-  (LIST MOVE)
      =/  WYT  ?=(?($VILLAGE $JOURNAL) SEC)
      =/  INV  =(WYT ADD)
      ?:  INV  ~
      =/  SUS/(SET SHIP)
        %.  SIS.CON.SHAPE
        ?:(ADD ~(DIF IN SIS) ~(INT IN SIS))
      (SA-EJECT SUS)
    ::
    ::  #
    ::  #  %SUBSCRIPTIONS
    ::  #
    ::    ARMS FOR STARTING AND ENDING SUBSCRIPTIONS
    ::
    ++  SA-ACQUIRE
      ::  SUBSCRIBES THIS STORY TO EACH CIRCLE.
      ::
      ~/  %HALL-SA-AQUIRE
      |=  SRS/(SET SOURCE)
      =-  (MURN - SAME)
      %+  TURN  ~(TAP IN SRS)
      |=  {CIR/CIRCLE RAN/RANGE}
      ^-  (UNIT MOVE)
      ?:  =(CIR SA-CIR)  ~  ::  IGNORE SELF-SUBS
      =+  WAT=~[%GRAMS %CONFIG-L %GROUP-L]
      `(WIRE-TO-PEER (CIRCLE-WIRE NOM WAT CIR RAN))
    ::
    ++  SA-ABJURE
      ::  UNSUBSCRIBES THIS STORY FROM EACH CIRCLE.
      ::
      ~/  %HALL-SA-ABJURE
      |=  SRS/(SET SOURCE)
      ^-  (LIST MOVE)
      %+  TURN  ~(TAP IN SRS)
      |=  {CIR/CIRCLE RAN/RANGE}
      ^-  MOVE
      =/  WIR
        %^  CIRCLE-WIRE  NOM
          ~[%GRAMS %CONFIG-L %GROUP-L]
        [CIR RAN]
      [OST.BOL %PULL WIR [HOS.CIR DAP.BOL] ~]
    ::
    ++  SA-EJECT
      ::  REMOVES SHIPS {SIS} FROM {FOLLOWERS}.
      ::
      ~/  %HALL-SA-EJECT
      |=  SIS/(SET SHIP)
      ^-  (LIST MOVE)
      %-  ZING
      %+  TURN  ~(TAP IN SUP.BOL)
      |=  {B/BONE S/SHIP P/PATH}
      ^-  (LIST MOVE)
      ?.  ?&  (~(HAS IN SIS) S)
              ?=({$CIRCLE @TAS *} P)
              =(I.T.P NOM)
          ==
        ~
      (GENTLE-QUIT B S (PATH-TO-QUERY P))
    ::
    ++  SA-UNEARTH
      ::    SHIPS' BONES
      ::
      ::  FIND THE BONES IN {SUP.BOL} THAT BELONG TO
      ::  A SHIP IN {SIS}.
      ::
      ~/  %HALL-SA-UNEARTH
      |=  SIS/(SET SHIP)
      ^-  (SET BONE)
      %-  ~(REP IN SUP.BOL)
      |=  {{B/BONE S/SHIP P/PATH} C/(SET BONE)}
      ?.  ?&  (~(HAS IN SIS) S)
              ?=({$CIRCLE @TAS *} P)
              =(I.T.P NOM)
          ==
        C
      (~(PUT IN C) B)
    --
--
::
::
::  #
::  #  %WIRE-UTILITY
::  #
::
++  CIRCLE-WIRE
  ::    /CIRCLE PEER WIRE
  ::
  ::  CONSTRUCTS A /CIRCLE %PEER PATH FOR SUBSCRIBING
  ::  {NOM} TO A SOURCE.
  ::
  ~/  %HALL-CIRCLE-WIRE
  |=  {NOM/NAME WAT/(LIST CIRCLE-DATA) SOURCE}
  ^-  WIRE
  ;:  WELD
    /CIRCLE/[NOM]/(SCOT %P HOS.CIR)/[NOM.CIR]
    (SORT WAT GTH)  ::  CONSISTENCE
    (RANGE-TO-PATH:HALL-LIB RAN)
  ==
::
++  WIRE-TO-PEER
  ::    PEER MOVE FROM WIRE
  ::
  ::  BUILDS THE PEER MOVE ASSOCIATED WITH THE WIRE.
  ::
  ~/  %HALL-WIRE-TO-PEER
  |=  WIR/WIRE
  ^-  MOVE
  =+  TAR=(WIRE-TO-TARGET WIR)
  [OST.BOL %PEER WIR [P.TAR DAP.BOL] Q.TAR]
::
++  WIRE-TO-TARGET
  ::    SHIP+PATH FROM WIRE
  ::
  ::  PARSES {WIR} TO OBTAIN THE TARGET SHIP AND THE
  ::  QUERY PATH.
  ::
  ~/  %HALL-WIRE-TO-TARGET
  |=  WIR/WIRE
  ^-  (PAIR SHIP PATH)
  ?+  WIR  ~&(WIR !!)
      {$CIRCLE @ @ *}
    :-  (SLAV %P I.T.T.WIR)
    (WELP /CIRCLE T.T.T.WIR)
  ::
      {$BURDEN *}
    :-  (ABOVE:HALL-LIB [OUR NOW OUR]:BOL)
    /BURDEN/(SCOT %P OUR.BOL)
  ::
      {$REPORT @ *}
    :-  (SLAV %P I.T.WIR)
    /REPORT
  ==
::
++  ETCH
  ::    PARSE WIRE
  ::
  ::  PARSES {WIR} TO OBTAIN EITHER %CIRCLE WITH STORY
  ::  AND CIRCLE OR %REPEAT WITH MESSAGE NUMBER, SOURCE
  ::  SHIP, STORY AND SERIALS.
  ::
  ~/  %HALL-ETCH
  |=  WIR/WIRE
  ^-  WEIR
  ?+    WIR  !!
      {$CIRCLE @ @ @ *}
      :: $CIRCLE, US, HOST, TARGET
    :^    %CIRCLE
        I.T.WIR
      [(SLAV %P I.T.T.WIR) I.T.T.T.WIR]
    (PATH-TO-RANGE:HALL-LIB T.T.T.T.WIR)
  ::
      {$REPEAT @ @ @ ~}
    :+  %REPEAT
      [(SLAV %P I.T.WIR) I.T.T.WIR]
    ((LIST SERIAL) (CUE (SLAV %UD I.T.T.T.WIR)))
  ==
::
++  ETCH-CIRCLE
  ::    PARSE /CIRCLE WIRE
  ::
  ::  PARSES A /CIRCLE WIRE, CALL A GATE WITH THE
  ::  RESULT.
  ::
  ~/  %HALL-ETCH-CIRCLE
  |=  $:  WIR/WIRE
          $=  FUN
          $-  {NOM/NAME SRC/SOURCE}
              {(LIST MOVE) _.}
      ==
  =+  WER=(ETCH WIR)
  ?>(?=($CIRCLE -.WER) (FUN NOM.WER SRC.WER))
::
++  ETCH-REPEAT
  ::  PARSES A /REPEAT WIRE, CALL GATE WITH THE RESULT.
  ::
  ~/  %HALL-ETCH-REPEAT
  |=  $:  WIR/WIRE
          $=  FUN
          $-  {CIR/CIRCLE SES/(LIST SERIAL)}
              {(LIST MOVE) _.}
      ==
  =+  WER=(ETCH WIR)
  ?>(?=($REPEAT -.WER) (FUN CIR.WER SES.WER))
::
++  GENTLE-QUIT
  ::    QUIT OTHER, PULL US
  ::
  ::  WE WANT TO GENTLY PULL OUR OWN SUBSCRIPTIONS,
  ::  RATHER THAN QUITTING THEM, SO THAT WE MAY
  ::  DIFFERENTIATE BETWEEN A GALL/AMES QUIT AND A
  ::  FOREIGN QUIT. BUT SINCE WEX.BOL ISN'T FILLED,
  ::  WE'LL HAVE TO JUST GUESS AT WHAT THE CORRECT WIRE
  ::  WIRE IS. THIS IS TRULY TERRIBLE, BUT WILL HAVE TO
  ::  DO FOR NOW.
  ::TODO  GET RID OF THIS ONCE GALL IMPROVES.
  ::      IT NEEDS TO TELL US THE DIFFERENCE BETWEEN
  ::      AN APP-CAUSED QUIT AND A QUEUE-CAUSED ONE.
  ::      (AKA CONNECTED/DISCONNECTED/REJECTED STATE)
  ::
  ~/  %HALL-GENTLE-QUIT
  |=  {BON/BONE WHO/SHIP QER/QUERY}
  ^-  (LIST MOVE)
  ?.  ?=($CIRCLE -.QER)  ~
  ?.  =(WHO OUR.BOL)  [BON %QUIT ~]~
  %-  ZING
  %+  TURN  ~(TAP IN ~(KEY BY STORIES))
  |=  N/NAME
  ^-  (LIST MOVE)
  :~  :^  OST.BOL  %POKE  /
      :+  [OUR.BOL DAP.BOL]  %HALL-ACTION
      :^  %SOURCE  N  |
      [[[OUR.BOL NOM.QER] RAN.QER] ~ ~]
    ::
      :^  OST.BOL  %PULL
        %^  CIRCLE-WIRE  N  ~(TAP IN WAT.QER)
        [[OUR.BOL NOM.QER] RAN.QER]
      [[OUR.BOL DAP.BOL] ~]
  ==
::
::  #
::  #  %NEW-EVENTS
::  #
++  BAKE
  ::    APPLY STATE DELTA
  ::
  ::  APPLIES A CHANGE TO THE APPLICATION STATE,
  ::  PRODUCING SIDE-EFFECTS.
  ::
  ~/  %HALL-BAKE
  |=  DET/DELTA
  ^-  (QUIP MOVE _+>)
  DA-DONE:(DA-CHANGE:DA DET)
::
++  PRE-BAKE
  ::  APPLY MORE DELTAS
  ::
  ~/  %HALL-PRE-BAKE
  |=  DES/(LIST DELTA)
  ^-  (QUIP MOVE _+>)
  =|  MOZ/(LIST MOVE)
  |-  ^-  (QUIP MOVE _+>.^$)
  ?~  DES  [MOZ +>.^$]
  =^  MOS  +>.^$  (BAKE I.DES)
  $(MOZ :(WELP MOZ MOS (AFFECTION I.DES)), DES T.DES)
  ::TODO  IDEALLY YOU'D JUST DO THIS, BUT THAT RUNTIME ERRORS ON "BAKE"...
  ::%+  ROLL  DES
  ::|=  {D/DELTA M/(LIST MOVE) _+>.$}
  ::=^  MOS  +>.^$  (BAKE D)
  ::[:(WELP M MOS (AFFECTION D)) +>.^$]
::
++  PEEK
  ~/  %HALL-PEEK
  |=  PAX/PATH
  ?>  ?=({$X *} PAX)  ::  OTHERS UNSUPPORTED.
  ^-  (UNIT (UNIT (PAIR MARK PRIZE)))
  =+  PIZ=(LOOK (PATH-TO-QUERY T.PAX))
  ?~  PIZ  ~
  ?~  U.PIZ  [~ ~]
  ``[%HALL-PRIZE U.U.PIZ]
::
++  LOOK
  ::    QUERY ON STATE
  ::
  ::  FIND THE RESULT (IF ANY) FOR A GIVEN QUERY.
  ::
  ~/  %HALL-LOOK
  |=  QER/QUERY
  ^-  (UNIT (UNIT PRIZE))
  ?-  -.QER
      $CLIENT
    ``[%CLIENT BINDS NICKS]
  ::
      $CIRCLES
    =-  ``[%CIRCLES -]
    %-  ~(GAS IN *(SET NAME))
    %+  MURN  ~(TAP BY STORIES)
    |=  {N/NAME S/STORY}
    ^-  (UNIT NAME)
    ?:((~(SO-VISIBLE SO:TA N ~ S) WHO.QER) `N ~)
  ::
      $PUBLIC
    ``[%PUBLIC PUBLIC]
  ::
      $BURDEN
    :+  ~  ~
    :-  %BURDEN
    %-  ~(GAS IN *(MAP NAME BURDEN))
    %+  MURN  ~(TAP BY STORIES)
    |=  {N/NAME S/STORY}
    ^-  (UNIT (PAIR NAME BURDEN))
    ::  ONLY AUTO-FEDERATE CHANNELS FOR NOW.
    ?.  ?=($CHANNEL SEC.CON.SHAPE.S)  ~
    :+  ~  N
    ::  SHARE NO MORE THAN THE LAST 100, FOR PERFORMANCE REASONS.
    :+  ?:  (LTE COUNT.S 100)  GRAMS.S
        (SLAG (SUB COUNT.S 100) GRAMS.S)
      [SHAPE.S MIRRORS.S]
    [LOCALS.S REMOTES.S]
  ::
      $REPORT
    ::TODO  GALL NOTE: NEED TO BE ABLE TO SUBSCIRBE TO JUST CHANGES... OR JUST
    ::      DATA ETC.
    ``[%REPORT ~]
  ::
      $PEERS
    =+  SOY=(~(GET BY STORIES) NOM.QER)
    ?~  SOY  ~
    ``[%PEERS PEERS.U.SOY]
  ::
      $CIRCLE  ::REVIEW  SHOULD WE SEND PRECS & CONFIG TO OUT OF RANGE SUBS?
    =+  SOY=(~(GET BY STORIES) NOM.QER)
    ?~  SOY  ~
    :+  ~  ~
    :-  %CIRCLE
    :+  ?.  (~(HAS IN WAT.QER) %GRAMS)  ~
        %+  TURN
          =-  (~(SO-FIRST-GRAMS SO:TA NOM.QER ~ -) RAN.QER)
          ::TODO  THIS CAN BE DONE MORE EFFICIENTLY.
          ?~  WER.QER  U.SOY
          =-  U.SOY(GRAMS -, COUNT (LENT -))
          ?.  (~(HAS BY SOURCED.U.SOY) U.WER.QER)  ~
          %+  TURN
            %-  FLOP
            (~(GOT BY SOURCED.U.SOY) U.WER.QER)
          |=  N/@UD
          (SNAG N GRAMS.U.SOY)
        (CURY GRAM-TO-ENVELOPE NOM.QER)
      :-  SHAPE.U.SOY
      ?.  (~(HAS IN WAT.QER) %CONFIG-R)  ~
      MIRRORS.U.SOY
    :-  LOCALS.U.SOY
    ?.  (~(HAS IN WAT.QER) %GROUP-R)  ~
    REMOTES.U.SOY
  ==
::
++  DEDICATE
  ::    RUMOR-STORY TO THEIRS
  ::
  ::  MODIFY A %STORY DIFF TO MAKE IT ABOUT THEIR SHIP
  ::  INSTEAD OF OURS.
  ::
  ~/  %HALL-DEDICATE
  |=  {WHO/SHIP NOM/NAME DET/DELTA-STORY}
  ^-  RUMOR-STORY
  ?+  -.DET  DET
    ::
    ::  INTERNAL-ONLY CHANGES.
    $FOLLOW     !!
    $INHERITED  !!
    $SEQUENT    !!
    $SOURCED    !!
  ::
      $GRAM
    :+  %GRAM
      ?.  =(SRC.DET [OUR.BOL NOM])
        SRC.DET
      [WHO NOM]
    %+  GRAM-TO-ENVELOPE  NOM
    %_  GAM.DET
        AUD
      %-  ~(RUN IN AUD.GAM.DET)
      |=  C/CIRCLE
      ?.  =(C [OUR.BOL NOM])  C
      [WHO NOM]
    ==
  ::
      $CONFIG
    ?.  =(CIR.DET [OUR.BOL NOM])
      DET
    DET(CIR [WHO NOM])
  ::
      $STATUS
    ?.  =(CIR.DET [OUR.BOL NOM])
      DET
    DET(CIR [WHO NOM])
  ==
::
++  GRAM-TO-ENVELOPE
  ::    WRAP GRAM WITH NR
  ::
  ::  DEDUCE THE INITIAL MSG NUMBER FROM A TELEGRAM
  ::  FOR A GIVEN STORY. ASSUMES BOTH STORY AND
  ::  TELEGRAM ARE KNOWN.
  ::
  ~/  %HALL-GRAM-TO-ENVELOPE
  |=  {NOM/NAME GAM/TELEGRAM}
  ^-  ENVELOPE
  :_  GAM
  %.  UID.GAM
  ~(GOT BY KNOWN:(~(GOT BY STORIES) NOM))
::
++  CIRCLE-FEEL-STORY
  ::
  ~/  %HALL-CIRCLE-FEEL-STORY
  |=  $:  WER/(UNIT CIRCLE)
          WAT/(SET CIRCLE-DATA)
          NOM/NAME
          DET/DELTA-STORY
      ==
  ^-  ?
  ?&
    ?~  WER  &
    ?+  -.DET  &
      $GRAM     =(SRC.DET U.WER)
      $CONFIG   =(CIR.DET U.WER)
      $STATUS   =(CIR.DET U.WER)
    ==
  ::
    ?:  =(WAT ~)  &
    ?+  -.DET   |
      $GRAM     (~(HAS IN WAT) %GRAMS)
      $NEW      (~(HAS IN WAT) %CONFIG-L)
      $REMOVE   (~(HAS IN WAT) %CONFIG-L)
      $CONFIG   ?:  =(CIR.DET [OUR.BOL NOM])
                  (~(HAS IN WAT) %CONFIG-L)
                (~(HAS IN WAT) %CONFIG-R)
      $STATUS   ?:  =(CIR.DET [OUR.BOL NOM])
                  (~(HAS IN WAT) %GROUP-L)
                (~(HAS IN WAT) %GROUP-R)
    ==
  ==
::
++  FEEL
  ::    DELTA TO RUMOR
  ::
  ::  IF THE GIVEN DELTA CHANGES THE RESULT OF THE GIVEN
  ::  QUERY, PRODUCE THE RELEVANT RUMOR.
  ::
  ~/  %HALL-FEEL
  |=  {QER/QUERY DET/DELTA}
  ^-  (UNIT RUMOR)
  ?-  -.QER
      $CLIENT
    ::  CHANGES TO SHARED UI STATE APPLY.
    ?+  -.DET  ~
      $GLYPH  `[%CLIENT DET]
      $NICK   `[%CLIENT DET]
    ==
  ::
      $CIRCLES
    ::NOTE  THIS IS ANOTHER CASE WHERE HAVING ACCESS TO
    ::      THE PRE-DELTA STATE WOULD BE NICE TO HAVE.
    ?.  ?=($STORY -.DET)  ~
    =;  ADD/(UNIT ?)
      ?~  ADD  ~
      `[%CIRCLES U.ADD NOM.DET]
    ::REVIEW  THIS COULD BE CONSIDERED LEAKY, SINCE IT
    ::        DOESN'T CHECK IF {WHO} EVER KNEW OF {NOM},
    ::        BUT DOES THAT MATTER? CAN'T REALLY CHECK..
    ::  IF THE STORY GOT DELETED, REMOVE IT FROM THE CIRCLES LISTING.
    ?:  ?=($REMOVE -.DET.DET)  `|
    =+  SOY=(~(GOT BY STORIES) NOM.DET)
    ::  IF THE STORY GOT CREATED, OR SOMETHING ABOUT THE READ PERMISSIONS SET
    ::  FOR THE SUBSCRIBER CHANGED, UPDATE THE CIRCLES LISTING.
    =;  DIF/?
      ?.  DIF  ~
      ::  IF THE STORY JUST GOT CREATED, DON'T SEND A REMOVE RUMOR, BECAUSE IT
      ::  NEVER SHOWED UP IN THE FIRST PLACE.
      =-  ?:(&(?=($NEW -.DET.DET) !-) ~ `-)
      ?|  (TEAM:TITLE OUR.BOL WHO.QER)
          (~(SO-VISIBLE SO:TA NOM.DET ~ SOY) WHO.QER)
      ==
    ?|  ?=($NEW -.DET.DET)
      ::
        ?&  ?=($CONFIG -.DET.DET)
            ?=($PERMIT -.DIF.DET.DET)
            ?=(?($CHANNEL $VILLAGE) SEC.CON.SHAPE.SOY)
            (~(HAS IN SIS.DIF.DET.DET) WHO.QER)
        ==
    ==
  ::
      $PUBLIC
    ?.  ?=($PUBLIC -.DET)  ~
    `DET
  ::
      $BURDEN
    ?.  ?=($STORY -.DET)  ~
    ?:  &(=(WHO.QER SRC.BOL) =(RIR /REPORT/(SCOT %P SRC.BOL)))  ~
    ?:  ?=(?($FOLLOW $INHERITED $SEQUENT $SOURCED) -.DET.DET)  ~
    ::  ONLY BURDEN CHANNELS FOR NOW.
    ?.  (~(HAS BY STORIES) NOM.DET)  ~
    ?.  =(%CHANNEL SEC.CON.SHAPE:(~(GOT BY STORIES) NOM.DET))  ~
    `[%BURDEN NOM.DET (DEDICATE WHO.QER NOM.DET DET.DET)]
  ::
      $REPORT
    ::  ONLY SEND CHANGES WE DIDN'T GET FROM ABOVE.
    ?:  =(SRC.BOL (ABOVE:HALL-LIB [OUR NOW OUR]:BOL))  ~
    ::  ONLY SEND STORY REPORTS ABOUT GRAMS AND STATUS.
    ?.  ?=($STORY -.DET)  ~
    ?.  ?=(?($GRAM $STATUS) -.DET.DET)  ~
    =+  SOY=(~(GOT BY STORIES) NOM.DET)
    ::  AND ONLY IF THE STORY IS INHERITED.
    ?.  INHERITED.SOY  ~
    ::  ONLY BURDEN CHANNELS FOR NOW.
    ?.  =(%CHANNEL SEC.CON.SHAPE.SOY)  ~
    `[%BURDEN NOM.DET (DEDICATE (ABOVE:HALL-LIB [OUR NOW OUR]:BOL) NOM.DET DET.DET)]
  ::
      $PEERS
    ?.  ?=($STORY -.DET)      ~
    ?.  =(NOM.QER NOM.DET)    ~
    ?.  ?=($PEER -.DET.DET)   ~
    `[%PEERS +.DET.DET]
  ::
      $CIRCLE
    ?.  ?=($STORY -.DET)                              ~
    ?.  =(NOM.QER NOM.DET)                            ~
    ?.  %-  CIRCLE-FEEL-STORY
        [WER.QER WAT.QER NOM.DET DET.DET]             ~
    ?.  ?|  ?=($REMOVE -.DET.DET)
          ::
            =<  IN  %.  RAN.QER
            =+  SOY=(~(GOT BY STORIES) NOM.QER)
            ~(SO-IN-RANGE SO:TA NOM.QER ~ SOY)
        ==
      ~
    ?.  ?=(?($GRAM $NEW $CONFIG $STATUS $REMOVE) -.DET.DET)   ~
    :+  ~  %CIRCLE
    ?+  DET.DET  DET.DET
        {$GRAM *}
      :+  %GRAM  SRC.DET.DET
      (GRAM-TO-ENVELOPE NOM.DET GAM.DET.DET)
    ==
  ==
::
++  AFFECTION
  ::    RUMORS TO INTERESTED
  ::
  ::  FOR A GIVEN DELTA, SEND RUMORS TO ALL QUERIES IT
  ::  AFFECTS.
  ::
  ~/  %HALL-AFFECTION
  |=  DET/DELTA
  ^-  (LIST MOVE)
  ::  CACHE RESULTS FOR PATHS.
  =|  RES/(MAP PATH (LIST MOVE))
  %-  ZING
  %+  TURN  ~(TAP BY SUP.BOL)
  |=  {B/BONE S/SHIP P/PATH}
  ^-  (LIST MOVE)
  =+  MUR=(~(GET BY RES) P)
  ?^  MUR  U.MUR
  =-  =.  RES  (~(PUT BY RES) P -)
      -
  =+  QER=(PATH-TO-QUERY P)
  %+  WELP
    =+  RUM=(FEEL QER DET)
    ?~  RUM  ~
    [B %DIFF %HALL-RUMOR U.RUM]~
  ?.  ?=($CIRCLE -.QER)  ~
  ::  KILL THE SUBSCRIPTION IF WE FORGOT THE STORY.
  ?.  (~(HAS BY STORIES) NOM.QER)  (GENTLE-QUIT B S QER)
  ::  KILL THE SUBSCRIPTION IF IT'S PAST ITS RANGE.
  =-  ?:(DONE:- (GENTLE-QUIT B S QER) ~)
  %.  RAN.QER
  =-  ~(SO-IN-RANGE SO:TA NOM.QER ~ -)
  (~(GOT BY STORIES) NOM.QER)
::
++  PATH-TO-QUERY
  ::    PATH, COINS, QUERY
  ::
  ::  PARSE A PATH INTO A (LIST COIN), THEN PARSE THAT
  ::  INTO A QUERY STRUCTURE.
  ::
  ~/  %HALL-PATH-TO-QUERY
  |=  PAX/PATH
  ?.  ?=({$CIRCLE @TAS *} PAX)
    (COINS-TO-QUERY (PATH-TO-COINS PAX))
  =/  QER/QUERY  [%CIRCLE I.T.PAX ~ ~ ~]
  ?>  ?=($CIRCLE -.QER)  ::  FOR TYPE SYSTEM.
  =+  PAX=T.T.PAX
  =+  ^-  {QER/QUERY PAX/PATH}
    ?.  ?=({@ @ *} PAX)  [QER PAX]
    =+  HOS=(SLAW %P I.PAX)
    ?~  HOS  [QER PAX]
    :_  T.T.PAX
    QER(WER `[U.HOS I.T.PAX])
  ?>  ?=($CIRCLE -.QER)
  |-  ^+  QER
  ?~  PAX  QER
  ::TODO  CAN PROBABLY DO THIS A BIT BETTER...
  ?+  I.PAX
    QER(RAN (PATH-TO-RANGE:HALL-LIB PAX))
  ::
    CIRCLE-DATA   %_  $  PAX  T.PAX
                    WAT.QER   (~(PUT IN WAT.QER) I.PAX)
                  ==
    $GROUP        %_  $  PAX  T.PAX
                    WAT.QER   %-  ~(UNI IN WAT.QER)
                              ^+  WAT.QER
                              =/  DAT=(LIST CIRCLE-DATA)  [%GROUP-L %GROUP-R ~]
                              (SY DAT)
                  ==
    $CONFIG       %_  $  PAX  T.PAX
                    WAT.QER   %-  ~(UNI IN WAT.QER)
                              ^+  WAT.QER
                              =/  DAT=(LIST CIRCLE-DATA)  [%CONFIG-L %CONFIG-R ~]
                              (SY DAT)
                  ==
  ==
::
++  PATH-TO-COINS
  ::    PATH TO COIN LIST
  ::
  ::  PARSE A PATH INTO A LIST OF COINS.
  ::
  ~/  %HALL-PATH-TO-COINS
  |=  PAX/PATH
  ^-  (LIST COIN)
  %+  TURN  `PATH`PAX
  |=  A/@TA
  (NEED (SLAY A))
::
++  COINS-TO-QUERY
  ::    COIN LIST TO QUERY
  ::
  ::  PARSE A LIST OF COINS INTO A QUERY STRUCTURE.
  ::
  ^-  $-((LIST COIN) QUERY)
  =>  DEPA:HALL-LIB
  |^  %-  AF  :~
          [%CLIENT UL]
          [%CIRCLES (AT /[%P])]
          [%PUBLIC UL]
          [%BURDEN (AT /[%P])]
          [%REPORT UL]
      ==
  ++  TERM  (DO %TAS)
  ++  RANG  (MU (AL PLAC (MU (UN PLAC))))
  ++  PLAC  (OR %DA %UD)
  --
::
++  LEAK
  ::    VISIBLE TO
  ::
  ::  DETERMINE IF THE GIVEN QUERY IS VISIBLE TO THE
  ::  SHIP.
  ::
  ~/  %HALL-LEAK
  |=  {WHO/SHIP QER/QUERY}
  ^-  ?
  ?-  -.QER
    $CLIENT   (TEAM:TITLE OUR.BOL WHO)
    $CIRCLES  =(WHO WHO.QER)
    $PUBLIC   &
    $BURDEN   ?&  =(WHO WHO.QER)
                  =(OUR.BOL (ABOVE:HALL-LIB OUR.BOL NOW.BOL WHO))
              ==
    $PEERS    =(WHO OUR.BOL)  ::TODO  OR SO-VISIBLE?
    $REPORT   =(WHO (ABOVE:HALL-LIB [OUR NOW OUR]:BOL))
  ::
      $CIRCLE
    ?.  (~(HAS BY STORIES) NOM.QER)  |
    %.  WHO
    ~(SO-VISIBLE SO:TA NOM.QER ~ (~(GOT BY STORIES) NOM.QER))
  ==
::
::  #
::  #  %POKE-EVENTS
::  #
::
++  POKE-HALL-COMMAND
  ::    ACCEPT COMMAND
  ::
  ::  INCOMING HALL COMMAND. PROCESS IT AND UPDATE LOGS.
  ::
  ~/  %HALL-POKE-HALL-COMMAND
  |=  COD/COMMAND
  ^-  (QUIP MOVE _+>)
  =^  MOS  +>.$
    %-  PRE-BAKE
    TA-DONE:(TA-APPLY:TA SRC.BOL COD)
  =^  MOW  +>.$
    LOG-ALL-TO-FILE
  [(WELP MOS MOW) +>.$]
::
++  POKE-HALL-ACTION
  ::    ACCEPT ACTION
  ::
  ::  INCOMING HALL ACTION. PROCESS IT.
  ::
  ~/  %HALL-POKE-HALL-ACTION
  |=  ACT/ACTION
  ^-  (QUIP MOVE _+>)
  ?.  (TEAM:TITLE OUR.BOL SRC.BOL)
    %-  PRE-BAKE
    =<  TA-DONE
    %-  TA-NOTE:TA
    "HALL-ACTION STRANGER {(SCOW %P SRC.BOL)}"
  =^  MOS  +>.$
    %-  PRE-BAKE
    TA-DONE:(TA-ACTION:TA ACT)
  =^  MOW  +>.$
    LOG-ALL-TO-FILE
  [(WELP MOS MOW) +>.$]
::
::  #
::  #  %SUBSCRIPTION-EVENTS
::  #
::
++  DIFF-HALL-PRIZE
  ::    ACCEPT PRIZE
  ::
  ::  ACCEPT A QUERY RESULT.
  ::
  ~/  %HALL-DIFF-HALL-PRIZE
  |=  {WIR/WIRE PIZ/PRIZE}
  ^-  (QUIP MOVE _+>)
  =^  MOS  +>.$
    %-  PRE-BAKE
    =>  (TA-TAKE:TA WIR PIZ)
    (FLOP DELTAS)
    ::TODO  IDEALLY THIS, BUT RUNTIME ERROR FOR %BURDEN PRIZE
    ::%-  PRE-BAKE
    ::TA-DONE:(TA-TAKE:TA WIR PIZ)
  =^  MOW  +>.$
    LOG-ALL-TO-FILE
  [(WELP MOS MOW) +>.$]
::
++  DIFF-HALL-RUMOR
  ::    ACCEPT RUMOR
  ::
  ::  ACCEPT A QUERY RESULT CHANGE.
  ::
  ~/  %HALL-DIFF-HALL-RUMOR
  |=  {WIR/WIRE RUM/RUMOR}
  ^-  (QUIP MOVE _+>)
  ::NOTE  TO KEEP US FROM ECHOING CHANGES BACK TO THEIR
  ::      SENDER, WE WANT TO KNOW (IN ++FEEL) IF A DELTA
  ::      WAS CAUSED BY A RUMOR FROM A /REPORT.
  ::      IF GALL WORKED AS ADVERTISED, WE'D USE OST.BOL
  ::      AND WEX.BOL TO FIND OUT, BUT WEX IS NEVER SET,
  ::      SO WE JUST KEEP TRACK OF THE "CURRENT RUMOR
  ::      WIRE" INSTEAD.
  =.  RIR  WIR
  =^  MOS  +>.$
    %-  PRE-BAKE
    =>  (TA-HEAR:TA WIR RUM)
    (FLOP DELTAS)
    ::TODO  RUNTIME ERROR FOR %BURDEN RUMORS.
    ::TA-DONE:(TA-HEAR:TA WIR RUM)
  =^  MOW  +>.$
    LOG-ALL-TO-FILE
  [(WELP MOS MOW) +>.$]
::
++  PEER
  ::    ACCEPT SUBSCRIPTION
  ::
  ::  INCOMING SUBSCRIPTION ON {PAX}.
  ::
  ~/  %HALL-PEER
  |=  PAX/PATH
  ^-  (QUIP MOVE _+>)
  ?:  ?=([%SOLE *] PAX)  ~&(%HALL-NO-SOLE !!)
  =+  QER=(PATH-TO-QUERY PAX)
  ?.  (LEAK SRC.BOL QER)  ~&(%PEER-INVISIBLE !!)
  =^  MOS  +>.$
    %-  PRE-BAKE
    TA-DONE:(TA-SUBSCRIBE:TA SRC.BOL QER)
  :_  +>.$
  =+  PIZ=(LOOK QER)
  ?~  PIZ  ~&([%QUERY-UNAVAILABLE PAX] MOS)
  ?~  U.PIZ  ~&([%QUERY-INVALID PAX] MOS)
  :_  MOS
  [OST.BOL %DIFF %HALL-PRIZE U.U.PIZ]
::
++  PULL
  ::  UNSUBSCRIBES.
  ::
  ~/  %HALL-PULL
  |=  PAX/PATH
  ^-  (QUIP MOVE _+>)
  [~ +>]
::
++  PULL-CIRCLE
  ::  SOMEONE ENDS A /CIRCLE SUBSCRIPTION.
  ::
  ~/  %HALL-PULL-CIRCLE
  |=  PAX/PATH
  ^-  (QUIP MOVE _+>)
  %-  PRE-BAKE
  =+  QER=(PATH-TO-QUERY %CIRCLE PAX)
  ?>  ?=($CIRCLE -.QER)
  ?.  (~(HAS BY STORIES) NOM.QER)  ~
  [%STORY NOM.QER %PEER | SRC.BOL QER]~
::
++  REAP
  ::    SUBSCRIPTION N/ACK
  ::
  ::  UPDATE STATE TO REFLECT SUBSCRIPTION SUCCESS
  ::
  ~/  %HALL-REAP
  |=  {WIR/WIRE FAL/(UNIT TANG)}
  ^-  (QUIP MOVE _+>)
  %-  PRE-BAKE
  %+  WELP
    ?.  ?=({$CIRCLE *} WIR)  ~
    =+  WER=(ETCH WIR)
    ?>  ?=($CIRCLE -.WER)
    =<  TA-DONE
    %.  [NOM.WER SRC.WER]
    ?~  FAL  TA-GREET:TA
    TA-LEAVE:TA
  ?~  FAL  ~
  =<  TA-DONE
  =-  (TA-GRIEVE:TA - U.FAL)
  =+  (WIRE-TO-TARGET WIR)
  %+  WELD  "FAILED (RE)SUBSCRIBE TO {(SCOW %P P)} ON "
  %+  ROLL  Q
  |=  {A/@TA B/TAPE}
  :(WELD B "/" (TRIP A))
::
++  QUIT
  ::    DROPPED SUBSCRIPTION
  ::
  ::  GALL DROPPED OUT SUBSCRIPTION. RESUBSCRIBE.
  ::
  ~/  %HALL-QUIT
  |=  WIR/WIRE
  ^-  (QUIP MOVE _+>)
  [[(WIRE-TO-PEER WIR) ~] +>]
::
++  QUIT-CIRCLE
  ::    DROPPED CIRCLE SUB
  ::
  ::  GALL DROPPED OUR SUBSCRIPTION. RESUBSCRIBE.
  ::
  ~/  %HALL-QUIT-CIRCLE
  |=  WIR/WIRE
  ^-  (QUIP MOVE _+>)
  %+  ETCH-CIRCLE  [%CIRCLE WIR]
  |=  {NOM/NAME SRC/SOURCE}
  %-  PRE-BAKE
  TA-DONE:(TA-RESUB:TA NOM SRC)
::
++  COUP-REPEAT
  ::    MESSAGE N/ACK
  ::
  ::  ACK FROM ++TA-TRANSMIT. MARK THE MESSAGE AS
  ::  RECEIVED OR REJECTED.
  ::
  ~/  %HALL-COUP-REPEAT
  |=  {WIR/WIRE FAL/(UNIT TANG)}
  ^-  (QUIP MOVE _+>)
  %+  ETCH-REPEAT  [%REPEAT WIR]
  |=  {CIR/CIRCLE SES/(LIST SERIAL)}
  %-  PRE-BAKE
  TA-DONE:(TA-REPEAT:TA CIR SES FAL)
::
::  #
::  #  %LOGGING
::  #
::
++  POKE-HALL-SAVE
  ::    SAVE AS LOG
  ::
  ::  STORES THE TELEGRAMS OF STORY {NOM} IN A LOG FILE,
  ::  TO BE RE-LOADED BY ++POKE-HALL-LOAD.
  ::TODO  MAYBE UPDATE TO ALSO STORE SOURCED LIST.
  ::
  ~/  %HALL-POKE-HALL-SAVE
  |=  NOM/NAME
  ^-  (QUIP MOVE _+>)
  =/  PAF/PATH
    /(SCOT %P OUR.BOL)/HOME/(SCOT %DA NOW.BOL)/HALL/[NOM]/HALL-TELEGRAMS
  =+  GRAMS:(~(GOT BY STORIES) NOM)
  :_  +>.$
  :_  ~
  :*  OST.BOL
      %INFO
      /JAMFILE
      (FOAL:SPACE:USERLIB PAF [%HALL-TELEGRAMS !>(-)])
  ==
::
++  POKE-LOAD-LEGACY
  ::  LOADS LEGACY MESSAGES INTO THE STORY {NOM}.
  ::
  ~/  %HALL-POKE-HALL-LEGACY
  |=  NOM/NAME
  ^-  (QUIP MOVE _+>)
  =/  JAMS/JSON
    .^  JSON
        %CX
        /(SCOT %P OUR.BOL)/HOME/(SCOT %DA NOW.BOL)/HALL/LEGACY-TELEGRAMS/JSON
    ==
  =+  GRAMS=(FROM-JSON:HALL-LEGACY JAMS)
  ~&  [%LOADED (LENT GRAMS)]
  %-  PRE-BAKE
  %+  TURN  (FLOP GRAMS)
  |=  T/TELEGRAM
  [%STORY NOM %GRAM [OUR.BOL NOM] T]
::
++  POKE-HALL-LOAD
  ::    LOAD FROM LOG
  ::
  ::  LOADS THE TELEGRAMS OF STORY {NOM} INTO OUR STATE,
  ::  AS SAVED IN ++POKE-HALL-SAVE.
  ::
  ~/  %HALL-POKE-HALL-LOAD
  |=  NOM/NAME
  ^-  (QUIP MOVE _+>)
  =/  GRAMS
    .^  (LIST TELEGRAM)
        %CX
        /(SCOT %P OUR.BOL)/HOME/(SCOT %DA NOW.BOL)/HALL/[NOM]/HALL-TELEGRAMS
    ==
  %-  PRE-BAKE
  %+  TURN  GRAMS
  |=  T/TELEGRAM
  [%STORY NOM %GRAM [OUR.BOL NOM] T]
::
++  POKE-HALL-LOG
  ::  STARTS LOGGING STORY {NOM}'S MESSAGES.
  ::
  ~/  %HALL-POKE-HALL-LOG
  |=  NOM/NAME
  ^-  (QUIP MOVE _+>)
  :-  [(LOG-TO-FILE NOM) ~]
  %=  +>.$
      LOG
    %+  ~(PUT BY LOG)  NOM
    COUNT:(~(GOT BY STORIES) NOM)
  ==
::
++  POKE-HALL-UNLOG
  ::  STOPS LOGGING STORY {NOM}'S MESSAGES.
  ::
  ~/  %HALL-POKE-HALL-UNLOG
  |=  NOM/NAME
  ^-  (QUIP MOVE _+>)
  :-  ~
  +>.$(LOG (~(DEL BY LOG) NOM))
::
++  LOG-ALL-TO-FILE
  ::    UPDATE STORIES LOGS
  ::
  ::  FOR EVERY STORY WE'RE LOGGING, (OVER)WRITES ALL
  ::  THEIR GRAMS TO LOG FILES IF NEW ONES HAVE ARRIVED.
  ::
  ^-  (QUIP MOVE _.)
  :_  %_  .
          LOG
        %-  ~(URN BY LOG)
        |=  {NOM/NAME LEN/@UD}
        COUNT:(~(GOT BY STORIES) NOM)
      ==
  %+  MURN  ~(TAP BY LOG)
  |=  {NOM/NAME LEN/@UD}
  ^-  (UNIT MOVE)
  ?:  (GTE LEN COUNT:(~(GOT BY STORIES) NOM))
    ~
  `(LOG-TO-FILE NOM)
::
++  LOG-TO-FILE
  ::  LOGS ALL GRAMS OF STORY {NOM} TO A FILE.
  ::
  ~/  %HALL-LOG-ALL-TO-FILE
  |=  NOM/NAME
  ^-  MOVE
  =+  ^-  PAF/PATH
      =+  DAY=(YEAR %*(. (YORE NOW.BOL) +.T +:*TARP))
      %+  EN-BEAM:FORMAT  [OUR.BOL %HOME DA+NOW.BOL]
      /HALL-TELEGRAMS/(SCOT %DA DAY)/[NOM]/HALL
  =+  GRAMS:(~(GOT BY STORIES) NOM)
  :*  OST.BOL
      %INFO
      /JAMFILE
      (FOAL:SPACE:USERLIB PAF [%HALL-TELEGRAMS !>(-)])
  ==
::
::TODO  FOR DEBUG PURPOSES. REMOVE EVENTUALLY.
::  USERS BEWARE, HERE BE DRAGONS.
++  POKE-NOUN
  ~/  %HALL-POKE-NOUN
  |=  A/*
  ^-  (QUIP MOVE _+>)
  ?:  ?=([%KILL SHIP] A)
    :_  +>
    %-  ~(REP BY SUP.BOL)
    |=  [[B=BONE C=(PAIR SHIP PATH)] OUT=(LIST MOVE)]
    ?:  =(+.A P.C)
      [[B %QUIT ~] OUT]
    OUT
  ?>  ?=(@T A)
  ?:  =(A 'CHECK')
    ~&  'VERIFYING MESSAGE REFERENCE INTEGRITY...'
    =-  ~&(- [~ +>.$])
    %-  ~(URN BY STORIES)
    |=  {N/NAME S/STORY}
    =+  %-  ~(REP BY KNOWN.S)
      |=  {{U/SERIAL A/@UD} K/@UD M/@UD}
      :-  ?:((GTH A K) A K)
      ?:  =(U UID:(SNAG A GRAMS.S))  M
      ~?  (LTH M 3)
        :*  [%FAKE A U]
            [%PREV UID:(SNAG (DEC A) GRAMS.S)]
            [%REAL UID:(SNAG A GRAMS.S)]
            [%NEXT UID:(SNAG +(A) GRAMS.S)]
        ==
      +(M)
    :^  COUNT=COUNT.S
        LENT=(LENT GRAMS.S)
      KNOWN=K
    MISMATCH=M
  ?:  =(A 'CHECK SUBS')
    ~&  'HERE ARE ALL INCOMING NON-CIRCLE SUBS'
    ~&  ^-  (LIST (PAIR SHIP PATH))
        %+  MURN  ~(TAP BY SUP.BOL)
        |=  {B/BONE S/SHIP P/PATH}
        ^-  (UNIT (PAIR SHIP PATH))
        ?:  ?=({$CIRCLE *} P)  ~
        `[S P]
    [~ +>]
  ?:  =(A 'CHECK ALL SUBS')
    ~&  'HERE ARE ALL INCOMING SUBS'
    ~&  ^-  (LIST (PAIR SHIP PATH))
        %+  TURN  ~(TAP BY SUP.BOL)
        |=  {B/BONE S/SHIP P/PATH}
        ^-  (PAIR SHIP PATH)
        [S P]
    [~ +>]
  ?:  =(A 'REBUILD')
    ~&  'REBUILDING MESSAGE REFERENCES...'
    =-  [~ +>.$(STORIES -)]
    %-  ~(URN BY STORIES)
    |=  {NOM/NAME SOY/STORY}
    =+  %+  ROLL  GRAMS.SOY
      |=  {T/TELEGRAM C/@UD K/(MAP SERIAL @UD) S/(MAP CIRCLE (LIST @UD))}
      :+  +(C)  (~(PUT BY K) UID.T C)
      =/  SRC/CIRCLE
        ?:  (~(HAS BY AUD.T) [OUR.BOL NOM])  [OUR.BOL NOM]
        ?~  AUD.T  ~&(%STRANGE-AUD [OUR.BOL %INBOX])
        N.AUD.T
      %+  ~(PUT BY S)  SRC
      [C (FALL (~(GET BY S) SRC) ~)]
    SOY(COUNT C, KNOWN K, SOURCED S)
  ?:  =(A 'REFEDERATE')
    ~&  'REFEDERATING. MAY TAKE A WHILE...'
    :_  +>
    =+  BOV=(ABOVE:HALL-LIB [OUR NOW OUR]:BOL)
    ?:  =(BOV OUR.BOL)  ~
    :~  [OST.BOL %PULL /BURDEN [BOV DAP.BOL] ~]
        (WIRE-TO-PEER /BURDEN)
    ==
  ?:  =(A 'INCOMING')
    ~&  'INCOMING SUBSCRIPTIONS (IGNORING CIRCLE SUBS):'
    ~&  %+  SKIP  ~(TAP BY SUP.BOL)
        |=  {BONE (PAIR SHIP PATH)}
        &(?=({$CIRCLE *} Q) !?=({$CIRCLE $INBOX *} Q))
    [~ +>]
  ?:  =(A 'SOURCES')
    ~&  'SOURCES PER STORY:'
    ~&  %-  ~(URN BY STORIES)
        |=  {N/NAME S/STORY}
        [N SRC.SHAPE.S]
    [~ +>]
  ?:  =(`0 (FIND "RE-LISTEN " (TRIP A)))
    ~&  'RE-LISTENING'
    :_  +>
    :_  ~
    (WIRE-TO-PEER /REPORT/(CRIP (SLAG 10 (TRIP A))))
  ::
  ::
  ?:  =(A 'KILL-ALL-SUBS')
    :_  +>
    %-  ~(REP BY SUP.BOL)
    |=  [[B=BONE (PAIR SHIP PATH)] OUT=(LIST MOVE)]
    [[B %QUIT ~] OUT]
  ::
  ?:  =(A 'KILL-OUR-SUBS')
    :_  +>
    %-  ~(REP BY SUP.BOL)
    |=  [[B=BONE C=(PAIR SHIP PATH)] OUT=(LIST MOVE)]
    ?:  =(OUR.BOL P.C)
      [[B %QUIT ~] OUT]
    OUT
  ::
  ?:  =(A 'PRINT')
    ~&  SHAPE:(~(GOT BY STORIES) %INBOX)
    [~ +>]
  ::
  ?:  =(A 'PRINT ALL')
    ~&  %+  TURN  ~(TAP BY STORIES)
        |=  [N=NAME S=STORY]
        [N SHAPE:S]
    [~ +>]
  ::
  [~ +>]
--
