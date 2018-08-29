/+  tester
=,  ford
=,  tester:tester
|%
++  expect-schematic
  |=  [expected=schematic actual=vase]
  ^-  tang
  ::
  ?^    -.expected
    ::  specialize :actual's type to be an autocons
    ::
    =.  actual
      %+  slap  actual
      ^-  hoon
      :+  %wtbn
        [%wtts [%base %cell] [%& 2]~]
      [%wing [%& 1]~]
    ::
    %+  weld
      $(expected -.expected, actual (slap actual [%limb %head]))
    $(expected +.expected, actual (slap actual [%limb %tail]))
  ::
  =.  actual  (specialize-by-tag -.expected actual)
  ::
  ?-    -.expected
      %$
    ::
    %+  weld
      %-  expect-eq
      %+  slop
        [[%atom %tas ~] p.literal.expected]
      (slap actual [%wing ~[%p %literal]])
    ::
    %-  expect-eq
    %+  slop
      q.literal.expected
    ((hard vase) q:(slap actual [%wing ~[%q %literal]]))
  ::
      %pin
    ::
    %+  weld
      %-  expect-eq
      %+  slop
        [[%atom %da ~] date.expected]
      (slap actual [%limb %date])
    ::
    $(expected schematic.expected, actual (slap actual [%limb %schematic]))
  ::
      %alts
    =.  actual  (slap actual [%limb %choices])
    ::
    =|  res=tang
    |-  ^+  res
    ?~  choices.expected
      ::  make sure there aren't any extra :choices in :actual
      ::
      =.  actual
        %+  slap  actual
        ^-  hoon
        :+  %wtbn
          [%wtts [%base %null] [%& 1]~]
        [%wing [%& 1]~]
      ::  no more choices; produce any errors we got
      ::
      res
    ::  :expected isn't empty yet; make sure :actual isn't either
    ::
    =.  actual
      %+  slap  actual
      ::  ?<  ?=(~ actual)  actual
      ::
      ^-  hoon
      :+  %wtld
        [%wtts [%base %null] [%& 1]~]
      [%wing [%& 1]~]
    ::  recurse on the first sub-schematic
    ::
    =.  res
      %+  weld  res
      ^$(expected i.choices.expected, actual (slap actual [%limb %i]))
    ::  recurse on the rest of the sub-schematics
    ::
    $(choices.expected t.choices.expected, actual (slap actual [%limb %t]))
  ::
      %bake
    ::
    %-  expect-eq
    =-  (slop - actual)
    ^-  vase
    :_  [renderer query-string path-to-render]:expected
    ^-  type
    :+  %cell
      [%face %renderer [%atom %tas ~]]
    :+  %cell
      [%face %query-string -:!>(*coin)]
    [%face %path-to-render -:!>(*rail)]
  ::
      %bunt
    ::
    %-  expect-eq
    =-  (slop - actual)
    ^-  vase
    :_  [disc mark]:expected
    ^-  type
    :+  %cell
      [%face %disc -:!>(*disc)]
    [%face %mark -:!>(*term)]
  ::
      %call
    %+  weld
      $(expected gate.expected, actual (slap actual [%limb %gate]))
    $(expected sample.expected, actual (slap actual [%limb %sample]))
  ::
      %cast
    ;:  weld
      %-  expect-eq
      %+  slop
        [-:!>(*disc) disc.expected]
      (slap actual [%limb %disc])
    ::
      %-  expect-eq
      %+  slop
        [-:!>(*term) mark.expected]
      (slap actual [%limb %mark])
    ::
      $(expected input.expected, actual (slap actual [%limb %input]))
    ==
  ::
      %core
    %-  expect-eq
    %+  slop
      [-:!>(*rail) source-path.expected]
    (slap actual [%limb %source-path])
  ::
      %list
    =.  actual  (slap actual [%limb %schematics])
    ::
    =/  schematics  schematics.expected
    ::
    =|  res=tang
    |-  ^+  res
    ?~  schematics
      ::  make sure there aren't any extra :choices in :actual
      ::
      =.  actual
        %+  slap  actual
        ^-  hoon
        :+  %wtbn
          [%wtts [%base %null] [%& 1]~]
        [%wing [%& 1]~]
      ::  no more choices; produce any errors we got
      ::
      res
    ::  :expected isn't empty yet; make sure :actual isn't either
    ::
    =.  actual
      %+  slap  actual
      ::  ?<  ?=(~ actual)  actual
      ::
      ^-  hoon
      :+  %wtld
        [%wtts [%base %null] [%& 1]~]
      [%wing [%& 1]~]
    ::  recurse on the first sub-schematic
    ::
    =.  res
      %+  weld  res
      ^$(expected i.schematics, actual (slap actual [%limb %i]))
    ::  recurse on the rest of the sub-schematics
    ::
    $(schematics t.schematics, actual (slap actual [%limb %t]))
  ::
      %path
    %-  expect-eq
    %-  slop
    ::
    :_  %+  slap  actual
        [%cnls [%limb %disc] [%limb %prefix] [%limb %raw-path]]
    ::
    ^-  vase
    :_  [disc prefix raw-path]:expected
    ^-  type
    :+  %cell
      [%face %disc -:!>(*disc)]
    :+  %cell
      [%face %prefix [%atom %tas ~]]
    [%face %raw-path [%atom %tas ~]]
  ::
      *  !!
  ==
::  +specialize-by-tag: specialize a $% vase's type to a particular :tag
::
::    Vase equivalent of:
::
::    ```
::    ?>  ?=(<tag> -.value)  value
::    ```
::
++  specialize-by-tag
  |=  [tag=@tas =vase]
  ^+  vase
  ::
  %+  slap  vase
  ^-  hoon
  :+  %wtbn
    [%wtts [%leaf %tas tag] [%& 2]~]
  [%wing [%& 1]~]
--
