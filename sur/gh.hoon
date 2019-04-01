::  HTTPS://DEVELOPER.GITHUB.COM/V3/
::
::  THESE TYPES CORRESPOND TO THE TYPES THAT GITHUB'S API
::  PRODUCES, SO PLEASE CHECK GITHUB'S DOCUMENTATION FOR
::  DETAILS.
::
::  FOR PARSING JSON INTO THESE TYPES, CHECK OUT THE GH-PARSE
::  LIBRARY.
::
|%
++  REPOSITORY
  $:  ID/ID
      NAME/@T
      FULL-NAME/@T
      OWNER/USER
      PRIVATE/?
      HTML-URL/@T
      DESCRIPTION/@T
      FORK/?
      URL/@T
      FORKS-URL/@T
      KEYS-URL/@T
      COLLABORATORS-URL/@T
      TEAMS-URL/@T
      HOOKS-URL/@T
      ISSUE-EVENTS-URL/@T
      EVENTS-URL/@T
      ASSIGNEES-URL/@T
      BRANCHES-URL/@T
      TAGS-URL/@T
      BLOBS-URL/@T
      GIT-TAGS-URL/@T
      GIT-REFS-URL/@T
      TREES-URL/@T
      STATUSES-URL/@T
      LANGUAGES-URL/@T
      STARGAZERS-URL/@T
      CONTRIBUTORS-URL/@T
      SUBSCRIBERS-URL/@T
      SUBSCRIPTION-URL/@T
      COMMITS-URL/@T
      GIT-COMMITS-URL/@T
      COMMENTS-URL/@T
      ISSUE-COMMENT-URL/@T
      CONTENTS-URL/@T
      COMPARE-URL/@T
      MERGES-URL/@T
      ARCHIVE-URL/@T
      DOWNLOADS-URL/@T
      ISSUES-URLS/@T
      PULLS-URL/@T
      MILESTONES-URL/@T
      NOTIFICATIONS-URL/@T
      LABELS-URL/@T
      RELEASES-URL/@T
      CREATED-AT/TIME
      UPDATED-AT/TIME
      PUSHED-AT/TIME
      GIT-URL/@T
      SSH-URL/@T
      CLONE-URL/@T
      SVN-URL/@T
      HOMEPAGE/JSON
      SIZE/@UD
      STARGAZERS-COUNT/@UD
      WATCHERS-COUNT/@UD
      LANGUAGE/JSON
      HAS-ISSUES/?
      HAS-DOWNLOADS/?
      HAS-WIKI/?
      HAS-PAGES/?
      FORKS-COUNT/@UD
      MIRROR-URL/JSON
      OPEN-ISSUES-COUNT/@UD
      FORKS/@UD
      OPEN-ISSUES/@UD
      WATCHERS/@UD
      DEFAULT-BRANCH/@T
  ==
++  COMMIT
  $:  SHA/@T
      URL/@T
      AUTHOR/AUTHOR
      COMMITTER/AUTHOR
      MESSAGE/@T
      TREE/POINT
      PARENTS/(LIST POINT)
      VERIFICATION/VERIFICATION
  ==
++  USER
  $:  LOGIN/@T
      ID/ID
      AVATAR-URL/@T
      GRAVATAR-ID/@T
      URL/@T
      HTML-URL/@T
      FOLLOWERS-URL/@T
      FOLLOWING-URL/@T
      GISTS-URL/@T
      STARRED-URL/@T
      SUBSCRIPTIONS-URL/@T
      ORGANIZATIONS-URL/@T
      REPOS-URL/@T
      EVENTS-URL/@T
      RECEIVED-EVENTS/@T
      TYPE/@T
      SITE-ADMIN/?
  ==
++  ISSUE
  $:  RAW/JSON
      URL/@T
      LABELS-URL/@T
      COMMENTS-URL/@T
      EVENTS-URL/@T
      HTML-URL/@T
      ID/ID
      NUMBER/@UD
      TITLE/@T
      USER/USER
      LABELS/(LIST LABEL)
      STATE/@T
      LOCKED/?
      ASSIGNEE/(UNIT USER)
      MILESTONE/JSON
      COMMENTS/@UD
      CREATED-AT/TIME
      UPDATED-AT/TIME
      CLOSED-AT/(UNIT TIME)
      BODY/@T
  ==
++  AUTHOR
  $:  DATE/@T
      NAME/@T
      EMAIL/@T
  ==
++  POINT
  $:  URL/@T
      SHA/@T
  ==
++  VERIFICATION
  $:  VERIFIED/?
      REASON/@T
      SIGNATURE/(UNIT @T)
      PAYLOAD/(UNIT @T)
  ==
++  LABEL
  $:  URL/@T
      NAME/@T
      COLOR/@T
  ==
++  COMMENT
  $:  URL/@T
      HTML-URL/@T
      ISSUE-URL/@T
      ID/ID
      USER/USER
      CREATED-AT/TIME
      UPDATED-AT/TIME
      BODY/@T
  ==
++  ID  @T
++  TIME  @T
++  ISSUES
  $:  REPOSITORY/REPOSITORY
      SENDER/USER
      $=  ACTION
      $%  {$ASSIGNED ASSIGNEE/USER}
          {$UNASSIGNED ASSIGNEE/USER}
          {$LABELED LABEL/LABEL}
          {$UNLABELED LABEL/LABEL}
          {$OPENED ~}
          {$CLOSED ~}
          {$REOPENED ~}
      ==
      ISSUE/ISSUE
  ==
++  ISSUE-COMMENT
  $:  REPOSITORY/REPOSITORY
      SENDER/USER
      ACTION/@T
      ISSUE/ISSUE
      COMMENT/COMMENT
  ==
++  PING   {REPO/JSON SENDER/JSON HOK/(LIST @T) HOOK-ID/@T ZEN/JSON}
--
