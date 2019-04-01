/-  SOLE
=,  SOLE
|%
++  PRODUCE                                             ::  CONSTRUCT RESULT
  |*  PRO/*                                             ::
  [P=*(LIST TANK) Q=[%& P=[~ U=PRO]]]                   ::
::                                                      ::
++  PRINT                                               ::  ADD OUTPUT TANK
  |*  {TAN/TANK RES/(SOLE-RESULT)}                      ::
  ?@  RES  RES                                          ::
  [P=[I=TAN T=P.RES] Q=Q.RES]                           ::
::                                                      ::
++  PROMPT                                              ::  CONSTRUCT PROMPT
  |*  {POM/SOLE-PROMPT MOR/(SOLE-DIALOG)}               ::
  [P=*(LIST TANK) Q=[%| P=POM Q=MOR]]                   ::
::                                                      ::
++  CURL                                                ::  FETCH URL
  =|  USR/KNOT                                          ::
  |*  {PUL/_PURL:EYRE FUN/$-(HTTR:EYRE *)}              ::
  :-  P=*(LIST TANK)                                    ::
  Q=[%| P=`USR Q=[PUL %GET ~ ~] R=FUN]                  ::
::                                                      ::
++  NO-PRODUCT                                          ::  EMPTY RESULT
  [P=*(LIST TANK) Q=[%& ~]]                             ::
::                                                      ::
++  PARSE                                               ::  PARSE BY RULE
  |*  {SEF/RULE FUN/$-(* *)}                            ::
  |=  TXT/SOLE-INPUT                                    ::
  =+  VEX=(SEF [0 0] TXT)                               ::
  ?:  |(!=((LENT TXT) Q.P.VEX) ?=($~ Q.VEX))            ::
    Q.P.VEX                                             ::
  (FUN P.U.Q.VEX)                                       ::
--
