::  |PILL: HELPER FUNCTIONS FOR MAKING PILLS
::
^?
|%
::  +MODULE-OVA: VANE LOAD OPERATIONS.
::
::    SYS: FULL PATH TO /SYS DIRECTORY
::
++  MODULE-OVA
  |=  SYS=PATH
  ^-  (LIST [WIRE [%VEER TERM PATH CORD]])
  %+  TURN
    ^-  (LIST (PAIR TERM PATH))
    :~  ::  SYS/ZUSE: STANDARD LIBRARY
        ::
        [%$ /ZUSE]
        ::  SYS/VANE/AMES: NETWORK
        ::
        [%A /VANE/AMES]
        ::  SYS/VANE/BEHN: TIMER
        ::
        [%B /VANE/BEHN]
        ::  SYS/VANE/CLAY: REVISION CONTROL
        ::
        [%C /VANE/CLAY]
        ::  SYS/VANE/DILL: CONSOLE
        ::
        [%D /VANE/DILL]
        ::  SYS/VANE/EYRE: WEB
        ::
        [%E /VANE/EYRE]
        ::  SYS/VANE/FORD: BUILD
        ::
        [%F /VANE/FORD]
        ::  SYS/VANE/GALL: APPLICATIONS
        ::
        [%G /VANE/GALL]
        ::  SYS/VANE/JAEL: SECURITY
        ::
        [%J /VANE/JAEL]
    ==
  |=  [=TERM =PATH]
  =/  PAX  (WELD SYS PATH)
  =/  TXT  .^(@ %CX (WELD PAX /HOON))
  [[%VANE PATH] [%VEER TERM PAX TXT]]
::  +FILE-OVUM: USERSPACE FILESYSTEM LOAD
::
::     BAS: FULL PATH TO / DIRECTORY
::
++  FILE-OVUM
  |=  BAS=PATH
  ^-  OVUM
  ::
  ::    /APP    %GALL APPLICATIONS
  ::    /GEN    :DOJO GENERATORS
  ::    /LIB    %FORD LIBRARIES
  ::    /MAR    %FORD MARKS
  ::    /REN    %FORD RENDERERS
  ::    /SEC    %EYRE SECURITY DRIVERS
  ::    /SUR    %FORD STRUCTURES
  ::    /SYS    SYSTEM FILES
  ::    /TESTS  UNIT TESTS
  ::    /WEB    %EYRE WEB CONTENT
  ::
  %.  [/APP /GEN /LIB /MAR /REN /SEC /SUR /SYS /TESTS /WEB ~]
  |=  ::  SAL: ALL SPURS TO LOAD FROM
      ::
      SAL/(LIST SPUR)
  ^-  OVUM
  ::
  ::  HAV: ALL USER FILES
  ::
  =;  HAV  ~&  USER-FILES+(LENT HAV)
           [[%$ %SYNC ~] [%INTO %$ & HAV]]
  =|  HAV/MODE:CLAY
  |-  ^+  HAV
  ?~  SAL  ~
  =.  HAV  $(SAL T.SAL)
  ::
  ::  TYL: SPUR
  ::
  =/  TYL  I.SAL
  |-  ^+  HAV
  ::
  ::  PAX: FULL PATH AT `TYL`
  ::  LON: DIRECTORY AT `TYL`
  ::
  =/  PAX  (WELD BAS (FLOP TYL))
  =/  LON  .^(ARCH %CY PAX)
  ::  XX THIS SERIALIZATION SHOULD USE MARKS
  ::
  =?  HAV  ?=(^ FIL.LON)
      ?.  ?=  ?($CSS $HOON $JS $JSON $MD $TXT $UDON $UMD)
          -.TYL
        ::
        ::  INSTALL ONLY FILES WITH WHITELISTED MARKS
        ::
        ~&  IGNORING+PAX
        HAV
      ::
      ::  COT: FILE AS PLAIN-TEXT OCTET-STREAM
      ::
      =;  COT  [[(FLOP `PATH`TYL) `[/TEXT/PLAIN COT]] HAV]
      ^-  OCTS
      ?-    TYL
          {$JSON *}
        =/  DAT  .^(JSON %CX PAX)
        (AS-OCTT:MIMES:HTML (EN-JSON:HTML DAT))
      ::
          {$TXT *}
        =/  DAT  .^(WAIN %CX PAX)
        (AS-OCTS:MIMES:HTML (OF-WAIN:FORMAT DAT))
      ::
          *
        =/  DAT  .^(@T %CX PAX)
        [(MET 3 DAT) DAT]
      ==
  =/  ALL  ~(TAP BY DIR.LON)
  |-  ^-  MODE:CLAY
  ?~  ALL  HAV
  $(ALL T.ALL, HAV ^$(TYL [P.I.ALL TYL]))
--
