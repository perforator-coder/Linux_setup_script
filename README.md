<div style="text-align: center;"> **Linux_setup_script** </div>

  <span style="color: red;">!Нестабильная и не тестированая ветка!</span>

Простой скрип для настройки linux дистрибутивов

СКРИПТ МОЖЕТ НЕ РАБОТАТЬ В НЕКОТОРЫХ МЕСТАХ

Скрипт является просто первой попыткой в программировании 

Первая версия была написана примерно 2021 - 2022 году

Он поможит настроить Arch linux/EndeavourOS/OpenSUSE Tumbleweed(Старый, не тестированый код)


   <div style="text-align: center;"> **Зависимости:** </div>

fastfetch
lsb-release

 <div style="text-align: center;"> Использование: </div>

cd Linux_setup_script

 `bash ./setup.sh` --- С использованием lsb_release

 `bash ./setup.sh -f` или `--fastfetch` --- Использованием 
 fastfetch
 
 `bash ./setup.sh -fsDE` или `--fastfetch-set-DE`  --- установить вручную DE остальное через fastfetch
 
 `bash ./setup.sh -lsbsDE` или `--lsb-release-set-DE` 
 
 `bash ./setup.sh -fsDE -g`или для gnome `-gnome` 
 `-k`или `-kde` --- установить kde или gnome соответственно
