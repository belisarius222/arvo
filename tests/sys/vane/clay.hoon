/+  *test, test-ford
::
/=  clay-raw  /:  /===/sys/vane/clay  /!noun/
::
!:
=,  format
::
=/  test-pit=vase  !>(..zuse)
=/  clay-gate  (clay-raw test-pit)
::
|%
++  test-info  ^-  tang
  ::
  =^  results1  clay-gate
    %-  clay-call-with-comparator  :*
      clay-gate
      now=~1111.1.1
      scry=*sley
      ^=  call-args
        :+  duct=~[/info]  type=-:!>(*task:able:clay)
        ^-  task:able:clay
        :^  %info  ~nul  %home
        ^-  nori:clay
        :-  %&
        ^-  soba:clay
        :~  [/file1/noun `miso:clay`[%ins [%noun %noun 'file1']]]
            [/file2/noun `miso:clay`[%ins [%noun %noun 'file2']]]
        ==
      ^=  move-comparator
        |=  moves=(list move:clay-gate)
        ^-  tang
        ::
        ?.  ?=([* * * ~] moves)
          [%leaf "wrong number of moves: {<(lent moves)>}"]~
        ::
        ^-  tang
        ;:  weld
          %+  expect-eq
            !>  ^-  move:clay-gate
                :-  duct=~[/info]
                ^-  (wind note:clay-gate gift:able:clay)
                :+  %pass  /castifying/~nul/home/~1111.1.1
                ^-  note:clay-gate
                :-  %f
                [%build ~nul live=%.n [%pin ~1111.1.1 [%list ~]]]
            !>  i.moves
        ::
          %+  expect-eq
            !>  ^-  move:clay-gate
                :-  duct=~[/info]
                ^-  (wind note:clay-gate gift:able:clay)
                :+  %pass  /diffing/~nul/home/~1111.1.1
                ^-  note:clay-gate
                :-  %f
                [%build ~nul live=%.n [%pin ~1111.1.1 [%list ~]]]
            !>  i.t.moves
        ::
          ^-  tang
          ::
          =/  move=move:clay-gate  i.t.t.moves
          =/  =duct                                      p.move
          =/  card=(wind note:clay-gate gift:able:clay)  q.move
          ::
          %+  weld
            (expect-eq !>(~[/info]) !>(duct))
          ::
          ?.  ?=(%pass -.card)
            [%leaf "bad move, not a %pass: {<move>}"]~
          ::
          =/  =wire  p.card
          ::
          %+  weld
            (expect-eq !>(/inserting/~nul/home/~1111.1.1) !>(wire))
          ::
          =/  note=note:clay-gate  q.card
          ::
          ?.  ?=([%f %build *] note)
            [%leaf "bad move, not a %build: {<move>}"]~
          ::
          %+  weld
            (expect-eq !>(~nul) !>(our.note))
          ::
          %+  weld
            (expect-eq !>(%.n) !>(live.note))
          ::
          %-  expect-schematic:test-ford
          :_  !>(schematic.note)
          ^-  schematic:ford
          :+  %pin  ~1111.1.1
          :-  %list
          :~  :-  [%$ %path -:!>(*path) /file1/noun]
              :^  %cast  [~nul %home]  %noun
              [%$ %noun %noun 'file1']
          ::
              :-  [%$ %path -:!>(*path) /file2/noun]
              :^  %cast  [~nul %home]  %noun
              [%$ %noun %noun 'file2']
          ==
    ==  ==
  ::
  =^  results2  clay-gate
    %-  clay-take-with-comparator  :*
      clay-gate
      now=~2222.2.2
      scry=*sley
      ^=  take-args
        :*  wire=/castifying/~nul/home/~1111.1.1
            duct=~[/info/]
            -:!>(*sign:clay-gate)
            ^-  sign:clay-gate
            [%f %made ~1111.1.1 %complete %success %list ~]
        ==
      ^=  comparator
        |=  moves=(list move:clay-gate)
        ^-  tang
        ~&  moves
        ~
    ==
  ::
  ;:  welp
    results1
    results2
  ==
::  |utilities: helper functions for testing
::
::    TODO: make these utilities generic for any vane
::
::+|  utilities
::
::  +clay-call: have clay run a +task and assert it produces :expected-moves7890
::
++  clay-call
  |=  $:  clay-gate=_clay-gate
          now=@da
          scry=sley
          call-args=[=duct =type wrapped-task=(hobo task:able:clay)]
          expected-moves=(list move:clay-gate)
      ==
  ^-  [tang _clay-gate]
  ::
  =/  clay-core  (clay-gate now=now eny=0xdead.beef scry=scry)
  ::
  =^  moves  clay-gate  (call:clay-core call-args)
  ::
  =/  output=tang
    %+  expect-eq
      !>  expected-moves
      !>  moves
  ::
  [output clay-gate]
::  +clay-call-with-comparator: run a clay +task and test output moves
::
++  clay-call-with-comparator
  |=  $:  clay-gate=_clay-gate
          now=@da
          scry=sley
          take-args=[=duct =type wrapped-task=(hobo task:able:clay)]
          move-comparator=$-((list move:clay-gate) tang)
      ==
  ^-  [tang _clay-gate]
  ::
  =/  clay-core  (clay-gate now=now eny=0xdead.beef scry=scry)
  ::
  =^  moves  clay-gate  (call:clay-core call-args)
  ::
  =/  output=tang  (move-comparator moves)
  ::
  [output clay-gate]
::  +clay-take: have clay receive a +note and assert output moves
::
++  clay-take
  |=  $:  clay-gate=_clay-gate
          now=@da
          scry=sley
          take-args=[=wire =duct wrapped-sign=(hypo sign:clay-gate)]
          expected-moves=(list move:clay-gate)
      ==
  ^-  [tang _clay-gate]
  ::
  =/  clay-core  (clay-gate now=now eny=0xdead.beef scry=scry)
  ::
  =^  moves  clay-gate  (take:clay-core take-args)
  ::
  =/  output=tang
    %+  expect-eq
      !>  expected-moves
      !>  moves
  ::
  [output clay-gate]
::  +clay-take-with-comparator: have clay receive a +note and test output moves
::
++  clay-take-with-comparator
  |=  $:  clay-gate=_clay-gate
          now=@da
          scry=sley
          take-args=[=wire =duct wrapped-sign=(hypo sign:clay-gate)]
          move-comparator=$-((list move:clay-gate) tang)
      ==
  ^-  [tang _clay-gate]
  ::
  =/  clay-core  (clay-gate now=now eny=0xdead.beef scry=scry)
  ::
  =^  moves  clay-gate  (take:clay-core take-args)
  ::
  =/  output=tang  (move-comparator moves)
  ::
  [output clay-gate]
--
