:-  %say
|=  $:  [now=@da eny=@uvJ byk=beak]
        [sho=$@(@ud (list @p)) ~]
        ~
    ==
:-  %noun
::
=/  ships=(list @p)
  ?^  sho  sho
  =/  nums=(list @)  (gulf 1 sho)
  ::
  =/  gen-ship=$-(@ @p)
    ?:  =(%czar (clan:title p.byk))
      |=  id=@  ^-  @p
      (mix (lsh 3 1 id) p.byk) 
    ?:  =(%king (clan:title p.byk))
      |=  id=@  ^-  @p
      (mix (lsh 4 1 id) p.byk)
    !!
  (turn nums gen-ship)
::
%-  of-wain:format
^-  wain
%+  turn  ships
|=  her=@p
=/  tic=@p  .^(@p /a/(scot %p p.byk)/tick/(scot %da now)/(scot %p her))
(crip "{<her>},{<tic>}")
