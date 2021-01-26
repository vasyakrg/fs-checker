#!/bin/bash

source lib/.env
webhook=${TEAMS_WEBHOOK}

function sendMsg()
{
  local msgSubject=$1
  local msgBody=$2

  curl -s -X POST -H 'Content-Type: application/json' -d '{"text": "'"STATUS: $msgSubject\n $msgBody"'"}' $webhook
}
