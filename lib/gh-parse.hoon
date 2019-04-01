::  THIS LIBRARY INCLUDES PARSING FUNCTIONS FOR THE JSON OBJECTS
::  THAT GITHUB'S API PRODUCES.  IN GENERAL, THE CONVERSION FROM
::  JSON TO URBIT TYPES SHOULD BE PERFORMED IN MARKS, SO THOSE
::  MARKS SHOULD INCLUDE THIS LIBRARY.
::
/-  GH
=,  FORMAT
|%
++  REPOSITORY
  ^-  $-(JSON (UNIT REPOSITORY:GH))
  =+  DEJS-SOFT
  %-  OT  :~
      'ID'^ID
      'NAME'^SO
      'FULL_NAME'^SO
      'OWNER'^USER
      'PRIVATE'^BO
      'HTML_URL'^SO
      'DESCRIPTION'^SO
      'FORK'^BO
      'URL'^SO
      'FORKS_URL'^SO
      'KEYS_URL'^SO
      'COLLABORATORS_URL'^SO
      'TEAMS_URL'^SO
      'HOOKS_URL'^SO
      'ISSUE_EVENTS_URL'^SO
      'EVENTS_URL'^SO
      'ASSIGNEES_URL'^SO
      'BRANCHES_URL'^SO
      'TAGS_URL'^SO
      'BLOBS_URL'^SO
      'GIT_TAGS_URL'^SO
      'GIT_REFS_URL'^SO
      'TREES_URL'^SO
      'STATUSES_URL'^SO
      'LANGUAGES_URL'^SO
      'STARGAZERS_URL'^SO
      'CONTRIBUTORS_URL'^SO
      'SUBSCRIBERS_URL'^SO
      'SUBSCRIPTION_URL'^SO
      'COMMITS_URL'^SO
      'GIT_COMMITS_URL'^SO
      'COMMENTS_URL'^SO
      'ISSUE_COMMENT_URL'^SO
      'CONTENTS_URL'^SO
      'COMPARE_URL'^SO
      'MERGES_URL'^SO
      'ARCHIVE_URL'^SO
      'DOWNLOADS_URL'^SO
      'ISSUES_URL'^SO
      'PULLS_URL'^SO
      'MILESTONES_URL'^SO
      'NOTIFICATIONS_URL'^SO
      'LABELS_URL'^SO
      'RELEASES_URL'^SO
      'CREATED_AT'^SO
      'UPDATED_AT'^SO
      'PUSHED_AT'^SO
      'GIT_URL'^SO
      'SSH_URL'^SO
      'CLONE_URL'^SO
      'SVN_URL'^SO
      'HOMEPAGE'^SOME
      'SIZE'^NI
      'STARGAZERS_COUNT'^NI
      'WATCHERS_COUNT'^NI
      'LANGUAGE'^SOME
      'HAS_ISSUES'^BO
      'HAS_DOWNLOADS'^BO
      'HAS_WIKI'^BO
      'HAS_PAGES'^BO
      'FORKS_COUNT'^NI
      'MIRROR_URL'^SOME
      'OPEN_ISSUES_COUNT'^NI
      'FORKS'^NI
      'OPEN_ISSUES'^NI
      'WATCHERS'^NI
      'DEFAULT_BRANCH'^SO
  ==
++  COMMIT
  ^-  $-(JSON (UNIT COMMIT:GH))
  =+  DEJS-SOFT
  %-  OT  :~
      'SHA'^SO
      'URL'^SO
      'AUTHOR'^AUTHOR
      'COMMITTER'^AUTHOR
      'MESSAGE'^SO
      'TREE'^POINT
      'PARENTS'^(AR POINT)
      'VERIFICATION'^VERIFICATION
  ==
++  USER
  ^-  $-(JSON (UNIT USER:GH))
  =+  DEJS-SOFT
  %-  OT  :~
      'LOGIN'^SO
      'ID'^ID
      'AVATAR_URL'^SO
      'GRAVATAR_ID'^SO
      'URL'^SO
      'HTML_URL'^SO
      'FOLLOWERS_URL'^SO
      'FOLLOWING_URL'^SO
      'GISTS_URL'^SO
      'STARRED_URL'^SO
      'SUBSCRIPTIONS_URL'^SO
      'ORGANIZATIONS_URL'^SO
      'REPOS_URL'^SO
      'EVENTS_URL'^SO
      'RECEIVED_EVENTS_URL'^SO
      'TYPE'^SO
      'SITE_ADMIN'^BO
  ==
++  ISSUE
  ^-  $-(JSON (UNIT ISSUE:GH))
  |=  JON/JSON
  =-  (BIND - |*(ISSUE/* `ISSUE:GH`[JON ISSUE]))
  %.  JON
  =+  DEJS-SOFT
  %-  OT  :~
      'URL'^SO
      'LABELS_URL'^SO
      'COMMENTS_URL'^SO
      'EVENTS_URL'^SO
      'HTML_URL'^SO
      'ID'^ID
      'NUMBER'^NI
      'TITLE'^SO
      'USER'^USER::|+(* (SOME *USER:GH))
      'LABELS'^(AR LABEL)::|+(* (SOME *(LIST LABEL:GH)))::(AR LABEL)
      'STATE'^SO
      'LOCKED'^BO
      'ASSIGNEE'^(MU USER)::|+(* (SOME *(UNIT USER:GH)))::(MU USER)
      'MILESTONE'^SOME
      'COMMENTS'^NI
      'CREATED_AT'^SO
      'UPDATED_AT'^SO
      'CLOSED_AT'^(MU SO)
      'BODY'^SO
  ==
++  AUTHOR
  ^-  $-(JSON (UNIT AUTHOR:GH))
  =+  DEJS-SOFT
  %-  OT  :~
      'DATE'^SO
      'NAME'^SO
      'EMAIL'^SO
  ==
++  POINT
  ^-  $-(JSON (UNIT POINT:GH))
  =+  DEJS-SOFT
  %-  OT  :~
      'URL'^SO
      'SHA'^SO
  ==
++  VERIFICATION
  ^-  $-(JSON (UNIT VERIFICATION:GH))
  =+  DEJS-SOFT
  %-  OT  :~
      'VERIFIED'^BO
      'REASON'^SO
      'SIGNATURE'^(MU SO)
      'PAYLOAD'^(MU SO)
  ==
++  LABEL
  ^-  $-(JSON (UNIT LABEL:GH))
  =+  DEJS-SOFT
  %-  OT  :~
      'URL'^SO
      'NAME'^SO
      'COLOR'^SO
  ==
++  COMMENT
  ^-  $-(JSON (UNIT COMMENT:GH))
  =+  DEJS-SOFT
  %-  OT  :~
      'URL'^SO
      'HTML_URL'^SO
      'ISSUE_URL'^SO
      'ID'^ID
      'USER'^USER
      'CREATED_AT'^SO
      'UPDATED_AT'^SO
      'BODY'^SO
  ==
++  ID  NO:DEJS-SOFT
++  PRINT-ISSUE
  |=  ISSUE:GH
  =,  FORMAT
  ^-  WAIN
  =+  C=(CURY CAT 3)
  :*  :(C 'TITLE: ' TITLE ' (#' (RSH 3 2 (SCOT %UI NUMBER)) ')')
      (C 'STATE: ' STATE)
      (C 'CREATOR: ' LOGIN.USER)
      (C 'CREATED-AT: ' CREATED-AT)
      (C 'ASSIGNEE: ' ?~(ASSIGNEE 'NONE' LOGIN.U.ASSIGNEE))
    ::
      %+  C  'LABELS: '
      ?~  LABELS  ''
      |-  ^-  @T
      ?~  T.LABELS  NAME.I.LABELS
      :(C NAME.I.T.LABELS ', ' $(T.LABELS T.T.LABELS))
    ::
      (C 'COMMENTS: ' (RSH 3 2 (SCOT %UI COMMENTS)))
      (C 'URL: ' URL)
      ''
      %+  TURN  (TO-WAIN BODY)  ::  STRIP CARRIAGE RETURNS
      |=  L/@T
      ?:  =('' L)
        L
      ?.  =('\0D' (RSH 3 (DEC (MET 3 L)) L))
        L
      (END 3 (DEC (MET 3 L)) L)
  ==
--
