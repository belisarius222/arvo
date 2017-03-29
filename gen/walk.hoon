::  "Hello world" sample generator
::
::::  /hoon/hello/gen
  ::
/?    310
::
::::
  ::
:-  %say
|=  *
=<  [%noun %walk]
|%
::
++  ap                                                  ::  twig engine
  |_  gen/twig
  ++  dock                                              ::  apply document
    |=  doc/cord
    |^  ^-  (unit twig)
        =/  rah  ^-  (each (pair term cord) cord)
                 (rash doc very)
        ?-(-.rah $& (rave p.rah), $| (graf p.rah))
    ::
    ++  graf                                            ::  apply general doc
      |=  doc/cord
      ^-  (unit twig)
      =-  ?^  q.dep  `[%help [doc ~] gen]
          `p.dep
      ^=  dep
      ^-  (pair twig (unit cord))
      %+  (walk (unit cord))
        `doc
      |=  {gen/twig vit/(unit cord)}
      ^-  (unit (pair twig (unit cord)))
      ::  XX stub
      ~
    ::
    ++  rave                                            ::  apply variable doc
      |=  {cog/term doc/cord}
      ^-  (unit twig)
      =-  ?^  q.dep  ~
          `p.dep
      ^=  dep
      ^-  (pair twig (unit (pair term cord)))
      %+  (walk (unit (pair term cord)))
        `[cog doc]
      |=  {gen/twig vit/(unit (pair term cord))}
      ^-  (unit (pair twig (unit (pair term cord))))
      ::  XX stub
      ~
    ::
    ++  very                                            ::  variable cord rule
      %+  pick
        ;~(plug sym (cook crip ;~(pfix ;~(plug col ace) (star prn))))
      (cook crip (star prn))
    --
  ::
  ++  walk                                              ::  forward traverse
    |*  life/mold
    |=  $:  vit/life
            mac/$-({twig life} (unit (pair twig life)))
        ==
    ^-  {twig life}
    =/  gun  (mac gen vit)
    ?^  gun  u.gun
    |^  ^-  {twig life}
        ?:  ?=(^ -.gen)
          %.(gen dubs)
        ?-  -.gen
          $$     (lead -.gen %.(+.gen noop))
          $base  (lead -.gen %.(+.gen noop))
          $bunt  (lead -.gen %.(+.gen expr))
          $bust  (lead -.gen %.(+.gen noop))
          $dbug  (lead -.gen %.(+.gen nexp))
          $hand  (lead -.gen %.(+.gen noop))
          $knit  (lead -.gen %.(+.gen (moto bark)))
          $leaf  (lead -.gen %.(+.gen noop))
          $limb  (lead -.gen %.(+.gen noop))
          $lost  (lead -.gen %.(+.gen expr))
          $rock  (lead -.gen %.(+.gen noop))
          $sand  (lead -.gen %.(+.gen noop))
          $tell  (lead -.gen %.(+.gen moar))
          $tune  (lead -.gen %.(+.gen tung))
          $wing  (lead -.gen %.(+.gen noop))
          $yell  (lead -.gen %.(+.gen moar))
          $claw  (lead -.gen %.(+.gen dubs))
          $shoe  (lead -.gen %.(+.gen expr))
          $bank  (lead -.gen %.(+.gen moar))
          $book  (lead -.gen %.(+.gen moar))
          $lamb  (lead -.gen %.(+.gen dubs))
          $bush  (lead -.gen %.(+.gen dubs))
          $pick  (lead -.gen %.(+.gen moar))
          $coat  (lead -.gen %.(+.gen nexp))
          $door  (lead -.gen %.(+.gen (twin expr arms)))
          $gasp  (lead -.gen %.(+.gen dubs))
          $core  (lead -.gen %.(+.gen arms)) 
          $trap  (lead -.gen %.(+.gen expr))
          $cork  (lead -.gen %.(+.gen (twin expr arms)))
          $loop  (lead -.gen %.(+.gen expr))
          $port  (lead -.gen %.(+.gen dubs))
          $gill  (lead -.gen %.(+.gen dubs))
          $gate  (lead -.gen %.(+.gen dubs))
          $tray  (lead -.gen %.(+.gen expr))
          $scon  (lead -.gen %.(+.gen dubs))
          $conq  (lead -.gen %.(+.gen (quad expr expr expr expr)))
          $cons  (lead -.gen %.(+.gen dubs))
          $cont  (lead -.gen %.(+.gen trey))
          $conl  (lead -.gen %.(+.gen moar))
          $conp  (lead -.gen %.(+.gen moar))
          $keep  (lead -.gen %.(+.gen (twin noop moan)))
          $lace  (lead -.gen %.(+.gen dubs))
          $call  (lead -.gen %.(+.gen (twin expr moar)))
          $bake  (lead -.gen %.(+.gen (trio noop expr moan)))
          $calq  (lead -.gen %.(+.gen (quad expr expr expr expr)))
          $calt  (lead -.gen %.(+.gen trey))
          $open  (lead -.gen %.(+.gen (trio noop expr moar)))
          $make  (lead -.gen %.(+.gen (twin noop moan)))
          $wish  (lead -.gen %.(+.gen dubs))
          $bump  (lead -.gen %.(+.gen expr))
          $nock  (lead -.gen %.(+.gen dubs))
          $same  (lead -.gen %.(+.gen dubs))
          $deep  (lead -.gen %.(+.gen expr))
          $iron  (lead -.gen %.(+.gen expr))
          $ward  (lead -.gen %.(+.gen dubs))
          $like  (lead -.gen %.(+.gen dubs))
          $cast  (lead -.gen %.(+.gen dubs))
          $zinc  (lead -.gen %.(+.gen expr))
          $burn  (lead -.gen %.(+.gen expr))
          $name  (lead -.gen %.(+.gen nexp))
          $lead  (lead -.gen %.(+.gen expr))
          $help  (lead -.gen %.(+.gen nexp))
          $show  (lead -.gen %.(+.gen dubs))
          $lurk  (lead -.gen %.(+.gen dubs))
          $crap  (lead -.gen %.(+.gen (raid expr)))
          $fast  (lead -.gen %.(+.gen (quad noop expr moan expr)))
          $funk  (lead -.gen %.(+.gen nexp))
          $thin  (lead -.gen %.(+.gen (twin toad expr)))
          $hint  (lead -.gen %.(+.gen (twin toad expr)))
          $poll  (lead -.gen %.(+.gen nexp))
          $memo  (lead -.gen %.(+.gen nexp))
          $dump  (lead -.gen %.(+.gen trip))
          $ddup  (lead -.gen %.(+.gen dubs))
          $warn  (lead -.gen %.(+.gen (quad noop expr expr expr)))
          $peep  (lead -.gen %.(+.gen dubs))
          $wad   (lead -.gen %.(+.gen (twin expr moar)))
          $nub   (lead -.gen %.(+.gen expr))
          $dip   (lead -.gen %.(+.gen (twin expr moar)))
          $fry   (lead -.gen %.(+.gen dubs))
          $new   (lead -.gen %.(+.gen dubs))
          $fix   (lead -.gen %.(+.gen (twin moan expr)))
          $var   (lead -.gen %.(+.gen (trio toad expr expr)))
          $rev   (lead -.gen %.(+.gen (trio toad expr expr)))
          $set   (lead -.gen %.(+.gen trip))
          $huh   (lead -.gen %.(+.gen (quad noop expr expr expr)))
          $rap   (lead -.gen %.(+.gen dubs))
          $nip   (lead -.gen %.(+.gen dubs))
          $per   (lead -.gen %.(+.gen dubs))
          $sip   (lead -.gen %.(+.gen (quad toad noop expr expr)))
          $pin   (lead -.gen %.(+.gen dubs))
          $tow   (lead -.gen %.(+.gen moar))
          $aka   (lead -.gen %.(+.gen trip))
          $use   (lead -.gen %.(+.gen dubs))
          $or    (lead -.gen %.(+.gen moar))
          $case  (lead -.gen %.(+.gen (twin noop (moto dubs))))
          $if    (lead -.gen %.(+.gen trey))
          $lest  (lead -.gen %.(+.gen trey))
          $ifcl  (lead -.gen %.(+.gen trip))
          $deny  (lead -.gen %.(+.gen dubs))
          $sure  (lead -.gen %.(+.gen dubs))
          $deft  (lead -.gen %.(+.gen (trio noop expr (moto dubs))))
          $and   (lead -.gen %.(+.gen moar))
          $ifat  (lead -.gen %.(+.gen trip))
          $ifno  (lead -.gen %.(+.gen trip))
          $fits  (lead -.gen %.(+.gen (twin expr noop)))
          $not   (lead -.gen %.(+.gen expr))
          $twig  (lead -.gen %.(+.gen dubs))
          $wrap  (lead -.gen %.(+.gen expr))
          $spit  (lead -.gen %.(+.gen dubs))
          $code  (lead -.gen %.(+.gen expr))
          $need  (lead -.gen %.(+.gen nexp))
          $fail  (lead -.gen %.(+.gen noop))
        ==
    ++  arms
      (raid (twin noop (raid (twin noop heel))))
    ::
    ++  bark 
      |=  wof/woof
      ?-(wof @ [wof vit], ^ (lead ~ (expr p.wof)))
    ::
    ++  dubs
      (twin expr expr)
    ::
    ++  expr
      |=  p/twig
      ^^$(gen p)
    ::
    ++  heel
      |=  bud/foot
      ?-  -.bud
        $ash  =^(nex vit ^^$(gen p.bud) [[%ash nex] vit])
        $elm  =^(nex vit ^^$(gen p.bud) [[%elm nex] vit])
      ==
    ::
    ++  lead
      |*  {sem/@tas out/{* life}}
      [[sem -.out] +.out]
    ::
    ++  moan
      (moto nexp)
    ::
    ++  moar
      (moto expr)
    ::
    ++  moto
      |*  etc/$-(* {* life})
      |*  bud/*
      ^+  [bud vit]
      ?:  =(~ bud)  [bud vit]
      =^  heb  vit  (etc -.bud)
      =^  mor  vit  $(bud +.bud)
      [[heb mor] vit]
    ::
    ++  nexp
      (twin noop expr)
    ::
    ++  noop
      |*  bud/*
      [bud vit]
    ::
    ++  quad
      |*  $:  one/$-(* {* life})
              two/$-(* {* life})
              tri/$-(* {* life})
              qua/$-(* {* life})
          ==
      |*  bud/*
      =^  yal  vit  (one -.bud)
      =^  ves  vit  (two +<.bud)
      =^  jot  vit  (tri +>-.bud)
      =^  wip  vit  (qua +>+.bud)
      [[yal ves jot wip] vit]
    ::
    ++  raid
      |*  etc/$-(* {* life})
      |*  bud/*
      ^+  [bud vit]
      ?:  =(~ bud)  [bud vit]
      =^  lef  vit  $(bud +<.bud)
      =^  ryt  vit  $(bud +>.bud)
      =^  top  vit  (etc ->.bud)
      [[[-<.bud top] lef ryt] vit]
    ::
    ++  trey
      (trio expr expr expr)
    ::
    ++  trio
      |*  {one/$-(* {* life}) two/$-(* {* life}) tri/$-(* {* life})}
      |*  bud/*
      =^  yal  vit  (one -.bud)
      =^  ves  vit  (two +<.bud)
      =^  jot  vit  (tri +>.bud)
      [[yal ves jot] vit]
    ::
    ++  trip
      (trio noop expr expr)
    ::
    ++  toad
      |=  bud/$@(term {p/term q/twig})
      ?@  bud  [bud vit]
      (lead p.bud (expr q.bud))
    ::
    ++  tung
      |=  bud/{p/wain q/$@(term tune)}
      ?@  q.bud  [bud vit]
      (lead p.bud %.(q.bud (twin (raid twee) (moto expr))))
    ::
    ++  twee
      |=  bud/(unit twig)
      ?~  bud  [~ vit]
      (lead ~ (expr u.bud))
    ::
    ++  twin
      |*  {one/$-(* {* life}) two/$-(* {* life})}
      |*  bud/*
      =^  yal  vit  (one -.bud)
      =^  ves  vit  (two +.bud)
      [[yal ves] vit]
    --
  --
--
