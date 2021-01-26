#!/bin/bash

source lib/.env

webhook=${SLACK_WEBHOOK}
TO=${SLACK_TO}
ICON=${SLACK_ICON}

function sendMsg()
{
  local msgSubject=$1
  local msgBody=$2

  curl -X POST --data-urlencode "payload={\"channel\": \"$TO\", \"username\": \"TradeNarK\", \"text\": \"$ICON $msgSubject\n$msgBody\"}" $webhook
}
