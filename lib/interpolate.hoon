::   /FOO/:BAR/BAZ INTERPOLATION SYNTAX
::
::::  /HOON/INTERPOLATE/LIB
  ::
/?    310
::
::::  ~FYR
  ::
=,  EYRE
|%
++  PARSE-URL
  |=  A/$@(CORD:PURL PURL)  ^-  PURL
  ?^  A  A
  ~|  BAD-URL+A
  (RASH A AURI:DE-PURL:HTML)
::
++  ADD-QUERY
  |=  {A/$@(@T PURL) B/QUAY}  ^-  PURL
  ?@  A  $(A (PARSE-URL A))  :: DEAL WITH CORD
  A(R (WELD R.A B))
::
++  INTO-URL
  |=  {A/$@(CORD PURL) B/(UNIT HART) C/(LIST (PAIR TERM KNOT))}
  ^-  PURL
  ?@  A  $(A (PARSE-URL A))  :: DEAL WITH CORD
  %_  A
    P    ?^(B U.B P.A)
    Q.Q  (INTO-PATH Q.Q.A C)
  ==
::
++  INTO-PATH    ::  [/A/:B/C [%B 'FOO']~] -> /A/FOO/C
  =+  REPLACABLE=|=(A/KNOT `(UNIT TERM)`(RUSH A ;~(PFIX COL SYM)))
  |=  {A/PATH B/(LIST (PAIR TERM KNOT))}  ^-  PATH
  ?~  A  ?~(B ~ ~|(UNUSED-VALUES+B !!))
  =+  (REPLACABLE I.A)
  ?~  -  [I.A $(A T.A)]  ::  LITERAL VALUE
  ?~  B  ~|(NO-VALUE+U !!)
  ?.  =(U P.I.B)  ~|(MISMATCH+[U P.I.B] !!)
  [Q.I.B $(A T.A, B T.B)]
::
++  INTO-PATH-PARTIAL  ::  [/A/:B/C [D+'BAR' B+'FOO']~] -> [/A/FOO/C [D+'BAR']~]
  |=  {PAX/PATH QUY/QUAY}  ^-  {PATH QUAY}
  =+  ^=  INLINE                                        ::  REQUIRED NAMES
      %-  ~(GAS IN *(SET TERM))
      (MURN PAX REPLACABLE:INTO-PATH)
  =^  INTER  QUY
    (SKID QUY |=({A/KNOT @} (~(HAS IN INLINE) A)))
  [(INTO-PATH PAX INTER) QUY]
--
