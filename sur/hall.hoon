::
::::  /SUR/HALL/HOON
  ::
^?
|%
::
::TODO  USE DIFFERENT WORDS FOR DIFFERENT KINDS OF BURDENS
::TODO  RENAME DET/DELTA IN MOST PLACE? THEY MAY BE (DIFFERENT KINDS OF) DELTAS,
::      BUT LOCATION IN CONTROL FLOW ALREADY INDICATES DELTA-NESS.
::
::  #
::  #  %WRAPPERS
::  #
::    WRAPPER MOLDS, FOR SEMANTIC CLARITY.
+|  %WRAPPERS
::
::TODO  RENAME
++  NAME  TERM                                          ::  CIRCLE NAME
++  NICK  CORD                                          ::  LOCAL NICKNAME
++  TAGS  (SET KNOT)                                    ::  USAGE TAGS
::
::  #
::  #  %QUERY-MODELS
::  #
::    MODELS RELATING TO QUERIES, THEIR RESULTS AND UPDATES.
+|  %QUERY-MODELS
::
++  QUERY                                               ::  QUERY PATHS
  $%  {$CLIENT ~}                                      ::  SHARED UI STATE
      {$CIRCLES WHO/SHIP}                               ::  READABLE CIRCLES
      {$PUBLIC ~}                                      ::  PUBLIC MEMBERSHIPS
      {$BURDEN WHO/SHIP}  ::TODO  EVENTUALLY, NOM/NAME. ::  DUTIES TO SHARE
      {$REPORT ~}                                      ::  DUTY REPORTS
      {$PEERS NOM/NAME}                                 ::  READERS OF STORY
      $:  $CIRCLE                                       ::  STORY QUERY
          NOM/NAME                                      ::  CIRCLE NAME
          WER/(UNIT CIRCLE)                             ::  FROM SOURCE
          WAT/(SET CIRCLE-DATA)                         ::  DATA TO GET
          RAN/RANGE                                     ::  QUERY DURATION
      ==                                                ::
      ::TODO  IN THE FUTURE, WE MAY WANT MUCH MORE      ::
      ::      DETAILED QUERYING ABILITIES.              ::
  ==                                                    ::
++  CIRCLE-DATA                                         ::  KINDS OF CIRCLE DATA
  $?  $GRAMS                                            ::  MESSAGES
      $GROUP-L                                          ::  LOCAL PRESENCE
      $GROUP-R                                          ::  REMOTE PRESENCES
      $CONFIG-L                                         ::  LOCAL CONFIG
      $CONFIG-R                                         ::  REMOTE CONFIGS
  ==                                                    ::
++  RANGE                                               ::  INCLUSIVE MSG RANGE
  %-  UNIT                                              ::  ~ MEANS EVERYTHING
  $:  HED/PLACE                                         ::  START OF RANGE
      TAL/(UNIT PLACE)                                  ::  OPT END OF RANGE
  ==                                                    ::
++  PLACE                                               ::  RANGE INDICATORS
  $%  {$DA @DA}                                         ::  DATE
      {$UD @UD}                                         ::  MESSAGE NUMBER
      {$SD @SD}                                         ::  PREVIOUS MESSAGES
  ==                                                    ::
++  PRIZE                                               ::  QUERY RESULT
  $%  {$CLIENT PRIZE-CLIENT}                            ::  /CLIENT
      {$CIRCLES CIS/(SET NAME)}                         ::  /CIRCLES
      {$PUBLIC CIS/(SET CIRCLE)}                        ::  /PUBLIC
      {$BURDEN SOS/(MAP NAME BURDEN)}                   ::  /BURDEN
      {$REPORT ~}                                      ::  /REPORT
      {$PEERS PES/(JAR SHIP QUERY)}                     ::  /PEERS
      {$CIRCLE PACKAGE}                                 ::  /CIRCLE
  ==                                                    ::
++  PRIZE-CLIENT                                        ::  SHARED UI STATE
  $:  GYS/(JUG CHAR AUDIENCE)                           ::  GLYPH BINDINGS
      NIS/(MAP SHIP NICK)                               ::  LOCAL NICKNAMES
  ==                                                    ::
++  RUMOR                                               ::  QUERY RESULT CHANGE
  $%  {$CLIENT RUM/RUMOR-CLIENT}                        ::  /CLIENT
      {$CIRCLES ADD/? CIR/NAME}                         ::  /CIRCLES
      {$PUBLIC ADD/? CIR/CIRCLE}                        ::  /PUBLIC
      {$BURDEN NOM/NAME RUM/RUMOR-STORY}                ::  /BURDEN
      {$PEERS ADD/? WHO/SHIP QER/QUERY}                 ::  /PEERS
      {$CIRCLE RUM/RUMOR-STORY}                         ::  /CIRCLE
  ==                                                    ::
++  RUMOR-CLIENT                                        ::  CHANGED UI STATE
  $%  {$GLYPH DIFF-GLYPH}                               ::  UN/BOUND GLYPH
      {$NICK DIFF-NICK}                                 ::  CHANGED NICKNAME
  ==                                                    ::
++  SHIPMENT                                            ::  STANDARD PAYLOAD
  $:  COS/LOBBY                                         ::  LOC & REM CONFIGS
      PES/CROWD                                         ::  LOC & REM PRESENCES
  ==                                                    ::
++  BURDEN                                              ::  FULL STORY STATE
  $:  GAZ/(LIST TELEGRAM)                               ::  ALL MESSAGES
      SHIPMENT                                          ::  METADATA
  ==                                                    ::
++  PACKAGE                                             ::  STORY STATE
  $:  NES/(LIST ENVELOPE)                               ::  MESSAGES
      SHIPMENT                                          ::  METADATA
  ==                                                    ::
++  DIFF-GLYPH  {BIN/? GYF/CHAR AUD/AUDIENCE}           ::  UN/BOUND GLYPH
++  DIFF-NICK   {WHO/SHIP NIC/NICK}                     ::  CHANGED NICKNAME
++  DIFF-STORY                                          ::  STORY CHANGE
  $%  {$NEW COF/CONFIG}                                 ::  NEW STORY
      {$BEAR BUR/BURDEN}                                ::  NEW INHERITED STORY
      {$PEER ADD/? WHO/SHIP QER/QUERY}                  ::  GAIN/LOSE SUBSCRIBER
      {$CONFIG CIR/CIRCLE DIF/DIFF-CONFIG}              ::  NEW/CHANGED CONFIG
      {$STATUS CIR/CIRCLE WHO/SHIP DIF/DIFF-STATUS}     ::  NEW/CHANGED STATUS
      {$REMOVE ~}                                      ::  REMOVED STORY
  ==                                                    ::
++  RUMOR-STORY                                         ::  STORY RUMOR
  $%  {$GRAM SRC/CIRCLE NEV/ENVELOPE}                   ::  NEW/CHANGED MESSAGE
      DIFF-STORY                                        ::  BOTH IN & OUTWARD
  ==                                                    ::
++  DIFF-CONFIG                                         ::  CONFIG CHANGE
  $%  {$FULL COF/CONFIG}                                ::  SET W/O SIDE-EFFECTS
      {$SOURCE ADD/? SRC/SOURCE}                        ::  ADD/REM SOURCES
      {$CAPTION CAP/CORD}                               ::  CHANGED DESCRIPTION
      {$USAGE ADD/? TAS/TAGS}                           ::  ADD/REM USAGE TAGS
      {$FILTER FIT/FILTER}                              ::  CHANGED FILTER
      {$SECURE SEC/SECURITY}                            ::  CHANGED SECURITY
      {$PERMIT ADD/? SIS/(SET SHIP)}                    ::  ADD/REM TO B/W-LIST
      {$REMOVE ~}                                       ::  REMOVED CONFIG
      {$READ RED/@UD}                                   ::  CHANGED READ MESSAGE
  ==                                                    ::
++  DIFF-STATUS                                         ::  STATUS CHANGE
  $%  {$FULL SAT/STATUS}                                ::  FULLY CHANGED STATUS
      {$PRESENCE PEC/PRESENCE}                          ::  CHANGED PRESENCE
      {$HUMAN DIF/DIFF-HUMAN}                           ::  CHANGED NAME
      {$REMOVE ~}                                       ::  REMOVED STATUS
  ==                                                    ::
++  DIFF-HUMAN                                          ::  NAME CHANGE
  $%  {$FULL MAN/HUMAN}                                 ::  FULLY CHANGED NAME
      {$HANDLE HAN/(UNIT CORD)}                         ::  CHANGED HANDLE
      {$TRUE TRU/(UNIT TRUENAME)}                       ::  CHANGED TRUE NAME
  ==                                                    ::
::
::  #
::  #  %CLIENT-COMMUNICATION
::  #
::    HALL INTERFACES FOR CLIENTS.
+|  %CLIENT-COMMUNICATION
::
++  ACTION                                              ::  USER ACTION
  $%  ::  CIRCLE CONFIGURATION                          ::
      {$CREATE NOM/NAME DES/CORD SEC/SECURITY}          ::  CREATE CIRCLE
      {$DESIGN NOM/NAME COF/CONFIG}                     ::  CREATE WITH CONFIG
      {$DELETE NOM/NAME WHY/(UNIT CORD)}                ::  DELETE + ANNOUNCE
      {$DEPICT NOM/NAME DES/CORD}                       ::  CHANGE DESCRIPTION
      {$FILTER NOM/NAME FIT/FILTER}                     ::  CHANGE MESSAGE RULES
      {$PERMIT NOM/NAME INV/? SIS/(SET SHIP)}           ::  INVITE/BANISH
      {$SOURCE NOM/NAME SUB/? SRS/(SET SOURCE)}         ::  UN/SUB TO/FROM SRC
      {$READ NOM/NAME RED/@UD}                          ::  CHANGE READ MESSAGE
      {$NEWDM SIS/(SET SHIP)}
      {$USAGE NOM/NAME ADD/? TAS/TAGS}                  ::  ADD/REM USAGE TAGS
      ::  MESSAGING                                     ::
      {$CONVEY TOS/(LIST THOUGHT)}                      ::  POST EXACT
      {$PHRASE AUD/AUDIENCE SES/(LIST SPEECH)}          ::  POST EASY
      ::  PERSONAL METADATA                             ::
      {$NOTIFY AUD/AUDIENCE PES/(UNIT PRESENCE)}        ::  OUR PRESENCE UPDATE
      {$NAMING AUD/AUDIENCE MAN/HUMAN}                  ::  OUR NAME UPDATE
      ::  CHANGING SHARED UI                            ::
      {$GLYPH GYF/CHAR AUD/AUDIENCE BIN/?}              ::  UN/BIND A GLYPH
      {$NICK WHO/SHIP NIC/NICK}                         ::  NEW IDENTITY
      ::  MISC CHANGES                                  ::
      {$PUBLIC ADD/? CIR/CIRCLE}                        ::  SHOW/HIDE MEMBERSHIP
  ==                                                    ::
::
::  #
::  #  %HALL-COMMUNICATION
::  #
::    STRUCTURES FOR COMMUNICATING BETWEEN HALLS.
+|  %HALL-COMMUNICATION
::
++  COMMAND                                             ::  EFFECT ON STORY
  $%  {$PUBLISH TOS/(LIST THOUGHT)}                     ::  DELIVER
      {$PRESENT NOS/(SET NAME) DIF/DIFF-STATUS}         ::  STATUS UPDATE
      {$BEARING ~}                                     ::  PROMPT TO LISTEN
  ==                                                    ::
::
::  #
::  #  %CIRCLES
::  #
::    MESSAGING TARGETS AND THEIR METADATA.
+|  %CIRCLES
::
++  CIRCLE     {HOS/SHIP NOM/NAME}                      ::  NATIVE TARGET
::  CIRCLE CONFIGURATIONS.                              ::
++  LOBBY      {LOC/CONFIG REM/(MAP CIRCLE CONFIG)}     ::  OUR & SRCS CONFIGS
++  CONFIG                                              ::  CIRCLE CONFIG
  $:  SRC/(SET SOURCE)                                  ::  ACTIVE SOURCES
      CAP/CORD                                          ::  DESCRIPTION
      TAG/TAGS                                          ::  USAGE TAGS
      FIT/FILTER                                        ::  MESSAGE RULES
      CON/CONTROL                                       ::  RESTRICTIONS
      RED/@UD                                           ::  LAST READ MESSAGE
  ==                                                    ::
++  SOURCE  {CIR/CIRCLE RAN/RANGE}                      ::  SUBSCRIPTION TARGET
++  FILTER                                              ::  CONTENT FILTERS
  $:  CAS/?                                             ::  DIS/ALLOW CAPITALS
      UTF/?                                             ::  DIS/ALLOW NON-ASCII
      ::TODO  MAYBE MESSAGE LENGTH
  ==                                                    ::
++  CONTROL    {SEC/SECURITY SIS/(SET SHIP)}            ::  ACCESS CONTROL
++  SECURITY                                            ::  SECURITY MODE
  $?  $CHANNEL                                          ::  BLACKLIST
      $VILLAGE                                          ::  WHITELIST
      $JOURNAL                                          ::  PUB R, WHITELIST W
      $MAILBOX                                          ::  OUR R, BLACKLIST W
      $CUSTOM                                           ::  ACCORDING TO CUSTOM-RULE
  ==                                                    ::
::  PARTICIPANT METADATA.                               ::
++  CROWD      {LOC/GROUP REM/(MAP CIRCLE GROUP)}       ::  OUR & SRCS PRESENCES
++  GROUP      (MAP SHIP STATUS)                        ::  PRESENCE MAP
++  STATUS     {PEC/PRESENCE MAN/HUMAN}                 ::  PARTICIPANT
++  PRESENCE                                            ::  STATUS TYPE
  $?  $GONE                                             ::  ABSENT
      $IDLE                                             ::  IDLE
      $HEAR                                             ::  PRESENT
      $TALK                                             ::  TYPING
  ==                                                    ::
++  HUMAN                                               ::  HUMAN IDENTIFIER
  $:  HAN/(UNIT CORD)                                   ::  HANDLE
      TRU/(UNIT TRUENAME)                               ::  TRUE NAME
  ==                                                    ::
++  TRUENAME   {FIR/CORD MID/(UNIT CORD) LAS/CORD}      ::  REAL-LIFE NAME
::
::  #
::  #  %MESSAGE-DATA
::  #
::    STRUCTURES FOR CONTAINING MAIN MESSAGE DATA.
+|  %MESSAGE-DATA
::
::TODO  SOME STRUCTURE FOR EXTRA MESSAGE STATE
::      LOCAL (TO CLIENTS): DELIVERY STATE, READ FLAGS
::      REMOTE (TO HALLS): SEQUENCE NR
++  ENVELOPE   {NUM/@UD GAM/TELEGRAM}                   ::  OUTWARD MESSAGE
++  TELEGRAM   {AUT/SHIP THOUGHT}                       ::  WHOSE MESSAGE
++  THOUGHT                                             ::  INNER MESSAGE
  $:  UID/SERIAL                                        ::  UNIQUE IDENTIFIER
      AUD/AUDIENCE                                      ::  DESTINATIONS
      WEN/@DA                                           ::  TIMESTAMP
      SEP/SPEECH                                        ::  CONTENT
  ==                                                    ::
++  SPEECH                                              ::  CONTENT BODY
  $%  {$LIN PAT/? MSG/CORD}                             ::  NO/@ TEXT LINE
      {$URL URL/PURF:EYRE}                              ::  PARSED URL
      {$EXP EXP/CORD RES/(LIST TANK)}                   ::  HOON LINE
      {$IRE TOP/SERIAL SEP/SPEECH}                      ::  IN REPLY TO
      {$FAT TAC/ATTACHE SEP/SPEECH}                     ::  ATTACHMENT
      {$APP APP/TERM SEP/SPEECH}                        ::  APP MESSAGE
      {$INV INV/? CIR/CIRCLE}                           ::  INV/BAN FOR CIRCLE
  ==                                                    ::
++  ATTACHE                                             ::  ATTACHMENT
  $%  {$NAME NOM/CORD TAC/ATTACHE}                      ::  NAMED ATTACHMENT
      {$TEXT (LIST CORD)}                               ::  TEXT LINES
      {$TANK (LIST TANK)}                               ::  TANK LIST
  ==                                                    ::
::
::  #
::  #  %MESSAGE-METADATA
::  #
::    STRUCTURES FOR CONTAINING MESSAGE METADATA.
+|  %MESSAGE-METADATA
::
++  SERIAL     @UVH                                     ::  UNIQUE IDENTIFIER
++  AUDIENCE   (SET CIRCLE)                             ::  DESTINATIONS
++  TRACKING   (MAP CIRCLE DELIVERY)                    ::  DELIVERY PER TARGET
++  DELIVERY                                            ::  DELIVERY STATE
  $?  $PENDING                                          ::  UNDELIVERED
      $ACCEPTED                                         ::  RECEIVED
      $REJECTED                                         ::  DENIED
  ==                                                    ::
--
