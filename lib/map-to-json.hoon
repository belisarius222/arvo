::   HOON DATA TO JSON
::
::::  /HOON/MAP-TO-JSON/LIB
  ::
/?    310
=,  FORMAT
|*  {A/_CORD B/_JSON}                 ::  XX {A/$-(* CORD) B/$-(* JSON)}
|=  C/(MAP _+<.A _+<.B)
(PAIRS:ENJS (TURN ~(TAP BY C) |*(D/^ [(A -.D) (B +.D)])))
