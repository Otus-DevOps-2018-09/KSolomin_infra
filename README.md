# KSolomin_infra
KSolomin Infra repository

Домашнее задание 3:

bastion_IP = 35.210.55.204
someinternalhost_IP = 10.132.0.3

1. Подключение к внутреннему хосту через Bastion в одну строчку:

ssh -A -tt appuser@35.210.55.204 ssh 10.132.0.3
или так:
ssh -o ProxyCommand='ssh -W %h:%p appuser@35.210.55.204' appuser@10.132.0.3

2. Подключение из консоли при помощи команды вида "ssh someinternalhost"
Так понимаю, нужно тоже использовать опцию ProxyCommand и ssh с ключом -W, но на этот раз указывать их в конфиге ssh. У меня получился такой файл:

cat ~/.ssh/config 
Host bastion
  HostName 35.210.55.204 
  User appuser
  ForwardAgent yes

Host someinternalhost
  HostName 10.132.0.3
  User appuser
  ProxyCommand ssh bastion -W %h:%p

Теперь подключаться можно проще:

ssh someinternalhost
Welcome to Ubuntu 16.04.5 LTS (GNU/Linux 4.15.0-1021-gcp x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

Get cloud support with Ubuntu Advantage Cloud Guest:
http://www.ubuntu.com/business/services/cloud
This system has been minimized by removing packages and content that are
not required on a system that users do not log into.

To restore this content, you can run the 'unminimize' command.

0 packages can be updated.
0 updates are security updates.

Last login: Fri Oct 12 19:30:40 2018 from 10.132.0.2
appuser@someinternalhost:~$

3. VPN поднят на bastion хосте. Подключиться к VPN можно используя файл конфигурации из репозитория. SSL сертификат от Let's Encrypt установлен на доменное имя "35.210.55.204.sslip.io", проверить можно обратившись к панели управления VPN по HTTPS:
https://35.210.55.204.sslip.io/#/