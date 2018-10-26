:-  %say
|=  $:  [now=@da eny=@uvJ byk=beak]
        [num=@ ~]
        ~
    ==
:-  %noun
::
=/  nums=(list @)  (gulf 1 num)
::
=/  gen-ship=$-(@ @p)
  ?:  =(%czar (clan:title p.byk))
    |=  id=@  ^-  @p
    (mix (lsh 3 1 id) p.byk) 
  ?:  =(%king (clan:title p.byk))
    |=  id=@  ^-  @p
    (mix (lsh 4 1 id) p.byk)
  !!
::
%-  of-wain:format
^-  wain
%+  turn  nums
|=  idx=@
=/  her=@p  (gen-ship idx)
=/  tic=@p  .^(@p /a/(scot %p p.byk)/tick/(scot %da now)/(scot %p her))
(crip "{<her>},{<tic>}")
