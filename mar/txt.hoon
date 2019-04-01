::
::::  /HOON/TXT/MAR
  ::
/?    310
::
=,  CLAY
=,  DIFFER
=,  FORMAT
=,  MIMES:HTML
|_  TXT/WAIN
::
++  GRAB                                                ::  CONVERT FROM
  |%
  ++  MIME  |=({P/MITE:EYRE Q/OCTS:EYRE} (TO-WAIN Q.Q))
  ++  NOUN  WAIN                                        ::  CLAM FROM %NOUN
  --
++  GROW
  =>  V=.
  |%
  ++  MIME  =>  V  [/TEXT/PLAIN (AS-OCTS (OF-WAIN TXT))]
  ++  ELEM  =>  V  ;PRE: {(TRIP (OF-WAIN TXT))}
  --
++  GRAD
  |%
  ++  FORM  %TXT-DIFF
  ++  DIFF
    |=  TYT/WAIN
    ^-  (URGE CORD)
    (LUSK TXT TYT (LOSS TXT TYT))
  ::
  ++  PACT
    |=  DIF/(URGE CORD)
    ~|  [%PACTING DIF]
    ^-  WAIN
    (LURK TXT DIF)
  ::
  ++  JOIN
    |=  {ALI/(URGE CORD) BOB/(URGE CORD)}
    ^-  (UNIT (URGE CORD))
    |^
    =.  ALI  (CLEAN ALI)
    =.  BOB  (CLEAN BOB)
    |-  ^-  (UNIT (URGE CORD))
    ?~  ALI  `BOB
    ?~  BOB  `ALI
    ?-    -.I.ALI
        %&
      ?-    -.I.BOB
          %&
        ?:  =(P.I.ALI P.I.BOB)
          %+  BIND  $(ALI T.ALI, BOB T.BOB)
          |=(CUD/(URGE CORD) [I.ALI CUD])
        ?:  (GTH P.I.ALI P.I.BOB)
          %+  BIND  $(P.I.ALI (SUB P.I.ALI P.I.BOB), BOB T.BOB)
          |=(CUD/(URGE CORD) [I.BOB CUD])
        %+  BIND  $(ALI T.ALI, P.I.BOB (SUB P.I.BOB P.I.ALI))
        |=(CUD/(URGE CORD) [I.ALI CUD])
    ::
          %|
        ?:  =(P.I.ALI (LENT P.I.BOB))
          %+  BIND  $(ALI T.ALI, BOB T.BOB)
          |=(CUD/(URGE CORD) [I.BOB CUD])
        ?:  (GTH P.I.ALI (LENT P.I.BOB))
          %+  BIND  $(P.I.ALI (SUB P.I.ALI (LENT P.I.BOB)), BOB T.BOB)
          |=(CUD/(URGE CORD) [I.BOB CUD])
        ~
      ==
    ::
        %|
      ?-  -.I.BOB
          %|  ~
          %&
        ?:  =(P.I.BOB (LENT P.I.ALI))
          %+  BIND  $(ALI T.ALI, BOB T.BOB)
          |=(CUD/(URGE CORD) [I.ALI CUD])
        ?:  (GTH P.I.BOB (LENT P.I.ALI))
          %+  BIND  $(ALI T.ALI, P.I.BOB (SUB P.I.BOB (LENT P.I.ALI)))
          |=(CUD/(URGE CORD) [I.ALI CUD])
        ~
      ==
    ==
    ++  CLEAN                                          ::  CLEAN
      |=  WIG/(URGE CORD)
      ^-  (URGE CORD)
      ?~  WIG  ~
      ?~  T.WIG  WIG
      ?:  ?=(%& -.I.WIG)
        ?:  ?=(%& -.I.T.WIG)
          $(WIG [[%& (ADD P.I.WIG P.I.T.WIG)] T.T.WIG])
        [I.WIG $(WIG T.WIG)]
      ?:  ?=(%| -.I.T.WIG)
        $(WIG [[%| (WELP P.I.WIG P.I.T.WIG) (WELP Q.I.WIG Q.I.T.WIG)] T.T.WIG])
      [I.WIG $(WIG T.WIG)]
    --
  ::
  ++  MASH
    |=  $:  {ALS/SHIP ALD/DESK ALI/(URGE CORD)}
            {BOS/SHIP BOD/DESK BOB/(URGE CORD)}
        ==
    ^-  (URGE CORD)
    |^
    =.  ALI  (CLEAN ALI)
    =.  BOB  (CLEAN BOB)
    |-  ^-  (URGE CORD)
    ?~  ALI  BOB
    ?~  BOB  ALI
    ?-    -.I.ALI
        %&
      ?-    -.I.BOB
          %&
        ?:  =(P.I.ALI P.I.BOB)
          [I.ALI $(ALI T.ALI, BOB T.BOB)]
        ?:  (GTH P.I.ALI P.I.BOB)
          [I.BOB $(P.I.ALI (SUB P.I.ALI P.I.BOB), BOB T.BOB)]
        [I.ALI $(ALI T.ALI, P.I.BOB (SUB P.I.BOB P.I.ALI))]
      ::
          %|
        ?:  =(P.I.ALI (LENT P.I.BOB))
          [I.BOB $(ALI T.ALI, BOB T.BOB)]
        ?:  (GTH P.I.ALI (LENT P.I.BOB))
          [I.BOB $(P.I.ALI (SUB P.I.ALI (LENT P.I.BOB)), BOB T.BOB)]
        =+  ^-  {FIC/(UNCE CORD) ALI/(URGE CORD) BOB/(URGE CORD)}
            (RESOLVE ALI BOB)
        [FIC $(ALI ALI, BOB BOB)]
        ::  ~   ::  HERE, ALICE IS GOOD FOR A WHILE, BUT NOT FOR THE WHOLE
      ==    ::  LENGTH OF BOB'S CHANGES
    ::
        %|
      ?-  -.I.BOB
          %|
        =+  ^-  {FIC/(UNCE CORD) ALI/(URGE CORD) BOB/(URGE CORD)}
            (RESOLVE ALI BOB)
        [FIC $(ALI ALI, BOB BOB)]
      ::
          %&
        ?:  =(P.I.BOB (LENT P.I.ALI))
          [I.ALI $(ALI T.ALI, BOB T.BOB)]
        ?:  (GTH P.I.BOB (LENT P.I.ALI))
          [I.ALI $(ALI T.ALI, P.I.BOB (SUB P.I.BOB (LENT P.I.ALI)))]
        =+  ^-  {FIC/(UNCE CORD) ALI/(URGE CORD) BOB/(URGE CORD)}
            (RESOLVE ALI BOB)
        [FIC $(ALI ALI, BOB BOB)]
      ==
    ==
    ::
    ++  ANNOTATE                                        ::  ANNOTATE CONFLICT
      |=  $:  ALI/(LIST @T)
              BOB/(LIST @T)
              BAS/(LIST @T)
          ==
      ^-  (LIST @T)
      %-  ZING
      ^-  (LIST (LIST @T))
      %-  FLOP
      ^-  (LIST (LIST @T))
      :-  :_  ~
          %^  CAT  3  '<<<<<<<<<<<<'
          %^  CAT  3  ' '
          %^  CAT  3  `@T`(SCOT %P BOS)
          %^  CAT  3  '/'
          BOD

      :-  BOB
      :-  ~['------------']
      :-  BAS
      :-  ~['++++++++++++']
      :-  ALI
      :-  :_  ~
          %^  CAT  3  '>>>>>>>>>>>>'
          %^  CAT  3  ' '
          %^  CAT  3  `@T`(SCOT %P ALS)
          %^  CAT  3  '/'
          ALD
      ~
    ::
    ++  CLEAN                                          ::  CLEAN
      |=  WIG/(URGE CORD)
      ^-  (URGE CORD)
      ?~  WIG  ~
      ?~  T.WIG  WIG
      ?:  ?=(%& -.I.WIG)
        ?:  ?=(%& -.I.T.WIG)
          $(WIG [[%& (ADD P.I.WIG P.I.T.WIG)] T.T.WIG])
        [I.WIG $(WIG T.WIG)]
      ?:  ?=(%| -.I.T.WIG)
        $(WIG [[%| (WELP P.I.WIG P.I.T.WIG) (WELP Q.I.WIG Q.I.T.WIG)] T.T.WIG])
      [I.WIG $(WIG T.WIG)]
    ::
    ++  RESOLVE
      |=  {ALI/(URGE CORD) BOB/(URGE CORD)}
      ^-  {FIC/{%| P/(LIST CORD) Q/(LIST CORD)} ALI/(URGE CORD) BOB/(URGE CORD)}
      =-  [[%| BAC (ANNOTATE ALC BOC BAC)] ALI BOB]
      |-  ^-  $:  $:  BAC/(LIST CORD)
                      ALC/(LIST CORD)
                      BOC/(LIST CORD)
                  ==
                  ALI/(URGE CORD)
                  BOB/(URGE CORD)
              ==
      ?~  ALI  [[~ ~ ~] ALI BOB]
      ?~  BOB  [[~ ~ ~] ALI BOB]
      ?-    -.I.ALI
          %&
        ?-    -.I.BOB
            %&  [[~ ~ ~] ALI BOB]                       ::  NO CONFLICT
            %|
          =+  LOB=(LENT P.I.BOB)
          ?:  =(LOB P.I.ALI)
            [[P.I.BOB P.I.BOB Q.I.BOB] T.ALI T.BOB]
          ?:  (LTH LOB P.I.ALI)
            [[P.I.BOB P.I.BOB Q.I.BOB] [[%& (SUB P.I.ALI LOB)] T.ALI] T.BOB]
          =+  WAT=(SCAG (SUB LOB P.I.ALI) P.I.BOB)
          =+  ^=  RES
              %=  $
                ALI  T.ALI
                BOB  [[%| (SCAG (SUB LOB P.I.ALI) P.I.BOB) ~] T.BOB]
              ==
          :*  :*  (WELP BAC.RES WAT)
                  (WELP ALC.RES WAT)
                  (WELP BOC.RES Q.I.BOB)
              ==
              ALI.RES
              BOB.RES
          ==
        ==
      ::
          %|
        ?-    -.I.BOB
            %&
          =+  LOA=(LENT P.I.ALI)
          ?:  =(LOA P.I.BOB)
            [[P.I.ALI Q.I.ALI P.I.ALI] T.ALI T.BOB]
          ?:  (LTH LOA P.I.BOB)
            [[P.I.ALI Q.I.ALI P.I.ALI] T.ALI [[%& (SUB P.I.BOB LOA)] T.BOB]]
          =+  WAT=(SLAG (SUB LOA P.I.BOB) P.I.ALI)
          =+  ^=  RES
              %=  $
                ALI  [[%| (SCAG (SUB LOA P.I.BOB) P.I.ALI) ~] T.ALI]
                BOB  T.BOB
              ==
          :*  :*  (WELP BAC.RES WAT)
                  (WELP ALC.RES Q.I.ALI)
                  (WELP BOC.RES WAT)
              ==
              ALI.RES
              BOB.RES
          ==
        ::
            %|
          =+  LOA=(LENT P.I.ALI)
          =+  LOB=(LENT P.I.BOB)
          ?:  =(LOA LOB)
            [[P.I.ALI Q.I.ALI Q.I.BOB] T.ALI T.BOB]
          =+  ^=  RES
              ?:  (GTH LOA LOB)
                $(ALI [[%| (SCAG (SUB LOA LOB) P.I.ALI) ~] T.ALI], BOB T.BOB)
              ~&  [%SCAGGING LOA=LOA PIBOB=P.I.BOB SLAG=(SCAG LOA P.I.BOB)]
              $(ALI T.ALI, BOB [[%| (SCAG (SUB LOB LOA) P.I.BOB) ~] T.BOB])
          :*  :*  (WELP BAC.RES ?:((GTH LOA LOB) P.I.BOB P.I.ALI))
                  (WELP ALC.RES Q.I.ALI)
                  (WELP BOC.RES Q.I.BOB)
              ==
              ALI.RES
              BOB.RES
          ==
        ==
      ==
    --
  --
--
