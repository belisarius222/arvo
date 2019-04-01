::
::::  /HOON/PLAN/MAR
  ::
/?    310
/-    PLAN-ACCT, PLAN-DIFF
::
::::  ~FYR
  ::
=,  EYRE
=,  HTML
=,  FORMAT
|_  ALL/{{WHO/@TXNAME LOC/@TXLOC} ACC/(MAP KNOT PLAN-ACCT)}
::
++  GROW                                                ::  CONVERT TO
  =+  ALL
  |%
  ++  TXT
    ^-  WAIN
    :+  (CAT 3 'USER ' ?~(WHO 'OF URBIT' WHO))
      (CAT 3 'LOCATION ' ?~(LOC %UNKNOWN LOC))
    %+  TURN  (SORT ~(TAP BY ACC) AOR)
    |=  {A/KNOT B/PLAN-ACCT}  ^-  CORD
    %+  RAP  3
    :^  A  ': '  USR.B
    ?~(URL.B ~ [', ' (APIX:EN-PURL U.URL.B)])
  ::
  ++  PLAN-JSON
    %-  PAIRS:ENJS  :~
      WHO+?~(WHO ~ S+WHO)
      LOC+?~(LOC ~ S+LOC)
      ACC+O+(~(RUN BY ACC) JSON-ACCT)
    ==
  ++  JSON-ACCT                       ::  HELPER
    |=  A/PLAN-ACCT  ^-  JSON
    =/  URL  ?~(URL.A ~ (TAPE:ENJS (APIX:EN-PURL U.URL.A)))
    (PAIRS:ENJS USR+S+USR.A URL+URL ~)
  --
++  GRAB  |%                                            ::  CONVERT FROM
          ++  NOUN  {{CORD CORD} (MAP KNOT PLAN-ACCT)}  ::  CLAM FROM %NOUN
          ++  TXT
            |^  |=  A/WAIN  ^+  ALL
                ?>  ?=({@T @T *} A)
                :-  [(RASH I.A USER) (RASH I.T.A LOCATION)]
                (MALT (TURN T.T.A |=(B/CORD (RASH B ACCOUNT))))
            ::
            ++  USER  ;~(PFIX (JEST 'USER ') (COOK CRIP (STAR PRN)))
            ++  KNOT  %+  COOK  CRIP
                      (PLUS ;~(POSE NUD LOW HIG HEP DOT SIG CAB))
            ++  LOCATION  ;~(PFIX (JEST 'LOCATION ') (COOK CRIP (STAR PRN)))
            ++  ACCOUNT
              ;~  PLUG
                KNOT
                ;~(PFIX COL ACE KNOT)
                (PUNT ;~(PFIX COM ACE AURF:DE-PURL))
              ==
            --
          ++  MIME  |=({* A/OCTS} (TXT (TO-WAIN Q.A)))     ::  XX MARK TRANSLATION
          --
++  GRAD
  |%
  ++  FORM  %PLAN-DIFF
  ++  DIFF
    |=  NEU/_ALL  ^-  PLAN-DIFF                        :: XXX MAP FUNCTIONS
    :+  ?:(=(-.ALL -.NEU) ~ (SOME -.NEU))
      =<  (MALT `(LIST {KNOT ~})`(MURN ~(TAP BY ACC.ALL) .))
      |=  {A/KNOT *}  ^-  (UNIT {KNOT ~})
      ?:((~(HAS BY ACC.NEU) A) ~ (SOME [A ~]))
    =<  (MALT (MURN ~(TAP BY ACC.NEU) .))
    |=  {A/KNOT B/PLAN-ACCT}  ^-  (UNIT {KNOT PLAN-ACCT})
    ?:  =([~ B] (~(GET BY ACC.ALL) A))
      ~
    (SOME [A B])
  ::
  ++  PACT
    |=  DIF/PLAN-DIFF  ^+  ALL                          :: XXX MAP FUNCTIONS
    :-  (FALL INF.DIF -.ALL)
    =;  NEU  (~(UNI BY NEU) PUT.DIF)
    =+  DEL=~(TAP BY DEL.DIF)
    |-  ^+  ACC.ALL
    ?~  DEL  ACC.ALL
    $(DEL T.DEL, ACC.ALL (~(DEL BY ACC.ALL) P.I.DEL))
  ::
  ++  CAN-JOIN
    |=  {ALI/PLAN-DIFF BOB/PLAN-DIFF}  ^-  ?
    ?&  !&(?=({{^ *} {^ *}} +<) !=(U.INF.ALI U.INF.BOB)) :: COMPATIBLE INFO
        =(~ (~(INT BY `(MAP KNOT *)`DEL.ALI) PUT.BOB))  :: NO DEL-PUT
        =(~ (~(INT BY `(MAP KNOT *)`PUT.ALI) DEL.BOB))  :: CONFLICTS
        .=  (~(INT BY PUT.ALI) PUT.BOB)                 :: AND ALL PUT
        (~(INT BY PUT.BOB) PUT.ALI)                     :: VALUES MATCH
    ==
  ::
  ++  JOIN
    |=  {ALI/PLAN-DIFF BOB/PLAN-DIFF}
    ^-  (UNIT PLAN-DIFF)
    ?.  (CAN-JOIN ALI BOB)
      ~
    %^    SOME
        (MATE INF.ALI INF.BOB)
      (~(UNI BY DEL.ALI) DEL.BOB)
    (~(UNI BY PUT.ALI) PUT.BOB)
  --
--
