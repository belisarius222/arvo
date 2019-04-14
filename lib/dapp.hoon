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
^-  app-core
|_  state=@ud
++  poke
  |=  =move
  ^-  [(list ^move) app-core]
  ::
  ~&  move
  `app-core(state +(state))
::
++  peek
  |=  =path
  ^-  (unit (unit [mark *]))
  ~
--
