/-  HALL, TIEBOUT
=,  FORMAT
::
|_  ACT=ACTION:TIEBOUT
::
++  GROW
  |%
  ++  TANK  >ACT<
  --
::
++  GRAB
  |%
  ++  NOUN  ACTION:TIEBOUT
  ++  JSON
    |=  JON=^JSON
    ^-  ACTION:TIEBOUT
    =<  (ACTION JON)
    |%
    ++  ACTION
      %-  OF:DEJS
        :~  TOKEN+SO:DEJS
            ADD-CIRCLE+SA
            DEL-CIRCLE+SA
        ==
    ++  SA            :: STRING AS TA
      |=  JON=^JSON
      ?>  ?=([%S *] JON)
      (SCOT %TAS P.JON)
    --
  --
::
--

