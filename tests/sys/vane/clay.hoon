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
  =^  results0  clay-gate
    %-  clay-call  :*
      clay-gate
      now=~1111.1.1
      scry=*sley
      call-args=[duct=~[/init] -:!>(*task:able:clay) [%init ~nul]]
      expected-moves=~
    ==
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
          :_  schematic.note
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
            duct=~[/info]
            -:!>(*sign:clay-gate)
            ^-  sign:clay-gate
            [%f %made ~1111.1.1 %complete %success %list ~]
        ==
      ^=  comparator
        |=  moves=(list move:clay-gate)
        ^-  tang
        ::
        ?.  ?=([* ~] moves)
          [%leaf "wrong number of moves: {<(lent moves)>}"]~
        ::
        =/  move=move:clay-gate                        i.moves
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
          (expect-eq !>(/mutating/~nul/home/~1111.1.1) !>(wire))
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
        :_  schematic.note
        ^-  schematic:ford
        [%pin ~1111.1.1 %list ~]
    ==
  ::
  =^  results3  clay-gate
    %-  clay-take  :*
      clay-gate
      now=~3333.3.3
      scry=*sley
      ^=  take-args
        :*  wire=/mutating/~nul/home/~1111.1.1
            duct=~[/info]
            -:!>(*sign:clay-gate)
            ^-  sign:clay-gate
            [%f %made ~1111.1.1 %complete %success %list ~]
        ==
      expected-moves=~
    ==
  ::
  =^  results4  clay-gate
    %-  clay-take  :*
      clay-gate
      now=~4444.4.4
      scry=*sley
      ^=  take-args
        :*  wire=/diffing/~nul/home/~1111.1.1
            duct=~[/info]
            -:!>(*sign:clay-gate)
            ^-  sign:clay-gate
            [%f %made ~1111.1.1 %complete %success %list ~]
        ==
      expected-moves=~
    ==
  ::
  =^  results5  clay-gate
    %-  clay-take-with-comparator  :*
      clay-gate
      now=~5555.5.5
      scry=*sley
      ^=  take-args
        :*  wire=/inserting/~nul/home/~1111.1.1
            duct=~[/info]
            -:!>(*sign:clay-gate)
            ^-  sign:clay-gate
            :*  %f  %made  ~1111.1.1  %complete  %success  %list
                ^-  (list build-result:ford)
                :~  :+  %success
                      [%success %$ %path -:!>(*path) /file1/noun]
                    [%success %cast %noun %noun 'file1']
                ::
                    :+  %success
                      [%success %$ %path -:!>(*path) /file2/noun]
                    [%success %cast %noun %noun 'file2']
        ==  ==  ==
      ^=  comparator
        |=  moves=(list move:clay-gate)
        ^-  tang
        ::
        ?.  ?=([* ~] moves)
          [%leaf "wrong number of moves: {<(lent moves)>}"]~
        ::
        =/  move=move:clay-gate                        i.moves
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
          (expect-eq !>(/patching/~nul/home) !>(wire))
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
        :_  schematic.note
        ^-  schematic:ford
        :-  %list
        ^-  (list schematic:ford)
        :~  :-  :^  %$  %path-hash  -:!>([*path *@uvI])
                :-  /file2/noun
                0vj.5f6kr.5o1of.dubnd.6k5a7.jprgp.8ifgp.0ljbi.dqau7.7c0q0.fj144
            ::
            [%volt [~nul %home] %noun 'file2']
        ::
            :-  :^  %$  %path-hash  -:!>([*path *@uvI])
                :-  /file1/noun
                0v1u.egg7f.h1o7a.22g2g.torgm.2kcfj.k8b3s.n5hlf.57i21.5m1nn.bhob7
            ::
            [%volt [~nul %home] %noun 'file1']
    ==  ==
  ::
  =^  results6  clay-gate
    %-  clay-take  :*
      clay-gate
      now=~6666.6.6
      scry=*sley
      ^=  take-args
        :*  wire=/patching/~nul/home
            duct=~[/info]
            -:!>(*sign:clay-gate)
            ^-  sign:clay-gate
            :*  %f  %made  ~1111.1.1  %complete  %success  %list
                ^-  (list build-result:ford)
                :~  :+  %success
                      :*  %success  %$  %path-hash  -:!>([*path *@uvI])
                          /file2/noun
                          0vj.5f6kr.5o1of.dubnd.6k5a7.jprgp.
                          8ifgp.0ljbi.dqau7.7c0q0.fj144
                      ==
                    [%success %volt %noun %noun 'file2']
                ::
                    :+  %success
                      :*  %success  %$  %path-hash  -:!>([*path *@uvI])
                          /file1/noun
                          0v1u.egg7f.h1o7a.22g2g.torgm.2kcfj.
                          k8b3s.n5hlf.57i21.5m1nn.bhob7
                      ==
                    [%success %volt %noun %noun 'file1']
        ==  ==  ==
      ^=  expected-moves
        :~  :*  duct=~[/init]  %give  %note  '+'  %rose
                ["/" "/" ~]
                :~  [%leaf "~nul"]
                    [%leaf "home"]
                    [%leaf "1"]
                    [%leaf "file1"]
                    [%leaf "noun"]
            ==  ==
        ::
            :*  duct=~[/init]  %give  %note  '+'  %rose
                ["/" "/" ~]
                :~  [%leaf "~nul"]
                    [%leaf "home"]
                    [%leaf "1"]
                    [%leaf "file2"]
                    [%leaf "noun"]
    ==  ==  ==  ==
  ::
  ;:  welp
    results0
    results1
    results2
    results3
    results4
    results5
    results6
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
          call-args=[=duct =type wrapped-task=(hobo task:able:clay)]
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
