# Мониторинг Raid-массивов на ZFS или MDadm

Провайдеры
- teams.sh - мониторинг состояния и отправка через MS Teams
- telegram.sh - мониторинг состояния и отправка через Telegram
- slack.sh - мониторинг состояния и отправка через Slack
- smsc.sh - мониторинг состояния и отправка через SMSC

## Использование
- git clone https://github.com/vasyakrg/fs-checker.git - себе в `/opt` например
- запускаем первый раз `./zfs-checker.sh` или `./mdadm-checker.sh` без параметров, он создаст в подпапке файлик `.env`, в которым необходимо настроить нужный вам провайдер
- далее в крон забиваем чек каждый час например
  - 30 * * * * /opt/folder/zfs-checker.sh `--<key>` `--<debug>`
  - 30 * * * * /opt/folder/mdadm-checker.sh `--<key>` `--<debug>`
- где `key` - один из провайдеров
- а `debug` - будет отправлять ОК, если все хорошо так же каждый час

## Видео к курсу
- [видео]()
- [презентация]()

##### Автор
- **Vassiliy Yegorov** [vasyakrg](https://github.com/vasyakrg)
- [сайт](https://vk.com/realmanual)
- [youtube](https://youtube.com/realmanual)
