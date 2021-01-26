#!/bin/bash

HOOKER=$1
DEBUG=$2

[ ! -f lib/.env ] && {
  cp lib/.env.example .env
  echo "Please put valid data to <lib/.env>"
  exit 1
}

[ -z $HOOKER ] && {
  echo "Usage: ./checker --<hooker>"
  echo "Hooker: <teams>, <slack>, <smsc>, <telegram>"
  echo "With debug send --debug"
  exit 1
}

msgSubject="Host: `hostname` - ZFS pool - HEALTH checker"
msgBody="Status: OK"

case $HOOKER in
  "--teams")
    source lib/zfs-checker-teams.sh
  ;;
  --slack)
    source lib/zfs-checker-slack.sh
  ;;
  --smsc)
    source lib/zfs-checker-smsc.sh
  ;;
  --telegram)
    source lib/zfs-checker-telegram.sh
  ;;
esac

condition=$(/sbin/zpool status | egrep -i '(DEGRADED|FAULTED|OFFLINE|UNAVAIL|REMOVED|FAIL|DESTROYED|corrupt|cannot|unrecover)')

[[ ! -z ${condition} ]] && {
  msgSubject="Fault"
  msgBody=$condition
  sendMsg $msgSubject $msgBody
} || {
  [[ $DEBUG == "--debug" ]] && {
      echo $msgSubject
      echo $msgBody
      sendMsg $msgSubject $msgBody
    }
}
