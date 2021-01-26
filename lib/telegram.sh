#!/bin/bash

source lib/.env
webhook=${TELEGRAM_WEBHOOK}
chat=${TELEGRAM_CHAT}

function sendMsg()
{
  local msgSubject=$1
  local msgBody=$2

  curl -s --header 'Content-Type: application/json' --request 'POST' --data "{\"chat_id\":\"${chat}\",\"text\":\"${msgSubject} ${msgBody}\"}" "https://api.telegram.org/bot${webhook}/sendMessage"
}
