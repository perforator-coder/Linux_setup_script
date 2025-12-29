# <h1 align="center"> Linux_setup_script </h1>

<h1 align="center">! ветка для тестирования!</h1>

Простой скрип для настройки linux дистрибутивов.

СКРИПТ МОЖЕТ НЕ РАБОТАТЬ В НЕКОТОРЫХ МЕСТАХ.

Скрипт является просто первой попыткой в программировании.

Первая версия была написана примерно 2021 - 2022 году.

Он поможит настроить Arch linux/EndeavourOS/OpenSUSE Tumbleweed(Старый, не тестированый код)/Ubuntu.

**Изменения**

Изменения:28.12.25

 *В скрипте*
 
  Нет изменений

 *Что изменено*

 (arch)

 Небольшие изменения в установке plymoutch

 Проверка работы plymoutch после пересборки ядра 
 ~~(я все ещё не доверяю dracut)~~  

Изменения:29.12.25

*В скрипте:*

Нет изменений

*Что добавлено:*

(ubuntu)

Добавлена установка zram-generator

**Зависимости:**

fastfetch
lsb-release

**Использование:**

 `cd Linux_setup_script`

 `bash ./setup.sh` --- С использованием lsb_release.

 `bash ./setup.sh -f` или `--fastfetch` --- Использованием 
 fastfetch.
 
 `bash ./setup.sh -fsDE` или `--fastfetch-set-DE`  --- установить вручную DE остальное через fastfetch.
 
 `bash ./setup.sh -lsbsDE` или `--lsb-release-set-DE` 
 
 `bash ./setup.sh -fsDE -g`или для gnome `-gnome` 
 `-k`или `-kde` --- установить kde или gnome соответственно.
