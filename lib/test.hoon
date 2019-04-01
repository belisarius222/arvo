::  TESTING UTILITIES MEANT TO BE DIRECTLY USED FROM FILES IN %/TESTS
::
|%
::  +EXPECT-EQ: COMPARES :EXPECTED AND :ACTUAL AND PRETTY-PRINTS THE RESULT
::
++  EXPECT-EQ
  |=  [EXPECTED=VASE ACTUAL=VASE]
  ^-  TANG
  ::
  =|  RESULT=TANG
  ::
  =?  RESULT  !=(Q.EXPECTED Q.ACTUAL)
    %+  WELD  RESULT
    ^-  TANG
    :~  [%PALM [": " ~ ~ ~] [LEAF+"EXPECTED" (SELL EXPECTED) ~]]
        [%PALM [": " ~ ~ ~] [LEAF+"ACTUAL" (SELL ACTUAL) ~]]
    ==
  ::
  =?  RESULT  !(~(NEST UT P.ACTUAL) | P.EXPECTED)
    %+  WELD  RESULT
    ^-  TANG
    :~  :+  %PALM  [": " ~ ~ ~]
        :~  [%LEAF "FAILED TO NEST"]
            (~(DUNK UT P.ACTUAL) %ACTUAL)
            (~(DUNK UT P.EXPECTED) %EXPECTED)
    ==  ==
  RESULT
::  +EXPECT-FAIL: KICKS A TRAP, EXPECTING CRASH. PRETTY-PRINTS IF SUCCEEDS
::
++  EXPECT-FAIL
  |=  A=(TRAP)
  ^-  TANG
  =/  B  (MULE A)
  ?-  -.B
    %|  ~
    %&  [LEAF+"EXPECTED FAILURE - SUCCEEDED" ~]
  ==
::  +CATEGORY: PREPENDS A NAME TO AN ERROR RESULT; PASSES SUCCESSES UNCHANGED
::
++  CATEGORY
  |=  [A=TAPE B=TANG]  ^-  TANG
  ?:  =(~ B)  ~  :: TEST OK
  :-  LEAF+"IN: '{A}'"
  (TURN B |=(C=TANK ROSE+[~ "  " ~]^~[C]))
--
