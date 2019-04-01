!:  ::  %EYRE, HTTP SERVANT
!?  164
::::
|=  PIT/VASE
=,  EYRE
=,  WIRED
=,  UNITY
=,  FORMAT
=,  MIMES:HTML
=,  HTML
=>  =~
|%                                                      ::  INTERFACES
++  MOVE  {P/DUCT Q/(WIND NOTE GIFT:ABLE)}              ::  LOCAL MOVE
++  NOTE                                                ::  OUT REQUEST $->
          $%  $:  $A                                    ::  TO %AMES
          $%  {$WANT P/SHIP Q/{PATH *}}                 ::
          ==  ==                                        ::
              $:  $B                                    ::  TO  %BEHN
          $%  {$WAIT P/@DA}                             ::
              {$REST P/@DA}                             ::
          ==  ==                                        ::
              $:  $D                                    ::  TO %DILL
          $%  {$FLOG P/{$CRUD P/@TAS Q/(LIST TANK)}}    ::
          ==  ==                                        ::
              $:  $E                                    ::  TO SELF
          $%  {$THUD ~}                                ::  PROXIED DEATH
              {$THIS P/? Q/CLIP R/HTTQ}                 ::  PROXIED REQUEST
              {$META VASE}                              ::  TYPE CHECK
          ==  ==                                        ::
              $:  $F                                            ::
          $%  [%BUILD LIVE=? SCHEMATIC=SCHEMATIC:FORD]
              [%KILL ~]
          ==  ==
              $:  $G                                    ::  TO %GALL
          $%  {$DEAL P/SOCK Q/CUSH:GALL}               ::  FULL TRANSMISSION
          ==  ==                                        ::
              $:  %J                                    ::  TO %JAEL
          $%  [%TURF ~]                                 ::  VIEW DOMAINS
          ==  ==  ==                                    ::
++  SIGN                                                ::  IN RESULT $<-
          $%  $:  $A                                    ::  BY %AMES
          $%  {$WOOT P/SHIP Q/COOP}                     ::  ACKNOWLEDGMENT
          ==  ==                                        ::
              $:  $B                                    ::  BY %BEHN
          $%  {$WAKE ~}                                ::  TIMER ACTIVATE
          ==  ==                                        ::
              $:  $G                                    ::  BY %GALL
          $%  {$UNTO P/CUFT:GALL}                      ::  WITHIN AGENT
          ==  ==                                        ::
              $:  $E                                    ::  BY SELF
          $%  {$THOU P/HTTR}                            ::  RESPONSE FOR PROXY
          ==  ==                                        ::
              $:  $F
          $%  [%MADE DATE=@DA RESULT=MADE-RESULT:FORD]  ::
          ==  ==
              $:  %J                                    ::  FROM %JAEL
          $%  [%TURF TURF=(LIST TURF)]                  ::  BIND TO DOMAINS
          ==  ==                                        ::
              $:  @TAS                                  ::  BY ANY
          $%  {$CRUD P/@TAS Q/(LIST TANK)}              ::
          ==  ==  ==                                    ::
++  IXOR  @T                                            ::  ORYX HASH
++  WHIR  $@  ~                                        ::  WIRE SUBSET
          $%  {$AC P/HOLE Q/WHIR}                       ::  COOKIED
              {$AT P/HOLE Q/WHIR}                       ::  AUTHENTICATED
              {$AY P/KNOT Q/KNOT ~}     :: /AY/@P/@UVH ::  REMOTE DUCT
              {$HA P/PATH}               :: /HA/[BEAK]  ::  GET REQUEST
              {$HE P/WHIR}                              ::  HEAD REQUEST
              {$HI P/KNOT Q/MARK ~}                    ::  OUTBOUND HTTP
              {$SE P/WHIR-SE Q/{USER (LIST @T)}}        ::  OUTBOUND TO DOMAIN
              {$SI ~}                                  ::  RESPONSE DONE
              {$OF P/IXOR Q/$@(~ WHIR-OF)}             ::  ASSOCIATED VIEW
              {$OW P/IXOR ~}                           ::  DYING VIEW
              {$ON ~}                                  ::  DEPENDENCY
          ==                                            ::
++  WHIR-OF  {P/@TAXP Q/TERM R/?($MESS $LENS) S/WIRE}   ::  PATH IN DOCK
++  WHIR-SE  ?($CORE VI-ARM)                            ::  BUILD/CALL
++  VI-ARM
  $?  $FILTER-REQUEST                                   ::  ++OUT MOD REQUEST
      $FILTER-RESPONSE                                  ::  ++RES USE RESULT
      $RECEIVE-AUTH-RESPONSE                            ::  ++BAK AUTH RESPONSE
      $RECEIVE-AUTH-QUERY-STRING                        ::  ++IN HANDLE CODE
      $OUT
      $RES
      $BAK
      $IN
  ==                                                    ::
--                                                      ::
|%                                                      ::  MODELS
++  BOLO                                                ::  EYRE STATE
  $:  $1                                                ::  VERSION
      DOM/(SET (LIST @T))                               ::  DOMAIN NAMES
      FIG/HTTP-CONFIG                                   ::  CONFIG
      POR/{CLR/@UD SEK/(UNIT @UD)}                      ::  LIVE PORTS
      WEL/WANK                                          ::  .WELL-KNOWN
      GUB/@T                                            ::  RANDOM IDENTITY
      TOP/BEAM                                          ::  FORD SERVE PREFIX
      GED/DUCT                                          ::  CLIENT INTERFACE
      DED/(SET DUCT)                                    ::  KILLED REQUESTS
      LYV/(MAP DUCT LIVE)                               ::  LIVING REQUESTS
      POX/(MAP @UVH DUCT)                               ::  PROXIED SESSIONS
      ASK/{P/@UD Q/(MAP @UD {P/DUCT Q/HISS})}           ::  OUTGOING BY NUMBER
      KES/(MAP DUCT @UD)                                ::  OUTGOING BY DUCT
      NEY/@UVI                                          ::  ROLLING ENTROPY
      DOP/(MAP HOST SHIP)                               ::  HOST ALIASING
      LIZ/(JUG @UVH (EACH DUCT IXOR))                   ::  FORD DEPSETS
      WUP/(MAP HOLE CYST)                               ::  SECURE SESSIONS
      SOP/(MAP HOLE {SHIP ?})                           ::  FOREIGN SESS NAMES
      WIX/(MAP IXOR STEM)                               ::  OPEN VIEWS
      SEC/(MAP {USER (LIST @T)} DRIV)                   ::  SECURITY DRIVERS
  ==                                                    ::
::
++  DRIV                                                ::  DRIVER STATE
  %+  PAIR  (UNIT $@(~ VASE))                          ::  MAIN CORE
  {LIV/? REQ/(QEU (TREL DUCT MARK VASE:HISS))}          ::  WAITING REQUESTS
::
++  LIVE                                                ::  IN FLIGHT
  $%  {$EXEC P/WHIR}                                    ::  FORD BUILD
      {$WASP P/(LIST @UVH)}                             ::  FORD DEPS
      {$XENO P/SHIP}                                    ::  PROXIED REQUEST
      {$POLL P/IXOR}                                    ::  SESSION STATE
  ==
++  CYST                                                ::  CLIENT SESSION
  $:  CED/CRED                                          ::  CREDENTIAL
      {HIM/SHIP AUT/(SET SHIP)}                         ::  AUTHENTICATED
      CUG/(LIST @T)                                     ::  UNACKED COOKIES
      LAX/@DA                                           ::  LAST USED
      WAY/(MAP SHIP {PURL DUCT})                        ::  WAITING AUTH
      VEW/(SET ORYX)                                    ::  OPEN VIEWS XX EXPIRE
  ==                                                    ::
::
++  STEM                                                ::  CLIENT VIEW
  $:  HIM/SHIP                                          ::  STATIC IDENTITY
      UDE/(UNIT {P/DUCT Q/?})                           ::  STREAM LONG-POLL?
      ERA/@DA                                           ::  NEXT WAKE
      DIE/@DA                                           ::  COLLECTION DATE
      SUS/(SET {DOCK $JSON WIRE PATH})                  ::  SUBSCRIPTIONS
      EVE/{P/@U Q/(MAP @U EVEN)}                        ::  QUEUED EVENTS
      MED/(QEU DUCT)                                    ::  WAITING /~/TO/
  ==
++  EVEN                                                ::  CLIENT EVENT
  $%  {$NEWS P/@UVH}
      {$QUIT P/{DOCK PATH}}
      {$RUSH P/{DOCK PATH} Q/JSON}
  ==
::
++  PERK                                                ::  PARSED REQUEST
  $%  {$AUTH P/PERK-AUTH}
      {$AWAY ~}
      {$OATH P/KNOT Q/(LIST @T)}
      {$BUGS P/?($AS $TO) ~}
      {$BEAM P/BEAM}
      {$DEPS P/?($PUT $DELT) Q/@UVH}
      {$MESS P/DOCK Q/MARK R/WIRE S/JSON}
      {$POLL P/{I/@UVH T/(LIST @UVH)}}
      {$SPUR P/SPUR}
      {$SUBS P/?($PUT $DELT) Q/{DOCK $JSON WIRE PATH}}
      {$VIEW P/IXOR Q/{~ U/@UD}}
      ::{$VIEW P/IXOR Q/{~ U/@UD} R/(UNIT @DR)}
  ==
::
++  PERK-AUTH                                           ::  PARSED AUTH
  $%  {$AT P/PORK}                                      ::  INJECT AUTH
      {$DEL P/(UNIT SHIP)}
      {$GET HIM/SHIP REM/PORK}
      {$JS ~}
      {$JSON ~}
      {$TRY HIM/SHIP PAZ/(UNIT CORD)}
      {$XEN SES/HOLE REM/PORK}
  ==
::
++  PEST                                                ::  RESULT
  $@  ~
  $%  {$$ P/HTTR}                                       ::  DIRECT RESPONSE
      {$RED ~}                                         ::  PARENT REDIRECT
      {$BAKE P/WHIR Q/MARK R/COIN S/BEAM}               ::  FORD REQUEST
      {$JS P/@T}                                        ::  SCRIPT
      {$JSON P/JSON}                                    ::  DATA
      {$HTML P/MANX}                                    ::  SUCCESSFUL PAGE
      {$HTME P/MANX}                                    ::  AUTHENTICATION FAIL
  ==
::
++  WANK                                                ::  .WELL-KNOWN ANKH
  $~  [~ ~]
  {P/(UNIT MIME) Q/(MAP @TA WANK)}
--                                                      ::
|%
++  EAT-HEADERS
  |=  HED/(LIST {P/@T Q/@T})  ^-  MATH
  %+  ROLL  HED
  |=  {A/{P/CORD Q/CORD} B/MATH}
  =.  P.A  (CRIP (CASS (TRIP P.A)))
  (~(ADD JA B) P.A Q.A)
::
++  FCGI                                                ::  CREDENTIAL CABOOSE
  |=  {QUY/QUAY CED/CRED}  ^-  COIN
  :+  %MANY
    [%BLOB CED]
  |-  ^-  (LIST COIN)
  ?~  QUY  [%$ %N ~]~
  [[%$ %T P.I.QUY] [%$ %T Q.I.QUY] $(QUY T.QUY)]
::
++  GSIG  |=({A/DOCK B/?($MESS $LENS) C/PATH} [(SCOT %P P.A) Q.A B C])
++  SESSION-FROM-COOKIES
  |=  {NAM/@T MAF/MATH}
  ^-  (UNIT HOLE)
  (FROM-COOKIES MAF |=({K/@T V/@} &(=(NAM K) !=('~' V))))
::
++  SHIP-FROM-COOKIES
  |=  MAF/MATH  ^-  (UNIT SHIP)
  (BIFF (FROM-COOKIES MAF |=({K/@ @} =(%SHIP K))) (SLAT %P))
::
++  FROM-COOKIES
  |=  {MAF/MATH FIL/$-({@T @T} ?)}
  =+  `COT/(LIST @T)`(~(GET JU MAF) 'COOKIE')
  =+  `COK/QUAY`(ZING `(LIST QUAY)`(MURN COT (CURR RUSH COCK:DE-PURL)))
  |-  ^-  (UNIT CORD)
  ?~  COK  ~
  ?:((FIL I.COK) [~ Q.I.COK] $(COK T.COK))
::
++  PACK                                                ::  LIGHT PATH ENCODING
  |=  {A/TERM B/PATH}  ^-  KNOT
  %+  RAP  3  :-  (WACK A)
  (TURN B |=(C/KNOT (CAT 3 '_' (WACK C))))
::
++  PICK                                                ::  LIGHT PATH DECODING
  =+  FEL=(MOST CAB (SEAR WICK URT:AB))
  |=(A/KNOT `(UNIT {P/TERM Q/PATH})`(RUSH A FEL))
::
++  WUSH
  |=  {WID/@U TAN/TANG}
  ^-  WALL
  (ZING (TURN TAN |=(A/TANK (WASH 0^WID A))))
::
++  YANK                                                ::  GET .WELL-KNOWN
  |=  [WEL=WANK PAT=PATH]
  ^-  (UNIT MIME)
  ?~  PAT  P.WEL
  =/  WAN  (~(GET BY Q.WEL) I.PAT)
  ?~  WAN  ~
  $(WEL U.WAN, PAT T.PAT)
::
++  DANK                                                ::  PUT/DEL .WELL-KNOWN
  |=  [WEL=WANK PAT=PATH MIM=(UNIT MIME)]
  ^-  WANK
  ?~  PAT  WEL(P MIM)
  =/  WAN  (~(GET BY Q.WEL) I.PAT)
  ?:  &(?=(~ WAN) ?=(~ MIM))
    WEL
  :-  P.WEL
  %+  ~(PUT BY Q.WEL)
    I.PAT
  $(WEL ?~(WAN *WANK U.WAN), PAT T.PAT)
::
++  ADD-COOKIES
  |=  {CUG/(LIST @T) HIT/HTTR}  ^-  HTTR
  ?~  CUG  HIT
  =+  CUH=(TURN `(LIST @T)`CUG |=(A/@T SET-COOKIE+A))
  HIT(Q (WELD CUH Q.HIT))
::
++  ADD-JSON                                            ::  INJECT WINDOW.URB
  |=  {URB/JSON JAZ/CORD}  ^-  CORD
  =-  (CAT 3 (CRIP -) JAZ)
  """
  VAR _URB = {(EN-JSON URB)};
  WINDOW.URB = WINDOW.URB || \{}; FOR(K IN _URB) WINDOW.URB[K] = _URB[K];

  """
::
++  ARES-TO-JSON
  |=  ERR/ARES  ^-  JSON
  =-  (PAIRS:ENJS FAIL+S+TYP MESS+(TAPE:ENJS MEZ) ~)
  ^-  {TYP/TERM MEZ/TAPE}
  ?~  ERR  [%FAIL "UNKNOWN ERROR"]
  [P.U.ERR (OF-WALL (WUSH 160 Q.U.ERR))]
::
++  RESP                                                ::  MIMED RESPONSE
  |=  {SAS/@UG MIT/MITE REZ/@}  ^-  HTTR
  ::  (WELD (TURN CUG |=(A=@T ['SET-COOKIE' A]))
  [SAS ~[CONTENT-TYPE+(EN-MITE MIT)] [~ (AS-OCTS REZ)]]
::
++  FAVI                                                ::  XX FAVICON
  0W3.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~LX-.~~HW-.L~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.RDJK~.VWUDL.-3WUF.~ZEWE.~YJ4N.F~Y~F.P~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~-~LX.~~LBP.M~~NR.ZV~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.RZVN~.GQCF~.QT7H~.YA2WH.~0000.~M000.FY000.
  3~0W8.2~QX8.IF~EP.IX~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~FP.Y~QB9.IVY00.03~K5.1G~Z~.VT~~~.~~~~~.~~~~~.~~~~~.FWUD~.
  CPCP~.P8OCL.Y0003.~0000.~M000.FY000.3~000.0~M00.0FY00.03~00.00~NK.L5V-W.KHH~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~-QJ.BJ~00.
  00~M0.00FY0.003~6.HAP~S.FGQL-.6XER~.OC9Y~.NUU7L.Y0003.~0000.~M000.FY000.3~000.
  0~M00.0FY00.03~00.00~M0.00FY0.003~0.000~N.SN5~~.FPY~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~Z7.HQVYR.6NL~0.000~M.000FY.0003~.0000~.
  M000F.Y0003.~0000.~M000.FY000.3~000.0~M00.0FYJB.IT~ST.DP~VU.NB~ZZ.VNT~A.IAF~M.
  000FY.0003~.0000~.VGQCL.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~Y.D9OVY.B9IN~.0000~.M000F.Y0003.~0000.~M000.FY000.3~000.0~M41.
  0VZ1G.K7~HA.OI~~N.RZV~~.~~~~~.~~~~~.~~~~~.HW-L~.JAVE~.M000F.YNCJ7.~YLBO.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.-BYUL.
  ZZOSF.~3MYF.~M000.FY000.3~000.0~MQD.3VZIK.BB~KB.YU~~P.Y~F~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~IXEP.~EZEW.~WGGG.L~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~PST.D~DFW.U~UU7.X~-TD.
  PT~RZ.VN~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~IXE.
  P~-LH.W~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~0000.00000.00000.00000.00000.50000.00002.000G0.00400.000W0.000A0.00000.
  00000.00000.00000.00000.00000.00000.00000.00000.00000.00000.00000.00000.00000.
  00000.00000.00000.00000.00000.00000.00000.00000.00000.00000.00000.00000.00000.
  00000.00000.00000.00000.00000.00000.00000.00000.00000.00000.00000.00000.00000.
  00000.00000.00000.00000.00000.00000.00000.00000.00000.00000.00000.00000.00000.
  00000.00000.00000.00000.00000.00000.00000.00000.00000.00000.00000.00000.00000.
  00000.00000.3~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.RDJK~.~BOYL.~~~~~.~~~~~.~~TZ~.V-ZLR.T~R6N.I~RTN.L~-RC.
  VL~-~.LX~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.ZLRS~.OMIBF.Z2GAB.~JHQS.~V-VD.~Y-FZ.
  X~000.0~M00.0FY00.03~00.00~S1.WOF~U.-FZ~~.~~~~~.~~~~~.~~~~~.~~~~~.~DV-V.ZDPSV.
  ~0000.~M000.FY000.3~000.0~QP6.HL-FG.QD~LX.-~~QT.7H~YW.823~Y.LBO~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~LX-.~WCFG.VZTNL.T~RMR.J~YF3.M~~~~.~~~~~.~~~~~.~~~~J.XUT~N.
  YV7~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.~~~~~.
  ~~~~~.~~~~~.~0000.00000.00000.00000.00000.1G000.00002.000G0.00200.000G0.000A0.
  001KU.001GE.02000.G0082.00000.C0005.A00W0.04001.0G008.00G00
++  JS                                                  ::  STATIC JAVASCRIPT
  |%
  ++  POLL                                              :: DEPENDENCY LONG-POLL
    '''
    URB.TRIES = 0
    URB.CALL = FUNCTION() {
      URB.WREQ = NEW XMLHTTPREQUEST()
      URB.WREQ.OPEN('GET', "/~/ON.JSON?"+URB.DEPS.JOIN('&'), TRUE)
      URB.WREQ.ADDEVENTLISTENER('LOAD', FUNCTION() {
        // IF(~~(THIS.STATUS / 100) == 4)
        //   RETURN DOCUMENT.WRITE(THIS.RESPONSETEXT)
        IF(THIS.STATUS === 200) {
          VAR DEP = JSON.PARSE(THIS.RESPONSETEXT)
          URB.ONUPDATE(DEP)
          URB.DEWASP(DEP)
        }
        URB.KEEP()
      })
      URB.WREQ.ADDEVENTLISTENER('ERROR', URB.KEEP)
      URB.WREQ.ADDEVENTLISTENER('ABORT', URB.KEEP)
      URB.WREQ.SEND()
    }
    URB.KEEP = FUNCTION() {
      SETTIMEOUT(URB.CALL,1000*URB.TRIES)
      URB.TRIES++
    }
    URB.ONUPDATE = FUNCTION(){DOCUMENT.LOCATION.RELOAD()}
    URB.CALL()
    URB.WASP = FUNCTION(DEH){
      IF (!DEH) RETURN;
      IF (URB.DEPS.INDEXOF(DEH) !== -1) RETURN;
      URB.DEPS.PUSH(DEH)
      URB.WREQ.ABORT() // TRIGGER KEEP
    }
    URB.DEWASP = FUNCTION(DEH){
      VAR INDEX = URB.DEPS.INDEXOF(DEH)
      IF (-1 !== INDEX) {
        URB.DEPS.SPLICE(INDEX,1)
        URB.WREQ.ABORT() // TRIGGER KEEP
      }
    }

    '''
  ::
  ++  AUTH-REDIR
    'DOCUMENT.LOCATION.PATHNAME = "/~~"+DOCUMENT.LOCATION.PATHNAME'
  ::
  ++  AUTH
    '''
    VAR REQ = FUNCTION(URL,DAT,CB){
      VAR XHR = NEW XMLHTTPREQUEST()
      XHR.OPEN('POST', URL, TRUE)
      DAT.ORYX = URB.ORYX
      XHR.SEND(JSON.STRINGIFY(DAT))
      XHR.ADDEVENTLISTENER('LOAD', FUNCTION(EV){
        IF(THIS.STATUS !== 200)
          RETURN ERR.INNERHTML = ":( " + DATE.NOW() + "\N" + XHR.RESPONSETEXT
        ELSE IF(CB) RETURN CB(XHR.RESPONSETEXT,EV)
      })
    }

    URB.FOREIGN = /^\/~\/AM/.TEST(WINDOW.LOCATION.PATHNAME)
    URB.REDIRTO = FUNCTION(URL){
      DOCUMENT.TITLE = "REDIRECTING"
      VAR MOUNT = DOCUMENT.GETELEMENTBYID("PASS") || DOCUMENT.BODY
      MOUNT.OUTERHTML = "REDIRECTING TO <A HREF=\""+URL+"\">"+URL+"</A>"
      DOCUMENT.LOCATION = URL
    }
    URB.REDIR = FUNCTION(SHIP){
      IF(SHIP){
        VAR LOCATION = NEW URL(DOCUMENT.LOCATION)
        LOCATION.PATHNAME = LOCATION.PATHNAME.REPLACE(/^\/~~|\/~\/AS\/ANY/,'/~/AS/~'+SHIP)
        URB.REDIRTO(LOCATION)
      }
      ELSE URB.REDIRTO(
        DOCUMENT.LOCATION.HASH.MATCH(/#[^?]+/)[0].SLICE(1) +
        DOCUMENT.LOCATION.PATHNAME.REPLACE(
          /^\/~\/AM\/[^/]+/,
          '/~/AS/~' + URB.SHIP) +
        DOCUMENT.LOCATION.SEARCH
      )
    }
    IF(URB.FOREIGN && URB.AUTH.INDEXOF(URB.SHIP) !== -1){
      REQ("/~/AUTH.JSON?PUT",
          {SHIP:URB.SHIP,CODE:NULL},
          FUNCTION(){URB.REDIR()})
    }
    URB.IS_ME = FUNCTION(SHIP) {
      RETURN (URB.SHIP === SHIP)
    }
    URB.SUBMIT = FUNCTION(SHIP,PASS){
      IF(!URB.IS_ME(SHIP))
        RETURN URB.REDIR(SHIP)
      REQ(
        "/~/AUTH.JSON?PUT",
        {SHIP:SHIP, CODE:PASS},
        FUNCTION(){
          IF(URB.FOREIGN) URB.REDIR()
          ELSE DOCUMENT.LOCATION.RELOAD()
      })
    }
    URB.AWAY = FUNCTION(){REQ("/~/AUTH.JSON?DELETE", {},
      FUNCTION(){DOCUMENT.BODY.INNERHTML = "" }
    )}
    '''
  --
++  XML
  |%
  ++  EXIT
    ;HTML
      ;HEAD:TITLE:"ACCEPTED"
      ;BODY:"YOU MAY NOW CLOSE THIS WINDOW."
    ==
  ::
  ++  REDIR
    |=  URL/TAPE
    ;HTML
      ;HEAD:TITLE:"REDIRECTING..."
      ;BODY
        ;P: REDIRECTING TO ;{A/"{URL}" "{URL}"}
        ;SCRIPT: SETTIMEOUT(FUNCTION()\{DOCUMENT.LOCATION = {(EN-JSON (TAPE:ENJS URL))}}, 3000)
      ==
    ==
  ::
  ++  LOGIN-PAGE
    %+  TITL  'LOGIN - LANDSCAPE'
    ;=
    ;DIV.HEADER-CONTAINER.CONTAINER
      ;DIV.ROW
        ;DIV.FLEX-COL-X.HEADER-BREADCRUMBS;
      ==
      ;DIV.ROW.ALIGN-CENTER.HEADER-MAINROW
        ;DIV.FLEX-COL-2.JUSTIFY-END;
        ;H1.FLEX-COL-X.HEADER-TITLE: LOGIN
      ==
    ==
    ;DIV.CONTAINER
      ;DIV.ROW
        ;DIV.FLEX-COL-2;
        ;DIV.FLEX-COL-X
          ;DIV.ROW.MT-10
            ;H3.COL-MD-12: SHIP
          ==
          ;DIV.ROW
            ;INPUT#SHIP.COL-MD-10.H3.TEXT-500.COLLECTION-TITLE(PLACEHOLDER "YOUR-SHIP", CONTENTEDITABLE "");
          ==
          ;DIV.ROW.MT-5
            ;H3.COL-MD-12
              ; TYPE
              ;SPAN.TEXT-MONO.MR-1: +CODE
              ; IN YOUR TERMINAL AND PRESS ENTER
            ==
          ==
          ;DIV.ROW
            ;INPUT#PASS.COL-MD-10.H3.MONO.TEXT-500.COLLECTION-TITLE(TYPE "PASSWORD", PLACEHOLDER "PASSCODE");
          ==
          ;DIV.ROW.MT-5
            ;BUTTON#LOGIN.BTN-PRIMARY.BTN(DISABLED "TRUE"): LOGIN
          ==
          ;DIV.ROW.MT-5
            ;PRE#ERR;
          ==
        ==
      ==
    ==
        ;SCRIPT@"/~/AT/~/AUTH.JS";
        ;SCRIPT:'''
                $(FUNCTION() {
                  $SHIP = $('#SHIP')
                  $PASS = $('#PASS')
                  $LOGIN = $('#LOGIN')
                  $SHIP.ON('KEYDOWN', FUNCTION(E) {
                    IF(E.KEYCODE === 13 || E.KEYCODE === 9) {
                      IF(!URB.IS_ME($SHIP.VAL().TOLOWERCASE()))
                        URB.REDIR($SHIP.VAL().TOLOWERCASE())
                      $PASS.SHOW()
                      $PASS.FOCUS()
                      E.PREVENTDEFAULT()
                    }
                  })
                  $PASS.ON('KEYPRESS', FUNCTION(E) {
                    IF($PASS.VAL().LENGTH > -1) {
                      $LOGIN.PROP('DISABLED', FALSE)
                    } ELSE {
                      $LOGIN.PROP('DISABLED', TRUE)
                    }
                  })
                  $PASS.ON('PASTE', FUNCTION(E) {
                    IF($PASS.VAL().LENGTH > -1) {
                      $LOGIN.PROP('DISABLED', FALSE)
                    } ELSE {
                      $LOGIN.PROP('DISABLED', TRUE)
                    }
                  })
                  $LOGIN.ON('CLICK', FUNCTION(E) {
                    URB.SUBMIT($SHIP.VAL().TOLOWERCASE(),$PASS.VAL())
                  })
                  IF(WINDOW.SHIP) {
                    $SHIP.VAL(URB.SHIP)
                    $PASS.FOCUS()
                  } ELSE {
                    $PASS.HIDE()
                  }
                })
                '''
    ==
  ::
  ++  LOGOUT-PAGE
    %+  TITL  'LOG OUT'
    ;=  ;DIV.CONTAINER.TOP
          ;DIV.ROW
            ;DIV.COL-MD-10
              ;H1.SIGN: BYE!
              ;BUTTON#ACT(ONCLICK "URB.AWAY()"): LOG OUT
              ;PRE:CODE#ERR;
              ;SCRIPT@"/~/AT/~/AUTH.JS";
            ==
          ==
        ==
      ==
  ::
  ++  POKE-TEST
    %+  TITL  'POKE'
    ;=  ;BUTTON(ONCLICK "URB.TESTPOKE('/~/TO/HOOD/HELM-HI.JSON')"): HI ANONYMOUS
        ;BUTTON(ONCLICK "URB.TESTPOKE('/~/AS/OWN/~/TO/HOOD/HELM-HI.JSON')"): HI
        ;PRE:CODE#ERR;
        ;SCRIPT@"/~/AT/~/AUTH.JS";
        ;SCRIPT:'''
                SHOW = FUNCTION(T){ERR.INNERTEXT = ":) " + DATE.NOW() + "\N" + T}
                URB.TESTPOKE = FUNCTION(URL){
                  REQ(URL,{WIRE:"/",XYRO:'TEST'}, SHOW)
                }
                '''
    ==
  ++  TITL
    |=  {A/CORD B/MARL}
    ;HTML
      ;HEAD
        ;META(CHARSET "UTF-8");
        ;META(NAME "VIEWPORT", CONTENT "WIDTH=DEVICE-WIDTH, ".
        "HEIGHT=DEVICE-HEIGHT, INITIAL-SCALE=1.0, USER-SCALABLE=0, ".
        "MINIMUM-SCALE=1.0, MAXIMUM-SCALE=1.0");
        ;TITLE:"{(TRIP A)}"
        ;SCRIPT(TYPE "TEXT/JAVASCRIPT", SRC "//CDNJS.CLOUDFLARE.COM/AJAX/".
          "LIBS/JQUERY/2.1.1/JQUERY.MIN.JS");
        ;LINK(REL "STYLESHEET", HREF "/===/WEB/LANDSCAPE/CSS/INDEX.CSS");
      ==
      ;BODY:"*{B}"
    ==
  --
--
|%                                                      ::  FUNCTIONS
++  YE                                                  ::  PER EVENT
  =|  $:  $:  HEN/DUCT                                  ::  EVENT FLOOR
              $:  NOW/@DA                               ::  EVENT DATE
                  ENY/@                                 ::  UNIQUE ENTROPY
                  OUR/SHIP                              ::  CURRENT SHIP
                  SKY/$-({* *} (UNIT))                  ::  SYSTEM NAMESPACE
              ==                                        ::
              MOW/(LIST MOVE)                           ::  PENDING ACTIONS
          ==                                            ::
          BOLO                                          ::  ALL VANE STATE
      ==                                                ::
  =*  BOL  ->
  ~%  %EYRE-Y  ..IS  ~
  |%
  ++  ABET                                              ::  RESOLVE MOVES
    ^-  {(LIST MOVE) BOLO}
    [(FLOP MOW) BOL]
  ::
  ++  ADIT  .(NEY (MIX ENY NEY))                        ::  FLIP ENTROPY
  ::
  ++  ANON  `@P`(ADD OUR ^~((BEX 64)))                  ::  PSEUDO-SUB
  ++  APEX                                              ::  ACCEPT REQUEST
    |=  KYZ/TASK:ABLE
    ^+  +>
    =.  P.TOP  OUR              ::  XX NECESSARY?
    ?-    -.KYZ
        ::  NEW UNIX PROCESS - LEARN OF FIRST BOOT OR A RESTART.
        ::
        $BORN
      ::  SAVE OUTGOING DUCT
      ::
      =.  GED  HEN
      ::  GIVE %FORM TO START SERVERS
      ::
      =.  MOW  :_(MOW [HEN [%GIVE %FORM FIG]])
      ::  KILL ACTIVE INCOMING REQUESTS
      ::
      =.  +>.$
        =/  FOK=(LIST DUCT)  ~(TAP IN ~(KEY BY LYV))
        |-  ^+   +>.^$
        ?~  FOK  +>.^$
        %=  $
          FOK    T.FOK
          +>.^$  ^$(HEN I.FOK, KYZ [%THUD ~])
        ==
      ::  KILL ACTIVE OUTGOING REQUESTS
      ::
      =.  +>.$
        =/  FOK=(LIST DUCT)  (TURN ~(VAL BY Q.ASK) HEAD)
        |-  ^+   +>.^$
        ?~  FOK  +>.^$
        %=  $
          FOK    T.FOK
          +>.^$  ^$(HEN I.FOK, KYZ [%THEM ~])
        ==
      ::  IF GALAXY, REQUEST %AMES DOMAIN FROM %JAEL
      ::
      ::    %JAEL RESPONSE HANDLED IN $TURF BRANCH OF +AXON.
      ::
      =?  MOW  ?=(%CZAR (CLAN:TITLE OUR))  :_(MOW [HEN %PASS / %J %TURF ~])
      ::  LEARN EXTERNALLY KNOWN DOMAIN NAMES
      ::
      ::    IF ANY ARE NEW, REQUEST CERTIFICATE. XX CURRENTLY UNUSED. REMOVE?
      ::    XX %BORN CARD ALSO INCLUDES LOCALLY-KNOWN IPS. USE FOR DNS?
      ::
      ::
      =/  MOD/(SET TURF)
        %-  ~(GAS IN *(SET TURF))
        %+  TURN
          (SKIM P.KYZ |=(A=HOST ?=(%& -.A)))
        |=(A=HOST ?>(?=(%& -.A) P.A))
      =/  DIF/(SET (LIST @T))  (~(DIF IN MOD) DOM)
      =?  DOM  ?=(^ DIF)  (~(UNI IN DOM) MOD)
      =?  MOW  ?=(^ DIF)
        =/  CMD  [%ACME %POKE `CAGE`[%ACME-ORDER !>(DOM)]]
        :_(MOW [HEN %PASS /ACME/ORDER %G %DEAL [OUR OUR] CMD])
      +>.$
    ::
        $LIVE
      +>.$(CLR.POR P.KYZ, SEK.POR Q.KYZ)
    ::
        $RULE
      ?-  -.P.KYZ
          $CERT
        ?:  =(SECURE.FIG P.P.KYZ)  +>.$
        =.  SECURE.FIG  P.P.KYZ
        +>.$(MOW :_(MOW [GED [%GIVE %FORM FIG]]))
      ::
          $TURF
        =/  MOD/(SET TURF)
          ?:  ?=(%PUT P.P.KYZ)
            (~(PUT IN DOM) Q.P.KYZ)
          (~(DEL IN DOM) Q.P.KYZ)
        ?:  =(DOM MOD)  +>.$
        =/  CMD  [%ACME %POKE `CAGE`[%ACME-ORDER !>(MOD)]]
        %=  +>.$
          DOM  MOD
          MOW  :_(MOW [HEN %PASS /ACME/ORDER %G %DEAL [OUR OUR] CMD])
        ==
      ==
    ::
        $SERV
      =<  ~&([%SERVING (EN-BEAM TOP)] .)
      ?^(P.KYZ +>.$(TOP P.KYZ) +>.$(Q.TOP P.KYZ))
    ::
        $CRUD
      +>.$(MOW [[HEN %SLIP %D %FLOG KYZ] MOW])
    ::
        $INIT                                           ::  REGISTER OWNERSHIP
      %=  +>.$
        FIG  [~ ?=(%KING (CLAN:TITLE OUR)) & &]
        TOP  [[OUR %HOME UD+0] /WEB]
      ==
    ::
        $SUNK  +>
    ::
        $VEGA  +>
    ::
        ?($CHIS $THIS)                                  ::  INBOUND REQUEST
      %-  EMULE  |.  ^+  ..APEX
      =*  SEC  P.KYZ    ::  ?                           ::  HTTPS BIT
      =*  HEQ  R.KYZ    ::  HTTQ                        ::  REQUEST CONTENT
      =/  RYP=QURI
        =+  (RUSH Q.HEQ ZEST:DE-PURL)
        ?^(- U.- ~|(EYRE-PARSE-URL-FAILED+Q.HEQ !!))
      =+  MAF=(EAT-HEADERS R.HEQ)
      =+  ^=  PUL  ^-  PURL
          ?-  -.RYP
            %&  ?>(=(SEC P.P.P.RYP) P.RYP)
            %|  =+  HOT=(~(GET JA MAF) %HOST)
                ?>  ?=({@ ~} HOT)
                [[SEC (RASH I.HOT THOR:DE-PURL)] P.RYP Q.RYP]
          ==
      =.  P.P.PUL  |(P.P.PUL ?=(HOKE R.P.PUL))
      ?:  ?=($CHIS -.KYZ)                               :: IPC ESCAPE HATCH
        ~(LENS HANDLE PUL [Q.+.KYZ |] [P.HEQ MAF S.HEQ])
      =+  HER=(HOST-TO-SHIP R.P.PUL)
      ?:  |(?=(~ HER) =(OUR U.HER))
        ~(APEX HANDLE PUL [Q.+.KYZ |] [P.HEQ MAF S.HEQ])
      =+  HAN=(SHAM HEN)
      =.  POX  (~(PUT BY POX) HAN HEN)
      (AMES-GRAM U.HER %GET HAN +.KYZ)
    ::
        $THEM                                           ::  OUTBOUND REQUEST
      ?~  P.KYZ
        ?~  SUD=(~(GET BY KES) HEN)
          ::  DELETE AN ELEMENT FROM Q.ASK BY TRAVERSING TO PREVENT LEAKAGE
          ::
          =.  Q.ASK
            =/  QAS  ~(TAP BY Q.ASK)
            |-  ^+  Q.ASK
            ?~  QAS
              Q.ASK
            ?:  =(HEN P.Q.I.QAS)
              (~(DEL BY Q.ASK) P.I.QAS)
            $(QAS T.QAS)
          ::
          +>.$
        ::
        =.  +>.$
          %_  +>.$
            MOW    :_(MOW [GED [%GIVE %THUS U.SUD ~]])
            Q.ASK  (~(DEL BY Q.ASK) U.SUD)
            KES    (~(DEL BY KES) HEN)
          ==
        ::
        =/  DRIVER=(UNIT [KEY=[USER (LIST @T)] VAL=DRIV])
          =/  DRIVERS  ~(TAP BY SEC)
          |-  ^-  (UNIT [KEY=[USER (LIST @T)] VAL=DRIV])
          ?~  DRIVERS  ~
          ::
          ?~  Q=REQ.Q.Q.I.DRIVERS
            $(DRIVERS T.DRIVERS)
          ::
          ?~  TIP=~(TOP TO Q)
            $(DRIVERS T.DRIVERS)
          ::
          ?:  =(HEN P.U.TIP)
            `I.DRIVERS
          $(DRIVERS T.DRIVERS)
        ::
        ?^  DRIVER
          ~(CANCEL-REQUEST VI U.DRIVER)
        (GIVE-SIGH(HEN (TAIL HEN)) %| [LEAF+"CANCELED ON %BORN"]~)
      ::  ~&  EYRE-THEM+(EN-PURL P.U.P.KYZ)
      %=  +>.$
        MOW    :_(MOW [GED [%GIVE %THUS P.ASK P.KYZ]])
        P.ASK  +(P.ASK)
        Q.ASK  (~(PUT BY Q.ASK) P.ASK HEN U.P.KYZ)
        KES    (~(PUT BY KES) HEN P.ASK)
      ==
    ::
        $HISS                                           ::  OUTBOUND CAGE
      ::?~  P.KYZ                                       ::  XX CANCEL
      ::  =+  SUD=(NEED (~(GET BY KES) HEN))
      ::  %=  +>.$
      ::    MOW    :_(MOW [GED [%GIVE %THUS SUD ~]])
      ::    Q.ASK  (~(DEL BY Q.ASK) SUD)
      ::    KES    (~(DEL BY KES) HEN)
      ::  ==
      ::  ~&  EYRE-THEM+(EN-PURL P.U.P.KYZ)
      =+  USR=?~(P.KYZ '~' (SCOT %TA U.P.KYZ))
      (BACK-TURBO HI+/[USR]/[Q.KYZ] %HISS R.KYZ)
    ::
        $THEY                                           ::  INBOUND RESPONSE
      =+  KAS=(NEED (~(GET BY Q.ASK) P.KYZ))
      ::  ~&  >  EYRE-THEY+[P.Q.KYZ (EN-PURL P.Q.KAS)]
      %=  +>.$
        MOW    :_(MOW [P.KAS [%GIVE %THOU Q.KYZ]])
        Q.ASK  (~(DEL BY Q.ASK) P.KAS)
      ==
    ::
        $THUD                                           ::  CANCEL REQUEST
      ?.  (~(HAS BY LYV) HEN)
        ~&  DEAD-REQUEST+HEN
        +>.$(DED (~(PUT IN DED) HEN))                   ::  UNCAUGHT REQUESTS
      =+  LID=(~(GOT BY LYV) HEN)
      =.  LYV  (~(DEL BY LYV) HEN)
      :: ~&  DID-THUD+[-.LID HEN]
      ?-  -.LID
          $EXEC
        (PASS-NOTE P.LID %F %KILL ~)
      ::
          $POLL
        ?.  (~(HAS BY WIX) P.LID)
         +>.$
        POLL-DEAD:(IRE-IX P.LID)
      ::
          $XENO
        =+  HAN=(SHAM HEN)
        =.  POX  (~(DEL BY POX) HAN HEN)
        (AMES-GRAM P.LID %GIB HAN)
      ::
          $WASP
        |-  ^+  +>.^$
        ?~  P.LID  +>.^$
        (DEL-DEPS:$(P.LID T.P.LID) I.P.LID %& HEN)
      ==
    ::
        $WELL
      +>.$(WEL (DANK WEL P.KYZ Q.KYZ))
    ::
        $WEST                                           ::  REMOTE REQUEST
      =.  MOW  :_(MOW [HEN %GIVE %MACK ~])
      ::  TODO: MAKE +GRAM AND %WEST PLAY NICELY TOGETHER
      ::
      ::    %WEST PASSES PATHS AROUND, WHERE ALL THE PATHS ARE ACTUALLY SINGLE
      ::    TAGS. THE OLD VERSION OF +GRAM USED [%TAG ~] AS TAG TYPES IN ITS
      ::    DEFINITION, WHICH NO LONGER WORKS.
      ::
      ::    ACTUALLY FIXING THIS IS A CROSS-AMES-EYRE SURGERY, FOR NOW HACK IT
      ::    BY MOLDING THE INCOMING THING INTO A GRAM SHAPE BEFORE WE TRY TO
      ::    SOFT IT.
      ::
      =*  HIM  P.KYZ
      ?~  -.Q.KYZ
        ~&  E+[%STRANGE-WEST-WIRE HIM]
        ~!(%STRANGE-WEST-WIRE !!)
      =+  MEZ=((SOFT GRAM) [I.-.Q.KYZ +.Q.KYZ])
      ?~  MEZ
        ~&  E+[%STRANGE-WEST HIM]
        ~|(%STRANGE-WEST !!)
      ?-  -.U.MEZ
        $AUT  ABET:(LOGON:(SES-YA P.U.MEZ) HIM)
        $HAT  (FOREIGN-HAT:(SES-YA P.U.MEZ) HIM Q.U.MEZ)
        $GIB  (PASS-NOTE AY+(DRAY P+UV+~ HIM P.U.MEZ) [%E %THUD ~])
        $GET  (PASS-NOTE AY+(DRAY P+UV+~ HIM P.U.MEZ) [%E %THIS Q.U.MEZ])
        $GOT
          ?.  (~(HAS BY POX) P.U.MEZ)
            ~&  LOST-GRAM-THOU+HIM^P.U.MEZ
            +>.$
          =:  HEN  (~(GOT BY POX) P.U.MEZ)
              POX  (~(DEL BY POX) P.U.MEZ)
            ==
          (GIVE-THOU Q.U.MEZ)
      ::
        $LON
          ::  ~&  SES-ASK+[P.U.MEZ SOP (~(RUN BY WUP) ~)]
          ?:  (SES-AUTHED P.U.MEZ)
            (AMES-GRAM HIM %AUT P.U.MEZ)
          =.  SOP  (~(PUT BY SOP) P.U.MEZ HIM |)
          (AMES-GRAM HIM %HAT P.U.MEZ OUR-HOST)
      ::
        $GET-INNER
          %+  EXEC-TURBO-LIVE  AY+(DRAY P+UV+~ HIM P.U.MEZ)
          [%BAKE Q.U.MEZ R.U.MEZ [[P Q] S]:S.U.MEZ]
      ::
        $GOT-INNER
          ?.  (~(HAS BY POX) P.U.MEZ)
            ~&  LOST-GRAM-INNER+HIM^P.U.MEZ
            +>.$
          =:  HEN  (~(GOT BY POX) P.U.MEZ)
              POX  (~(DEL BY POX) P.U.MEZ)
            ==
          ?-    -.Q.U.MEZ
              %|
            =/  DEP  0V0  ::XX REMOTE DEPENDENCY?
            (FAIL 500 DEP P.Q.U.MEZ)
          ::
              %&
            =/  RES/(CASK)  P.Q.U.MEZ
            =/  DEP  0V0  ::XX REMOTE DEPENDENCY?
            =/  BEK  -.TOP  ::XX WHERE IS WRAPPER-RENDERER BEAK STORED EXACTLY
            :: XX STORE REQUEST MARK
            =/  EXT  (END 3 (SUB (MET 3 P.RES) (MET 3 '-ELEM')) P.RES) :: %X-URB-ELEM -> %X-URB
            =+  NORM=(NORM-BEAK BEK)
            ::
            %+  EXEC-TURBO-LIVE  HA+(EN-BEAM BEK ~)
            :^  %CAST  [P Q]:NORM  EXT
            :+  %CALL
              [%CORE [P Q]:NORM /HOON/WRAP/[EXT]/REN]
            [%VALE [P Q]:NORM RES]
          ==
      ::
        $NOT  +>.$(MOW :_(MOW [GED [%GIVE %THAT HIM P.U.MEZ]]))
      ==
    ::
      $WEGH  !!                                         ::  HANDLED ELSEWHERE
    ::
      $WISE  (AMES-GRAM P.KYZ %NOT Q.KYZ)           ::  PROXY NOTIFICATION
    ==
  ::
  ::++  AXOM                                              ::  OLD RESPONSE
  ::  |=  [TEE=WHIR HON=HONK]
  ::  ^+  +>
  ::  ?+  TEE  !!
  ::    ~          ?-(-.HON %NICE (NICE-JSON), %MEAN (MEAN-JSON 500 P.HON))
  ::    [%OF @ ^]  (GET-ACK:(IRE-IX P.TEE) Q.TEE HON)
  ::  ==
  ++  AXON                                              ::  ACCEPT RESPONSE
    |=  {TEE/WHIR SIH/SIGN}
    ^+  +>
    ?:  &(?=({?($OF $OW) ^} TEE) !(~(HAS BY WIX) P.TEE))
      ~&(DEAD-IRE+[`WHIR`TEE] +>)
    ?-    &2.SIH
        $CRUD  +>.$(MOW [[HEN %SLIP %D %FLOG +.SIH] MOW])
    ::  $DUMB
    ::    =.  +>  ?+(TEE +> [%OF ^] POP-DUCT:(IRE-IX P.TEE))
    ::    (EMULE |.(~|(GALL-DUMB+TEE !!)))
    ::
        $WOOT  +>.$
    ::
        $THOU
      ?+    -.TEE  !!
        $AY  (AMES-GRAM (SLAV %P P.TEE) %GOT (SLAV %UV Q.TEE) |2.SIH)
        $HI  (CAST-THOU Q.TEE HTTR+!>(P.SIH))
        $SE  (GET-THOU:(DOM-VI Q.TEE) P.TEE P.SIH)
      ==
    ::
        $TURF
      ?.  ?=(%CZAR (CLAN:TITLE OUR))
        ~&  %STRANGE-TURF
        +>.$
      =/  MOD/(SET TURF)
        %-  ~(GAS IN DOM)
        %+  TURN  TURF.SIH
        |=(A=TURF (WELD A /(CRIP +:(SCOW %P OUR))))
      ?:  =(DOM MOD)
        +>.$
      =/  CMD  [%ACME %POKE `CAGE`[%ACME-ORDER !>(MOD)]]
      %=  +>.$
        DOM  MOD
        MOW  :_(MOW [HEN %PASS /ACME/ORDER %G %DEAL [OUR OUR] CMD])
      ==
    ::
        $UNTO                                           ::  APP RESPONSE
      ?>  ?=({$OF @ ^} TEE)
      =+  CUF=`CUFT:GALL`+>.SIH
      ?-    -.CUF
          ?($COUP $REAP)
        ::  ~?  ?=($LENS R.Q.TEE)  HEN=HEN^HCUF=-.CUF
        (GET-ACK:(IRE-IX P.TEE) Q.TEE ?~(P.CUF ~ `[-.CUF U.P.CUF]))
      ::
          $DIFF
        ?.  ?=($JSON P.P.CUF)
          :: ~>  %SLOG.`%*(. >[%BACKING P.P.CUF %Q-P-CUF]< &3.+> (SELL Q.P.CUF))
          (BACK-TURBO TEE %JSON P.CUF)
        (GET-RUSH:(IRE-IX P.TEE) Q.TEE (,JSON Q.Q.P.CUF))
      ::
          $QUIT  (GET-QUIT:(IRE-IX P.TEE) Q.TEE)
      ==
    ::
        $WAKE
      ?>  ?=({?($OF $OW) @ ~} TEE)
      ?:  ?=($OW -.TEE)
        ABUT:(IRE-IX P.TEE)
      =>  WAKE:(IRE-IX P.TEE)
      (GIVE-JSON 200 ~ (FROND:ENJS %BEAT %B &))
    ::
        $MADE
      =|  SES/(UNIT HOLE)
      |-  ^+  ..AXON
      ?+    TEE  ~&  [%TEE TEE]  !!
          {$SI $~}  (GIVE-TURBO-SIGH RESULT.SIH)
          {$SE ^}   (GET-MADE:(DOM-VI Q.TEE) P.TEE RESULT:SIH)
      ::
          {$AY ^}
        =/  RES/(EACH (CASK) TANG)
          ?:  ?=(%INCOMPLETE -.RESULT.SIH)
            [%| TANG.RESULT.SIH]
          ?:  ?=([%COMPLETE %ERROR *] RESULT.SIH)
            [%| MESSAGE.BUILD-RESULT.RESULT.SIH]
          [%& [P Q.Q]:(RESULT-TO-CAGE:FORD BUILD-RESULT.RESULT.SIH)]
        (AMES-GRAM (SLAV %P P.TEE) %GOT-INNER (SLAV %UV Q.TEE) RES)
      ::
          {$HA *}
        %-  EMULE  |.  ^+  ..APEX
        ?:  ?=([%INCOMPLETE *] RESULT.SIH)
          (FAIL-TURBO 404 TANG.RESULT.SIH)
        ?:  ?=([%COMPLETE %ERROR *] RESULT.SIH)
          (FAIL-TURBO 404 MESSAGE.BUILD-RESULT.RESULT.SIH)
        =/  CAY=CAGE  (RESULT-TO-CAGE:FORD BUILD-RESULT.RESULT.SIH)
        ?:  ?=($RED-QURI P.CAY)
          =+  URL=(APEX:EN-PURL ((HARD QURI) Q.Q.CAY))
          (GIVE-THOU 307 [LOCATION+(CRIP URL)]~ ~)
          :: (GIVE-HTML:ABET 200 ~ (REDIR:XML URL))
        ?.  ?=($MIME P.CAY)
          =+  BEK=(NORM-BEAK -:(NEED (DE-BEAM P.TEE)))
          =+  TEE-SES=?~(SES TEE [%AC U.SES TEE])
          ::  TODO: WHY CAST HERE? SHOULDN'T THE CAST WRAP THE PREVIOUS RESULT?
          ::
          (EXEC-TURBO-LIVE TEE-SES [%CAST [P Q]:BEK %MIME [%$ CAY]])
        =+  CUG=?~(SES ~ CUG:(~(GOT BY WUP) U.SES))
        =+  ((HARD {MIT/MITE REZ/OCTS}) Q.Q.CAY)
        ::  TODO: THIS USED TO USE DEP FOR ETAG CONTROL.
        ::
        ::  =+  DEP=(CRIP "W/{(EN-JSON %S (SCOT %UV P.SIH))}")
        =+  HIT=[200 ~[CONTENT-TYPE+(EN-MITE MIT)] ~ REZ]  :: ETAG+DEP
        (GIVE-THOU (ADD-COOKIES CUG HIT))
      ::
          {$HI ^}
        ?.  ?=([%COMPLETE %SUCCESS *] RESULT.SIH)
          (GIVE-TURBO-SIGH RESULT.SIH)
        ::
        =/  CAY/CAGE  (RESULT-TO-CAGE:FORD BUILD-RESULT.RESULT.SIH)
        ?>  ?=($HISS P.CAY)
        ?:  =('~' P.TEE)
          (EYRE-THEM TEE Q.CAY)
        =+  USR=(SLAV %TA P.TEE)
        =+  ((HARD {PUL/PURL ^}) Q.Q.CAY)
        ?.  ?=(%& -.R.P.PUL)
          ~&  [%AUTH-LOST USR (HEAD:EN-PURL P.PUL)]
          (EYRE-THEM TEE Q.CAY)
        (GET-REQ:(DOM-VI USR (SCAG 2 P.R.P.PUL)) Q.TEE Q.CAY)
      ::
          {$OF @ ^}
        ?:  ?=([%INCOMPLETE *] RESULT.SIH)
          ((SLOG TANG.RESULT.SIH) +>.^$)
        ?:  ?=([%COMPLETE %ERROR *] RESULT.SIH)
          ((SLOG MESSAGE.BUILD-RESULT.RESULT.SIH) +>.^$)
        =/  CAY=CAGE  (RESULT-TO-CAGE:FORD BUILD-RESULT.RESULT.SIH)
        %+  GET-RUSH:(IRE-IX P.TEE)  Q.TEE
        ?>  ?=($JSON P.CAY)                    ::  XX OTHERS
        (,JSON Q.Q.CAY)
      ==
    ==
  ::
  ++  NORM-BEAK  |=(BEK/BEAK ?+(R.BEK BEK {$UD $0} BEK(R DA+NOW)))
  ++  EMULE
    |=  A/_|?(..EMULE)  ^+  ..EMULE
    ?:  [UNSAFE=|]
      (A)
    =+  MUL=(MULE A)
    ?~  -.MUL  P.MUL
    (FAIL 500 0V0 >%EXIT< P.MUL)
  ::
  ++  IRE-IX  |=(IRE/IXOR ~(. IX IRE (~(GOT BY WIX) IRE)))
  ++  DOM-VI
    |=  {USR/KNOT DOM/PATH}  ^+  VI    :: XX DEFAULT TO INITIALIZED USER?
    ~(. VI [USR DOM] (FALL (~(GET BY SEC) USR DOM) *DRIV))
  ::
  ++  SES-AUTHED
    |=  SES/HOLE
    =+  SAP=(~(GET BY SOP) SES)
    ?:  ?=({~ @ %&} SAP)  &
    =+  CYZ=(~(GET BY WUP) SES)
    ?~  CYZ  |
    (~(HAS IN AUT.U.CYZ) OUR)
  ::
  ++  SES-YA  |=(SES/HOLE ~(. YA SES (~(GOT BY WUP) SES)))
  ++  OUR-HOST
    ^-  HART
    ::  XX GET ACTUAL -F FLAG VALUE
    ::  XX SCRY INTO %JAEL?
    ::
    ?:  [FAKE=|]  [| [~ 8.443] &+/LOCALHOST]
    `HART`[& ~ %& /ORG/URBIT/(RSH 3 1 (SCOT %P OUR))]
  ::
  ++  EYRE-THEM
    |=  {TEA/WHIR VAX/VASE}
    (PASS-NOTE TEA [%E %META :(SLOP !>(%THEM) !>(~) VAX)])
  ::
  ++  AMES-GRAM
    |=  [HIM=SHIP GAM=GRAM]
    ::  TODO: TO MAKE THIS WORK
    ::
    ~!  -.GAM
    (PASS-NOTE ~ %A %WANT HIM [%E -.GAM ~] +.GAM)
  ::
  ++  BACK-TURBO
    |=  [TEA=WHIR MAR=MARK CAY=CAGE]
    =/  DISC  [P Q]:(NORM-BEAK -.TOP)
    %^  EXECUTE-TURBO  TEA  LIVE=%.N
    ^-  SCHEMATIC:FORD
    [%CAST DISC MAR [%$ CAY]]
  ::
  ++  CAST-THOU  :: TURBO
    |=  [MAR=MARK CAY=CAGE]
    ?:  ?=($HTTR MAR)
      (GIVE-SIGH %& CAY)
    %^  EXECUTE-TURBO  SI+~  LIVE=%.N
    =/  =BEAK  (NORM-BEAK -.TOP)
    [%ALTS [%CAST [P Q]:BEAK MAR $+CAY] [%CAST [P Q]:BEAK %RECOVERABLE-ERROR $+CAY] ~]
  ::
  ++  DEL-DEPS
    |=  {A/@UVH B/(EACH DUCT IXOR)}  ^+  +>.$
    ?:  =(`@`0 A)  +>.$
    =.  LIZ  (~(DEL JU LIZ) A B)
    :: ~&  DEL-DEPS+[A (~(GET JU LIZ) A)]
    ?:  (~(HAS BY LIZ) A)  +>.$
    =-  -(HEN HEN.+)
    ::  TODO: %WASP IS NO LONGER SUPPORTED.
    ::
    ~&  %DEPRECATED-DEL-DEPS
    +>.$
  ::
  ++  NEW-DEPS
    |=  {A/@UVH B/(EACH DUCT IXOR)}  ^+  +>.$
    :: ~&  NEW-DEPS+[A B]
    ?:  =(`@`~ A)  +>.$
    =+  HAD=(~(HAS BY LIZ) A)
    =.  LIZ  (~(PUT JU LIZ) A B)
    ?:  HAD  +>.$
    =-  -(HEN HEN.+)
    ::  TODO: %WASP IS NO LONGER SUPPORTED.
    ::
    ~&  %DEPRECATED-NEW-DEPS
    +>.$
  ::
  ++  EXEC-TURBO-LIVE
    |=  [TEA=WHIR REQ=SCHEMATIC:FORD]
    =.  LYV  (~(PUT BY LYV) HEN [%EXEC TEA])
    (EXECUTE-TURBO TEA LIVE=%.N REQ)
  ::
  ++  EXECUTE-TURBO
    ~/  %EXECUTE-TURBO
    |=  [TEA=WHIR LIVE=? REQUEST=SCHEMATIC:FORD]
    %+  PASS-NOTE  TEA
    :*  %F  %BUILD  LIVE
        [%DUDE [%LEAF "EYRE: EXECUTE {(SPUD TEA)}"] REQUEST]
    ==
  ::
  ++  ADD-LINKS                                           :: X-URBIT:// URLS
    ~/  %ADD-LINKS
    |=  A/WALL  ^-  MARL
    ?.  [X-URBIT-LINKS=&]  [;/((OF-WALL A))]~             :: DEFAULT DISABLE
    |-  ^-  MARL
    ?~  A  ~
    =^  PAX  I.A  ::  PARSE PATH IF ANY
      ^-  {(UNIT PATH) TAPE}
      =/  VEX  (FEL:STAB [1 1] I.A)
      ?~  Q.VEX  [~ I.A]
      [`P Q.Q]:U.Q.VEX
    ?~  PAX  [;/("{I.A}\0A") $(A T.A)]
    :-  ;A/"X-URBIT:{(SPUD U.PAX)}":"{(SPUD U.PAX)}"
    [;/("{I.A}\0A") $(A T.A)]
  ::
  ++  RENDER-TANG                                         ::  TANKS TO MANX
    ~/  %RENDER-TANG
    |=  {DEP/@UVH TAN/TANG}
    ;HTML
      ;HEAD
        ;LINK(REL "STYLESHEET", HREF "/LIB/BASE.CSS");
        ;TITLE: SERVER ERROR
      ==
      ;BODY:DIV#C.ERR:PRE:CODE:"*{(ADD-LINKS (WUSH 80 TAN))}"
      ;SCRIPT@"/~/ON/{<DEP>}.JS";
    ==
  ::
  ++  RENDER-TURBO-TANG
    ~/  %RENDER-TURBO-TANG
    |=  TAN/TANG
    ;HTML
      ;HEAD
        ;LINK(REL "STYLESHEET", HREF "/LIB/BASE.CSS");
        ;TITLE: SERVER ERROR
      ==
      ;BODY:DIV#C.ERR:PRE:CODE:"*{(ADD-LINKS (WUSH 80 TAN))}"
    ==
  ::
  ++  FAIL
    |=  {SAS/@UD DEP/@UVH MEZ/TANG}
    ^+  +>
    :: (BACK HA+~ DEP %TANG !>(MEZ))  ::TANG->URB CHAIN MAY BE SOURCE OF FAILURE
    (GIVE-HTML SAS ~ (RENDER-TANG DEP MEZ))
  ::
  ++  FAIL-TURBO                                        ::  FAILING FASTER
    |=  [SAS=@UD MEZ=TANG]
    ^+  +>
    :: (BACK HA+~ DEP %TANG !>(MEZ))  ::TANG->URB CHAIN MAY BE SOURCE OF FAILURE
    (GIVE-HTML SAS ~ (RENDER-TURBO-TANG MEZ))
  ::
  ++  GIVE-HTML
    |=  {SAS/@UD CUG/(LIST @T) MAX/MANX}
    %-  GIVE-THOU
    %+  ADD-COOKIES  CUG
    (RESP SAS TEXT+/HTML (CRIP (EN-XML MAX)))
  ::
  ++  GIVE-JSON
    |=  {SAS/@UG CUG/(LIST @T) JON/JSON}
    %-  GIVE-THOU
    %+  ADD-COOKIES  CUG
    (RESP SAS APPLICATION+/JSON (CRIP (EN-JSON JON)))
  ::
  ++  GIVE-THOU                                       ::  DONE REQUEST
    |=  HIT/HTTR
    ?:  (~(HAS IN DED) HEN)                           ::  REQUEST CLOSED
      +>(DED (~(DEL IN DED) HEN))
    =.  LYV  (~(DEL BY LYV) HEN)
    +>(MOW :_(MOW [HEN %GIVE %THOU HIT]))
  ::
  ++  GIVE-SIGH                                       ::  USERSPACE DONE
    |=  RES/(EACH CAGE TANG)
    =-  +>.$(MOW :_(MOW [HEN %GIVE %SIGH `CAGE`-]))
    ?.  ?=(%| -.RES)  P.RES
    [%TANG !>(P.RES)]
  ::
  ++  GIVE-TURBO-SIGH
    |=  RESULT=MADE-RESULT:FORD
    =-  +>.$(MOW :_(MOW [HEN %GIVE %SIGH `CAGE`-]))
    ?:  ?=(%INCOMPLETE -.RESULT)
      [%TANG !>(TANG.RESULT)]
    (RESULT-TO-CAGE:FORD BUILD-RESULT.RESULT)
  ::
  ++  MEAN-JSON  |=({SAS/@UG ERR/ARES} (GIVE-JSON SAS ~ (ARES-TO-JSON ERR)))
  ++  NICE-JSON  |=(* (GIVE-JSON 200 ~ (FROND:ENJS %OK %B &)))
  ::
  ++  PASS-NOTE  |=(NOE/{WHIR NOTE} +>(MOW :_(MOW [HEN %PASS NOE])))
  ++  HOST-TO-SHIP                                              ::  HOST TO SHIP
    |=  HOT/HOST
    ^-  (UNIT SHIP)
    :: =+  GOW=(~(GET BY DOP) HOT)    ::  XX TRUST
    :: ?^  GOW  GOW
    ?.  ?=(%& -.HOT)  ~
    =+  DOM=(FLOP P.HOT)                                ::  DOMAIN NAME
    ?~  DOM  ~
    (RUSH I.DOM FED:AG)
  ::
  ++  LOAD-SECRET
    ^-  @TA
    =+  PAX=/(SCOT %P OUR)/CODE/(SCOT %DA NOW)/(SCOT %P OUR)
    %^  RSH  3  1
    (SCOT %P (@ (NEED (SKY [151 %NOUN] %J PAX))))
  ::
  ::
  ++  HANDLE
    ~%  %EYRE-H  ..IS  ~
    |_  $:  {HAT/HART POK/PORK QUY/QUAY}                ::  PURL PARSED URL
            {CIP/CLIP AUT/?}                            ::  CLIENT IP NONYMOUS?
            {MEF/METH MAF/MATH BOD/(UNIT OCTS)}         ::  METHOD+HEADERS+BODY
        ==
    ++  ABET  ..HANDLE
    ++  DONE  .
    ++  TEBA  |*(A/$-(* _..HANDLE) |*(B/* %_(DONE ..HANDLE (A B))))
    ++  DEL-DEPS  (TEBA ^DEL-DEPS)
    ++  NEW-DEPS  (TEBA ^NEW-DEPS)
    ++  AMES-GRAM  (TEBA ^AMES-GRAM)
    ++  EXEC-TURBO-LIVE  (TEBA ^EXEC-TURBO-LIVE)
    ++  GIVE-HTML  (TEBA ^GIVE-HTML)
    ++  GIVE-THOU  (TEBA ^GIVE-THOU)
    ++  GIVE-JSON  (TEBA ^GIVE-JSON)
    ++  NICE-JSON  (TEBA ^NICE-JSON)
    ++  PASS-NOTE  (TEBA ^PASS-NOTE)
    ::
    ++  FCGI-CRED
      ^-  CRED
      ?:  AUT  FCGI-CRED:FOR-CLIENT
      %*(FCGI-CRED FOR-CLIENT HIM ANON)
    ::
    ++  APEX
      =<  ABET
      ^+  DONE
      =+  PEZ=PROCESS
      ?:  ?=(%| -.PEZ)  P.PEZ
      (RESOLVE ~ P.PEZ)
    ::
    ++  LENS
      =<  ABET
      ::  (PROCESS-PARSED [%MESS [OUR %DOJO] %LENS-COMMAND /LENS (NEED GRAB-JSON)])
      =^  ORX  ..YA  NEW-VIEW:(LOGON:FOR-CLIENT OUR)
      =+  VEW=(IRE-IX (ORYX-TO-IXOR ORX))
      ((TEBA NEW-LENS.VEW) GRAB-JSON)
    ::
    ++  RESOLVE
      |=  {CUG/(LIST @T) PEZ/PEST}  ^+  DONE
      ?~  PEZ  DONE
      ?-  -.PEZ
          ~     (GIVE-THOU (ADD-COOKIES CUG P.PEZ))
          $JS    $(PEZ [%$ (RESP 200 TEXT+/JAVASCRIPT P.PEZ)])
          $JSON  (GIVE-JSON 200 CUG P.PEZ)
          $HTML  (GIVE-HTML 200 CUG P.PEZ)
          $HTME  (GIVE-HTML 401 CUG P.PEZ)
          $BAKE
        %+  EXEC-TURBO-LIVE  P.PEZ
        ^-  SCHEMATIC:FORD
        :-  %ALTS  :~
          ^-  SCHEMATIC:FORD
          [%BAKE Q.PEZ R.PEZ [[P Q] S]:S.PEZ]
        ::
          ^-  SCHEMATIC:FORD
          [%BAKE %RED-QURI R.PEZ [[P Q] S]:S.PEZ]
        ==
      ::
          $RED
        =+  URL=(EN-PURL HAT POK(P [~ %HTML]) QUY)
        ?+    P.POK  ~|(BAD-REDIRECT+[P.POK URL] !!)
            ::  IGNORE CSS
            ::
            {~ $CSS}  !!
        ::
            {~ $JS}
          $(PEZ [%JS AUTH-REDIR:JS])
        ::
            {~ $JSON}
          =/  RED
            (PAIRS:ENJS OK+B+| RED+(TAPE:ENJS URL) ~)
          $(PEZ [%JSON RED])
        ==
      ==
    ::
    ::
    ++  IS-ANON  =([~ ''] (~(GET BY (MOLT QUY)) 'ANON'))
    ++  CHECK-ORYX                    ::  | IF JSON WITH BAD ORYX
      ^-  ?
      ?.  &(?=({~ $JSON} P.POK) ?=($POST MEF) ?=(^ BOD) !IS-ANON)  &
      =+  OXE=GRAB-ORYX
      ?~  OXE  |
      ?:  (~(HAS IN VEW.CYZ:FOR-CLIENT) U.OXE)
        &
      ~&(BAD-ORYX+[U.OXE VEW.CYZ:FOR-CLIENT] &)         ::  XX SECURITY
    ::
    ++  GRAB-JSON
      ^-  JSON
      ?.  ?=(?($POST $PUT $DELT) MEF)
        ~|(BAD-METHOD+MEF !!)
      ?~  BOD
        ~|(%NO-BODY !!)
      (NEED (DE-JSON Q.U.BOD))
    ::
    ++  GRAB-JSON-SOFT
      ^-  (UNIT JSON)
      ?.  ?=(?($POST $PUT $DELT) MEF)
        ~
      ?~(BOD ~ (DE-JSON Q.U.BOD))
    ::
    ++  GRAB-ORYX
      ^-  (UNIT ORYX)
      =+  OXE=(BIFF GRAB-JSON-SOFT =>(DEJS-SOFT (OT ORYX+SO ~)))
      ?^  OXE  OXE
      (~(GET BY (MOLT QUY)) %ORYX)
    ::
    ::
    ++  PARSE
      ^-  (EACH PERK HTTR)
      |^  =+  HIT=AS-MAGIC-FILENAME
          ?^  HIT  [%| U.HIT]
          =+  HEM=AS-AUX-REQUEST
          ?^  HEM
            ?.  CHECK-ORYX
              ~|(%BAD-ORYX ~|([GRAB-ORYX VEW.CYZ:FOR-CLIENT] !!))
            [%& U.HEM]
          =+  BEM=AS-BEAM
          ?^  BEM  [%& %BEAM U.BEM]
          ?:  IS-SPUR
            [%& %SPUR (FLOP Q.POK)]
          ~|(STRANGE-PATH+Q.POK !!)
      ::
      ++  AS-MAGIC-FILENAME
        ^-  (UNIT HTTR)
        ?+    [(FALL P.POK %$) Q.POK]  ~
            {?($ICO $PNG) $FAVICON ~}
          :-  ~
          %^  RESP  200  IMAGE+/PNG
          FAVI
        ::
            {$TXT $ROBOTS ~}
          :-  ~
          %^  RESP  200  TEXT+/PLAIN
          %-  OF-WAIN:FORMAT
          :~  'USER-AGENT: *'
              'DISALLOW: '
          ==
        ::
            {@TAS $'.WELL-KNOWN' ^}  ::  XX FILE EXTENSION?
          =/  MIM  (YANK WEL (TAIL Q.POK))
          ?~  MIM  ~
          `(RESP 200 P.U.MIM Q.Q.U.MIM)
        ==
      ::
      ++  IS-SPUR  |(?~(Q.POK & ((SANE %TA) I.Q.POK)))
      ++  AS-BEAM                                       :: /~SIPNYM/DESK/3/...
        ^-  (UNIT BEAM)
        =+  =<  TYK=(DROP-LIST (TURN Q.POK .))          :: A PATH WHOSE ELEMENTS
            |=(A/KNOT `(UNIT TYKE)`(RUSH A GASP:VAST))  :: ARE IN /=FOO==/=BAR
        ?~  TYK  ~                                      :: SYNTAX
        =+  %-  POSH:(VANG & (EN-BEAM TOP))             :: THAT THE BASE PATH
            [[~ (ZING U.TYK)] ~]                        :: CAN INTERPOLATE INTO
        ?~  -  ~                                        ::
        =+  (PLEX:VAST %CLSG U)                         :: STATICLY, AND MAKE A
        (BIFF - DE-BEAM)                                   :: VALID BEAM
      ::
      ++  AS-AUX-REQUEST                                ::  /~/... REQ PARSER
        ^-  (UNIT PERK)
        =.  MEF
          ?.  ?=($POST MEF)  MEF
          ?+    (SKIM QUY |=({A/@T B/@T} &(=('' B) =(A (CRIP (CUSS (TRIP A)))))))
              ~|(BAD-QUY+[REQ='"?PUT" OR "?DELETE"' QUY] !!)
            ~   MEF
            {{$'DELETE' ~} ~}  %DELT
            {{$'PUT' ~} ~}     %PUT
          ==
        |-
        ?:  ?=({$'~~' *} Q.POK)                            ::  AUTH SHORTCUTS
          $(Q.POK ['~' %AS %OWN T.Q.POK])
        ?.  ?=({$'~' @ *} Q.POK)  ~
        :-  ~  ^-  PERK
        =*  PEF  I.T.Q.POK
        =+  BUT=T.T.Q.POK                 ::  XX  =*
        ?+    PEF  ~|(PFIX-LOST+`PATH`/~/[PEF] !!)
            $DEBUG  ((HARD PERK) [%BUGS BUT])
            $AWAY  [%AWAY ~]
            $AC
          ?~  BUT  ~|(NO-HOST+`PATH`/~/[PEF] !!)
          =+  `DOM/HOST`~|(BAD-HOST+I.BUT (RASH I.BUT THOS:DE-PURL))
          ?:  ?=(%| -.DOM)  ~|(AUTH-IP+DOM !!)
          =-  [%OATH - P.DOM]
          ~|  BAD-USER+`PATH`T.BUT
          ?>  ?=({@ $IN ~} T.BUT)
          =+  IN-QUY=(RUSH I.T.BUT ;~(PFIX CAB FQUE:DE-PURL))
          ?~  IN-QUY
            (SLAV %TA I.T.BUT)
          =+  SRC=~|(NO+U.IN-QUY (~(GOT BY (MALT QUY)) U.IN-QUY))
          P:(NEED (PICK SRC))  ::  ALLOW STATE=USR_OTHER-DATA
        ::
            $AT  [%AUTH %AT POK(Q BUT)]
            $AM  ?~(BUT !! [%AUTH %XEN I.BUT POK(Q T.BUT)])
            $AS
          :+  %AUTH  %GET
          ~|  BAD-SHIP+?~(BUT ~ I.BUT)
          ?~  BUT  !!
          :_  POK(Q T.BUT)
          ?+  I.BUT  (SLAV %P I.BUT)
            $ANON  ANON
            $OWN   OUR
          ==
        ::
            $ON
          :-  %POLL
          ?^  BUT  [(RAID BUT %UV ~)]~
          =+  DEP=((HARD (LIST {@ ~})) QUY)
          =<  ?~(. !! .)
          (TURN DEP |=({A/@TAS ~} (SLAV %UV A)))
        ::
            $OF
          :+  %VIEW  ?>(?=({@ ~} BUT) I.BUT)
          ?>  ?=({{$POLL @} ~} QUY)
::          :^  %VIEW
::          ?>  ?=({@ ~} BUT)
::          I.BUT
::          ?>  ?=({{$POLL @} *} QUY)     ::  XX EVENTSOURCE
          [~ (RASH Q.I.QUY DEM)]
::          ?:  ?=({{$T @} ~} +.QUY)
::            =/  S  (RASH Q.I.T.QUY DEM)
::            `(YULE [0 0 0 S ~])
::          ~
        ::
            $TO
          =+  ^-  DIR/{P/SHIP Q/TERM R/MARK}
              ~|  BAD-MESS+BUT
              ?+  BUT  !!
                {@ @ ~}    [OUR (RAID BUT %TAS %TAS ~)]
                {@ @ @ ~}  (RAID BUT %P %TAS %TAS ~)
              ==
          =;  X/{WIR/WIRE MEZ/JSON}
            [%MESS [P Q]:DIR R.DIR WIR.X MEZ.X]
          =+  WIR=(~(GET BY (MOLT QUY)) 'WIRE')
          ?^  WIR  [(STAB U.WIR) GRAB-JSON]          ::  XX DISTINGUISH
          %.(GRAB-JSON =>(DEJS (OT WIRE+(CU STAB SO) XYRO+SAME ~)))
        ::
            $IN
          ~|  EXPECT+[%POST 'APPLICATION+JSON' /'@UV' '?PUT/DELETE']
          ?>  &(?=(?($DELT $PUT) MEF) ?=($@(~ {~ $JSON}) P.POK))
          [%DEPS MEF (RAID BUT %UV ~)]
        ::
            $IS
          ?~  BUT
            ~|(NO-APP+BUT=BUT !!)
          |-  ^-  PERK
          ?~  P.POK  $(P.POK [~ %JSON])
          ?.  ?=($JSON U.P.POK)
            ~|(IS+STUB+U.P.POK !!)      ::  XX MARKS
          ?:  ((SANE %TAS) I.BUT)
            $(BUT [(SCOT %P OUR) BUT])
          ?>  ?=(?($DELT $PUT) MEF)
          =+  :-  HAP=[(SLAV %P I.BUT) (SLAV %TAS -.T.BUT)]
              WIR=%.(GRAB-JSON =>(DEJS (OT WIRE+(CU STAB SO) ~)))
          [%SUBS MEF HAP U.P.POK WIR +.T.BUT]
        ::
            $AUTH
          :-  %AUTH
          |-  ^-  PERK-AUTH
          ?+    P.POK  !!
              ~         $(P.POK [~ %JSON])
              {~ $JS}    [%JS ~]
              {~ $JSON}
            ?+    MEF  ~|(BAD-METH+MEF !!)
                $GET   [%JSON ~]
                $PUT
              ~|  PARSING+BOD
              :-  %TRY
              %.(GRAB-JSON =>(DEJS (OT SHIP+(SU FED:AG) CODE+(MU SO) ~)))
            ::
                $DELT
              ::  XX: RESTORED OLD CODE TO FIX FOR REDO
              ::  ~|  PARSING+BOD
              ::  :-  %DEL
              ::  %.(GRAB-JSON =>(DEJS-SOFT (OT SHIP+(SU FED:AG))))
              ::
              ~|  PARSING+BOD
              =+  JON=(NEED (DE-JSON Q:(NEED BOD)))
              ?>  ?=($O -.JON)
              =+  SIP=(~(GET BY P.JON) %SHIP)
              [%DEL ?~(SIP ~ [~ ((SU:DEJS FED:AG) U.SIP)])]
        ==  ==
        ==
      --
    ::
    :: PROCESS-PAYLOAD HANDLES THE TRANSLATION OF A PAYLOAD FOR POST.
    :: CURRENTLY THIS INVOLVES TREATING THE PAYLOAD AS A URLENCODED
    :: REQUEST. IN THE FUTURE IT'S POSSIBLE THE PAYLOAD COULD BE
    :: A SPECIFIC MARK INSTEAD.
    ::
    ++  PROCESS-PAYLOAD
      ^-  {QUAY METH}
      ?+  MEF  [QUY MEF]
        $POST  [`QUAY`(WELD QUY `QUAY`(RASH Q:(NEED BOD) YQUY:DE-PURL)) %GET]
      ==
    ++  PROCESS
      ^-  (EACH PEST _DONE)
      =+  PET=PARSE
      ?:  ?=(%| -.PET)
        [%& %$ P.PET]
      (PROCESS-PARSED P.PET)
    ::
    ++  PROCESS-PARSED
      |=  HEM/PERK  ^-  (EACH PEST _DONE)
      ?-    -.HEM
          $AUTH  (PROCESS-AUTH P.HEM)
          $AWAY  [%& %HTML LOGOUT-PAGE:XML]
          ?($BEAM $SPUR)
        =^  PAYLOAD  MEF  PROCESS-PAYLOAD
        =/  EXT  %+  FALL  P.POK
          ?:  ?=(%SPUR -.HEM)
            %URB
          ?:  =(OUR P.P.HEM)
            %URB
          %X-URB
        =+  BEM=?-(-.HEM $BEAM P.HEM, $SPUR [-.TOP (WELD P.HEM S.TOP)])
        ~|  BAD-BEAM+Q.BEM
        ?<  =([~ 0] (SKY [151 %NOUN] %CW (EN-BEAM BEM(+ ~, R [%DA NOW]))))
        ?:  ::!=(OUR P.BEM) ::TODO ALSO IF IT IS?
            =('X-' (END 3 2 EXT))
          =.  EXT  (CAT 3 EXT '-ELEM')
          =.  -.BEM  (NORM-BEAK -.BEM)
          =/  HAN  (SHAM HEN)
          =.  POX  (~(PUT BY POX) HAN HEN)
          =+  ARG=(FCGI PAYLOAD FCGI-CRED)
          [%| (AMES-GRAM P.BEM %GET-INNER HAN EXT ARG BEM)]
        =+  WIR=`WHIR`[%HA (EN-BEAM -.BEM ~)]
        =.  WIR  ?+(MEF !! $GET WIR, $HEAD [%HE WIR])
        =.  R.BEM  ?+(R.BEM R.BEM {$UD $0} DA+NOW)
        =+  ARG=(FCGI PAYLOAD FCGI-CRED)
        =+  [%BAKE WIR EXT ARG BEM]
        ?.(AUT [%& `PEST`-] [%| `_DONE`(RESOLVE ~ -)])
      ::
          $BUGS
        ?-  P.HEM
          $AS  (SHOW-LOGIN-PAGE)
          $TO  [%& %HTML POKE-TEST:XML]
        ==
      ::
          $DEPS
        =+  IRE=NEED-IXOR
        ?>  (~(HAS BY WIX) IRE)  ::  XX MADE REDUNDANT BY ORYX CHECKING
        =<  [%| (NICE-JSON)]
        ?-  P.HEM
          $PUT   (NEW-DEPS Q.HEM %| IRE)
          $DELT  (DEL-DEPS Q.HEM %| IRE)
        ==
      ::
          $MESS
        :-  %|
        =^  ORX  ..YA  ?:(IS-ANON NEW-VIEW:FOR-CLIENT [(NEED GRAB-ORYX) ..YA])
        =+  VEW=(IRE-IX (ORYX-TO-IXOR ORX))
        ((TEBA NEW-MESS.VEW) P.HEM R.HEM Q.HEM %JSON !>(`JSON`S.HEM))
      ::
          $OATH
        ?.  (~(HAS BY SEC) [P Q]:HEM)
          ~|(NO-DRIVER+[P Q]:HEM !!)
        [%| %.(QUY (TEBA GET-QUAY:(DOM-VI [P Q]:HEM)))]
      ::
          $POLL
        ?:  ?=({~ $JS} P.POK)  ::  XX TREAT NON-JSON CASES?
          =+  DEPS=[%A (TURN `(LIST @UVH)`P.HEM |=(A/@ S+(SCOT %UV A)))]
          [%& %JS (ADD-JSON (FROND:ENJS %DEPS DEPS) POLL:JS)]
        =.  LYV  (~(PUT BY LYV) HEN %WASP P.HEM)
        |-
          =.  DONE  (NEW-DEPS I.P.HEM %& HEN)
          ?~  T.P.HEM  [%| DONE]
          $(P.HEM T.P.HEM)
      ::
          $SUBS
        ?-  P.HEM
          $PUT   [%| ((TEBA ADD-SUBS:FOR-VIEW) Q.HEM)]
          $DELT  [%| ((TEBA DEL-SUBS:FOR-VIEW) Q.HEM)]
        ==
      ::
          $VIEW
        ~|  LOST-IXOR+P.HEM
::        [%| ((TEBA POLL:(IRE-IX P.HEM)) U.Q.HEM R.HEM)]
        [%| ((TEBA POLL:(IRE-IX P.HEM)) U.Q.HEM)]
      ==
    ::
    ++  PROCESS-AUTH
      |=  HAM/PERK-AUTH  ^-  (EACH PEST _DONE)
      =+  YAC=FOR-CLIENT
      ?-    -.HAM
          $JS    [%& %JS AUTH:JS]
          $JSON  =^  JON  ..YA  STAT-JSON.YAC
                 [%| (GIVE-JSON 200 CUG.YAC JON)]
          $XEN   (SHOW-LOGIN-PAGE ~ SES.HAM)
      ::
          $AT
        =.  ..YA  ABET.YAC
        =+  PEZ=PROCESS(POK P.HAM, AUT |)
        ?.  ?=(%& -.PEZ)  ~|(NO-INJECT+P.HAM !!)
        ?~  P.PEZ  PEZ
        ?+    -.P.PEZ  ~&(BAD-INJECT+P.PEZ !!)
            $RED  PEZ
            $BAKE
          =.  YA  ABET.YAC
          [%| (RESOLVE ~ P.PEZ(P [%AT SES.YAC P.P.PEZ]))]
        ::
            $JS
          =^  JON  ..YA  STAT-JSON.YAC
          [%| (RESOLVE CUG.YAC P.PEZ(P (ADD-JSON JON P.P.PEZ)))]
        ==
      ::
          $DEL
        =.  ..YA  (LOGOFF:YAC P.HAM)
        =/  CUG
          :~  (SET-COOKIE COOKIE-PREFIX '~')
              (SET-COOKIE %SHIP '~')
          ==
        [%| (GIVE-JSON 200 CUG (FROND:ENJS %OK %B &))]
      ::
          $GET
        |-
        ~|  AUTE+HAM
        ?:  |(=(ANON HIM.HAM) (~(HAS IN AUT.YAC) HIM.HAM))
          =.  ..YA  ABET.YAC(HIM HIM.HAM)
          =+  PEZ=PROCESS(POK REM.HAM, AUT &)
          ?:  ?=(%| -.PEZ)  PEZ
          [%| (RESOLVE ~ P.PEZ)]
        ?.  =(OUR HIM.HAM)
          [%| ((TEBA FOREIGN-AUTH.YAC) HIM.HAM HAT REM.HAM QUY)]
        (SHOW-LOGIN-PAGE ~)
      ::
          $TRY
        :-  %|
        ?.  =(OUR HIM.HAM)
          ~|(STUB-FOREIGN+HIM.HAM !!)
        ?.  ?|  (~(HAS IN AUT.YAC) HIM.HAM)
                ?~(PAZ.HAM | =(U.PAZ.HAM LOAD-SECRET))
            ==
          ~|(%AUTH-FAIL !!)
        =^  JON  ..YA  STAT-JSON:(LOGON:YAC HIM.HAM)
        =.  CUG.YAC  :_(CUG.YAC (SET-COOKIE %SHIP (SCOT %P HIM.HAM)))
        (GIVE-JSON 200 CUG.YAC JON)
      ==
    ::
    ++  SHOW-LOGIN-PAGE
      |=  SES/(UNIT HOLE)  ^-  (EACH PEST _DONE)
      ?.  ?=($@(~ {~ $HTML}) P.POK)
        [%& %RED ~]
      ?~  SES
        [%& %HTME LOGIN-PAGE:XML]
      ?:  (~(HAS BY WUP) U.SES)
        [%& %HTME LOGIN-PAGE:XML]
      =+  YAC=(NEW-YA U.SES)
      =+  =-  LON=?~(- | (~(HAS IN AUT.U.-) OUR))
          (BIFF (SESSION-FROM-COOKIES COOKIE-PREFIX MAF) ~(GET BY WUP))
      =.  YAC  ?.(LON YAC (LOGON.YAC OUR))
      [%| (GIVE-HTML(..YA ABET.YAC) 401 CUG.YAC LOGIN-PAGE:XML)]
    ::
    ++  COOKIE-PREFIX  (RSH 3 1 (SCOT %P OUR))
    ++  COOKIE-DOMAIN
      ^-  CORD
      ?-  R.HAT
        {%| @}  (CAT 3 '; DOMAIN=' (RSH 3 1 (SCOT %IF P.R.HAT)))
        {%& $ORG $URBIT *}  '; DOMAIN=.URBIT.ORG'
        {%& @ @ *}  =-  (RAP 3 "; DOMAIN={-}{I.P.R.HAT ~}")
                    (TURN (FLOP `PATH`T.P.R.HAT) |=(A/KNOT (CAT 3 A '.')))

        {%& *}  ''  ::  XX SECURITY?
      ==
    ::
    ++  SET-COOKIE
      |=  {KEY/@T VAL/@T}
      %+  RAP  3  :~
        KEY  '='  VAL
        ::  '; HTTPONLY'  ?.(SEC '' '; SECURE')  ::  XX SECURITY
        COOKIE-DOMAIN
        '; PATH=/; HTTPONLY'
      ==
    ++  NEED-IXOR  (ORYX-TO-IXOR (NEED GRAB-ORYX))
    ++  FOR-VIEW  ^+(IX (IRE-IX NEED-IXOR))
    ::
    ++  FOR-CLIENT                        ::  STATEFUL PER-SESSION ENGINE
      ^+  YA
      =+  PEF=COOKIE-PREFIX
      =+  LIG=(SESSION-FROM-COOKIES PEF MAF)
      ?~  LIG
        (NEW-YA (RSH 3 1 (SCOT %P (END 6 1 NEY))))
      =+  CYZ=(~(GET BY WUP) U.LIG)
      ?~  CYZ
        ~&  BAD-COOKIE+U.LIG
        (NEW-YA (RSH 3 1 (SCOT %P (END 6 1 NEY))))
      ~(. YA U.LIG U.CYZ(CUG ~))
    ::
    ++  NEW-YA  |=(SES/HOLE ~(. YA SES (NEW-CYST SES)))
    ++  NEW-CYST
      |=  SES/HOLE
      =*  SEC  P.HAT
      ^-  CYST
      :*  ^-  CRED
          :*  HAT(P SEC)
              ~
              'NOT-YET-IMPLEMENTED'
              ::(RSH 3 1 (SCOT %P (END 6 1 (SHAF %ORYX SES))))
          ::
              =+  LAG=(~(GET BY MAF) %ACCEPT-LANGUAGE)
              ?~(LAG ~ ?~(U.LAG ~ [~ I.U.LAG]))
          ::
              CIP
              ~
          ==
          [`@P`(MIX ANON (LSH 5 1 (RSH 5 1 (SHAF %SHIP SES)))) ~]
      ::
          [(SET-COOKIE COOKIE-PREFIX SES)]~
      ::
          NOW
          ~
          ~
        ::  [1 ~]
      ==
    --
  ::
  ++  ORYX-TO-IXOR  |=(A/ORYX (RSH 3 1 (SCOT %P (END 6 1 (SHAS %IRE A)))))
  ++  YA                                                ::  SESSION ENGINE
    ~%  %EYRE-Y  ..IS  ~
    =|  {SES/HOLE CYST}
    =*  CYZ  ->
    |%
    ++  ABET  ..YA(WUP (~(PUT BY WUP) SES CYZ))
    ++  ABUT  ..YA(WUP (~(DEL BY WUP) SES))
    ++  FOREIGN-AUTH
      |=  {HIM/SHIP PUL/PURL}  ^+  ..YA
      =.  WAY  (~(PUT BY WAY) HIM PUL HEN)
      ~&  ASKING-FOREIGN+HIM
      (AMES-GRAM:ABET HIM [%LON SES])
    ::
    ++  FOREIGN-HAT
      |=  {HIM/SHIP HAT/HART}  ^+  ..YA
      ~|  WAY
      ?.  (~(HAS BY WAY) HIM)  :: XX CRASHES SHOULD BE HANDLED BY AMES
        ~&(STRANGE-AUTH+[WAY HIM HAT] ..YA)
      =^  PUL  HEN  (~(GOT BY WAY) HIM)
      =:  WAY       (~(DEL BY WAY) HIM)
          DOP       (~(PUT BY DOP) R.HAT HIM)
          Q.Q.PUL   ['~' %AM SES Q.Q.PUL]
        ==
      =+  URL=(WELP (EN-PURL PUL(P HAT)) '#' (HEAD:EN-PURL P.PUL))
      %-  GIVE-THOU:ABET
      (ADD-COOKIES CUG [307 [LOCATION+(CRIP URL)]~ ~])
    ::
    ++  LOGON
      |=  HER/SHIP
      %_  +>
        HIM   HER
        AUT   (~(PUT IN AUT) HER)
        ..YA
          ::  ~&  LOGON+[OUR HER SES]
          ?.  =(OUR HER)
            ..YA
          =+  SAP=(~(GET BY SOP) SES)
          ::  ~&  SAP+SAP
          ?.  ?=({~ @ %|} SAP)
            ..YA
          (AMES-GRAM -.U.SAP %AUT SES)
      ==
    ++  LOGOFF
      |=  HER/(UNIT SHIP)  ^+  ..YA
      ?~  HER  ABUT
      =.  AUT  (~(DEL IN AUT) U.HER)
      ?~  AUT  ABUT
      ABET(HIM ?.(=(U.HER HIM) HIM N.AUT))
    ::
    ++  NEW-VIEW
      ^+  [*ORYX ..YA]
      =+  ORX=`@T`(RSH 3 1 (SCOT %P (SHAF %ORX ENY)))
      =.  VEW  (~(PUT IN VEW) ORX)
      =+  IRE=(ORYX-TO-IXOR ORX)
      =.  ..IX  ~(INIT IX IRE %*(. *STEM HIM HIM, P.EVE 1))
      ::  ~&  STAT-IRE+`@T`IRE
      [ORX ABET]
    ::
    ++  FCGI-CRED  %_(CED AUT (~(PUT JU AUT.CED) %$ (SCOT %P HIM)))
    ::  XX MOVE
    ::
    ++  SEIN
      |=  WHO=SHIP
      ;;  SHIP
      (NEED (SKY [[151 %NOUN] %J (EN-BEAM [OUR %SEIN DA+NOW] /(SCOT %P WHO))]))
    ::
    ++  STAT-JSON
      ^+  [*JSON ..YA]
      =^  ORX  ..YA  NEW-VIEW
      :_  ..YA
      =/  J  ENJS
      %-  PAIRS.J  :~
        ORYX+S+ORX
        IXOR+S+(ORYX-TO-IXOR ORX)
        SEIN+(SHIP.J (SEIN OUR))
        SHIP+(SHIP.J OUR)
        USER+(SHIP.J HIM)
        AUTH+A+(TURN ~(TAP IN AUT) SHIP.J)
      ==
    --
  ::
  ++  IX
    ~%  %EYRE-X  ..IS  ~
    =|  {IRE/IXOR STEM}
    =*  SEM  ->
    |%
    ++  DONE  .
    ++  ABET  ..IX(WIX (~(PUT BY WIX) IRE SEM))
    ++  ABUT
      =+  SUB=~(TAP IN SUS)
      |-  ^+  ..IX
      ?^  SUB  $(SUB T.SUB, ..IX (PUL-SUBS I.SUB))
      =.  +>  POLL-REST
      ..IX(WIX (~(DEL BY WIX) IRE))
    ::
    ++  TEBA  |*(A/$-(* _..IX) |*(B/* %_(DONE ..IX (A B))))
    ++  GIVE-JSON  (TEBA ^GIVE-JSON)
    ++  PASS-NOTE  (TEBA ^PASS-NOTE)
    ++  HURL-NOTE
      |=  {A/{DOCK ?($MESS $LENS) PATH} B/NOTE}  ^+  ..IX
      =:  MED  (~(PUT TO MED) HEN)
          HEN  `~
        ==
      :: ~&  >  HURL+[&2.B IRE A]
      (PASS-NOTE:ABET [%OF IRE (GSIG A)] B)
    ::
    ++  INIT
      =.  DIE  (ADD ~H2 NOW)
      ABET(MOW :_(MOW [`/ %PASS OW+/[IRE] [%B %WAIT DIE]]))
    ::
    ++  REFRESH
      =.  MOW  :_(MOW [`/ %PASS OW+/[IRE] [%B %REST DIE]])
      =.  DIE  (ADD ~H2 NOW)
      DONE(MOW :_(MOW [`/ %PASS OW+/[IRE] [%B %WAIT DIE]]))
    ::
    ++  ADD-EVEN
      |=  A/EVEN  ^+  EVE
      [+(P.EVE) (~(PUT BY Q.EVE) P.EVE A)]
    ::
    ++  NEW-LENS
      |=  JON/JSON  ^+  ..IX
      =.  +>.$
        %+  PASS-NOTE
          [%OF IRE (GSIG [OUR %DOJO] LENS+/)]
        [%G %DEAL [HIM OUR] %DOJO %PEEL %LENS-JSON /SOLE]
      =.  +>.$
        %+  PASS-NOTE
          [%OF IRE (GSIG [OUR %DOJO] LENS+/)]
        [%G %DEAL [HIM OUR] %DOJO %PUNK %LENS-COMMAND %JSON !>(`JSON`JON)]
      ABET
    ::
    ++  NEW-MESS
      |=  {A/DOCK B/WIRE C/MARK D/CAGE}  ^+  ..IX
      (HURL-NOTE [A MESS+B] [%G %DEAL [HIM -.A] +.A %PUNK C D])
    ::
    ++  ADD-SUBS
      |=  {A/DOCK $JSON B/WIRE C/PATH}  ^+  ..IX
      ?:  (~(HAS IN SUS) +<)  ~|(DUPLICATE+C !!)
      =.  SUS  (~(PUT IN SUS) +<)
      (HURL-NOTE [A MESS+B] [%G %DEAL [HIM -.A] +.A %PEEL %JSON C])
    ::
    ++  PUL-SUBS
      |=  {A/DOCK $JSON B/WIRE C/PATH}  ^+  ..IX
      =.  SUS  (~(DEL IN SUS) +<)
      (HURL-NOTE [A MESS+B] [%G %DEAL [HIM -.A] +.A %PULL ~])
    ::
    ++  DEL-SUBS                      ::  XX PER PATH?
      |=  {A/DOCK $JSON B/WIRE C/PATH}  ^+  ..IX
      =.  ..IX  (PUL-SUBS +<)
      (NICE-JSON:POP-DUCT:(IRE-IX IRE))          ::  XX GALL ACK
    ::
    ++  GET-LENS
      |=  {A/WHIR-OF FEC/JSON}  ^+  ..IX
      ?~  FEC  ..IX                   ::  NULLED EVENT WE DON'T CARE ABOUT
      =.  +>.$
        %+  PASS-NOTE
          `WHIR`[%OF IRE (GSIG [OUR %DOJO] LENS+/)]
        `NOTE`[%G %DEAL [HIM OUR] %DOJO %PULL ~]
      ABET:(GIVE-JSON 200 ~ FEC)
    ::
    ++  GET-RUSH
      |=  {A/WHIR-OF B/JSON}  ^+  ..IX
      ?:  ?=($LENS R.A)
        (GET-LENS A B)
      (GET-EVEN [%RUSH [[(SLAV %P P.A) Q.A] S.A] (FROND:ENJS %JSON B)])
    ::
    ++  GET-QUIT
      |=  A/WHIR-OF  ^+  ..IX
      =/  DOC=DOCK  [(SLAV %P P.A) Q.A]
      =.  SUS  (~(DEL IN SUS) [DOC %JSON S.A S.A])
      (GET-EVEN [%QUIT [DOC S.A]])
    ::
    ++  GET-ACK
      |=  {A/WHIR-OF B/(UNIT {TERM TANG})}  ^+  ..IX
      ?:  ?=($LENS R.A)
        (ACK-LENS B)
      ?:  =(~ MED)  ~&  RESP-LOST+IRE  ..IX
      ?~  B  (NICE-JSON:POP-DUCT)
      (MEAN-JSON:POP-DUCT 500 B)
    ::
    ++  ACK-LENS
      |=  A/(UNIT (PAIR TERM TANG))  ^+  ..IX
      ?~  A
        ..IX  :: (GIVE-JSON 200 ~ (JOBA %OKEY-DOKEY %B &))
      =+  TAG=(FLOP `TANG`[>[%EYRE-LENS-FAIL P.U.A]< Q.U.A])
      %-  (SLOG TAG)
      ABET:(GIVE-JSON 500 ~ (WALL:ENJS (WUSH 160 TAG)))
    ::
    ++  GET-EVEN
      |=  VEN/EVEN  ^+  ..IX
      =+  NUM=P.EVE
      =.  EVE  (ADD-EVEN VEN)
      =<  ABET
      ?~  UDE  DONE
      =.  HEN  P.U.UDE
      (GIVE-EVEN:PASS-REST(UDE ~) Q.U.UDE NUM VEN)
    ::
    ++  GIVE-EVEN
      |=  {POL/? NUM/@U VEN/EVEN}  ^+  DONE
      =:  Q.EVE  (~(DEL BY Q.EVE) (DEC NUM))              ::  TODO PONDER A-2
          MOW    ?.(?=($RUSH -.VEN) MOW MOW:(PASS-TOOK [- %MESS +]:P.VEN))
        ==
      ?>  POL                         ::  XX EVENTSTREAM
      %^  GIVE-JSON  200  ~
      %^  PAIRS:ENJS  ID+(NUMB:ENJS NUM)  TYPE+[%S -.VEN]
      ?-  -.VEN
        $NEWS  ~[FROM+[%S (SCOT %UV P.VEN)]]
        $QUIT  ~[FROM+(SUBS-TO-JSON P.VEN)]
        $RUSH  ~[FROM+(SUBS-TO-JSON P.VEN) DATA+Q.VEN]
      ==
    ::
    ++  PASS-WAIT  (PASS-NOTE OF+/[IRE] [%B %WAIT ERA])
    ++  PASS-REST
      =.  LYV  (~(DEL BY LYV) HEN)
      (PASS-NOTE OF+/[IRE] [%B %REST ERA])
    ::
    ++  PASS-TOOK
      |=  A/{P/DOCK ?($MESS $LENS) WIRE}
      %+  PASS-NOTE(HEN `~)
        [%OF IRE (GSIG A)]
      [%G %DEAL [HIM -.P.A] +.P.A %PUMP ~]
    ::
    ++  POP-DUCT  =^(NED MED ~(GET TO MED) ABET(HEN NED))
    ++  POLL
      |=  A/@U  ^+  ..IX
::      |=  [A/@U T=(UNIT @DR)]
::      ^+  ..IX
      =<  ABET
      =.  ..POLL  REFRESH
      ?:  =(A P.EVE)
        =.  ..POLL  POLL-REST
        =.  ERA  (ADD ~S8 NOW)
::          ?~  T  (ADD ~S30 NOW)
::          (ADD U.T NOW)
        =.  LYV  (~(PUT BY LYV) HEN [%POLL IRE])
        PASS-WAIT(UDE [~ HEN &])
      ?:  (GTH A P.EVE)  ~|(SEQ-HIGH+CUR=P.EVE !!)
      =+  VEN=~|(SEQ-LOW+CUR=P.EVE (~(GOT BY Q.EVE) A))
      (GIVE-EVEN & A VEN)
    ::
    ++  POLL-REST
      ?~  UDE  DONE
      %*(. PASS-REST(HEN P.U.UDE) HEN HEN)
    ::
    ++  POLL-DEAD
      ^+  ..IX
      =<  ABET
      ?.  =(UDE [~ HEN &])
        DONE  :: OLD LONG POLL
      PASS-REST(UDE ~)
    ::
    ++  SUBS-TO-JSON
      |=  {A/DOCK B/PATH}
      %-  PAIRS:ENJS  :~
        SHIP+[%S (RSH 3 1 (SCOT %P P.A))]
        APPL+[%S Q.A]
        PATH+(TAPE:ENJS (SPUD B))
      ==
    ++  WAKE  ^+(..IX ABET(UDE ~))  ::  XX OTHER EFFECTS?
    ::  XX UNUSED
    ++  PRINT-SUBS  |=({A/DOCK B/PATH} "{<P.A>}/{(TRIP Q.A)}{(SPUD B)}")
    --
  ++  VI                                                ::  AUTH ENGINE
    ~%  %EYRE-V  ..IS  ~
    |_  $:  {USR/USER DOM/PATH}
            COR/(UNIT $@(~ VASE))
            {LIV/? REQ/(QEU {P/DUCT Q/MARK R/VASE:HISS})}
        ==
    ++  SELF  .
    ++  ABET  +>(SEC (~(PUT BY SEC) +<- +<+))
    ++  EXECUTE-TURBO
      |=  [WIR=WHIR-SE LIVE=? SCHEMATIC=SCHEMATIC:FORD]
      (EXECUTE-TURBO:ABET SE+[WIR USR DOM] LIVE SCHEMATIC)
    ++  DEAD-THIS  |=(A/TANG (FAIL:ABET 500 0V0 A))
    ++  DEAD-HISS  |=(A/TANG PUMP(REQ ~(NAP TO REQ), ..VI (GIVE-SIGH %| A)))
    ::
    ++  EYRE-THEM
      |=  [A=WHIR-SE B=VASE]
      ::  BLOCK REQUESTS UNTIL WE GET A RESPONSE TO THIS REQUEST
      ::
      =.  LIV  |
      (EYRE-THEM:ABET SE+[A USR DOM] B)
    ::
    ++  PASS-NOTE  |=({A/WHIR-SE B/NOTE} (PASS-NOTE:ABET SE+[A USR DOM] B))
    ::  XX BLOCK REQS UNTIL CORRECT CORE CHECKED IN?
    ++  WARN  |=(A/TANG ((SLOG (FLOP A)) ABET))
    ++  WITH  |*({A/VASE B/$-(VASE ABET)} |=(C/VASE (B (SLAM A C))))
    ++  ROOT-BEAK  `BEAK`[OUR %HOME DA+NOW]
    ::
    ::  MAIN
    ::
    ++  COR-TYPE  ?~(COR %VOID ?~(U.COR %VOID P.U.COR))
    ++  HAS-ARM  ~(HAS IN (SILT (SLOE COR-TYPE)))
    ++  BUILD
      %^  EXECUTE-TURBO  %CORE  LIVE=%.Y
      ^-  SCHEMATIC:FORD
      :+  %MUTE
        ^-  SCHEMATIC:FORD
        [%CORE [[OUR %HOME] [%HOON (FLOP %_(DOM . SEC+DOM))]]]
      ^-  (LIST (PAIR WING SCHEMATIC:FORD))
      :*  [[%& 12]~ %$ BALE+!>(*(BALE @))]  :: XX SPECIFY ON TYPE?
          ?~  COR  ~
          ?~  U.COR  ~
          ?:  (HAS-ARM %DISCARD-STATE)  ~
          ?:  (HAS-ARM %UPDATE)
            [[%& 13]~ RIDE+[LIMB+%UPDATE PREP-COR]]~
          [[%& 13]~ %$ NOUN+(SLOT 13 U.COR)]~
      ==
    ::
    ++  CALL
      |=  {ARM/VI-ARM SAM/CAGE}
      %^  EXECUTE-TURBO  ARM  LIVE=%.N
      CALL+[RIDE+[LIMB+ARM PREP-COR] [%$ SAM]]
    ::
    ++  PREP-COR  ^-  SCHEMATIC:FORD
      ?~  COR  ~|(%NO-CORE !!)
      ?~  U.COR  ~|(%NIL-DRIVER !!)
      :+  %$  %CORE
      %_    U.COR
          +12.Q
        =+  ^=  ATO
            %-  SKY
            [[151 %NOUN] %CX (EN-BEAM ROOT-BEAK [%ATOM (FLOP %_(DOM . SEC+DOM))])]
        =+  KEY=?~(ATO '' ;;(@T U.ATO))  ::  XX JAEL
        =.  KEY
          ?~  KEY  ''
          %-  (BOND |.(~&(BAD-KEY+[DOM KEY] '')))
          =+  (SLAW %UW KEY)
          ?~(- ~ (DE:CRUB:CRYPTO LOAD-SECRET U))  :: XX CLAY PERMISSIONS
        `(BALE)`[[OUR NOW (SHAS %BALE ENY) ROOT-BEAK] [USR DOM] KEY]
      ==
    ::
    ++  PUMP
      ^+  ABET
      ?~  COR
        BUILD
      ?.  LIV
        ~&  E+VI+PUMP-BLOCKED+[DOM ~(WYT IN REQ)]
        ABET
      =+  OLE=~(TOP TO REQ)
      ?~  OLE  ABET
      ::  PROCESS HISS
      =.  HEN  P.U.OLE
      ?~  U.COR  (EYRE-THEM %FILTER-REQUEST R.U.OLE)  :: DON'T PROCESS
      (CALL %FILTER-REQUEST HISS+R.U.OLE)
    ::
    ++  FIN-HTTR
      |=  VAX/VASE
      =^  OLE  REQ  ~|  %EYRE-NO-QUEUE  ~(GET TO REQ)
      =>  .(OLE `{P/DUCT Q/MARK *}`OLE)             :: XX TYPES
      =.  ..VI  (CAST-THOU(HEN P.OLE) Q.OLE HTTR+VAX)    :: ERROR?
      PUMP
    ::
    ::  INTERFACES
    ::
    ++  GET-QUAY  |=(QUY/QUAY (CALL %RECEIVE-AUTH-QUERY-STRING QUAY+!>(QUY)))
    ++  GET-REQ   |=(A/{MARK VASE:HISS} PUMP(REQ (~(PUT TO REQ) HEN A)))
    ++  GET-THOU
      |=  {WIR/WHIR-SE HIT/HTTR}
      =.  LIV  &
      ?+  WIR  !!
        ?($RECEIVE-AUTH-QUERY-STRING $IN)  (CALL %RECEIVE-AUTH-RESPONSE HTTR+!>(HIT))
        ?($FILTER-REQUEST $OUT)
          ?.  (HAS-ARM %FILTER-RESPONSE)  (FIN-HTTR !>(HIT))
          (CALL %FILTER-RESPONSE HTTR+!>(HIT))
      ==
    ::
    ++  GET-MADE
      |=  [WIR/WHIR-SE RESULT=MADE-RESULT:FORD]  ^+  ABET
      ::  |=  {WIR/WHIR-SE DEP/@UVH RES/(EACH CAGE TANG)}  ^+  ABET
      ?:  ?=($CORE WIR)  (MADE-CORE RESULT)
      %.  RESULT
      ?-  WIR
        ?($FILTER-REQUEST $OUT)             MADE-FILTER-REQUEST
        ?($FILTER-RESPONSE $RES)            MADE-FILTER-RESPONSE
        ?($RECEIVE-AUTH-RESPONSE $BAK)      MADE-RECEIVE-AUTH-RESPONSE
        ?($RECEIVE-AUTH-QUERY-STRING $IN)   MADE-RECEIVE-AUTH-QUERY-STRING
      ==
    ::
    ++  MADE-CORE
      |=  [RESULT=MADE-RESULT:FORD]
      ::  |=  {DEP/@UVH GAG/(EACH CAGE TANG)}
      :: ~&  GOT-UPDATE/DEP
      ::  =.  ..VI  (PASS-NOTE %CORE [%F [%WASP OUR DEP &]])
      ?:  ?=([%COMPLETE %SUCCESS *] RESULT)
        =/  =CAGE  (RESULT-TO-CAGE:FORD BUILD-RESULT.RESULT)
        PUMP(COR `Q:CAGE)
      ?:  &(=(~ COR) =(%$ USR))
        =.  COR  `~
        PUMP ::(COR `~)  :: USERLESS %HISS DEFAULTS TO "NOP" DRIVER
      %-  WARN
      ?:  ?=(%INCOMPLETE -.RESULT)
        TANG.RESULT
      ?>  ?=(%ERROR -.BUILD-RESULT.RESULT)
      MESSAGE.BUILD-RESULT.RESULT
    ::
    ++  MADE-FILTER-REQUEST
      %+  ON-FORD-FAIL  DEAD-HISS
      %+  ON-ERROR  WARN  |.
      %-  HANDLE-MOVES  :~
        GIVE+DO-GIVE
        SEND+(DO-SEND %FILTER-REQUEST)
        SHOW+DO-SHOW
      ==
    ::
    ++  MADE-FILTER-RESPONSE
      %+  ON-ERROR  DEAD-HISS  |.
      %-  HANDLE-MOVES  :~
        GIVE+DO-GIVE
        SEND+(DO-SEND %FILTER-REQUEST)
        REDO+_PUMP
      ==
    ::
    ++  MADE-RECEIVE-AUTH-QUERY-STRING
      %+  ON-ERROR  DEAD-THIS  |.
      (HANDLE-MOVES SEND+(DO-SEND %RECEIVE-AUTH-QUERY-STRING) ~)
    ::
    ++  MADE-RECEIVE-AUTH-RESPONSE
      %+  ON-ERROR  DEAD-THIS  |.
      %-  HANDLE-MOVES  :~
        GIVE+DO-GIVE
        SEND+(DO-SEND %RECEIVE-AUTH-QUERY-STRING)
        REDO+_PUMP(..VI (GIVE-HTML 200 ~ EXIT:XML))
      ==
    ::
    ::  RESULT HANDLING
    ::
    ::    XX FORMAL DILL-BLIT %URL VIA HOOD
    ++  AUTH-PRINT  |=({$SHOW A/PURL} (SLOG AUTH-TANK LEAF+(EN-PURL A) ~))
    ++  AUTH-TANK
      =>  =-  ?~(USR - ROSE+["@" `~]^~[LEAF+(TRIP USR) -])
          ROSE+["." `~]^(TURN (FLOP DOM) |=(A/CORD LEAF+(TRIP A)))
      ROSE+[" " `~]^~[LEAF+"TO AUTHENTICATE" . LEAF+"VISIT:"]
    ::
    ++  DO-GIVE  (WITH !>(|=({$GIVE A/HTTR} A)) FIN-HTTR)
    ++  DO-SHOW  (WITH !>(AUTH-PRINT) _ABET)
    ++  DO-SEND
      |=  WIR/WHIR-SE  ^-  $-(VASE _ABET)
      |=  RES/VASE
      (EYRE-THEM WIR (SLAM !>(|=({$SEND A/HISS} A)) RES))
    ::
    ++  CANCEL-REQUEST  ~&  %CANCEL-REQUEST
                        (DEAD-HISS(LIV &) [LEAF+"CANCELED"]~)
    ::
    ++  HANDLE-MOVES
      |=  A/(LIST {P/TERM Q/$-(VASE _ABET)})
      |=  B/VASE
      ~>  %NIL.
        ~|  %BAD-SEC-MOVE  :: XX MOVE ~| INTO ?> PROPERLY
        ?>((~(NEST UT P:!>(*SEC-MOVE)) %& P.B) ~)
      =+  OPT=|.((SILT (TURN A HEAD)))
      |-
      ?~  A  ~|(ALLOWED=(OPT) !!)
      ?:  =(P.I.A -.Q.B)
        (Q.I.A (SPED B))
      $(A T.A)
    ::
    ++  ON-FORD-FAIL
      |=  {ERR/$-(TANG _ABET) TRY/$-(MADE-RESULT:FORD _ABET)}
      |=  A/MADE-RESULT:FORD  ^+  ABET
      ?:  ?=(%INCOMPLETE -.A)
        (ERR TANG.A)
      ?:  ?=(%ERROR -.BUILD-RESULT.A)
        (ERR MESSAGE.BUILD-RESULT.A)
      (TRY A)
    ::
    ++  ON-ERROR
      |=  {ERR/$-(TANG _ABET) HANDLE-MOVE/_|.(|~(VASE ABET))}
      |=  A=MADE-RESULT:FORD  ^+  ABET
      =+  TRY=(POSSIBLY-STATEFUL |=(B/_SELF (HANDLE-MOVE(+ B))))  :: XX TYPES
      ?:  ?=(%INCOMPLETE -.A)
        (ERR TANG.A)
      ?:  ?=(%ERROR -.BUILD-RESULT.A)
        (ERR MESSAGE.BUILD-RESULT.A)
      =/  =CAGE  (RESULT-TO-CAGE:FORD BUILD-RESULT.A)
      =-  ?-(-.- %& P.-, %| (ERR P.-))
      (MULE |.(~|(DRIVER+DOM ~|(BAD-RES+P.Q.CAGE (TRY Q.CAGE)))))
    ::
    ++  POSSIBLY-STATEFUL
      |=  HAN/$-(_SELF $-(VASE _ABET))  :: XX |.(|+(VASE ABET))
      |=  RES/VASE  ^+  ABET
      ?:  ?=({@ *} Q.RES)
        =.  P.RES  (~(FUSE UT P.RES) P:!>(*{@ *}))
        ((HAN SELF) RES)
      ?.  ?=({{@ *} *} Q.RES)
        ~|(%MISSHAPEN-RESULT !!)
      =.  P.RES  (~(FUSE UT P.RES) P:!>(*{{@ *} *}))
      =+  [MOW=(SLOT 2 RES) ROC=(SLOT 3 RES)]
      =-  ((HAN SELF(COR (SOME ROC))) MOW):+  ::  XX BETTER STATELESS ASSERTS
      =+  TYP=COR-TYPE
      ~|  %CORE-MISMATCH
      ?>((~(NEST UT TYP) & P.ROC) ~)
--  --
--
.   ==
=|  BOLO
=*  BOL  -
|=  [OUR=SHIP NOW=@DA ENY=@UVJ SKI=SLEY]                ::  CURRENT INVOCATION
^?                                                      ::  OPAQUE CORE
|%                                                      ::
++  CALL                                                ::  HANDLE REQUEST
  |=  $:  HEN=DUCT
          TYPE=*
          WRAPPED-TASK=(HOBO TASK:ABLE)
      ==
  ::
  =/  TASK=TASK:ABLE
    ?.  ?=(%SOFT -.WRAPPED-TASK)
      WRAPPED-TASK
    ((HARD TASK:ABLE) P.WRAPPED-TASK)
  ::
  ^+  [*(LIST MOVE) ..^$]
  ?:  ?=($WEGH -.TASK)
    :_  ..^$  :_  ~
    :^  HEN  %GIVE  %MASS
    :+  %EYRE  %|
    :~  DEPENDENCIES+&+LIZ
        SESSIONS+&+WUP
        VIEWS+&+WIX
        DUCTS+[%| ~[DEAD+&+DED PROXY+&+POX OUTGOING+&+ASK]]
        HOSTS+&+DOP
        DOT+&+BOL
    ==
  =+  SKA=(SLOY SKI)
  =+  SKY=|=({* *} `(UNIT)`=+(A=(SKA +<) ?~(A ~ ?~(U.A ~ [~ U.U.A]))))
  =.  NEY  (SHAX :(MIX (SHAX NOW) +(ENY) NEY))          ::  XX!!  SHD NOT NEED
  ^+  [P=*(LIST MOVE) Q=..^$]
  =.  GUB  ?.(=(`@`0 GUB) GUB (CAT 3 (RSH 3 1 (SCOT %P (END 6 1 ENY))) '-'))
  =^  MOS  BOL
    ABET:(APEX:~(ADIT YE [HEN [NOW ENY OUR SKY] ~] BOL) TASK)
  [MOS ..^$]
::
++  LOAD                                                ::  TAKE PREVIOUS STATE
  |=  OLD/BOLO
  ..^$(+>- OLD)
::
++  SCRY
  |=  {FUR/(UNIT (SET MONK)) REN/@TAS WHY/SHOP SYD/DESK LOT/COIN TYL/PATH}
  ^-  (UNIT (UNIT CAGE))
  ?.  ?=(%& -.WHY)  ~
  =*  WHO  P.WHY
  =+  SKA=(SLOY SKI)
  =+  SKY=|=({* *} `(UNIT)`=+(A=(SKA +<) ?~(A ~ ?~(U.A ~ [~ U.U.A]))))
  ?.  ?=($$ REN)  [~ ~]
  ?.  ?=($$ -.LOT)  [~ ~]
  ?+    SYD  [~ ~]
      $SERV
    ``[%PATH !>((EN-BEAM TOP))]
  ::
      $HOST
    %-  (LIFT (LIFT |=(A/HART [%HART !>(A)])))
    ^-  (UNIT (UNIT HART))
    ?.  =(OUR WHO)
      ?.  =([%DA NOW] P.LOT)  [~ ~]
      ~&  [%E %SCRY-FOREIGN-HOST WHO]
      ~  :: XX ADD NON-SCRY BINDING TO $HAT GRAM
    =.  P.LOT  ?.(=([%DA NOW] P.LOT) P.LOT [%TAS %REAL])
    ?+  P.LOT  [~ ~]
      {$TAS $FAKE}  ``[& [~ 8.443] %& /LOCALHOST]       :: XX FROM UNIX
      {$TAS $REAL}
        =/  HOT=HOST  [%& ?^(DOM N.DOM /LOCALHOST)]
        =/  SEK=?    &(?=(^ SEK.POR) !?=(HOKE HOT))
        =/  POR=(UNIT @UD)
          ?.  SEK
            ?:(=(80 CLR.POR) ~ `CLR.POR)
          ?>  ?=(^ SEK.POR)
          ?:(=(443 U.SEK.POR) ~ SEK.POR)
        ``[SEK POR HOT]
    ==
  ==
::
++  STAY  `BOLO`+>-.$
++  TAKE                                                ::  ACCEPT RESPONSE
  |=  {TEA/WIRE HEN/DUCT HIN/(HYPO SIGN)}
  ^+  [*(LIST MOVE) ..^$]
  =+  SKA=(SLOY SKI)
  =+  SKY=|=({* *} `(UNIT)`=+(A=(SKA +<) ?~(A ~ ?~(U.A ~ [~ U.U.A]))))
  =.  NEY  (SHAX :(MIX (SHAX NOW) +(ENY) NEY))          ::  XX!!  SHD NOT NEED
  ^+  [P=*(LIST MOVE) Q=..^$]
  =.  GUB  ?.(=(`@`0 GUB) GUB (CAT 3 (RSH 3 1 (SCOT %P (END 6 1 ENY))) '-'))
  =+  TEE=((SOFT WHIR) TEA)
  ?~  TEE  ~&  [%E %LOST -.Q.HIN HEN]  [~ ..^$]
  =^  MOS  BOL
    =<  ABET
    (AXON:~(ADIT YE [HEN [NOW ENY OUR SKY] ~] BOL) U.TEE Q.HIN)
  [MOS ..^$]
::
--
