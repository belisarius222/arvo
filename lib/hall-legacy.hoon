::
/?    310
/-  HALL
=,  EYRE
=>
|%
++  AUDIENCE  (MAP PARTNER (PAIR ENVELOPE DELIVERY))    ::  DESTINATION+STATE
++  BOUQUET  (SET FLAVOR)                               ::  COMPLETE AROMA
++  DELIVERY                                            ::  DELIVERY STATE
  $?  $PENDING                                          ::  UNDELIVERED
      $RECEIVED                                         ::  DELIVERED
      $REJECTED                                         ::  UNDELIVERABLE
      $RELEASED                                         ::  SENT ONE-WAY
      $ACCEPTED                                         ::  FULLY PROCESSED
  ==                                                    ::
++  ENVELOPE  (PAIR ? (UNIT PARTNER))                   ::  VISIBLE SENDER
++  FLAVOR  PATH                                        ::  CONTENT FLAVOR
++  PASSPORT                                            ::  FOREIGN FLOW
  $%  {$TWITTER P/@T}                                   ::  TWITTER
  ==                                                    ::
++  PRESENCE   ?($GONE $HEAR $TALK)                     ::  STATUS TYPE
++  SPEECH                                              ::  NARRATIVE ACTION
  $%  {$LAN P/KNOT Q/@T}                                ::  LOCAL ANNOUNCE
      {$EXP P/@T}                                       ::  HOON LINE
      {$NON ~}                                         ::  NO CONTENT (YO)
      {$EXT P/@TAS Q/*}                                 ::  EXTENDED ACTION
      {$FAT P/TORSO Q/SPEECH}                           ::  ATTACHMENT
      {$URL P/PURF}                                     ::  PARSED URL
      {$IRE P/SERIAL Q/SPEECH}                          ::  IN-REPLY-TO
      {$LIN P/? Q/@T}                                   ::  NO/@ TEXT LINE
      {$MOR P/(LIST SPEECH)}                            ::  MULTIPLEX
      {$APP P/@TAS Q/@T}                                ::  APP MESSAGE
      $:  $API                                          ::  API MESSAGE
          SERVICE/@TAS                                  ::  SERVICE NAME
          ID/@T                                         ::  ID ON THE SERVICE
          ID-URL/PURF                                   ::  LINK TO ID
          SUMMARY/@T                                    ::  SUMMARY OF EVENT
          BODY/@T                                       ::  BODY OF EVENT
          URL/PURF                                      ::  LINK TO EVENT
          META/JSON                                     ::  OTHER DATA FOR WEB
      ==                                                ::
  ==                                                    ::
++  SERIAL     @UVH                                     ::  UNIQUE IDENTITY
++  PARTNER    (EACH STATION PASSPORT)                  ::  INTERLOCUTOR
++  STATEMENT  (TREL @DA BOUQUET SPEECH)                ::  WHEN THIS
++  STATION    (PAIR SHIP KNOT)                         ::  DOMESTIC FLOW
++  TELEGRAM   (PAIR SHIP THOUGHT)                      ::  WHO WHICH WHOM WHAT
++  THOUGHT    (TREL SERIAL AUDIENCE STATEMENT)         ::  WHICH WHOM WHAT
++  TORSO                                               ::  ATTACHMENT
  $%  {$NAME (PAIR @T TORSO)}                           ::  NAMED ATTACHMENT
      {$TEXT (LIST @T)}                                 ::  TEXT LINES
      {$TANK (LIST TANK)}                               ::  TANK LIST
  ==                                                    ::
--
|%
++  FROM-JSON
  =,  DEJS-SOFT:FORMAT
  |:  $:{A/^JSON}  ^-  (LIST TELEGRAM:HALL)
  =-  %-  ZING
      %+  TURN
        (NEED ((AR (OT SHIP+(SU FED:AG) THOUGHT+THOT ~)) A))
      CONVERT-TELEGRAM
  |%
  ++  OF
    |*  A/(POLE {@TAS FIST})
    |=  B/^JSON
    %.  ((OF:DEJS-SOFT:FORMAT A) B)
    %-  SLOG
    ?+  B  ~
        {$O *}
      %+  MURN  `(LIST {@TAS FIST})`A
      |=  {C/TERM D/FIST}  ^-  (UNIT TANK)
      =+  (~(GET BY P.B) C)
      ?~  -  ~
      =+  (D U)
      ?~  -  (SOME >[C U]<)
      ~
    ==
  ++  OP                                              ::  PARSE KEYS OF MAP
    |*  {FEL/RULE WIT/FIST}
    %+  CU  MALT
    %+  CI
      |=  A/(MAP CORD _(NEED *WIT))
      ^-  (UNIT (LIST _[(WONK *FEL) (NEED *WIT)]))
      (ZL (TURN ~(TAP BY A) (HEAD-RUSH FEL)))
    (OM WIT)
  ::
  ++  AS                                              ::  ARRAY AS SET
    |*  A/FIST
    (CU ~(GAS IN *(SET _(NEED *A))) (AR A))
  ::
  ++  KE                                              ::  CALLBACKS
    |*  {GAR/* SEF/_|.(FIST)}
    |=  JON/^JSON
    ^-  (UNIT _GAR)
    =-  ~!  GAR  ~!  (NEED -)  -
    ((SEF) JON)
  ::
  ++  LAKE  |*(A/_* $-(^JSON (UNIT A)))
  ++  HEAD-RUSH
    |*  A/RULE
    |*  {CORD *}
    =+  NIT=(RUSH +<- A)
    ?~  NIT  ~
    (SOME [U.NIT +>->])
  ::
  ++  THOT
    ^-  $-(^JSON (UNIT THOUGHT))
    %-  OT  :~
      SERIAL+`$-(^JSON (UNIT SERIAL))`(CI (SLAT %UV) SO)
      AUDIENCE+`$-(^JSON (UNIT AUDIENCE))`AUDI
      STATEMENT+`$-(^JSON (UNIT STATEMENT))`STAM
    ==
  ::
  ++  AUDI  `$-(^JSON (UNIT AUDIENCE))`(OP PARN MEMB)
  ++  AURI  (OP PARN (CI (SOFT PRESENCE) SO))
  ++  MEMB  ^-  $-(^JSON (UNIT (PAIR ENVELOPE DELIVERY)))
            (OT ENVELOPE+LOPE DELIVERY+(CI (SOFT DELIVERY) SO) ~)
  ++  LOPE  (OT VISIBLE+BO SENDER+(MU (SU PARN)) ~)
  ::
  ++  PARN
    ^-  $-(NAIL (LIKE PARTNER))
    %+  PICK
      ;~((GLUE NET) ;~(PFIX SIG FED:AG) URS:AB)
    %+  SEAR  (SOFT PASSPORT)
    ;~((GLUE NET) SYM URS:AB)                         ::  XX  [A-Z0-9_]{1,15}
  ::
  ++  STAM  (OT DATE+DI BOUQUET+(AS (AR SO)) SPEECH+SPEC ~)
  ++  SPEC
    %+  KE  *SPEECH  |.  ~+
    %-  OF  :~
      LIN+(OT SAY+BO TXT+SO ~)
      URL+(OT TXT+(SU AURF:DE-PURL:HTML) ~)
      EXP+(OT TXT+SO ~)
      APP+(OT TXT+SO SRC+SO ~)
      FAT+(OT TOR+TORS TAF+SPEC ~)
      EXT+(OT NOM+SO TXE+BLOB ~)
      NON+UL
      MOR+(AR SPEC)
      ::  INV+(OT SHIP+(SU FED:AG) PARTY+(SU URS:AB) ~)
    ==
  ++  TORS
    %+  KE  *TORSO  |.  ~+
    %-  OF  :~
      NAME+(OT NOM+SO MON+TORS ~)
      TEXT+(CU TO-WAIN:FORMAT SO)
      TANK+(OT DAT+(CU (HARD (LIST TANK)) BLOB) ~)
    ==
  ::
  ++  BLOB  (CU CUE (SU FEL:DE-BASE64:MIMES:HTML))
  ::
  ::
  ++  CONVERT-TELEGRAM
    |=  T/TELEGRAM
    ^-  (LIST TELEGRAM:HALL)
    =+  AUD=(CONVERT-AUDIENCE Q.Q.T)
    %+  TURN  (CONVERT-SPEECH R.R.Q.T)
    |=  S/SPEECH:HALL
    [P.T P.Q.T AUD P.R.Q.T S]
  ::
  ++  CONVERT-AUDIENCE
    |=  A/AUDIENCE
    ^-  AUDIENCE:HALL
    %-  SY
    ^-  (LIST CIRCLE:HALL)
    %+  MURN  ~(TAP IN ~(KEY BY A))
    |=  P/PARTNER
    ^-  (UNIT CIRCLE:HALL)
    ?-  -.P
      %&  :+  ~  P.P.P
          ?:  ?|  =(Q.P.P 'PORCH')
                  =(Q.P.P 'COURT')
                  =(Q.P.P 'FLOOR')
              ==
            %INBOX
          Q.P.P
      %|  ~
    ==
  ::
  ++  CONVERT-SPEECH
    |=  S/SPEECH
    ^-  (LIST SPEECH:HALL)
    ?+  -.S  ~&([%IGNORING -.S] ~)
      $LIN  [%LIN !P.S Q.S]~
      $URL  [%URL P.S]~
      $EXP  [%EXP P.S ~]~
      $IRE  %+  TURN  (CONVERT-SPEECH Q.S)
            |=  I/SPEECH:HALL
            [%IRE P.S I]
      $APP  [%APP P.S [%LIN | Q.S]]~
      $FAT  ?:  &(?=($EXP -.Q.S) ?=($TANK -.P.S))
              [%EXP P.Q.S +.P.S]~
            =+  SES=(CONVERT-SPEECH Q.S)
            =?  SES  =(0 (LENT SES))  [%LIN | '']~
            [[%FAT P.S (SNAG 0 SES)] (SLAG 1 SES)]
      $MOR  (ZING (TURN P.S CONVERT-SPEECH))
    ==
  --
--
