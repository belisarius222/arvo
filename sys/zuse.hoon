::                                                      ::  /VAN/ZUSE
::                                                      ::  %REFERENCE/1
::  %ZUSE: ARVO LIBRARY.
::
::  %ZUSE IS TWO NESTED CORES: THE FIRST FOR MODELS
::  (DATA STRUCTURES), THE SECOND FOR ENGINES (FUNCTIONS
::  OR CLASSES).
::
::  EACH OF THESE STAGES IS SPLIT INTO CORES FOR EACH OF
::  ARVO'S EIGHT MAJOR VANES (KERNEL MODULES).  THESE ARE:
::
::      - %AMES: NETWORKING         (RHYMES WITH "GAMES")
::      - %BEHN: SCHEDULING         ("BANE")
::      - %CLAY: REVISION CONTROL   ("PLAY")
::      - %DILL: CONSOLE            ("PILL")
::      - %EYRE: WEB                ("FAIR")
::      - %FORD: BUILD              ("LORD")
::      - %GALL: APPLICATION        ("BALL")
::      - %JAEL: SECURITY           ("JAIL")
::
::  WITH %ZUSE IN YOUR CORE, THE ENGINES OF ANY VANE ARE
::  AVAILABLE AT `ENGINE:VANE`.  THE MODELS (MOLDS) ARE
::  AVAILABLE AT `MOLD:^VANE`.
::
::  EVERY MODEL OR ENGINE IN %ZUSE IS ATTACHED TO SOME
::  VANE, BUT ANY VANE CAN USE IT (IN ITS NAMESPACE),
::  AS CAN ANY NORMAL USER-LEVEL CODE.
::
::  IT'S IMPORTANT TO KEEP %ZUSE MINIMAL.  MODELS AND
::  ENGINES NOT USED OUTSIDE A VANE SHOULD STAY INSIDE
::  THAT VANE.
~%  %ZUSE  +>  ~
=>
::                                                      ::  ::
::::                                                    ::  ::  (1) MODELS
  ::                                                    ::  ::
|%
::  #  %MISC
::
::  MISCELLANEOUS SYSTEMS TYPES
::+|
++  ARES  (UNIT {P/TERM Q/(LIST TANK)})                 ::  POSSIBLE ERROR
::  +CAPPED-QUEUE: A +QEU WITH A MAXIMUM NUMBER OF ENTRIES
::
++  CAPPED-QUEUE
  |*  ITEM-TYPE=MOLD
  $:  QUEUE=(QEU ITEM-TYPE)
      SIZE=@UD
      MAX-SIZE=_64
  ==
::  +CLOCK: POLYMORPHIC CACHE TYPE FOR USE WITH THE CLOCK REPLACEMENT ALGORITHM
::
::     THE +BY-CLOCK CORE WRAPS INTERFACE ARMS FOR MANIPULATING A MAPPING FROM
::     :KEY-TYPE TO :VAL-TYPE. DETAILED DOCS FOR THIS TYPE CAN BE FOUND THERE.
::
++  CLOCK
  |*  $:  ::  KEY-TYPE: MOLD OF KEYS
          ::
          KEY-TYPE=MOLD
          ::  VAL-TYPE: MOLD OF VALUES
          ::
          VAL-TYPE=MOLD
      ==
    $:  LOOKUP=(MAP KEY-TYPE [VAL=VAL-TYPE FRESH=@UD])
        QUEUE=(QEU KEY-TYPE)
        SIZE=@UD
        MAX-SIZE=_2.048
        DEPTH=_1
    ==
::
++  COOP  (UNIT ARES)                                   ::  POSSIBLE ERROR
++  LIFE  @UD                                           ::  SHIP VERSION
++  MIME  {P/MITE Q/OCTS}                               ::  MIMETYPED DATA
++  OCTS  {P/@UD Q/@T}                                  ::  OCTET-STREAM
++  SOCK  {P/SHIP Q/SHIP}                               ::  OUTGOING [OUR HIS]
::+|
::
++  ROOF  (ROOM VASE)                                   ::  NAMESPACE
++  ROOM                                                ::  EITHER NAMESPACE
  |*  VASE/MOLD                                         ::  VASE OR MAZE
  $-  $:  REF/*                                         ::  REFERENCE TYPE
          LYC/(UNIT (SET SHIP))                         ::  LEAKSET
          CAR/TERM                                      ::  PERSPECTIVE
          BEM/BEAM                                      ::  PATH
      ==                                                ::
  %-  UNIT                                              ::  ~: UNKNOWN
  %-  UNIT                                              ::  ~ ~: INVALID
  (CASK VASE)                                           ::  MARKED CARGO
::
++  TURF  (LIST @T)                                     ::  DOMAIN, TLD FIRST
::                                                      ::
::::                      ++JSTD                        ::  JSON STANDARDS STRUCTURES
  ::                                                    ::::
++  JSTD
  |%
  ++  RPC
    |%
    +$  REQUEST
      $:  ID=@T
          METHOD=@T
          PARAMS=REQUEST-PARAMS
      ==
    ::
    +$  REQUEST-PARAMS
      $%  [%LIST (LIST JSON)]
          [%OBJECT (LIST (PAIR @T JSON))]
      ==
    +$  RESPONSE
      $~  [%FAIL *HTTR:EYRE]
      $%  [%RESULT ID=@T RES=JSON]
          [%ERROR ID=@T CODE=@T MESSAGE=@T]  ::TODO  DATA?
          [%FAIL HIT=HTTR:EYRE]
          [%BATCH BAS=(LIST RESPONSE)]
      ==
    --
  --
::                                                      ::::
::::                      ++ETHEREUM-TYPES                ::  ETH SURS FOR JAEL
  ::                                                    ::::
++  ETHEREUM-TYPES
  |%
  ::  ETHEREUM ADDRESS, 20 BYTES.
  ::
  ++  ADDRESS  @UX
  ::  EVENT LOCATION
  ::
  +=  EVENT-ID  [BLOCK=@UD LOG=@UD]
  ::
  ++  EVENTS  (SET EVENT-ID)
  --
::                                                      ::::
::::                      ++AZIMUTH-TYPES                 ::  AZ SURS FOR JAEL
  ::                                                    ::::
++  AZIMUTH-TYPES
  =,  ETHEREUM-TYPES
  |%
  ++  POINT
    $:  ::  OWNERSHIP
        ::
        $=  OWN
        $:  OWNER=ADDRESS
            MANAGEMENT-PROXY=ADDRESS
            VOTING-PROXY=ADDRESS
            TRANSFER-PROXY=ADDRESS
        ==
      ::
        ::  NETWORKING
        ::
        $=  NET
        %-  UNIT
        $:  =LIFE
            =PASS
            CONTINUITY-NUMBER=@UD
            SPONSOR=[HAS=? WHO=@P]
            ESCAPE=(UNIT @P)
        ==
      ::
        ::  SPAWNING
        ::
        $=  KID
        %-  UNIT
        $:  SPAWN-PROXY=ADDRESS
            SPAWNED=(SET @P)  ::TODO  SPARSE RANGE, PILE, SEE OLD JAEL ++PY
        ==
    ==
  ::
  +=  DNSES  [PRI=@T SEC=@T TER=@T]
  ::
  ++  DIFF-AZIMUTH
    $%  [%POINT WHO=@P DIF=DIFF-POINT]
        [%DNS DNSES]
    ==
  ::
  ++  DIFF-POINT
    $%  [%FULL NEW=POINT]                           ::
        [%OWNER NEW=ADDRESS]                        ::  OWNERCHANGED
        [%ACTIVATED WHO=@P]                         ::  ACTIVATED
        [%SPAWNED WHO=@P]                           ::  SPAWNED
        [%KEYS =LIFE =PASS]                         ::  CHANGEDKEYS
        [%CONTINUITY NEW=@UD]                       ::  BROKECONTINUITY
        [%SPONSOR NEW=[HAS=? WHO=@P]]               ::  ESCAPEACC/LOSTSPONS
        [%ESCAPE NEW=(UNIT @P)]                     ::  ESCAPEREQ/CAN
        [%MANAGEMENT-PROXY NEW=ADDRESS]             ::  CHANGEDMANAGEMENTPRO
        [%VOTING-PROXY NEW=ADDRESS]                 ::  CHANGEDVOTINGPROXY
        [%SPAWN-PROXY NEW=ADDRESS]                  ::  CHANGEDSPAWNPROXY
        [%TRANSFER-PROXY NEW=ADDRESS]               ::  CHANGEDTRANSFERPROXY
    ==
  --
::                                                      ::::
::::                      ++AMES                          ::  (1A) NETWORK
  ::                                                    ::::
++  AMES  ^?
  |%
  ::                                                    ::
  ::::                  ++ABLE:AMES                     ::  (1A1) ARVO MOVES
    ::                                                  ::::
  ++  ABLE  ^?
    |%
    ++  NOTE                                            ::  OUT REQUEST $->
      $%  $:  $B                                        ::  TO %BEHN
      $%  {$REST P/@DA}                                 ::  CANCEL TIMER
          {$WAIT P/@DA}                                 ::  SET TIMER
      ==  ==                                            ::
          $:  $D                                        ::  TO %DILL
      $%  {$FLOG P/FLOG:DILL}                           ::
      ==  ==                                            ::
          $:  %J                                        ::  TO %JAEL
      $%  [%MEET =SHIP =LIFE =PASS]                     ::  NEIGHBOR
          [%PUBS =SHIP]                                 ::  VIEW PUBLIC KEYS
          [%TURF ~]                                     ::  VIEW DOMAINS
          [%VEIN ~]                                     ::  VIEW PRIVATE KEYS
      ==  ==                                            ::
          $:  $G                                        ::  TO %GALL
      $%  {$DEAL P/SOCK Q/CUSH:GALL}                    ::
      ==  ==                                            ::
          $:  @TAS                                      ::  TO ANY
      $%  {$WEST P/SHIP Q/PATH R/*}                     ::
      ==  ==  ==                                        ::
    ++  GIFT                                            ::  OUT RESULT <-$
      $%  {$MACK P/(UNIT TANG)}                         ::  ACKNOWLEDGEMENT
          {$MASS P/MASS}                                ::  MEMORY USAGE
          {$SEND P/LANE Q/@}                            ::  TRANSMIT PACKET
          {$TURF P/(LIST TURF)}                         ::  BIND TO DOMAINS
          {$WOOT P/SHIP Q/COOP}                         ::  REACTION MESSAGE
      ==                                                ::
    ++  SIGN                                            ::  IN RESULT _<-
      $%  $:  $B                                        ::  TO %BEHN
      $%  {$WAKE ~}                                     ::  TIMER ACTIVATE
      ==  ==                                            ::
          $:  %J                                        ::  FROM %JAEL
      $%  [%PUBS PUBLIC:ABLE:JAEL]                      ::  PUBLIC KEYS
          [%TURF TURF=(LIST TURF)]                      ::  BIND TO DOMAINS
          [%VEIN =LIFE VEIN=(MAP LIFE RING)]            ::  PRIVATE KEYS
      ==  ==                                            ::
          $:  $G                                        ::  FROM %GALL
      $%  {$UNTO P/CUFT:GALL}                           ::
          {$MEAN P/ARES}                                ::  XX OLD CLEAN UP
          {$NICE ~}                                    ::
      ==  ==                                            ::
          $:  @TAS                                      ::
      $%  {$CRUD P/@TAS Q/(LIST TANK)}                  ::  BY ANY
          {$MACK P/(UNIT TANG)}                         ::  MESSAGE ACK
          {$WOOT P/SHIP Q/COOP}                         ::  REACTION MESSAGE
      ==  ==  ==                                        ::
    ++  TASK                                            ::  IN REQUEST ->$
      $%  {$BARN ~}                                    ::  NEW UNIX PROCESS
          {$BONK ~}                                     ::  RESET THE TIMER
          {$CRUD P/@TAS Q/(LIST TANK)}                  ::  ERROR WITH TRACE
          {$HEAR P/LANE Q/@}                            ::  RECEIVE PACKET
          {$HALO P/LANE Q/@ R/ARES}                     ::  HOLE WITH TRACE
          {$HOLE P/LANE Q/@}                            ::  PACKET FAILED
          [%INIT P=SHIP]                                ::  REPORT INSTALL
          {$KICK P/@DA}                                 ::  WAKE UP
          {$NUKE P/@P}                                  ::  TOGGLE AUTO-BLOCK
          {$SUNK P=SHIP Q=LIFE}                         ::  REPORT DEATH
          {$VEGA ~}                                     ::  REPORT UPGRADE
          {$WAKE ~}                                     ::  TIMER ACTIVATE
          {$WEGH ~}                                     ::  REPORT MEMORY
          {$WEST P/SHIP Q/PATH R/*}                     ::  NETWORK REQUEST
          {$WANT P/SHIP Q/PATH R/*}                     ::  FORWARD MESSAGE
      ==                                                ::
    --  ::ABLE
  ::
  ::::                                                  ::  (1A2)
    ::
  ++  ACRU  $_  ^?                                      ::  ASYM CRYPTOSUITE
    |%                                                  ::  OPAQUE OBJECT
    ++  AS  ^?                                          ::  ASYM OPS
      |%  ++  SEAL  |~({A/PASS B/@} *@)                 ::  ENCRYPT TO A
          ++  SIGN  |~(A/@ *@)                          ::  CERTIFY AS US
          ++  SURE  |~(A/@ *(UNIT @))                   ::  AUTHENTICATE FROM US
          ++  TEAR  |~({A/PASS B/@} *(UNIT @))          ::  ACCEPT FROM A
      --  ::AS                                          ::
    ++  DE  |~({A/@ B/@} *(UNIT @))                     ::  SYMMETRIC DE, SOFT
    ++  DY  |~({A/@ B/@} *@)                            ::  SYMMETRIC DE, HARD
    ++  EN  |~({A/@ B/@} *@)                            ::  SYMMETRIC EN
    ++  EX  ^?                                          ::  EXPORT
      |%  ++  FIG  *@UVH                                ::  FINGERPRINT
          ++  PAC  *@UVG                                ::  DEFAULT PASSCODE
          ++  PUB  *PASS                                ::  PUBLIC KEY
          ++  SEC  *RING                                ::  PRIVATE KEY
      --  ::EX                                          ::
    ++  NU  ^?                                          ::  RECONSTRUCTORS
      |%  ++  PIT  |~({A/@ B/@} ^?(..NU))               ::  FROM [WIDTH SEED]
          ++  NOL  |~(A/RING ^?(..NU))                  ::  FROM RING
          ++  COM  |~(A/PASS ^?(..NU))                  ::  FROM PASS
      --  ::NU                                          ::
    --  ::ACRU                                          ::
  ++  BAIT  {P/SKIN Q/@UD R/DOVE}                       ::  FMT NRECVD SPEC
  ++  BATH                                              ::  CONVO PER CLIENT
    $:  SOP/SHED                                        ::  NOT STALLED
        RAZ/(MAP PATH RACE)                             ::  STATEMENTS INBOUND
        RYL/(MAP PATH RILL)                             ::  STATEMENTS OUTBOUND
    ==                                                  ::
  ++  BOON                                              ::  FORT OUTPUT
    $%  [%BEER P=SHIP]                                  ::  REQUEST PUBLIC KEYS
        [%BOCK ~]                                       ::  BIND TO DOMAINS
        [%BREW ~]                                       ::  REQUEST DOMAINS
        [%CAKE P=SHIP Q=SOAP R=COOP S=DUCT]             ::  E2E MESSAGE RESULT
        [%MEAD P=LANE Q=ROCK]                           ::  ACCEPT PACKET
        [%MILK P=SHIP Q=SOAP R=*]                       ::  E2E PASS MESSAGE
        [%OUZO P=LANE Q=ROCK]                           ::  TRANSMIT PACKET
        [%PITO P=@DA]                                   ::  TIMEOUT
        [%RAKI P=SHIP Q=LIFE R=PASS]                    ::  NEIGHBOR'D
        [%SAKE ~]                                       ::  OUR PRIVATE KEYS
        [%WINE P=SHIP Q=TAPE]                           ::  NOTIFY USER
    ==                                                  ::
  ++  CAKE  {P/SOCK Q/SKIN R/@}                         ::  TOP LEVEL PACKET
  ++  CAPE                                              ::  END-TO-END RESULT
    $?  $GOOD                                           ::  DELIVERED
        $DEAD                                           ::  REJECTED
    ==                                                  ::
  ++  CLOT                                              ::  SYMMETRIC RECORD
    $:  YED/(UNIT {P/HAND Q/CODE})                      ::  OUTBOUND
        HEG/(MAP HAND CODE)                             ::  PROPOSED
        QIM/(MAP HAND CODE)                             ::  INBOUND
    ==                                                  ::
  ++  CODE  @UVI                                        ::  SYMMETRIC KEY
  ++  CORN                                              ::  FLOW BY SERVER
    $:  NYS/(MAP FLAP BAIT)                             ::  PACKETS INCOMING
        OLZ/(MAP FLAP CAPE)                             ::  PACKETS COMPLETED
        WAB/(MAP SHIP BATH)                             ::  RELATIONSHIP
    ==                                                  ::
  +$  DEED  [=LIFE =PASS OATH=(UNIT OATH:PKI:JAEL)]     ::  LIFE/PUB/SIG
  ++  DORE                                              ::  FOREIGN CONTACT
    $:  WOD/ROAD                                        ::  CONNECTION TO
        CAQ/CLOT                                        ::  SYMMETRIC KEY STATE
    ==                                                  ::
  ++  DOVE  {P/@UD Q/(MAP @UD @)}                       ::  COUNT HASH 13-BLOCKS
  ++  FLAP  @UVH                                        ::  NETWORK PACKET ID
  ++  FLOW                                              ::  PACKET CONNECTION
    $:  RTT/@DR                                         ::  DECAYING AVG RTT
        WID/@UD                                         ::  LOGICAL WDOW MSGS
    ==                                                  ::
  ++  FORT                                              ::  FORMAL STATE
    $:  $1                                              ::  VERSION
        GAD/DUCT                                        ::  CLIENT INTERFACE
        TIM/(UNIT @DA)                                  ::  PENDING TIMER
        TUF/(LIST TURF)                                 ::  DOMAINS
        HOP/@DA                                         ::  NETWORK BOOT DATE
        BAD/(SET @P)                                    ::  BAD SHIPS
        TON/TOWN                                        ::  SECURITY
        ZAC/CORN                                        ::  FLOWS BY SERVER
    ==                                                  ::
  ++  HAND  @UVH                                        ::  128-BIT HASH
  ++  LANE                                              ::  PACKET ROUTE
    $%  {$IF P/@DA Q/@UD R/@IF}                         ::  IP4/PUBLIC UDP/ADDR
        {$IS P/@UD Q/(UNIT LANE) R/@IS}                 ::  IPV6 W+ALTERNATES
        {$IX P/@DA Q/@UD R/@IF}                         ::  IPV4 PROVISIONAL
    ==                                                  ::
  ++  MEAL                                              ::  PAYLOAD
    $%  {$BACK P/COOP Q/FLAP R/@DR}                     ::  ACK
        {$BOND P/PATH Q/@UD R/*}                        ::  MESSAGE
        {$CARP P/@ Q/@UD R/@UD S/FLAP T/@}              ::  SKIN+INX+CNT+HASH
        {$FORE P/SHIP Q/(UNIT LANE) R/@}                ::  FORWARDED PACKET
    ==                                                  ::
  ++  NAME  {P/@T Q/(UNIT @T) R/(UNIT @T) S/@T}         ::  FIRST MID+NICK LAST
  ++  PUTT                                              ::  OUTGOING MESSAGE
    $:  SKI/SNOW                                        ::  SEQUENCE ACKED+SENT
        WYV/(LIST ROCK)                                 ::  PACKET LIST XX GEAR
    ==                                                  ::
  ++  RACE                                              ::  INBOUND STREAM
    $:  DID/@UD                                         ::  FILLED SEQUENCE
        DOD/?                                           ::  NOT PROCESSING
        BUM/(MAP @UD ARES)                              ::  NACKS
        MIS/(MAP @UD {P/CAPE Q/LANE R/FLAP S/(UNIT)})   ::  MISORDERED
    ==                                                  ::
  ++  RILL                                              ::  OUTBOUND STREAM
    $:  SED/@UD                                         ::  SENT
        SAN/(MAP @UD DUCT)                              ::  OUTSTANDING
    ==                                                  ::
  ++  ROAD                                              ::  SECURED ONEWAY ROUTE
    $:  EXP/@DA                                         ::  EXPIRATION DATE
        LUN/(UNIT LANE)                                 ::  ROUTE TO FRIEND
        LEW/(UNIT DEED)                                 ::  DEED OF FRIEND
    ==                                                  ::
  ++  ROCK  @UVO                                        ::  PACKET
  ++  SHED                                              ::  PACKET FLOW
    $:  $:  RTT/@DR                                     ::  SMOOTHED RTT
            RTO/@DR                                     ::  RETRANSMIT TIMEOUT
            RTN/(UNIT @DA)                              ::  NEXT TIMEOUT
            RUE/(UNIT @DA)                              ::  LAST HEARD FROM
        ==                                              ::
        $:  NUS/@UD                                     ::  NUMBER SENT
            NIF/@UD                                     ::  NUMBER LIVE
            NEP/@UD                                     ::  NEXT EXPECTED
            CAW/@UD                                     ::  LOGICAL WINDOW
            CAG/@UD                                     ::  CONGEST THRESH
        ==                                              ::
        $:  DIQ/(MAP FLAP @UD)                          ::  PACKETS SENT
            PYZ/(MAP SOUP @UD)                          ::  MESSAGE+UNACKED
            PUQ/(QEU {P/@UD Q/SOUL})                    ::  PACKET QUEUE
        ==                                              ::
    ==                                                  ::
  ++  SKIN  ?($NONE $OPEN $FAST $FULL)                  ::  ENCODING STEM
  ++  SNOW  {P/@UD Q/@UD R/(SET @UD)}                   ::  WINDOW EXCEPTIONS
  ++  SOAP  {P/{P/LIFE Q/LIFE} Q/PATH R/@UD}            ::  STATEMENT ID
  ++  SOUP  {P/PATH Q/@UD}                              ::  NEW STATEMENT ID
  ++  SOUL                                              ::  PACKET IN TRAVEL
    $:  GOM/SOUP                                        ::  MESSAGE IDENTITY
        NUX/@UD                                         ::  XMISSION COUNT
        LIV/?                                           ::  DEEMED LIVE
        LYS/@DA                                         ::  LAST SENT
        PAC/ROCK                                        ::  PACKET DATA
    ==                                                  ::
  ++  TOWN                                              ::  ALL SECURITY STATE
    $:  ANY/@                                           ::  ENTROPY
        VAL/WUND                                        ::  PRIVATE KEYS
        LAW/DEED                                        ::  SERVER DEED
        SEH/(MAP HAND {P/SHIP Q/@DA})                   ::  KEY CACHE
        HOC/(MAP SHIP DORE)                             ::  NEIGHBORHOOD
    ==                                                  ::
  ++  WUND  (LIST {P/LIFE Q/RING R/ACRU})               ::  SECRETS IN ACTION
  --  ::AMES
::                                                      ::::
::::                    ++BEHN                            ::  (1B) TIMEKEEPING
  ::                                                    ::::
++  BEHN  ^?
  |%
  ::                                                    ::
  ::::                  ++ABLE:BEHN                     ::  (1B1) ARVO MOVES
    ::                                                  ::::
  ++  ABLE  ^?
    |%
    ++  NOTE                                            ::  OUT REQUEST $->
      $%  $:  $D                                        ::  TO %DILL
      $%  {$FLOG P/FLOG:DILL}                           ::
      ==  ==  ==                                        ::
    ++  GIFT                                            ::  OUT RESULT <-$
      $%  {$DOZE P/(UNIT @DA)}                          ::  NEXT ALARM
          {$MASS P/MASS}                                ::  MEMORY USAGE
          {$WAKE ~}                                    ::  WAKEUP
      ==                                                ::
    ++  TASK                                            ::  IN REQUEST ->$
      $%  {$BORN ~}                                     ::  NEW UNIX PROCESS
          {$CRUD P/@TAS Q/(LIST TANK)}                  ::  ERROR WITH TRACE
          {$REST P/@DA}                                 ::  CANCEL ALARM
          {$VEGA ~}                                     ::  REPORT UPGRADE
          {$WAIT P/@DA}                                 ::  SET ALARM
          {$WAKE ~}                                    ::  TIMER ACTIVATE
          {$WEGH ~}                                    ::  REPORT MEMORY
      ==                                                ::
    --  ::ABLE
  --  ::BEHN
::                                                      ::::
::::                    ++CLAY                            ::  (1C) VERSIONING
  ::                                                    ::::
++  CLAY  ^?
  |%
  ::                                                    ::
  ::::                  ++ABLE:CLAY                     ::  (1C1) ARVO MOVES
    ::                                                  ::::
  ++  ABLE  ^?
    |%
    ++  GIFT                                            ::  OUT RESULT <-$
      $%  {$CROZ RUS/(MAP DESK {R/REGS W/REGS})}        ::  RULES FOR GROUP
          {$CRUZ CEZ/(MAP @TA CREW)}                    ::  PERMISSION GROUPS
          {$DIRK P/@TAS}                                ::  MARK MOUNT DIRTY
          {$ERGO P/@TAS Q/MODE}                         ::  VERSION UPDATE
          {$HILL P/(LIST @TAS)}                         ::  MOUNT POINTS
          {$MACK P/(UNIT TANG)}                         ::  ACK
          {$MASS P/MASS}                                ::  MEMORY USAGE
          {$MERE P/(EACH (SET PATH) (PAIR TERM TANG))}  ::  MERGE RESULT
          {$NOTE P/@TD Q/TANK}                          ::  DEBUG MESSAGE
          {$OGRE P/@TAS}                                ::  DELETE MOUNT POINT
          {$RULE RED/DICT WIT/DICT}                     ::  NODE R+W PERMISSIONS
          {$SEND P/LANE:AMES Q/@}                       ::  TRANSMIT PACKET
          {$WRIT P/RIOT}                                ::  RESPONSE
          {$WRIS P/{$DA P/@DA} Q/(SET (PAIR CARE PATH))}  ::  MANY CHANGES
      ==                                                ::
    ++  TASK                                            ::  IN REQUEST ->$
      $%  {$BOAT ~}                                     ::  PIER REBOOTED
          {$CRED NOM/@TA CEW/CREW}                      ::  SET PERMISSION GROUP
          {$CREW ~}                                     ::  PERMISSION GROUPS
          {$CROW NOM/@TA}                               ::  GROUP USAGE
          {$CRUD P/@TAS Q/(LIST TANK)}                  ::  ERROR WITH TRACE
          {$DROP DES/DESK}                              ::  CANCEL PENDING MERGE
          {$INFO DES/DESK DIT/NORI}                     ::  INTERNAL EDIT
          {$INIT OUR/@P}                                ::  REPORT INSTALL
          {$INTO DES/DESK ALL/? FIS/MODE}               ::  EXTERNAL EDIT
          $:  $MERG                                     ::  MERGE DESKS
              DES/DESK                                  ::  TARGET
              HER/@P  DEM/DESK  CAS/CASE                ::  SOURCE
              HOW/GERM                                  ::  METHOD
          ==                                            ::
          {$MONT DES/DESK BEM/BEAM}                     ::  MOUNT TO UNIX
          {$DIRK DES/DESK}                              ::  MARK MOUNT DIRTY
          {$OGRE POT/$@(DESK BEAM)}                     ::  DELETE MOUNT POINT
          {$PERM DES/DESK PAX/PATH RIT/RITE}            ::  CHANGE PERMISSIONS
          {$SUNK P=SHIP Q=LIFE}                         ::  REPORT DEATH
          {$VEGA ~}                                     ::  REPORT UPGRADE
          {$WARP WER/SHIP RIF/RIFF}                     ::  INTERNAL FILE REQ
          {$WERP WHO/SHIP WER/SHIP RIF/RIFF}            ::  EXTERNAL FILE REQ
          {$WEGH ~}                                     ::  REPORT MEMORY
          {$WEST WER/SHIP PAX/PATH RES/*}               ::  NETWORK REQUEST
      ==                                                ::
    --  ::ABLE
  ::
  ::::                                                  ::  (1C2)
    ::
  ++  AEON  @UD                                         ::  VERSION NUMBER
  ++  ANKH                                              ::  FS NODE (NEW)
    $~  [~ ~]
    $:  FIL/(UNIT {P/LOBE Q/CAGE})                      ::  FILE
        DIR/(MAP @TA ANKH)                              ::  FOLDERS
    ==                                                  ::
  ++  BEAM  {{P/SHIP Q/DESK R/CASE} S/PATH}             ::  GLOBAL NAME
  ++  BEAK  {P/SHIP Q/DESK R/CASE}                      ::  PATH PREFIX
  ++  BLOB                                              ::  FS BLOB
    $%  {$DELTA P/LOBE Q/{P/MARK Q/LOBE} R/PAGE}        ::  DELTA ON Q
        {$DIRECT P/LOBE Q/PAGE}                         ::  IMMEDIATE
    ==                                                  ::
  ++  CARE  ?($D $P $T $U $V $W $X $Y $Z)               ::  CLAY SUBMODE
  ++  CASE                                              ::  SHIP DESK CASE SPUR
    $%  {$DA P/@DA}                                     ::  DATE
        {$TAS P/@TAS}                                   ::  LABEL
        {$UD P/@UD}                                     ::  NUMBER
    ==                                                  ::
  ++  CASS  {UD/@UD DA/@DA}                             ::  CASES FOR REVISION
  ++  COOP  (UNIT ARES)                                 ::  E2E ACK
  ++  CREW  (SET SHIP)                                  ::  PERMISSIONS GROUP
  ++  DICT  {SRC/PATH RUL/REAL}                         ::  EFFECTIVE PERMISSION
  ++  DOME                                              ::  PROJECT STATE
    $:  ANK/ANKH                                        ::  STATE
        LET/@UD                                         ::  TOP ID
        HIT/(MAP @UD TAKO)                              ::  CHANGES BY ID
        LAB/(MAP @TAS @UD)                              ::  LABELS
    ==                                                  ::
  ++  GERM                                              ::  MERGE STYLE
    $?  $INIT                                           ::  NEW DESK
        $THIS                                           ::  OURS WITH PARENTS
        $THAT                                           ::  HERS WITH PARENTS
        $FINE                                           ::  FAST FORWARD
        $MEET                                           ::  ORTHOGONAL FILES
        $MATE                                           ::  ORTHOGONAL CHANGES
        $MELD                                           ::  FORCE MERGE
    ==                                                  ::
  ++  KHAN                                              ::
    $~  [~ ~]
    $:  FIL/(UNIT (UNIT CAGE))                          ::  SEE ++KHAN-TO-SOBA
        DIR/(UNIT (MAP @TA (UNIT KHAN)))                ::
    ==                                                  ::
  ++  LOBE  @UVI                                        ::  BLOB REF
  ++  MAKI  {P/@TA Q/@TA R/@TA S/PATH}                  ::
  ++  MISO                                              ::  ANKH DELTA
    $%  {$DEL ~}                                       ::  DELETE
        {$INS P/CAGE}                                   ::  INSERT
        {$DIF P/CAGE}                                   ::  MUTATE FROM DIFF
        {$MUT P/CAGE}                                   ::  MUTATE FROM RAW
    ==                                                  ::
  ++  MISU                                              ::  COMPUTED DELTA
    $%  {$DEL ~}                                       ::  DELETE
        {$INS P/CAGE}                                   ::  INSERT
        {$DIF P/LOBE Q/CAGE}                            ::  MUTATE FROM DIFF
    ==                                                  ::
  ++  MIZU  {P/@U Q/(MAP @UD TAKO) R/RANG}              ::  NEW STATE
  ++  MOAR  {P/@UD Q/@UD}                               ::  NORMAL CHANGE RANGE
  ++  MOAT  {P/CASE Q/CASE R/PATH}                      ::  CHANGE RANGE
  ++  MODE  (LIST {PATH (UNIT MIME)})                   ::  EXTERNAL FILES
  ++  MOOD  {P/CARE Q/CASE R/PATH}                      ::  REQUEST IN DESK
  ++  MOOL  {P/CASE Q/(SET (PAIR CARE PATH))}           ::  REQUESTS IN DESK
  ++  NORI                                              ::  REPOSITORY ACTION
    $%  {%& P/SOBA}                                     ::  DELTA
        {%| P/@TAS}                                     ::  LABEL
    ==                                                  ::
  ++  NURI                                              ::  REPOSITORY ACTION
    $%  {%& P/SUBA}                                     ::  DELTA
        {%| P/@TAS}                                     ::  LABEL
    ==                                                  ::
  ++  PAGE  (CASK *)                                    ::  UNTYPED CAGE
  ++  PLOP  BLOB                                        ::  UNVALIDATED BLOB
  ++  RANG                                              ::  REPOSITORY
    $:  HUT/(MAP TAKO YAKI)                             ::  CHANGES
        LAT/(MAP LOBE BLOB)                             ::  DATA
    ==                                                  ::
  ++  RANT                                              ::  RESPONSE TO REQUEST
    $:  P/{P/CARE Q/CASE R/DESK}                        ::  CLADE RELEASE BOOK
        Q/PATH                                          ::  SPUR
        R/CAGE                                          ::  DATA
    ==                                                  ::
  ++  RAVE                                              ::  GENERAL REQUEST
    $%  {$SING P/MOOD}                                  ::  SINGLE REQUEST
        {$NEXT P/MOOD}                                  ::  AWAIT NEXT VERSION
        {$MULT P/MOOL}                                  ::  NEXT VERSION OF ANY
        {$MANY P/? Q/MOAT}                              ::  TRACK RANGE
    ==                                                  ::
  ++  REAL                                              ::  RESOLVED PERMISSIONS
    $:  MOD/?($BLACK $WHITE)                            ::
        WHO/(PAIR (SET SHIP) (MAP @TA CREW))            ::
    ==                                                  ::
  ++  REGS  (MAP PATH RULE)                             ::  RULES FOR PATHS
  ++  RIFF  {P/DESK Q/(UNIT RAVE)}                      ::  REQUEST+DESIST
  ++  RITE                                              ::  NEW PERMISSIONS
    $%  {$R RED/(UNIT RULE)}                            ::  FOR READ
        {$W WIT/(UNIT RULE)}                            ::  FOR WRITE
        {$RW RED/(UNIT RULE) WIT/(UNIT RULE)}           ::  FOR READ AND WRITE
    ==                                                  ::
  ++  RIOT  (UNIT RANT)                                 ::  RESPONSE+COMPLETE
  ++  RULE  {MOD/?($BLACK $WHITE) WHO/(SET WHOM)}       ::  NODE PERMISSION
  ++  RUMP  {P/CARE Q/CASE R/@TAS S/PATH}               ::  RELATIVE PATH
  ++  SABA  {P/SHIP Q/@TAS R/MOAR S/DOME}               ::  PATCH+MERGE
  ++  SOBA  (LIST {P/PATH Q/MISO})                      ::  DELTA
  ++  SUBA  (LIST {P/PATH Q/MISU})                      ::  DELTA
  ++  TAKO  @                                           ::  YAKI REF
  ++  TORO  {P/@TA Q/NORI}                              ::  GENERAL CHANGE
  ++  UNCE                                              ::  CHANGE PART
    |*  A/MOLD                                          ::
    $%  {%& P/@UD}                                      ::  SKIP[COPY]
        {%| P/(LIST A) Q/(LIST A)}                      ::  P -> Q[CHUNK]
    ==                                                  ::
  ++  URGE  |*(A/MOLD (LIST (UNCE A)))                  ::  LIST CHANGE
  ++  WHOM  (EACH SHIP @TA)                             ::  SHIP OR NAMED CREW
  ++  YAKI                                              ::  COMMIT
    $:  P/(LIST TAKO)                                   ::  PARENTS
        Q/(MAP PATH LOBE)                               ::  NAMESPACE
        R/TAKO                                          ::  SELF-REFERENCE
        T/@DA                                           ::  DATE
    ==                                                  ::
  --  ::CLAY
::                                                      ::::
::::                    ++DILL                            ::  (1D) CONSOLE
  ::                                                    ::::
++  DILL  ^?
  |%
  ::                                                    ::
  ::::                  ++ABLE:DILL                     ::  (1D1) ARVO MOVES
    ::                                                  ::::
  ++  ABLE  ^?
    |%
    ++  GIFT                                            ::  OUT RESULT <-$
      $%  {$BBYE ~}                                     ::  RESET PROMPT
          {$BLIT P/(LIST BLIT)}                         ::  TERMINAL OUTPUT
          {$BURL P/@T}                                  ::  ACTIVATE URL
          {$INIT P/@P}                                  ::  SET OWNER
          {$LOGO ~}                                     ::  LOGOUT
          {$LYRA P/@T Q/@T}                             ::  UPGRADE KERNEL
          {$MASS P/MASS}                                ::  MEMORY USAGE
          {$SEND P/LANE:AMES Q/@}                       ::  TRANSMIT PACKET
          {$VEER P/@TA Q/PATH R/@T}                     ::  INSTALL VANE
          {$VERB ~}                                     ::  VERBOSE MODE
      ==                                                ::
    ++  TASK                                            ::  IN REQUEST ->$
      $%  {$BELT P/BELT}                                ::  TERMINAL INPUT
          {$BLEW P/BLEW}                                ::  TERMINAL CONFIG
          {$BOOT P/*}                                   ::  WEIRD %DILL BOOT
          {$CRUD P/@TAS Q/(LIST TANK)}                  ::  ERROR WITH TRACE
          {$FLOG P/FLOG}                                ::  WRAPPED ERROR
          {$FLOW P/@TAS Q/(LIST GILL:GALL)}             ::  TERMINAL CONFIG
          {$HAIL ~}                                     ::  TERMINAL REFRESH
          {$HEFT ~}                                     ::  MEMORY REPORT
          {$HOOK ~}                                     ::  THIS TERM HUNG UP
          {$HARM ~}                                     ::  ALL TERMS HUNG UP
          {$INIT P/SHIP}                                ::  AFTER GALL READY
          {$LYRA P/@T Q/@T}                             ::  UPGRADE KERNEL
          {$NOOP ~}                                     ::  NO OPERATION
          {$SUNK P=SHIP Q=LIFE}                         ::  REPORT DEATH
          {$TALK P/TANK}                                ::
          {$TEXT P/TAPE}                                ::
          {$VEER P/@TA Q/PATH R/@T}                     ::  INSTALL VANE
          {$VEGA ~}                                     ::  REPORT UPGRADE
          {$VERB ~}                                     ::  VERBOSE MODE
      ==                                                ::
    --  ::ABLE
  ::
  ::::                                                  ::  (1D2)
    ::
  ++  BLEW  {P/@UD Q/@UD}                               ::  COLUMNS ROWS
  ++  BELT                                              ::  OLD BELT
    $%  {$ARO P/?($D $L $R $U)}                         ::  ARROW KEY
        {$BAC ~}                                        ::  TRUE BACKSPACE
        {$CTL P/@C}                                     ::  CONTROL-KEY
        {$DEL ~}                                        ::  TRUE DELETE
        {$MET P/@C}                                     ::  META-KEY
        {$RET ~}                                        ::  RETURN
        {$TXT P/(LIST @C)}                              ::  UTF32 TEXT
    ==                                                  ::
  ++  BLIT                                              ::  OLD BLIT
    $%  {$BEL ~}                                        ::  MAKE A NOISE
        {$CLR ~}                                        ::  CLEAR THE SCREEN
        {$HOP P/@UD}                                    ::  SET CURSOR POSITION
        {$LIN P/(LIST @C)}                              ::  SET CURRENT LINE
        {$MOR ~}                                        ::  NEWLINE
        {$SAG P/PATH Q/*}                               ::  SAVE TO JAMFILE
        {$SAV P/PATH Q/@}                               ::  SAVE TO FILE
        {$URL P/@T}                                     ::  ACTIVATE URL
    ==                                                  ::
  ++  DECO  ?(~ $BL $BR $UN)                            ::  TEXT DECORATION
  ++  DILL-BELT                                         ::  NEW BELT
    $%  {$ARO P/?($D $L $R $U)}                         ::  ARROW KEY
        {$BAC ~}                                        ::  TRUE BACKSPACE
        {$CRU P/@TAS Q/(LIST TANK)}                     ::  ECHO ERROR
        {$CTL P/@}                                      ::  CONTROL-KEY
        {$DEL ~}                                        ::  TRUE DELETE
        {$HEY ~}                                        ::  REFRESH
        {$MET P/@}                                      ::  META-KEY
        {$RET ~}                                        ::  RETURN
        {$REZ P/@UD Q/@UD}                              ::  RESIZE, COLS, ROWS
        {$TXT P/(LIST @C)}                              ::  UTF32 TEXT
        {$YOW P/GILL:GALL}                              ::  CONNECT TO APP
    ==                                                  ::
  ++  DILL-BLIT                                         ::  NEW BLIT
    $%  {$BEL ~}                                        ::  MAKE A NOISE
        {$CLR ~}                                        ::  CLEAR THE SCREEN
        {$HOP P/@UD}                                    ::  SET CURSOR POSITION
        {$KLR P/STUB}                                   ::  STYLED TEXT
        {$MOR P/(LIST DILL-BLIT)}                       ::  MULTIPLE BLITS
        {$POM P/STUB}                                   ::  STYLED PROMPT
        {$PRO P/(LIST @C)}                              ::  SHOW AS CURSOR+LINE
        {$QIT ~}                                        ::  CLOSE CONSOLE
        {$OUT P/(LIST @C)}                              ::  SEND OUTPUT LINE
        {$SAG P/PATH Q/*}                               ::  SAVE TO JAMFILE
        {$SAV P/PATH Q/@}                               ::  SAVE TO FILE
        {$URL P/@T}                                     ::  ACTIVATE URL
    ==                                                  ::
  ++  FLOG                                              ::  SENT TO %DILL
    $%  {$CRUD P/@TAS Q/(LIST TANK)}                    ::
        {$HEFT ~}                                       ::
        {$LYRA P/@T Q/@T}                               ::  UPGRADE KERNEL
        {$TEXT P/TAPE}                                  ::
        {$VEER P/@TA Q/PATH R/@T}                       ::  INSTALL VANE
        {$VERB ~}                                       ::  VERBOSE MODE
    ==                                                  ::
  --  ::DILL
::                                                      ::::
::::                    ++EYRE                            ::  (1E) OLDWEB
  ::                                                    ::::
++  EYRE  ^?
  |%
  ::                                                    ::
  ::::                  ++ABLE:EYRE                     ::  (1E1) ARVO MOVES
    ::                                                  ::::
  ++  ABLE  ^?
    |%
    +=  GIFT                                            ::  OUT RESULT <-$
      $%  [%FORM P=HTTP-CONFIG]                         ::  CONFIGURATION
          [%MASS P=MASS]                                ::  MEMORY USAGE
          [%MACK P=(UNIT TANG)]                         ::  MESSAGE ACK
          [%SIGH P=CAGE]                                ::  MARKED HTTP RESPONSE
          [%THAT P=@P Q=PROX]                           ::  GET PROXIED REQUEST
          [%THOU P=HTTR]                                ::  RAW HTTP RESPONSE
          [%THUS P=@UD Q=(UNIT HISS)]                   ::  HTTP REQUEST+CANCEL
          [%VEER P=@TA Q=PATH R=@T]                     ::  DROP-THROUGH
          [%VEGA P=@T Q=@T]                             ::  DROP-THROUGH
      ==                                                ::
    +=  TASK                                            ::  IN REQUEST ->$
      $%  [%BORN P=(LIST HOST)]                         ::  NEW UNIX PROCESS
          [%CRUD P=@TAS Q=(LIST TANK)]                  ::  XX RETHINK
          [%HISS P=(UNIT USER) Q=MARK R=CAGE]           ::  OUTBOUND USER REQ
          [%INIT P=@P]                                  ::  REPORT INSTALL
          [%LIVE P=@UD Q=(UNIT @UD)]                    ::  HTTP/S PORTS
          [%RULE P=HTTP-RULE]                           ::  UPDATE CONFIG
          [%SERV P=$@(DESK BEAM)]                       ::  SET SERVING ROOT
          [%SUNK P=SHIP Q=LIFE]                         ::  REPORT DEATH
          [%THEM P=(UNIT HISS)]                         ::  OUTBOUND REQUEST
          [%THEY P=@UD Q=HTTR]                          ::  INBOUND RESPONSE
          [%CHIS P=? Q=CLIP R=HTTQ]                     ::  IPC INBOUND REQUEST
          [%THIS P=? Q=CLIP R=HTTQ]                     ::  INBOUND REQUEST
          [%THUD ~]                                     ::  INBOUND CANCEL
          [%VEGA ~]                                     ::  REPORT UPGRADE
          [%WEGH ~]                                     ::  REPORT MEMORY
          [%WELL P=PATH Q=(UNIT MIME)]                  ::  PUT/DEL .WELL-KNOWN
          [%WEST P=SHIP Q=[PATH *]]                     ::  NETWORK REQUEST
          [%WISE P=SHIP Q=PROX]                         ::  PROXY NOTIFICATION
      ==                                                ::
    --  ::ABLE
  ::
  ::::                                                  ::  (1E2)
    ::
  ++  BALE                                              ::  DRIVER STATE
    |*  A/_*                                            ::  %JAEL KEYS TYPE
    $:  {OUR/SHIP NOW/@DA ENY/@UVJ BYK/BEAK}            ::  BASE INFO
        {USR/USER DOM/(LIST @T)}                        ::  REQ USER, DOMAIN
        KEY/A                                           ::  SECRETS FROM %JAEL
    ==                                                  ::
  ::
  ++  CLIP  (EACH @IF @IS)                              ::  CLIENT IP
  ++  CRED                                              ::  CREDENTIAL
    $:  HUT/HART                                        ::  CLIENT HOST
        AUT/(JUG @TAS @T)                               ::  CLIENT IDENTITIES
        ORX/ORYX                                        ::  CSRF SECRET
        ACL/(UNIT @T)                                   ::  ACCEPT-LANGUAGE
        CIP/(EACH @IF @IS)                              ::  CLIENT IP
        CUM/(MAP @TAS *)                                ::  CUSTOM DIRT
    ==                                                  ::
  ++  EPIC                                              ::  FCGI PARAMETERS
    $:  QIX/(MAP @T @T)                                 ::  QUERY
        CED/CRED                                        ::  CLIENT CREDENTIALS
        BEM/BEAM                                        ::  ORIGINAL PATH
    ==                                                  ::
  ++  GRAM                                              ::  INTER-SHIP MESSAGE
    $%  [%LON P=HOLE]                                   ::  LOGIN REQUEST
        [%AUT P=HOLE]                                   ::  LOGIN REPLY
        [%HAT P=HOLE Q=HART]                            ::  LOGIN REDIRECT
        [%GET P=@UVH Q=[? CLIP HTTQ]]                   ::  REMOTE REQUEST
        [%GOT P=@UVH Q=HTTR]                            ::  REMOTE RESPONSE
        [%GIB P=@UVH]                                   ::  REMOTE CANCEL
      ::
        [%GET-INNER P=@UVH Q=MARK R=COIN S=BEAM]        ::TODO DETAILS?
        [%GOT-INNER P=@UVH Q=(EACH (CASK) TANG)]        ::TODO DETAILS?
      ::
        [%NOT P=PROX]                                   ::  PROXY NOTIFICATION
    ==                                                  ::
  ++  HART  {P/? Q/(UNIT @UD) R/HOST}                   ::  HTTP SEC+PORT+HOST
  ++  HATE  {P/PURL Q/@P R/MOTH}                        ::  SEMI-COOKED REQUEST
  ++  HEIR  {P/@UD Q/MESS R/(UNIT LOVE)}                ::  STATUS+HEADERS+DATA
  ++  HISS  {P/PURL Q/MOTH}                             ::  OUTBOUND REQUEST
  ++  HOLE  @T                                          ::  SESSION IDENTITY
  ++  HORT  {P/(UNIT @UD) Q/HOST}                       ::  HTTP PORT+HOST
  ++  HOST  (EACH TURF @IF)                             ::  HTTP HOST
  ++  HOKE  %+  EACH   {$LOCALHOST ~}                  ::  LOCAL HOST
            ?($.0.0.0.0 $.127.0.0.1)                    ::
  :: +HTTP-CONFIG: FULL HTTP-SERVER CONFIGURATION
  ::
  +=  HTTP-CONFIG
    $:  :: SECURE: PEM-ENCODED RSA PRIVATE KEY AND CERT OR CERT CHAIN
        ::
        SECURE=(UNIT [KEY=WAIN CERT=WAIN])
        :: PROXY: REVERSE TCP PROXY HTTP(S)
        ::
        PROXY=?
        :: LOG: KEEP HTTP(S) ACCESS LOGS
        ::
        LOG=?
        :: REDIRECT: SEND 301 REDIRECTS TO UPGRADE HTTP TO HTTPS
        ::
        ::   NOTE: REQUIRES CERTIFICATE.
        ::
        REDIRECT=?
    ==
  :: +HTTP-RULE: UPDATE CONFIGURATION
  ::
  +=  HTTP-RULE
    $%  :: %CERT: SET OR CLEAR CERTIFICATE AND KEYPAIR
        ::
        [%CERT P=(UNIT [KEY=WAIN CERT=WAIN])]
        :: %TURF: ADD OR REMOVE ESTABLISHED DNS BINDING
        ::
        [%TURF P=?(%PUT %DEL) Q=TURF]
    ==
  ++  HTTQ                                              ::  RAW HTTP REQUEST
    $:  P/METH                                          ::  METHOD
        Q/@T                                            ::  UNPARSED URL
        R/(LIST {P/@T Q/@T})                            ::  HEADERS
        S/(UNIT OCTS)                                   ::  BODY
    ==                                                  ::
  ++  HTTR  {P/@UD Q/MESS R/(UNIT OCTS)}                ::  RAW HTTP RESPONSE
  ++  HTTX                                              ::  ENCAPSULATED HTTP
    $:  P/?                                             ::  HTTPS?
        Q/CLIP                                          ::  SOURCE IP
        R/HTTQ                                          ::
    ==                                                  ::
  ++  USER  KNOT                                        ::  USERNAME
  ++  LOVE                                              ::  HTTP RESPONSE
    $%  {$HAM P/MANX}                                   ::  HTML NODE
        {$MID P/MITE Q/OCTS}                            ::  MIME-TYPED DATA
        {$RAW P/HTTR}                                   ::  RAW HTTP RESPONSE
        {$WAN P/WAIN}                                   ::  TEXT LINES
        {$ZAP P/@UD Q/(LIST TANK)}                      ::  STATUS+ERROR
    ==                                                  ::
  ++  MATH  (MAP @T (LIST @T))                          ::  SEMIPARSED HEADERS
  ++  MESS  (LIST {P/@T Q/@T})                          ::  RAW HTTP HEADERS
  ++  METH                                              ::  HTTP METHODS
    $?  $CONN                                           ::  CONNECT
        $DELT                                           ::  DELETE
        $GET                                            ::  GET
        $HEAD                                           ::  HEAD
        $OPTS                                           ::  OPTIONS
        $POST                                           ::  POST
        $PUT                                            ::  PUT
        $TRAC                                           ::  TRACE
    ==                                                  ::
  ++  MITE  (LIST @TA)                                  ::  MIME TYPE
  ++  MOTH  {P/METH Q/MATH R/(UNIT OCTS)}               ::  HTTP OPERATION
  ++  OCTS  {P/@UD Q/@T}                                ::  OCTET-STREAM
  ++  ORYX  @T                                          ::  CSRF SECRET
  ++  PORK  {P/(UNIT @TA) Q/(LIST @T)}                  ::  FULLY PARSED URL
  :: +PROX: PROXY NOTIFICATION
  ::
  ::   USED ON BOTH THE PROXY (WARD) AND UPSTREAM SIDES FOR
  ::   SENDING/RECEIVING PROXIED-REQUEST NOTIFICATIONS.
  ::
  +=  PROX
    $:  :: POR: TCP PORT
        ::
        POR=@UD
        :: SEK: SECURE?
        ::
        SEK=?
        :: NON: AUTHENTICATION NONCE
        ::
        NON=@UVJ
    ==
  ++  PURF  (PAIR PURL (UNIT @T))                       ::  URL WITH FRAGMENT
  ++  PURL  {P/HART Q/PORK R/QUAY}                      ::  PARSED URL
  ++  QUAY  (LIST {P/@T Q/@T})                          ::  PARSED URL QUERY
  ++  QUER  |-($@(~ {P/@T Q/@T T/$}))                  ::  QUERY TREE
  ++  QURI                                              ::  REQUEST-URI
    $%  {%& P/PURL}                                     ::  ABSOLUTE
        {%| P/PORK Q/QUAY}                              ::  RELATIVE
    ==                                                  ::
  ::  +RESERVED: CHECK IF AN IPV4 ADDRESS IS IN A RESERVED RANGE
  ::
  ++  RESERVED
    |=  A=@IF
    ^-  ?
    =/  B  (FLOP (RIP 3 A))
    ::  0.0.0.0/8 (SOFTWARE)
    ::
    ?.  ?=([@ @ @ @ ~] B)  &
    ?|  ::  10.0.0.0/8 (PRIVATE)
        ::
        =(10 I.B)
        ::  100.64.0.0/10 (CARRIER-GRADE NAT)
        ::
        &(=(100 I.B) (GTE I.T.B 64) (LTE I.T.B 127))
        ::  127.0.0.0/8 (LOCALHOST)
        ::
        =(127 I.B)
        ::  169.254.0.0/16 (LINK-LOCAL)
        ::
        &(=(169 I.B) =(254 I.T.B))
        ::  172.16.0.0/12 (PRIVATE)
        ::
        &(=(172 I.B) (GTE I.T.B 16) (LTE I.T.B 31))
        ::  192.0.0.0/24 (PROTOCOL ASSIGNMENT)
        ::
        &(=(192 I.B) =(0 I.T.B) =(0 I.T.T.B))
        ::  192.0.2.0/24 (DOCUMENTATION)
        ::
        &(=(192 I.B) =(0 I.T.B) =(2 I.T.T.B))
        ::  192.18.0.0/15 (RESERVED, BENCHMARK)
        ::
        &(=(192 I.B) |(=(18 I.T.B) =(19 I.T.B)))
        ::  192.51.100.0/24 (DOCUMENTATION)
        ::
        &(=(192 I.B) =(51 I.T.B) =(100 I.T.T.B))
        ::  192.88.99.0/24 (RESERVED, EX-ANYCAST)
        ::
        &(=(192 I.B) =(88 I.T.B) =(99 I.T.T.B))
        ::  192.168.0.0/16 (PRIVATE)
        ::
        &(=(192 I.B) =(168 I.T.B))
        ::  203.0.113/24 (DOCUMENTATION)
        ::
        &(=(203 I.B) =(0 I.T.B) =(113 I.T.T.B))
        ::  224.0.0.0/8 (MULTICAST)
        ::  240.0.0.0/4 (RESERVED, FUTURE)
        ::  255.255.255.255/32 (BROADCAST)
        ::
        (GTE I.B 224)
    ==
  ++  ROUT  {P/(LIST HOST) Q/PATH R/ORYX S/PATH}        ::  HTTP ROUTE (NEW)
  ++  SEC-MOVE                                          ::  DRIVER EFFECT
    $%  {$SEND P/HISS}                                  ::  HTTP OUT
        {$SHOW P/PURL}                                  ::  DIRECT USER TO URL
        {$GIVE P/HTTR}                                  ::  RESPOND IMMEDIATELY
        {$REDO ~}                                      ::  RESTART REQUEST QEU
    ==                                                  ::
  --  ::EYRE
::                                                      ::::
::::                    ++FORD                            ::  (1F) BUILD
  ::                                                    ::::
::  |FORD: BUILD SYSTEM VANE INTERFACE
::
++  FORD  ^?
  |%
  ::  |ABLE:FORD: FORD'S PUBLIC +MOVE INTERFACE
  ::
  ++  ABLE  ^?
    |%
    ::  +TASK:ABLE:FORD: REQUESTS TO FORD
    ::
    +=  TASK
      $%  ::  %BUILD: PERFORM A BUILD, EITHER LIVE OR ONCE
          ::
          $:  %BUILD
              ::  LIVE: WHETHER WE RUN THIS BUILD LIVE
              ::
              ::    A LIVE BUILD WILL SUBSCRIBE TO FURTHER UPDATES AND KEEP THE
              ::    BUILD AROUND.
              ::
              LIVE=?
              ::  PLAN: THE SCHEMATIC TO BUILD
              ::
              =SCHEMATIC
          ==
          ::  %KEEP: RESET CACHE SIZES
          ::
          [%KEEP COMPILER-CACHE=@UD BUILD-CACHE=@UD]
          ::  %KILL: STOP A BUILD; SEND ON SAME DUCT AS ORIGINAL %BUILD REQUEST
          ::
          [%KILL ~]
          ::  %SUNK: RECEIVE A REPORT THAT A FOREIGN SHIP HAS LOST CONTINUITY
          ::
          [%SUNK =SHIP =LIFE]
          ::  %VEGA: REPORT KERNEL UPGRADE
          ::
          [%VEGA ~]
          ::  %WEGH: PRODUCE MEMORY USAGE INFORMATION
          ::
          [%WEGH ~]
          ::  %WIPE: WIPES STORED BUILDS
          ::
          [%WIPE PERCENT-TO-REMOVE=@UD]
      ==
    ::  +GIFT:ABLE:FORD: RESPONSES FROM FORD
    ::
    +=  GIFT
      $%  ::  %MASS: MEMORY USAGE; RESPONSE TO %WEGH +TASK
          ::
          [%MASS P=MASS]
          ::  %MADE: BUILD RESULT; RESPONSE TO %BUILD +TASK
          ::
          $:  %MADE
              ::  DATE: FORMAL DATE OF THE BUILD
              ::
              DATE=@DA
              ::  RESULT: RESULT OF THE BUILD; EITHER COMPLETE BUILD, OR ERROR
              ::
              RESULT=MADE-RESULT
      ==  ==
    --
  ::  +MADE-RESULT: THE MAIN PAYLOAD FOR A %MADE +GIFT
  ::
  +=  MADE-RESULT
    $%  ::  %COMPLETE: CONTAINS THE RESULT OF THE COMPLETED BUILD
        ::
        [%COMPLETE =BUILD-RESULT]
        ::  %INCOMPLETE: COULDN'T FINISH BUILD; CONTAINS ERROR MESSAGE
        ::
        [%INCOMPLETE =TANG]
    ==
  ::  +DISC: A DESK ON A SHIP; CAN BE USED AS A BEAK THAT VARIES WITH TIME
  ::
  +=  DISC  [=SHIP =DESK]
  ::  +RAIL: A TIME-VARYING FULL PATH
  ::
  ::    THIS CAN BE THOUGHT OF AS A +BEAM WITHOUT A +CASE, WHICH IS WHAT
  ::    WOULD SPECIFY THE TIME. :SPUR IS FLOPPED JUST LIKE THE +SPUR IN A +BEAM.
  ::
  +=  RAIL  [=DISC =SPUR]
  ::  +RESOURCE: TIME-VARYING DEPENDENCY ON A VALUE FROM THE URBIT NAMESPACE
  ::
  +=  RESOURCE
    $:  ::  VANE WHICH WE ARE QUERYING
        ::
        VANE=%C
        ::  TYPE OF REQUEST
        ::
        ::    TODO: CARE:CLAY SHOULD BE CLEANED UP IN ZUSE AS IT IS A GENERAL
        ::    TYPE, NOT A CLAY SPECIFIC ONE.
        ::
        CARE=CARE:CLAY
        ::  PATH ON WHICH TO DEPEND, MISSING TIME, WHICH WILL BE FILLED IN
        ::
        =RAIL
    ==
  ::  +BUILD-RESULT: THE REFERENTIALLY TRANSPARENT RESULT OF A +BUILD
  ::
  ::    A +BUILD PRODUCES EITHER AN ERROR OR A RESULT. A RESULT IS A TAGGED
  ::    UNION OF THE VARIOUS KINDS OF DATATYPES A BUILD CAN PRODUCE. THE TAG
  ::    REPRESENTS THE SUB-TYPE OF +SCHEMATIC THAT PRODUCED THE RESULT.
  ::
  +=  BUILD-RESULT
    $%  ::  %ERROR: THE BUILD PRODUCED AN ERROR WHOSE DESCRIPTION IS :MESSAGE
        ::
        [%ERROR MESSAGE=TANG]
        ::  %SUCCESS: RESULT OF SUCCESSFUL +BUILD, TAGGED BY +SCHEMATIC SUB-TYPE
        ::
        $:  %SUCCESS
            $^  [HEAD=BUILD-RESULT TAIL=BUILD-RESULT]
            $%  [%$ =CAGE]
                [%ALTS =BUILD-RESULT]
                [%BAKE =CAGE]
                [%BUNT =CAGE]
                [%CALL =VASE]
                [%CAST =CAGE]
                [%CORE =VASE]
                [%DIFF =CAGE]
                [%HOOD =SCAFFOLD]
                [%JOIN =CAGE]
                [%LIST RESULTS=(LIST BUILD-RESULT)]
                [%MASH =CAGE]
                [%MUTE =CAGE]
                [%PACT =CAGE]
                [%PATH =RAIL]
                [%PLAN =VASE]
                [%REEF =VASE]
                [%RIDE =VASE]
                [%SCRY =CAGE]
                [%SLIM [=TYPE =NOCK]]
                [%SLIT =TYPE]
                [%VALE =CAGE]
                [%VOLT =CAGE]
                [%WALK RESULTS=(LIST MARK-ACTION)]
    ==  ==  ==
  ::  +MARK-ACTION: REPRESENTS A SINGLE MARK CONVERSION STEP
  ::
  ::    IN MARK CONVERSION, WE WANT TO CONVERT FROM :SOURCE TO :TARGET. WE ALSO
  ::    NEED TO KEEP TRACK OF WHAT TYPE OF CONVERSION THIS IS. IF %GRAB, WE
  ::    WANT TO USE THE DEFINITIONS IN THE :TARGET MARK. IF %GROW, WE WANT TO
  ::    USE THE :SOURCE MARK.
  ::
  +=  MARK-ACTION  [TYPE=?(%GROW %GRAB) SOURCE=TERM TARGET=TERM]
  ::
  ::  +SCHEMATIC: PLAN FOR BUILDING
  ::
  ++  SCHEMATIC
    ::    IF THE HEAD OF THE +SCHEMATIC IS A PAIR, IT'S AN AUTO-CONS
    ::    SCHEMATIC. ITS RESULT WILL BE THE PAIR OF RESULTS OF ITS
    ::    SUB-SCHEMATICS.
    ::
    $^  [HEAD=SCHEMATIC TAIL=SCHEMATIC]
    ::
    $%  ::  %$: LITERAL VALUE. PRODUCES ITS INPUT UNCHANGED.
        ::
        $:  %$
            ::  LITERAL: THE VALUE TO BE PRODUCED BY THE BUILD
            ::
            LITERAL=CAGE
        ==
        ::  %PIN: PINS A SUB-SCHEMATIC TO A DATE
        ::
        ::    THERE IS A DIFFERENCE BETWEEN LIVE BUILDS AND ONCE BUILDS. IN
        ::    LIVE BUILDS, WE PRODUCE RESULTS OVER AND OVER AGAIN AND AREN'T
        ::    PINNED TO A SPECIFC TIME. IN ONCE BUILDS, WE WANT TO SPECIFY A
        ::    SPECIFIC DATE, WHICH WE APPLY RECURSIVELY TO ANY SUB-SCHEMATICS
        ::    CONTAINED WITHIN :SCHEMATIC.
        ::
        ::    IF A BUILD HAS A %PIN AT THE TOP LEVEL, WE CONSIDER IT TO BE A
        ::    ONCE BUILD. OTHERWISE, WE CONSIDER IT TO BE A LIVE BUILD. WE DO
        ::    THIS SO SCHEMATICS WHICH DEPEND ON THE RESULT OF A ONCE BUILD CAN
        ::    BE CACHED, GIVING THE CLIENT EXPLICIT CONTROL OVER THE CACHING
        ::    BEHAVIOUR.
        ::
        $:  %PIN
            ::  DATE: TIME AT WHICH TO PERFORM THE BUILD
            ::
            DATE=@DA
            ::  SCHEMATIC: WRAPPED SCHEMATIC OF PINNED TIME
            ::
            =SCHEMATIC
        ==
        ::  %ALTS: ALTERNATIVE BUILD CHOICES
        ::
        ::    TRY EACH CHOICE IN :CHOICES, IN ORDER; ACCEPT THE FIRST ONE THAT
        ::    SUCCEEDS. NOTE THAT THE RESULT INHERITS THE DEPENDENCIES OF ALL
        ::    FAILED SCHEMATICS, AS WELL AS THE SUCCESSFUL ONE.
        ::
        $:  %ALTS
            ::  CHOICES: LIST OF BUILD OPTIONS TO TRY
            ::
            CHOICES=(LIST SCHEMATIC)
        ==
        ::  %BAKE: RUN A FILE THROUGH A RENDERER
        ::
        $:  %BAKE
            ::  RENDERER: NAME OF RENDERER; ALSO ITS FILE PATH IN REN/
            ::
            RENDERER=TERM
            ::  QUERY-STRING: THE QUERY STRING OF THE RENDERER'S HTTP PATH
            ::
            QUERY-STRING=COIN
            ::  PATH-TO-RENDER: FULL PATH OF FILE TO RENDER
            ::
            PATH-TO-RENDER=RAIL
        ==
        ::  %BUNT: PRODUCE THE DEFAULT VALUE FOR A MARK
        ::
        $:  %BUNT
            ::  DISC WHERE IN CLAY TO LOAD THE MARK FROM
            ::
            =DISC
            ::  MARK: NAME OF MARK; ALSO ITS FILE PATH IN MAR/
            ::
            MARK=TERM
        ==
        ::  %CALL: CALL A GATE ON A SAMPLE
        ::
        $:  %CALL
            ::  GATE: SCHEMATIC WHOSE RESULT IS A GATE
            ::
            GATE=SCHEMATIC
            ::  SAMPLE:  SCHEMATIC WHOSE RESULT WILL BE THE GATE'S SAMPLE
            ::
            SAMPLE=SCHEMATIC
        ==
        ::  %CAST: CAST THE RESULT OF A SCHEMATIC THROUGH A MARK
        ::
        $:  %CAST
            ::  DISC WHERE IN CLAY TO LOAD THE MARK FROM
            ::
            =DISC
            ::  MARK: NAME OF MARK; ALSO ITS FILE PATH IN REN/
            ::
            MARK=TERM
            ::  INPUT: SCHEMATIC WHOSE RESULT WILL BE RUN THROUGH THE MARK
            ::
            INPUT=SCHEMATIC
        ==
        ::  %CORE: BUILD A HOON PROGRAM FROM A SOURCE FILE
        ::
        $:  %CORE
            ::  SOURCE-PATH: CLAY PATH FROM WHICH TO LOAD HOON SOURCE
            ::
            SOURCE-PATH=RAIL
        ==
        ::  %DIFF: PRODUCE MARKED DIFF FROM :FIRST TO :SECOND
        ::
        $:  %DIFF
            ::  DISC WHERE IN CLAY TO LOAD THE MARK FROM
            ::
            =DISC
            ::  OLD: SCHEMATIC PRODUCING DATA TO BE USED AS DIFF STARTING POINT
            ::
            START=SCHEMATIC
            ::  NEW: SCHEMATIC PRODUCING DATA TO BE USED AS DIFF ENDING POINT
            ::
            END=SCHEMATIC
        ==
        ::  %DUDE: WRAP A FAILURE'S ERROR MESSAGE WITH AN EXTRA MESSAGE
        ::
        $:  %DUDE
            ::  ERROR: A TRAP PRODUCING AN ERROR MESSAGE TO WRAP THE ORIGINAL
            ::
            ERROR=TANK
            ::  ATTEMPT: THE SCHEMATIC TO TRY, WHOSE ERROR WE WRAP, IF ANY
            ::
            ATTEMPT=SCHEMATIC
        ==
        ::  %HOOD: CREATE A +HOOD FROM A HOON SOURCE FILE
        ::
        $:  %HOOD
            ::  SOURCE-PATH: CLAY PATH FROM WHICH TO LOAD HOON SOURCE
            ::
            SOURCE-PATH=RAIL
        ==
        ::  %JOIN: MERGE TWO DIFFS INTO ONE DIFF; PRODUCES `~` IF CONFLICTS
        ::
        $:  %JOIN
            ::  DISC WHERE IN CLAY TO LOAD THE MARK FROM
            ::
            =DISC
            ::  MARK: NAME OF THE MARK TO USE FOR DIFFS; ALSO FILE PATH IN MAR/
            ::
            MARK=TERM
            ::  FIRST: SCHEMATIC PRODUCING FIRST DIFF
            ::
            FIRST=SCHEMATIC
            ::  SECOND: SCHEMATIC PRODUCING SECOND DIFF
            ::
            SECOND=SCHEMATIC
        ==
        ::  %LIST: PERFORMS A LIST OF SCHEMATICS, RETURNS A LIST OF +BUILDS-RESULTS
        ::
        $:  %LIST
            ::  SCHEMATICS: LIST OF BUILDS TO PERFORM
            ::
            SCHEMATICS=(LIST SCHEMATIC)
        ==
        ::  %MASH: FORCE A MERGE, ANNOTATING ANY CONFLICTS
        ::
        $:  %MASH
            ::  DISC WHERE IN CLAY TO LOAD THE MARK FROM
            ::
            =DISC
            ::  MARK: NAME OF MARK USED IN DIFFS; ALSO FILE PATH IN MAR/
            ::
            MARK=TERM
            ::  FIRST: MARKED SCHEMATIC PRODUCING FIRST DIFF
            ::
            FIRST=[=DISC MARK=TERM =SCHEMATIC]
            ::  SECOND: MARKED SCHEMATIC PRODUCING SECOND DIFF
            ::
            SECOND=[=DISC MARK=TERM =SCHEMATIC]
        ==
        ::  %MUTE: MUTATE A NOUN BY REPLACING ITS WINGS WITH NEW VALUES
        ::
        $:  %MUTE
            ::  SUBJECT: SCHEMATIC PRODUCING THE NOUN TO MUTATE
            ::
            SUBJECT=SCHEMATIC
            ::  MUTATIONS: AXES AND SCHEMATICS TO PRODUCE THEIR NEW CONTENTS
            ::
            MUTATIONS=(LIST (PAIR WING SCHEMATIC))
        ==
        ::  %PACT: PATCH A MARKED NOUN BY APPLYING A DIFF
        ::
        $:  %PACT
            ::  DISC WHERE IN CLAY TO LOAD MARKS FROM
            ::
            =DISC
            ::  START: SCHEMATIC PRODUCING A NOUN TO BE PATCHED
            ::
            START=SCHEMATIC
            ::  DIFF: SCHEMATIC PRODUCING THE DIFF TO APPLY TO :START
            ::
            DIFF=SCHEMATIC
        ==
        ::  %PATH: RESOLVE A PATH WITH `-`S TO A PATH WITH `/`S
        ::
        ::    RESOLVE +RAW-PATH TO A PATH CONTAINING A FILE, REPLACING
        ::    ANY `-`S IN THE PATH WITH `/`S IF NO FILE EXISTS AT THE
        ::    ORIGINAL PATH. PRODUCES AN ERROR IF MULTIPLE FILES MATCH,
        ::    E.G. A/B/C AND A/B-C, OR A/B/C AND A-B/C.
        ::
        $:  %PATH
            ::  DISC: THE +DISC FORMING THE BASE OF THE PATH TO BE RESOLVED
            ::
            =DISC
            ::  PREFIX: PATH PREFIX UNDER WHICH TO RESOLVE :RAW-PATH, E.G. LIB
            ::
            PREFIX=@TAS
            ::  RAW-PATH: THE FILE PATH TO BE RESOLVED
            ::
            RAW-PATH=@TAS
        ==
        ::  %PLAN: BUILD A HOON PROGRAM FROM A PREPROCESSED SOURCE FILE
        ::
        $:  %PLAN
            ::  PATH-TO-RENDER: THE CLAY PATH OF A FILE BEING RENDERED
            ::
            ::    TODO: ONCE WE'VE REALLY IMPLEMENTED THIS, WRITE THE
            ::    DOCUMENTATION. (THIS IS THE PATH THAT STARTS OUT AS THE PATH
            ::    OF THE HOON SOURCE WHICH GENERATED THE SCAFFOLD, BUT CAN BE
            ::    CHANGED WITH `/:`.)
            ::
            PATH-TO-RENDER=RAIL
            ::  QUERY-STRING: THE QUERY STRING OF THE HTTP REQUEST
            ::
            QUERY-STRING=COIN
            ::  SCAFFOLD: PREPROCESSED HOON SOURCE AND IMPORTS
            ::
            =SCAFFOLD
        ==
        ::  %REEF: PRODUCE A HOON+ZUSE KERNEL. USED INTERNALLY FOR CACHING
        ::
        $:  %REEF
            ::  DISC: LOCATION OF SYS/HOON/HOON AND SYS/ZUSE/HOON
            ::
            =DISC
        ==
        ::  %RIDE: EVAL HOON AS FORMULA WITH RESULT OF A SCHEMATIC AS SUBJECT
        ::
        $:  %RIDE
            ::  FORMULA: A HOON TO BE EVALUATED AGAINST A SUBJECT
            ::
            FORMULA=HOON
            ::  SUBJECT: A SCHEMATIC WHOSE RESULT WILL BE USED AS SUBJECT
            ::
            SUBJECT=SCHEMATIC
        ==
        ::  %SAME: THE IDENTITY FUNCTION
        ::
        ::    FUNCTIONALLY USED TO "UNPIN" A BUILD FOR CACHING REASONS. IF YOU
        ::    RUN A %PIN BUILD, IT IS TREATED AS A ONCE BUILD AND IS THEREFORE
        ::    NOT CACHED. WRAPPING THE %PIN SCHEMATIC IN A %SAME SCHEMATIC
        ::    CONVERTS IT TO A LIVE BUILD, WHICH WILL BE CACHED DUE TO LIVE
        ::    BUILD SUBSCRIPTION SEMANTICS.
        ::
        $:  %SAME
            ::  SCHEMATIC THAT WE EVALUATE TO
            ::
            =SCHEMATIC
        ==
        ::  %SCRY: LOOKUP A VALUE FROM THE URBIT NAMESPACE
        ::
        $:  %SCRY
            ::  RESOURCE: A NAMESPACE REQUEST, WITH UNSPECIFIED TIME
            ::
            ::    SCHEMATICS CAN ONLY BE RESOLVED WHEN SPECIFYING A TIME,
            ::    WHICH WILL CONVERT THIS +RESOURCE INTO A +SCRY-REQUEST.
            ::
            =RESOURCE
        ==
        ::  %SLIM: COMPILE A HOON AGAINST A SUBJECT TYPE
        ::
        $:  %SLIM
            ::  COMPILE-TIME SUBJECT TYPE FOR THE :FORMULA
            ::
            SUBJECT-TYPE=TYPE
            ::  FORMULA: A +HOON TO BE COMPILED TO (PAIR TYPE NOCK)
            ::
            FORMULA=HOON
        ==
        ::  %SLIT: GET TYPE OF GATE PRODUCT
        ::
        $:  %SLIT
            ::  GATE: A VASE CONTAINING A GATE
            ::
            GATE=VASE
            ::  SAMPLE: A VASE CONTAINING THE :GATE'S SAMPLE
            ::
            SAMPLE=VASE
        ==
        ::  %VALE: COERCE A NOUN TO A MARK, VALIDATED
        ::
        $:  %VALE
            ::  DISC WHERE IN CLAY TO LOAD THE MARK FROM
            ::
            =DISC
            ::  MARK: NAME OF MARK TO USE; ALSO FILE PATH IN MAR/
            ::
            MARK=TERM
            ::  INPUT: THE NOUN TO BE CONVERTED USING THE MARK
            ::
            INPUT=*
        ==
        ::  %VOLT: COERCE A NOUN TO A MARK, UNSAFE
        ::
        $:  %VOLT
            ::  DISC WHERE IN CLAY TO LOAD THE MARK FROM
            ::
            =DISC
            ::  MARK: NAME OF MARK TO USE; ALSO FILE PATH IN MAR/
            ::
            MARK=TERM
            ::  INPUT: THE NOUN TO BE CONVERTED USING THE MARK
            ::
            INPUT=*
        ==
        ::  %WALK: FINDS A MARK CONVERSION PATH BETWEEN TWO MARKS
        ::
        $:  %WALK
            ::  DISC IN CLAY TO LOAD THE MARKS FROM
            ::
            =DISC
            ::  SOURCE: THE ORIGINAL MARK TYPE
            ::
            SOURCE=TERM
            ::  TARGET: THE DESTINATION MARK TYPE
            ::
            TARGET=TERM
        ==
    ==
  ::
  ::  +SCAFFOLD: PROGRAM CONSTRUCTION IN PROGRESS
  ::
  ::    A SOURCE FILE WITH ALL ITS IMPORTS AND REQUIREMENTS, WHICH WILL BE
  ::    BUILT AND COMBINED INTO ONE FINAL PRODUCT.
  ::
  +=  SCAFFOLD
    $:  ::  SOURCE-RAIL: THE FILE THIS SCAFFOLD WAS PARSED FROM
        ::
        SOURCE-RAIL=RAIL
        ::  ZUSE-VERSION: THE KELVIN VERSION OF THE STANDARD LIBRARY
        ::
        ZUSE-VERSION=@UD
        ::  STRUCTURES: FILES FROM %/SUR WHICH ARE INCLUDED
        ::
        STRUCTURES=(LIST CABLE)
        ::  LIBRARIES: FILES FROM %/LIB WHICH ARE INCLUDED
        ::
        LIBRARIES=(LIST CABLE)
        ::  CRANES: A LIST OF RESOURCES TO TRANSFORM AND INCLUDE
        ::
        CRANES=(LIST CRANE)
        ::  SOURCES: HOON SOURCES, EITHER PARSED OR ON THE FILESYSTEM
        ::
        SOURCES=(LIST HOON)
    ==
  ::  +CABLE: A REFERENCE TO SOMETHING ON THE FILESYSTEM
  ::
  +=  CABLE
    $:  ::  FACE: THE FACE TO WRAP AROUND THE IMPORTED FILE
        ::
        FACE=(UNIT TERM)
        ::  FILE-PATH: LOCATION IN CLAY
        ::
        FILE-PATH=TERM
    ==
  ::  +TRUSS: LATE-BOUND PATH
  ::
  ::    TODO: THE +TYKE DATA STRUCTURE SHOULD BE RETHOUGHT, POSSIBLY AS PART
  ::    OF THIS EFFORT SINCE IT IS ACTUALLY A `(LIST (UNIT HOON))`, WHEN IT
  ::    ONLY REPRESENTS @TAS. IT SHOULD BE A STRUCTURE WHICH EXPLICITLY
  ::    REPRESENTS A PATH WITH HOLES THAT NEED TO BE FILLED IN.
  ::
  +=  TRUSS
    $:  PRE=(UNIT TYKE)
        POF=(UNIT [P=@UD Q=TYKE])
    ==
  ::  +CRANE: PARSED RUNE USED TO INCLUDE AND TRANSFORM RESOURCES
  ::
  ::    CRANES LIFTING CRANES LIFTING CRANES!
  ::
  ::    A RECURSIVE TREE OF FORD DIRECTIVES THAT SPECIFIES INSTRUCTIONS FOR
  ::    INCLUDING AND TRANSFORMING RESOURCES FROM THE URBIT NAMESPACE.
  ::
  +=  CRANE
    $%  $:  ::  %FSSG: `/~` HOON LITERAL
            ::
            ::    `/~ <HOON>` PRODUCES A CRANE THAT EVALUATES ARBITRARY HOON.
            ::
            %FSSG
            =HOON
        ==
        $:  ::  %FSBC: `/$` PROCESS QUERY STRING
            ::
            ::    `/$` WILL CALL A GATE WITH THE QUERY STRING SUPPLIED TO THIS
            ::    BUILD. IF NO QUERY STRING, THIS ERRORS.
            ::
            %FSBC
            =HOON
        ==
        $:  ::  %FSBR: `/|` FIRST OF MANY OPTIONS THAT SUCCEEDS
            ::
            ::    `/|` TAKES A SERIES OF CRANES AND PRODUCES THE FIRST ONE
            ::    (LEFT-TO-RIGHT) THAT SUCCEEDS. IF NONE SUCCEED, IT PRODUCES
            ::    STACK TRACES FROM ALL OF ITS ARGUMENTS.
            ::
            %FSBR
            ::  CHOICES: CRANES TO TRY
            ::
            CHOICES=(LIST CRANE)
        ==
        $:  ::  %FSTS: `/=` WRAP A FACE AROUND A CRANE
            ::
            ::    /= RUNS A CRANE (USUALLY PRODUCED BY ANOTHER FORD RUNE), TAKES
            ::    THE RESULT OF THAT CRANE, AND WRAPS A FACE AROUND IT.
            ::
            %FSTS
            ::  FACE: FACE TO APPLY
            ::
            FACE=TERM
            ::  CRANE: INTERNAL BUILD STEP
            ::
            =CRANE
        ==
        $:  ::  %FSDT: `/.` NULL-TERMINATED LIST
            ::
            ::    PRODUCE A NULL-TERMINATED LIST FROM A SEQUENCE OF CRANES,
            ::    TERMINATED BY A `==`.
            ::
            %FSDT
            ::  ITEMS: CRANES TO EVALUATE
            ::
            ITEMS=(LIST CRANE)
        ==
        $:  ::  %FSCM: `/,` SWITCH BY PATH
            ::
            ::    `/,` IS A SWITCH STATEMENT, WHICH PICKS A BRANCH TO EVALUATE
            ::    BASED ON WHETHER THE CURRENT PATH MATCHES THE PATH IN THE
            ::    SWITCH STATEMENT. TAKES A SEQUENCE OF PAIRS OF (PATH, CRANE)
            ::    TERMINATED BY A `==`.
            ::
            %FSCM
            ::  CASES: PRODUCES EVALUATED CRANE OF FIRST +SPUR MATCH
            ::
            CASES=(LIST (PAIR SPUR CRANE))
        ==
        $:  ::  %FSPM: `/&` PASS THROUGH A SERIES OF MARKS
            ::
            ::    `/&` PASSES A CRANE THROUGH MULTIPLE MARKS, RIGHT-TO-LEFT.
            ::
            %FSPM
            ::  MARKS: MARKS TO APPLY TO :CRANE, IN REVERSE ORDER
            ::
            MARKS=(LIST MARK)
            =CRANE
        ==
        $:  ::  %FSCB: `/_` RUN A CRANE ON EACH FILE IN THE CURRENT DIRECTORY
            ::
            ::    `/_` TAKES A CRANE AS AN ARGUMENT. IT PRODUCES A NEW CRANE
            ::    REPRESENTING THE RESULT OF MAPPING THE SUPPLIED CRANE OVER THE
            ::    LIST OF FILES IN THE CURRENT DIRECTORY. THE KEYS IN THE
            ::    RESULTING MAP ARE THE BASENAMES OF THE FILES IN THE DIRECTORY,
            ::    AND EACH VALUE IS THE RESULT OF RUNNING THAT CRANE ON THE
            ::    CONTENTS OF THE FILE.
            ::
            %FSCB
            =CRANE
        ==
        $:  ::  %FSSM: `/;` OPERATE ON
            ::
            ::    `/;` TAKES A HOON AND A CRANE. THE HOON SHOULD EVALUATE TO A
            ::    GATE, WHICH IS THEN CALLED WITH THE RESULT OF THE CRANE AS ITS
            ::    SAMPLE.
            ::
            %FSSM
            =HOON
            =CRANE
        ==
        $:  ::  %FSCL: `/:` EVALUATE AT PATH
            ::
            ::    `/:` TAKES A PATH AND A +CRANE, AND EVALUATES THE CRANE WITH
            ::    THE CURRENT PATH SET TO THE SUPPLIED PATH.
            ::
            %FSCL
            ::  PATH: LATE BOUND PATH TO BE RESOLVED RELATIVE TO CURRENT BEAK
            ::
            ::    THIS BECOMES CURRENT PATH OF :CRANE
            ::
            PATH=TRUSS
            =CRANE
        ==
        $:  ::  %FSKT: `/^` CAST
            ::
            ::    `/^` TAKES A +MOLD AND A +CRANE, AND CASTS THE RESULT OF THE
            ::    CRANE TO THE MOLD.
            ::
            %FSKT
            ::  MOLD: EVALUATES TO A MOLD TO BE APPLIED TO :CRANE
            ::
            =SPEC
            =CRANE
        ==
        $:  ::  %FSTR: `/*` RUN :CRANE ON ALL FILES WITH CURRENT PATH AS PREFIX
            ::
            %FSTR
            =CRANE
        ==
        $:  ::  %FSZP: `/!MARK/` EVALUATE AS HOON, THEN PASS THROUGH MARK
            ::
            %FSZP
            =MARK
        ==
        $:  ::  %FSZY: `/MARK/` PASSES CURRENT PATH THROUGH :MARK
            ::
            %FSZY
            =MARK
    ==  ==
  ::  +RESULT-TO-CAGE: EXTRACT A +CAGE FROM A +BUILD-RESULT
  ::
  ++  RESULT-TO-CAGE
    |=  RESULT=BUILD-RESULT
    ^-  CAGE
    ?:  ?=(%ERROR -.RESULT)
      [%TANG !>(MESSAGE.RESULT)]
    ?-    -.+.RESULT
        ^      [%NOUN (SLOP Q:$(RESULT HEAD.RESULT) Q:$(RESULT TAIL.RESULT))]
        %$     CAGE.RESULT
        %ALTS  $(RESULT BUILD-RESULT.RESULT)
        %BAKE  CAGE.RESULT
        %BUNT  CAGE.RESULT
        %CALL  [%NOUN VASE.RESULT]
        %CAST  CAGE.RESULT
        %CORE  [%NOUN VASE.RESULT]
        %DIFF  CAGE.RESULT
        %HOOD  [%NOUN !>(SCAFFOLD.RESULT)]
        %JOIN  CAGE.RESULT
        %LIST  [%NOUN -:!>(*(LIST CAGE)) (TURN RESULTS.RESULT RESULT-TO-CAGE)]
        %MASH  CAGE.RESULT
        %MUTE  CAGE.RESULT
        %PACT  CAGE.RESULT
        %PATH  [%NOUN !>(RAIL.RESULT)]
        %PLAN  [%NOUN VASE.RESULT]
        %REEF  [%NOUN VASE.RESULT]
        %RIDE  [%NOUN VASE.RESULT]
        %SCRY  CAGE.RESULT
        %SLIM  [%NOUN !>([TYPE NOCK]:RESULT)]
        %SLIT  [%NOUN !>(TYPE.RESULT)]
        %VALE  CAGE.RESULT
        %VOLT  CAGE.RESULT
        %WALK  [%NOUN !>(RESULTS.RESULT)]
    ==
  ::  +RESULT-AS-ERROR: EXTRACTS A TANG OUT OF A MADE-RESULT
  ::
  ++  MADE-RESULT-AS-ERROR
    |=  RESULT=MADE-RESULT
    ^-  TANG
    ?:  ?=([%INCOMPLETE *] RESULT)
      TANG.RESULT
    ?:  ?=([%COMPLETE %ERROR *] RESULT)
      MESSAGE.BUILD-RESULT.RESULT
    ~
  --
::                                                      ::::
::::                    ++GALL                            ::  (1G) EXTENSIONS
  ::                                                    ::::
++  GALL  ^?
  |%
  ::                                                    ::
  ::::                  ++ABLE:GALL                     ::  (1G1) ARVO MOVES
    ::                                                  ::::
  ++  ABLE  ^?
    |%
    ++  GIFT                                            ::  OUTGOING RESULT
      $%  {$MASS P/MASS}                                ::  MEMORY USAGE
          {$ONTO P/(EACH SUSS TANG)}                    ::  ABOUT AGENT
          {$REND P/PATH Q/*}                            ::  NETWORK REQUEST
          {$UNTO P/CUFT}                                ::
          {$MACK P/(UNIT TANG)}                         ::  MESSAGE ACK
      ==                                                ::
    ++  TASK                                            ::  INCOMING REQUEST
      $%  {$CONF P/DOCK Q/CULM}                         ::  CONFIGURE APP
          {$INIT P/SHIP}                                ::  SET OWNER
          {$DEAL P/SOCK Q/CUSH}                         ::  FULL TRANSMISSION
          {$SUNK P=SHIP Q/LIFE}                         ::  REPORT DEATH
          {$VEGA ~}                                     ::  REPORT UPGRADE
          {$WEST P/SHIP Q/PATH R/*}                     ::  NETWORK REQUEST
          {$WEGH ~}                                     ::  REPORT MEMORY
      ==                                                ::
    --  ::ABLE
  ++  BITT  (MAP BONE (PAIR SHIP PATH))                 ::  INCOMING SUBS
  ++  BOAT                                              ::  OUTGOING SUBS
    %+  MAP  (PAIR BONE WIRE)                           ::
    (TREL BEAN SHIP PATH)                               ::
  ++  BOWL                                              ::  STANDARD APP STATE
          $:  $:  OUR/SHIP                              ::  HOST
                  SRC/SHIP                              ::  GUEST
                  DAP/TERM                              ::  AGENT
              ==                                        ::
              $:  WEX/BOAT                              ::  OUTGOING SUBS
                  SUP/BITT                              ::  INCOMING SUBS
              ==                                        ::
              $:  OST/BONE                              ::  OPAQUE CAUSE
                  ACT/@UD                               ::  CHANGE NUMBER
                  ENY/@UVJ                              ::  ENTROPY
                  NOW/@DA                               ::  CURRENT TIME
                  BYK/BEAK                              ::  LOAD SOURCE
          ==  ==                                        ::
  ++  CLUB                                              ::  AGENT ACTION
    $%  {$PEEL P/MARK Q/PATH}                           ::  TRANSLATED PEER
        {$PEER P/PATH}                                  ::  SUBSCRIBE
        {$POKE P/CAGE}                                  ::  APPLY
        {$PUFF P/MARK Q/NOUN}                           ::  UNCHECKED POKE
        {$PULL ~}                                      ::  UNSUBSCRIBE
        {$PUNK P/MARK Q/CAGE}                           ::  TRANSLATED POKE
        {$PUMP ~}                                      ::  PUMP YES+NO
        {$PEER-NOT P/TANG}                              ::  POISON PILL PEER
    ==                                                  ::
  ++  CUFT                                              ::  INTERNAL GIFT
    $%  {$COUP P/(UNIT TANG)}                           ::  POKE RESULT
        {$DIFF P/CAGE}                                  ::  SUBSCRIPTION OUTPUT
        {$QUIT ~}                                      ::  CLOSE SUBSCRIPTION
        {$REAP P/(UNIT TANG)}                           ::  PEER RESULT
    ==                                                  ::
  ++  CULM                                              ::  CONFIG ACTION
    $%  {$LOAD P/SCUP}                                  ::  LOAD+RELOAD
    ::  {$KICK ~}                                      ::  RESTART EVERYTHING
    ::  {$STOP ~}                                      ::  TOGGLE SUSPEND
    ::  {$WIPE ~}                                      ::  DESTROY ALL STATE
    ==                                                  ::
  ++  CUSH  (PAIR TERM CLUB)                            ::  INTERNAL TASK
  ++  DUDE  TERM                                        ::  SERVER IDENTITY
  ++  GILL  (PAIR SHIP TERM)                            ::  GENERAL CONTACT
  ++  SCAR                                              ::  OPAQUE DUCT
    $:  P/@UD                                           ::  BONE SEQUENCE
        Q/(MAP DUCT BONE)                               ::  BY DUCT
        R/(MAP BONE DUCT)                               ::  BY BONE
    ==                                                  ::
  ++  SCUP  (PAIR SHIP DESK)                            ::  AUTOUPDATE
  ++  SUSS  (TREL DUDE @TAS @DA)                        ::  CONFIG REPORT
  ++  WELL  (PAIR DESK TERM)                            ::
  --  ::GALL
::                                                      ::::
::::                    ++JAEL                          ::  (1H) SECURITY
  ::                                                    ::::
++  JAEL  ^?
  |%
  ::                                                    ::
  ::::                  ++ABLE:JAEL                     ::  (1H1) ARVO MOVES
    ::                                                  ::::
  ++  ABLE  ^?
    =,  PKI
    =,  RIGHTS
    |%
    ::  %JAEL HAS TWO GENERAL KINDS OF TASK: CHANGES
    ::  AND CHANGE SUBSCRIPTIONS.
    ::
    ::  CHANGE TASKS ARE DESIGNED TO MATCH HIGH-LEVEL
    ::  OPERATIONS - FOR INSTANCE, WE HAVE %BURN, %MINT,
    ::  AND %MOVE, NOT JUST A SINGLE DELTA OPERATION.
    ::  MORE OF THESE OPERATIONS WILL PROBABLY BE ADDED,
    ::  AND INVARIANTS ENFORCED AT TRANSACTION END.
    ::
    ::  SUBSCRIPTIONS ARE ALSO USER-FOCUSED - FOR INSTANCE,
    ::  %VEIN SENDS ALL THE INFORMATION NEEDED TO MAINTAIN
    ::  THE SECURE CHANNEL, BOTH RIGHTS AND CERTIFICATES.
    ::  THE SECURITY-CRITICAL TASKS (%VEIL, %VEIN, %VINE)
    ::  SHOULD PROBABLY BE BOUND TO A WHITELISTED DUCT SET.
    ::  (ALL SECRETS ARE REDACTED FROM %VEST GIFTS.)
    ::
    ::  %JAEL ONLY TALKS TO %AMES AND %BEHN.  WE SEND MESSAGES
    ::  THROUGH %AMES AND USE %BEHN TIMERS.
    ::
    ++  LOGS                                            ::  ON-CHAIN CHANGES
      %+  MAP  EVENT-ID:ETHEREUM-TYPES                  ::  PER EVENT LOG
      DIFF-AZIMUTH:AZIMUTH-TYPES                        ::  THE CHANGE
    ++  ACTION                                          ::  BALANCE CHANGE
      %+  PAIR  SHIP                                    ::  PARTNER
      %+  EACH  BUMP                                    ::  &/LIABILITY CHANGE
      BUMP                                              ::  |/ASSET CHANGE
    ::                                                  ::
    ++  BALANCE                                         ::  BALANCE SHEET
      %+  PAIR                                          ::
        (MAP SHIP SAFE)                                 ::  LIABILITIES
      (MAP SHIP SAFE)                                   ::  ASSETS
    ::                                                  ::
    ++  VENT-RESULT                                     ::  %VENT RESULT
      $%  [%SNAP SNAP=SNAPSHOT:JAEL]                    ::  RESTORE SNAPSHOT
          [%CHAIN CAN=CHAIN]                            ::  GET NEW EVENTS
      ==                                                ::
    ::                                                  ::
    ++  CHAIN                                           ::  BATCH OF CHANGES
      %+  EACH  LOGS                                    ::  & ALL EVENTS
      LOGS                                              ::  | NEW EVENTS
    ++  CHANGE                                          ::  URBIT CHANGE
      $%  [%ETHE CAN=CHAIN]                             ::  ON-CHAIN CHANGE
          [%MEET WHO=SHIP =LIFE =PASS]                  ::  MEET IN NEW ERA
          $:  %RITE                                     ::  RIGHTS CHANGE
              REX/SHIP                                  ::  ISSUER
              PAL/SHIP                                  ::  ISSUED TO
              DEL/BUMP                                  ::  CHANGE
      ==  ==                                            ::
    ++  GIFT                                            ::  OUT RESULT <-$
      $%  [%INIT P=SHIP]                                ::  REPORT INSTALL UNIX
          [%MASS P=MASS]                                ::  MEMORY USAGE REPORT
          [%MACK P=(UNIT TANG)]                         ::  MESSAGE N/ACK
          [%PUBS PUBLIC]                                ::  PUBLIC KEYS
          [%TURF TURF=(LIST TURF)]                      ::  DOMAINS
          {$VEST P/TALLY}                               ::  BALANCE UPDATE
          [%VEIN =LIFE VEIN=(MAP LIFE RING)]            ::  PRIVATE KEYS
          {$VINE P/(LIST CHANGE)}                       ::  ALL RAW CHANGES
          [%VENT P=VENT-RESULT]                         ::  ETHEREUM CHANGES
      ==                                                ::
    ::                                                  ::
    ++  NOTE                                            ::  OUT REQUEST $->
      =,  EYRE                                          ::
      $%  $:  %B                                        ::
      $%  [%REST P=@DA]                                 ::  CANCEL TIMER
          [%WAIT P=@DA]                                 ::  WAIT UNTIL
      ==  ==                                            ::
          $:  %E                                        ::
      $%  [%HISS P=(UNIT USER) Q=MARK R=CAGE]           ::  OUTBOUND USER REQ
      ==  ==                                            ::
          $:  %A                                        ::
      $%  [%WANT P=SHIP Q=PATH R=*]                     ::  SEND MESSAGE
      ==  ==                                            ::
          $:  %J                                        ::
      $%  [%VENT-RESULT P=VENT-RESULT]                  ::  TMP WORKAROUND
          [%LOOK SRC=(EACH SHIP PURL:EYRE)]             ::
      ==  ==                                            ::
          $:  @TAS                                      ::
      $%  [%INIT P=SHIP]                                ::  REPORT INSTALL
          [%SUNK P=SHIP Q=LIFE]                         ::  REPORT DEATH
      ==  ==  ==                                        ::
    ++  PUBLIC                                          ::  PUBLIC KEY STATE
      $:  LIFE=LIFE                                     ::  CURRENT KEY NUMBER
          PUBS=(MAP LIFE PASS)                          ::  PUBKEYS BY NUMBER
      ==                                                ::
    ++  REMOTE                                          ::  REMOTE NOTIFICATION
      %+  EACH  SAFE                                    ::  &/ADDITION
      SAFE                                              ::  |/REPLACEMENT
    ::  +SEED: PRIVATE BOOT PARAMETERS
    ::
    +$  SEED  [WHO=SHIP LYF=LIFE KEY=RING SIG=(UNIT OATH:PKI)]
    ::
    ++  SIGN                                            ::  IN RESULT $<-
      $%  {$B $WAKE ~}                                  ::  WAKEUP
          [%E %SIGH P=CAGE]                             ::  MARKED HTTP RESPONSE
          [%J %VENT P=VENT-RESULT]                      ::  ETHEREUM CHANGES
          [%A %WOOT P=SHIP Q=COOP]                      ::  MESSAGE RESULT
      ==                                                ::
    ++  TALLY                                           ::  BALANCE UPDATE
      %+  EACH  BALANCE                                 ::  COMPLETE
      ACTION                                            ::  CHANGE
    ::
    +=  TASK                                            ::  IN REQUEST ->$
      $%  [%BURN P=SHIP Q=SAFE]                         ::  DESTROY RIGHTS
          [%HAIL P=SHIP Q=REMOTE]                       ::  REMOTE UPDATE
          $:  %DAWN                                     ::  BOOT FROM KEYS
              =SEED:ABLE:JAEL                           ::    IDENTITY PARAMS
              SPON=SHIP                                 ::    SPONSOR
              CZAR=(MAP SHIP [=LIFE =PASS])             ::    GALAXY TABLE
              TURF=(LIST TURF)                          ::    DOMAINS
              BLOQ=@UD                                  ::    BLOCK NUMBER
              NODE=(UNIT PURL:EYRE)                     ::    GATEWAY URL
              SNAP=(UNIT SNAPSHOT)                      ::    HEAD START
          ==                                            ::
          [%FAKE =SHIP]                                 ::  FAKE BOOT
          [%LOOK SRC=(EACH SHIP PURL:EYRE)]             ::  SET ETHEREUM SOURCE
          [%MINT P=SHIP Q=SAFE]                         ::  CREATE RIGHTS
          [%MOVE P=SHIP Q=SHIP R=SAFE]                  ::  TRANSFER FROM=TO
          ::TODO  %NEXT FOR GENERATING/PUTTING NEW PRIVATE KEY
          [%NUKE ~]                                     ::  CANCEL TRACKER FROM
          [%PUBS =SHIP]                                 ::  VIEW PUBLIC KEYS
          [%MEET =SHIP =LIFE =PASS]                     ::  MET AFTER BREACH
          [%SNAP SNAP=SNAPSHOT KICK=?]                  ::  LOAD SNAPSHOT
          [%TURF ~]                                     ::  VIEW DOMAINS
          [%VEGA ~]                                     ::  REPORT UPGRADE
          [%VEIN ~]                                     ::  VIEW SIGNING KEYS
          [%VENT ~]                                     ::  VIEW ETHEREUM EVENTS
          [%VEST ~]                                     ::  VIEW PUBLIC BALANCE
          [%VINE ~]                                     ::  VIEW SECRET HISTORY
          [%WEGH ~]                                     ::  MEMORY USAGE REQUEST
          [%WEST P=SHIP Q=PATH R=*]                     ::  REMOTE REQUEST
          [%WIND P=@UD]                                 ::  REWIND BEFORE BLOCK
      ==                                                ::
    --                                                  ::
  ::                                                    ::
  ::::                                                  ::
    ::                                                  ::
  ++  NODE-SRC                                          ::  ETHEREUM NODE COMMS
    $:  NODE=PURL:EYRE                                  ::  NODE URL
        FILTER-ID=@UD                                   ::  CURRENT FILTER
        POLL-TIMER=@DA                                  ::  NEXT FILTER POLL
    ==                                                  ::
  ++  SNAPSHOT                                          ::  REWIND POINT
    =,  AZIMUTH-TYPES                                   ::
    $:  KYZ=(MAP SHIP PUBLIC:ABLE)                      ::  PUBLIC KEY STATE
        $=  ETH                                         ::
          $:  DNS=DNSES                                 ::  ON-CHAIN DNS STATE
              POS=(MAP SHIP POINT)                      ::  ON-CHAIN SHIP STATE
        ==                                              ::
        ETH-BOOKMARK
    ==
  ::  +ETH-BOOKMARK: CURSOR INTO THE ETHEREUM CHAIN
  ::
  ++  ETH-BOOKMARK
    $:  HEARD=(SET EVENT-ID:ETHEREUM-TYPES)
        LATEST-BLOCK=@UD
    ==
  ::  +STATE-ETH-NODE: STATE OF A CONNECTION TO AN ETHEREUM NODE
  ::
  ++  STATE-ETH-NODE                                    ::  NODE CONFIG + META
    $:  SOURCE=(EACH SHIP NODE-SRC)                     ::  LEARNING FROM
        FOREIGN-BLOCK=@UD                               ::  NODE'S LATEST BLOCK
        ETH-BOOKMARK
    ==                                                  ::
  ::                                                    ::
  ::::                  ++PKI:JAEL                      ::  (1H2) CERTIFICATES
    ::                                                  ::::
  ++  PKI  ^?
    |%
    ::TODO  UPDATE TO FIT AZIMUTH-STYLE KEYS
    ::  THE URBIT META-CERTIFICATE (++WILL) IS A SEQUENCE
    ::  OF CERTIFICATES (++CERT).  EACH CERT IN A WILL
    ::  REVOKES AND REPLACES THE PREVIOUS CERT.  THE
    ::  VERSION NUMBER OF A SHIP IS A ++LIFE.
    ::
    ::  THE DEED CONTAINS AN ++ARMS, A DEFINITION
    ::  OF COSMETIC IDENTITY; A SEMI-TRUSTED PARENT,
    ::  WHICH SIGNS THE INITIAL CERTIFICATE AND PROVIDES
    ::  ROUTING SERVICES; AND A DIRTY BIT.  IF THE DIRTY
    ::  BIT IS SET, THE NEW LIFE OF THIS SHIP MAY HAVE
    ::  LOST INFORMATION THAT THE OLD LIFE HAD.
    ::
    ++  HAND  @UVH                                      ::  128-BIT HASH
    ++  MIND  {WHO/SHIP LYF/LIFE}                       ::  KEY IDENTIFIER
    ++  NAME  (PAIR @TA @T)                             ::  ASCII / UNICODE
    ++  OATH  @                                         ::  SIGNATURE
    --  ::  PKI
  ::                                                    ::
  ::::                  ++RIGHTS:JAEL                   ::  (1H3) CLAIMS
    ::                                                  ::::
  ++  RIGHTS  ^?
    =,  PKI
    |%
    ::  %JAEL TRACKS PROMISES (++RITE) FROM SHIP TO SHIP.
    ::  A RITE MAY BE ANY RIGHT, BADGE, ASSET, SECRET, ETC.
    ::  UN-SHARED SECRET OR PRIVATE ASSET IS STORED AS A
    ::  RITE FROM SELF TO SELF.
    ::
    ::  EACH RITE IS REALLY A CLASS OF RIGHTS, AND OFTEN
    ::  HAS ITS OWN INTERNAL SET OR MAP STRUCTURE.
    ::
    ::  PRESENT KINDS OF RITE:
    ::
    ::    %APPLE: APPLICATION SECRET FOR A WEB API.
    ::    %BLOCK: THE PROMISEE IS BANNED.
    ::    %EMAIL: EMAIL TIED TO PROMISSEE'S SHIP.
    ::    %FINAL: SHIP/TICKET PAIR, READY TO LAUNCH.
    ::    %FUNGI: FUNGIBLE, COUNTABLE ASSET.
    ::    %GUEST: PERMISSION TO ADOPT FOREIGN CHILD.
    ::    %HOTEL: BLOCK OF UNISSUED CHILDREN.
    ::    %JEWEL: URBIT PRIVATE KEYS.
    ::    %LOGIN: USER'S LOGIN PASSCODE.
    ::    %PWORD: PASSWORD FOR A WEBSITE/API.
    ::    %TOKEN: USER ACCESS TOKEN FOR A WEB API.
    ::    %URBAN: SYMMETRIC KEY FOR URBIT NETWORKING.
    ::
    ::  %FUNGI KEYS CAN BE ANYTHING, BUT DON'T REUSE
    ::  CURRENCY CODES.  CODES FOR URBIT INVITATIONS:
    ::  %UGL == GALAXY, %USR == STAR, %UPL == PLANET
    ::
    ::  YOU CAN THINK OF [OUR HER RITE] AS AN RDF TRIPLE.
    ::
    ++  BILL  (PAIR @DA @)                              ::  EXPIRING VALUE
    ++  BUMP                                            ::  RIGHTS CHANGE
      $:  MOR/SAFE                                      ::  ADD RIGHTS
          LES/SAFE                                      ::  LOSE RIGHTS
      ==                                                ::
    ++  DORM  (PAIR SHIP BLOQ)                          ::  ISSUING GROUP
    ++  PILE  (TREE (PAIR @ @))                         ::  EFFICIENT SHIP SET
    ++  RITE                                            ::  URBIT COMMITMENT
      $%  {$APPLE P/(MAP SITE @)}                       ::  WEB API KEY
          {$BLOCK ~}                                    ::  BANNED
          {$EMAIL P/(SET @T)}                           ::  EMAIL ADDRESSES
          {$FINAL P/(MAP SHIP @PG)}                     ::  TICKETED SHIPS
          {$FUNGI P/(MAP TERM @UD)}                     ::  FUNGIBLES
          {$GUEST ~}                                    ::  REFUGEE VISA
          {$HOTEL P/(MAP DORM PILE)}                    ::  RESERVED BLOCK
          {$JEWEL P/(MAP LIFE RING)}                    ::  PRIVATE KEYRING
          {$LOGIN P/(SET @PG)}                          ::  LOGIN SECRET
          {$PWORD P/(MAP SITE (MAP @T @T))}             ::  WEB PASSWD BY USER
          {$TOKEN P/(MAP SITE (MAP @T @T))}             ::  APP TOKENS BY USER
          {$URBAN P/(MAP HAND BILL)}                    ::  URBIT SYMMETRIC KEYS
      ==                                                ::
    ++  SITE  (LIST @TA)                                ::  [%COM %YAHOO %WWW ~]
    ++  SAFE  (TREE RITE)                               ::  RIGHTS SET
    --  ::  RIGHTS
  --  ::  JAEL
::                                                      ::::
::::                    ++XMAS                            ::  (1I) NEW NETWORK
  ::                                                    ::::
++  XMAS  ^?
  ::                                                    ::
  ::::                  ++ABLE:XMAS                     ::  (1I1) ARVO MOVES
    ::                                                  ::::
  |%
  ++  ABLE  ^?
    |%
    ++  GIFT                                            ::
      $%  {$EAST P/*}                                   ::  RESPONSE MESSAGE
          {$HOME P/LANE Q/@}                            ::  PROCESS FORWARD
          {$SEND P/LANE Q/@}                            ::  SEND PACKET
          {$REST P/COOP}                                ::  ACKNOWLEDGMENT
      ==                                                ::
    ++  TASK                                            ::  IN REQUEST ->$
      $%  {$HEAR P/LANE Q/@}                            ::
          {$MESS P/SHIP Q/PATH R/*}                     ::  SEND MESSAGE
          {$WAKE ~}                                    ::
      ==                                                ::
    ++  CARD                                            ::  OUT CARDS
      $%  {$WEST P/SHIP Q/PATH R/*}                     ::  NETWORK REQUEST
      ==                                                ::
    ++  SIGN                                            ::  IN RESPONSE $-<
      $:  $G                                            ::
          $%  {$REND P/PATH Q/*}                        ::  NETWORK REQUEST
              {$MACK P/(UNIT TANG)}                     ::  MESSAGE ACK
      ==  ==                                            ::
    ++  NOTE                                            ::  OUT REQUEST $->
      $%  {$C $WEST P/SHIP Q/PATH R/*}                  ::  TO %CLAY
          {$E $WEST P/SHIP Q/PATH R/*}                  ::  TO %EYRE
          {$G $WEST P/SHIP Q/PATH R/*}                  ::  TO %GALL
          $:  $J                                        ::  TO %JAEL
              $%  {$LINE P/SHIP Q/@DA R/CODE}           ::
                  {$LINK P/SHIP Q/@DA R/CODE}           ::
                  {$VEIL P/SHIP}                        ::
                  {$WEST P/SHIP Q/PATH R/*}             ::  TO %GALL
      ==  ==  ==                                        ::
    --  ::  ABLE
  ::
  ::::                                                  ::  (1I2)
    ::
  ++  CODE  @UVI                                        ::  SYMMETRIC KEY
  ++  LANE                                              ::  PACKET ROUTE
    $%  {$IF P/@DA Q/@UD R/@IF}                         ::  IP4/PUBLIC UDP/ADDR
        {$IS P/@UD Q/(UNIT LANE) R/@IS}                 ::  IPV6 W+ALTERNATES
        {$IX P/@DA Q/@UD R/@IF}                         ::  IPV4 PROVISIONAL
    ==                                                  ::
  --  ::XMAS
--  ::
::                                                      ::  ::
::::                                                    ::  ::  (2) ENGINES
  ::                                                    ::  ::
|%
::                                                      ::::
::::                      ++NUMBER                      ::  (2A) NUMBER THEORY
  ::                                                    ::::
++  NUMBER  ^?
  |%
  ::                                                    ::  ++FU:NUMBER
  ++  FU                                                ::  MODULO (MUL P Q)
    |=  A/{P/@ Q/@}
    =+  B=?:(=([0 0] A) 0 (~(INV FO P.A) (~(SIT FO P.A) Q.A)))
    |%
    ::                                                  ::  ++DIF:FU:NUMBER
    ++  DIF                                             ::  SUBTRACT
      |=  {C/{@ @} D/{@ @}}
      [(~(DIF FO P.A) -.C -.D) (~(DIF FO Q.A) +.C +.D)]
    ::                                                  ::  ++EXP:FU:NUMBER
    ++  EXP                                             ::  EXPONENT
      |=  {C/@ D/{@ @}}
      :-  (~(EXP FO P.A) (MOD C (DEC P.A)) -.D)
      (~(EXP FO Q.A) (MOD C (DEC Q.A)) +.D)
    ::                                                  ::  ++OUT:FU:NUMBER
    ++  OUT                                             ::  GARNER'S FORMULA
      |=  C/{@ @}
      %+  ADD  +.C
      %+  MUL  Q.A
      %+  ~(PRO FO P.A)  B
      (~(DIF FO P.A) -.C (~(SIT FO P.A) +.C))
    ::                                                  ::  ++PRO:FU:NUMBER
    ++  PRO                                             ::  MULTIPLY
      |=  {C/{@ @} D/{@ @}}
      [(~(PRO FO P.A) -.C -.D) (~(PRO FO Q.A) +.C +.D)]
    ::                                                  ::  ++SUM:FU:NUMBER
    ++  SUM                                             ::  ADD
      |=  {C/{@ @} D/{@ @}}
      [(~(SUM FO P.A) -.C -.D) (~(SUM FO Q.A) +.C +.D)]
    ::                                                  ::  ++SIT:FU:NUMBER
    ++  SIT                                             ::  REPRESENT
      |=  C/@
      [(MOD C P.A) (MOD C Q.A)]
    --  ::FU
  ::                                                    ::  ++PRAM:NUMBER
  ++  PRAM                                              ::  RABIN-MILLER
    |=  A/@  ^-  ?
    ?:  ?|  =(0 (END 0 1 A))
            =(1 A)
            =+  B=1
            |-  ^-  ?
            ?:  =(512 B)
              |
            ?|(=+(C=+((MUL 2 B)) &(!=(A C) =(A (MUL C (DIV A C))))) $(B +(B)))
        ==
      |
    =+  ^=  B
        =+  [S=(DEC A) T=0]
        |-  ^-  {S/@ T/@}
        ?:  =(0 (END 0 1 S))
          $(S (RSH 0 1 S), T +(T))
        [S T]
    ?>  =((MUL S.B (BEX T.B)) (DEC A))
    =+  C=0
    |-  ^-  ?
    ?:  =(C 64)
      &
    =+  D=(~(RAW OG (ADD C A)) (MET 0 A))
    =+  E=(~(EXP FO A) S.B D)
    ?&  ?|  =(1 E)
            =+  F=0
            |-  ^-  ?
            ?:  =(E (DEC A))
              &
            ?:  =(F (DEC T.B))
              |
            $(E (~(PRO FO A) E E), F +(F))
        ==
        $(C +(C))
    ==
  ::                                                    ::  ++RAMP:NUMBER
  ++  RAMP                                              ::  MAKE R-M PRIME
    |=  {A/@ B/(LIST @) C/@}  ^-  @UX                   ::  {BITS SNAGS SEED}
    =>  .(C (SHAS %RAMP C))
    =+  D=*@
    |-
    ?:  =((MUL 100 A) D)
      ~|(%AR-RAMP !!)
    =+  E=(~(RAW OG C) A)
    ?:  &((LEVY B |=(F/@ !=(1 (MOD E F)))) (PRAM E))
      E
    $(C +(C), D (SHAX D))
  ::                                                    ::  ++CURT:NUMBER
  ++  CURT                                              ::  CURVE25519
    |=  {A/@ B/@}
    =>  %=    .
            +
          =>  +
          =+  =+  [P=486.662 Q=(SUB (BEX 255) 19)]
              =+  FQ=~(. FO Q)
              [P=P Q=Q FQ=FQ]
          |%
          ::                                            ::  ++CLA:CURT:NUMBER
          ++  CLA                                       ::
            |=  RAW/@
            =+  LOW=(DIS 248 (CUT 3 [0 1] RAW))
            =+  HIH=(CON 64 (DIS 127 (CUT 3 [31 1] RAW)))
            =+  MID=(CUT 3 [1 30] RAW)
            (CAN 3 [[1 LOW] [30 MID] [1 HIH] ~])
          ::                                            ::  ++SQR:CURT:NUMBER
          ++  SQR                                       ::
            |=(A/@ (MUL A A))
          ::                                            ::  ++INV:CURT:NUMBER
          ++  INV                                       ::
            |=(A/@ (~(EXP FO Q) (SUB Q 2) A))
          ::                                            ::  ++CAD:CURT:NUMBER
          ++  CAD                                       ::
            |=  {N/{X/@ Z/@} M/{X/@ Z/@} D/{X/@ Z/@}}
            =+  ^=  XX
                ;:  MUL  4  Z.D
                  %-  SQR  %-  ABS:SI
                  %+  DIF:SI
                    (SUN:SI (MUL X.M X.N))
                  (SUN:SI (MUL Z.M Z.N))
                ==
            =+  ^=  ZZ
                ;:  MUL  4  X.D
                  %-  SQR  %-  ABS:SI
                  %+  DIF:SI
                    (SUN:SI (MUL X.M Z.N))
                  (SUN:SI (MUL Z.M X.N))
                ==
            [(SIT.FQ XX) (SIT.FQ ZZ)]
          ::                                            ::  ++CUB:CURT:NUMBER
          ++  CUB                                       ::
            |=  {X/@ Z/@}
            =+  ^=  XX
                %+  MUL
                  %-  SQR  %-  ABS:SI
                  (DIF:SI (SUN:SI X) (SUN:SI Z))
                (SQR (ADD X Z))
            =+  ^=  ZZ
                ;:  MUL  4  X  Z
                  :(ADD (SQR X) :(MUL P X Z) (SQR Z))
                ==
            [(SIT.FQ XX) (SIT.FQ ZZ)]
          --  ::
        ==
    =+  ONE=[B 1]
    =+  I=253
    =+  R=ONE
    =+  S=(CUB ONE)
    |-
    ?:  =(I 0)
      =+  X=(CUB R)
      (SIT.FQ (MUL -.X (INV +.X)))
    =+  M=(RSH 0 I A)
    ?:  =(0 (MOD M 2))
       $(I (DEC I), S (CAD R S ONE), R (CUB R))
    $(I (DEC I), R (CAD R S ONE), S (CUB S))
  ::                                                    ::  ++GA:NUMBER
  ++  GA                                                ::  GF (BEX P.A)
    |=  A/{P/@ Q/@ R/@}                                 ::  DIM POLY GEN
    =+  SI=(BEX P.A)
    =+  MA=(DEC SI)
    =>  |%
        ::                                              ::  ++DIF:GA:NUMBER
        ++  DIF                                         ::  ADD AND SUB
          |=  {B/@ C/@}
          ~|  [%DIF-GA A]
          ?>  &((LTH B SI) (LTH C SI))
          (MIX B C)
        ::                                              ::  ++DUB:GA:NUMBER
        ++  DUB                                         ::  MUL BY X
          |=  B/@
          ~|  [%DUB-GA A]
          ?>  (LTH B SI)
          ?:  =(1 (CUT 0 [(DEC P.A) 1] B))
            (DIF (SIT Q.A) (SIT (LSH 0 1 B)))
          (LSH 0 1 B)
        ::                                              ::  ++PRO:GA:NUMBER
        ++  PRO                                         ::  SLOW MULTIPLY
          |=  {B/@ C/@}
          ?:  =(0 B)
            0
          ?:  =(1 (DIS 1 B))
            (DIF C $(B (RSH 0 1 B), C (DUB C)))
          $(B (RSH 0 1 B), C (DUB C))
        ::                                              ::  ++TOE:GA:NUMBER
        ++  TOE                                         ::  EXP+LOG TABLES
          =+  ^=  NU
              |=  {B/@ C/@}
              ^-  (MAP @ @)
              =+  D=*(MAP @ @)
              |-
              ?:  =(0 C)
                D
              %=  $
                C  (DEC C)
                D  (~(PUT BY D) C B)
              ==
          =+  [P=(NU 0 (BEX P.A)) Q=(NU MA MA)]
          =+  [B=1 C=0]
          |-  ^-  {P/(MAP @ @) Q/(MAP @ @)}
          ?:  =(MA C)
            [(~(PUT BY P) C B) Q]
          %=  $
            B  (PRO R.A B)
            C  +(C)
            P  (~(PUT BY P) C B)
            Q  (~(PUT BY Q) B C)
          ==
        ::                                              ::  ++SIT:GA:NUMBER
        ++  SIT                                         ::  REDUCE
          |=  B/@
          (MOD B (BEX P.A))
        --  ::
    =+  TOE
    |%
    ::                                                  ::  ++FRA:GA:NUMBER
    ++  FRA                                             ::  DIVIDE
      |=  {B/@ C/@}
      (PRO B (INV C))
    ::                                                  ::  ++INV:GA:NUMBER
    ++  INV                                             ::  INVERT
      |=  B/@
      ~|  [%INV-GA A]
      =+  C=(~(GET BY Q) B)
      ?~  C  !!
      =+  D=(~(GET BY P) (SUB MA U.C))
      (NEED D)
    ::                                                  ::  ++POW:GA:NUMBER
    ++  POW                                             ::  EXPONENT
      |=  {B/@ C/@}
      =+  [D=1 E=C F=0]
      |-
      ?:  =(P.A F)
        D
      ?:  =(1 (CUT 0 [F 1] B))
        $(D (PRO D E), E (PRO E E), F +(F))
      $(E (PRO E E), F +(F))
    ::                                                  ::  ++PRO:GA:NUMBER
    ++  PRO                                             ::  MULTIPLY
      |=  {B/@ C/@}
      ~|  [%PRO-GA A]
      =+  D=(~(GET BY Q) B)
      ?~  D  0
      =+  E=(~(GET BY Q) C)
      ?~  E  0
      =+  F=(~(GET BY P) (MOD (ADD U.D U.E) MA))
      (NEED F)
    --  ::GA
  --  ::NUMBER
::                                                      ::::
::::                      ++CRYPTO                      ::  (2B) CRYPTOGRAPHY
  ::                                                    ::::
++  CRYPTO  ^?
  =,  AMES
  =,  NUMBER
  |%
  ::                                                    ::
  ::::                    ++AES:CRYPTO                  ::  (2B1) AES, ALL SIZES
    ::                                                  ::::
  ++  AES    !.
    ~%  %AES  ..IS  ~
    |%
    ::                                                  ::  ++AHEM:AES:CRYPTO
    ++  AHEM                                            ::  KERNEL STATE
      |=  {NNK/@ NNB/@ NNR/@}
      =>
        =+  =>  [GR=(GA 8 0X11B 3) FEW==>(FE .(A 5))]
            [PRO=PRO.GR DIF=DIF.GR POW=POW.GR ROR=ROR.FEW]
        =>  |%                                          ::
            ++  CIPA  $_  ^?                            ::  AES PARAMS
              |%
              ++  CO  *{P/@ Q/@ R/@ S/@}                ::  COLUMN COEFFICIENTS
              ++  IX  |~(A/@ *@)                        ::  KEY INDEX
              ++  RO  *{P/@ Q/@ R/@ S/@}                ::  ROW SHIFTS
              ++  SU  *@                                ::  S-BOX
              --  ::CIPA
            --  ::
        |%
        ::                                              ::  ++PEN:AHEM:AES:
        ++  PEN                                         ::  ENCRYPT
          ^-  CIPA
          |%
          ::                                            ::  ++CO:PEN:AHEM:AES:
          ++  CO                                        ::  COLUMN COEFFICIENTS
            [0X2 0X3 1 1]
          ::                                            ::  ++IX:PEN:AHEM:AES:
          ++  IX                                        ::  KEY INDEX
            |~(A/@ A)
          ::                                            ::  ++RO:PEN:AHEM:AES:
          ++  RO                                        ::  ROW SHIFTS
            [0 1 2 3]
          ::                                            ::  ++SU:PEN:AHEM:AES:
          ++  SU                                        ::  S-BOX
            0X16BB.54B0.0F2D.9941.6842.E6BF.0D89.A18C.
              DF28.55CE.E987.1E9B.948E.D969.1198.F8E1.
              9E1D.C186.B957.3561.0EF6.0348.66B5.3E70.
              8A8B.BD4B.1F74.DDE8.C6B4.A61C.2E25.78BA.
              08AE.7A65.EAF4.566C.A94E.D58D.6D37.C8E7.
              79E4.9591.62AC.D3C2.5C24.0649.0A3A.32E0.
              DB0B.5EDE.14B8.EE46.8890.2A22.DC4F.8160.
              7319.5D64.3D7E.A7C4.1744.975F.EC13.0CCD.
              D2F3.FF10.21DA.B6BC.F538.9D92.8F40.A351.
              A89F.3C50.7F02.F945.8533.4D43.FBAA.EFD0.
              CF58.4C4A.39BE.CB6A.5BB1.FC20.ED00.D153.
              842F.E329.B3D6.3B52.A05A.6E1B.1A2C.8309.
              75B2.27EB.E280.1207.9A05.9618.C323.C704.
              1531.D871.F1E5.A534.CCF7.3F36.2693.FDB7.
              C072.A49C.AFA2.D4AD.F047.59FA.7DC9.82CA.
              76AB.D7FE.2B67.0130.C56F.6BF2.7B77.7C63
          --
        ::                                              ::  ++PIN:AHEM:AES:
        ++  PIN                                         ::  DECRYPT
          ^-  CIPA
          |%
          ::                                            ::  ++CO:PIN:AHEM:AES:
          ++  CO                                        ::  COLUMN COEFFICIENTS
            [0XE 0XB 0XD 0X9]
          ::                                            ::  ++IX:PIN:AHEM:AES:
          ++  IX                                        ::  KEY INDEX
            |~(A/@ (SUB NNR A))
          ::                                            ::  ++RO:PIN:AHEM:AES:
          ++  RO                                        ::  ROW SHIFTS
            [0 3 2 1]
          ::                                            ::  ++SU:PIN:AHEM:AES:
          ++  SU                                        ::  S-BOX
            0X7D0C.2155.6314.69E1.26D6.77BA.7E04.2B17.
              6199.5383.3CBB.EBC8.B0F5.2AAE.4D3B.E0A0.
              EF9C.C993.9F7A.E52D.0D4A.B519.A97F.5160.
              5FEC.8027.5910.12B1.31C7.0788.33A8.DD1F.
              F45A.CD78.FEC0.DB9A.2079.D2C6.4B3E.56FC.
              1BBE.18AA.0E62.B76F.89C5.291D.711A.F147.
              6EDF.751C.E837.F9E2.8535.ADE7.2274.AC96.
              73E6.B4F0.CECF.F297.EADC.674F.4111.913A.
              6B8A.1301.03BD.AFC1.020F.3FCA.8F1E.2CD0.
              0645.B3B8.0558.E4F7.0AD3.BC8C.00AB.D890.
              849D.8DA7.5746.155E.DAB9.EDFD.5048.706C.
              92B6.655D.CC5C.A4D4.1698.6886.64F6.F872.
              25D1.8B6D.49A2.5B76.B224.D928.66A1.2E08.
              4EC3.FA42.0B95.4CEE.3D23.C2A6.3294.7B54.
              CBE9.DEC4.4443.8E34.87FF.2F9B.8239.E37C.
              FBD7.F381.9EA3.40BF.38A5.3630.D56A.0952
          --
        ::                                              ::  ++MCOL:AHEM:AES:
        ++  MCOL                                        ::
          |=  {A/(LIST @) B/{P/@ Q/@ R/@ S/@}}
          ^-  (LIST @)
          =+  C=[P=*@ Q=*@ R=*@ S=*@]
          |-  ^-  (LIST @)
          ?~  A  ~
          =>  .(P.C (CUT 3 [0 1] I.A))
          =>  .(Q.C (CUT 3 [1 1] I.A))
          =>  .(R.C (CUT 3 [2 1] I.A))
          =>  .(S.C (CUT 3 [3 1] I.A))
          :_  $(A T.A)
          %+  REP  3
          %+  TURN
            %-  LIMO
            :~  [[P.C P.B] [Q.C Q.B] [R.C R.B] [S.C S.B]]
                [[P.C S.B] [Q.C P.B] [R.C Q.B] [S.C R.B]]
                [[P.C R.B] [Q.C S.B] [R.C P.B] [S.C Q.B]]
                [[P.C Q.B] [Q.C R.B] [R.C S.B] [S.C P.B]]
            ==
          |=  {A/{@ @} B/{@ @} C/{@ @} D/{@ @}}
          :(DIF (PRO A) (PRO B) (PRO C) (PRO D))
        ::                                              ::  ++PODE:AHEM:AES:
        ++  PODE                                        ::  EXPLODE TO BLOCK
          |=  {A/BLOQ B/@ C/@}  ^-  (LIST @)
          =+  D=(RIP A C)
          =+  M=(MET A C)
          |-
          ?:  =(M B)
            D
          $(M +(M), D (WELD D (LIMO [0 ~])))
        ::                                              ::  ++SUBE:AHEM:AES:
        ++  SUBE                                        ::  S-BOX WORD
          |=  {A/@ B/@}  ^-  @
          (REP 3 (TURN (PODE 3 4 A) |=(C/@ (CUT 3 [C 1] B))))
        --  ::
      |%
      ::                                                ::  ++BE:AHEM:AES:CRYPTO
      ++  BE                                            ::  BLOCK CIPHER
        |=  {A/? B/@ C/@H}  ^-  @UXH
        ~|  %BE-AESC
        =>  %=    .
                +
              =>  +
              |%
              ::                                        ::  ++ANKH:BE:AHEM:AES:
              ++  ANKH                                  ::
                |=  {A/CIPA B/@ C/@}
                (PODE 5 NNB (CUT 5 [(MUL (IX.A B) NNB) NNB] C))
              ::                                        ::  ++SARK:BE:AHEM:AES:
              ++  SARK                                  ::
                |=  {C/(LIST @) D/(LIST @)}
                ^-  (LIST @)
                ?~  C  ~
                ?~  D  !!
                [(MIX I.C I.D) $(C T.C, D T.D)]
              ::                                        ::  ++SROW:BE:AHEM:AES:
              ++  SROW                                  ::
                |=  {A/CIPA B/(LIST @)}  ^-  (LIST @)
                =+  [C=0 D=~ E=RO.A]
                |-
                ?:  =(C NNB)
                  D
                :_  $(C +(C))
                %+  REP  3
                %+  TURN
                  (LIMO [0 P.E] [1 Q.E] [2 R.E] [3 S.E] ~)
                |=  {F/@ G/@}
                (CUT 3 [F 1] (SNAG (MOD (ADD G C) NNB) B))
              ::                                        ::  ++SUBS:BE:AHEM:AES:
              ++  SUBS                                  ::
                |=  {A/CIPA B/(LIST @)}  ^-  (LIST @)
                ?~  B  ~
                [(SUBE I.B SU.A) $(B T.B)]
              --
            ==
        =+  [D=?:(A PEN PIN) E=(PODE 5 NNB C) F=1]
        =>  .(E (SARK E (ANKH D 0 B)))
        |-
        ?.  =(NNR F)
          =>  .(E (SUBS D E))
          =>  .(E (SROW D E))
          =>  .(E (MCOL E CO.D))
          =>  .(E (SARK E (ANKH D F B)))
          $(F +(F))
        =>  .(E (SUBS D E))
        =>  .(E (SROW D E))
        =>  .(E (SARK E (ANKH D NNR B)))
        (REP 5 E)
      ::                                                ::  ++EX:AHEM:AES:CRYPTO
      ++  EX                                            ::  KEY EXPAND
        |=  A/@I  ^-  @
        =+  [B=A C=0 D=SU:PEN I=NNK]
        |-
        ?:  =(I (MUL NNB +(NNR)))
          B
        =>  .(C (CUT 5 [(DEC I) 1] B))
        =>  ?:  =(0 (MOD I NNK))
              =>  .(C (ROR 3 1 C))
              =>  .(C (SUBE C D))
              .(C (MIX C (POW (DEC (DIV I NNK)) 2)))
            ?:  &((GTH NNK 6) =(4 (MOD I NNK)))
              .(C (SUBE C D))
            .
        =>  .(C (MIX C (CUT 5 [(SUB I NNK) 1] B)))
        =>  .(B (CAN 5 [I B] [1 C] ~))
        $(I +(I))
      ::                                                ::  ++IX:AHEM:AES:CRYPTO
      ++  IX                                            ::  KEY EXPAND, INV
        |=  A/@  ^-  @
        =+  [I=1 J=*@ B=*@ C=CO:PIN]
        |-
        ?:  =(NNR I)
          A
        =>  .(B (CUT 7 [I 1] A))
        =>  .(B (REP 5 (MCOL (PODE 5 4 B) C)))
        =>  .(J (SUB NNR I))
        %=    $
            I  +(I)
            A
          %+  CAN  7
          :~  [I (CUT 7 [0 I] A)]
              [1 B]
              [J (CUT 7 [+(I) J] A)]
          ==
        ==
      --
    ::                                                  ::  ++ECBA:AES:CRYPTO
    ++  ECBA                                            ::  AES-128 ECB
      ~%  %ECBA  +>  ~
      |_  KEY/@H
      ::                                                ::  ++EN:ECBA:AES:CRYPTO
      ++  EN                                            ::  ENCRYPT
        ~/  %EN
        |=  BLK/@H  ^-  @UXH
        =+  (AHEM 4 4 10)
        =:
          KEY  (~(NET FE 7) KEY)
          BLK  (~(NET FE 7) BLK)
        ==
        %-  ~(NET FE 7)
        (BE & (EX KEY) BLK)
      ::                                                ::  ++DE:ECBA:AES:CRYPTO
      ++  DE                                            ::  DECRYPT
        ~/  %DE
        |=  BLK/@H  ^-  @UXH
        =+  (AHEM 4 4 10)
        =:
          KEY  (~(NET FE 7) KEY)
          BLK  (~(NET FE 7) BLK)
        ==
        %-  ~(NET FE 7)
        (BE | (IX (EX KEY)) BLK)
      --  ::ECBA
    ::                                                  ::  ++ECBB:AES:CRYPTO
    ++  ECBB                                            ::  AES-192 ECB
      ~%  %ECBB  +>  ~
      |_  KEY/@I
      ::                                                ::  ++EN:ECBB:AES:CRYPTO
      ++  EN                                            ::  ENCRYPT
        ~/  %EN
        |=  BLK/@H  ^-  @UXH
        =+  (AHEM 6 4 12)
        =:
          KEY  (RSH 6 1 (~(NET FE 8) KEY))
          BLK  (~(NET FE 7) BLK)
        ==
        %-  ~(NET FE 7)
        (BE & (EX KEY) BLK)
      ::                                                ::  ++DE:ECBB:AES:CRYPTO
      ++  DE                                            ::  DECRYPT
        ~/  %DE
        |=  BLK/@H  ^-  @UXH
        =+  (AHEM 6 4 12)
        =:
          KEY  (RSH 6 1 (~(NET FE 8) KEY))
          BLK  (~(NET FE 7) BLK)
        ==
        %-  ~(NET FE 7)
        (BE | (IX (EX KEY)) BLK)
      --  ::ECBB
    ::                                                  ::  ++ECBC:AES:CRYPTO
    ++  ECBC                                            ::  AES-256 ECB
      ~%  %ECBC  +>  ~
      |_  KEY/@I
      ::                                                ::  ++EN:ECBC:AES:CRYPTO
      ++  EN                                            ::  ENCRYPT
        ~/  %EN
        |=  BLK/@H  ^-  @UXH
        =+  (AHEM 8 4 14)
        =:
          KEY  (~(NET FE 8) KEY)
          BLK  (~(NET FE 7) BLK)
        ==
        %-  ~(NET FE 7)
        (BE & (EX KEY) BLK)
      ::                                                ::  ++DE:ECBC:AES:CRYPTO
      ++  DE                                            ::  DECRYPT
        ~/  %DE
        |=  BLK/@H  ^-  @UXH
        =+  (AHEM 8 4 14)
        =:
          KEY  (~(NET FE 8) KEY)
          BLK  (~(NET FE 7) BLK)
        ==
        %-  ~(NET FE 7)
        (BE | (IX (EX KEY)) BLK)
      --  ::ECBC
    ::                                                  ::  ++CBCA:AES:CRYPTO
    ++  CBCA                                            ::  AES-128 CBC
      ~%  %CBCA  +>  ~
      |_  {KEY/@H PRV/@H}
      ::                                                ::  ++EN:CBCA:AES:CRYPTO
      ++  EN                                            ::  ENCRYPT
        ~/  %EN
        |=  TXT/@  ^-  @UX
        =+  PTS=?:(=(TXT 0) `(LIST @)`~[0] (FLOP (RIP 7 TXT)))
        =|  CTS/(LIST @)
        %+  REP  7
        ::  LOGICALLY, FLOP TWICE HERE
        |-  ^-  (LIST @)
        ?~  PTS
          CTS
        =+  CPH=(~(EN ECBA KEY) (MIX PRV I.PTS))
        %=  $
          CTS  [CPH CTS]
          PTS  T.PTS
          PRV  CPH
        ==
      ::                                                ::  ++DE:CBCA:AES:CRYPTO
      ++  DE                                            ::  DECRYPT
        ~/  %DE
        |=  TXT/@  ^-  @UX
        =+  CTS=?:(=(TXT 0) `(LIST @)`~[0] (FLOP (RIP 7 TXT)))
        =|  PTS/(LIST @)
        %+  REP  7
        ::  LOGICALLY, FLOP TWICE HERE
        |-  ^-  (LIST @)
        ?~  CTS
          PTS
        =+  PLN=(MIX PRV (~(DE ECBA KEY) I.CTS))
        %=  $
          PTS  [PLN PTS]
          CTS  T.CTS
          PRV  I.CTS
        ==
      --  ::CBCA
    ::                                                  ::  ++CBCB:AES:CRYPTO
    ++  CBCB                                            ::  AES-192 CBC
      ~%  %CBCB  +>  ~
      |_  {KEY/@I PRV/@H}
      ::                                                ::  ++EN:CBCB:AES:CRYPTO
      ++  EN                                            ::  ENCRYPT
        ~/  %EN
        |=  TXT/@  ^-  @UX
        =+  PTS=?:(=(TXT 0) `(LIST @)`~[0] (FLOP (RIP 7 TXT)))
        =|  CTS/(LIST @)
        %+  REP  7
        ::  LOGICALLY, FLOP TWICE HERE
        |-  ^-  (LIST @)
        ?~  PTS
          CTS
        =+  CPH=(~(EN ECBB KEY) (MIX PRV I.PTS))
        %=  $
          CTS  [CPH CTS]
          PTS  T.PTS
          PRV  CPH
        ==
      ::                                                ::  ++DE:CBCB:AES:CRYPTO
      ++  DE                                            ::  DECRYPT
        ~/  %DE
        |=  TXT/@  ^-  @UX
        =+  CTS=?:(=(TXT 0) `(LIST @)`~[0] (FLOP (RIP 7 TXT)))
        =|  PTS/(LIST @)
        %+  REP  7
        ::  LOGICALLY, FLOP TWICE HERE
        |-  ^-  (LIST @)
        ?~  CTS
          PTS
        =+  PLN=(MIX PRV (~(DE ECBB KEY) I.CTS))
        %=  $
          PTS  [PLN PTS]
          CTS  T.CTS
          PRV  I.CTS
        ==
      --  ::CBCB
    ::                                                  ::  ++CBCC:AES:CRYPTO
    ++  CBCC                                            ::  AES-256 CBC
      ~%  %CBCC  +>  ~
      |_  {KEY/@I PRV/@H}
      ::                                                ::  ++EN:CBCC:AES:CRYPTO
      ++  EN                                            ::  ENCRYPT
        ~/  %EN
        |=  TXT/@  ^-  @UX
        =+  PTS=?:(=(TXT 0) `(LIST @)`~[0] (FLOP (RIP 7 TXT)))
        =|  CTS/(LIST @)
        %+  REP  7
        ::  LOGICALLY, FLOP TWICE HERE
        |-  ^-  (LIST @)
        ?~  PTS
          CTS
        =+  CPH=(~(EN ECBC KEY) (MIX PRV I.PTS))
        %=  $
          CTS  [CPH CTS]
          PTS  T.PTS
          PRV  CPH
        ==
      ::                                                ::  ++DE:CBCC:AES:CRYPTO
      ++  DE                                            ::  DECRYPT
        ~/  %DE
        |=  TXT/@  ^-  @UX
        =+  CTS=?:(=(TXT 0) `(LIST @)`~[0] (FLOP (RIP 7 TXT)))
        =|  PTS/(LIST @)
        %+  REP  7
        ::  LOGICALLY, FLOP TWICE HERE
        |-  ^-  (LIST @)
        ?~  CTS
          PTS
        =+  PLN=(MIX PRV (~(DE ECBC KEY) I.CTS))
        %=  $
          PTS  [PLN PTS]
          CTS  T.CTS
          PRV  I.CTS
        ==
      --  ::CBCC
    ::                                                  ::  ++INC:AES:CRYPTO
    ++  INC                                             ::  INC. LOW BLOQ
      |=  {MOD/BLOQ CTR/@H}
      ^-  @UXH
      =+  BQS=(RIP MOD CTR)
      ?~  BQS  0X1
      %+  REP  MOD
      [(~(SUM FE MOD) I.BQS 1) T.BQS]
    ::                                                  ::  ++CTRA:AES:CRYPTO
    ++  CTRA                                            ::  AES-128 CTR
      ~%  %CTRA  +>  ~
      |_  {KEY/@H MOD/BLOQ LEN/@ CTR/@H}
      ::                                                ::  ++EN:CTRA:AES:CRYPTO
      ++  EN                                            ::  ENCRYPT
        ~/  %EN
        |=  TXT/@
        ^-  @UX
        =/  ENCRYPT  ~(EN ECBA KEY)
        =/  BLOCKS  (ADD (DIV LEN 16) ?:(=((^MOD LEN 16) 0) 0 1))
        ?>  (GTE LEN (MET 3 TXT))
        %+  MIX  TXT
        %^  RSH  3  (SUB (MUL 16 BLOCKS) LEN)
        %+  REP  7
        =|  SEED=(LIST @UX)
        |-  ^+  SEED
        ?:  =(BLOCKS 0)  SEED
        %=  $
          SEED    [(ENCRYPT CTR) SEED]
          CTR     (INC MOD CTR)
          BLOCKS  (DEC BLOCKS)
        ==
      ::                                                ::  ++DE:CTRA:AES:CRYPTO
      ++  DE                                            ::  DECRYPT
        EN
      --  ::CTRA
    ::                                                  ::  ++CTRB:AES:CRYPTO
    ++  CTRB                                            ::  AES-192 CTR
      ~%  %CTRB  +>  ~
      |_  {KEY/@I MOD/BLOQ LEN/@ CTR/@H}
      ::                                                ::  ++EN:CTRB:AES:CRYPTO
      ++  EN
        ~/  %EN
        |=  TXT/@
        ^-  @UX
        =/  ENCRYPT  ~(EN ECBB KEY)
        =/  BLOCKS  (ADD (DIV LEN 16) ?:(=((^MOD LEN 16) 0) 0 1))
        ?>  (GTE LEN (MET 3 TXT))
        %+  MIX  TXT
        %^  RSH  3  (SUB (MUL 16 BLOCKS) LEN)
        %+  REP  7
        =|  SEED=(LIST @UX)
        |-  ^+  SEED
        ?:  =(BLOCKS 0)  SEED
        %=  $
          SEED    [(ENCRYPT CTR) SEED]
          CTR     (INC MOD CTR)
          BLOCKS  (DEC BLOCKS)
        ==
      ::                                                ::  ++DE:CTRB:AES:CRYPTO
      ++  DE                                            ::  DECRYPT
        EN
      --  ::CTRB
    ::                                                  ::  ++CTRC:AES:CRYPTO
    ++  CTRC                                            ::  AES-256 CTR
      ~%  %CTRC  +>  ~
      |_  {KEY/@I MOD/BLOQ LEN/@ CTR/@H}
      ::                                                ::  ++EN:CTRC:AES:CRYPTO
      ++  EN                                            ::  ENCRYPT
        ~/  %EN
        |=  TXT/@
        ^-  @UX
        =/  ENCRYPT  ~(EN ECBC KEY)
        =/  BLOCKS  (ADD (DIV LEN 16) ?:(=((^MOD LEN 16) 0) 0 1))
        ?>  (GTE LEN (MET 3 TXT))
        %+  MIX  TXT
        %^  RSH  3  (SUB (MUL 16 BLOCKS) LEN)
        %+  REP  7
        =|  SEED=(LIST @UX)
        |-  ^+  SEED
        ?:  =(BLOCKS 0)  SEED
        %=  $
          SEED    [(ENCRYPT CTR) SEED]
          CTR     (INC MOD CTR)
          BLOCKS  (DEC BLOCKS)
        ==
      ::                                                ::  ++DE:CTRC:AES:CRYPTO
      ++  DE                                            ::  DECRYPT
        EN
      --  ::CTRC
    ::                                                  ::  ++DOUB:AES:CRYPTO
    ++  DOUB                                            ::  DOUBLE 128-BIT
      |=  ::  STRING MOD FINITE
          ::
          STR/@H
      ::
      ::  FIELD (SEE SPEC)
      ::
      ^-  @UXH
      %-  ~(SIT FE 7)
      ?.  =((XEB STR) 128)
        (LSH 0 1 STR)
      (MIX 0X87 (LSH 0 1 STR))
    ::                                                  ::  ++MPAD:AES:CRYPTO
    ++  MPAD                                            ::
      |=  {OCT/@ TXT/@}
      ::
      ::  PAD MESSAGE TO MULTIPLE OF 128 BITS
      ::  BY APPENDING 1, THEN 0S
      ::  THE SPEC IS UNCLEAR, BUT IT MUST BE OCTET BASED
      ::  TO MATCH THE TEST VECTORS
      ::
      ^-  @UX
      =+  PAD=(MOD OCT 16)
      ?:  =(PAD 0)  0X8000.0000.0000.0000.0000.0000.0000.0000
      (LSH 3 (SUB 15 PAD) (MIX 0X80 (LSH 3 1 TXT)))
    ::                                                  ::  ++SUBA:AES:CRYPTO
    ++  SUBA                                            ::  AES-128 SUBKEYS
      |=  KEY/@H
      =+  L=(~(EN ECBA KEY) 0)
      =+  K1=(DOUB L)
      =+  K2=(DOUB K1)
      ^-  {@UX @UX}
      [K1 K2]
    ::                                                  ::  ++SUBB:AES:CRYPTO
    ++  SUBB                                            ::  AES-192 SUBKEYS
      |=  KEY/@I
      =+  L=(~(EN ECBB KEY) 0)
      =+  K1=(DOUB L)
      =+  K2=(DOUB K1)
      ^-  {@UX @UX}
      [K1 K2]
    ::                                                  ::  ++SUBC:AES:CRYPTO
    ++  SUBC                                            ::  AES-256 SUBKEYS
      |=  KEY/@I
      =+  L=(~(EN ECBC KEY) 0)
      =+  K1=(DOUB L)
      =+  K2=(DOUB K1)
      ^-  {@UX @UX}
      [K1 K2]
    ::                                                  ::  ++MACA:AES:CRYPTO
    ++  MACA                                            ::  AES-128 CMAC
      ~/  %MACA
      |=  {KEY/@H OCT/(UNIT @) TXT/@}
      ^-  @UX
      =+  [SUB=(SUBA KEY) LEN=?~(OCT (MET 3 TXT) U.OCT)]
      =+  ^=  PDT
        ?:  &(=((MOD LEN 16) 0) !=(LEN 0))
          [& TXT]
        [| (MPAD LEN TXT)]
      =+  ^=  MAC
        %-  ~(EN CBCA KEY 0)
        %+  MIX  +.PDT
        ?-  -.PDT
          %&  -.SUB
          %|  +.SUB
        ==
      ::  SPEC SAYS MSBS, LSBS MATCH TEST VECTORS
      ::
      (~(SIT FE 7) MAC)
    ::                                                  ::  ++MACB:AES:CRYPTO
    ++  MACB                                            ::  AES-192 CMAC
      ~/  %MACB
      |=  {KEY/@I OCT/(UNIT @) TXT/@}
      ^-  @UX
      =+  [SUB=(SUBB KEY) LEN=?~(OCT (MET 3 TXT) U.OCT)]
      =+  ^=  PDT
        ?:  &(=((MOD LEN 16) 0) !=(LEN 0))
          [& TXT]
        [| (MPAD LEN TXT)]
      =+  ^=  MAC
        %-  ~(EN CBCB KEY 0)
        %+  MIX  +.PDT
        ?-  -.PDT
          %&  -.SUB
          %|  +.SUB
        ==
      ::  SPEC SAYS MSBS, LSBS MATCH TEST VECTORS
      ::
      (~(SIT FE 7) MAC)
    ::                                                  ::  ++MACC:AES:CRYPTO
    ++  MACC                                            :: AES-256 CMAC
      ~/  %MACC
      |=  {KEY/@I OCT/(UNIT @) TXT/@}
      ^-  @UX
      =+  [SUB=(SUBC KEY) LEN=?~(OCT (MET 3 TXT) U.OCT)]
      =+  ^=  PDT
        ?:  &(=((MOD LEN 16) 0) !=(LEN 0))
          [& TXT]
        [| (MPAD LEN TXT)]
      =+  ^=  MAC
        %-  ~(EN CBCC KEY 0)
        %+  MIX  +.PDT
        ?-  -.PDT
          %&  -.SUB
          %|  +.SUB
        ==
      ::  SPEC SAYS MSBS, LSBS MATCH TEST VECTORS
      ::
      (~(SIT FE 7) MAC)
    ::                                                  ::  ++S2VA:AES:CRYPTO
    ++  S2VA                                            ::  AES-128 S2V
      ~/  %S2VA
      |=  {KEY/@H ADS/(LIST @)}
      =+  RES=(MACA KEY `16 0X0)
      %^  MACA  KEY  ~
      |-  ^-  @UXH
      ?~  ADS  (MACA KEY `16 0X1)
      ?~  T.ADS
        ?:  (GTE (XEB I.ADS) 128)
          (MIX I.ADS RES)
        %+  MIX
          (DOUB RES)
          (MPAD (MET 3 I.ADS) I.ADS)
      %=  $
        RES  %+  MIX
               (DOUB RES)
               (MACA KEY ~ I.ADS)
        ADS  T.ADS
      ==
    ::                                                  ::  ++S2VB:AES:CRYPTO
    ++  S2VB                                            ::  AES-192 S2V
      ~/  %S2VB
      |=  {KEY/@I ADS/(LIST @)}
      =+  RES=(MACB KEY `16 0X0)
      %^  MACB  KEY  ~
      |-  ^-  @UXH
      ?~  ADS  (MACB KEY `16 0X1)
      ?~  T.ADS
        ?:  (GTE (XEB I.ADS) 128)
          (MIX I.ADS RES)
        %+  MIX
          (DOUB RES)
          (MPAD (MET 3 I.ADS) I.ADS)
      %=  $
        RES  %+  MIX
               (DOUB RES)
               (MACB KEY ~ I.ADS)
        ADS  T.ADS
      ==
    ::                                                  ::  ++S2VC:AES:CRYPTO
    ++  S2VC                                            ::  AES-256 S2V
      ~/  %S2VC
      |=  {KEY/@I ADS/(LIST @)}
      =+  RES=(MACC KEY `16 0X0)
      %^  MACC  KEY  ~
      |-  ^-  @UXH
      ?~  ADS  (MACC KEY `16 0X1)
      ?~  T.ADS
        ?:  (GTE (XEB I.ADS) 128)
          (MIX I.ADS RES)
        %+  MIX
          (DOUB RES)
          (MPAD (MET 3 I.ADS) I.ADS)
      %=  $
        RES  %+  MIX
               (DOUB RES)
               (MACC KEY ~ I.ADS)
        ADS  T.ADS
      ==
    ::                                                  ::  ++SIVA:AES:CRYPTO
    ++  SIVA                                            ::  AES-128 SIV
      ~%  %SIVA  +>  ~
      |_  {KEY/@I VEC/(LIST @)}
      ::                                                ::  ++EN:SIVA:AES:CRYPTO
      ++  EN                                            ::  ENCRYPT
        ~/  %EN
        |=  TXT/@
        ^-  (TREL @UXH @UD @UX)
        =+  [K1=(RSH 7 1 KEY) K2=(END 7 1 KEY)]
        =+  IV=(S2VA K1 (WELD VEC (LIMO ~[TXT])))
        =+  LEN=(MET 3 TXT)
        =*  HIB  (DIS IV 0XFFFF.FFFF.FFFF.FFFF.7FFF.FFFF.7FFF.FFFF)
        :+
          IV
          LEN
        (~(EN CTRA K2 7 LEN HIB) TXT)
      ::                                                ::  ++DE:SIVA:AES:CRYPTO
      ++  DE                                            ::  DECRYPT
        ~/  %DE
        |=  {IV/@H LEN/@ TXT/@}
        ^-  (UNIT @UX)
        =+  [K1=(RSH 7 1 KEY) K2=(END 7 1 KEY)]
        =*  HIB  (DIS IV 0XFFFF.FFFF.FFFF.FFFF.7FFF.FFFF.7FFF.FFFF)
        =+  ^=  PLN
          (~(DE CTRA K2 7 LEN HIB) TXT)
        ?.  =((S2VA K1 (WELD VEC (LIMO ~[PLN]))) IV)
          ~
        `PLN
      --  ::SIVA
    ::                                                  ::  ++SIVB:AES:CRYPTO
    ++  SIVB                                            ::  AES-192 SIV
      ~%  %SIVB  +>  ~
      |_  {KEY/@J VEC/(LIST @)}
      ::                                                ::  ++EN:SIVB:AES:CRYPTO
      ++  EN                                            ::  ENCRYPT
        ~/  %EN
        |=  TXT/@
        ^-  (TREL @UXH @UD @UX)
        =+  [K1=(RSH 5 3 KEY) K2=(END 5 3 KEY)]
        =+  IV=(S2VB K1 (WELD VEC (LIMO ~[TXT])))
        =*  HIB  (DIS IV 0XFFFF.FFFF.FFFF.FFFF.7FFF.FFFF.7FFF.FFFF)
        =+  LEN=(MET 3 TXT)
        :+  IV
          LEN
        (~(EN CTRB K2 7 LEN HIB) TXT)
      ::                                                ::  ++DE:SIVB:AES:CRYPTO
      ++  DE                                            ::  DECRYPT
        ~/  %DE
        |=  {IV/@H LEN/@ TXT/@}
        ^-  (UNIT @UX)
        =+  [K1=(RSH 5 3 KEY) K2=(END 5 3 KEY)]
        =*  HIB  (DIS IV 0XFFFF.FFFF.FFFF.FFFF.7FFF.FFFF.7FFF.FFFF)
        =+  ^=  PLN
          (~(DE CTRB K2 7 LEN HIB) TXT)
        ?.  =((S2VB K1 (WELD VEC (LIMO ~[PLN]))) IV)
          ~
        `PLN
      --  ::SIVB
    ::                                                  ::  ++SIVC:AES:CRYPTO
    ++  SIVC                                            ::  AES-256 SIV
      ~%  %SIVC  +>  ~
      |_  {KEY/@J VEC/(LIST @)}
      ::                                                ::  ++EN:SIVC:AES:CRYPTO
      ++  EN                                            ::  ENCRYPT
        ~/  %EN
        |=  TXT/@
        ^-  (TREL @UXH @UD @UX)
        =+  [K1=(RSH 8 1 KEY) K2=(END 8 1 KEY)]
        =+  IV=(S2VC K1 (WELD VEC (LIMO ~[TXT])))
        =*  HIB  (DIS IV 0XFFFF.FFFF.FFFF.FFFF.7FFF.FFFF.7FFF.FFFF)
        =+  LEN=(MET 3 TXT)
        :+
          IV
          LEN
        (~(EN CTRC K2 7 LEN HIB) TXT)
      ::                                                ::  ++DE:SIVC:AES:CRYPTO
      ++  DE                                            ::  DECRYPT
        ~/  %DE
        |=  {IV/@H LEN/@ TXT/@}
        ^-  (UNIT @UX)
        =+  [K1=(RSH 8 1 KEY) K2=(END 8 1 KEY)]
        =*  HIB  (DIS IV 0XFFFF.FFFF.FFFF.FFFF.7FFF.FFFF.7FFF.FFFF)
        =+  ^=  PLN
          (~(DE CTRC K2 7 LEN HIB) TXT)
        ?.  =((S2VC K1 (WELD VEC (LIMO ~[PLN]))) IV)
          ~
        `PLN
      --  ::SIVC
    --
  ::                                                    ::
  ::::                    ++ED:CRYPTO                   ::  ED25519
    ::                                                  ::::
  ++  ED
    =>
      =+  =+  [B=256 Q=(SUB (BEX 255) 19)]
          =+  FQ=~(. FO Q)
          =+  ^=  L
               %+  ADD
                 (BEX 252)
               27.742.317.777.372.353.535.851.937.790.883.648.493
          =+  D=(DIF.FQ 0 (FRA.FQ 121.665 121.666))
          =+  II=(EXP.FQ (DIV (DEC Q) 4) 2)
          [B=B Q=Q FQ=FQ L=L D=D II=II]
      ~%  %COED  ..IS  ~
      |%
      ::                                                ::  ++NORM:ED:CRYPTO
      ++  NORM                                          ::
        |=(X/@ ?:(=(0 (MOD X 2)) X (SUB Q X)))
      ::                                                ::  ++XREC:ED:CRYPTO
      ++  XREC                                          ::  RECOVER X-COORD
        |=  Y/@  ^-  @
        =+  ^=  XX
            %+  MUL  (DIF.FQ (MUL Y Y) 1)
                     (INV.FQ +(:(MUL D Y Y)))
        =+  X=(EXP.FQ (DIV (ADD 3 Q) 8) XX)
        ?:  !=(0 (DIF.FQ (MUL X X) (SIT.FQ XX)))
          (NORM (PRO.FQ X II))
        (NORM X)
      ::                                                ::  ++WARD:ED:CRYPTO
      ++  WARD                                          ::  EDWARDS MULTIPLY
        |=  {PP/{@ @} QQ/{@ @}}  ^-  {@ @}
        =+  DP=:(PRO.FQ D -.PP -.QQ +.PP +.QQ)
        =+  ^=  XT
            %+  PRO.FQ
              %+  SUM.FQ
                (PRO.FQ -.PP +.QQ)
              (PRO.FQ -.QQ +.PP)
            (INV.FQ (SUM.FQ 1 DP))
        =+  ^=  YT
            %+  PRO.FQ
              %+  SUM.FQ
                (PRO.FQ +.PP +.QQ)
              (PRO.FQ -.PP -.QQ)
            (INV.FQ (DIF.FQ 1 DP))
        [XT YT]
      ::                                                ::  ++SCAM:ED:CRYPTO
      ++  SCAM                                          ::  SCALAR MULTIPLY
        |=  {PP/{@ @} E/@}  ^-  {@ @}
        ?:  =(0 E)
          [0 1]
        =+  QQ=$(E (DIV E 2))
        =>  .(QQ (WARD QQ QQ))
        ?:  =(1 (DIS 1 E))
          (WARD QQ PP)
        QQ
      ::                                                ::  ++ETCH:ED:CRYPTO
      ++  ETCH                                          ::  ENCODE POINT
        |=  PP/{@ @}  ^-  @
        (CAN 0 ~[[(SUB B 1) +.PP] [1 (DIS 1 -.PP)]])
      ::                                                ::  ++CURV:ED:CRYPTO
      ++  CURV                                          ::  POINT ON CURVE?
        |=  {X/@ Y/@}  ^-  ?
        .=  0
            %+  DIF.FQ
              %+  SUM.FQ
                (PRO.FQ (SUB Q (SIT.FQ X)) X)
              (PRO.FQ Y Y)
            (SUM.FQ 1 :(PRO.FQ D X X Y Y))
      ::                                                ::  ++DECO:ED:CRYPTO
      ++  DECO                                          ::  DECODE POINT
        |=  S/@  ^-  (UNIT {@ @})
        =+  Y=(CUT 0 [0 (DEC B)] S)
        =+  SI=(CUT 0 [(DEC B) 1] S)
        =+  X=(XREC Y)
        =>  .(X ?:(!=(SI (DIS 1 X)) (SUB Q X) X))
        =+  PP=[X Y]
        ?.  (CURV PP)
          ~
        [~ PP]
      ::                                                ::  ++BB:ED:CRYPTO
      ++  BB                                            ::
        =+  BBY=(PRO.FQ 4 (INV.FQ 5))
        [(XREC BBY) BBY]
      --  ::
    ~%  %ED  +  ~
    |%
    ::                                                  ::  ++PUCK:ED:CRYPTO
    ++  PUCK                                            ::  PUBLIC KEY
      ~/  %PUCK
      |=  SK/@I  ^-  @
      ?:  (GTH (MET 3 SK) 32)  !!
      =+  H=(SHAL (RSH 0 3 B) SK)
      =+  ^=  A
          %+  ADD
            (BEX (SUB B 2))
          (LSH 0 3 (CUT 0 [3 (SUB B 5)] H))
      =+  AA=(SCAM BB A)
      (ETCH AA)
    ::                                                  ::  ++SUCK:ED:CRYPTO
    ++  SUCK                                            ::  KEYPAIR FROM SEED
      |=  SE/@I  ^-  @UJ
      =+  PU=(PUCK SE)
      (CAN 0 ~[[B SE] [B PU]])
    ::                                                  ::  ++SHAR:ED:CRYPTO
    ++  SHAR                                            ::  CURVE25519 SECRET
      ~/  %SHAR
      |=  {PUB/@ SEK/@}
      ^-  @UX
      =+  EXP=(SHAL (RSH 0 3 B) (SUCK SEK))
      =.  EXP  (DIS EXP (CAN 0 ~[[3 0] [251 (FIL 0 251 1)]]))
      =.  EXP  (CON EXP (LSH 3 31 0B100.0000))
      =+  PRV=(END 8 1 EXP)
      =+  CRV=(FRA.FQ (SUM.FQ 1 PUB) (DIF.FQ 1 PUB))
      (CURT PRV CRV)
    ::                                                  ::  ++SIGN:ED:CRYPTO
    ++  SIGN                                            ::  CERTIFY
      ~/  %SIGN
      |=  {M/@ SE/@}  ^-  @
      =+  SK=(SUCK SE)
      =+  PK=(CUT 0 [B B] SK)
      =+  H=(SHAL (RSH 0 3 B) SK)
      =+  ^=  A
          %+  ADD
            (BEX (SUB B 2))
          (LSH 0 3 (CUT 0 [3 (SUB B 5)] H))
      =+  ^=  R
          =+  HM=(CUT 0 [B B] H)
          =+  ^=  I
              %+  CAN  0
              :~  [B HM]
                  [(MET 0 M) M]
              ==
          (SHAZ I)
      =+  RR=(SCAM BB R)
      =+  ^=  SS
          =+  ER=(ETCH RR)
          =+  ^=  HA
              %+  CAN  0
              :~  [B ER]
                  [B PK]
                  [(MET 0 M) M]
              ==
          (~(SIT FO L) (ADD R (MUL (SHAZ HA) A)))
      (CAN 0 ~[[B (ETCH RR)] [B SS]])
    ::                                                  ::  ++VERI:ED:CRYPTO
    ++  VERI                                            ::  VALIDATE
      ~/  %VERI
      |=  {S/@ M/@ PK/@}  ^-  ?
      ?:  (GTH (DIV B 4) (MET 3 S))  |
      ?:  (GTH (DIV B 8) (MET 3 PK))  |
      =+  CB=(RSH 0 3 B)
      =+  RR=(DECO (CUT 0 [0 B] S))
      ?~  RR  |
      =+  AA=(DECO PK)
      ?~  AA  |
      =+  SS=(CUT 0 [B B] S)
      =+  HA=(CAN 3 ~[[CB (ETCH U.RR)] [CB PK] [(MET 3 M) M]])
      =+  H=(SHAZ HA)
      =((SCAM BB SS) (WARD U.RR (SCAM U.AA H)))
    --  ::ED
  ::                                                    ::
  ::::                    ++SCR:CRYPTO                  ::  (2B3) SCRYPT
    ::                                                  ::::
  ++  SCR
    ~%  %SCR  ..IS  ~
    |%
    ::                                                  ::  ++SAL:SCR:CRYPTO
    ++  SAL                                             ::  SALSA20 HASH
      |=  {X/@ R/@}                                     ::  WITH R ROUNDS
      ?>  =((MOD R 2) 0)                                ::
      =+  FEW==>(FE .(A 5))
      =+  ^=  ROT
        |=  {A/@ B/@}
        (MIX (END 5 1 (LSH 0 A B)) (RSH 0 (SUB 32 A) B))
      =+  ^=  LEA
        |=  {A/@ B/@}
        (NET:FEW (SUM:FEW (NET:FEW A) (NET:FEW B)))
      =>  |%
          ::                                            ::  ++QR:SAL:SCR:CRYPTO
          ++  QR                                        ::  QUARTERROUND
            |=  Y/{@ @ @ @ ~}
            =+  ZB=(MIX &2.Y (ROT 7 (SUM:FEW &1.Y &4.Y)))
            =+  ZC=(MIX &3.Y (ROT 9 (SUM:FEW ZB &1.Y)))
            =+  ZD=(MIX &4.Y (ROT 13 (SUM:FEW ZC ZB)))
            =+  ZA=(MIX &1.Y (ROT 18 (SUM:FEW ZD ZC)))
            ~[ZA ZB ZC ZD]
          ::                                            ::  ++RR:SAL:SCR:CRYPTO
          ++  RR                                        ::  ROWROUND
            |=  {Y/(LIST @)}
            =+  ZA=(QR ~[&1.Y &2.Y &3.Y &4.Y])
            =+  ZB=(QR ~[&6.Y &7.Y &8.Y &5.Y])
            =+  ZC=(QR ~[&11.Y &12.Y &9.Y &10.Y])
            =+  ZD=(QR ~[&16.Y &13.Y &14.Y &15.Y])
            ^-  (LIST @)  :~
              &1.ZA  &2.ZA  &3.ZA  &4.ZA
              &4.ZB  &1.ZB  &2.ZB  &3.ZB
              &3.ZC  &4.ZC  &1.ZC  &2.ZC
              &2.ZD  &3.ZD  &4.ZD  &1.ZD  ==
          ::                                            ::  ++CR:SAL:SCR:CRYPTO
          ++  CR                                        ::  COLUMNROUND
            |=  {X/(LIST @)}
            =+  YA=(QR ~[&1.X &5.X &9.X &13.X])
            =+  YB=(QR ~[&6.X &10.X &14.X &2.X])
            =+  YC=(QR ~[&11.X &15.X &3.X &7.X])
            =+  YD=(QR ~[&16.X &4.X &8.X &12.X])
            ^-  (LIST @)  :~
              &1.YA  &4.YB  &3.YC  &2.YD
              &2.YA  &1.YB  &4.YC  &3.YD
              &3.YA  &2.YB  &1.YC  &4.YD
              &4.YA  &3.YB  &2.YC  &1.YD  ==
          ::                                            ::  ++DR:SAL:SCR:CRYPTO
          ++  DR                                        ::  DOUBLEROUND
            |=  {X/(LIST @)}
            (RR (CR X))
          ::                                            ::  ++AL:SAL:SCR:CRYPTO
          ++  AL                                        ::  ADD TWO LISTS
            |=  {A/(LIST @) B/(LIST @)}
            |-  ^-  (LIST @)
            ?~  A  ~  ?~  B  ~
            [I=(SUM:FEW -.A -.B) T=$(A +.A, B +.B)]
          --  ::
      =+  XW=(RPP 5 16 X)
      =+  ^=  OW  |-  ^-  (LIST @)
                  ?~  R  XW
                  $(XW (DR XW), R (SUB R 2))
      (REP 5 (AL XW OW))
    ::                                                  ::  ++RPP:SCR:CRYPTO
    ++  RPP                                             ::  RIP+FILLER BLOCKS
      |=  {A/BLOQ B/@ C/@}
      =+  Q=(RIP A C)
      =+  W=(LENT Q)
      ?.  =(W B)
        ?.  (LTH W B)  (SLAG (SUB W B) Q)
        ^+  Q  (WELD Q (REAP (SUB B (LENT Q)) 0))
      Q
    ::                                                  ::  ++BLS:SCR:CRYPTO
    ++  BLS                                             ::  SPLIT TO SUBLISTS
      |=  {A/@ B/(LIST @)}
      ?>  =((MOD (LENT B) A) 0)
      |-  ^-  (LIST (LIST @))
      ?~  B  ~
      [I=(SCAG A `(LIST @)`B) T=$(B (SLAG A `(LIST @)`B))]
    ::                                                  ::  ++SLB:SCR:CRYPTO
    ++  SLB                                             ::
      |=  {A/(LIST (LIST @))}
      |-  ^-  (LIST @)
      ?~  A  ~
      (WELD `(LIST @)`-.A $(A +.A))
    ::                                                  ::  ++SBM:SCR:CRYPTO
    ++  SBM                                             ::  SCRYPTBLOCKMIX
      |=  {R/@ B/(LIST @)}
      ?>  =((LENT B) (MUL 2 R))
      =+  [X=(SNAG (DEC (MUL 2 R)) B) C=0]
      =|  {YA/(LIST @) YB/(LIST @)}
      |-  ^-  (LIST @)
      ?~  B  (FLOP (WELD YB YA))
      =.  X  (SAL (MIX X -.B) 8)
      ?~  (MOD C 2)
        $(C +(C), B +.B, YA [I=X T=YA])
      $(C +(C), B +.B, YB [I=X T=YB])
    ::                                                  ::  ++SRM:SCR:CRYPTO
    ++  SRM                                             ::  SCRYPTROMIX
      |=  {R/@ B/(LIST @) N/@}
      ?>  ?&  =((LENT B) (MUL 2 R))
              =(N (BEX (DEC (XEB N))))
              (LTH N (BEX (MUL R 16)))
          ==
      =+  [V=*(LIST (LIST @)) C=0]
      =.  V
        |-  ^-  (LIST (LIST @))
        =+  W=(SBM R B)
        ?:  =(C N)  (FLOP V)
        $(C +(C), V [I=[B] T=V], B W)
      =+  X=(SBM R (SNAG (DEC N) V))
      |-  ^-  (LIST @)
      ?:  =(C N)  X
      =+  Q=(SNAG (DEC (MUL R 2)) X)
      =+  Z=`(LIST @)`(SNAG (MOD Q N) V)
      =+  ^=  W  |-  ^-  (LIST @)
                 ?~  X  ~  ?~  Z  ~
                 [I=(MIX -.X -.Z) T=$(X +.X, Z +.Z)]
      $(X (SBM R W), C +(C))
    ::                                                  ::  ++HMC:SCR:CRYPTO
    ++  HMC                                             ::  HMAC-SHA-256
      |=  {K/@ T/@}
      (HML K (MET 3 K) T (MET 3 T))
    ::                                                  ::  ++HML:SCR:CRYPTO
    ++  HML                                             ::  W+LENGTH
      |=  {K/@ KL/@ T/@ TL/@}
      =>  .(K (END 3 KL K), T (END 3 TL T))
      =+  B=64
      =?  K  (GTH KL B)  (SHAY KL K)
      =+  ^=  Q  %+  SHAY  (ADD B TL)
       (ADD (LSH 3 B T) (MIX K (FIL 3 B 0X36)))
      %+  SHAY  (ADD B 32)
      (ADD (LSH 3 B Q) (MIX K (FIL 3 B 0X5C)))
    ::                                                  ::  ++PBK:SCR:CRYPTO
    ++  PBK                                             :: PBKDF2-HMAC-SHA256
      ~/  %PBK
      |=  {P/@ S/@ C/@ D/@}
      (PBL P (MET 3 P) S (MET 3 S) C D)
    ::                                                  ::  ++PBL:SCR:CRYPTO
    ++  PBL                                             ::  W+LENGTH
      ~/  %PBL
      |=  {P/@ PL/@ S/@ SL/@ C/@ D/@}
      =>  .(P (END 3 PL P), S (END 3 SL S))
      =+  H=32
      ::
      ::  MAX KEY LENGTH 1GB
      ::  MAX ITERATIONS 2^28
      ::
      ?>  ?&  (LTE D (BEX 30))
              (LTE C (BEX 28))
              !=(C 0)
          ==
      =+  ^=  L  ?~  (MOD D H)
          (DIV D H)
        +((DIV D H))
      =+  R=(SUB D (MUL H (DEC L)))
      =+  [T=0 J=1 K=1]
      =.  T  |-  ^-  @
        ?:  (GTH J L)  T
        =+  U=(ADD S (LSH 3 SL (REP 3 (FLOP (RPP 3 4 J)))))
        =+  F=0  =.  F  |-  ^-  @
          ?:  (GTH K C)  F
          =+  Q=(HML P PL U ?:(=(K 1) (ADD SL 4) H))
          $(U Q, F (MIX F Q), K +(K))
        $(T (ADD T (LSH 3 (MUL (DEC J) H) F)), J +(J))
      (END 3 D T)
    ::                                                  ::  ++HSH:SCR:CRYPTO
    ++  HSH                                             ::  SCRYPT
      ~/  %HSH
      |=  {P/@ S/@ N/@ R/@ Z/@ D/@}
      (HSL P (MET 3 P) S (MET 3 S) N R Z D)
    ::                                                  ::  ++HSL:SCR:CRYPTO
    ++  HSL                                             ::  W+LENGTH
      ~/  %HSL
      |=  {P/@ PL/@ S/@ SL/@ N/@ R/@ Z/@ D/@}
      =|  V/(LIST (LIST @))
      =>  .(P (END 3 PL P), S (END 3 SL S))
      =+  U=(MUL (MUL 128 R) Z)
      ::
      ::  N IS POWER OF 2; MAX 1GB MEMORY
      ::
      ?>  ?&  =(N (BEX (DEC (XEB N))))
              !=(R 0)  !=(Z 0)
              %+  LTE
                  (MUL (MUL 128 R) (DEC (ADD N Z)))
                (BEX 30)
              (LTH PL (BEX 31))
              (LTH SL (BEX 31))
          ==
      =+  ^=  B  =+  (RPP 3 U (PBL P PL S SL 1 U))
        %+  TURN  (BLS (MUL 128 R) -)
        |=(A/(LIST @) (RPP 9 (MUL 2 R) (REP 3 A)))
      ?>  =((LENT B) Z)
      =+  ^=  Q
        =+  |-  ?~  B  (FLOP V)
            $(B +.B, V [I=(SRM R -.B N) T=V])
        %+  TURN  `(LIST (LIST @))`-
        |=(A/(LIST @) (RPP 3 (MUL 128 R) (REP 9 A)))
      (PBL P PL (REP 3 (SLB Q)) U 1 D)
    ::                                                  ::  ++YPT:SCR:CRYPTO
    ++  YPT                                             ::  256BIT {SALT PASS}
      |=  {S/@ P/@}
      ^-  @
      (HSH P S 16.384 8 1 256)
    --  ::SCR
  ::                                                    ::
  ::::                    ++CRUB:CRYPTO                 ::  (2B4) SUITE B, ED
    ::                                                  ::::
  ++  CRUB  !:
    ^-  ACRU
    =|  {PUB/{CRY/@ SGN/@} SEK/(UNIT {CRY/@ SGN/@})}
    |%
    ::                                                  ::  ++AS:CRUB:CRYPTO
    ++  AS                                              ::
      |%
      ::                                                ::  ++SIGN:AS:CRUB:
      ++  SIGN                                          ::
        |=  MSG=@
        ^-  @UX
        ?~  SEK  ~|  %PUBKEY-ONLY  !!
        (JAM [(SIGN:ED MSG SGN.U.SEK) MSG])
      ::                                                ::  ++SURE:AS:CRUB:
      ++  SURE                                          ::
        |=  TXT=@
        ^-  (UNIT @UX)
        =+  ((HARD {SIG/@ MSG/@}) (CUE TXT))
        ?.  (VERI:ED SIG MSG SGN.PUB)  ~
        (SOME MSG)
      ::                                                ::  ++SEAL:AS:CRUB:
      ++  SEAL                                          ::
        |=  {BPK/PASS MSG/@}
        ^-  @UX
        ?~  SEK  ~|  %PUBKEY-ONLY  !!
        ?>  =('B' (END 3 1 BPK))
        =+  PK=(RSH 8 1 (RSH 3 1 BPK))
        =+  SHAR=(SHAX (SHAR:ED PK CRY.U.SEK))
        =+  SMSG=(SIGN MSG)
        (JAM (~(EN SIVA:AES SHAR ~) SMSG))
      ::                                                ::  ++TEAR:AS:CRUB:
      ++  TEAR                                          ::
        |=  {BPK/PASS TXT/@}
        ^-  (UNIT @UX)
        ?~  SEK  ~|  %PUBKEY-ONLY  !!
        ?>  =('B' (END 3 1 BPK))
        =+  PK=(RSH 8 1 (RSH 3 1 BPK))
        =+  SHAR=(SHAX (SHAR:ED PK CRY.U.SEK))
        =+  ((HARD {IV/@ LEN/@ CPH/@}) (CUE TXT))
        =+  TRY=(~(DE SIVA:AES SHAR ~) IV LEN CPH)
        ?~  TRY  ~
        (SURE:AS:(COM:NU:CRUB BPK) U.TRY)
      --  ::AS
    ::                                                  ::  ++DE:CRUB:CRYPTO
    ++  DE                                              ::  DECRYPT
      |=  {KEY/@J TXT/@}
      ^-  (UNIT @UX)
      =+  ((HARD {IV/@ LEN/@ CPH/@}) (CUE TXT))
      %^    ~(DE SIVC:AES (SHAZ KEY) ~)
          IV
        LEN
      CPH
    ::                                                  ::  ++DY:CRUB:CRYPTO
    ++  DY                                              ::  NEED DECRYPT
      |=  {KEY/@J CPH/@}
      (NEED (DE KEY CPH))
    ::                                                  ::  ++EN:CRUB:CRYPTO
    ++  EN                                              ::  ENCRYPT
      |=  {KEY/@J MSG/@}
      ^-  @UX
      (JAM (~(EN SIVC:AES (SHAZ KEY) ~) MSG))
    ::                                                  ::  ++EX:CRUB:CRYPTO
    ++  EX                                              ::  EXTRACT
      |%
      ::                                                ::  ++FIG:EX:CRUB:CRYPTO
      ++  FIG                                           ::  FINGERPRINT
        ^-  @UVH
        (SHAF %BFIG PUB)
      ::                                                ::  ++PAC:EX:CRUB:CRYPTO
      ++  PAC                                           ::  PRIVATE FINGERPRINT
        ^-  @UVG
        ?~  SEK  ~|  %PUBKEY-ONLY  !!
        (END 6 1 (SHAF %BCOD SEC))
      ::                                                ::  ++PUB:EX:CRUB:CRYPTO
      ++  PUB                                           ::  PUBLIC KEY
        ^-  PASS
        (CAT 3 'B' (CAT 8 SGN.^PUB CRY.^PUB))
      ::                                                ::  ++SEC:EX:CRUB:CRYPTO
      ++  SEC                                           ::  PRIVATE KEY
        ^-  RING
        ?~  SEK  ~|  %PUBKEY-ONLY  !!
        (CAT 3 'B' (CAT 8 SGN.U.SEK CRY.U.SEK))
      --  ::EX
    ::                                                  ::  ++NU:CRUB:CRYPTO
    ++  NU                                              ::
      |%
      ::                                                ::  ++PIT:NU:CRUB:CRYPTO
      ++  PIT                                           ::  CREATE KEYPAIR
        |=  {W/@ SEED/@}
        =+  WID=(ADD (DIV W 8) ?:(=((MOD W 8) 0) 0 1))
        =+  BITS=(SHAL WID SEED)
        =+  [C=(RSH 8 1 BITS) S=(END 8 1 BITS)]
        ..NU(PUB [CRY=(PUCK:ED C) SGN=(PUCK:ED S)], SEK `[CRY=C SGN=S])
      ::                                                ::  ++NOL:NU:CRUB:CRYPTO
      ++  NOL                                           ::  ACTIVATE SECRET
        |=  A/RING
        =+  [MAG=(END 3 1 A) BOD=(RSH 3 1 A)]
        ~|  %NOT-CRUB-SECKEY  ?>  =('B' MAG)
        =+  [C=(RSH 8 1 BOD) S=(END 8 1 BOD)]
        ..NU(PUB [CRY=(PUCK:ED C) SGN=(PUCK:ED S)], SEK `[CRY=C SGN=S])
      ::                                                ::  ++COM:NU:CRUB:CRYPTO
      ++  COM                                           ::  ACTIVATE PUBLIC
        |=  A/PASS
        =+  [MAG=(END 3 1 A) BOD=(RSH 3 1 A)]
        ~|  %NOT-CRUB-PUBKEY  ?>  =('B' MAG)
        ..NU(PUB [CRY=(RSH 8 1 BOD) SGN=(END 8 1 BOD)], SEK ~)
      --  ::NU
    --  ::CRUB
  ::                                                    ::
  ::::                    ++CRUA:CRYPTO                 ::  (2B5) SUITE B, RSA
    ::                                                  ::::
  ++  CRUA  !!
  ::                                                    ::
  ::::                    ++TEST:CRYPTO                 ::  (2B6) TEST CRYPTO
    ::                                                  ::::
  ++  TEST  ^?
    |%
    ::                                                  ::  ++TRUB:TEST:CRYPTO
    ++  TRUB                                            ::  TEST CRUB
      |=  MSG/@T
      ::
      ::  MAKE ACRU CORES
      ::
      =/  ALI      (PIT:NU:CRUB 512 (SHAZ 'ALICE'))
      =/  ALI-PUB  (COM:NU:CRUB PUB:EX.ALI)
      =/  BOB      (PIT:NU:CRUB 512 (SHAZ 'ROBERT'))
      =/  BOB-PUB  (COM:NU:CRUB PUB:EX.BOB)
      ::
      ::  ALICE SIGNS AND ENCRYPTS A SYMMETRIC KEY TO BOB
      ::
      =/  SECRET-KEY  %-  SHAZ
          'LET THERE BE NO DUPLICITY WHEN TAKING A STAND AGAINST HIM.'
      =/  SIGNED-KEY   (SIGN:AS.ALI SECRET-KEY)
      =/  CRYPTED-KEY  (SEAL:AS.ALI PUB:EX.BOB-PUB SIGNED-KEY)
      ::  BOB DECRYPTS AND VERIFIES
      =/  DECRYPT-KEY-ATTEMPT  (TEAR:AS.BOB PUB:EX.ALI-PUB CRYPTED-KEY)
      =/  DECRYPTED-KEY    ~|  %DECRYPT-FAIL  (NEED DECRYPT-KEY-ATTEMPT)
      =/  VERIFY-KEY-ATTEMPT   (SURE:AS.ALI-PUB DECRYPTED-KEY)
      =/  VERIFIED-KEY     ~|  %VERIFY-FAIL  (NEED VERIFY-KEY-ATTEMPT)
      ::  BOB ENCRYPTS WITH SYMMETRIC KEY
      =/  CRYPTED-MSG  (EN.BOB VERIFIED-KEY MSG)
      ::  ALICE DECRYPTS WITH SAME KEY
      `@T`(DY.ALI SECRET-KEY CRYPTED-MSG)
    --  ::TEST
  ::                                                    ::
  ::::                    ++KECCAK:CRYPTO               ::  (2B7) KECCAK FAMILY
    ::                                                  ::::
  ++  KECCAK
    |%
    ::
    ::  KECCAK
    ::
    ++  KECCAK-224  |=(A=OCTS (KECCAK 1.152 448 224 A))
    ++  KECCAK-256  |=(A=OCTS (KECCAK 1.088 512 256 A))
    ++  KECCAK-384  |=(A=OCTS (KECCAK 832 768 384 A))
    ++  KECCAK-512  |=(A=OCTS (KECCAK 576 1.024 512 A))
    ::
    ++  KECCAK  (CURY (CURY HASH KECCAK-F) PADDING-KECCAK)
    ::
    ++  PADDING-KECCAK  (MULTIRATE-PADDING 0X1)
    ::
    ::  SHA3
    ::
    ++  SHA3-224  |=(A=OCTS (SHA3 1.152 448 224 A))
    ++  SHA3-256  |=(A=OCTS (SHA3 1.088 512 256 A))
    ++  SHA3-384  |=(A=OCTS (SHA3 832 768 384 A))
    ++  SHA3-512  |=(A=OCTS (SHA3 576 1.024 512 A))
    ::
    ++  SHA3  (CURY (CURY HASH KECCAK-F) PADDING-SHA3)
    ::
    ++  PADDING-SHA3  (MULTIRATE-PADDING 0X6)
    ::
    ::  SHAKE
    ::
    ++  SHAKE-128  |=([O=@UD I=OCTS] (SHAKE 1.344 256 O I))
    ++  SHAKE-256  |=([O=@UD I=OCTS] (SHAKE 1.088 512 O I))
    ::
    ++  SHAKE  (CURY (CURY HASH KECCAK-F) PADDING-SHAKE)
    ::
    ++  PADDING-SHAKE  (MULTIRATE-PADDING 0X1F)
    ::
    ::  RAWSHAKE
    ::
    ++  RAWSHAKE-128  |=([O=@UD I=OCTS] (RAWSHAKE 1.344 256 O I))
    ++  RAWSHAKE-256  |=([O=@UD I=OCTS] (RAWSHAKE 1.088 512 O I))
    ::
    ++  RAWSHAKE  (CURY (CURY HASH KECCAK-F) PADDING-RAWSHAKE)
    ::
    ++  PADDING-RAWSHAKE  (MULTIRATE-PADDING 0X7)
    ::
    ::  CORE
    ::
    ++  HASH
      ::  PER:  PERMUTATION FUNCTION WITH CONFIGURABLE WIDTH.
      ::  PAD:  PADDING FUNCTION.
      ::  RAT:  BITRATE, SIZE IN BITS OF BLOCKS TO OPERATE ON.
      ::  CAP:  CAPACITY, BITS OF SPONGE PADDING.
      ::  OUT:  LENGTH OF DESIRED OUTPUT, IN BITS.
      ::  INP:  INPUT TO HASH.
      |=  $:  PER=$-(@UD $-(@ @))
              PAD=$-([OCTS @UD] OCTS)
              RAT=@UD
              CAP=@UD
              OUT=@UD
              INP=OCTS
          ==
      ^-  @
      ::  URBIT'S LITTLE-ENDIAN TO KECCAK'S BIG-ENDIAN.
      =.  Q.INP  (REV 3 INP)
      %.  [INP OUT]
      (SPONGE PER PAD RAT CAP)
    ::
    ::NOTE  IF ++KECCAK EVER NEEDS TO BE MADE TO OPERATE
    ::      ON BITS RATHER THAN BYTES, ALL THAT NEEDS TO
    ::      BE DONE IS UPDATING THE WAY THIS PADDING
    ::      FUNCTION WORKS. (AND ALSO "OCTS" -> "BITS")
    ++  MULTIRATE-PADDING
      ::  DSB:  DOMAIN SEPARATION BYTE, REVERSE BIT ORDER.
      |=  DSB=@UX
      ?>  (LTE DSB 0XFF)
      |=  [INP=OCTS MUT=@UD]
      ^-  OCTS
      =.  MUT  (DIV MUT 8)
      =+  PAL=(SUB MUT (MOD P.INP MUT))
      =?  PAL  =(PAL 0)  MUT
      =.  PAL  (DEC PAL)
      :-  (ADD P.INP +(PAL))
      ::  PADDING IS PROVIDED IN LANE BIT ORDERING,
      ::  IE, LSB = LEFT.
      (CAT 3 (CON (LSH 3 PAL DSB) 0X80) Q.INP)
    ::
    ++  SPONGE
      ::  SPONGE CONSTRUCTION
      ::
      ::  PREPERM:  PERMUTATION FUNCTION WITH CONFIGURABLE WIDTH.
      ::  PADDING:  PADDING FUNCTION.
      ::  BITRATE:  SIZE OF BLOCKS TO OPERATE ON.
      ::  CAPACITY:  SPONGE PADDING.
      |=  $:  PREPERM=$-(@UD $-(@ @))
              PADDING=$-([OCTS @UD] OCTS)
              BITRATE=@UD
              CAPACITY=@UD
          ==
      ::
      ::  PREPARING
      =+  BITRATE-BYTES=(DIV BITRATE 8)
      =+  BLOCKWIDTH=(ADD BITRATE CAPACITY)
      =+  PERMUTE=(PREPERM BLOCKWIDTH)
      ::
      |=  [INPUT=OCTS OUTPUT=@UD]
      |^  ^-  @
        ::
        ::  PADDING
        =.  INPUT  (PADDING INPUT BITRATE)
        ::
        ::  ABSORBING
        =/  PIECES=(LIST @)
          ::  AMOUNT OF BITRATE-SIZED BLOCKS.
          ?>  =(0 (MOD P.INPUT BITRATE-BYTES))
          =+  I=(DIV P.INPUT BITRATE-BYTES)
          |-
          ?:  =(I 0)  ~
          :_  $(I (DEC I))
          ::  GET THE BITRATE-SIZED BLOCK OF BYTES
          ::  THAT ENDS WITH THE BYTE AT -.
          =-  (CUT 3 [- BITRATE-BYTES] Q.INPUT)
          (MUL (DEC I) BITRATE-BYTES)
        =/  STATE=@
          ::  FOR EVERY PIECE,
          %+  ROLL  PIECES
          |=  [P=@ S=@]
          ::  PAD WITH CAPACITY,
          =.  P  (LSH 0 CAPACITY P)
          ::  XOR IT INTO THE STATE AND PERMUTE IT.
          (PERMUTE (MIX S (BYTES-TO-LANES P)))
        ::
        ::  SQUEEZING
        =|  RES=@
        =|  LEN=@UD
        |-
        ::  APPEND A BITRATE-SIZED HEAD OF STATE TO THE
        ::  RESULT.
        =.  RES
          %+  CON  (LSH 0 BITRATE RES)
          (RSH 0 CAPACITY (LANES-TO-BYTES STATE))
        =.  LEN  (ADD LEN BITRATE)
        ?:  (GTE LEN OUTPUT)
          ::  PRODUCE THE REQUESTED BITS OF OUTPUT.
          (RSH 0 (SUB LEN OUTPUT) RES)
        $(RES RES, STATE (PERMUTE STATE))
      ::
      ++  BYTES-TO-LANES
        ::  FLIP BYTE ORDER IN BLOCKS OF 8 BYTES.
        |=  A=@
        %+  CAN  6
        %+  TURN  (RIP 6 A)
        |=  B=@
        :-  1
        (LSH 3 (SUB 8 (MET 3 B)) (SWP 3 B))
      ::
      ++  LANES-TO-BYTES
        ::  UNFLIP BYTE ORDER IN BLOCKS OF 8 BYTES.
        |=  A=@
        %+  CAN  6
        %+  TURN
          =+  (RIP 6 A)
          (WELD - (REAP (SUB 25 (LENT -)) 0X0))
        |=  A=@
        :-  1
        %+  CAN  3
        =-  (TURN - |=(A=@ [1 A]))
        =+  (FLOP (RIP 3 A))
        (WELD (REAP (SUB 8 (LENT -)) 0X0) -)
      --
    ::
    ++  KECCAK-F
      ::  KECCAK PERMUTATION FUNCTION
      |=  [WIDTH=@UD]
      ::  ASSERT VALID BLOCKWIDTH.
      ?>  =-  (~(HAS IN -) WIDTH)
          (SY 25 50 100 200 400 800 1.600 ~)
      ::  ASSUMES 5X5 LANES STATE, AS IS THE KECCAK
      ::  STANDARD.
      =+  SIZE=5
      =+  LANES=(MUL SIZE SIZE)
      =+  LANE-BLOQ=(DEC (XEB (DIV WIDTH LANES)))
      =+  LANE-SIZE=(BEX LANE-BLOQ)
      =+  ROUNDS=(ADD 12 (MUL 2 LANE-BLOQ))
      |=  [INPUT=@]
      ^-  @
      =*  A  INPUT
      =+  ROUND=0
      |^
        ?:  =(ROUND ROUNDS)  A
        ::
        ::  THETA
        =/  C=@
          %+  ROLL  (GULF 0 (DEC SIZE))
          |=  [X=@UD C=@]
          %+  CON  (LSH LANE-BLOQ 1 C)
          %+  ROLL  (GULF 0 (DEC SIZE))
          |=  [Y=@UD C=@]
          (MIX C (GET-LANE X Y A))
        =/  D=@
          %+  ROLL  (GULF 0 (DEC SIZE))
          |=  [X=@UD D=@]
          %+  CON  (LSH LANE-BLOQ 1 D)
          %+  MIX
            =-  (GET-WORD - SIZE C)
            ?:(=(X 0) (DEC SIZE) (DEC X))
          %^  ~(ROL FE LANE-BLOQ)  0  1
          (GET-WORD (MOD +(X) SIZE) SIZE C)
        =.  A
          %+  ROLL  (GULF 0 (DEC LANES))
          |=  [I=@UD A=_A]
          %+  MIX  A
          %^  LSH  LANE-BLOQ
            (SUB LANES +(I))
          (GET-WORD I SIZE D)
        ::
        ::  RHO AND PI
        =/  B=@
          %+  ROLL  (GULF 0 (DEC LANES))
          |=  [I=@ B=@]
          =+  X=(MOD I 5)
          =+  Y=(DIV I 5)
          %+  CON  B
          %^  LSH  LANE-BLOQ
            %+  SUB  LANES
            %+  ADD  +(Y)
            %+  MUL  SIZE
            (MOD (ADD (MUL 2 X) (MUL 3 Y)) SIZE)
          %^  ~(ROL FE LANE-BLOQ)  0
            (ROTATION-OFFSET I)
          (GET-WORD I LANES A)
        ::
        ::  CHI
        =.  A
          %+  ROLL  (GULF 0 (DEC LANES))
          |=  [I=@UD A=@]
          %+  CON  (LSH LANE-BLOQ 1 A)
          =+  X=(MOD I 5)
          =+  Y=(DIV I 5)
          %+  MIX  (GET-LANE X Y B)
          %+  DIS
            =-  (GET-LANE - Y B)
            (MOD (ADD X 2) SIZE)
          %^  NOT  LANE-BLOQ  1
          (GET-LANE (MOD +(X) SIZE) Y B)
        ::
        ::  IOTA
        =.  A
          =+  (ROUND-CONSTANT ROUND)
          (MIX A (LSH LANE-BLOQ (DEC LANES) -))
        ::
        ::  NEXT ROUND
        $(ROUND +(ROUND))
      ::
      ++  GET-LANE
        ::  GET THE LANE WITH COORDINATES
        |=  [X=@UD Y=@UD A=@]
        =+  I=(ADD X (MUL SIZE Y))
        (GET-WORD I LANES A)
      ::
      ++  GET-WORD
        ::  GET WORD {N} FROM ATOM {A} OF {M} WORDS.
        |=  [N=@UD M=@UD A=@]
        (CUT LANE-BLOQ [(SUB M +((MOD N M))) 1] A)
      ::
      ++  ROUND-CONSTANT
        |=  C=@UD
        =-  (SNAG (MOD C 24) -)
        ^-  (LIST @UX)
        :~  0X1
            0X8082
            0X8000.0000.0000.808A
            0X8000.0000.8000.8000
            0X808B
            0X8000.0001
            0X8000.0000.8000.8081
            0X8000.0000.0000.8009
            0X8A
            0X88
            0X8000.8009
            0X8000.000A
            0X8000.808B
            0X8000.0000.0000.008B
            0X8000.0000.0000.8089
            0X8000.0000.0000.8003
            0X8000.0000.0000.8002
            0X8000.0000.0000.0080
            0X800A
            0X8000.0000.8000.000A
            0X8000.0000.8000.8081
            0X8000.0000.0000.8080
            0X8000.0001
            0X8000.0000.8000.8008
        ==
      ::
      ++  ROTATION-OFFSET
        |=  X=@UD
        =-  (SNAG X -)
        ^-  (LIST @UD)
        :~   0   1  62  28  27
            36  44   6  55  20
             3  10  43  25  39
            41  45  15  21   8
            18   2  61  56  14
        ==
      --
    --  ::KECCAK
  ::                                                    ::
  ::::                    ++HMAC:CRYPTO                 ::  (2B8) HMAC FAMILY
    ::                                                  ::::
  ++  HMAC
    ~%  %HMAC  ..IS  ~
    =,  SHA
    =>  |%
        ++  MEET  |=([K=@ M=@] [[(MET 3 K) K] [(MET 3 M) M]])
        ++  FLIP  |=([K=@ M=@] [(SWP 3 K) (SWP 3 M)])
        --
    |%
    ::
    ::  USE WITH @
    ::
    ++  HMAC-SHA1     (CORK MEET HMAC-SHA1L)
    ++  HMAC-SHA256   (CORK MEET HMAC-SHA256L)
    ++  HMAC-SHA512   (CORK MEET HMAC-SHA512L)
    ::
    ::  USE WITH @T
    ::
    ++  HMAC-SHA1T    (CORK FLIP HMAC-SHA1)
    ++  HMAC-SHA256T  (CORK FLIP HMAC-SHA256)
    ++  HMAC-SHA512T  (CORK FLIP HMAC-SHA512)
    ::
    ::  USE WITH BYTS
    ::
    ++  HMAC-SHA1L    (CURY HMAC SHA-1L 64 20)
    ++  HMAC-SHA256L  (CURY HMAC SHA-256L 64 32)
    ++  HMAC-SHA512L  (CURY HMAC SHA-512L 128 64)
    ::
    ::  MAIN LOGIC
    ::
    ++  HMAC
      ~/  %HMAC
      ::  BOQ: BLOCK SIZE IN BYTES USED BY HAJ
      ::  OUT: BYTES OUTPUT BY HAJ
      |*  [[HAJ=$-([@U @] @) BOQ=@U OUT=@U] KEY=BYTS MSG=BYTS]
      ::  ENSURE KEY AND MESSAGE FIT SIGNALED LENGTHS
      =.  DAT.KEY  (END 3 WID.KEY DAT.KEY)
      =.  DAT.MSG  (END 3 WID.MSG DAT.MSG)
      ::  KEYS LONGER THAN BLOCK SIZE ARE SHORTENED BY HASHING
      =?  DAT.KEY  (GTH WID.KEY BOQ)  (HAJ WID.KEY DAT.KEY)
      =?  WID.KEY  (GTH WID.KEY BOQ)  OUT
      ::  KEYS SHORTER THAN BLOCK SIZE ARE RIGHT-PADDED
      =?  DAT.KEY  (LTH WID.KEY BOQ)  (LSH 3 (SUB BOQ WID.KEY) DAT.KEY)
      ::  PAD KEY, INNER AND OUTER
      =+  KIP=(MIX DAT.KEY (FIL 3 BOQ 0X36))
      =+  KOP=(MIX DAT.KEY (FIL 3 BOQ 0X5C))
      ::  APPEND INNER PADDING TO MESSAGE, THEN HASH
      =+  (HAJ (ADD WID.MSG BOQ) (ADD (LSH 3 WID.MSG KIP) DAT.MSG))
      ::  PREPEND OUTER PADDING TO RESULT, HASH AGAIN
      (HAJ (ADD OUT BOQ) (ADD (LSH 3 OUT KOP) -))
    --  ::  HMAC
  ::                                                    ::
  ::::                    ++SECP:CRYPTO                 ::  (2B9) SECP FAMILY
    ::                                                  ::::
  ++  SECP
    ~%  %SECP  ..IS  ~
    |%
    +=  JACO  [X=@ Y=@ Z=@]                             ::  JACOBIAN POINT
    +=  PONT  [X=@ Y=@]                                 ::  CURVE POINT
    ::
    ++  SECP256K1
      %+  SECP  32
      :*  P=0XFFFF.FFFF.FFFF.FFFF.FFFF.FFFF.FFFF.FFFF.  ::  MODULO
              FFFF.FFFF.FFFF.FFFF.FFFF.FFFE.FFFF.FC2F
          A=0                                           ::  Y^2=X^3+AX+B
          B=7
          ^=  G                                         ::  "PRIME" POINT
          :*  X=0X79BE.667E.F9DC.BBAC.55A0.6295.CE87.0B07.
                  029B.FCDB.2DCE.28D9.59F2.815B.16F8.1798
              Y=0X483A.DA77.26A3.C465.5DA4.FBFC.0E11.08A8.
                  FD17.B448.A685.5419.9C47.D08F.FB10.D4B8
          ==
          N=0XFFFF.FFFF.FFFF.FFFF.FFFF.FFFF.FFFF.FFFE.  ::  PRIME ORDER OF G
              BAAE.DCE6.AF48.A03B.BFD2.5E8C.D036.4141
      ==
    ::
    ++  SECP
      ~/  %SECP
      |=  [W=@ P=@ A=@ B=@ G=PONT N=@]  :: BEING PASSED IN FROM ABOVE
      =/  P  ~(. FO P)
      =/  N  ~(. FO N)
      ~%  %HELPER  ..$  ~
      |%
      ++  COMPRESS-POINT
        ~/  %COMPRESS-POINT
        |=  PONT
        ^-  @
        (CAN 3 ~[W^X 1^(ADD 0X2 (CUT 0 [0 1] Y))])
      ::
      ++  SERIALIZE-POINT
        ~/  %SERIALIZE-POINT
        |=  PONT
        ^-  @
        (CAN 3 ~[W^Y W^X 1^0X4])
      ::
      ++  DECOMPRESS-POINT
        ~/  %DECOMPRESS-POINT
        |=  DAT=@
        ^-  PONT
        =+  X=(END 3 W A)
        =+  Y=:(ADD (POW X 3) (MUL A X) B)
        =+  S=(RSH 3 32 DAT)
        :-  X
        ?:  =(0X2 S)  Y
        ?:  =(0X3 S)  Y
        ~|  [`@UX`S `@UX`DAT]
        !!
      ::
      ++  PRIV-TO-PUB                                   ::  GET PUB FROM PRIV
        ~/  %PRIV-TO-PUB
        |=  PRV=@
        ^-  PONT
        (JC-MUL G PRV)
      ::
      ++  MAKE-K                                        ::  DETERMINISTIC NONCE
        ~/  %MAKE-K
        =,  MIMES:HTML
        |=  [HAS=@UVI PRV=@]
        ^-  @
        =*  HMC  HMAC-SHA256L:HMAC
        =/  V  (FIL 3 W 1)
        =/  K  0
        =.  K  (HMC W^K (AS-OCTS (CAN 3 [W HAS] [W PRV] [1 0X0] [W V] ~)))
        =.  V  (HMC W^K W^V)
        =.  K  (HMC W^K (AS-OCTS (CAN 3 [W HAS] [W PRV] [1 0X1] [W V] ~)))
        =.  V  (HMC W^K W^V)
        (HMC W^K W^V)
      ::
      ++  ECDSA-RAW-SIGN                                ::  GENERATE SIGNATURE
        ~/  %ECDSA-RAW-SIGN
        |=  [HAS=@UVI PRV=@]
        ^-  [V=@ R=@ S=@]
        =/  Z  HAS
        =/  K  (MAKE-K HAS PRV)
        =+  [R Y]=(JC-MUL G K)
        =/  S  (PRO.N `@`(INV.N K) `@`(SUM.N Z (MUL R PRV)))
        =/  BIG-S  (GTE (MUL 2 S) ^N)
        :*  V=(MIX (END 0 1 Y) ?:(BIG-S 1 0))
            R=R
            S=?.(BIG-S S (SUB ^N S))
        ==
      ::
      ++  ECDSA-RAW-RECOVER                             ::  GET PUBKEY FROM SIG
        ~/  %ECDSA-RAW-RECOVER
        |=  [HAS=@UVI SIG=[V=@ R=@ S=@]]
        ^-  PONT
        ?>  (LTE V.SIG 7)
        =/  X  R.SIG
        =/  YSQ  (SUM.P B (EXP.P 3 X))               ::  OMITS A=0
        =/  BET  (EXP.P (DIV +(^P) 4) YSQ)
        =/  Y  ?:(=(1 (END 0 1 (MIX V.SIG BET))) BET (DIF.P 0 BET))
        ?>  =(0 (DIF.P YSQ (PRO.P Y Y)))
        ?<  =(0 (SIT.N R.SIG))
        ?<  =(0 (SIT.N S.SIG))
        =/  GZ  (MUL:JC [X Y 1]:G (DIF.N 0 HAS))
        =/  XY  (MUL:JC [X Y 1] S.SIG)
        =/  QR  (ADD:JC GZ XY)
        (FROM:JC (MUL:JC QR (INV.N R.SIG)))
      ::
      ++  JC-MUL                                        ::  POINT X SCALAR
        |=  [A=PONT N=@]
        ^-  PONT
        (FROM:JC (MUL:JC (INTO:JC A) N))
      ::
      ++  JC-ADD                                        ::  ADD POINTS
        |=  [A=PONT B=PONT]
        ^-  PONT
        (FROM:JC (ADD:JC (INTO:JC A) (INTO:JC B)))
      ::
      ++  JC                                            ::  JACOBIAN CORE
        |%
        ++  ADD                                         ::  ADDITION
          |=  [A=JACO B=JACO]
          ^-  JACO
          ?:  =(0 Y.A)  B
          ?:  =(0 Y.B)  A
          =/  U1  :(PRO.P X.A Z.B Z.B)
          =/  U2  :(PRO.P X.B Z.A Z.A)
          =/  S1  :(PRO.P Y.A Z.B Z.B Z.B)
          =/  S2  :(PRO.P Y.B Z.A Z.A Z.A)
          ?:  =(U1 U2)
            ?.  =(S1 S2)
              [0 0 1]
            (DUB A)
          =/  H  (DIF.P U2 U1)
          =/  R  (DIF.P S2 S1)
          =/  H2  (PRO.P H H)
          =/  H3  (PRO.P H2 H)
          =/  U1H2  (PRO.P U1 H2)
          =/  NX  (DIF.P (PRO.P R R) :(SUM.P H3 U1H2 U1H2))
          =/  NY  (DIF.P (PRO.P R (DIF.P U1H2 NX)) (PRO.P S1 H3))
          =/  NZ  :(PRO.P H Z.A Z.B)
          [NX NY NZ]
        ::
        ++  DUB                                         ::  DOUBLE
          |=  A=JACO
          ^-  JACO
          ?:  =(0 Y.A)
            [0 0 0]
          =/  YSQ  (PRO.P Y.A Y.A)
          =/  S  :(PRO.P 4 X.A YSQ)
          =/  M  :(PRO.P 3 X.A X.A)                     ::  OMITS A=0
          =/  NX  (DIF.P (PRO.P M M) (SUM.P S S))
          =/  NY  (DIF.P (PRO.P M (DIF.P S NX)) :(PRO.P 8 YSQ YSQ))
          =/  NZ  :(PRO.P 2 Y.A Z.A)
          [NX NY NZ]
        ::
        ++  MUL                                         :: JACO X SCALAR
          |=  [A=JACO N=@]
          ^-  JACO
          ?:  =(0 Y.A)
            [0 0 1]
          ?:  =(0 N)
            [0 0 1]
          ?:  =(1 N)
            A
          ?:  (GTE N ^^N)
            $(N (MOD N ^^N))
          ?:  =(0 (MOD N 2))
            (DUB $(N (DIV N 2)))
          (ADD A (DUB $(N (DIV N 2))))
        ::
        ++  FROM                                        :: JACO -> POINT
          |=  A=JACO
          ^-  PONT
          =/  Z  (INV.P Z.A)
          [:(PRO.P X.A Z Z) :(PRO.P Y.A Z Z Z)]
        ::
        ++  INTO                                        :: POINT -> JACO
          |=  PONT
          ^-  JACO
          [X Y Z=1]
        --
      --
    --
  ::
  ++  BLAKE
    ~%  %BLAKE  ..IS  ~
    |%
    ::TODO  GENERALIZE FOR BOTH BLAKE2 VARIANTS
    ++  BLAKE2B
      ~/  %BLAKE2B
      |=  [MSG=BYTS KEY=BYTS OUT=@UD]
      ^-  @
      ::  INITIALIZATION VECTOR
      =/  IV=@
        0X6A09.E667.F3BC.C908.
          BB67.AE85.84CA.A73B.
          3C6E.F372.FE94.F82B.
          A54F.F53A.5F1D.36F1.
          510E.527F.ADE6.82D1.
          9B05.688C.2B3E.6C1F.
          1F83.D9AB.FB41.BD6B.
          5BE0.CD19.137E.2179
      ::  PER-ROUND CONSTANTS
      =/  SIGMA=(LIST (LIST @UD))
        :~
          :~   0   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  ==
          :~  14  10   4   8   9  15  13   6   1  12   0   2  11   7   5   3  ==
          :~  11   8  12   0   5   2  15  13  10  14   3   6   7   1   9   4  ==
          :~   7   9   3   1  13  12  11  14   2   6   5  10   4   0  15   8  ==
          :~   9   0   5   7   2   4  10  15  14   1  11  12   6   8   3  13  ==
          :~   2  12   6  10   0  11   8   3   4  13   7   5  15  14   1   9  ==
          :~  12   5   1  15  14  13   4  10   0   7   6   3   9   2   8  11  ==
          :~  13  11   7  14  12   1   3   9   5   0  15   4   8   6   2  10  ==
          :~   6  15  14   9  11   3   0   8  12   2  13   7   1   4  10   5  ==
          :~  10   2   8   4   7   6   1   5  15  11   9  14   3  12  13   0  ==
          :~   0   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  ==
          :~  14  10   4   8   9  15  13   6   1  12   0   2  11   7   5   3  ==
        ==
      =>  |%
          ++  GET-WORD-LIST
            |=  [H=@ W=@UD]
            ^-  (LIST @)
            %-  FLOP
            =+  L=(RIP 6 H)
            =-  (WELD - L)
            (REAP (SUB W (LENT L)) 0)
          ::
          ++  GET-WORD
            |=  [H=@ I=@UD W=@UD]
            ^-  @
            %+  SNAG  I
            (GET-WORD-LIST H W)
          ::
          ++  PUT-WORD
            |=  [H=@ I=@UD W=@UD D=@]
            ^-  @
            %+  REP  6
            =+  L=(GET-WORD-LIST H W)
            %-  FLOP
            %+  WELD  (SCAG I L)
            [D (SLAG +(I) L)]
          ::
          ++  MOD-WORD
            |*  [H=@ I=@UD W=@UD G=$-(@ @)]
            (PUT-WORD H I W (G (GET-WORD H I W)))
          ::
          ++  PAD
            |=  [BYTS LEN=@UD]
            (LSH 3 (SUB LEN WID) DAT)
          ::
          ++  COMPRESS
            |=  [H=@ C=@ T=@UD L=?]
            ^-  @
            ::  SET UP LOCAL WORK VECTOR
            =+  V=(ADD (LSH 6 8 H) IV)
            ::  XOR THE COUNTER T INTO V
            =.  V
              %-  MOD-WORD
              :^  V  12  16
              (CURY MIX (END 0 64 T))
            =.  V
              %-  MOD-WORD
              :^  V  13  16
              (CURY MIX (RSH 0 64 T))
            ::  FOR THE LAST BLOCK, INVERT V14
            =?  V  L
              %-  MOD-WORD
              :^  V  14  16
              (CURY MIX 0XFFFF.FFFF.FFFF.FFFF)
            ::  TWELVE ROUNDS OF MESSAGE MIXING
            =+  I=0
            =|  S=(LIST @)
            |^
              ?:  =(I 12)
                ::  XOR UPPER AND LOWER HALVES OF V INTO STATE H
                =.  H  (MIX H (RSH 6 8 V))
                (MIX H (END 6 8 V))
              ::  SELECT MESSAGE MIXING SCHEDULE AND MIX V
              =.  S  (SNAG (MOD I 10) SIGMA)
              =.  V  (DO-MIX 0 4 8 12 0 1)
              =.  V  (DO-MIX 1 5 9 13 2 3)
              =.  V  (DO-MIX 2 6 10 14 4 5)
              =.  V  (DO-MIX 3 7 11 15 6 7)
              =.  V  (DO-MIX 0 5 10 15 8 9)
              =.  V  (DO-MIX 1 6 11 12 10 11)
              =.  V  (DO-MIX 2 7 8 13 12 13)
              =.  V  (DO-MIX 3 4 9 14 14 15)
              $(I +(I))
            ::
            ++  DO-MIX
              |=  [NA=@ NB=@ NC=@ ND=@ NX=@ NY=@]
              ^-  @
              =-  =.  V  (PUT-WORD V NA 16 A)
                  =.  V  (PUT-WORD V NB 16 B)
                  =.  V  (PUT-WORD V NC 16 C)
                         (PUT-WORD V ND 16 D)
              %-  B2MIX
              :*  (GET-WORD V NA 16)
                  (GET-WORD V NB 16)
                  (GET-WORD V NC 16)
                  (GET-WORD V ND 16)
                  (GET-WORD C (SNAG NX S) 16)
                  (GET-WORD C (SNAG NY S) 16)
              ==
            --
          ::
          ++  B2MIX
            |=  [A=@ B=@ C=@ D=@ X=@ Y=@]
            ^-  [A=@ B=@ C=@ D=@]
            =.  X  (REV 3 8 X)
            =.  Y  (REV 3 8 Y)
            =+  FED=~(. FE 6)
            =.  A  :(SUM:FED A B X)
            =.  D  (ROR:FED 0 32 (MIX D A))
            =.  C  (SUM:FED C D)
            =.  B  (ROR:FED 0 24 (MIX B C))
            =.  A  :(SUM:FED A B Y)
            =.  D  (ROR:FED 0 16 (MIX D A))
            =.  C  (SUM:FED C D)
            =.  B  (ROR:FED 0 63 (MIX B C))
            [A B C D]
          --
      ::  ENSURE INPUTS ADHERE TO CONTRAINTS
      =.  OUT  (MAX 1 (MIN OUT 64))
      =.  WID.MSG  (MIN WID.MSG (BEX 128))
      =.  WID.KEY  (MIN WID.KEY 64)
      =.  DAT.MSG  (END 3 WID.MSG DAT.MSG)
      =.  DAT.KEY  (END 3 WID.KEY DAT.KEY)
      ::  INITIALIZE STATE VECTOR
      =+  H=IV
      ::  MIX KEY LENGTH AND OUTPUT LENGTH INTO H0
      =.  H
        %-  MOD-WORD
        :^  H  0  8
        %+  CURY  MIX
        %+  ADD  0X101.0000
        (ADD (LSH 3 1 WID.KEY) OUT)
      ::  KEEP TRACK OF HOW MUCH WE'VE COMPRESSED
      =*  MES  DAT.MSG
      =+  COM=0
      =+  REM=WID.MSG
      ::  IF WE HAVE A KEY, PAD IT AND PREPEND TO MSG
      =?  MES  (GTH WID.KEY 0)
        (CAN 3 ~[REM^MES 128^(PAD KEY 128)])
      =?  REM  (GTH WID.KEY 0)
        (ADD REM 128)
      |-
      ::  COMPRESS 128-BYTE CHUNKS OF THE MESSAGE
      ?:  (GTH REM 128)
        =+  C=(CUT 3 [(SUB REM 128) 128] MES)
        =.  COM   (ADD COM 128)
        %_  $
          REM   (SUB REM 128)
          H     (COMPRESS H C COM |)
        ==
      ::  COMPRESS THE FINAL BYTES OF THE MSG
      =+  C=(CUT 3 [0 REM] MES)
      =.  COM  (ADD COM REM)
      =.  C  (PAD [REM C] 128)
      =.  H  (COMPRESS H C COM &)
      ::  PRODUCE OUTPUT OF DESIRED LENGTH
      %^  RSH  3  (SUB 64 OUT)
      ::  DO SOME WORD
      %+  REP  6
      %+  TURN  (FLOP (GULF 0 7))
      |=  A=@
      (REV 3 8 (GET-WORD H A 8))
    --  ::BLAKE
  ::
  ++  ARGON2
    ~%  %ARGON  ..IS  ~
    |%
    ::
    ::  STRUCTURES
    ::
    +=  ARGON-TYPE  ?(%D %I %ID %U)
    ::
    ::  SHORTHANDS
    ::
    ++  ARGON2-URBIT
      |=  OUT=@UD
      (ARGON2 OUT %U 0X13 4 512.000 1 *BYTS *BYTS)
    ::
    ::  ARGON2 PROPER
    ::
    ::  MAIN ARGON2 OPERATION
    ++  ARGON2
      ::  OUT:       DESIRED OUTPUT SIZE IN BYTES
      ::  TYP:       ARGON2 TYPE
      ::  VERSION:   ARGON2 VERSION (0X10/V1.0 OR 0X13/V1.3)
      ::  THREADS:   AMOUNT OF THREADS/PARALLELISM
      ::  MEM-COST:  KB OF MEMORY TO USE
      ::  TIME-COST: ITERATIONS TO RUN
      ::  KEY:       OPTIONAL SECRET
      ::  EXTRA:     OPTIONAL ARBITRARY DATA
      |=  $:  OUT=@UD
              TYP=ARGON-TYPE
              VERSION=@UX
            ::
              THREADS=@UD
              MEM-COST=@UD
              TIME-COST=@UD
            ::
              KEY=BYTS
              EXTRA=BYTS
          ==
      ^-  $-([MSG=BYTS SAT=BYTS] @)
      ::
      ::  CHECK CONFIGURATION SANITY
      ::
      ?:  =(0 THREADS)
        ~|  %PARALLELISM-MUST-BE-ABOVE-ZERO
        !!
      ?:  =(0 TIME-COST)
        ~|  %TIME-COST-MUST-BE-ABOVE-ZERO
        !!
      ?:  (LTH MEM-COST (MUL 8 THREADS))
        ~|  :-  %MEMORY-COST-MUST-BE-AT-LEAST-THREADS
            [THREADS %TIMES 8 (MUL 8 THREADS)]
        !!
      ?.  |(=(0X10 VERSION) =(0X13 VERSION))
        ~|  [%UNSUPPORTED-VERSION VERSION %WANT [0X10 0X13]]
        !!
      ::
      ::  CALCULATE CONSTANTS AND INITIALIZE BUFFER
      ::
      ::  FOR EACH THREAD, THERE IS A ROW IN THE BUFFER.
      ::  THE AMOUNT OF COLUMNS DEPENDS ON THE MEMORY-COST.
      ::  COLUMNS ARE SPLIT INTO GROUPS OF FOUR.
      ::  A SINGLE SUCH QUARTER SECTION OF A ROW IS A SEGMENT.
      ::
      ::  BLOCKS:     (M_PRIME)
      ::  COLUMNS:    ROW LENGTH (Q)
      ::  SEG-LENGTH: SEGMENT LENGTH
      =/  BLOCKS=@UD
        ::  ROUND MEM-COST DOWN TO THE NEAREST MULTIPLE OF 4*THREADS
        =+  (MUL 4 THREADS)
        (MUL (DIV MEM-COST -) -)
      =+  COLUMNS=(DIV BLOCKS THREADS)
      =+  SEG-LENGTH=(DIV COLUMNS 4)
      ::
      =/  BUFFER=(LIST (LIST @))
        (REAP THREADS (REAP COLUMNS 0))
      ::
      ::  MAIN FUNCTION
      ::
      ::  MSG: THE MAIN INPUT
      ::  SAT: OPTIONAL SALT
      ~%  %ARGON2  ..ARGON2  ~
      |=  [MSG=BYTS SAT=BYTS]
      ^-  @
      ?:  (LTH WID.SAT 8)
        ~|  [%MIN-SALT-LENGTH-IS-8 WID.SAT]
        !!
      ::
      ::  H0: INITIAL 64-BYTE BLOCK
      =/  H0=@
        =-  (BLAKE2B:BLAKE - 0^0 64)
        :-  :(ADD 40 WID.MSG WID.SAT WID.KEY WID.EXTRA)
        %+  CAN  3
        =+  (CURY (CURY REV 3) 4)
        :~  (PREP-WID EXTRA)
            (PREP-WID KEY)
            (PREP-WID SAT)
            (PREP-WID MSG)
            4^(- (TYPE-TO-NUM TYP))
            4^(- VERSION)
            4^(- TIME-COST)
            4^(- MEM-COST)
            4^(- OUT)
            4^(- THREADS)
        ==
      ::
      ::  DO TIME-COST PASSES OVER THE BUFFER
      ::
      =+  T=0
      |-
      ?:  (LTH T TIME-COST)
        ::
        ::  PROCESS ALL FOUR SEGMENTS IN THE COLUMNS...
        ::
        =+  S=0
        |-
        ?.  (LTH S 4)  ^$(T +(T))
        ::
        ::  ...OF EVERY ROW/THREAD
        ::
        =+  R=0
        |-
        ?.  (LTH R THREADS)  ^$(S +(S))
        =;  NEW=_BUFFER
          $(BUFFER NEW, R +(R))
        %-  FILL-SEGMENT
        :*  BUFFER   H0
            T        S          R
            BLOCKS   COLUMNS    SEG-LENGTH
            THREADS  TIME-COST  TYP         VERSION
        ==
      ::
      ::  MIX ALL ROWS TOGETHER AND HASH THE RESULT
      ::
      =+  R=0
      =|  FINAL=@
      |-
      ?:  =(R THREADS)
        (HASH 1.024^FINAL OUT)
      =-  $(FINAL -, R +(R))
      %+  MIX  FINAL
      (SNAG (DEC COLUMNS) (SNAG R BUFFER))
    ::
    ::  PER-SEGMENT COMPUTATION
    ++  FILL-SEGMENT
      |=  $:  BUFFER=(LIST (LIST @))
              H0=@
            ::
              ITN=@UD
              SEG=@UD
              ROW=@UD
            ::
              BLOCKS=@UD
              COLUMNS=@UD
              SEG-LENGTH=@UD
            ::
              THREADS=@UD
              TIME-COST=@UD
              TYP=ARGON-TYPE
              VERSION=@UX
          ==
      ::
      ::  FILL-SEGMENT UTILITIES
      ::
      =>  |%
          ++  PUT-WORD
            |=  [ROB=(LIST @) I=@UD D=@]
            %+  WELD  (SCAG I ROB)
            [D (SLAG +(I) ROB)]
          --
      ^+  BUFFER
      ::
      ::  ROB:   ROW BUFFER TO OPERATE ON
      ::  DO-I:  WHETHER TO USE PRNS FROM INPUT RATHER THAN STATE
      ::  RANDS: PRNS GENERATED FROM INPUT, IF WE DO-I
      =+  ROB=(SNAG ROW BUFFER)
      =/  DO-I=?
        ?|  ?=(%I TYP)
            &(?=(%ID TYP) =(0 ITN) (LTE SEG 1))
            &(?=(%U TYP) =(0 ITN) (LTE SEG 2))
        ==
      =/  RANDS=(LIST (PAIR @ @))
        ?.  DO-I  ~
        ::
        ::  KEEP GOING UNTIL WE HAVE A LIST OF :SEG-LENGTH PRN PAIRS
        ::
        =+  L=0
        =+  COUNTER=1
        |-  ^-  (LIST (PAIR @ @))
        ?:  (GTE L SEG-LENGTH)  ~
        =-  (WELD - $(COUNTER +(COUNTER), L (ADD L 128)))
        ::
        ::  GENERATE PSEUDORANDOM BLOCK BY COMPRESSING METADATA
        ::
        =/  RANDOM-BLOCK=@
          %+  COMPRESS  0
          %+  COMPRESS  0
          %^  LSH  3  968
          %+  REP  6
          =+  (CURY (CURY REV 3) 8)
          :~  (- COUNTER)
              (- (TYPE-TO-NUM TYP))
              (- TIME-COST)
              (- BLOCKS)
              (- SEG)
              (- ROW)
              (- ITN)
          ==
        ::
        ::  SPLIT THE RANDOM-BLOCK INTO 64-BIT SECTIONS,
        ::  THEN EXTRACT THE FIRST TWO 4-BYTE SECTIONS FROM EACH.
        ::
        %+  TURN  (FLOP (RIP 6 RANDOM-BLOCK))
        |=  A=@
        ^-  (PAIR @ @)
        :-  (REV 3 4 (RSH 5 1 A))
        (REV 3 4 (END 5 1 A))
      ::
      ::  ITERATE OVER THE ENTIRE SEGMENT LENGTH
      ::
      =+  SIN=0
      |-
      ::
      ::  WHEN DONE, PRODUCE THE UPDATED BUFFER
      ::
      ?:  =(SIN SEG-LENGTH)
        %+  WELD  (SCAG ROW BUFFER)
        [ROB (SLAG +(ROW) BUFFER)]
      ::
      ::  COL: CURRENT COLUMN TO PROCESS
      =/  COL=@UD
        (ADD (MUL SEG SEG-LENGTH) SIN)
      ::
      ::  FIRST TWO COLUMNS ARE GENERATED FROM H0
      ::
      ?:  &(=(0 ITN) (LTH COL 2))
        =+  (APP-NUM (APP-NUM 64^H0 COL) ROW)
        =+  (HASH - 1.024)
        $(ROB (PUT-WORD ROB COL -), SIN +(SIN))
      ::
      ::  C1, C2: PRNS FOR PICKING REFERENCE BLOCK
      =+  ^-  [C1=@ C2=@]  ::TODO  =/ W/O FACE
        ?:  DO-I  (SNAG SIN RANDS)
        =+  =-  (SNAG - ROB)
            ?:  =(0 COL)  (DEC COLUMNS)
            (MOD (DEC COL) COLUMNS)
        :-  (REV 3 4 (CUT 3 [1.020 4] -))
        (REV 3 4 (CUT 3 [1.016 4] -))
      ::
      ::  REF-ROW: REFERENCE BLOCK ROW
      =/  REF-ROW=@UD
        ?:  &(=(0 ITN) =(0 SEG))  ROW
        (MOD C2 THREADS)
      ::
      ::  REF-COL: REFERENCE BLOCK COLUMN
      =/  REF-COL=@UD
        =-  (MOD - COLUMNS)
        %+  ADD
          ::  STARTING INDEX
          ?:  |(=(0 ITN) =(3 SEG))  0
          (MUL +(SEG) SEG-LENGTH)
        ::  PSEUDORANDOM OFFSET
        =-  %+  SUB  (DEC -)
            %^  RSH  0  32
            %+  MUL  -
            (RSH 0 32 (MUL C1 C1))
        ::  REFERENCE AREA SIZE
        ?:  =(0 ITN)
          ?:  |(=(0 SEG) =(ROW REF-ROW))  (DEC COL)
          ?:  =(0 SIN)  (DEC (MUL SEG SEG-LENGTH))
          (MUL SEG SEG-LENGTH)
        =+  SUL=(SUB COLUMNS SEG-LENGTH)
        ?:  =(REF-ROW ROW)   (DEC (ADD SUL SIN))
        ?:  =(0 SIN)  (DEC SUL)
        SUL
      ::
      ::  COMPRESS THE PREVIOUS AND REFERENCE BLOCK
      ::  TO CREATE THE NEW BLOCK
      ::
      =/  NEW=@
        %+  COMPRESS
          =-  (SNAG - ROB)
          ::  PREVIOUS INDEX, WRAP-AROUND
          ?:  =(0 COL)  (DEC COLUMNS)
          (MOD (DEC COL) COLUMNS)
        ::  GET REFERENCE BLOCK
        %+  SNAG  REF-COL
        ?:  =(REF-ROW ROW)  ROB
        (SNAG REF-ROW BUFFER)
      ::
      ::  STARTING FROM V1.3, WE XOR THE NEW BLOCK IN,
      ::  RATHER THAN DIRECTLY OVERWRITING THE OLD BLOCK
      ::
      =?  NEW  &(!=(0 ITN) =(0X13 VERSION))
        (MIX NEW (SNAG COL ROB))
      $(ROB (PUT-WORD ROB COL NEW), SIN +(SIN))
    ::
    ::  COMPRESSION FUNCTION (G)
    ++  COMPRESS
      ::  X, Y: ASSUMED TO BE 1024 BYTES
      |=  [X=@ Y=@]
      ^-  @
      ::
      =+  R=(MIX X Y)
      =|  Q=(LIST @)
      ::
      ::  ITERATE OVER ROWS OF R TO GET Q
      ::
      =+  I=0
      |-
      ?:  (LTH I 8)
        =;  P=(LIST @)
          $(Q (WELD Q P), I +(I))
        %-  PERMUTE
        =-  (WELD (REAP (SUB 8 (LENT -)) 0) -)
        %-  FLOP
        %+  RIP  7
        (CUT 10 [(SUB 7 I) 1] R)
      ::
      ::  ITERATE OVER COLUMNS OF Q TO GET Z
      ::
      =/  Z=(LIST @)  (REAP 64 0)
      =.  I  0
      |-
      ::
      ::  WHEN DONE, ASSEMBLE Z AND XOR IT WITH R
      ::
      ?.  (LTH I 8)
        (MIX (REP 7 (FLOP Z)) R)
      ::
      ::  PERMUTE THE COLUMN
      ::
      =/  OUT=(LIST @)
        %-  PERMUTE
        :~  (SNAG I Q)
            (SNAG (ADD I 8) Q)
            (SNAG (ADD I 16) Q)
            (SNAG (ADD I 24) Q)
            (SNAG (ADD I 32) Q)
            (SNAG (ADD I 40) Q)
            (SNAG (ADD I 48) Q)
            (SNAG (ADD I 56) Q)
        ==
      ::
      ::  PUT THE RESULT INTO Z PER COLUMN
      ::
      =+  J=0
      |-
      ?:  =(8 J)  ^$(I +(I))
      =-  $(Z -, J +(J))
      =+  (ADD I (MUL J 8))
      %+  WELD  (SCAG - Z)
      [(SNAG J OUT) (SLAG +(-) Z)]
    ::
    ::  PERMUTATION FUNCTION (P)
    ++  PERMUTE
      ::NOTE  THIS FUNCTION REALLY JUST TAKES AND PRODUCES
      ::      8 VALUES, BUT TAKING AND PRODUCING THEM AS
      ::      LISTS HELPS CLEAN UP THE CODE SIGNIFICANTLY.
      |=  S=(LIST @)
      ?>  =(8 (LENT S))
      ^-  (LIST @)
      ::
      ::  LIST INPUTS AS 16 8-BYTE VALUES
      ::
      =/  V=(LIST @)
        %-  ZING
        ^-  (LIST (LIST @))
        %+  TURN  S
        |=  A=@
        ::  REV FOR ENDIANNESS
        =+  (RIP 6 (REV 3 16 A))
        (WELD - (REAP (SUB 2 (LENT -)) 0))
      ::
      ::  DO PERMUTATION ROUNDS
      ::
      =.  V  (DO-ROUND V 0 4 8 12)
      =.  V  (DO-ROUND V 1 5 9 13)
      =.  V  (DO-ROUND V 2 6 10 14)
      =.  V  (DO-ROUND V 3 7 11 15)
      =.  V  (DO-ROUND V 0 5 10 15)
      =.  V  (DO-ROUND V 1 6 11 12)
      =.  V  (DO-ROUND V 2 7 8 13)
      =.  V  (DO-ROUND V 3 4 9 14)
      ::  REV FOR ENDIANNESS
      =.  V  (TURN V (CURY (CURY REV 3) 8))
      ::
      ::  CAT V BACK TOGETHER INTO 8 16-BYTE VALUES
      ::
      %+  TURN  (GULF 0 7)
      |=  I=@
      =+  (MUL 2 I)
      (CAT 6 (SNAG +(-) V) (SNAG - V))
    ::
    ::  PERFORM A ROUND AND PRODUCE UPDATED VALUE LIST
    ++  DO-ROUND
      |=  [V=(LIST @) NA=@ NB=@ NC=@ ND=@]
      ^+  V
      =>  |%
          ++  GET-WORD
            |=  I=@UD
            (SNAG I V)
          ::
          ++  PUT-WORD
            |=  [I=@UD D=@]
            ^+  V
            %+  WELD  (SCAG I V)
            [D (SLAG +(I) V)]
          --
      =-  =.  V  (PUT-WORD NA A)
          =.  V  (PUT-WORD NB B)
          =.  V  (PUT-WORD NC C)
                 (PUT-WORD ND D)
      %-  ROUND
      :*  (GET-WORD NA)
          (GET-WORD NB)
          (GET-WORD NC)
          (GET-WORD ND)
      ==
    ::
    ::  PERFORM A ROUND (BG) AND PRODUCE UPDATED VALUES
    ++  ROUND
      |=  [A=@ B=@ C=@ D=@]
      ^-  [A=@ B=@ C=@ D=@]
      ::  OPERATE ON 64 BIT WORDS
      =+  FED=~(. FE 6)
      =*  SUM  SUM:FED
      =*  ROR  ROR:FED
      =+  END=(CURY (CURY END 5) 1)
      =.  A  :(SUM A B :(MUL 2 (END A) (END B)))
      =.  D  (ROR 0 32 (MIX D A))
      =.  C  :(SUM C D :(MUL 2 (END C) (END D)))
      =.  B  (ROR 0 24 (MIX B C))
      =.  A  :(SUM A B :(MUL 2 (END A) (END B)))
      =.  D  (ROR 0 16 (MIX D A))
      =.  C  :(SUM C D :(MUL 2 (END C) (END D)))
      =.  B  (ROR 0 63 (MIX B C))
      [A B C D]
    ::
    ::  ARGON2 WRAPPER AROUND BLAKE2B (H')
    ++  HASH
      =,  BLAKE
      |=  [BYTS OUT=@UD]
      ^-  @
      ::
      ::  MSG: INPUT WITH BYTE-LENGTH PREPENDED
      =+  MSG=(PREP-NUM [WID DAT] OUT)
      ::
      ::  IF REQUESTED SIZE IS LOW ENOUGH, HASH DIRECTLY
      ::
      ?:  (LTE OUT 64)
        (BLAKE2B MSG 0^0 OUT)
      ::
      ::  BUILD UP THE RESULT BY HASHING AND RE-HASHING
      ::  THE INPUT MESSAGE, ADDING THE FIRST 32 BYTES
      ::  OF THE HASH TO THE RESULT, UNTIL WE HAVE THE
      ::  DESIRED OUTPUT SIZE.
      ::
      =+  TMP=(BLAKE2B MSG 0^0 64)
      =+  RES=(RSH 3 32 TMP)
      =.  OUT  (SUB OUT 32)
      |-
      ?:  (GTH OUT 64)
        =.  TMP  (BLAKE2B 64^TMP 0^0 64)
        =.  RES  (ADD (LSH 3 32 RES) (RSH 3 32 TMP))
        $(OUT (SUB OUT 32))
      %+  ADD  (LSH 3 OUT RES)
      (BLAKE2B 64^TMP 0^0 OUT)
    ::
    ::  UTILITIES
    ::
    ++  TYPE-TO-NUM
      |=  T=ARGON-TYPE
      ?-  T
        %D    0
        %I    1
        %ID   2
        %U   10
      ==
    ::
    ++  APP-NUM
      |=  [BYTS NUM=@UD]
      ^-  BYTS
      :-  (ADD WID 4)
      %+  CAN  3
      ~[4^(REV 3 4 NUM) WID^DAT]
    ::
    ++  PREP-NUM
      |=  [BYTS NUM=@UD]
      ^-  BYTS
      :-  (ADD WID 4)
      %+  CAN  3
      ~[WID^DAT 4^(REV 3 4 NUM)]
    ::
    ++  PREP-WID
      |=  A=BYTS
      (PREP-NUM A WID.A)
    --
  ::
  ++  RIPEMD
    ~%  %RIPEMD  ..IS  ~
    |%
    ++  RIPEMD-160
      ~/  %RIPEMD160
      |=  BYTS
      ^-  @
      ::  WE OPERATE ON BITS RATHER THAN BYTES
      =.  WID  (MUL WID 8)
      ::  ADD PADDING
      =+  (MD5-PAD WID DAT)
      ::  ENDIANNESS
      =.  DAT
        %+  REP  5
        %+  TURN  (RIP 5 DAT)
        |=(A=@ (REV 3 4 A))
      =*  X  DAT
      =+  BLOCKS=(DIV WID 512)
      =+  FEV=~(. FE 5)
      ::  INITIAL REGISTER VALUES
      =+  H0=0X6745.2301
      =+  H1=0XEFCD.AB89
      =+  H2=0X98BA.DCFE
      =+  H3=0X1032.5476
      =+  H4=0XC3D2.E1F0
      ::  I: CURRENT BLOCK
      =+  [I=0 J=0]
      =+  *[A=@ B=@ C=@ D=@ E=@]       ::  A..E
      =+  *[AA=@ BB=@ CC=@ DD=@ EE=@]  ::  A'..E'
      |^
        ?:  =(I BLOCKS)
          %+  REP  5
          %+  TURN  `(LIST @)`~[H4 H3 H2 H1 H0]
          ::  ENDIANNESS
          |=(H=@ (REV 3 4 H))
        =:  A  H0     AA  H0
            B  H1     BB  H1
            C  H2     CC  H2
            D  H3     DD  H3
            E  H4     EE  H4
        ==
        ::  J: CURRENT WORD
        =+  J=0
        |-
        ?:  =(J 80)
          %=  ^$
            I   +(I)
            H1  :(SUM:FEV H2 D EE)
            H2  :(SUM:FEV H3 E AA)
            H3  :(SUM:FEV H4 A BB)
            H4  :(SUM:FEV H0 B CC)
            H0  :(SUM:FEV H1 C DD)
          ==
        %=  $
          J  +(J)
        ::
          A   E
          B   (FN J A B C D E (GET (R J)) (K J) (S J))
          C   B
          D   (ROL 10 C)
          E   D
        ::
          AA  EE
          BB  (FN (SUB 79 J) AA BB CC DD EE (GET (RR J)) (KK J) (SS J))
          CC  BB
          DD  (ROL 10 CC)
          EE  DD
        ==
      ::
      ++  GET  ::  WORD FROM X IN BLOCK I
        |=  J=@UD
        =+  (ADD (MUL I 16) +(J))
        (CUT 5 [(SUB (MUL BLOCKS 16) -) 1] X)
      ::
      ++  FN
        |=  [J=@UD A=@ B=@ C=@ D=@ E=@ M=@ K=@ S=@]
        =-  (SUM:FEV (ROL S :(SUM:FEV A M K -)) E)
        =.  J  (DIV J 16)
        ?:  =(0 J)  (MIX (MIX B C) D)
        ?:  =(1 J)  (CON (DIS B C) (DIS (NOT 0 32 B) D))
        ?:  =(2 J)  (MIX (CON B (NOT 0 32 C)) D)
        ?:  =(3 J)  (CON (DIS B D) (DIS C (NOT 0 32 D)))
        ?:  =(4 J)  (MIX B (CON C (NOT 0 32 D)))
        !!
      ::
      ++  ROL  (CURY ROL:FEV 0)
      ::
      ++  K
        |=  J=@UD
        =.  J  (DIV J 16)
        ?:  =(0 J)  0X0
        ?:  =(1 J)  0X5A82.7999
        ?:  =(2 J)  0X6ED9.EBA1
        ?:  =(3 J)  0X8F1B.BCDC
        ?:  =(4 J)  0XA953.FD4E
        !!
      ::
      ++  KK  ::  K'
        |=  J=@UD
        =.  J  (DIV J 16)
        ?:  =(0 J)  0X50A2.8BE6
        ?:  =(1 J)  0X5C4D.D124
        ?:  =(2 J)  0X6D70.3EF3
        ?:  =(3 J)  0X7A6D.76E9
        ?:  =(4 J)  0X0
        !!
      ::
      ++  R
        |=  J=@UD
        %+  SNAG  J
        ^-  (LIST @)
        :~  0  1  2  3  4  5  6  7  8  9  10  11  12  13  14  15
            7  4  13  1  10  6  15  3  12  0  9  5  2  14  11  8
            3  10  14  4  9  15  8  1  2  7  0  6  13  11  5  12
            1  9  11  10  0  8  12  4  13  3  7  15  14  5  6  2
            4  0  5  9  7  12  2  10  14  1  3  8  11  6  15  13
        ==
      ::
      ++  RR  ::  R'
        |=  J=@UD
        %+  SNAG  J
        ^-  (LIST @)
        :~  5  14  7  0  9  2  11  4  13  6  15  8  1  10  3  12
            6  11  3  7  0  13  5  10  14  15  8  12  4  9  1  2
            15  5  1  3  7  14  6  9  11  8  12  2  10  0  4  13
            8  6  4  1  3  11  15  0  5  12  2  13  9  7  10  14
            12  15  10  4  1  5  8  7  6  2  13  14  0  3  9  11
        ==
      ::
      ++  S
        |=  J=@UD
        %+  SNAG  J
        ^-  (LIST @)
        :~  11  14  15  12  5  8  7  9  11  13  14  15  6  7  9  8
            7  6  8  13  11  9  7  15  7  12  15  9  11  7  13  12
            11  13  6  7  14  9  13  15  14  8  13  6  5  12  7  5
            11  12  14  15  14  15  9  8  9  14  5  6  8  6  5  12
            9  15  5  11  6  8  13  12  5  12  13  14  11  8  5  6
        ==
      ::
      ++  SS  ::  S'
        |=  J=@UD
        %+  SNAG  J
        ^-  (LIST @)
        :~  8  9  9  11  13  15  15  5  7  7  8  11  14  14  12  6
            9  13  15  7  12  8  9  11  7  7  12  7  6  15  13  11
            9  7  15  11  8  6  6  14  12  13  5  14  13  13  7  5
            15  5  8  11  14  14  6  14  6  9  12  9  12  5  15  8
            8  5  12  9  12  5  14  6  8  13  6  5  15  13  11  11
        ==
      --
    ::
    ++  MD5-PAD
      |=  BYTS
      ^-  BYTS
      =+  (SUB 511 (MOD (ADD WID 64) 512))
      :-  :(ADD 64 +(-) WID)
      %+  CAN  0
      ~[64^(REV 3 8 WID) +(-)^(LSH 0 - 1) WID^DAT]
    --
  ::
  ++  PBKDF
    =>  |%
        ++  MEET  |=([P=@ S=@ C=@ D=@] [[(MET 3 P) P] [(MET 3 S) S] C D])
        ++  FLIP  |=  [P=BYTS S=BYTS C=@ D=@]
                  [WID.P^(REV 3 P) WID.S^(REV 3 S) C D]
        --
    |%
    ::
    ::  USE WITH @
    ::
    ++  HMAC-SHA1     (CORK MEET HMAC-SHA1L)
    ++  HMAC-SHA256   (CORK MEET HMAC-SHA256L)
    ++  HMAC-SHA512   (CORK MEET HMAC-SHA512L)
    ::
    ::  USE WITH @T
    ::
    ++  HMAC-SHA1T    (CORK MEET HMAC-SHA1D)
    ++  HMAC-SHA256T  (CORK MEET HMAC-SHA256D)
    ++  HMAC-SHA512T  (CORK MEET HMAC-SHA512D)
    ::
    ::  USE WITH BYTS
    ::
    ++  HMAC-SHA1L    (CORK FLIP HMAC-SHA1D)
    ++  HMAC-SHA256L  (CORK FLIP HMAC-SHA256D)
    ++  HMAC-SHA512L  (CORK FLIP HMAC-SHA512D)
    ::
    ::  MAIN LOGIC
    ::
    ++  HMAC-SHA1D    (CURY PBKDF HMAC-SHA1L:HMAC 20)
    ++  HMAC-SHA256D  (CURY PBKDF HMAC-SHA256L:HMAC 32)
    ++  HMAC-SHA512D  (CURY PBKDF HMAC-SHA512L:HMAC 64)
    ::
    ++  PBKDF
      ::TODO  JET ME! ++HMAC:HMAC IS AN EXAMPLE
      |*  [[PRF=$-([BYTS BYTS] @) OUT=@U] P=BYTS S=BYTS C=@ D=@]
      =>  .(DAT.P (END 3 P), DAT.S (END 3 S))
      ::
      ::  MAX KEY LENGTH 1GB
      ::  MAX ITERATIONS 2^28
      ::
      ~|  [%INVALID-PBKDF-PARAMS C D]
      ?>  ?&  (LTE D (BEX 30))
              (LTE C (BEX 28))
              !=(C 0)
          ==
      =/  L
        ?~  (MOD D OUT)
          (DIV D OUT)
        +((DIV D OUT))
      =+  R=(SUB D (MUL OUT (DEC L)))
      =+  [T=0 J=1 K=1]
      =.  T
        |-  ^-  @
        ?:  (GTH J L)  T
        =/  U
          %+  ADD  DAT.S
          %^  LSH  3  WID.S
          %+  REP  3
          (FLOP (RPP:SCR 3 4 J))
        =+  F=0
        =.  F
          |-  ^-  @
          ?:  (GTH K C)  F
          =/  Q
            %^  REV  3  OUT
            =+  ?:(=(K 1) (ADD WID.S 4) OUT)
            (PRF [WID.P (REV 3 P)] [- (REV 3 - U)])
          $(U Q, F (MIX F Q), K +(K))
        $(T (ADD T (LSH 3 (MUL (DEC J) OUT) F)), J +(J))
      (REV 3 D (END 3 D T))
    --
  --  ::CRYPTO
::                                                      ::::
::::                      ++UNITY                       ::  (2C) UNIT PROMOTION
  ::                                                    ::::
++  UNITY  ^?
  |%
  ::                                                    ::  ++DROP-LIST:UNITY
  ++  DROP-LIST                                         ::  COLLAPSE UNIT LIST
    |*  LUT/(LIST (UNIT))
    ?.  |-  ^-  ?
        ?~(LUT & ?~(I.LUT | $(LUT T.LUT)))
      ~
    %-  SOME
    |-
    ?~  LUT  ~
    [I=U:+.I.LUT T=$(LUT T.LUT)]
  ::                                                    ::  ++DROP-MAP:UNITY
  ++  DROP-MAP                                          ::  COLLAPSE UNIT MAP
    |*  LUM/(MAP TERM (UNIT))
    ?:  (~(REP BY LUM) |=({{@ A/(UNIT)} B/_|} |(B ?=(~ A))))
      ~
    (SOME (~(RUN BY LUM) NEED))
  ::                                                    ::  ++DROP-POLE:UNITY
  ++  DROP-POLE                                         ::  UNIT TUPLE
    |*  BUT/(POLE (UNIT))
    ?~  BUT  !!
    ?~  +.BUT
      U:->.BUT
    [U:->.BUT (DROP-POLE +.BUT)]
  --
::                                                      ::::
::::                      ++FORMAT                      ::  (2D) COMMON FORMATS
  ::                                                    ::::
++  FORMAT  ^?
  |%
  ::                                                    ::  ++TO-WAIN:FORMAT
  ++  TO-WAIN                                           ::  ATOM TO LINE LIST
    ~%  %LORE  ..IS  ~
    |=  LUB/@
    =|  TEZ/(LIST @T)
    |-  ^+  TEZ
    =+  ^=  WOR
      =+  [MEG=0 I=0]
      |-  ^-  {MEG/@ I/@ END/@F}
      =+  GAM=(CUT 3 [I 1] LUB)
      ?:  =(0 GAM)
        [MEG I %.Y]
      ?:  =(10 GAM)
        [MEG I %.N]
      $(MEG (CAT 3 MEG GAM), I +(I))
    ?:  END.WOR
      (FLOP ^+(TEZ [MEG.WOR TEZ]))
    ?:  =(0 LUB)  (FLOP TEZ)
    $(LUB (RSH 3 +(I.WOR) LUB), TEZ [MEG.WOR TEZ])
  ::                                                    ::  ++OF-WAIN:FORMAT
  ++  OF-WAIN                                           ::  LINE LIST TO ATOM
    |=  TEZ/(LIST @T)
    =|  {OUR/@ I/@UD}
    |-  ^-  @
    ?~  TEZ
      OUR
    ?:  =(%$ I.TEZ)
      $(I +(I), TEZ T.TEZ, OUR (CAT 3 OUR 10))
    ?:  =(0 I)
      $(I +(I), TEZ T.TEZ, OUR I.TEZ)
    $(I +(I), TEZ T.TEZ, OUR (CAT 3 (CAT 3 OUR 10) I.TEZ))
  ::                                                    ::  ++OF-WALL:FORMAT
  ++  OF-WALL                                           ::  LINE LIST TO TAPE
    |=  A/WALL  ^-  TAPE
    ?~(A ~ "{I.A}\0A{$(A T.A)}")
  ::                                                    ::  ++EN-BEAM:FORMAT
  ++  EN-BEAM                                           ::  BEAM TO PATH
    |=  BEM/BEAM
    ^-  PATH
    [(SCOT %P P.BEM) Q.BEM (SCOT R.BEM) (FLOP S.BEM)]
  ::                                                    ::  ++DE-BEAM:FORMAT
  ++  DE-BEAM                                           ::  PARSE PATH TO BEAM
    |=  PAX/PATH
    ^-  (UNIT BEAM)
    ?.  ?=({* * * *} PAX)  ~
    %+  BIFF  (SLAW %P I.PAX)
    |=  WHO/SHIP
    %+  BIFF  (SLAW %TAS I.T.PAX)
    |=  DEX/DESK
    %+  BIFF  (SLAY I.T.T.PAX)
    |=  CIS/COIN
    ?.  ?=({$$ CASE} CIS)  ~
    `(UNIT BEAM)`[~ [WHO DEX `CASE`P.CIS] (FLOP T.T.T.PAX)]
  ::                                                    ::  ++ENJS:FORMAT
  ++  ENJS  ^?                                          ::  JSON ENCODERS
    |%
    ::                                                  ::  ++FROND:ENJS:FORMAT
    ++  FROND                                           ::  OBJECT FROM K-V PAIR
      |=  {P/@T Q/JSON}
      ^-  JSON
      [%O [[P Q] ~ ~]]
    ::                                                  ::  ++PAIRS:ENJS:FORMAT
    ++  PAIRS                                           ::  OBJECT FROM K-V LIST
      |=  A/(LIST {P/@T Q/JSON})
      ^-  JSON
      [%O (~(GAS BY *(MAP @T JSON)) A)]
    ::                                                  ::  ++TAPE:ENJS:FORMAT
    ++  TAPE                                            ::  STRING FROM TAPE
      |=  A/^TAPE
      ^-  JSON
      [%S (CRIP A)]
    ::                                                  ::  ++WALL:ENJS:FORMAT
    ++  WALL                                            ::  STRING FROM WALL
      |=  A/^WALL
      ^-  JSON
      (TAPE (OF-WALL A))
    ::                                                  ::  ++SHIP:ENJS:FORMAT
    ++  SHIP                                            ::  STRING FROM SHIP
      |=  A/^SHIP
      ^-  JSON
      (TAPE (SLAG 1 (SCOW %P A)))
    ::                                                  ::  ++NUMB:ENJS:FORMAT
    ++  NUMB                                            ::  NUMBER FROM UNSIGNED
      |=  A/@U
      ^-  JSON
      :-  %N
      ?:  =(0 A)  '0'
      %-  CRIP
      %-  FLOP
      |-  ^-  ^TAPE
      ?:(=(0 A) ~ [(ADD '0' (MOD A 10)) $(A (DIV A 10))])
    ::                                                  ::  ++TIME:ENJS:FORMAT
    ++  TIME                                            ::  MS TIMESTAMP
      |=  A/^TIME
      =-  (NUMB (DIV (MUL - 1.000) ~S1))
      (ADD (DIV ~S1 2.000) (SUB A ~1970.1.1))
    --  ::ENJS
  ::                                                    ::  ++DEJS:FORMAT
  ++  DEJS                                              ::  JSON REPARSER
    =>  |%  ++  GRUB  *                                 ::  RESULT
            ++  FIST  $-(JSON GRUB)                     ::  REPARSER INSTANCE
        --  ::
    |%
    ::                                                  ::  ++AR:DEJS:FORMAT
    ++  AR                                              ::  ARRAY AS LIST
      |*  WIT/FIST
      |=  JON/JSON  ^-  (LIST _(WIT *JSON))
      ?>  ?=({$A *} JON)
      (TURN P.JON WIT)
    ::                                                  ::  ++AT:DEJS:FORMAT
    ++  AT                                              ::  ARRAY AS TUPLE
      |*  WIL/(POLE FIST)
      |=  JON/JSON
      ?>  ?=({$A *} JON)
      ((AT-RAW WIL) P.JON)
    ::                                                  ::  ++AT-RAW:DEJS:FORMAT
    ++  AT-RAW                                          ::  ARRAY AS TUPLE
      |*  WIL/(POLE FIST)
      |=  JOL/(LIST JSON)
      ?~  JOL  !!
      ?-    WIL                                         :: MINT-VAIN ON EMPTY
          :: {WIT/* T/*}
          {* T/*}
        =>  .(WIL [WIT *]=WIL)
        ?~  T.WIL  ?^(T.JOL !! (WIT.WIL I.JOL))
        [(WIT.WIL I.JOL) ((AT-RAW T.WIL) T.JOL)]
      ==
    ::                                                  ::  ++BO:DEJS:FORMAT
    ++  BO                                              ::  BOOLEAN
      |=(JON/JSON ?>(?=({$B *} JON) P.JON))
    ::                                                  ::  ++BU:DEJS:FORMAT
    ++  BU                                              ::  BOOLEAN NOT
      |=(JON/JSON ?>(?=({$B *} JON) !P.JON))
    ::                                                  ::  ++CI:DEJS:FORMAT
    ++  CI                                              ::  MAYBE TRANSFORM
      |*  {POQ/GATE WIT/FIST}
      |=  JON/JSON
      (NEED (POQ (WIT JON)))
    ::                                                  ::  ++CU:DEJS:FORMAT
    ++  CU                                              ::  TRANSFORM
      |*  {POQ/GATE WIT/FIST}
      |=  JON/JSON
      (POQ (WIT JON))
    ::                                                  ::  ++DI:DEJS:FORMAT
    ++  DI                                              ::  MILLISECOND DATE
      %+  CU
        |=  A/@U  ^-  @DA
        (ADD ~1970.1.1 (DIV (MUL ~S1 A) 1.000))
      NI
    ::                                                  ::  ++MU:DEJS:FORMAT
    ++  MU                                              ::  TRUE UNIT
      |*  WIT/FIST
      |=  JON/JSON
      ?~(JON ~ (SOME (WIT JON)))
    ::                                                  ::  ++NE:DEJS:FORMAT
    ++  NE                                              ::  NUMBER AS REAL
      |=  JON/JSON
      ^-  (UNIT @RD)
      ::  PLEASE IMPLEMENT ME, IT'S NOT THAT HARD!
      !!
    ::                                                  ::  ++NI:DEJS:FORMAT
    ++  NI                                              ::  NUMBER AS INTEGER
      |=  JON/JSON
      ?>  ?=({$N *} JON)
      (RASH P.JON DEM)
    ::                                                  ::  ++NO:DEJS:FORMAT
    ++  NO                                              ::  NUMBER AS CORD
      |=(JON/JSON ?>(?=({$N *} JON) P.JON))
    ::                                                  ::  ++OF:DEJS:FORMAT
    ++  OF                                              ::  OBJECT AS FROND
      |*  WER/(POLE {CORD FIST})
      |=  JON/JSON
      ?>  ?=({$O {@ *} $~ $~} JON)
      |-
      ?-    WER                                         :: MINT-VAIN ON EMPTY
          :: {{KEY/@T WIT/*} T/*}
          {{KEY/@T *} T/*}
        =>  .(WER [[* WIT] *]=WER)
        ?:  =(KEY.WER P.N.P.JON)
          [KEY.WER ~|(KEY+KEY.WER (WIT.WER Q.N.P.JON))]
        ?~  T.WER  ~|(BAD-KEY+P.N.P.JON !!)
        ((OF T.WER) JON)
      ==
    ::                                                  ::  ++OT:DEJS:FORMAT
    ++  OT                                              ::  OBJECT AS TUPLE
      |*  WER/(POLE {CORD FIST})
      |=  JON/JSON
      ?>  ?=({$O *} JON)
      ((OT-RAW WER) P.JON)
    ::                                                  ::  ++OT-RAW:DEJS:FORMAT
    ++  OT-RAW                                          ::  OBJECT AS TUPLE
      |*  WER/(POLE {CORD FIST})
      |=  JOM/(MAP @T JSON)
      ?-    WER                                         :: MINT-VAIN ON EMPTY
          :: {{KEY/@T WIT/*} T/*}
          {{KEY/@T *} T/*}
        =>  .(WER [[* WIT] *]=WER)
        =/  TEN  ~|(KEY+KEY.WER (WIT.WER (~(GOT BY JOM) KEY.WER)))
        ?~(T.WER TEN [TEN ((OT-RAW T.WER) JOM)])
      ==
    ::
    ++  OU                                              ::  OBJECT OF UNITS
      |*  WER/(POLE {CORD FIST})
      |=  JON/JSON
      ?>  ?=({$O *} JON)
      ((OU-RAW WER) P.JON)
    ::                                                  ::  ++OU-RAW:DEJS:FORMAT
    ++  OU-RAW                                          ::  OBJECT OF UNITS
      |*  WER/(POLE {CORD FIST})
      |=  JOM/(MAP @T JSON)
      ?-    WER                                         :: MINT-VAIN ON EMPTY
          :: {{KEY/@T WIT/*} T/*}
          {{KEY/@T *} T/*}
        =>  .(WER [[* WIT] *]=WER)
        =/  TEN  ~|(KEY+KEY.WER (WIT.WER (~(GET BY JOM) KEY.WER)))
        ?~(T.WER TEN [TEN ((OU-RAW T.WER) JOM)])
      ==
    ::                                                  ::  ++OM:DEJS:FORMAT
    ++  OM                                              ::  OBJECT AS MAP
      |*  WIT/FIST
      |=  JON/JSON
      ?>  ?=({$O *} JON)
      (~(RUN BY P.JON) WIT)
    ::                                                  ::  ++OP:DEJS:FORMAT
    ++  OP                                              ::  PARSE KEYS OF MAP
      |*  {FEL/RULE WIT/FIST}
      |=  JON/JSON  ^-  (MAP _(WONK *FEL) _*WIT)
      =/  JOM  ((OM WIT) JON)
      %-  MALT
      %+  TURN  ~(TAP BY JOM)
      |*  {A/CORD B/*}
      =>  .(+< [A B]=+<)
      [(RASH A FEL) B]
    ::                                                  ::  ++PE:DEJS:FORMAT
    ++  PE                                              ::  PREFIX
      |*  {PRE/* WIT/FIST}
      (CU |*(* [PRE +<]) WIT)
    ::                                                  ::  ++SA:DEJS:FORMAT
    ++  SA                                              ::  STRING AS TAPE
      |=(JON/JSON ?>(?=({$S *} JON) (TRIP P.JON)))
    ::                                                  ::  ++SO:DEJS:FORMAT
    ++  SO                                              ::  STRING AS CORD
      |=(JON/JSON ?>(?=({$S *} JON) P.JON))
    ::                                                  ::  ++SU:DEJS:FORMAT
    ++  SU                                              ::  PARSE STRING
      |*  SAB/RULE
      |=  JON/JSON  ^+  (WONK *SAB)
      ?>  ?=({$S *} JON)
      (RASH P.JON SAB)
    ::                                                  ::  ++UF:DEJS:FORMAT
    ++  UF                                              ::  UNIT FALL
      |*  [DEF/* WIT/FIST]
      |=  JON/(UNIT JSON)
      ?~(JON DEF (WIT U.JON))
    ::                                                  ::  ++UN:DEJS:FORMAT
    ++  UN                                              ::  UNIT NEED
      |*  WIT/FIST
      |=  JON/(UNIT JSON)
      (WIT (NEED JON))
    ::                                                  ::  ++UL:DEJS:FORMAT
    ++  UL                                              ::  NULL
      |=(JON/JSON ?~(JON ~ !!))
    ::
    ++  ZA                                              ::  FULL UNIT POLE
      |*  POD/(POLE (UNIT))
      ?~  POD  &
      ?~  -.POD  |
      (ZA +.POD)
    ::
    ++  ZL                                              ::  COLLAPSE UNIT LIST
      |*  LUT/(LIST (UNIT))
      ?.  |-  ^-  ?
          ?~(LUT & ?~(I.LUT | $(LUT T.LUT)))
        ~
      %-  SOME
      |-
      ?~  LUT  ~
      [I=U:+.I.LUT T=$(LUT T.LUT)]
    ::
    ++  ZP                                              ::  UNIT TUPLE
      |*  BUT/(POLE (UNIT))
      ?~  BUT  !!
      ?~  +.BUT
        U:->.BUT
      [U:->.BUT (ZP +.BUT)]
    ::
    ++  ZM                                              ::  COLLAPSE UNIT MAP
      |*  LUM/(MAP TERM (UNIT))
      ?:  (~(REP BY LUM) |=({{@ A/(UNIT)} B/_|} |(B ?=(~ A))))
        ~
      (SOME (~(RUN BY LUM) NEED))
    --  ::DEJS
  ::                                                    ::  ++DEJS-SOFT:FORMAT
  ++  DEJS-SOFT                                         ::  JSON REPARSE TO UNIT
    =,  UNITY
    =>  |%  ++  GRUB  (UNIT *)                          ::  RESULT
            ++  FIST  $-(JSON GRUB)                     ::  REPARSER INSTANCE
        --  ::
    ::
    ::  XX: THIS IS OLD CODE THAT REPLACED A REWRITTEN DEJS.
    ::      THE REWRITTEN DEJS REST-LOOPED WITH ++REDO.  THE OLD
    ::      CODE IS STILL IN REVISION CONTROL -- REVISE AND REPLACE.
    ::
    |%
    ++  AR                                              ::  ARRAY AS LIST
      |*  WIT/FIST
      |=  JON/JSON
      ?.  ?=({$A *} JON)  ~
      %-  ZL
      |-
      ?~  P.JON  ~
      [I=(WIT I.P.JON) T=$(P.JON T.P.JON)]
    ::
    ++  AT                                              ::  ARRAY AS TUPLE
      |*  WIL/(POLE FIST)
      |=  JON/JSON
      ?.  ?=({$A *} JON)  ~
      =+  RAW=((AT-RAW WIL) P.JON)
      ?.((ZA RAW) ~ (SOME (ZP RAW)))
    ::
    ++  AT-RAW                                          ::  ARRAY AS TUPLE
      |*  WIL/(POLE FIST)
      |=  JOL/(LIST JSON)
      ?~  WIL  ~
      :-  ?~(JOL ~ (-.WIL I.JOL))
      ((AT-RAW +.WIL) ?~(JOL ~ T.JOL))
    ::
    ++  BO                                              ::  BOOLEAN
      |=(JON/JSON ?.(?=({$B *} JON) ~ [~ U=P.JON]))
    ::
    ++  BU                                              ::  BOOLEAN NOT
      |=(JON/JSON ?.(?=({$B *} JON) ~ [~ U=!P.JON]))
    ::
    ++  CI                                              ::  MAYBE TRANSFORM
      |*  {POQ/GATE WIT/FIST}
      |=  JON/JSON
      (BIFF (WIT JON) POQ)
    ::
    ++  CU                                              ::  TRANSFORM
      |*  {POQ/GATE WIT/FIST}
      |=  JON/JSON
      (BIND (WIT JON) POQ)
    ::
    ++  DA                                              ::  UTC DATE
      |=  JON/JSON
      ?.  ?=({$S *} JON)  ~
      (BIND (STUD:CHRONO:USERLIB P.JON) |=(A/DATE (YEAR A)))
    ::
    ++  DI                                              ::  MILLISECOND DATE
      %+  CU
        |=  A/@U  ^-  @DA
        (ADD ~1970.1.1 (DIV (MUL ~S1 A) 1.000))
      NI
    ::
    ++  MU                                              ::  TRUE UNIT
      |*  WIT/FIST
      |=  JON/JSON
      ?~(JON (SOME ~) (BIND (WIT JON) SOME))
    ::
    ++  NE                                              ::  NUMBER AS REAL
      |=  JON/JSON
      ^-  (UNIT @RD)
      !!
    ::
    ++  NI                                              ::  NUMBER AS INTEGER
      |=  JON/JSON
      ?.  ?=({$N *} JON)  ~
      (RUSH P.JON DEM)
    ::
    ++  NO                                              ::  NUMBER AS CORD
      |=  JON/JSON
      ?.  ?=({$N *} JON)  ~
      (SOME P.JON)
    ::
    ++  OF                                              ::  OBJECT AS FROND
      |*  WER/(POLE {CORD FIST})
      |=  JON/JSON
      ?.  ?=({$O {@ *} ~ ~} JON)  ~
      |-
      ?~  WER  ~
      ?:  =(-.-.WER P.N.P.JON)
        ((PE -.-.WER +.-.WER) Q.N.P.JON)
      ((OF +.WER) JON)
    ::
    ++  OT                                              ::  OBJECT AS TUPLE
      |*  WER/(POLE {CORD FIST})
      |=  JON/JSON
      ?.  ?=({$O *} JON)  ~
      =+  RAW=((OT-RAW WER) P.JON)
      ?.((ZA RAW) ~ (SOME (ZP RAW)))
    ::
    ++  OT-RAW                                          ::  OBJECT AS TUPLE
      |*  WER/(POLE {CORD FIST})
      |=  JOM/(MAP @T JSON)
      ?~  WER  ~
      =+  TEN=(~(GET BY JOM) -.-.WER)
      [?~(TEN ~ (+.-.WER U.TEN)) ((OT-RAW +.WER) JOM)]
    ::
    ++  OM                                              ::  OBJECT AS MAP
      |*  WIT/FIST
      |=  JON/JSON
      ?.  ?=({$O *} JON)  ~
      (ZM (~(RUN BY P.JON) WIT))
    ::
    ++  OP                                              ::  PARSE KEYS OF MAP
      |*  {FEL/RULE WIT/FIST}
      %+  CU
        |=  A/(LIST (PAIR _(WONK *FEL) _(NEED *WIT)))
        (MY:NL A)
      %-  CI  :_  (OM WIT)
      |=  A/(MAP CORD _(NEED *WIT))
      ^-  (UNIT (LIST _[(WONK *FEL) (NEED *WIT)]))
      %-  ZL
      %+  TURN  ~(TAP BY A)
      |=  {A/CORD B/_(NEED *WIT)}
      =+  NIT=(RUSH A FEL)
      ?~  NIT  ~
      (SOME [U.NIT B])
    ::
    ++  PE                                              ::  PREFIX
      |*  {PRE/* WIT/FIST}
      (CU |*(* [PRE +<]) WIT)
    ::
    ++  SA                                              ::  STRING AS TAPE
      |=  JON/JSON
      ?.(?=({$S *} JON) ~ (SOME (TRIP P.JON)))
    ::
    ++  SO                                              ::  STRING AS CORD
      |=  JON/JSON
      ?.(?=({$S *} JON) ~ (SOME P.JON))
    ::
    ++  SU                                              ::  PARSE STRING
      |*  SAB/RULE
      |=  JON/JSON
      ?.  ?=({$S *} JON)  ~
      (RUSH P.JON SAB)
    ::
    ++  UL  |=(JON/JSON ?~(JON (SOME ~) ~))             ::  NULL
    ++  ZA                                              ::  FULL UNIT POLE
      |*  POD/(POLE (UNIT))
      ?~  POD  &
      ?~  -.POD  |
      (ZA +.POD)
    ::
    ++  ZL                                              ::  COLLAPSE UNIT LIST
      |*  LUT/(LIST (UNIT))
      ?.  |-  ^-  ?
          ?~(LUT & ?~(I.LUT | $(LUT T.LUT)))
        ~
      %-  SOME
      |-
      ?~  LUT  ~
      [I=U:+.I.LUT T=$(LUT T.LUT)]
    ::
    ++  ZP                                              ::  UNIT TUPLE
      |*  BUT/(POLE (UNIT))
      ?~  BUT  !!
      ?~  +.BUT
        U:->.BUT
      [U:->.BUT (ZP +.BUT)]
    ::
    ++  ZM                                              ::  COLLAPSE UNIT MAP
      |*  LUM/(MAP TERM (UNIT))
      ?:  (~(REP BY LUM) |=({{@ A/(UNIT)} B/_|} |(B ?=(~ A))))
        ~
      (SOME (~(RUN BY LUM) NEED))
    --  ::DEJS-SOFT
  --
::                                                      ::
::::                      ++DIFFER                      ::  (2D) HUNT-MCILROY
  ::                                                    ::::
++  DIFFER  ^?
  =,  CLAY
  =,  FORMAT
  |%
  ::                                                    ::  ++BERK:DIFFER
  ++  BERK                                              ::  INVERT DIFF PATCH
    |*  BUR/(URGE)
    |-  ^+  BUR
    ?~  BUR  ~
    :_  $(BUR T.BUR)
    ?-  -.I.BUR
      %&  I.BUR
      %|  [%| Q.I.BUR P.I.BUR]
    ==
  ::                                                    ::  ++LOSS:DIFFER
  ++  LOSS                                              ::  LONGEST SUBSEQUENCE
    ~%  %LOSS  ..IS  ~
    |*  {HEL/(LIST) HEV/(LIST)}
    |-  ^+  HEV
    =+  ^=  SEV
        =+  [INX=0 SEV=*(MAP _I.-.HEV (LIST @UD))]
        |-  ^+  SEV
        ?~  HEV  SEV
        =+  GUY=(~(GET BY SEV) I.HEV)
        %=  $
          HEV  T.HEV
          INX  +(INX)
          SEV  (~(PUT BY SEV) I.HEV [INX ?~(GUY ~ U.GUY)])
        ==
    =|  GOX/{P/@UD Q/(MAP @UD {P/@UD Q/_HEV})}
    =<  ABET
    =<  MAIN
    |%
    ::                                                  ::  ++ABET:LOSS:DIFFER
    ++  ABET                                            ::  SUBSEQUENCE
      ^+  HEV
      ?:  =(0 P.GOX)  ~
      (FLOP Q:(NEED (~(GET BY Q.GOX) (DEC P.GOX))))
    ::                                                  ::  ++HINK:LOSS:DIFFER
    ++  HINK                                            ::  EXTEND FITS TOP
      |=  {INX/@UD GOY/@UD}  ^-  ?
      ?|  =(P.GOX INX)
          (LTH GOY P:(NEED (~(GET BY Q.GOX) INX)))
      ==
    ::                                                  ::  ++LONK:LOSS:DIFFER
    ++  LONK                                            ::  EXTEND FITS BOTTOM
      |=  {INX/@UD GOY/@UD}  ^-  ?
      ?|  =(0 INX)
          (GTH GOY P:(NEED (~(GET BY Q.GOX) (DEC INX))))
      ==
    ::                                                  ::  ++LUNA:LOSS:DIFFER
    ++  LUNA                                            ::  EXTEND
      |=  {INX/@UD GOY/@UD}
      ^+  +>
      %_    +>.$
          GOX
        :-  ?:(=(INX P.GOX) +(P.GOX) P.GOX)
        %+  ~(PUT BY Q.GOX)  INX
        :+  GOY
          (SNAG GOY HEV)
        ?:(=(0 INX) ~ Q:(NEED (~(GET BY Q.GOX) (DEC INX))))
      ==
    ::                                                  ::  ++MERG:LOSS:DIFFER
    ++  MERG                                            ::  MERGE ALL MATCHES
      |=  GAY/(LIST @UD)
      ^+  +>
      =+  ^=  ZES
          =+  [INX=0 ZES=*(LIST {P/@UD Q/@UD})]
          |-  ^+  ZES
          ?:  |(?=(~ GAY) (GTH INX P.GOX))  ZES
          ?.  (LONK INX I.GAY)  $(GAY T.GAY)
          ?.  (HINK INX I.GAY)  $(INX +(INX))
          $(INX +(INX), GAY T.GAY, ZES [[INX I.GAY] ZES])
      |-  ^+  +>.^$
      ?~(ZES +>.^$ $(ZES T.ZES, +>.^$ (LUNA I.ZES)))
    ::                                                  ::  ++MAIN:LOSS:DIFFER
    ++  MAIN                                            ::
      =+  HOL=HEL
      |-  ^+  +>
      ?~  HOL  +>
      =+  GUY=(~(GET BY SEV) I.HOL)
      $(HOL T.HOL, +> (MERG (FLOP `(LIST @UD)`?~(GUY ~ U.GUY))))
    --  ::
  ::                                                    ::  ++LURK:DIFFER
  ++  LURK                                              ::  APPLY LIST PATCH
    |*  {HEL/(LIST) RUG/(URGE)}
    ^+  HEL
    =+  WAR=`_HEL`~
    |-  ^+  HEL
    ?~  RUG  (FLOP WAR)
    ?-    -.I.RUG
        %&
      %=   $
        RUG  T.RUG
        HEL  (SLAG P.I.RUG HEL)
        WAR  (WELD (FLOP (SCAG P.I.RUG HEL)) WAR)
      ==
    ::
        %|
      %=  $
        RUG  T.RUG
        HEL  =+  GUR=(FLOP P.I.RUG)
             |-  ^+  HEL
             ?~  GUR  HEL
             ?>(&(?=(^ HEL) =(I.GUR I.HEL)) $(HEL T.HEL, GUR T.GUR))
        WAR  (WELD Q.I.RUG WAR)
      ==
    ==
  ::                                                    ::  ++LUSK:DIFFER
  ++  LUSK                                              ::  LCS TO LIST PATCH
    |*  {HEL/(LIST) HEV/(LIST) LCS/(LIST)}
    =+  ^=  RAG
        ^-  {$%({%& P/@UD} {%| P/_LCS Q/_LCS})}
        [%& 0]
    =>  .(RAG [P=RAG Q=*(LIST _RAG)])
    =<  ABET  =<  MAIN
    |%
    ::                                                  ::  ++ABET:LUSK:DIFFER
    ++  ABET                                            ::
      =?  Q.RAG  !=([& 0] P.RAG)  [P.RAG Q.RAG]
      (FLOP Q.RAG)
    ::                                                  ::  ++DONE:LUSK:DIFFER
    ++  DONE                                            ::
      |=  NEW/_P.RAG
      ^+  RAG
      ?-  -.P.RAG
        %|   ?-  -.NEW
              %|  [[%| (WELD P.NEW P.P.RAG) (WELD Q.NEW Q.P.RAG)] Q.RAG]
              %&  [NEW [P.RAG Q.RAG]]
            ==
        %&   ?-  -.NEW
              %|  [NEW ?:(=(0 P.P.RAG) Q.RAG [P.RAG Q.RAG])]
              %&  [[%& (ADD P.P.RAG P.NEW)] Q.RAG]
            ==
      ==
    ::                                                  ::  ++MAIN:LUSK:DIFFER
    ++  MAIN                                            ::
      |-  ^+  +
      ?~  HEL
        ?~  HEV
          ?>(?=(~ LCS) +)
        $(HEV T.HEV, RAG (DONE %| ~ [I.HEV ~]))
      ?~  HEV
        $(HEL T.HEL, RAG (DONE %| [I.HEL ~] ~))
      ?~  LCS
        +(RAG (DONE %| (FLOP HEL) (FLOP HEV)))
      ?:  =(I.HEL I.LCS)
        ?:  =(I.HEV I.LCS)
          $(LCS T.LCS, HEL T.HEL, HEV T.HEV, RAG (DONE %& 1))
        $(HEV T.HEV, RAG (DONE %| ~ [I.HEV ~]))
      ?:  =(I.HEV I.LCS)
        $(HEL T.HEL, RAG (DONE %| [I.HEL ~] ~))
      $(HEL T.HEL, HEV T.HEV, RAG (DONE %| [I.HEL ~] [I.HEV ~]))
    --  ::
  --  ::DIFFER
::                                                      ::
::::                      ++HTML                        ::  (2E) TEXT ENCODINGS
  ::                                                    ::::
++  HTML  ^?  ::  XX RENAME TO WEB-TXT
  =,  EYRE
  |%
  ::                                                    ::
  ::::                    ++MIMES:HTML                  ::  (2E1) MIME
    ::                                                  ::::
  ++  MIMES  ^?
    |%
    ::                                                  ::  ++AS-OCTS:MIMES:HTML
    ++  AS-OCTS                                         ::  ATOM TO OCTSTREAM
      |=  TAM/@  ^-  OCTS
      [(MET 3 TAM) TAM]
    ::                                                  ::  ++AS-OCTT:MIMES:HTML
    ++  AS-OCTT                                         ::  TAPE TO OCTSTREAM
      |=  TEP/TAPE  ^-  OCTS
      (AS-OCTS (RAP 3 TEP))
    ::                                                  ::  ++EN-MITE:MIMES:HTML
    ++  EN-MITE                                         ::  MIME TYPE TO TEXT
      |=  MYN/MITE
      %-  CRIP
      |-  ^-  TAPE
      ?~  MYN  ~
      ?:  =(~ T.MYN)  (TRIP I.MYN)
      (WELD (TRIP I.MYN) `TAPE`['/' $(MYN T.MYN)])
    ::                                                  ::  ++EN-BASE64:MIMES:
    ++  EN-BASE64                                       ::  ENCODE BASE64
      |=  TIG/@
      ^-  TAPE
      =+  POC=(~(DIF FO 3) 0 (MET 3 TIG))
      =+  PAD=(LSH 3 POC (SWP 3 TIG))
      =+  ^=  CHA
      'ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+/'
      =+  ^=  SIF
          |-  ^-  TAPE
          ?~  PAD
            ~
          =+  D=(END 0 6 PAD)
          [(CUT 3 [D 1] CHA) $(PAD (RSH 0 6 PAD))]
      (WELD (FLOP (SLAG POC SIF)) (REAP POC '='))
    ::                                                  ::  ++DE-BASE64:MIMES:
    ++  DE-BASE64                                       ::  DECODE BASE64
      =-  |=(A/CORD (RASH A FEL))
      =<  FEL=(COOK |~(A/@ `@T`(SWP 3 A)) (BASS 64 .))
      =-  (COOK WELP ;~(PLUG (PLUS SIW) (STUN 0^2 (COLD %0 TIS))))
      ^=  SIW
      ;~  POSE
         (COOK |=(A/@ (SUB A 'A')) (SHIM 'A' 'Z'))
         (COOK |=(A/@ (SUB A 'G')) (SHIM 'A' 'Z'))
         (COOK |=(A/@ (ADD A 4)) (SHIM '0' '9'))
         (COLD 62 (JUST '+'))
         (COLD 63 (JUST '/'))
       ==
    ::
    ++  EN-BASE58
      |=  DAT=@
      =/  CHA
        '123456789ABCDEFGHJKLMNPQRSTUVWXYZABCDEFGHIJKMNOPQRSTUVWXYZ'
      %-  FLOP
      |-  ^-  TAPE
      ?:  =(0 DAT)  ~
      :-  (CUT 3 [(MOD DAT 58) 1] CHA)
      $(DAT (DIV DAT 58))
    ::
    ++  DE-BASE58
      |=  T=TAPE
      =-  (SCAN T (BASS 58 (PLUS -)))
      ;~  POSE
        (COOK |=(A=@ (SUB A 56)) (SHIM 'A' 'H'))
        (COOK |=(A=@ (SUB A 57)) (SHIM 'J' 'N'))
        (COOK |=(A=@ (SUB A 58)) (SHIM 'P' 'Z'))
        (COOK |=(A=@ (SUB A 64)) (SHIM 'A' 'K'))
        (COOK |=(A=@ (SUB A 65)) (SHIM 'M' 'Z'))
        (COOK |=(A=@ (SUB A 49)) (SHIM '1' '9'))
      ==
    --  ::MIMES
  ::                                                    ::  ++EN-JSON:HTML
  ++  EN-JSON                                           ::  PRINT JSON
    |^  |=(VAL/JSON (APEX VAL ""))
    ::                                                  ::  ++APEX:EN-JSON:HTML
    ++  APEX
      |=  {VAL/JSON REZ/TAPE}
      ^-  TAPE
      ?~  VAL  (WELD "NULL" REZ)
      ?-    -.VAL
          $A
        :-  '['
        =.  REZ  [']' REZ]
        !.
        ?~  P.VAL  REZ
        |-
        ?~  T.P.VAL  ^$(VAL I.P.VAL)
        ^$(VAL I.P.VAL, REZ [',' $(P.VAL T.P.VAL)])
     ::
          $B  (WELD ?:(P.VAL "TRUE" "FALSE") REZ)
          $N  (WELD (TRIP P.VAL) REZ)
          $S
        :-  '"'
        =.  REZ  ['"' REZ]
        =+  VIZ=(TRIP P.VAL)
        !.
        |-  ^-  TAPE
        ?~  VIZ  REZ
        =+  HED=(JESC I.VIZ)
        ?:  ?=({@ ~} HED)
          [I.HED $(VIZ T.VIZ)]
        (WELD HED $(VIZ T.VIZ))
     ::
          $O
        :-  '{'
        =.  REZ  ['}' REZ]
        =+  VIZ=~(TAP BY P.VAL)
        ?~  VIZ  REZ
        !.
        |-  ^+  REZ
        ?~  T.VIZ  ^$(VAL [%S P.I.VIZ], REZ [':' ^$(VAL Q.I.VIZ)])
        =.  REZ  [',' $(VIZ T.VIZ)]
        ^$(VAL [%S P.I.VIZ], REZ [':' ^$(VAL Q.I.VIZ)])
      ==
    ::                                                  ::  ++JESC:EN-JSON:HTML
    ++  JESC                                            ::  ESCAPED
      =+  UTF=|=(A/@ ['\\' 'U' ((X-CO 4):CO A)])
      |=  A/@  ^-  TAPE
      ?+  A  ?:((GTH A 0X1F) [A ~] (UTF A))
        $10  "\\N"
        $34  "\\\""
        $92  "\\\\"
      ==
    --  ::EN-JSON
  ::                                                    ::  ++DE-JSON:HTML
  ++  DE-JSON                                           ::  PARSE JSON
    =<  |=(A/CORD `(UNIT JSON)`(RUSH A APEX))
    |%
    ::                                                  ::  ++ABOX:DE-JSON:HTML
    ++  ABOX                                            ::  ARRAY
      %+  STAG  %A
      (IFIX [LAC (WISH RAC)] (MORE (WISH COM) APEX))
    ::                                                  ::  ++APEX:DE-JSON:HTML
    ++  APEX                                            ::  ANY VALUE
      %+  KNEE  *JSON  |.  ~+
      %+  IFIX  [SPAC SPAC]
      ;~  POSE
        (COLD ~ (JEST 'NULL'))
        (STAG %B BOOL)
        (STAG %S STRI)
        (COOK |=(S/TAPE [%N P=(RAP 3 S)]) NUMB)
        ABOX
        OBOX
      ==
    ::                                                  ::  ++BOOL:DE-JSON:HTML
    ++  BOOL                                            ::  BOOLEAN
      ;~  POSE
        (COLD & (JEST 'TRUE'))
        (COLD | (JEST 'FALSE'))
      ==
    ::                                                  ::  ++DIGS:DE-JSON:HTML
    ++  DIGS                                            ::  DIGITS
      (STAR (SHIM '0' '9'))
    ::                                                  ::  ++ESCA:DE-JSON:HTML
    ++  ESCA                                            ::  ESCAPED CHARACTER
      ;~  PFIX  BAS
        =*  LOO
          =*  LIP
            ^-  (LIST (PAIR @T @))
            [B+8 T+9 N+10 F+12 R+13 ~]
          =*  WOW  `(MAP @T @)`(MALT LIP)
          (SEAR ~(GET BY WOW) LOW)
        =*  TUF  ;~(PFIX (JUST 'U') (COOK TUFT QIX:AB))
        ;~(POSE YEL NET SAY BAS LOO TUF)
      ==
    ::                                                  ::  ++EXPO:DE-JSON:HTML
    ++  EXPO                                            ::  EXPONENT
      ;~  (COMP TWEL)
        (PIEC (MASK "EE"))
        (MAYB (PIEC (MASK "+-")))
        DIGS
      ==
    ::                                                  ::  ++FRAC:DE-JSON:HTML
    ++  FRAC                                            ::  FRACTION
      ;~(PLUG DOT DIGS)
    ::                                                  ::  ++JCHA:DE-JSON:HTML
    ++  JCHA                                            ::  STRING CHARACTER
      ;~(POSE ;~(LESS YEL BAS PRN) ESCA)
    ::                                                  ::  ++MAYB:DE-JSON:HTML
    ++  MAYB                                            ::  OPTIONAL
      |*(BUS/RULE ;~(POSE BUS (EASY ~)))
    ::                                                  ::  ++NUMB:DE-JSON:HTML
    ++  NUMB                                            ::  NUMBER
      ;~  (COMP TWEL)
        (MAYB (PIEC HEP))
        ;~  POSE
          (PIEC (JUST '0'))
          ;~(PLUG (SHIM '1' '9') DIGS)
        ==
        (MAYB FRAC)
        (MAYB EXPO)
      ==
    ::                                                  ::  ++OBJE:DE-JSON:HTML
    ++  OBJE                                            ::  OBJECT LIST
      %+  IFIX  [(WISH LEB) (WISH REB)]
      (MORE (WISH COM) PEAR)
    ::                                                  ::  ++OBOX:DE-JSON:HTML
    ++  OBOX                                            ::  OBJECT
      (STAG %O (COOK MALT OBJE))
    ::                                                  ::  ++PEAR:DE-JSON:HTML
    ++  PEAR                                            ::  KEY-VALUE
      ;~(PLUG ;~(SFIX (WISH STRI) (WISH COL)) APEX)
    ::                                                  ::  ++PIEC:DE-JSON:HTML
    ++  PIEC                                            ::  LISTIFY
      |*  BUS/RULE
      (COOK |=(A/@ [A ~]) BUS)
    ::                                                  ::  ++STRI:DE-JSON:HTML
    ++  STRI                                            ::  STRING
      (COOK CRIP (IFIX [YEL YEL] (STAR JCHA)))
    ::                                                  ::  ++TOPS:DE-JSON:HTML
    ++  TOPS                                            ::  STRICT VALUE
      ;~(POSE ABOX OBOX)
    ::                                                  ::  ++SPAC:DE-JSON:HTML
    ++  SPAC                                            ::  WHITESPACE
      (STAR (MASK [`@`9 `@`10 `@`13 ' ' ~]))
    ::                                                  ::  ++TWEL:DE-JSON:HTML
    ++  TWEL                                            ::  TAPE WELD
      |=({A/TAPE B/TAPE} (WELD A B))
    ::                                                  ::  ++WISH:DE-JSON:HTML
    ++  WISH                                            ::  WITH WHITESPACE
      |*(SEF/RULE ;~(PFIX SPAC SEF))
    --  ::DE-JSON
  ::                                                    ::  ++EN-XML:HTML
  ++  EN-XML                                            ::  XML PRINTER
    =<  |=(A/MANX `TAPE`(APEX A ~))
    |_  _[UNQ=`?`| COT=`?`|]
    ::                                                  ::  ++APEX:EN-XML:HTML
    ++  APEX                                            ::  TOP LEVEL
      |=  {MEX/MANX REZ/TAPE}
      ^-  TAPE
      ?:  ?=({$$ {{$$ *} ~}} G.MEX)
        (ESCP V.I.A.G.MEX REZ)
      =+  MAN=`MANE`N.G.MEX
      =.  UNQ  |(UNQ =(%SCRIPT MAN) =(%STYLE MAN))
      =+  TAM=(NAME MAN)
      =+  ATT=`MART`A.G.MEX
      :-  '<'
      %+  WELP  TAM
      =-  ?~(ATT REZ [' ' (ATTR ATT REZ)])
      ^-  REZ/TAPE
      ?:  &(?=(~ C.MEX) |(COT ?^(MAN | (CLOT MAN))))
        [' ' '/' '>' REZ]
      :-  '>'
      (MANY C.MEX :(WELD "</" TAM ">" REZ))
    ::                                                  ::  ++ATTR:EN-XML:HTML
    ++  ATTR                                            ::  ATTRIBUTES TO TAPE
      |=  {TAT/MART REZ/TAPE}
      ^-  TAPE
      ?~  TAT  REZ
      =.  REZ  $(TAT T.TAT)
      ;:  WELD
        (NAME N.I.TAT)
        "=\""
        (ESCP(UNQ |) V.I.TAT '"' ?~(T.TAT REZ [' ' REZ]))
      ==
    ::                                                  ::  ++ESCP:EN-XML:HTML
    ++  ESCP                                            ::  ESCAPE FOR XML
      |=  {TEX/TAPE REZ/TAPE}
      ?:  UNQ
        (WELD TEX REZ)
      =+  XET=`TAPE`(FLOP TEX)
      !.
      |-  ^-  TAPE
      ?~  XET  REZ
      %=    $
        XET  T.XET
        REZ  ?-  I.XET
               $34  ['&' 'Q' 'U' 'O' 'T' ';' REZ]
               $38  ['&' 'A' 'M' 'P' ';' REZ]
               $39  ['&' '#' '3' '9' ';' REZ]
               $60  ['&' 'L' 'T' ';' REZ]
               $62  ['&' 'G' 'T' ';' REZ]
               *    [I.XET REZ]
             ==
      ==
    ::                                                  ::  ++MANY:EN-XML:HTML
    ++  MANY                                            ::  NODELIST TO TAPE
      |=  {LIX/(LIST MANX) REZ/TAPE}
      |-  ^-  TAPE
      ?~  LIX  REZ
      (APEX I.LIX $(LIX T.LIX))
    ::                                                  ::  ++NAME:EN-XML:HTML
    ++  NAME                                            ::  NAME TO TAPE
      |=  MAN/MANE  ^-  TAPE
      ?@  MAN  (TRIP MAN)
      (WELD (TRIP -.MAN) `TAPE`[':' (TRIP +.MAN)])
    ::                                                  ::  ++CLOT:EN-XML:HTML
    ++  CLOT  ~+                                        ::  SELF-CLOSING TAGS
      %~  HAS  IN
      %-  SILT  ^-  (LIST TERM)  :~
        %AREA  %BASE  %BR  %COL  %COMMAND  %EMBED  %HR  %IMG  %INPUTT
        %KEYGEN  %LINK  %META  %PARAM     %SOURCE   %TRACK  %WBR
      ==
    --  ::EN-XML
  ::                                                    ::  ++DE-XML:HTML
  ++  DE-XML                                            ::  XML PARSER
    =<  |=(A/CORD (RUSH A APEX))
    |_  ENT/_`(MAP TERM @T)`[[%APOS '\''] ~ ~]
    ::                                                  ::  ++APEX:DE-XML:HTML
    ++  APEX                                            ::  TOP LEVEL
      =+  SPA=;~(POSE COMT WHIT)
      %+  KNEE  *MANX  |.  ~+
      %+  IFIX  [(STAR SPA) (STAR SPA)]
      ;~  POSE
        %+  SEAR  |=({A/MARX B/MARL C/MANE} ?.(=(C N.A) ~ (SOME [A B])))
          ;~(PLUG HEAD MANY TAIL)
        EMPT
      ==
    ::                                                  ::  ++ATTR:DE-XML:HTML
    ++  ATTR                                            ::  ATTRIBUTES
      %+  KNEE  *MART  |.  ~+
      %-  STAR
      ;~  PLUG
        ;~(PFIX (PLUS WHIT) NAME)
        ;~  POSE
          (IFIX [;~(PLUG TIS YEL) YEL] (STAR ;~(LESS YEL ESCP)))
          (IFIX [;~(PLUG TIS SAY) SAY] (STAR ;~(LESS SAY ESCP)))
          (EASY ~)
        ==
      ==
    ::                                                  ::  ++CHRD:DE-XML:HTML
    ++  CHRD                                            ::  CHARACTER DATA
      %+  COOK  |=(A/TAPE ^-(MARS ;/(A)))
      (PLUS ;~(LESS YEL ;~(POSE (JUST `@`10) ESCP)))
    ::                                                  ::  ++COMT:DE-XML:HTML
    ++  COMT                                            ::  COMMENTS
      =-  (IFIX [(JEST '<!--') (JEST '-->')] (STAR -))
      ;~  POSE
        ;~(LESS HEP PRN)
        WHIT
        ;~(LESS (JEST '-->') HEP)
      ==
    ::                                                  ::  ++ESCP:DE-XML:HTML
    ++  ESCP                                            ::
      ;~(POSE ;~(LESS LED BAN PAD PRN) ENTY)
    ::                                                  ::  ++ENTY:DE-XML:HTML
    ++  ENTY                                            ::  ENTITY
      %+  IFIX  PAD^MIC
      ;~  POSE
        =+  DEF=^+(ENT (MY:NL [%GT '>'] [%LT '<'] [%AMP '&'] [%QUOT '"'] ~))
        %+  SEAR  ~(GET BY (~(UNI BY DEF) ENT))
        (COOK CRIP ;~(PLUG ALF (STUN 1^31 ALN)))
        %+  COOK  |=(A/@C ?:((GTH A 0X10.FFFF) '�' (TUFT A)))
        =<  ;~(PFIX HAX ;~(POSE - +))
        :-  (BASS 10 (STUN 1^8 DIT))
        (BASS 16 ;~(PFIX (MASK "XX") (STUN 1^8 HIT)))
      ==
    ::                                                  ::  ++EMPT:DE-XML:HTML
    ++  EMPT                                            ::  SELF-CLOSING TAG
      %+  IFIX  [GAL (JEST '/>')]
      ;~(PLUG ;~(PLUG NAME ATTR) (COLD ~ (STAR WHIT)))
    ::                                                  ::  ++HEAD:DE-XML:HTML
    ++  HEAD                                            ::  OPENING TAG
      (IFIX [GAL BAN] ;~(PLUG NAME ATTR))
    ::                                                  ::  ++MANY:DE-XML:HTML
    ++  MANY                                            ::  CONTENTS
      (MORE (STAR COMT) ;~(POSE APEX CHRD))
    ::                                                  ::  ++NAME:DE-XML:HTML
    ++  NAME                                            ::  TAG NAME
      =+  ^=  CHX
          %+  COOK  CRIP
          ;~  PLUG
              ;~(POSE CAB ALF)
              (STAR ;~(POSE CAB DOT ALP))
          ==
      ;~(POSE ;~(PLUG ;~(SFIX CHX COL) CHX) CHX)
    ::                                                  ::  ++TAIL:DE-XML:HTML
    ++  TAIL                                            ::  CLOSING TAG
      (IFIX [(JEST '</') BAN] NAME)
    ::                                                  ::  ++WHIT:DE-XML:HTML
    ++  WHIT                                            ::  WHITESPACE
      (MASK ~[' ' `@`0X9 `@`0XA])
    --  ::DE-XML
  ::                                                    ::  ++EN-URLT:HTML
  ++  EN-URLT                                           ::  URL ENCODE
    |=  TEP/TAPE
    ^-  TAPE
    %-  ZING
    %+  TURN  TEP
    |=  TAP/CHAR
    =+  XEN=|=(TIG/@ ?:((GTE TIG 10) (ADD TIG 55) (ADD TIG '0')))
    ?:  ?|  &((GTE TAP 'A') (LTE TAP 'Z'))
            &((GTE TAP 'A') (LTE TAP 'Z'))
            &((GTE TAP '0') (LTE TAP '9'))
            =('.' TAP)
            =('-' TAP)
            =('~' TAP)
            =('_' TAP)
        ==
      [TAP ~]
    ['%' (XEN (RSH 0 4 TAP)) (XEN (END 0 4 TAP)) ~]
  ::                                                    ::  ++DE-URLT:HTML
  ++  DE-URLT                                           ::  URL DECODE
    |=  TEP/TAPE
    ^-  (UNIT TAPE)
    ?~  TEP  [~ ~]
    ?:  =('%' I.TEP)
      ?.  ?=({@ @ *} T.TEP)  ~
      =+  NAG=(MIX I.T.TEP (LSH 3 1 I.T.T.TEP))
      =+  VAL=(RUSH NAG HEX:AG)
      ?~  VAL  ~
      =+  NEX=$(TEP T.T.T.TEP)
      ?~(NEX ~ [~ [`@`U.VAL U.NEX]])
    =+  NEX=$(TEP T.TEP)
    ?~(NEX ~ [~ I.TEP U.NEX])
  ::                                                    ::  ++EN-PURL:HTML
  ++  EN-PURL                                           ::  PRINT PURL
    =<  |=(PUL/PURL `TAPE`(APEX %& PUL))
    |%
    ::                                                  ::  ++APEX:EN-PURL:HTML
    ++  APEX                                            ::
      |=  QUR/QURI  ^-  TAPE
      ?-  -.QUR
        %&  (WELD (HEAD P.P.QUR) `TAPE`$(QUR [%| +.P.QUR]))
        %|  ['/' (WELD (BODY P.QUR) (TAIL Q.QUR))]
      ==
    ::                                                  ::  ++APIX:EN-PURL:HTML
    ++  APIX                                            ::  PURF TO TAPE
      |=  PURF
      (WELD (APEX %& P) ?~(Q "" `TAPE`['#' (TRIP U.Q)]))
    ::                                                  ::  ++BODY:EN-PURL:HTML
    ++  BODY                                            ::
      |=  POK/PORK  ^-  TAPE
      ?~  Q.POK  ~
      |-
      =+  SEG=(EN-URLT (TRIP I.Q.POK))
      ?~  T.Q.POK
        ?~(P.POK SEG (WELP SEG '.' (TRIP U.P.POK)))
      (WELP SEG '/' $(Q.POK T.Q.POK))
    ::                                                  ::  ++HEAD:EN-PURL:HTML
    ++  HEAD                                            ::
      |=  HAR/HART
      ^-  TAPE
      ;:  WELD
        ?:(&(P.HAR !?=(HOKE R.HAR)) "HTTPS://" "HTTP://")
      ::
        ?-  -.R.HAR
          %|  (TRIP (RSH 3 1 (SCOT %IF P.R.HAR)))
          %&  =+  RIT=(FLOP P.R.HAR)
              |-  ^-  TAPE
              ?~  RIT  ~
              (WELD (TRIP I.RIT) ?~(T.RIT "" `TAPE`['.' $(RIT T.RIT)]))
        ==
      ::
        ?~(Q.HAR ~ `TAPE`[':' ((D-CO:CO 1) U.Q.HAR)])
      ==
    ::                                                  ::  ++TAIL:EN-PURL:HTML
    ++  TAIL                                            ::
      |=  KAY/QUAY
      ^-  TAPE
      ?:  =(~ KAY)  ~
      :-  '?'
      |-  ^-  TAPE
      ?~  KAY  ~
      ;:  WELP
        (EN-URLT (TRIP P.I.KAY))
        ?~(Q.I.KAY ~ ['=' (EN-URLT (TRIP Q.I.KAY))])
        ?~(T.KAY ~ `TAPE`['&' $(KAY T.KAY)])
      ==
    --  ::
  ::                                                    ::  ++DE-PURL:HTML
  ++  DE-PURL                                           ::  URL+HEADER PARSER
    =<  |=(A/CORD `(UNIT PURL)`(RUSH A AURI))
    |%
    ::                                                  ::  ++DEFT:DE-PURL:HTML
    ++  DEFT                                            ::  PARSE URL EXTENSION
      |=  RAX/(LIST @T)
      |-  ^-  PORK
      ?~  RAX
        [~ ~]
      ?^  T.RAX
        [P.POK [IRE Q.POK]]:[POK=$(RAX T.RAX) IRE=I.RAX]
      =+  ^-  RAF/(LIKE TERM)
          =>  |=(A/@ ((SAND %TAS) (CRIP (FLOP (TRIP A)))))
          (;~(SFIX (SEAR . SYM) DOT) [1^1 (FLOP (TRIP I.RAX))])
      ?~  Q.RAF
        [~ [I.RAX ~]]
      =+  `{EXT/TERM {@ @} FYL/TAPE}`U.Q.RAF
      :-  `EXT
      ?:(=(~ FYL) ~ [(CRIP (FLOP FYL)) ~])
    ::                                                  ::  ++APAT:DE-PURL:HTML
    ++  APAT                                            ::  2396 ABS_PATH
      %+  COOK  DEFT
      (IFIX [NET ;~(POSE NET (EASY ~))] (MORE NET SMEG))
    ::                                                  ::  ++AURF:DE-PURL:HTML
    ++  AURF                                            ::  2396 WITH FRAGMENT
      %+  COOK  |~(A/PURF A)
      ;~(PLUG AURI (PUNT ;~(PFIX HAX (COOK CRIP (STAR PQUE)))))
    ::                                                  ::  ++AURI:DE-PURL:HTML
    ++  AURI                                            ::  2396 URL
      ;~  PLUG
        ;~(PLUG HTTS THOR)
        ;~(PLUG ;~(POSE APAT (EASY *PORK)) YQUE)
      ==
    ::                                                  ::  ++AURU:DE-PURL:HTML
    ++  AURU                                            ::  2396 WITH MAYBE USER
      %+  COOK
        |=  $:  A/{P/? Q/(UNIT USER) R/{(UNIT @UD) HOST}}
                B/{PORK QUAY}
            ==
        ^-  (PAIR (UNIT USER) PURL)
        [Q.A [[P.A R.A] B]]
      ::
      ;~  PLUG
        ;~(PLUG HTTS (PUNT ;~(SFIX URT:AB VAT)) THOR)
        ;~(PLUG ;~(POSE APAT (EASY *PORK)) YQUE)
      ==
    ::                                                  ::  ++HTTS:DE-PURL:HTML
    ++  HTTS                                            ::  SCHEME
      %+  SEAR  ~(GET BY (MALT `(LIST (PAIR TERM ?))`[HTTP+| HTTPS+& ~]))
      ;~(SFIX SCEM ;~(PLUG COL NET NET))
    ::                                                  ::  ++COCK:DE-PURL:HTML
    ++  COCK                                            ::  COOKIE
      %+  MOST  ;~(PLUG MIC ACE)
      ;~(PLUG TOKE ;~(PFIX TIS TOSK))
    ::                                                  ::  ++DLAB:DE-PURL:HTML
    ++  DLAB                                            ::  2396 DOMAINLABEL
      %+  SEAR
        |=  A/@TA
        ?.(=('-' (RSH 3 (DEC (MET 3 A)) A)) [~ U=A] ~)
      %+  COOK  |=(A/TAPE (CRIP (CASS A)))
      ;~(PLUG ALN (STAR ALP))
    ::                                                  ::  ++FQUE:DE-PURL:HTML
    ++  FQUE                                            ::  NORMAL QUERY FIELD
      (COOK CRIP (PLUS PQUO))
    ::                                                  ::  ++FQUU:DE-PURL:HTML
    ++  FQUU                                            ::  OPTIONAL QUERY FIELD
      (COOK CRIP (STAR PQUO))
    ::                                                  ::  ++PCAR:DE-PURL:HTML
    ++  PCAR                                            ::  2396 PATH CHAR
      ;~(POSE PURE PESC PSUB COL VAT)
    ::                                                  ::  ++PCOK:DE-PURL:HTML
    ++  PCOK                                            ::  COOKIE CHAR
      ;~(LESS BAS MIC COM YEL PRN)
    ::                                                  ::  ++PESC:DE-PURL:HTML
    ++  PESC                                            ::  2396 ESCAPED
      ;~(PFIX CEN MES)
    ::                                                  ::  ++POLD:DE-PURL:HTML
    ++  POLD                                            ::
      (COLD ' ' (JUST '+'))
    ::                                                  ::  ++PQUE:DE-PURL:HTML
    ++  PQUE                                            ::  3986 QUERY CHAR
      ;~(POSE PCAR NET WUT)
    ::                                                  ::  ++PQUO:DE-PURL:HTML
    ++  PQUO                                            ::  NORMAL QUERY CHAR
      ;~(POSE PURE PESC POLD NET WUT COL)
    ::                                                  ::  ++PURE:DE-PURL:HTML
    ++  PURE                                            ::  2396 UNRESERVED
      ;~(POSE ALN HEP DOT CAB SIG)
    ::                                                  ::  ++PSUB:DE-PURL:HTML
    ++  PSUB                                            ::  3986 SUB-DELIMS
      ;~  POSE
        ZAP  BUS  PAD  SAY  LIT  RIT
        TAR  LUS  COM  MIC  TIS
      ==
    ::                                                  ::  ++PTOK:DE-PURL:HTML
    ++  PTOK                                            ::  2616 TOKEN
      ;~  POSE
        ALN  ZAP  HAX  BUS  CEN  PAD  SAY  TAR  LUS
        HEP  DOT  KET  CAB  TEC  BAR  SIG
      ==
    ::                                                  ::  ++SCEM:DE-PURL:HTML
    ++  SCEM                                            ::  2396 SCHEME
      %+  COOK  |=(A/TAPE (CRIP (CASS A)))
      ;~(PLUG ALF (STAR ;~(POSE ALN LUS HEP DOT)))
    ::                                                  ::  ++SMEG:DE-PURL:HTML
    ++  SMEG                                            ::  2396 SEGMENT
      (COOK CRIP (PLUS PCAR))
    ::                                                  ::  ++TOCK:DE-PURL:HTML
    ++  TOCK                                            ::  6265 RAW VALUE
      (COOK CRIP (PLUS PCOK))
    ::                                                  ::  ++TOSK:DE-PURL:HTML
    ++  TOSK                                            ::  6265 QUOTED VALUE
      ;~(POSE TOCK (IFIX [YEL YEL] TOCK))
    ::                                                  ::  ++TOKE:DE-PURL:HTML
    ++  TOKE                                            ::  2616 TOKEN
      (COOK CRIP (PLUS PTOK))
    ::                                                  ::  ++THOR:DE-PURL:HTML
    ++  THOR                                            ::  2396 HOST+PORT
      %+  COOK  |*({* *} [+<+ +<-])
      ;~  PLUG
        THOS
        ;~((BEND) (EASY ~) ;~(PFIX COL DIM:AG))
      ==
    ::                                                  ::  ++THOS:DE-PURL:HTML
    ++  THOS                                            ::  2396 HOST, NO LOCAL
      ;~  PLUG
        ;~  POSE
          %+  STAG  %&
          %+  SEAR                                      ::  LL PARSER WEAK HERE
            |=  A/(LIST @T)
            =+  B=(FLOP A)
            ?>  ?=(^ B)
            =+  C=(END 3 1 I.B)
            ?.(&((GTE C 'A') (LTE C 'Z')) ~ [~ U=B])
          (MOST DOT DLAB)
        ::
          %+  STAG  %|
          =+  TOD=(APE:AG TED:AB)
          %+  BASS  256
          ;~(PLUG TOD (STUN [3 3] ;~(PFIX DOT TOD)))
        ==
      ==
    ::                                                  ::  ++YQUE:DE-PURL:HTML
    ++  YQUE                                            ::  QUERY ENDING
      ;~  POSE
        ;~(PFIX WUT YQUY)
        (EASY ~)
      ==
    ::                                                  ::  ++YQUY:DE-PURL:HTML
    ++  YQUY                                            ::  QUERY
      ;~  POSE
        ::  PROPER QUERY
        ::
        %+  MORE
          ;~(POSE PAD MIC)
        ;~(PLUG FQUE ;~(POSE ;~(PFIX TIS FQUU) (EASY '')))
        ::
        ::  FUNKY QUERY
        ::
        %+  COOK
          |=(A/TAPE [[%$ (CRIP A)] ~])
        (STAR PQUE)
      ==
    ::                                                  ::  ++ZEST:DE-PURL:HTML
    ++  ZEST                                            ::  2616 REQUEST-URI
      ;~  POSE
        (STAG %& (COOK |=(A/PURL A) AURI))
        (STAG %| ;~(PLUG APAT YQUE))
      ==
    --  ::DE-PURL
  ::  MOVEME
  ::                                                    ::  ++FUEL:HTML
  ++  FUEL                                              ::  PARSE URBIT FCGI
      |=  {BEM/BEAM CED/NOUN:CRED QUY/QUER}
      ^-  EPIC
      =+  QIX=|-(`QUAY`?~(QUY QUY [[P Q]:QUY $(QUY T.QUY)]))
      [(MALT QIX) ((HARD CRED) CED) BEM]
  --  ::EYRE
::                                                      ::
::::                      ++WIRED                       ::  WIRE FORMATTING
  ::                                                    ::::
++  WIRED  ^?
  |%
  ::
  ++  AULD                                              ::  ++AULD:WIRED
    |=  SKY/ROOF                                        ::  OLD STYLE NAMESPACE
    ^-  SLYT
    |=  {REF/* RAW/*}
    =+  PUX=((SOFT PATH) RAW)
    ?~  PUX  ~
    ?.  ?=({@ @ @ @ *} U.PUX)  ~
    =+  :*  HYR=(SLAY I.U.PUX)
            FAL=(SLAY I.T.U.PUX)
            DYC=(SLAY I.T.T.U.PUX)
            VED=(SLAY I.T.T.T.U.PUX)
            TYL=T.T.T.T.U.PUX
        ==
    ?.  ?=({~ $$ $TAS @} HYR)  ~
    ?.  ?=({~ $$ $P @} FAL)  ~
    ?.  ?=({~ $$ $TAS @} DYC)  ~
    ?.  ?=(^ VED)  ~
    =+  RON=Q.P.U.HYR
    =+  BED=[[Q.P.U.FAL Q.P.U.DYC (CASE P.U.VED)] (FLOP TYL)]
    =+  BOP=(SKY REF ~ RON BED)
    ?~  BOP  ~
    ?~  U.BOP  [~ ~]
    [~ ~ +.Q.U.U.BOP]
  ::                                                    ::  ++DRAY:WIRED
  ++  DRAY                                              ::  LOAD TUPLE IN PATH
    ::
    ::  .=  ~[P=~.ACK Q=~.~SARNEL R=~..Y]
    ::  (DRAY ~[P=%TAS Q=%P R=%F] %ACK ~SARNEL &)
    ::
    =-  |*  {A/{@TAS (POLE @TAS)} B/*}  ^-  (PAF A)
        =>  .(B `,(TUP -.A +.A)`B)
        ?~  +.A  [(SCOT -.A B) ~]
        [(SCOT -.A -.B) `,(PAF +.A)`(..$ +.A +.B)]
    :-  PAF=|*(A/(POLE) ?~(A $~ {(ODO:RAID ,-.A(. %TA)) ,(..$ +.A)}))
    ^=  TUP
    |*  {A/@TAS B/(POLE @TAS)}
    =+  C=(ODO:RAID A)
    ?~(B C {C (..$ ,-.B ,+.B)})
  ::                                                    ::  ++RAID:WIRED
  ++  RAID                                              ::  DEMAND PATH ODORS
    ::
    ::  .=  [P=%ACK Q=~SARNEL R=&]
    ::  (RAID /ACK/~SARNEL+.Y P=%TAS Q=%P R=%F ~)
    ::
    =-  |*  {A/PATH B/{@TAS (POLE @TAS)}}
        =*  FOG  (ODO -.B)
        ?~  +.B  `FOG`(SLAV -.B -.A)
        [`FOG`(SLAV -.B -.A) (..$ +.A +.B)]
    ^=  ODO
    |*  A/@TAS
    |=  B/*
    =-  A(, (- B))                  ::  PRESERVE FACE
    ?+  A   @
      $C  @C  $DA  @DA  $DR  @DR  $F   @F   $IF  @IF  $IS  @IS  $P   @P
      $U  @U  $UC  @UC  $UB  @UB  $UI  @UI  $UX  @UX  $UV  @UV  $UW  @UW
      $S  @S  $T   @T   $TA  @TA  $TAS  @TAS
    ==
::  ::                                                    ::  ++READ:WIRED
::  ++  READ                                              ::  PARSE ODORED PATH
::    =<  |*({A/PATH B/{@TAS (POLE @TAS)}} ((+> B) A))
::    |*  B/{@TAS (POLE @TAS)}
::    |=  A/PATH
::    ?~  A  ~
::    =+  HED=(SLAW -.B I.A)
::    =*  FOG  (ODO:RAID -.B)
::    ?~  +.B
::      ^-  (UNIT FOG)
::      ?^(+.A ~ HED)
::    ^-  (UNIT {FOG _(NEED *(..^$ +.B))})
::    (BOTH HED ((..^$ +.B) +.A))
  --  ::WIRED
::                                                      ::
::::                      ++TITLE                       ::  (2J) NAMESPACE
  ::                                                    ::::
++  TITLE
  =>  |%
      ::                                                ::  ++CLAN:TITLE
      ++  CLAN                                          ::  SHIP TO RANK
        |=  WHO=SHIP
        ^-  RANK
        =/  WID  (MET 3 WHO)
        ?:  (LTE WID 1)   %CZAR
        ?:  =(2 WID)      %KING
        ?:  (LTE WID 4)   %DUKE
        ?:  (LTE WID 8)   %EARL
        ?>  (LTE WID 16)  %PAWN
      ::                                                ::  ++RANK:TITLE
      +$  RANK  ?(%CZAR %KING %DUKE %EARL %PAWN)        ::  SHIP WIDTH CLASS
      ::                                                ::  ++SAXO:TITLE
      ++  SAXO                                          ::  AUTOCANON
        |=  WHO=SHIP
        ^-  (LIST SHIP)
        =/  DAD  (SEIN WHO)
        [WHO ?:(=(WHO DAD) ~ $(WHO DAD))]
      ::                                                ::  ++SEIN:TITLE
      ++  SEIN                                          ::  AUTOBOSS
        |=  WHO=SHIP
        ^-  SHIP
        =/  MIR  (CLAN WHO)
        ?-  MIR
          $CZAR  WHO
          $KING  (END 3 1 WHO)
          $DUKE  (END 4 1 WHO)
          $EARL  (END 5 1 WHO)
          $PAWN  (END 4 1 WHO)
        ==
      --
  |%
  ::                                                    ::  ++CITE:TITLE
  ++  CITE                                              ::  RENDER SHIP
    |=  WHO/@P
    ^-  TAPE
    =+  KIND=(CLAN WHO)
    =+  NAME=(SCOW %P WHO)
    ?:  =(%EARL KIND)
      :(WELD "~" (SWAG [15 6] NAME) "^" (SWAG [22 6] NAME))
    ?:  =(%PAWN KIND)
      :(WELD (SWAG [0 7] NAME) "_" (SWAG [51 6] NAME))
    NAME
  ::                                                    ::  ++SAXO:TITLE
  ++  SAXO                                              ::  AUTOCANON
    |=  [OUR=SHIP NOW=@DA WHO=SHIP]
    .^  (LIST SHIP)
        %J
        /(SCOT %P OUR)/SAXO/(SCOT %DA NOW)/(SCOT %P WHO)
    ==
  ::                                                    ::  ++SEIN:TITLE
  ++  SEIN                                              ::  AUTOBOSS
    |=  [OUR=SHIP NOW=@DA WHO=SHIP]
    .^  SHIP
        %J
        /(SCOT %P OUR)/SEIN/(SCOT %DA NOW)/(SCOT %P WHO)
    ==
  ::                                                    ::  ++TEAM:TITLE
  ++  TEAM                                              ::  OUR / OUR MOON
    |=  [OUR=SHIP WHO=SHIP]
    ^-  ?
    ?|  =(OUR WHO)
        &(?=($EARL (CLAN WHO)) =(OUR (^SEIN WHO)))
    ==
  --  ::TITLE
::                                                      ::
::::                      ++MILLY                       ::  (2K) MILLISECONDS
  ::                                                    ::::
++  MILLY  ^|
  |_  NOW/@DA
  ::                                                    ::  ++AROUND:MILLY
  ++  AROUND                                            ::  RELATIVE MSEC
    |=  WEN/@DA
    ^-  @TAS
    ?:  =(WEN NOW)  %NOW
    ?:  (GTH WEN NOW)
      (CAT 3 (SCOT %UD (MSEC (SUB WEN NOW))) %MS)
    (CAT 3 '-' $(NOW WEN, WEN NOW))
  ::
  ++  ABOUT                                             ::  ++ABOUT:MILLY
    |=  WUN/(UNIT @DA)                                  ::  UNIT RELATIVE MSEC
    ^-  @TAS
    ?~(WUN %NO (AROUND U.WUN))
  ::                                                    ::  ++MILL:MILLY
  ++  MILL                                              ::  MSEC DIFF
    |=  ONE/@DR
    ^-  @TAS
    ?:  =(`@`0 ONE)  '0MS'
    (CAT 3 (SCOT %UD (MSEC ONE)) %MS)
  ::                                                    ::  ++MSEC:MILLY
  ++  MSEC                                              ::  @DR TO @UD MS
    |=(A/@DR `@UD`(DIV A (DIV ~S1 1.000)))
  ::                                                    ::  ++MULL:MILLY
  ++  MULL                                              ::  UNIT MSEC DIFF
    |=  UNE/(UNIT @DR)
    ^-  @TAS
    ?~(UNE %NO (MILL U.UNE))
  --
::
::::
  ::
++  CONTAIN  ^?
  |%
  ::  +BY-CLOCK: INTERFACE CORE FOR A CACHE USING THE CLOCK REPLACEMENT ALGORITHM
  ::
  ::    PRESENTS AN INTERFACE FOR A MAPPING, BUT SOMEWHAT SPECIALIZED, AND WITH
  ::    STATEFUL ACCESSORS. THE CLOCK'S :DEPTH PARAMETER IS USED AS THE MAXIMUM
  ::    FRESHNESS THAT AN ENTRY CAN HAVE. THE STANDARD CLOCK ALGORITHM HAS A DEPTH
  ::    OF 1, MEANING THAT A SINGLE SWEEP OF THE ARM WILL DELETE THE ENTRY. FOR
  ::    MORE SCAN RESISTANCE, :DEPTH CAN BE SET TO A HIGHER NUMBER.
  ::
  ::    INTERNALLY, :CLOCK MAINTAINS A :LOOKUP OF TYPE
  ::    `(MAP KEY-TYPE [VAL=VAL-TYPE FRESH=@UD])`, WHERE :DEPTH.CLOCK IS THE
  ::    MAXIMUM VALUE OF :FRESH. LOOKING UP A KEY INCREMENTS ITS FRESHNESS, AND A
  ::    SWEEP OF THE CLOCK ARM DECREMENTS ITS FRESHNESS.
  ::
  ::    THE CLOCK ARM IS STORED AS :QUEUE, WHICH IS A `(QEU KEY-TYPE)`. THE HEAD
  ::    OF THE QUEUE REPRESENTS THE POSITION OF THE CLOCK ARM. NEW ENTRIES ARE
  ::    INSERTED AT THE TAIL OF THE QUEUE. WHEN THE CLOCK ARM SWEEPS, IT
  ::    POPS THE HEAD OFF THE QUEUE. IF THE :FRESH OF THE HEAD'S ENTRY IN :LOOKUP
  ::    IS 0, REMOVE THE ENTRY FROM THE MAPPING AND REPLACE IT WITH THE NEW ENTRY.
  ::    OTHERWISE, DECREMENT THE ENTRY'S FRESHNESS, PUT IT BACK AT THE TAIL OF
  ::    THE QUEUE, AND POP THE NEXT HEAD OFF THE QUEUE AND TRY AGAIN.
  ::
  ::    CACHE ENTRIES MUST BE IMMUTABLE: A KEY CANNOT BE OVERWRITTEN WITH A NEW
  ::    VALUE. THIS PROPERTY IS ENFORCED FOR ENTRIES CURRENTLY STORED IN THE
  ::    CACHE, BUT IT IS NOT ENFORCED FOR PREVIOUSLY DELETED ENTRIES, SINCE WE
  ::    NO LONGER REMEMBER WHAT THAT KEY'S VALUE WAS SUPPOSED TO BE.
  ::
  ++  BY-CLOCK
    |*  [KEY-TYPE=MOLD VAL-TYPE=MOLD]
    |_  CLOCK=(CLOCK KEY-TYPE VAL-TYPE)
    ::  +GET: LOOKS UP A KEY, MARKING IT AS FRESH
    ::
    ++  GET
      |=  KEY=KEY-TYPE
      ^-  [(UNIT VAL-TYPE) _CLOCK]
      ::
      =+  MAYBE-GOT=(~(GET BY LOOKUP.CLOCK) KEY)
      ?~  MAYBE-GOT
        [~ CLOCK]
      ::
      =.  CLOCK  (FRESHEN KEY)
      ::
      [`VAL.U.MAYBE-GOT CLOCK]
    ::  +PUT: ADD A NEW CACHE ENTRY, POSSIBLY REMOVING AN OLD ONE
    ::
    ++  PUT
      |=  [KEY=KEY-TYPE VAL=VAL-TYPE]
      ^+  CLOCK
      ::  DO NOTHING IF OUR SIZE IS 0 SO WE DON'T DECREMENT-UNDERFLOW
      ::
      ?:  =(0 MAX-SIZE.CLOCK)
        CLOCK
      ::  NO OVERWRITE ALLOWED, BUT ALLOW DUPLICATE PUTS
      ::
      ?^  EXISTING=(~(GET BY LOOKUP.CLOCK) KEY)
        ::  VAL MUST NOT CHANGE
        ::
        ?>  =(VAL VAL.U.EXISTING)
        ::
        (FRESHEN KEY)
      ::
      =?  CLOCK  =(MAX-SIZE.CLOCK SIZE.CLOCK)
        EVICT
      ::
      %_  CLOCK
        SIZE    +(SIZE.CLOCK)
        LOOKUP  (~(PUT BY LOOKUP.CLOCK) KEY [VAL 1])
        QUEUE   (~(PUT TO QUEUE.CLOCK) KEY)
      ==
    ::  +FRESHEN: INCREMENT THE PROTECTION LEVEL ON AN ENTRY
    ::
    ++  FRESHEN
      |=  KEY=KEY-TYPE
      ^+  CLOCK
      %_    CLOCK
          LOOKUP
        %+  ~(JAB BY LOOKUP.CLOCK)  KEY
        |=  ENTRY=[VAL=VAL-TYPE FRESH=@UD]
        ENTRY(FRESH (MIN +(FRESH.ENTRY) DEPTH.CLOCK))
      ==
    ::  +RESIZE: CHANGES THE MAXIMUM SIZE, REMOVING ENTRIES IF NEEDED
    ::
    ++  RESIZE
      |=  NEW-MAX=@UD
      ^+  CLOCK
      ::
      =.  MAX-SIZE.CLOCK  NEW-MAX
      ::
      ?:  (GTE NEW-MAX SIZE.CLOCK)
        CLOCK
      ::
      (TRIM (SUB SIZE.CLOCK NEW-MAX))
    ::  +EVICT: REMOVE AN ENTRY FROM THE CACHE
    ::
    ++  EVICT
      ^+  CLOCK
      ::
      =.  SIZE.CLOCK  (DEC SIZE.CLOCK)
      ::
      |-
      ^+  CLOCK
      ::
      =^  OLD-KEY  QUEUE.CLOCK  ~(GET TO QUEUE.CLOCK)
      =/  OLD-ENTRY  (~(GOT BY LOOKUP.CLOCK) OLD-KEY)
      ::
      ?:  =(0 FRESH.OLD-ENTRY)
        CLOCK(LOOKUP (~(DEL BY LOOKUP.CLOCK) OLD-KEY))
      ::
      %_    $
          LOOKUP.CLOCK
        (~(PUT BY LOOKUP.CLOCK) OLD-KEY OLD-ENTRY(FRESH (DEC FRESH.OLD-ENTRY)))
      ::
          QUEUE.CLOCK
        (~(PUT TO QUEUE.CLOCK) OLD-KEY)
      ==
    ::  +TRIM: REMOVE :COUNT ENTRIES FROM THE CACHE
    ::
    ++  TRIM
      |=  COUNT=@UD
      ^+  CLOCK
      ?:  =(0 COUNT)
        CLOCK
      $(COUNT (DEC COUNT), CLOCK EVICT)
    ::  +PURGE: REMOVES ALL CACHE ENTRIES
    ::
    ++  PURGE
      ^+  CLOCK
      %_  CLOCK
        LOOKUP  ~
        QUEUE   ~
        SIZE    0
      ==
    --
  ::  +TO-CAPPED-QUEUE: INTERFACE DOOR FOR +CAPPED-QUEUE
  ::
  ::    PROVIDES A QUEUE OF A LIMITED SIZE WHERE PUSHING ADDITIONAL ITEMS WILL
  ::    FORCE POP THE ITEMS AT THE FRONT OF THE QUEUE.
  ::
  ++  TO-CAPPED-QUEUE
    |*  ITEM-TYPE=MOLD
    |_  QUEUE=(CAPPED-QUEUE ITEM-TYPE)
    ::  +PUT: ENQUEUE :ITEM, POSSIBLY POPPING AND PRODUCING AN OLD ITEM
    ::
    ++  PUT
      |=  ITEM=ITEM-TYPE
      ^-  [(UNIT ITEM-TYPE) _QUEUE]
      ::   ARE WE ALREADY AT MAX CAPACITY?
      ::
      ?.  =(SIZE.QUEUE MAX-SIZE.QUEUE)
        ::  WE'RE BELOW MAX CAPACITY, SO PUSH AND INCREMENT SIZE
        ::
        =.  QUEUE.QUEUE  (~(PUT TO QUEUE.QUEUE) ITEM)
        =.  SIZE.QUEUE   +(SIZE.QUEUE)
        ::
        [~ QUEUE]
      ::  WE'RE AT MAX CAPACITY, SO POP BEFORE PUSHING; SIZE IS UNCHANGED
      ::
      =^  OLDEST  QUEUE.QUEUE  ~(GET TO QUEUE.QUEUE)
      =.  QUEUE.QUEUE          (~(PUT TO QUEUE.QUEUE) ITEM)
      ::
      [`OLDEST QUEUE]
    ::  +GET: POP AN ITEM OFF THE QUEUE, ADJUSTING SIZE
    ::
    ++  GET
      ^-  [ITEM-TYPE _QUEUE]
      ::
      =.  SIZE.QUEUE           (DEC SIZE.QUEUE)
      =^  OLDEST  QUEUE.QUEUE  ~(GET TO QUEUE.QUEUE)
      ::
      [OLDEST QUEUE]
    ::  CHANGE THE :MAX-SIZE OF THE QUEUE, POPPING ITEMS IF NECESSARY
    ::
    ++  RESIZE
      =|  POPS=(LIST ITEM-TYPE)
      |=  NEW-MAX=@UD
      ^+  [POPS QUEUE]
      ::  WE'RE NOT OVERFULL, SO NO NEED TO POP OFF MORE ITEMS
      ::
      ?:  (GTE NEW-MAX SIZE.QUEUE)
        [(FLOP POPS) QUEUE(MAX-SIZE NEW-MAX)]
      ::  WE'RE ABOVE CAPACITY; POP AN ITEM OFF AND RECURSE
      ::
      =^  OLDEST  QUEUE  GET
      ::
      $(POPS [OLDEST POPS])
    --
  --
::                                                      ::
::::                      ++USERLIB                     ::  (2U) NON-VANE UTILS
  ::                                                    ::::
++  USERLIB  ^?
  |%
  ::                                                    ::
  ::::                    ++CHRONO:USERLIB              ::  (2UB) TIME
    ::                                                  ::::
  ++  CHRONO  ^?
    |%
    ::  +FROM-UNIX: UNIX TIMESTAMP TO @DA
    ::
    ++  FROM-UNIX
      |=  TIMESTAMP=@UD
      ^-  @DA
      %+  ADD  ~1970.1.1
      (MUL TIMESTAMP ~S1)
    ::                                                  ::  ++DAWN:CHRONO:
    ++  DAWN                                            ::  JAN 1 WEEKDAY
      |=  YER/@UD
      =+  YET=(SUB YER 1)
      %-  MOD  :_  7
      ;:  ADD
        1
        (MUL 5 (MOD YET 4))
        (MUL 4 (MOD YET 100))
        (MUL 6 (MOD YET 400))
      ==
    ::                                                  ::  ++DAWS:CHRONO:
    ++  DAWS                                            ::  DATE WEEKDAY
      |=  YED/DATE
      %-  MOD  :_  7
      %+  ADD
        (DAWN Y.YED)
      (SUB (YAWN [Y.YED M.YED D.T.YED]) (YAWN Y.YED 1 1))
    ::                                                  ::  ++DEAL:CHRONO:
    ++  DEAL                                            ::  TO LEAP SEC TIME
      |=  YER/@DA
      =+  N=0
      =+  YUD=(YORE YER)
      |-  ^-  DATE
      ?:  (GTE YER (ADD (SNAG N LEF:YU) ~S1))
        (YORE (YEAR YUD(S.T (ADD N S.T.YUD))))
      ?:  &((GTE YER (SNAG N LEF:YU)) (LTH YER (ADD (SNAG N LEF:YU) ~S1)))
        YUD(S.T (ADD +(N) S.T.YUD))
      ?:  =(+(N) (LENT LEF:YU))
        (YORE (YEAR YUD(S.T (ADD +(N) S.T.YUD))))
      $(N +(N))
    ::                                                  ::  ++LEAD:CHRONO:
    ++  LEAD                                            ::  FROM LEAP SEC TIME
      |=  LEY/DATE
      =+  LER=(YEAR LEY)
      =+  N=0
      |-  ^-  @DA
      =+  LED=(SUB LER (MUL N ~S1))
      ?:  (GTE LER (ADD (SNAG N LES:YU) ~S1))
        LED
      ?:  &((GTE LER (SNAG N LES:YU)) (LTH LER (ADD (SNAG N LES:YU) ~S1)))
        ?:  =(S.T.LEY 60)
          (SUB LED ~S1)
        LED
      ?:  =(+(N) (LENT LES:YU))
        (SUB LED ~S1)
      $(N +(N))
    ::                                                  ::  ++DUST:CHRONO:
    ++  DUST                                            ::  PRINT UTC FORMAT
      |=  YED/DATE
      ^-  TAPE
      =+  WEY=(DAWS YED)
      =/  NUM  (D-CO:CO 1)  :: PRINT AS DECIMAL WITHOUT DOTS
      =/  PIK  |=({N/@U T/WALL} `TAPE`(SCAG 3 (SNAG N T)))
      ::
      "{(PIK WEY WIK:YU)}, ".
      "{(NUM D.T.YED)} {(PIK (DEC M.YED) MON:YU)} {(NUM Y.YED)} ".
      "{(NUM H.T.YED)}:{(NUM M.T.YED)}:{(NUM S.T.YED)} +0000"
    ::                                                  ::  ++STUD:CHRONO:
    ++  STUD                                            ::  PARSE UTC FORMAT
      =<  |=  A/CORD                                    ::  EXPOSE PARSERS
          %+  BIFF  (RUSH A (MORE SEPA ELEM))
          |=  B/(LIST _(WONK *ELEM))  ^-  (UNIT DATE)
          =-  ?.((ZA:DEJS:FORMAT -) ~ (SOME (ZP:DEJS:FORMAT -)))
          ^+  =+  [*DATE U=UNIT]
              *{(U _[A Y]) (U _M) (U _D.T) (U _+.T) ~}
          :~
              |-(?~(B ~ ?.(?=($Y -.I.B) $(B T.B) `+.I.B)))
              |-(?~(B ~ ?.(?=($M -.I.B) $(B T.B) `+.I.B)))
              |-(?~(B ~ ?.(?=($D -.I.B) $(B T.B) `+.I.B)))
              |-(?~(B ~ ?.(?=($T -.I.B) $(B T.B) `+.I.B)))
          ==
      |%
      ::                                                ::  ++SNUG:STUD:CHRONO:
      ++  SNUG                                          ::  POSITION IN LIST
        |=  A/(LIST TAPE)
        |=  B/TAPE
        =+  [POS=1 LEN=(LENT B)]
        |-  ^-  (UNIT @U)
        ?~  A  ~
        ?:  =(B (SCAG LEN I.A))
          `POS
        $(POS +(POS), A T.A)
      ::                                                ::  ++SEPA:STUD:CHRONO:
      ++  SEPA                                          ::  SEPARATOR
        ;~(POSE ;~(PLUG COM (STAR ACE)) (PLUS ACE))
      ::                                                ::  ++ELEM:STUD:CHRONO:
      ++  ELEM                                          ::  DATE ELEMENT
        ;~  POSE
          (STAG %T T)  (STAG %Y Y)  (STAG %M M)  (STAG %D D)
          (STAG %W W)  (STAG %Z Z)
        ==
      ::                                                ::  ++Y:STUD:CHRONO:
      ++  Y                                             ::  YEAR
        (STAG %& (BASS 10 (STUN 3^4 DIT)))
      ::                                                ::  ++M:STUD:CHRONO:
      ++  M                                             ::  MONTH
        (SEAR (SNUG MON:YU) (PLUS ALF))
      ::                                                ::  ++D:STUD:CHRONO:
      ++  D                                             ::  DAY
        (BASS 10 (STUN 1^2 DIT))
      ::                                                ::  ++T:STUD:CHRONO:
      ++  T                                             ::  HOURS:MINUTES:SECS
        %+  COOK  |=({H/@U @ M/@U @ S/@U} ~[H M S])
        ;~(PLUG D COL D COL D)
      ::
      ::  XX DAY OF WEEK IS CURRENTLY UNCHECKED, AND
      ::  TIMEZONE OUTRIGHT IGNORED.
      ::                                                ::  ++W:STUD:CHRONO:
      ++  W                                             ::  DAY OF WEEK
        (SEAR (SNUG WIK:YU) (PLUS ALF))
      ::                                                ::  ++Z:STUD:CHRONO:
      ++  Z                                             ::  TIME ZONE
        ;~(PLUG (MASK "-+") DD DD)
      ::                                                ::  ++DD:STUD:CHRONO:
      ++  DD                                            ::  TWO DIGITS
        (BASS 10 (STUN 2^2 DIT))
      --  ::
    ::                                                  ::  ++UNT:CHRONO:USERLIB
    ++  UNT                                             ::  URBIT TO UNIX TIME
      |=  A/@
      (DIV (SUB A ~1970.1.1) ~S1)
    ::                                                  ::  ++YU:CHRONO:USERLIB
    ++  YU                                              ::  UTC FORMAT CONSTANTS
      |%
      ::                                                ::  ++MON:YU:CHRONO:
      ++  MON                                           ::  MONTHS
        ^-  (LIST TAPE)
        :~  "JANUARY"  "FEBRUARY"  "MARCH"  "APRIL"  "MAY"  "JUNE"  "JULY"
            "AUGUST"  "SEPTEMBER"  "OCTOBER"  "NOVEMBER"  "DECEMBER"
        ==
      ::                                                ::  ++WIK:YU:CHRONO:
      ++  WIK                                           ::  WEEKS
        ^-  (LIST TAPE)
        :~  "SUNDAY"  "MONDAY"  "TUESDAY"  "WEDNESDAY"  "THURSDAY"
            "FRIDAY"  "SATURDAY"
        ==
      ::                                                ::  ++LEF:YU:CHRONO:
      ++  LEF                                           ::  LEAPSECOND DATES
        ^-  (LIST @DA)
        :~  ~2015.6.30..23.59.59   ~2012.6.30..23.59.59
            ~2008.12.31..23.59.58  ~2005.12.31..23.59.57
            ~1998.12.31..23.59.56  ~1997.6.30..23.59.55
            ~1995.12.31..23.59.54  ~1994.6.30..23.59.53
            ~1993.6.30..23.59.52   ~1992.6.30..23.59.51
            ~1990.12.31..23.59.50  ~1989.12.31..23.59.49
            ~1987.12.31..23.59.48  ~1985.6.30..23.59.47
            ~1983.6.30..23.59.46   ~1982.6.30..23.59.45
            ~1981.6.30..23.59.44   ~1979.12.31..23.59.43
            ~1978.12.31..23.59.42  ~1977.12.31..23.59.41
            ~1976.12.31..23.59.40  ~1975.12.31..23.59.39
            ~1974.12.31..23.59.38  ~1973.12.31..23.59.37
            ~1972.12.31..23.59.36  ~1972.6.30..23.59.35
        ==
      ::                                                ::  ++LES:YU:CHRONO:
      ++  LES                                           ::  LEAPSECOND DAYS
        ^-  (LIST @DA)
        :~  ~2015.7.1  ~2012.7.1  ~2009.1.1  ~2006.1.1  ~1999.1.1  ~1997.7.1
            ~1996.1.1  ~1994.7.1  ~1993.7.1  ~1992.7.1  ~1991.1.1  ~1990.1.1
            ~1988.1.1  ~1985.7.1  ~1983.7.1  ~1982.7.1  ~1981.7.1  ~1980.1.1
            ~1979.1.1  ~1978.1.1  ~1977.1.1  ~1976.1.1  ~1975.1.1  ~1974.1.1
            ~1973.1.1  ~1972.7.1
        ==
      --  ::YU
    --  ::CHRONO
  ::                                                    ::
  ::::                    ++SPACE:USERLIB               ::  (2UC) FILE UTILS
    ::                                                  ::::
  ++  SPACE  ^?
    =,  CLAY
    |%
    ::                                                  ::  ++FEEL:SPACE:USERLIB
    ++  FEEL                                            ::  SIMPLE FILE WRITE
      |=  {PAX/PATH VAL/CAGE}
      ^-  MISO
      =+  DIR=.^(ARCH %CY PAX)
      ?~  FIL.DIR  [%INS VAL]
      [%MUT VAL]
    ::                                                  ::  ++FILE:SPACE:USERLIB
    ++  FILE                                            ::  SIMPLE FILE LOAD
      |=  PAX/PATH
      ^-  (UNIT)
      =+  DIR=.^(ARCH %CY PAX)
      ?~(FIL.DIR ~ [~ .^(* %CX PAX)])
    ::                                                  ::  ++FOAL:SPACE:USERLIB
    ++  FOAL                                            ::  HIGH-LEVEL WRITE
      |=  {PAX/PATH VAL/CAGE}
      ^-  TORO
      ?>  ?=({* * * *} PAX)
      [I.T.PAX [%& [[[T.T.T.PAX (FEEL PAX VAL)] ~]]]]
    ::                                                  ::  ++FRAY:SPACE:USERLIB
    ++  FRAY                                            ::  HIGH-LEVEL DELETE
      |=  PAX/PATH
      ^-  TORO
      ?>  ?=({* * * *} PAX)
      [I.T.PAX [%& [[[T.T.T.PAX [%DEL ~]] ~]]]]
    ::                                                  ::  ++FURL:SPACE:USERLIB
    ++  FURL                                            ::  UNIFY CHANGES
      |=  {ONE/TORO TWO/TORO}
      ^-  TORO
      ~|  %FURL
      ?>  ?&  =(P.ONE P.TWO)                            ::  SAME PATH
              &(?=(%& -.Q.ONE) ?=(%& -.Q.TWO))          ::  BOTH DELTAS
          ==
      [P.ONE [%& (WELD P.Q.ONE P.Q.TWO)]]
    --  ::SPACE
  ::                                                    ::
  ::::                  ++UNIX:USERLIB                  ::  (2UD) UNIX LINE-LIST
    ::                                                  ::::
  ++  UNIX  ^?
    |%
    ::                                                  ::  ++LUNE:UNIX:USERLIB
    ++  LUNE                                            ::  CORD BY UNIX LINE
      ~%  %LUNE  ..IS  ~
      |=  TXT/@T
      ?~  TXT
        ^-  (LIST @T)  ~
      =+  [BYT=(RIP 3 TXT) LEN=(MET 3 TXT)]
      =|  {LIN/(LIST @T) OFF/@}
      ^-  (LIST @T)
      %-  FLOP
      |-  ^+  LIN
      ?:  =(OFF LEN)
        ~|  %NOEOL  !!
      ?:  =((SNAG OFF BYT) 10)
        ?:  =(+(OFF) LEN)
          [(REP 3 (SCAG OFF BYT)) LIN]
        %=  $
          LIN  [(REP 3 (SCAG OFF BYT)) LIN]
          BYT  (SLAG +(OFF) BYT)
          LEN  (SUB LEN +(OFF))
          OFF  0
        ==
      $(OFF +(OFF))
    ::                                                  ::  ++NULE:UNIX:USERLIB
    ++  NULE                                            ::  LINES TO UNIX CORD
      ~%  %NULE  ..IS  ~
      |=  LIN/(LIST @T)
      ^-  @T
      %+  CAN  3
      %+  TURN  LIN
      |=  T/@T
      [+((MET 3 T)) (CAT 3 T 10)]
    --
  ::                                                    ::
  ::::                    ++SCANF:USERLIB               ::  (2UF) EXTERPOLATION
    ::                                                  ::::
  ++  SCANF
    =<  |*  {TAPE (POLE _;/(*{$^(RULE TAPE)}))}         ::  FORMATTED SCAN
        =>  .(+< [A B]=+<)
        (SCAN A (PARSF B))
    |%
    ::                                                  ::  ++PARSF:SCANF:
    ++  PARSF                                           ::  MAKE PARSER FROM:
      |*  A/(POLE _;/(*{$^(RULE TAPE)}))                ::  ;"CHARS{RULE}CHARS"
      =-  (COOK - (BOIL (NORM A)))
      |*  (LIST)
      ?~  +<  ~
      ?~  T  I
      [I $(+< T)]
    ::
    ::  .=  (BOIL ~[[& DIM] [| ", "] [& DIM]]:AG)
    ::  ;~(PLUG DIM ;~(PFIX COM ACE ;~(PLUG DIM (EASY)))):AG
    ::
    ::                                                  ::  ++BOIL:SCANF:USERLIB
    ++  BOIL                                            ::
      |*  (LIST (EACH RULE TAPE))
      ?~  +<  (EASY ~)
      ?:  ?=(%| -.I)  ;~(PFIX (JEST (CRIP P.I)) $(+< T))
      %+  COOK  |*({* *} [I T]=+<)
      ;~(PLUG P.I $(+< T))
    ::
    ::  .=  (NORM [;"{N}, {N}"]:N=DIM:AG)  ~[[& DIM] [| ", "] [& DIM]]:AG
    ::
    ::                                                  ::  ++NORM:SCANF:USERLIB
    ++  NORM                                            ::
      |*  (POLE _;/(*{$^(RULE TAPE)}))
      ?~  +<  ~
      =>  .(+< [I=+<- T=+<+])
      :_  T=$(+< T)
      =+  RUL=->->.I
      ^=  I
      ?~  RUL     [%| P=RUL]
      ?~  +.RUL   [%| P=RUL]
      ?@  &2.RUL  [%| P=;;(TAPE RUL)]
      [%& P=RUL]
    --  ::SCANF
  ::                                                    ::
  ::::                    ++PUBSUB:USERLIB              ::  (2UG) APPLICATION
    ::                                                  ::::
  ++  PUBSUB  ^?
    =,  GALL
    |%
    ::                                                  ::  ++PALE:PUBSUB:
    ++  PALE                                            ::  FILTER PEERS
      |=  {HID/BOWL FUN/$-(SINK ?)}
      (SKIM ~(TAP BY SUP.HID) FUN)
    ::                                                  ::  ++PRIX:PUBSUB:
    ++  PRIX                                            ::  FILTER GATE
      |=  PAX/PATH  |=  SINK  ^-  ?
      ?~  PAX  &  ?~  R.+<  |
      &(=(I.PAX I.R.+<) $(PAX T.PAX, R.+< T.R.+<))
    ::                                                  ::  ++PREY:PUBSUB:
    ++  PREY                                            ::  PREFIX
      |=({PAX/PATH HID/BOWL} (PALE HID (PRIX PAX)))
    --  ::PUBSUB
  --
::
++  ZUSE  %309                                          ::  HOON+ZUSE KELVIN
++  GIFT-ARVO                                           ::  OUT RESULT <-$
  $~  [%INIT ~ZOD]
  $%  GIFT:ABLE:AMES
      GIFT:ABLE:BEHN
      GIFT:ABLE:CLAY
      GIFT:ABLE:DILL
      GIFT:ABLE:EYRE
      GIFT:ABLE:FORD
      GIFT:ABLE:GALL
      GIFT:ABLE:JAEL
  ==
++  TASK-ARVO                                           ::  IN REQUEST ->$
  $%  TASK:ABLE:AMES
      TASK:ABLE:CLAY
      TASK:ABLE:BEHN
      TASK:ABLE:DILL
      TASK:ABLE:EYRE
      TASK:ABLE:FORD
      TASK:ABLE:GALL
      TASK:ABLE:JAEL
  ==
++  NOTE-ARVO                                           ::  OUT REQUEST $->
  $~  [%A %WAKE ~]
  $%  {$A TASK:ABLE:AMES}
      {$B TASK:ABLE:BEHN}
      {$C TASK:ABLE:CLAY}
      {$D TASK:ABLE:DILL}
      {$E TASK:ABLE:EYRE}
      {$F TASK:ABLE:FORD}
      {$G TASK:ABLE:GALL}
      {$J TASK:ABLE:JAEL}
      {@TAS $META VASE}
  ==
++  SIGN-ARVO                                           ::  IN RESULT $<-
  $%  {$A GIFT:ABLE:AMES}
      {$B GIFT:ABLE:BEHN}
      {$C GIFT:ABLE:CLAY}
      {$D GIFT:ABLE:DILL}
      {$E GIFT:ABLE:EYRE}
      {$F GIFT:ABLE:FORD}
      {$G GIFT:ABLE:GALL}
      {$J GIFT:ABLE:JAEL}
  ==
::
++  UNIX-TASK                                           ::  INPUT FROM UNIX
  $%  {$BELT P/BELT:DILL}                               ::  DILL: KEYBOARD
      {$BLEW P/BLEW:DILL}                               ::  DILL: CONFIGURE
      {$BOAT ~}                                        ::  CLAY: REBOOT
      {$BORN ~}                                        ::  EYRE: NEW PROCESS
      {$HAIL ~}                                        ::  DILL: REFRESH
      {$HEAR P/LANE:AMES Q/@}                           ::  AMES: INPUT PACKET
      {$HOOK ~}                                        ::  DILL: HANGUP
      {$INTO P/DESK Q/? R/MODE:CLAY}                    ::  CLAY: EXTERNAL EDIT
      {$THEY P/@UD Q/HTTR:EYRE}                         ::  EYRE: IN RESPONSE
      {$THIS P/? Q/CLIP:EYRE R/HTTQ:EYRE}               ::  EYRE: IN REQUEST
      {$THUD ~}                                        ::  EYRE: IN CANCEL
      {$WAKE ~}                                        ::  BEHN: WAKEUP
  ==
::                                                      ::
::::                      ++AZIMUTH                     ::  (2AZ) AZIMUTH
  ::                                                    ::::
++  AZIMUTH
  !:
  =*  ADDRESS  ADDRESS:RPC:ETHEREUM
  ::  TYPES
  ::
  =>  =>  [AZIMUTH-TYPES ETHEREUM-TYPES .]
      |%
      ++  COMPLETE-SHIP
        $:  STATE=POINT
            HISTORY=(LIST DIFF-POINT)  ::TODO  MAYBE BLOCK/EVENT NR?  ::  NEWEST FIRST
            KEYS=(MAP LIFE PASS)
        ==
      ::
      ++  FLEET  (MAP @P COMPLETE-SHIP)
      ::
      ++  ETH-TYPE
        |%
        ++  POINT
          :~  [%BYTES-N 32]   ::  ENCRYPTIONKEY
              [%BYTES-N 32]   ::  AUTHENTICATIONKEY
              %BOOL           ::  HASSPONSOR
              %BOOL           ::  ACTIVE
              %BOOL           ::  ESCAPEREQUESTED
              %UINT           ::  SPONSOR
              %UINT           ::  ESCAPEREQUESTEDTO
              %UINT           ::  CRYPTOSUITEVERSION
              %UINT           ::  KEYREVISIONNUMBER
              %UINT           ::  CONTINUITYNUMBER
          ==
        ++  DEED
          :~  %ADDRESS        ::  OWNER
              %ADDRESS        ::  MANAGEMENTPROXY
              %ADDRESS        ::  SPAWNPROXY
              %ADDRESS        ::  VOTINGPROXY
              %ADDRESS        ::  TRANSFERPROXY
          ==
        --
      ::
      ++  ETH-NOUN
        |%
        ++  POINT
          $:  ENCRYPTION-KEY=OCTS
              AUTHENTICATION-KEY=OCTS
              HAS-SPONSOR=?
              ACTIVE=?
              ESCAPE-REQUESTED=?
              SPONSOR=@UD
              ESCAPE-TO=@UD
              CRYPTO-SUITE=@UD
              KEY-REVISION=@UD
              CONTINUITY-NUMBER=@UD
          ==
        ++  DEED
          $:  OWNER=ADDRESS
              MANAGEMENT-PROXY=ADDRESS
              SPAWN-PROXY=ADDRESS
              VOTING-PROXY=ADDRESS
              TRANSFER-PROXY=ADDRESS
          ==
        --
      ::
      ++  FUNCTION
        |%
        ++  AZIMUTH
          $%  [%POINTS WHO=@P]
              [%RIGHTS WHO=@P]
              [%GET-SPAWNED WHO=@P]
              [%DNS-DOMAINS IND=@UD]
          ==
        --
      ::
      ::  #  DIFFS
      ::
      ++  UPDATE
        $%  [%FULL SHIPS=(MAP SHIP POINT) DNS=DNSES HEARD=EVENTS]  ::TODO  KEYS
            [%DIFS DIS=(LIST (PAIR EVENT-ID DIFF-AZIMUTH))]
        ==
      ::
      ::  #  CONSTANTS
      ::
      ::  CONTRACT ADDRESSES
      ::TODO  VALUES BELOW ARE FOR ROPSTEN, UPDATE FOR MAINNET
      ++  CONTRACTS
        |%
        ::  AZIMUTH: DATA CONTRACT
        ::
        ::  ++  AZIMUTH  0X308A.B6A6.024C.F198.B57E.008D.0AC9.AD02.1988.6579  ::  ROPSTEN
        ++  AZIMUTH  0X223C.067F.8CF2.8AE1.73EE.5CAF.EA60.CA44.C335.FECB  ::  MAINNET
        ::
        ::  LAUNCH: BLOCK NUMBER OF AZIMUTH DEPLOY
        ::
        ++  LAUNCH  6.784.800
        --
      ::
      ::  HASHES OF SHIP EVENT SIGNATURES
      ++  AZIMUTH-EVENTS
        |%
        ::
        ::  OWNERCHANGED(UINT32,ADDRESS)
        ++  OWNER-CHANGED
          0X16D0.F539.D49C.6CAD.822B.767A.9445.BFB1.
            CF7E.A6F2.A6C2.B120.A7EA.4CC7.660D.8FDA
        ::
        ::  ACTIVATED(UINT32)
        ++  ACTIVATED
          0XE74C.0380.9D07.69E1.B1F7.06CC.8414.258C.
            D1F3.B6FE.020C.D15D.0165.C210.BA50.3A0F
        ::
        ::  SPAWNED(UINT32,UINT32)
        ++  SPAWNED
          0XB2D3.A6E7.A339.F5C8.FF96.265E.2F03.A010.
            A854.1070.F374.4A24.7090.9644.1508.1546
        ::
        ::  ESCAPEREQUESTED(UINT32,UINT32)
        ++  ESCAPE-REQUESTED
          0XB4D4.850B.8F21.8218.141C.5665.CBA3.79E5.
            3E9B.B015.B51E.8D93.4BE7.0210.AEAD.874A
        ::
        ::  ESCAPECANCELED(UINT32,UINT32)
        ++  ESCAPE-CANCELED
          0XD653.BB0E.0BB7.CE83.93E6.24D9.8FBF.17CD.
            A590.2C83.28ED.0CD0.9988.F368.90D9.932A
        ::
        ::  ESCAPEACCEPTED(UINT32,UINT32)
        ++  ESCAPE-ACCEPTED
          0X7E44.7C9B.1BDA.4B17.4B07.96E1.00BF.7F34.
            EBF3.6DBB.7FE6.6549.0B1B.FCE6.246A.9DA5
        ::
        ::  LOSTSPONSOR(UINT32,UINT32)
        ++  LOST-SPONSOR
          0XD770.4F9A.2519.3DBD.0B0C.B4A8.09FE.FFFF.
            A7F1.9D1A.AE88.17A7.1346.C194.4482.10D5
        ::
        ::  CHANGEDKEYS(UINT32,BYTES32,BYTES32,UINT32,UINT32)
        ++  CHANGED-KEYS
          0XAA10.E7A0.117D.4323.F1D9.9D63.0EC1.69BE.
            BB3A.988E.8957.70E3.5198.7E01.FF54.23D5
        ::
        ::  BROKECONTINUITY(UINT32,UINT32)
        ++  BROKE-CONTINUITY
          0X2929.4799.F1C2.1A37.EF83.8E15.F79D.D91B.
            CEE2.DF99.D63C.D1C1.8AC9.68B1.2951.4E6E
        ::
        ::  CHANGEDSPAWNPROXY(UINT32,ADDRESS)
        ++  CHANGED-SPAWN-PROXY
          0X9027.36AF.7B3C.EFE1.0D9E.840A.ED0D.687E.
            35C8.4095.122B.2505.1A20.EAD8.866F.006D
        ::
        ::  CHANGEDTRANSFERPROXY(UINT32,ADDRESS)
        ++  CHANGED-TRANSFER-PROXY
          0XCFE3.69B7.197E.7F0C.F067.93AE.2472.A9B1.
            3583.FECB.ED2F.78DF.A14D.1F10.796B.847C
        ::
        ::  CHANGEDMANAGEMENTPROXY(UINT32,ADDRESS)
        ++  CHANGED-MANAGEMENT-PROXY
          0XAB9C.9327.CFFD.2ACC.168F.AFED.BE06.139F.
            5F55.CB84.C761.DF05.E051.1C25.1E2E.E9BF
        ::
        ::  CHANGEDVOTINGPROXY(UINT32,ADDRESS)
        ++  CHANGED-VOTING-PROXY
          0XCBD6.269E.C714.57F2.C7B1.A227.74F2.46F6.
            C5A2.EAE3.795E.D730.0DB5.1768.0C61.C805
        ::
        ::  CHANGEDDNS(STRING,STRING,STRING)
        ++  CHANGED-DNS
          0XFAFD.04AD.E1DA.AE2E.1FDB.0FC1.CC6A.899F.
            D424.063E.D5C9.2120.E67E.0730.53B9.4898
        --
      --
  ::
  ::  LOGIC
  ::
  |%
  ++  PASS-FROM-ETH
    |=  [ENC=OCTS AUT=OCTS SUT=@UD]
    ^-  PASS
    %^  CAT  3  'B'
    ?.  &(=(1 SUT) =(P.ENC 32) =(P.AUT 32))
      (CAT 8 0 0)
    (CAT 8 Q.AUT Q.ENC)
  ::
  ++  POINT-FROM-ETH
    |=  [WHO=@P POINT:ETH-NOUN DEED:ETH-NOUN]
    ^-  POINT
    ::
    ::  OWNERSHIP
    ::
    :+  :*  OWNER
            MANAGEMENT-PROXY
            VOTING-PROXY
            TRANSFER-PROXY
        ==
      ::
      ::  NETWORK STATE
      ::
      ?.  ACTIVE  ~
      :-  ~
      :*  KEY-REVISION
        ::
          (PASS-FROM-ETH ENCRYPTION-KEY AUTHENTICATION-KEY CRYPTO-SUITE)
        ::
          CONTINUITY-NUMBER
        ::
          [HAS-SPONSOR `@P`SPONSOR]
        ::
          ?.  ESCAPE-REQUESTED  ~
          ``@P`ESCAPE-TO
      ==
    ::
    ::  SPAWN STATE
    ::
    ?.  ?=(?(%CZAR %KING) (CLAN:TITLE WHO))  ~
    :-  ~
    :*  SPAWN-PROXY
        ~  ::TODO  CALL GETSPAWNED TO FILL THIS
    ==
  ::
  ++  EVENT-LOG-TO-POINT-DIFF
    =,  AZIMUTH-EVENTS
    =,  ABI:ETHEREUM
    |=  LOG=EVENT-LOG:RPC:ETHEREUM
    ^-  (UNIT (PAIR SHIP DIFF-POINT))
    ~?  ?=(~ MINED.LOG)  %PROCESSING-UNMINED-EVENT
    ::
    ?:  =(I.TOPICS.LOG OWNER-CHANGED)
      =+  ^-  [WHO=@ WER=ADDRESS]
          (DECODE-TOPICS T.TOPICS.LOG ~[%UINT %ADDRESS])
      `[WHO %OWNER WER]
    ::
    ?:  =(I.TOPICS.LOG ACTIVATED)
      =/  WHO=@
        (DECODE-TOPICS T.TOPICS.LOG ~[%UINT])
      `[WHO %ACTIVATED WHO]
    ::
    ?:  =(I.TOPICS.LOG SPAWNED)
      =+  ^-  [PRE=@ WHO=@]
          (DECODE-TOPICS T.TOPICS.LOG ~[%UINT %UINT])
      `[PRE %SPAWNED WHO]
    ::
    ?:  =(I.TOPICS.LOG ESCAPE-REQUESTED)
      =+  ^-  [WHO=@ WER=@]
          (DECODE-TOPICS T.TOPICS.LOG ~[%UINT %UINT])
      `[WHO %ESCAPE `WER]
    ::
    ?:  =(I.TOPICS.LOG ESCAPE-CANCELED)
      =/  WHO=@  (DECODE-TOPICS T.TOPICS.LOG ~[%UINT])
      `[WHO %ESCAPE ~]
    ::
    ?:  =(I.TOPICS.LOG ESCAPE-ACCEPTED)
      =+  ^-  [WHO=@ WER=@]
          (DECODE-TOPICS T.TOPICS.LOG ~[%UINT %UINT])
      `[WHO %SPONSOR & WER]
    ::
    ?:  =(I.TOPICS.LOG LOST-SPONSOR)
      =+  ^-  [WHO=@ POS=@]
          (DECODE-TOPICS T.TOPICS.LOG ~[%UINT %UINT])
      `[WHO %SPONSOR | POS]
    ::
    ?:  =(I.TOPICS.LOG CHANGED-KEYS)
      =/  WHO=@  (DECODE-TOPICS T.TOPICS.LOG ~[%UINT])
      =+  ^-  [ENC=OCTS AUT=OCTS SUT=@UD REV=@UD]
          %+  DECODE-RESULTS  DATA.LOG
          ~[[%BYTES-N 32] [%BYTES-N 32] %UINT %UINT]
      `[WHO %KEYS REV (PASS-FROM-ETH ENC AUT SUT)]
    ::
    ?:  =(I.TOPICS.LOG BROKE-CONTINUITY)
      =/  WHO=@  (DECODE-TOPICS T.TOPICS.LOG ~[%UINT])
      =/  NUM=@  (DECODE-RESULTS DATA.LOG ~[%UINT])
      `[WHO %CONTINUITY NUM]
    ::
    ?:  =(I.TOPICS.LOG CHANGED-MANAGEMENT-PROXY)
      =+  ^-  [WHO=@ SOX=ADDRESS]
          (DECODE-TOPICS T.TOPICS.LOG ~[%UINT %ADDRESS])
      `[WHO %MANAGEMENT-PROXY SOX]
    ::
    ?:  =(I.TOPICS.LOG CHANGED-VOTING-PROXY)
      =+  ^-  [WHO=@ TOX=ADDRESS]
          (DECODE-TOPICS T.TOPICS.LOG ~[%UINT %ADDRESS])
      `[WHO %VOTING-PROXY TOX]
    ::
    ?:  =(I.TOPICS.LOG CHANGED-SPAWN-PROXY)
      =+  ^-  [WHO=@ SOX=ADDRESS]
          (DECODE-TOPICS T.TOPICS.LOG ~[%UINT %ADDRESS])
      `[WHO %SPAWN-PROXY SOX]
    ::
    ?:  =(I.TOPICS.LOG CHANGED-TRANSFER-PROXY)
      =+  ^-  [WHO=@ TOX=ADDRESS]
          (DECODE-TOPICS T.TOPICS.LOG ~[%UINT %ADDRESS])
      `[WHO %TRANSFER-PROXY TOX]
    ::
    ::  WARN ABOUT UNIMPLEMENTED EVENTS, BUT IGNORE
    ::  THE ONES WE KNOW ARE HARMLESS.
    ~?  ?!  .=  I.TOPICS.LOG
            ::  OWNERSHIPTRANSFERRED(ADDRESS,ADDRESS)
            0X8BE0.079C.5316.5914.1344.CD1F.D0A4.F284.
              1949.7F97.22A3.DAAF.E3B4.186F.6B64.57E0
      [%UNIMPLEMENTED-EVENT I.TOPICS.LOG]
    ~
  ::
  ++  APPLY-POINT-DIFF
    |=  [POT=POINT DIF=DIFF-POINT]
    ^-  POINT
    ?-  -.DIF
      %FULL             NEW.DIF
    ::
        %ACTIVATED
      %_  POT
        NET  `[0 0 0 &^(^SEIN:TITLE WHO.DIF) ~]
        KID  ?.  ?=(?(%CZAR %KING) (CLAN:TITLE WHO.DIF))  ~
             `[0X0 ~]
      ==
    ::
    ::  OWNERSHIP
    ::
      %OWNER           POT(OWNER.OWN NEW.DIF)
      %TRANSFER-PROXY  POT(TRANSFER-PROXY.OWN NEW.DIF)
      %MANAGEMENT-PROXY  POT(MANAGEMENT-PROXY.OWN NEW.DIF)
      %VOTING-PROXY      POT(VOTING-PROXY.OWN NEW.DIF)
    ::
    ::  NETWORKING
    ::
        ?(%KEYS %CONTINUITY %SPONSOR %ESCAPE)
      ?>  ?=(^ NET.POT)
      ?-  -.DIF
          %KEYS
        POT(LIFE.U.NET LIFE.DIF, PASS.U.NET PASS.DIF)
      ::
          %SPONSOR
        %=  POT
          SPONSOR.U.NET  NEW.DIF
          ESCAPE.U.NET   ?:(HAS.NEW.DIF ~ ESCAPE.U.NET.POT)
        ==
      ::
        %CONTINUITY  POT(CONTINUITY-NUMBER.U.NET NEW.DIF)
        %ESCAPE      POT(ESCAPE.U.NET NEW.DIF)
      ==
    ::
    ::  SPAWNING
    ::
        ?(%SPAWNED %SPAWN-PROXY)
      ?>  ?=(^ KID.POT)
      ?-  -.DIF
          %SPAWNED
        =-  POT(SPAWNED.U.KID -)
        (~(PUT IN SPAWNED.U.KID.POT) WHO.DIF)
      ::
        %SPAWN-PROXY  POT(SPAWN-PROXY.U.KID NEW.DIF)
      ==
    ==
  ::
  ++  PARSE-ID
    |=  ID=@T
    ^-  AZIMUTH:FUNCTION
    |^
      ~|  ID
      %+  RASH  ID
      ;~  POSE
        (FUNCTION %POINTS 'POINTS' SHIPNAME)
        (FUNCTION %GET-SPAWNED 'GETSPAWNED' SHIPNAME)
        (FUNCTION %DNS-DOMAINS 'DNSDOMAINS' DEM:AG)
      ==
    ::
    ++  FUNCTION
      |*  [TAG=@TAS FUN=@T RUL=RULE]
      ;~(PLUG (COLD TAG (JEST FUN)) (IFIX [LIT RIT] RUL))
    ::
    ++  SHIPNAME
      ;~(PFIX SIG FED:AG)
    --
  ::
  ++  FUNCTION-TO-CALL
    |%
    ++  AZIMUTH
      |=  CAL=AZIMUTH:FUNCTION
      ^-  [ID=@T DAT=CALL-DATA:RPC:ETHEREUM]
      ?-  -.CAL
          %POINTS
        :-  (CRIP "POINTS({(SCOW %P WHO.CAL)})")
        ['POINTS(UINT32)' ~[UINT+`@`WHO.CAL]]
      ::
          %RIGHTS
        :-  (CRIP "RIGHTS({(SCOW %P WHO.CAL)})")
        ['RIGHTS(UINT32)' ~[UINT+`@`WHO.CAL]]
      ::
          %GET-SPAWNED
        :-  (CRIP "GETSPAWNED({(SCOW %P WHO.CAL)})")
        ['GETSPAWNED(UINT32)' ~[UINT+`@`WHO.CAL]]
      ::
          %DNS-DOMAINS
        :-  (CRIP "DNSDOMAINS({(SCOW %UD IND.CAL)})")
        ['DNSDOMAINS(UINT256)' ~[UINT+IND.CAL]]
      ==
    --
  --
::                                                      ::
::::                      ++ETHEREUM                    ::  (2ETH) ETHEREUM
  ::                                                    ::::
++  ETHEREUM
  !:
  =>  [ETHEREUM-TYPES .]
  |%
  ::  DERIVING AND USING ETHEREUM KEYS
  ::
  ++  KEY
    |%
    ++  ADDRESS-FROM-PUB
      =,  KECCAK:CRYPTO
      |=  PUB=@
      %^  END  3  20
      %+  KECCAK-256  64
      (REV 3 64 PUB)
    ::
    ++  ADDRESS-FROM-PRV
      (CORK PUB-FROM-PRV ADDRESS-FROM-PUB)
    ::
    ++  PUB-FROM-PRV
      =,  SECP256K1:SECP:CRYPTO
      |=  PRV=@
      %-  SERIALIZE-POINT
      (PRIV-TO-PUB PRV)
    ::
    ++  SIGN-TRANSACTION
      =,  CRYPTO
      |=  [TX=TRANSACTION:RPC PK=@]
      ^-  @UX
      ::  HASH THE RAW TRANSACTION DATA
      =/  HASH=@
        =/  DAT=@
          %-  ENCODE-ATOMS:RLP
          ::  WITH V=CHAIN-ID, R=0, S=0
          TX(CHAIN-ID [CHAIN-ID.TX 0 0 ~])
        =+  WID=(MET 3 DAT)
        %-  KECCAK-256:KECCAK
        [WID (REV 3 WID DAT)]
      ::  SIGN TRANSACTION HASH WITH PRIVATE KEY
      =+  (ECDSA-RAW-SIGN:SECP256K1:SECP HASH PK)
      ::  COMPLETE TRANSACTION IS RAW DATA, WITH R AND S
      ::  TAKEN FROM THE SIGNATURE, AND V AS PER EIP-155
      %-  ENCODE-ATOMS:RLP
      TX(CHAIN-ID [:(ADD (MUL CHAIN-ID.TX 2) 35 V) R S ~])
    --
  ::
  ::  RLP EN/DECODING
  ::NOTE  HTTPS://GITHUB.COM/ETHEREUM/WIKI/WIKI/RLP
  ::
  ++  RLP
    |%
    ::NOTE  RLP ENCODING DOESN'T REALLY CARE ABOUT LEADING ZEROES,
    ::      BUT BECAUSE WE NEED TO DISINGUISH BETWEEN NO-BYTES ZERO
    ::      AND ONE-BYTE ZERO (AND ALSO EMPTY LIST) WE END UP WITH
    ::      THIS AWFUL TYPE...
    +$  ITEM
      $%  [%L L=(LIST ITEM)]
          [%B B=BYTS]
      ==
    ::
    ::  TREAT ATOMS AS LIST OF ITEMS
    ++  ENCODE-ATOMS
      |=  L=(LIST @)
      %+  ENCODE  %L
      %+  TURN  L
      |=(A=@ B+[(MET 3 A) A])
    ::
    ++  ENCODE
      |=  IN=ITEM
      ^-  @
      ?-  -.IN
          %B
        ?:  &(=(1 WID.B.IN) (LTH DAT.B.IN 0X80))
          DAT.B.IN
        %^  CAT  3  DAT.B.IN
        ::TODO  UNSURE IF THIS SHOULD PASS WID OR (MET 3 DAT)...
        (ENCODE-LENGTH WID.B.IN 0X80)
      ::
          %L
        =/  OUT=@
          %+  ROLL  L.IN
          |=  [NI=ITEM EN=@]
          (CAT 3 (ENCODE NI) EN)
        %^  CAT  3  OUT
        (ENCODE-LENGTH (MET 3 OUT) 0XC0)
      ==
    ::
    ++  ENCODE-LENGTH
      |=  [LEN=@ OFF=@]
      ?:  (LTH LEN 56)  (ADD LEN OFF)
      =-  (CAT 3 LEN -)
      :(ADD (MET 3 LEN) OFF 55)
    ::
    ::TODO  DECODE
    ::
    --
  ::
  ::  ABI EN/DECODING
  ::NOTE  HTTPS://SOLIDITY.READTHEDOCS.IO/EN/DEVELOP/ABI-SPEC.HTML
  ::
  ++  ABI
    =>  |%
        ::  SOLIDITY TYPES. INTEGER BITSIZES IGNORED
        ++  ETYP
          $%  ::  STATIC
              %ADDRESS  %BOOL
              %INT      %UINT
              %REAL     %UREAL
              [%BYTES-N N=@UD]
              ::  DYNAMIC
              [%ARRAY-N T=ETYP N=@UD]
              [%ARRAY T=ETYP]
              %BYTES    %STRING
          ==
        ::
        ::  SOLIDITY-STYLE TYPED DATA. INTEGER BITSIZES IGNORED
        ++  DATA
          $%  [%ADDRESS P=ADDRESS]
              [%STRING P=TAPE]
              [%BOOL P=?]
              [%INT P=@SD]
              [%UINT P=@UD]
              [%REAL P=@RS]
              [%UREAL P=@URS]
              [%ARRAY-N P=(LIST DATA)]
              [%ARRAY P=(LIST DATA)]
              [%BYTES-N P=OCTS]  ::TODO  JUST @, BECAUSE CONTEXT KNOWS LENGTH?
              [%BYTES P=OCTS]
          ==
        --
    =,  MIMES:HTML
    |%
    ::  ENCODING
    ::
    ++  ENCODE-ARGS
      ::  ENCODE LIST OF ARGUMENTS.
      ::
      |=  DAS=(LIST DATA)
      ^-  TAPE
      (ENCODE-DATA [%ARRAY-N DAS])
    ::
    ++  ENCODE-DATA
      ::  ENCODE TYPED DATA INTO ABI BYTESTRING.
      ::
      |=  DAT=DATA
      ^-  TAPE
      ?+  -.DAT
        ~|  [%UNSUPPORTED-TYPE -.DAT]
        !!
      ::
          %ARRAY-N
        ::  ENC(X) = HEAD(X[0]) ... HEAD(X[K-1]) TAIL(X[0]) ... TAIL(X[K-1])
        ::  WHERE HEAD AND TAIL ARE DEFINED FOR X[I] BEING OF A STATIC TYPE AS
        ::  HEAD(X[I]) = ENC(X[I]) AND TAIL(X[I]) = "" (THE EMPTY STRING), OR AS
        ::  HEAD(X[I]) = ENC(LEN( HEAD(X[0])..HEAD(X[K-1])
        ::                        TAIL(X[0])..TAIL(X[I-1]) ))
        ::  AND TAIL(X[I]) = ENC(X[I]) OTHERWISE.
        ::
        ::  SO: IF IT'S A STATIC TYPE, DATA GOES IN THE HEAD. IF IT'S A DYNAMIC
        ::  TYPE, A REFERENCE GOES INTO THE HEAD AND DATA GOES INTO THE TAIL.
        ::
        ::  IN THE HEAD, WE FIRST PUT A PLACEHOLDER WHERE REFERENCES NEED TO GO.
        =+  HOL=(REAP 64 'X')
        =/  HES=(LIST TAPE)
          %+  TURN  P.DAT
          |=  D=DATA
          ?.  (IS-DYNAMIC-TYPE D)  ^$(DAT D)
          HOL
        =/  TAS=(LIST TAPE)
          %+  TURN  P.DAT
          |=  D=DATA
          ?.  (IS-DYNAMIC-TYPE D)  ""
          ^$(DAT D)
        ::  ONCE WE KNOW THE HEAD AND TAIL, WE CAN FILL IN THE REFERENCES IN HEAD.
        =-  (WELD NES `TAPE`(ZING TAS))
        ^-  [@UD NES=TAPE]
        =+  LED=(LENT (ZING HES))
        %+  ROLL  HES
        |=  [T=TAPE I=@UD NES=TAPE]
        :-  +(I)
        ::  IF NO REFERENCE NEEDED, JUST PUT THE DATA.
        ?.  =(T HOL)  (WELD NES T)
        ::  CALCULATE BYTE OFFSET OF DATA WE NEED TO REFERENCE.
        =/  OFS/@UD
          =-  (DIV - 2)       ::  TWO HEX DIGITS PER BYTE.
          %+  ADD  LED        ::  COUNT HEAD, AND
          %-  LENT  %-  ZING  ::  COUNT ALL TAIL DATA
          (SCAG I TAS)        ::  PRECEDING OURS.
        =+  REF=^$(DAT [%UINT OFS])
        ::  SHOULDN'T HIT THIS UNLESS WE'RE SENDING OVER 2GB OF DATA?
        ~|  [%WEIRD-REF-LENT (LENT REF)]
        ?>  =((LENT REF) (LENT HOL))
        (WELD NES REF)
      ::
          %ARRAY  ::  WHERE X HAS K ELEMENTS (K IS ASSUMED TO BE OF TYPE UINT256):
        ::  ENC(X) = ENC(K) ENC([X[1], ..., X[K]])
        ::  I.E. IT IS ENCODED AS IF IT WERE AN ARRAY OF STATIC SIZE K, PREFIXED
        ::  WITH THE NUMBER OF ELEMENTS.
        %+  WELD  $(DAT [%UINT (LENT P.DAT)])
        $(DAT [%ARRAY-N P.DAT])
      ::
          %BYTES-N
        ::  ENC(X) IS THE SEQUENCE OF BYTES IN X PADDED WITH ZERO-BYTES TO A
        ::  LENGTH OF 32.
        ::  NOTE THAT FOR ANY X, LEN(ENC(X)) IS A MULTIPLE OF 32.
        ?>  (LTE P.P.DAT 32)
        (PAD-TO-MULTIPLE (RENDER-HEX-BYTES P.DAT) 64 %RIGHT)
      ::
          %BYTES  ::  OF LENGTH K (WHICH IS ASSUMED TO BE OF TYPE UINT256)
        ::  ENC(X) = ENC(K) PAD_RIGHT(X), I.E. THE NUMBER OF BYTES IS ENCODED AS A
        ::  UINT256 FOLLOWED BY THE ACTUAL VALUE OF X AS A BYTE SEQUENCE, FOLLOWED
        ::  BY THE MINIMUM NUMBER OF ZERO-BYTES SUCH THAT LEN(ENC(X)) IS A
        ::  MULTIPLE OF 32.
        %+  WELD  $(DAT [%UINT P.P.DAT])
        $(DAT [%BYTES-N P.DAT])
      ::
          %STRING
        ::  ENC(X) = ENC(ENC_UTF8(X)), I.E. X IS UTF-8 ENCODED AND THIS VALUE IS
        ::  INTERPRETED AS OF BYTES TYPE AND ENCODED FURTHER. NOTE THAT THE LENGTH
        ::  USED IN THIS SUBSEQUENT ENCODING IS THE NUMBER OF BYTES OF THE UTF-8
        ::  ENCODED STRING, NOT ITS NUMBER OF CHARACTERS.
        $(DAT [%BYTES (LENT P.DAT) (SWP 3 (CRIP P.DAT))])
      ::
          %UINT
        ::  ENC(X) IS THE BIG-ENDIAN ENCODING OF X, PADDED ON THE HIGHER-ORDER
        ::  (LEFT) SIDE WITH ZERO-BYTES SUCH THAT THE LENGTH IS A MULTIPLE OF 32
        ::  BYTES.
        (PAD-TO-MULTIPLE (RENDER-HEX-BYTES (AS-OCTS P.DAT)) 64 %LEFT)
      ::
          %BOOL
        ::  AS IN THE UINT8 CASE, WHERE 1 IS USED FOR TRUE AND 0 FOR FALSE
        $(DAT [%UINT ?:(P.DAT 1 0)])
      ::
          %ADDRESS
        ::  AS IN THE UINT160 CASE
        $(DAT [%UINT `@UD`P.DAT])
      ==
    ::
    ++  IS-DYNAMIC-TYPE
      |=  A=DATA
      ?.  ?=(%ARRAY-N -.A)
        ?=(?(%STRING %BYTES %ARRAY) -.A)
      &(!=((LENT P.A) 0) (LIEN P.A IS-DYNAMIC-TYPE))
    ::
    ::  DECODING
    ::
    ++  DECODE-TOPICS
      ::  TOX:  LIST OF HEX WORDS
      |*  [TOX=(LEST @UX) TYS=(LIST ETYP)]
      =-  (DECODE-ARGUMENTS (CRIP -) TYS)
      %+  RENDER-HEX-BYTES  (MUL 32 (LENT TOX))
      %+  ROLL  `(LIST @UX)`TOX
      |=  [TOP=@UX TOS=@]
      (CAT 8 TOP TOS)
    ::
    ++  DECODE-RESULTS
      ::  REX:  STRING OF HEX BYTES WITH LEADING 0X.
      |*  [REX=@T TYS=(LIST ETYP)]
      (DECODE-ARGUMENTS (RSH 3 2 REX) TYS)
    ::
    ++  DECODE-ARGUMENTS
      |*  [RES=@T TYS=(LIST ETYP)]
      =|  WIN=@UD
      =/  WOS=(LIST @T)  (RIP 9 RES)
      =<  (DECODE-FROM 0 TYS)
      |%
      ++  DECODE-FROM
        |*  [WIN=@UD TYS=(LIST ETYP)]
        ?~  TYS  !!
        =-  ?~  T.TYS  DAT
            [DAT $(WIN NIN, TYS T.TYS)]
        (DECODE-ONE WIN ~[I.TYS])
      ::
      ++  DECODE-ONE
        ::NOTE  WE TAKE (LIST ETYP) EVEN THOUGH WE ONLY OPERATE ON
        ::      A SINGLE ETYP AS A WORKAROUND FOR URBIT/ARVO#673
        |*  [WIN=@UD TYS=(LIST ETYP)]
        =-  [NIN DAT]=-  ::NOTE  ^= REGULAR FORM BROKEN
        ?~  TYS  !!
        =*  TYP  I.TYS
        =+  WOR=(SNAG WIN WOS)
        ?+  TYP
          ~|  [%UNSUPPORTED-TYPE TYP]
          !!
        ::
            ?(%ADDRESS %BOOL %UINT)  ::  %INT %REAL %UREAL
          :-  +(WIN)
          ?-  TYP
            %ADDRESS  `@UX`(RASH WOR HEX)
            %UINT     `@UD`(RASH WOR HEX)
            %BOOL     =(1 (RASH WOR HEX))
          ==
        ::
            %STRING
          =+  $(TYS ~[%BYTES])
          ~!  -
          [NIN (TRIP (SWP 3 Q.DAT))]
        ::
            %BYTES
          :-  +(WIN)
          ::  FIND THE WORD INDEX OF THE ACTUAL DATA.
          =/  LIC=@UD  (DIV (RASH WOR HEX) 32)
          ::  LEARN THE BYTELENGTH OF THE DATA.
          =/  LEN=@UD  (RASH (SNAG LIC WOS) HEX)
          (DECODE-BYTES-N +(LIC) LEN)
        ::
            [%BYTES-N *]
          :-  (ADD WIN +((DIV (DEC N.TYP) 32)))
          (DECODE-BYTES-N WIN N.TYP)
        ::
            [%ARRAY *]
          :-  +(WIN)
          ::  FIND THE WORD INDEX OF THE ACTUAL DATA.
          =.  WIN  (DIV (RASH WOR HEX) 32)
          ::  READ THE ELEMENTS FROM THEIR LOCATION.
          %-  TAIL
          %^  DECODE-ARRAY-N  ~[T.TYP]  +(WIN)
          (RASH (SNAG WIN WOS) HEX)
        ::
            [%ARRAY-N *]
          (DECODE-ARRAY-N ~[T.TYP] WIN N.TYP)
        ==
      ::
      ++  DECODE-BYTES-N
        |=  [FRO=@UD BYS=@UD]
        ^-  OCTS
        ::  PARSE {BYS} BYTES FROM {FRO}.
        =-  [BYS (RASH - HEX)]
        %^  END  3  (MUL 2 BYS)
        %+  CAN  9
        %+  TURN
          (SWAG [FRO +((DIV (DEC BYS) 32))] WOS)
        |=(A=@T [1 A])
      ::
      ++  DECODE-ARRAY-N
        ::NOTE  WE TAKE (LIST ETYP) EVEN THOUGH WE ONLY OPERATE ON
        ::      A SINGLE ETYP AS A WORKAROUND FOR URBIT/ARVO#673
        =|  RES=(LIST)
        ~&  %WATCH-OUT--ARRAYS-WITHOUT-TYPEINFO
        |*  [TYS=(LIST ETYP) FRO=@UD LEN=@UD]
        ^-  [@UD (LIST)]
        ?~  TYS  !!
        ?:  =(LEN 0)  [FRO (FLOP `(LIST)`RES)]
        =+  (DECODE-ONE FRO ~[I.TYS])  ::  [NIN=@UD DAT=*]
        $(RES ^+(RES [DAT RES]), FRO NIN, LEN (DEC LEN))
      --
    --
  ::
  ::  COMMUNICATING WITH RPC NODES
  ::NOTE  HTTPS://GITHUB.COM/ETHEREUM/WIKI/WIKI/JSON-RPC
  ::
  ++  RPC
    ::  TYPES
    ::
    =>  =,  ABI
        =,  FORMAT
        |%
        ::  RAW CALL DATA
        ++  CALL-DATA
          $:  FUNCTION=@T
              ARGUMENTS=(LIST DATA)
          ==
        ::
        ::  RAW TRANSACTION DATA
        +$  TRANSACTION
          $:  NONCE=@UD
              GAS-PRICE=@UD
              GAS=@UD
              TO=ADDRESS
              VALUE=@UD
              DATA=@UX
              CHAIN-ID=@UX
          ==
        ::
        ::  ETHEREUM JSON RPC API
        ::
        ::  SUPPORTED REQUESTS.
        ++  REQUEST
          $%  [%ETH-BLOCK-NUMBER ~]
              [%ETH-CALL CAL=CALL DEB=BLOCK]
              $:  %ETH-NEW-FILTER
                  FRO=(UNIT BLOCK)
                  TOB=(UNIT BLOCK)
                  ADR=(LIST ADDRESS)
                  TOP=(LIST ?(@UX (LIST @UX)))
              ==
              [%ETH-GET-BLOCK-BY-NUMBER BON=@UD TXS=?]
              [%ETH-GET-FILTER-LOGS FID=@UD]
              $:  %ETH-GET-LOGS
                  FRO=(UNIT BLOCK)
                  TOB=(UNIT BLOCK)
                  ADR=(LIST ADDRESS)
                  TOP=(LIST ?(@UX (LIST @UX)))
              ==
              [%ETH-GET-FILTER-CHANGES FID=@UD]
              [%ETH-SEND-RAW-TRANSACTION DAT=@UX]
          ==
        ::
        ::TODO  CLEAN UP & ACTUALLY USE
        ++  RESPONSE
          $%  ::TODO
              [%ETH-NEW-FILTER FID=@UD]
              [%ETH-GET-FILTER-LOGS LOS=(LIST EVENT-LOG)]
              [%ETH-GET-LOGS LOS=(LIST EVENT-LOG)]
              [%ETH-GOT-FILTER-CHANGES LOS=(LIST EVENT-LOG)]
              [%ETH-TRANSACTION-HASH HAZ=@UX]
          ==
        ::
        ++  EVENT-LOG
          $:  ::  NULL FOR PENDING LOGS
              $=  MINED  %-  UNIT
              $:  LOG-INDEX=@UD
                  TRANSACTION-INDEX=@UD
                  TRANSACTION-HASH=@UX
                  BLOCK-NUMBER=@UD
                  BLOCK-HASH=@UX
                  REMOVED=?
              ==
            ::
              ADDRESS=@UX
              DATA=@T
              ::  EVENT DATA
              ::
              ::    FOR STANDARD EVENTS, THE FIRST TOPIC IS THE EVENT SIGNATURE
              ::    HASH. FOR ANONYMOUS EVENTS, THE FIRST TOPIC IS THE FIRST
              ::    INDEXED ARGUMENT.
              ::    NOTE THAT THIS DOES NOT SUPPORT THE "ANONYMOUS EVENT WITH
              ::    ZERO TOPICS" CASE. THIS HAS DUBIOUS USABILITY, AND USING
              ::    +LEST INSTEAD OF +LIST SAVES A LOT OF ?~ CHECKS.
              ::
              TOPICS=(LEST @UX)
          ==
        ::
        ::  DATA FOR ETH_CALL.
        ++  CALL
          $:  FROM=(UNIT ADDRESS)
              TO=ADDRESS
              GAS=(UNIT @UD)
              GAS-PRICE=(UNIT @UD)
              VALUE=(UNIT @UD)
              DATA=TAPE
          ==
        ::
        ::  MINIMUM DATA NEEDED TO CONSTRUCT A READ CALL
        ++  PROTO-READ-REQUEST
          $:  ID=(UNIT @T)
              TO=ADDRESS
              CALL-DATA
          ==
        ::
        ::  BLOCK TO OPERATE ON.
        ++  BLOCK
          $%  [%NUMBER N=@UD]
              [%LABEL L=?(%EARLIEST %LATEST %PENDING)]
          ==
        --
    ::
    ::  LOGIC
    ::
    |%
    ++  ENCODE-CALL
      |=  CALL-DATA
      ^-  TAPE
      ::TODO  SHOULD THIS CHECK TO SEE IF THE DATA MATCHES THE FUNCTION SIGNATURE?
      =-  :(WELD "0X" - (ENCODE-ARGS ARGUMENTS))
      %+  SCAG  8
      %+  RENDER-HEX-BYTES  32
      %-  KECCAK-256:KECCAK:CRYPTO
      (AS-OCTS:MIMES:HTML FUNCTION)
    ::
    ::  BUILDING REQUESTS
    ::
    ++  JSON-REQUEST
      =,  EYRE
      |=  [URL=PURL JON=JSON]
      ^-  HISS
      :^  URL  %POST
        %-  ~(GAS IN *MATH)
        ~['CONTENT-TYPE'^['APPLICATION/JSON']~]
      (SOME (AS-OCTT (EN-JSON:HTML JON)))
    ::
    ++  BATCH-READ-REQUEST
      |=  REQ=(LIST PROTO-READ-REQUEST)
      ^-  JSON
      A+(TURN REQ READ-REQUEST)
    ::
    ++  READ-REQUEST
      |=  PROTO-READ-REQUEST
      ^-  JSON
      %+  REQUEST-TO-JSON  ID
      :+  %ETH-CALL
        ^-  CALL
        [~ TO ~ ~ ~ `TAPE`(ENCODE-CALL FUNCTION ARGUMENTS)]
      [%LABEL %LATEST]
    ::
    ++  REQUEST-TO-JSON
      =,  ENJS:FORMAT
      |=  [RIQ=(UNIT @T) REQ=REQUEST]
      ^-  JSON
      %-  PAIRS
      =;  R=[MET=@T PAS=(LIST JSON)]
        ::TODO  SHOULD USE REQUEST-TO-JSON:RPC:JSTD,
        ::      AND PROBABLY (FALL RIQ -.REQ)
        :*  JSONRPC+S+'2.0'
            METHOD+S+MET.R
            PARAMS+A+PAS.R
            ::TODO  WOULD JUST JAMMING THE REQ NOUN FOR ID BE A BAD IDEA?
            ?~  RIQ  ~
            [ID+S+U.RIQ]~
        ==
      ?-  -.REQ
          %ETH-BLOCK-NUMBER
        ['ETH_BLOCKNUMBER' ~]
      ::
          %ETH-CALL
        :-  'ETH_CALL'
        :~  (ETH-CALL-TO-JSON CAL.REQ)
            (BLOCK-TO-JSON DEB.REQ)
        ==
      ::
          %ETH-NEW-FILTER
        :-  'ETH_NEWFILTER'
        :_  ~
        :-  %O  %-  ~(GAS BY *(MAP @T JSON))
        =-  (MURN - SAME)
        ^-  (LIST (UNIT (PAIR @T JSON)))
        :~  ?~  FRO.REQ  ~
            `['FROMBLOCK' (BLOCK-TO-JSON U.FRO.REQ)]
          ::
            ?~  TOB.REQ  ~
            `['TOBLOCK' (BLOCK-TO-JSON U.TOB.REQ)]
          ::
            ::TODO  FUCKING TMI
            ?:  =(0 (LENT ADR.REQ))  ~
            :+  ~  'ADDRESS'
            ?:  =(1 (LENT ADR.REQ))  (TAPE (ADDRESS-TO-HEX (SNAG 0 ADR.REQ)))
            :-  %A
            (TURN ADR.REQ (CORK ADDRESS-TO-HEX TAPE))
          ::
            ?~  TOP.REQ  ~
            :+  ~  'TOPICS'
            (TOPICS-TO-JSON TOP.REQ)
        ==
      ::
          %ETH-GET-BLOCK-BY-NUMBER
        :-  'ETH_GETBLOCKBYNUMBER'
        :~  (TAPE (NUM-TO-HEX BON.REQ))
            B+TXS.REQ
        ==
      ::
          %ETH-GET-FILTER-LOGS
        ['ETH_GETFILTERLOGS' (TAPE (NUM-TO-HEX FID.REQ)) ~]
      ::
          %ETH-GET-LOGS
        :-  'ETH_GETLOGS'
        :_  ~
        :-  %O  %-  ~(GAS BY *(MAP @T JSON))
        =-  (MURN - SAME)
        ^-  (LIST (UNIT (PAIR @T JSON)))
        :~  ?~  FRO.REQ  ~
            `['FROMBLOCK' (BLOCK-TO-JSON U.FRO.REQ)]
          ::
            ?~  TOB.REQ  ~
            `['TOBLOCK' (BLOCK-TO-JSON U.TOB.REQ)]
          ::
            ::TODO  FUCKING TMI
            ?:  =(0 (LENT ADR.REQ))  ~
            :+  ~  'ADDRESS'
            ?:  =(1 (LENT ADR.REQ))  (TAPE (ADDRESS-TO-HEX (SNAG 0 ADR.REQ)))
            :-  %A
            (TURN ADR.REQ (CORK ADDRESS-TO-HEX TAPE))
          ::
            ?~  TOP.REQ  ~
            :+  ~  'TOPICS'
            (TOPICS-TO-JSON TOP.REQ)
        ==
      ::
          %ETH-GET-FILTER-CHANGES
        ['ETH_GETFILTERCHANGES' (TAPE (NUM-TO-HEX FID.REQ)) ~]
      ::
          %ETH-SEND-RAW-TRANSACTION
        ['ETH_SENDRAWTRANSACTION' (TAPE (NUM-TO-HEX DAT.REQ)) ~]
      ==
    ::
    ++  ETH-CALL-TO-JSON
      =,  ENJS:FORMAT
      |=  CAL=CALL
      ^-  JSON
      :-  %O  %-  ~(GAS BY *(MAP @T JSON))
      =-  (MURN - SAME)
      ^-  (LIST (UNIT (PAIR @T JSON)))
      :~  ?~  FROM.CAL  ~
          `['FROM' (TAPE (ADDRESS-TO-HEX U.FROM.CAL))]
        ::
          `['TO' (TAPE (ADDRESS-TO-HEX TO.CAL))]
        ::
          ?~  GAS.CAL  ~
          `['GAS' (TAPE (NUM-TO-HEX U.GAS.CAL))]
        ::
          ?~  GAS-PRICE.CAL  ~
          `['GASPRICE' (TAPE (NUM-TO-HEX U.GAS-PRICE.CAL))]
        ::
          ?~  VALUE.CAL  ~
          `['VALUE' (TAPE (NUM-TO-HEX U.VALUE.CAL))]
        ::
          ?~  DATA.CAL  ~
          `['DATA' (TAPE DATA.CAL)]
      ==
    ::
    ++  BLOCK-TO-JSON
      |=  DOB=BLOCK
      ^-  JSON
      ?-  -.DOB
        %NUMBER   S+(CRIP '0' 'X' ((X-CO:CO 1) N.DOB))
        %LABEL    S+L.DOB
      ==
    ::
    ++  TOPICS-TO-JSON
      |=  TOS=(LIST ?(@UX (LIST @UX)))
      ^-  JSON
      :-  %A
      =/  TTJ
        ;:  CORK
          (CURY RENDER-HEX-BYTES 32)
          PREFIX-HEX
          TAPE:ENJS:FORMAT
        ==
      %+  TURN  TOS
      |=  T=?(@ (LIST @))
      ?@  T
        ?:  =(0 T)  ~
        (TTJ `@`T)
      A+(TURN T TTJ)
    ::
    ::  PARSING RESPONSES
    ::
    ::TODO  ++  PARSE-RESPONSE  |=  JSON  ^-  RESPONSE
    ::
    ++  PARSE-HEX-RESULT
      |=  J=JSON
      ^-  @
      ?>  ?=(%S -.J)
      (HEX-TO-NUM P.J)
    ::
    ++  PARSE-ETH-NEW-FILTER-RES  PARSE-HEX-RESULT
    ::
    ++  PARSE-ETH-BLOCK-NUMBER  PARSE-HEX-RESULT
    ::
    ++  PARSE-TRANSACTION-HASH  PARSE-HEX-RESULT
    ::
    ++  PARSE-EVENT-LOGS
      (AR:DEJS:FORMAT PARSE-EVENT-LOG)
    ::
    ++  PARSE-EVENT-LOG
      =,  DEJS:FORMAT
      |=  LOG=JSON
      ^-  EVENT-LOG
      =-  ((OT -) LOG)
      :~  =-  ['LOGINDEX'^(CU - (MU SO))]
          |=  LI=(UNIT @T)
          ?~  LI  ~
          =-  `((OU -) LOG)  ::TODO  NOT SURE IF ELEGANT OR HACKY.
          :~  'LOGINDEX'^(UN (CU HEX-TO-NUM SO))
              'TRANSACTIONINDEX'^(UN (CU HEX-TO-NUM SO))
              'TRANSACTIONHASH'^(UN (CU HEX-TO-NUM SO))
              'BLOCKNUMBER'^(UN (CU HEX-TO-NUM SO))
              'BLOCKHASH'^(UN (CU HEX-TO-NUM SO))
              'REMOVED'^(UF | BO)
          ==
        ::
          ADDRESS+(CU HEX-TO-NUM SO)
          DATA+SO
        ::
          =-  TOPICS+(CU - (AR SO))
          |=  R=(LIST @T)
          ^-  (LEST @UX)
          ?>  ?=([@T *] R)
          :-  (HEX-TO-NUM I.R)
          (TURN T.R HEX-TO-NUM)
      ==
    --
  ::
  ::  UTILITIES
  ::TODO  GIVE THEM BETTER HOMES!
  ::
  ++  NUM-TO-HEX
    |=  N=@
    ^-  TAPE
    %-  PREFIX-HEX
    %-  RENDER-HEX-BYTES
    (AS-OCTS:MIMES:HTML N)
  ::
  ++  ADDRESS-TO-HEX
    |=  A=ADDRESS
    ^-  TAPE
    %-  PREFIX-HEX
    (RENDER-HEX-BYTES 20 `@`A)
  ::
  ++  PREFIX-HEX
    |=  A=TAPE
    ^-  TAPE
    ['0' 'X' A]
  ::
  ++  RENDER-HEX-BYTES
    ::  ATOM TO STRING OF HEX BYTES WITHOUT 0X PREFIX AND DOTS.
    |=  A=OCTS
    ^-  TAPE
    ((X-CO:CO (MUL 2 P.A)) Q.A)
  ::
  ++  PAD-TO-MULTIPLE
    |=  [WAT=TAPE MOF=@UD WER=?(%LEFT %RIGHT)]
    ^-  TAPE
    =+  LEN=(LENT WAT)
    ?:  =(LEN MOF)  WAT
    =+  TAD=(REAP (SUB MOF (MOD LEN MOF)) '0')
    %-  WELD
    ?:(?=(%LEFT WER) [TAD WAT] [WAT TAD])
  ::
  ++  HEX-TO-NUM
    |=  A=@T
    (RASH (RSH 3 2 A) HEX)
  --
::
::  |JSTD: JSON STANDARD LIBRARY
::
++  JSTD
  =,  ^JSTD
  |%
  ++  RPC
    =,  ^RPC
    |%
    ++  REQUEST-TO-HISS
      |=  [URL=PURL:EYRE REQ=REQUEST]
      ^-  HISS:EYRE
      :-  URL
      :+  %POST
        %-  ~(GAS IN *MATH:EYRE)
        ~['CONTENT-TYPE'^['APPLICATION/JSON']~]
      %-  SOME
      %-  AS-OCTT:MIMES:HTML
      (EN-JSON:HTML (REQUEST-TO-JSON REQ))
    ::
    ++  REQUEST-TO-JSON
      |=  REQUEST
      ^-  JSON
      %-  PAIRS:ENJS:FORMAT
      :~  JSONRPC+S+'0.2'
          ID+S+ID
          METHOD+S+METHOD
        ::
          :-  %PARAMS
          ^-  JSON
          ?-  -.PARAMS
            %LIST     [%A +.PARAMS]
            %OBJECT   [%O (~(GAS BY *(MAP @T JSON)) +.PARAMS)]
          ==
      ==
    --
  --
::
::  |DAWN: PRE-BOOT REQUEST/RESPONSE DE/SERIALIZATION AND VALIDATION
::
++  DAWN
  =>  |%
      ::  +LIVE: PUBLIC NETWORK STATE OF A SHIP
      ::
      +$  LIVE  (UNIT [=LIFE BREACH=?])
      --
  |%
  :: +COME:DAWN: MINE A COMET UNDER A STAR
  ::
  ::    RANDOMLY GENERATES COMET ADDRESSES UNTIL WE FIND ONE WHOSE PARENT IS
  ::    IN THE LIST OF SUPPLIED STARS. ERRORS IF ANY SUPPLIED SHIP
  ::    IS NOT A STAR.
  ::
  ++  COME
    |=  [TAR=(LIST SHIP) ENY=@UVJ]
    ::
    =|  STARS=(SET SHIP)
    =.  STARS
      |-  ^+  STARS
      ?~  TAR  STARS
      ::
      ~|  [%COME-NOT-KING I.TAR]
      ?>  ?=(%KING (CLAN:TITLE I.TAR))
      $(TAR T.TAR, STARS (~(PUT IN STARS) I.TAR))
    ::
    |-  ^-  SEED:ABLE:JAEL
    =/  CUB=ACRU:AMES  (PIT:NU:CRUB:CRYPTO 512 ENY)
    =/  WHO=SHIP  `@`FIG:EX:CUB
    ?:  (~(HAS IN STARS) (^SEIN:TITLE WHO))
      [WHO 1 SEC:EX:CUB ~]
    $(ENY +(ENY))
  ::  |GIVE:DAWN: PRODUCE REQUESTS FOR PRE-BOOT VALIDATION
  ::
  ++  GIVE
    =,  RPC:ETHEREUM
    =,  ABI:ETHEREUM
    =/  TRACT  AZIMUTH:CONTRACTS:AZIMUTH
    |%
    ::  +BLOQ:GIVE:DAWN: ETH RPC FOR LATEST BLOCK NUMBER
    ::
    ++  BLOQ
      ^-  OCTS
      %-  AS-OCTT:MIMES:HTML
      %-  EN-JSON:HTML
      %+  REQUEST-TO-JSON
        `~.0
      [%ETH-BLOCK-NUMBER ~]
    ::  +CZAR:GIVE:DAWN: ETH RPC FOR GALAXY TABLE
    ::
    ++  CZAR
      |=  BOQ=@UD
      ^-  OCTS
      %-  AS-OCTT:MIMES:HTML
      %-  EN-JSON:HTML
      :-  %A
      %+  TURN  (GULF 0 255)
      |=  GAL=@
      %+  REQUEST-TO-JSON
        `(CAT 3 'GAL-' (SCOT %UD GAL))
      :+  %ETH-CALL
        =-  [FROM=~ TO=TRACT GAS=~ PRICE=~ VALUE=~ DATA=-]
        (ENCODE-CALL 'GETKEYS(UINT32)' [%UINT GAL]~)
      [%NUMBER BOQ]
    ::  +POINT:GIVE:DAWN: ETH RPC FOR SHIP'S CONTRACT STATE
    ::
    ++  POINT
      |=  [BOQ=@UD WHO=SHIP]
      ^-  OCTS
      %-  AS-OCTT:MIMES:HTML
      %-  EN-JSON:HTML
      %+  REQUEST-TO-JSON
        `~.0
      :+  %ETH-CALL
        =-  [FROM=~ TO=TRACT GAS=~ PRICE=~ VALUE=~ DATA=-]
        (ENCODE-CALL 'POINTS(UINT32)' [%UINT `@`WHO]~)
      [%NUMBER BOQ]
    ::  +TURF:GIVE:DAWN: ETH RPC FOR NETWORK DOMAINS
    ::
    ++  TURF
      |=  BOQ=@UD
      ^-  OCTS
      %-  AS-OCTT:MIMES:HTML
      %-  EN-JSON:HTML
      :-  %A
      %+  TURN  (GULF 0 2)
      |=  IDX=@
      %+  REQUEST-TO-JSON
        `(CAT 3 'TURF-' (SCOT %UD IDX))
      :+  %ETH-CALL
        =-  [FROM=~ TO=TRACT GAS=~ PRICE=~ VALUE=~ DATA=-]
        (ENCODE-CALL 'DNSDOMAINS(UINT256)' [%UINT IDX]~)
      [%NUMBER BOQ]
    --
  ::  |TAKE:DAWN: PARSE RESPONSES FOR PRE-BOOT VALIDATION
  ::
  ++  TAKE
    =,  ABI:ETHEREUM
    =,  RPC:ETHEREUM
    =,  AZIMUTH
    =,  DEJS-SOFT:FORMAT
    |%
    ::  +BLOQ:TAKE:DAWN: PARSE BLOCK NUMBER
    ::
    ++  BLOQ
      |=  REP=OCTS
      ^-  (UNIT @UD)
      =/  JON=(UNIT JSON)  (DE-JSON:HTML Q.REP)
      ?~  JON
        ~&([%BLOQ-TAKE-DAWN %INVALID-JSON] ~)
      =/  RES=(UNIT CORD)  ((OT RESULT+SO ~) U.JON)
      ?~  RES
        ~&([%BLOQ-TAKE-DAWN %INVALID-RESPONSE REP] ~)
      =/  OUT
        %-  MULE  |.
        (HEX-TO-NUM:ETHEREUM U.RES)
      ?:  ?=(%& -.OUT)
        (SOME P.OUT)
      ~&([%BLOQ-TAKE-DAWN %INVALID-BLOCK-NUMBER] ~)
    ::  +CZAR:TAKE:DAWN: PARSE GALAXY TABLE
    ::
    ++  CZAR
      |=  REP=OCTS
      ^-  (UNIT (MAP SHIP [=LIFE =PASS]))
      =/  JON=(UNIT JSON)  (DE-JSON:HTML Q.REP)
      ?~  JON
        ~&([%CZAR-TAKE-DAWN %INVALID-JSON] ~)
      =/  RES=(UNIT (LIST [@T @T]))
        ((AR (OT ID+SO RESULT+SO ~)) U.JON)
      ?~  RES
        ~&([%CZAR-TAKE-DAWN %INVALID-RESPONSE REP] ~)
      =/  DAT=(UNIT (LIST [WHO=SHIP ENC=OCTS AUT=OCTS SUT=@UD REV=@UD]))
        =-  ?:(?=(%| -.OUT) ~ (SOME P.OUT))
        ^=  OUT  %-  MULE  |.
        %+  TURN  U.RES
        |=  [ID=@T RESULT=@T]
        ^-  [WHO=SHIP ENC=OCTS AUT=OCTS SUT=@UD REV=@UD]
        :-  `@P`(SLAV %UD (RSH 3 4 ID))
        %+  DECODE-RESULTS
          RESULT
        ~[[%BYTES-N 32] [%BYTES-N 32] %UINT %UINT]
      ?~  DAT
        ~&([%BLOQ-TAKE-DAWN %INVALID-GALAXY-TABLE] ~)
      :-  ~
      %+  ROLL  U.DAT
      |=  $:  [WHO=SHIP ENC=OCTS AUT=OCTS SUT=@UD REV=@UD]
              KYZ=(MAP SHIP [=LIFE =PASS])
          ==
      ^+  KYZ
      =/  PUB=PASS
        (PASS-FROM-ETH ENC AUT SUT)
      (~(PUT BY KYZ) WHO [REV PUB])
    ::  +POINT:TAKE:DAWN: PARSE SHIP'S CONTRACT STATE
    ::
    ++  POINT
      |=  [WHO=SHIP REP=OCTS]
      ^-  (UNIT POINT:AZIMUTH)
      =/  JON=(UNIT JSON)  (DE-JSON:HTML Q.REP)
      ?~  JON
        ~&([%POINT-TAKE-DAWN %INVALID-JSON] ~)
      =/  RES=(UNIT CORD)  ((OT RESULT+SO ~) U.JON)
      ?~  RES
        ~&([%POINT-TAKE-DAWN %INVALID-RESPONSE REP] ~)
      ~?  =(U.RES '0X')
        :-  'BAD RESULT FROM NODE; IS AZIMUTH ADDRESS CORRECT?'
        AZIMUTH:CONTRACTS
      =/  OUT
        %-  MULE  |.
        %+  POINT-FROM-ETH
          WHO
        :_  *DEED:ETH-NOUN  ::TODO  CALL RIGHTS TO FILL
        (DECODE-RESULTS U.RES POINT:ETH-TYPE)
      ?:  ?=(%& -.OUT)
        (SOME P.OUT)
      ~&([%POINT-TAKE-DAWN %INVALID-POINT] ~)
    ::  +TURF:TAKE:DAWN: PARSE NETWORK DOMAINS
    ::
    ++  TURF
      |=  REP=OCTS
      ^-  (UNIT (LIST ^TURF))
      =/  JON=(UNIT JSON)  (DE-JSON:HTML Q.REP)
      ?~  JON
        ~&([%TURF-TAKE-DAWN %INVALID-JSON] ~)
      =/  RES=(UNIT (LIST [@T @T]))
        ((AR (OT ID+SO RESULT+SO ~)) U.JON)
      ?~  RES
        ~&([%TURF-TAKE-DAWN %INVALID-RESPONSE REP] ~)
      =/  DAT=(UNIT (LIST (PAIR @UD ^TURF)))
        =-  ?:(?=(%| -.OUT) ~ (SOME P.OUT))
        ^=  OUT  %-  MULE  |.
        %+  TURN  U.RES
        |=  [ID=@T RESULT=@T]
        ^-  (PAIR @UD ^TURF)
        :-  (SLAV %UD (RSH 3 5 ID))
        =/  DOM=TAPE
          (DECODE-RESULTS RESULT [%STRING]~)
        =/  HOT=HOST:EYRE
          (SCAN DOM THOS:DE-PURL:HTML)
        ?>(?=(%& -.HOT) P.HOT)
      ?~  DAT
        ~&([%TURF-TAKE-DAWN %INVALID-DOMAINS] ~)
      :-  ~
      =*  DOM  U.DAT
      :: SORT BY ID, ASCENDING, REMOVING DUPLICATES
      ::
      =|  TUF=(MAP ^TURF @UD)
      |-  ^-  (LIST ^TURF)
      ?~  DOM
        %+  TURN
          %+  SORT  ~(TAP BY TUF)
          |=([A=(PAIR ^TURF @UD) B=(PAIR ^TURF @UD)] (LTH Q.A Q.B))
        HEAD
      =?  TUF  !(~(HAS BY TUF) Q.I.DOM)
        (~(PUT BY TUF) Q.I.DOM P.I.DOM)
      $(DOM T.DOM)
    --
  ::  |SNAP:DAWN RESTORE FROM SNAPSHOT
  ::
  ++  SNAP
    !:
    |%
    ::  +BLOQ:SNAP:DAWN: EXTRACT BLOCK NUMBER
    ::
    ++  BLOQ
      |=  SNAP=SNAPSHOT:JAEL
      ^-  (UNIT @UD)
      =-  ?:(?=(%| -.OUT) ~ (SOME P.OUT))
      ^=  OUT  %-  MULE  |.
      LATEST-BLOCK.SNAP
    ::  +CZAR:SNAP:DAWN: EXTRACT GALAXY TABLE
    ::
    ++  CZAR
      |=  SNAP=SNAPSHOT:JAEL
      ^-  (UNIT (MAP SHIP [=LIFE =PASS]))
      =-  ?:(?=(%| -.OUT) ~ (SOME P.OUT))
      ^=  OUT  %-  MULE  |.
      %-  ~(GAS BY *(MAP SHIP [=LIFE =PASS]))
      %+  TURN  (GULF 0 255)
      |=  GAL=@
      ^-  [SHIP [LIFE PASS]]
      :-  GAL
      ~|  CZAR-GAL=GAL
      [LIFE PASS]:(NEED NET:(~(GOT BY POS.ETH.SNAP) GAL))
    ::  +POINT:SNAP:DAWN: EXTRACT SHIP'S CONTRACT STATE
    ::
    ++  POINT
      |=  [WHO=SHIP SNAP=SNAPSHOT:JAEL]
      ^-  (UNIT POINT:AZIMUTH)
      (~(GET BY POS.ETH.SNAP) WHO)
    ::  +TURF:SNAP:DAWN: EXTRACT NETWORK DOMAINS
    ::
    ++  TURF
      |=  SNAP=SNAPSHOT:JAEL
      ^-  (UNIT (LIST ^TURF))
      =-  ?:(?=(%| -.OUT) ~ (SOME P.OUT))
      ^=  OUT  %-  MULE  |.
      %+  MURN
        ^-  (LIST HOST:EYRE)
        %+  MURN
          ^-  (LIST @T)
          ~[PRI SEC TER]:DNS.ETH.SNAP
        |=  DOM=@T
        ^-  (UNIT HOST:EYRE)
        (RUSH DOM THOS:DE-PURL:HTML)
      |=(A=HOST:EYRE ?:(?=(%| -.A) ~ (SOME P.A)))
    --
  ::  +VERI:DAWN: VALIDATE KEYS, LIFE, DISCONTINUITY, &C
  ::
  ++  VERI
    |=  [=SEED:ABLE:JAEL =POINT:AZIMUTH =LIVE]
    ^-  (EACH SPONSOR=SHIP ERROR=TERM)
    =/  RAC  (CLAN:TITLE WHO.SEED)
    =/  CUB  (NOL:NU:CRUB:CRYPTO KEY.SEED)
    ?-  RAC
        %PAWN
      ::  A COMET ADDRESS IS THE FINGERPRINT OF THE KEYPAIR
      ::
      ?.  =(WHO.SEED `@`FIG:EX:CUB)
        [%| %KEY-MISMATCH]
      ::  A COMET CAN NEVER BE BREACHED
      ::
      ?^  LIVE
        [%| %ALREADY-BOOTED]
      ::  A COMET CAN NEVER BE RE-KEYED
      ::
      ?.  ?=(%1 LYF.SEED)
        [%| %INVALID-LIFE]
      [%& (^SEIN:TITLE WHO.SEED)]
    ::
        %EARL
      ::  A MOON MUST BE SIGNED BY THE PARENT
      ::
      ?~  SIG.SEED
        [%| %MISSING-SIG]
      ::  THE PARENT MUST BE LAUNCHED
      ::
      ?~  NET.POINT
        [%| %PARENT-NOT-KEYED]
      ::  LIFE MUST MATCH PARENT'S
      ::
      ?.  =(LYF.SEED LIFE.U.NET.POINT)
        [%| %LIFE-MISMATCH]
      =/  LOY  (COM:NU:CRUB:CRYPTO PASS.U.NET.POINT)
      =/  HAX  (SHAF %EARL (SHAM WHO.SEED LYF.SEED PUB:EX:CUB))
      ::  THE SIGNATURE MUST BE VALID
      ::
      ?.  =((SOME HAX) (SURE:AS:LOY U.SIG.SEED))
        [%| %INVALID-SIG]
      ::  XX REVISIT FOR REKEY
      ::
      ?^  LIVE
        [%| %ALREADY-BOOTED]
      [%& (^SEIN:TITLE WHO.SEED)]
    ::
        *
      ::  ON-CHAIN SHIPS MUST BE LAUNCHED
      ::
      ?~  NET.POINT
        [%| %NOT-KEYED]
      =*  NET  U.NET.POINT
      ::  BOOT KEYS MUST MATCH THE CONTRACT
      ::
      ?.  =(PUB:EX:CUB PASS.NET)
        ~&  [%KEY-MISMATCH PUB:EX:CUB PASS.NET]
        [%| %KEY-MISMATCH]
      ::  LIFE MUST MATCH THE CONTRACT
      ::
      ?.  =(LYF.SEED LIFE.NET)
        [%| %LIFE-MISMATCH]
      ::  THE BOOT LIFE MUST BE GREATER THAN AND DISCONTINUOUS WITH
      ::  THE LAST SEEN LIFE (PER THE SPONSOR)
      ::
      ?:  ?&  ?=(^ LIVE)
              ?|  ?=(%| BREACH.U.LIVE)
                  (LTE LIFE.NET LIFE.U.LIVE)
          ==  ==
        [%| %ALREADY-BOOTED]
      ::  PRODUCE THE SPONSOR FOR VERE
      ::
      ~?  !HAS.SPONSOR.NET
        [%NO-SPONSORSHIP-GUARANTEES-FROM WHO.SPONSOR.NET]
      [%& WHO.SPONSOR.NET]
    ==
  --
--  ::
