#!/bin/bash

source lib/main.sh

condition=$(/sbin/zpool status | egrep -i '(DEGRADED|FAULTED|OFFLINE|UNAVAIL|REMOVED|FAIL|DESTROYED|corrupt|cannot|unrecover)')

msgSubject="RAID Checker"
msgBody="Host: $HOSTNAME Zpool, Status: OK"

[[ ! -z ${condition} ]] && {
  msgBody=$condition
  sendMsg "$msgSubject" "$msgBody"
} || {
  [[ $DEBUG == "--debug" ]] && {
      echo $msgSubject
      echo $msgBody
      sendMsg "$msgSubject" "$msgBody"
    }
}
