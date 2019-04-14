|=  src=@t
::
=>  |%
    +$  move
      $%  [%foo @]
          [%bar ^]
      ==
    +$  app-core
      $_  ^?
      |%
      ++  poke  |=(move [(list move) app-core])
      ++  peek  |=(path (unit (unit [mark *])))
      --
    --
::
|_  apps=(map @tas app-core)
++  gall-core  .
::
++  install-app
  |=  [name=@tas source=@t]
  ^+  gall-core
  ::
  =/  eval-result=(each app-core tang)
    %-  mule  |.
    ~&  %compiling^name
    !*  *app-core  ..ride  (ream source)
  ::
  ?:  ?=(%| -.eval-result)
    %-  (slog p.eval-result)
    gall-core
  ::
  =.  apps  (~(put by apps) name p.eval-result)
  ::
  gall-core
--
