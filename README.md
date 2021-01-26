# Мониторинг ZFS-систем

- zfs-checker-teams.sh - мониторинг состояния и отправка через MS Teams
- zfs-checker-telegram.sh - мониторинг состояния и отправка через Telegram
- zfs-checker-slack.sh - мониторинг состояния и отправка через Slack
- zfs-checker-smsc.sh - мониторинг состояния и отправка через SMSC

## Использование
- git clone <url> - себе в `/opt` например
- запускаем первый раз `./zfs-checker.sh` без параметров, он создаст в подпапке файлик `.env`, в которым необходимо настроить нужный вам провайдер
- далее в крон забиваем чек каждый час например
  - 30 * * * * /opt/folder/zfs-checker.sh --<key> --<debug>
- где <key> - один из провайдеров
- а <debug> - будет отправлять ОК, если все хорошо так же каждый час

## Видео к курсу
- [видео]()
- [презентация]()

##### Автор
- **Vassiliy Yegorov** [vasyakrg](https://github.com/vasyakrg)
- [сайт](https://vk.com/realmanual)
- [youtube](https://youtube.com/realmanual)
