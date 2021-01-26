#!/bin/bash

source lib/main.sh

# condition=$(cat /proc/mdstat > /root/mdstat && egrep -c "\[.*_.*\]" /root/mdstat)
condition=1

msgSubject="RAID Checker"
msgBody="Host: $HOSTNAME Mdadm, Status: OK"

[[ ${condition} -ne 0 ]] && {
  msgBody="Mdadm degraded on $HOSTNAME, Status: Fault!"
  sendMsg "$msgSubject" "$msgBody"
} || {
  [[ $DEBUG == "--debug" ]] && {
      echo $msgSubject
      echo $msgBody
      sendMsg "$msgSubject" "$msgBody"
    }
}
