/?  310
|_  [HED=MARL TAL=MARL]
++  GROW
  |%
  ++  MIME
    =<  MIME
    |%
    ++  ELEM  ;DIV:(H1:"*{HED}" DIV:"*{TAL}")           ::  CONVERT TO %ELEM
    ++  HYMN  ;HTML:(HEAD:TITLE:"SNIP" BODY:"+{ELEM}")  ::  CONVERT TO %HYMN
    ++  HTML  (CRIP (EN-XML:^HTML HYMN))                      ::  CONVERT TO %HTML
    ++  MIME  [/TEXT/HTML (AS-OCTS:MIMES:^HTML HTML)]               ::  CONVERT TO %MIME
    --
  ++  COLLECTIONS-SNIP  [HED TAL]
  --
::
++  GRAB
  |%
  +$  NOUN  [MARL MARL]
  --
--

