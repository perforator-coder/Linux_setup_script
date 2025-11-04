# Linux_setup_script
# Заброшен на неизвестное время
Простой скрип для настройки linux дистрибутивов

СКРИПТ МОЖЕТ НЕ РАБОТАТЬ В НЕКОТОРЫХ МЕСТАХ

Скрипт является просто первой попыткой в программировании 

Первая версия была написана примерно 2021 - 2022 году

Он поможит настроить Arch linux/EndeavourOS/OpenSUSE Tumbleweed(Старый, не тестированый код)


# Зависимости
fastfetch
lsb-release

# Использование
 cd Linux_setup_script

 bash ./setup.sh --- С использованием lsb_release

 bash ./setup.sh -f или --fastfetch --- Использованием 
 fastfetch
 
 bash ./setup.sh -fsDE || --fastfetch-set-DE  --- установить вручную DE остальное через fastfetch
 
 bash ./setup.sh -lsbsDE || --lsb-release-set-DE 
 
 bash ./setup.sh -fsDE -g||-gnome||-k||-kde --- установить kde или gnome соответственно
