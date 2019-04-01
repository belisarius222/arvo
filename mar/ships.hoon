::
::::  /HOON/SHIPS/MAR
  ::
/?    310
=,  FORMAT
|_  ALL/(LIST SHIP)
++  GRAB  |%
          ++  NOUN  (LIST SHIP)
          ++  JSON  (AR (SU FED:AG)):DEJS
          --
++  GROW  |%
          ++  JSON  `^JSON`[%A (TURN ALL SHIP:ENJS)]
          --
++  GRAD  %JSON
--
