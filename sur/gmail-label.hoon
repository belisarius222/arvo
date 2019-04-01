::  THIS STRUCTURE IS THE HOON EQUIVALENT OF THE LABELS RESOURCE USED BY THE
::  GMAIL API


|%
++  LABEL-LIST-VISIBILITY
  $?  $'LABELHIDE'            ::  DO NOT SHOW THE LABEL IN THE LABEL LIST
      $'LABELSHOW'            ::  SHOW THE LABEL IN THE LABEL LIST. (DEFAULT)
      $'LABELSHOWIFUNREAD'    ::  SHOW THE LABEL IF ANY UNREAD MSGS W/THAT LABEL.
  ==
++  MESSAGE-LIST-VISIBILITY
  $?  $HIDE                    ::  DO NOT SHOW THE LABEL IN THE MESSAGE LIST.
      $SHOW                    ::  SHOW THE LABEL IN THE MESSAGE LIST. (DEFAULT)
  ==
--

|%
::  LABEL REQUEST IS THE BODY OF THE POST REQUEST YOU SEND TO GMAIL TO CREATE
::  A LABELS RESOURCE
++  LABEL-REQ  {LLV/LABEL-LIST-VISIBILITY MLV/MESSAGE-LIST-VISIBILITY NAME/@T}

::  THE LABEL RESOURCE RETURNED BY GMAIL IN RESPONSE TO YOUR SUCCESSFUL REQUEST
++  LABEL  *

++  LABEL-REQ-TO-JSON  !!
::  XX BELONGS IN A LIB/
::   |=  LABEL-REQ
::   %-  JOBE  :^
::   ['NAME' `JSON`S+NAME]
::   ['LABELLISTVISIBILITY' `JSON`S+(CRIP (SIFO `CORD`LLV))]
::   ['MESSAGELISTVISIBILITY' `JSON`S+(CRIP (SIFO `CORD`MLV))]
::   ~
--
