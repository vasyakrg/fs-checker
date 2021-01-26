#!/bin/bash

HOOKER=$1
DEBUG=$2

HOSTNAME=$(hostname)

[ ! -f lib/.env ] && {
  cp lib/.env.example .env
  echo "Please put valid data to <lib/.env>"
  exit 1
}

[ -z $HOOKER ] && {
  echo "<< === >>"
  echo "Usage: <./zfx-checker.sh> or <./mdadm-checker.sh> --<hooker>"
  echo "Hooker: <teams>, <slack>, <smsc>, <telegram>"
  echo "With debug send <--debug>"
  exit 1
}


case $HOOKER in
  "--teams")
    source lib/teams.sh
  ;;
  --slack)
    source lib/slack.sh
  ;;
  --smsc)
    source lib/.sh
  ;;
  --telegram)
    source lib/telegram.sh
  ;;
esac
