#!/bin/bash

source lib/.env

USER_ID=${SMSC_USER_ID}
PASSWORD=${SMSC_PASSWORD}

TO_NUMBER=${SMSC_NUMBER}
SMSC_URL=${SMSC_URL:-"https://smsc.ru/sys/send.php"}

TO_NUMBER=$(echo "${TO_NUMBER}" | sed 's/[^0123456789]//g')

function sendMsg()
{
  local msgSubject=$1
  local msgBody=$2

  curl --get --silent --show-error \
    --data-urlencode "login=${USER_ID}" \
    --data-urlencode "psw=${PASSWORD}" \
    --data-urlencode "phones=${TO_NUMBER}" \
    --data-urlencode "mes=${msgSubject}:${msgBody}" \
    "${SMSC_URL}"
}
