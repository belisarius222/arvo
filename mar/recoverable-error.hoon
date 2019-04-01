::  POSSIBLY NON-FATAL HTTP ERROR
::
::::  /HOON/RECOVERABLE-ERROR/MAR
  ::
/-    RECOVERABLE-ERROR
::
::::  ~FYR
  ::
=,  EYRE
=,  FORMAT
=,  HTML
|_   RECOVERABLE-ERROR
++  GRAB
  |%
  ++  NOUN  RECOVERABLE-ERROR
  ++  HTTR
    |=  A/^HTTR  ^-  RECOVERABLE-ERROR
    ~&  [%RECOVERABLE-HTTR A]
    ~!  A
    ?+  P.A  ~|(NON-RECOVERABLE+P.A !!)
      $429  :+  P.A  %RATE-LIMIT
            %.  %X-RATE-LIMIT-RESET
            ;~  BIFF
              ~(GET BY (MALT Q.A))
              DE-JSON
              NI:DEJS-SOFT
            ==
    ==
  --
++  GROW  |%  ++  TANK  >[+<]<  --
--
