|%
++  spacify
  |=  a/tape
  ^-  tape
  ?~  a  ~
  %+  weld
    ?:  |(=('(' i.a) =(')' i.a))
      " {(trip i.a)} "
    "{(trip i.a)}"
  $(a t.a)
::
++  eat-word
  |=  a/tape
  =|  res/{w/tape r/tape}
  ::
  |-  ^+  res
  ?~  a  res
  ?:  =(' ' i.a)
    ?~  w.res
      $(a t.a, r.res t.a)
    res
  $(a t.a, w.res (weld w.res (trip i.a)), r.res t.a)
::
++  tokenize
  |=  a/tape
  =|  tokens/(list tape)
  =.  a  (spacify a)
  %-  flop
  |-  ^+  tokens
  =^  word  a  (eat-word a)
  ?~  word  tokens
  $(tokens [word tokens], a a)
  ::
::::  testing core
::
++  test
  |%
  ++  eq                                                ::  print on failure
    |=  {msg/@tas a/* b/*}
    ^-  {@tas @tas}
    ?.  =(a b)
      ~&  msg
      !!
    ok+msg
  ::
  ++  test-spacify
    ~&  %^  eq  %spacify-flex-banana
      (spacify "(flex (banana 2 3))")   
    " ( flex  ( banana 2 3 )  ) "
    %spacify-great-success
  ::
  ++  test-eat-word
    ~&  %^  eq  %eat-word-2-words
      (eat-word "schnozberry falafel")
    [w="schnozberry" r=" falafel"]
    ~&  %^  eq  %eat-word-leading-space
      (eat-word " falafel")
    [w="falafel" r=""]
    %eat-word-great-success
  ::
  ++  test-tokenize
    ~&  %^  eq  %tokenize-2-words
      (tokenize "schnozberry falafel")
    ~["schnozberry" "falafel"]
    ~&  %^  eq  %tokenize-lispy
      (tokenize "(add 2 2)")
    ~["(" "add" "2" "2" ")"]
    %tokenize-great-success
  --
--
