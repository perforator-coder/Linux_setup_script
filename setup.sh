#!/bin/bash
# изменение 04.11.25 :
#	(В работе скрипта)
# Добавлены переменые для ручного выбора DE 
# чтобы выбрать -lsbsDE -g ----gnome c lsb
# -fsDE -k -----kde с fastfetch
#   (Arch Linux)
# Список пакетов переписан в масивы смотрите в massAppList
# Удален вопрос на перезагрузку в установке flatpak  
#   (endeavoirOS)
# Список пакетов переписан в масивы смотрите в massAppList
# 
#
#	(Opensuse Tumbleweed) (Код заброшен)
# Изменений нет 
# !!!!скрипт может быть не рабочим в некоторых местах!!!!
# в планах: 
# добавить подержку ubuntu или linux mint	


#vers
ver="V2.3_04.11"
ser="testing"
#vers

#petemen
case $1 in 
	-fsDE|--fastfetch-set-DE)
			case $2 in
			-g|--gnome)
				#OS_fastfetch
				function my_os {
				fastfetch | grep -ohm1 "EndeavourOS\|openSUSE Tumbleweed\|Arch Linux"
				}
				OS=$(my_os)
				#OS_fastfetch
				DE=GNOME

				#fastfetch
				OS_info="fastfetch"
				#fastfetch
				;;
			-k|--kde)
				#OS_fastfetch
				function my_os {
				fastfetch | grep -ohm1 "EndeavourOS\|openSUSE Tumbleweed\|Arch Linux"
				}
				OS=$(my_os)
				#OS_fastfetch
				DE=KDE

				#fastfetch
				OS_info="fastfetch"
				#fastfetch
				;;
			*)
				echo "Ошибка должен быть 2-й параметр с DE"
				exit
				;;
			esac
		;;
	-f|--fastfetch)
		#OS_fastfetch
		function my_os {
		fastfetch | grep -ohm1 "EndeavourOS\|openSUSE Tumbleweed\|Arch Linux"
		}
		OS=$(my_os)
		#OS_fastfetch

		#DE_fastfetch
		function my_de {
		fastfetch | grep -ohm1 "KDE\|GNOME"
		}
		DE=$(my_de)
		#DE_fastfetch

		#fastfetch
		OS_info="fastfetch"
		#fastfetch
		;;
	-lsbsDE|--lsb-release-set-DE)
			case $2 in
				-g|--gnome)
					#OS_lsb
					function my_os {
					lsb_release -a | grep -ohm1 "EndeavourOS Linux\|openSUSE Tumbleweed\|Arch Linux"
					}
					OS=$(my_os)
					#OS_lsb
					DE=GNOME

					#lsb_release
					OS_info="lsb_release"
					#lsb_release
					;;
				-k|--kde)
					#OS_lsb
					function my_os {
					lsb_release -a | grep -ohm1 "EndeavourOS Linux\|openSUSE Tumbleweed\|Arch Linux"
					}
					OS=$(my_os)	
					#OS_lsb
					DE=KDE

					#lsb_release
					OS_info="lsb_release"
					#lsb_release
					;;
				*)
					echo "Ошибка должен быть 2-й параметр с DE"
					exit
					;;

			esac
		;;
	*|-lsb|--lsb-release)
		#OS_lsb
		function my_os {
		lsb_release -a | grep -ohm1 "EndeavourOS Linux\|openSUSE Tumbleweed\|Arch Linux"
		}
		OS=$(my_os)
		#OS_lsb

		#DE_lsb
		function my_de {
		echo "$XDG_CURRENT_DESKTOP" | grep -ohm1 "KDE\|GNOME"
		}
		DE=$(my_de)
		#DE_lsb

		#lsb_release
		OS_info="lsb_release"
		#lsb_release
		;;
esac
#peremen

#colors
pu=$"\033[0;35m"
nc=$"\033[0m"
ge=$"\033[0;32m"
cy=$"\033[0;36m"
#colors


#massAppList
	#arch
	arch_Full_gnome=("steam" "wine" "resources" "timeshift" "power-profiles-daemon" "xorg-mkfontscale" "xorg-fonts-cyrillic" "xorg-fonts-misc" "unrar" "gamemode" "terminus-font" "ttf-dejavu" "noto-fonts" "noto-fonts-extra" "ttf-liberation" "wqy-zenhei" "gnome-browser-connector" "systemd-resolvconf" "noto-fonts-cjk" "obs-studio" "qbittorrent")
	arch_Full_KDE=("steam" "wine" "gnome-disk-utility" "elisa" "plasma-workspace-wallpapers" "timeshift" "power-profiles-daemon" "xorg-mkfontscale" "xorg-fonts-cyrillic" "xorg-fonts-misc" "unrar" "gamemode" "terminus-font" "ttf-dejavu noto-fonts" "noto-fonts-extra" "ttf-liberation" "wqy-zenhei" "systemd-resolvconf" "noto-fonts-cjk" "obs-studio" "qbittorrent")

	arch_Min_gnome=(wine resources timeshift power-profiles-daemon xorg-mkfontscale xorg-fonts-cyrillic xorg-fonts-misc unrar gamemode terminus-font ttf-dejavu noto-fonts noto-fonts-extra ttf-liberation wqy-zenhei gnome-browser-connector systemd-resolvconf noto-fonts-cjk)
	# ДА ,можно было без ковычек
	arch_Min_KDE=(wine gnome-disk-utility elisa plasma-workspace-wallpapers timeshift power-profiles-daemon xorg-mkfontscale xorg-fonts-cyrillic xorg-fonts-misc unrar gamemode terminus-font  ttf-dejavu noto-fonts noto-fonts-extra  ttf-liberation wqy-zenhei systemd-resolvconf noto-fonts-cjk)

	arch_Full_noflat_gnome=(steam wine resources timeshift power-profiles-daemon xorg-mkfontscale xorg-fonts-cyrillic xorg-fonts-misc unrar gamemode terminus-font  ttf-dejavu noto-fonts noto-fonts-extra ttf-liberation wqy-zenhei gnome-browser-connector systemd-resolvconf noto-fonts-cjk)
	arch_Full_noflat_KDE=(steam wine gnome-disk-utility elisa plasma-workspace-wallpapers timeshift power-profiles-daemon xorg-mkfontscale xorg-fonts-cyrillic xorg-fonts-misc unrar gamemode terminus-font  ttf-dejavu noto-fonts noto-fonts-extra ttf-liberation wqy-zenhei systemd-resolvconf noto-fonts-cjk)

	arch_Min_noflat_gnome=(wine resources timeshift power-profiles-daemon xorg-mkfontscale xorg-fonts-cyrillic xorg-fonts-misc unrar gamemode terminus-font  ttf-dejavu noto-fonts noto-fonts-extra ttf-liberation wqy-zenhei gnome-browser-connector systemd-resolvconf noto-fonts-cjk)
	arch_Min_noflat_KDE=(wine gnome-disk-utility elisa plasma-workspace-wallpapers timeshift power-profiles-daemon xorg-mkfontscale xorg-fonts-cyrillic xorg-fonts-misc unrar gamemode terminus-font  ttf-dejavu noto-fonts noto-fonts-extra  ttf-liberation wqy-zenhei systemd-resolvconf noto-fonts-cjk)
	#arch

	#endev
	endev_Full_gnome=(steam wine gnome-disk-utility gnome-backgrounds resources timeshift xorg-mkfontscale xorg-fonts-cyrillic xorg-fonts-misc systemd-resolvconf gnome-browser-connector obs-studio qbittorrent)
	endev_Full_KDE=(steam wine gnome-disk-utility elisa  plasma-workspace-wallpapers timeshift discover xorg-mkfontscale xorg-fonts-cyrillic xorg-fonts-misc systemd-resolvconf obs-studio qbittorrent)

	endev_Min_gnome=(wine gnome-disk-utility gnome-backgrounds resources timeshift xorg-mkfontscale xorg-fonts-cyrillic xorg-fonts-misc systemd-resolvconf gnome-browser-connector obs-studio qbittorrent)
	endev_Min_KDE=(wine gnome-disk-utility elisa plasma-workspace-wallpapers timeshift discover xorg-mkfontscale xorg-fonts-cyrillic xorg-fonts-misc systemd-resolvconf obs-studio qbittorrent)
	
	endev_Full_noflat_gnome=(steam wine gnome-disk-utility gnome-backgrounds resources timeshift xorg-mkfontscale xorg-fonts-cyrillic xorg-fonts-misc systemd-resolvconf gnome-browser-connector obs-studio qbittorrent)
	endev_Full_noflat_KDE=(steam wine gnome-disk-utility elisa plasma-workspace-wallpapers  timeshift discover xorg-mkfontscale xorg-fonts-cyrillic xorg-fonts-misc systemd-resolvconf obs-studio qbittorrent)
	
	endev_Min_noflat_gnome=( wine gnome-disk-utility gnome-backgrounds resources timeshift xorg-mkfontscale xorg-fonts-cyrillic xorg-fonts-misc systemd-resolvconf gnome-browser-connector obs-studio qbittorrent)
	endev_Min_noflat_KDE=(wine gnome-disk-utility elisa plasma-workspace-wallpapers timeshift discover xorg-mkfontscale xorg-fonts-cyrillic xorg-fonts-misc systemd-resolvconf obs-studio qbittorrent)
	#endev

#massAppList



#endev
function endev_set {

#что за система
read -p "Привет $USER ,этот проект находится в разработке($ver,$ser,$OS_info)"
echo "И да, видать у тебя..."
echo -e $pu"${OS}"$nc
read -p "c $DE"
clear
#что за система

#question
		read -p "Починить Bluetooth?(yes/no):" endev_blut
		read -p "Стоит ли мне установить подержку Wallpaper Engine?(yes/no):" endev_wallpaper_eng
		read -p "Нужно установить flatpak?(yes/no):" endev_flatpak
		read -p "Нужно ли установить Virtualbox?(yes/no)" endev_virtualbox
		read -p "Нужно ли установить qemu?(yes/no)" endev_qemu
		read -p "Нужно ли установить grub-btrfs?(yes/no)" endev_grub
		read -p "Какой пакет программ установить?(1-Полный,2-Минимальный,3-Полный без flatpak,4-минимальный без flatpak)?" endev_apps
		read -p "Настроить nvidia prime?(yes/no)" endev_nvidia
		read -p "Включить настройку файлового сервера?{samba}(yes/no)" endev_samba
		read -p "Включить ssh и sftp?(yes/no)" endev_ssh
		read -p "Включить zram?(yes/no)" endev_zram
clear
#question

# Bluetooth
case $endev_blut in
	yes|y)
		echo -e $pu"Включаю передачю файлов по Bluetooth..."$nc
		sudo pacman -S bluez-obex --noconfirm
		systemctl --user start obex.service
		systemctl --user enable obex.service
		sudo systemctl enable bluetooth
		;;
	*)
		;;
esac
# Bluetooth

#wallparer
case $DE in
	KDE)
		case $endev_wallpaper_eng in
			yes|y)
				echo -e $pu"Установка плагина wallpaper-engine-kde-plugin"$nc
				yay -S plasma6-wallpapers-wallpaper-engine-git
				;;
			*)
				;;
		esac
		;;
	*)
		case $endev_wallpaper_eng in
		yes|y)
			echo -e $pu"Прости но твоя DE не поддерживается"$nc
			;;
		*)
			;;
		esac
		;;

esac
#wallparer

#flatpak_install
case $endev_flatpak in
	yes|y)
		echo -e $pu"Запуск полного обновления..."$nc
		sudo pacman -Syu --noconfirm
		echo -e $pu"Установка flatpak..."$nc
		sudo pacman -S flatpak --noconfirm
		case $DE in
			KDE)
				sudo pacman -S flatpak-kcm --noconfirm
				;;
			GNOME)
				;;
		esac
		echo -e $pu"Добавление репозитория flatpak..."$nc
		flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
		echo -e $pu"Нужна перезагрузка"$nc
		read -p "Перезагрузится?(yes/no)" reboot
		case $reboot in
			yes)
				sudo reboot
				exit
				;;
			*)
				;;
		esac
		;;
	*)
		;;
esac
#flatpak_install

#virtuabox_install
case $endev_virtualbox in
	yes|y)
		echo -e $pu"Установка virtualbox..."$nc
		sudo pacman -S virtualbox virtualbox-guest-iso
		sudo usermod -a -G vboxusers $USER
		;;
	*)
		;;
esac
#virtuabox_install

#qemu_install
case $endev_qemu in
	yes|y)
		echo -e $pu"Установка qemu..."$nc
		sudo pacman -S qemu virt-manager libvirt
		systemctl enable --now libvirtd
		;;
	*)
		;;
esac
#qemu_install

#grub_btrfs_install
case $endev_grub in
	yes|y)
		echo -e $pu"Установка grub-btrfs..."$nc
		sudo pacman -S grub-btrfs timeshift inotify-tools --noconfirm
		sudo systemctl enable --now cronie.service
		read -p "ВНИМАНИЕ! нужно заменить /.snapshots на !(--timeshift-auto)!"
		sudo systemctl edit --full grub-btrfsd
		sudo systemctl enable --now grub-btrfsd
		sudo grub-mkconfig -o /boot/grub/grub.cfg
		;;
	*)
		;;
esac
#grub_btrfs_install

#app_install
case $DE in
	GNOME)
		case $endev_apps in
			1)
				echo -e $pu"Установка из pacman..."$nc
				sudo pacman -S ${endev_Full_gnome[@]} --noconfirm
				yay -S yandex-browser
				echo -e $pu"Установка из flatpak..."$nc
				flatpak install  org.nickvision.tubeconverter  -y
				;;
			2)
				echo -e $pu"Установка из pacman..."$nc
				sudo pacman -S ${endev_Min_gnome[@]} --noconfirm
				yay -S gnome-browser-connector
				;;
			3)
				echo -e $pu"Установка из pacman..."$nc
				sudo pacman -S ${endev_Full_noflat_gnome[@]} --noconfirm
				yay -S yandex-browser
				;;
			4)
				echo -e $pu"Установка из pacman..."$nc
				sudo pacman -S ${endev_Full_noflat_gnome[@]} --noconfirm
				;;
			*)
				;;
		esac
		;;
	KDE)
		case $endev_apps in
			1)
				echo -e $pu"Установка из pacman..."$nc
				sudo pacman -S  ${endev_Full_KDE[@]} --noconfirm
				yay -S yandex-browser
				echo -e $pu"Установка из flatpak..."$nc
				flatpak install org.nickvision.tubeconverter  -y
				;;
			2)
				echo -e $pu"Установка из pacman..."$nc
				sudo pacman -S ${endev_Min_KDE[@]} --noconfirm
				echo -e $pu"Установка из flatpak..."$nc
				flatpak install org.nickvision.tubeconverter  -y
				;;
			3)
				echo -e $pu"Установка из pacman..."$nc
				sudo pacman -S ${endev_Full_noflat_KDE[@]} --noconfirm
				yay -S yandex-browser
				;;
			4)
				echo -e $pu"Установка из pacman..."$nc
				sudo pacman -S  ${endev_Min_noflat_KDE[@]} --noconfirm
				;;
			*)
				;;
		esac
		;;
	*)
		;;

esac
#app_install

#optimus_settap
case $endev_nvidia in
	yes|y)
		case $DE in
			GNOME)
				echo -e $pu"Установка switcheroo-control..."$nc
				sudo pacman -S switcheroo-control --noconfirm
				sudo systemctl enable switcheroo-control
				exit
				;;
			KDE)
				read -p "Что установить? (1-switcheroo-control 2-optimus-manager)" nvidia
				case  $nvidia in
					1)
						echo -e $pu"Установка switcheroo-control..."$nc
						sudo pacman -S switcheroo-control --noconfirm
						sudo systemctl enable switcheroo-control
						exit
						;;
					2)
						echo -e $pu"Установка optimus_manager..."$nc
						yay -S optimus-manager
						yay -S optimus-manager-qt
						sudo systemctl enable --now optimus-manager
						exit
						;;
				esac
				;;
		esac
		;;
	*)
		;;
esac
#optimus_settap

# samba
case $endev_samba in
	yes|y)
		echo -e $pu"Установка Samba если необходимо..."$nc
		sudo pacman -S samba --needed
		echo -e $pu"Настройка фаервола..."
		firewall-cmd --permanent --add-service={samba,samba-client,samba-dc} --zone=public
		echo -e $pu"Cервис добавлен в public"$nc
		echo -e $pu"Настройка samba..."$nc
		sudo mkdir /var/lib/samba/usershares # не хватает вроде ещё директорий
		sudo mkdir /usr/samba
		sudo mkdir /usr/samba/var
		echo -e $pu"Добавление группы sambashare и добавление пользователя в неё..."$nc
		sudo groupadd sambashare
		sudo usermod -aG sambashare $USER
		read  -p "Настройте /etc/samba/smb.conf,пример в директории со скриптом"
		sudo nano /etc/samba/smb.conf
		echo -e $pu"Добавление пользователя в smb..."$nc
		read -p "Если хотите добавить нового пользователя то ведите sudo smbpasswd -a НОВЫЙ_ПОЛЬЗОВАТЕЛЬ"
		sudo smbpasswd -a $USER
		echo -e $pu"Запуск служб..."$nc
		sudo systemctl start smb nmb
		sudo systemctl enable smb nmb
		;;
	*)
		;;
esac
# samba

# sftp
case $endev_ssh in
	yes|y)
		read -p "Выполните настройку конфига" 
		echo -e $pu"Переход в конфиг..."$nc
		sudo nano /etc/ssh/sshd_config
		read -p "Был изменен порт? (y/n)" port
		case $port in
			y|yes)
				read -p "Ветите нынешний новый порт:" new_port
				sudo firewall-cmd --permanent --add-port=$new_port/tcp
				;;
			n|no)
			;;
		esac
		echo -e $pu"Запуск ssh..."$nc
		sudo systemctl enable --now sshd
		;;
	*)
		;;
esac
# sftp

#zram
case $endev_zram in 
	yes|y)
			echo -e $pu"Установка zram-generator..."$nc
			sudo pacman -S zram-generator --noconfirm
			read -p "Нужно вписать в конфиг минимум [zram0], и если надо размер файла подкачки"
			sudo nano /etc/systemd/zram-generator.conf
			echo -e $pu"Рекомендуется перезагрузка"$nc
			;;
	no|n)
			;;
esac
#zram

}

#endev

#opensuse_tumb
function opensuse_tumb_ins { #Возможно стоит перепесать для tubleweed полностью с нуля может вызвать ошибки
#user_inter
read -p "Привет $USER ,этот проект находится в разработке($ver,$ser,$OS_info). "
echo "И да, видать у тебя..."
echo -e $ge"${OS}"$nc
read -p "c $DE"
clear
#answer_user
read -p "Установить zram?(yes/no)" tumb_zram
read -p "Настроить Virtualbox?(Yes/no){ТРЕБУЕТСЯ SUDO}:" tumb_virtualbox_seting
read -p "Что мне стоит установить?(1-Только flatpak,2-Только zypper,3-Только flatpak без игр,4-Только zypper без игр,5-Оба,6-Оба без игр,*-Без установки){SUDO}:" tumb_apps
read -p "Стоит ли мне установить Visual Studio Code?(1-Да но из Flatpak,*-Нет):" tumb_code
read -p "Стоит ли мне установить Vlc?(1-Да но из Flatpak,2-Да но из zypper c доп.кодеками,*-Нет,я сам выберу):" tumb_vlc
read -p "Какой браузер мне установить?(1-google chrome из Flatpak,2-Chromium из Flatpak,3-Яндекс из Zypper,*-Без браузера):" tumb_browser
read -p "Какую программу для торентов установить(1-Qbittorrent из Flatpak,2-Qbittorrent из Zypper,3-Fragments{Flatpak},*-Без торентов):" tumb_torrent
read -p "Установить Диски от Gnome?(yes/no):" tumb_gnome
read -p "Установить virtualbox?(yes/no){Потребуется доп.настройка}:" tumb_virtualbox
read -p "Установить qemu с virt-manager?(yes/no)" tumb_qemu
clear
#answer_user

#zram
case $tumb_zram in 
	yes|y)
			echo -e $ge"Установка zram-generator..."$nc
			sudo zypper -y in zram-generator 
			sudo systemctl enable --now zramswap
			echo -e $ge"Рекомендуется перезагрузка"$nc
			;;
	no|n)
			;;
esac
#zram

#virtualbox_setap_2
case $tumb_virtualbox_seting in
	yes|y)
		echo -e $ge"Настройка Virtualbox..."$nc
		sudo usermod -a -G vboxusers $USER
		sudo /usr/sbin/vboxconfig
		;;
	*)
		;;
esac
#virtualbox_setap_2

# install_apps
case $DE in #gnome_or_kde
	GNOME) #gnome
		case $tumb_apps in
			1)
				echo -e $ge"Установка приложений из Flatpak..."$nc
				# flatpak_apps
				flatpak install flathub com.obsproject.Studio org.telegram.desktop com.discordapp.Discord org.nickvision.tubeconverter  org.gnome.Boxes org.kde.krita  com.github.neithern.g4music org.nickvision.cavalier net.nokyan.Resources ru.linux_gaming.PortProton com.github.tchx84.Flatseal com.heroicgameslauncher.hgl io.github.vikdevelop.SaveDesktop org.onlyoffice.desktopeditors  -y
				# flatpak_apps
				;;
			2)
				echo -e $ge"Установка приложений из Zypper..."$nc
				# zypper_apps
				sudo zypper in -y wine steam goverlay mangohud
				# zypper_apps
				;;
			3)
				echo -e $ge"Установка приложений из Flatpak..."$nc
				# !flatpak_apps_без_игр!
				flatpak install flathub com.obsproject.Studio org.telegram.desktop org.nickvision.tubeconverter org.gnome.Boxes org.kde.krita com.github.neithern.g4music org.nickvision.cavalier com.github.tchx84.Flatseal io.github.vikdevelop.SaveDesktop  org.onlyoffice.desktopeditors -y
				# !flatpak_apps_без_игр!

				;;
			4)
				echo -e $ge"Установка приложений из Zypper..."$nc
				# !zypper_apps_без_игр!
				sudo zypper in -y wine
				# !zypper_apps!
				;;
			5)
		 		echo -e $ge"Установка приложений из Flatpak..."$nc
		 		# flatpak_apps
		 		flatpak install flathub com.obsproject.Studio org.telegram.desktop com.discordapp.Discord org.nickvision.tubeconverter  org.gnome.Boxes org.kde.krita com.github.neithern.g4music org.nickvision.cavalier net.nokyan.Resources  ru.linux_gaming.PortProton com.github.tchx84.Flatseal com.heroicgameslauncher.hgl io.github.vikdevelop.SaveDesktop  org.onlyoffice.desktopeditors -y
		 		# Flatpak_apps
		 		echo -e $ge"Установка приложений из Zypper..."$nc
		 		#zypper_apps
				sudo zypper in -y wine steam goverlay mangohud
				#zypper_apps
				;;
			6)
		 		echo -e $ge"Установка приложений из Flatpak..."$nc
		 		# !flatpak_apps_без_игр!
		 		flatpak install flathub com.obsproject.Studio org.telegram.desktop org.nickvision.tubeconverter org.gnome.Boxes org.kde.krita com.github.neithern.g4music org.nickvision.cavalier com.github.tchx84.Flatseal io.github.vikdevelop.SaveDesktop  org.onlyoffice.desktopeditors -y
		 		# !flatpak_apps_без_игр!
		 		echo -e $ge"Установка приложений из Zypper..."$nc
		 		#zypper_apps
				sudo zypper in -y wine
				#zypper_apps
		 		;;
			*)
		 		;;
		esac
		;;
	KDE) #kde
		case $tumb_apps in
			1)
				echo -e $ge"Установка приложений из Flatpak..."$nc
				# flatpak_apps
				flatpak install flathub com.obsproject.Studio org.telegram.desktop com.discordapp.Discord org.nickvision.tubeconverter org.gnome.Boxes org.kde.krita  net.nokyan.Resources  ru.linux_gaming.PortProton org.kde.kolourpaint com.heroicgameslauncher.hgl io.github.vikdevelop.SaveDesktop org.onlyoffice.desktopeditors -y
				# flatpak_apps
				;;
			2)
				echo -e $ge"Установка приложений из Zypper..."$nc
				# zypper_apps
				sudo zypper in -y wine steam goverlay elisa
				# zypper_apps
				;;
			3)
				echo -e $ge"Установка приложений из Flatpak..."$nc
				# flatpak_apps
				flatpak install flathub com.obsproject.Studio org.telegram.desktop org.nickvision.tubeconverter  org.gnome.Boxes org.kde.krita  net.nokyan.Resources org.kde.kolourpaint io.github.vikdevelop.SaveDesktop org.onlyoffice.desktopeditors -y
				# flatpak_apps
				;;
			4)
				echo -e $ge"Установка приложений из Zypper..."$nc
				# zypper_apps
				sudo zypper in -y wine elisa
				# zypper_apps
				;;
			5)
				echo -e $ge"Установка приложений из Flatpak..."$nc
				# flatpak_apps
				flatpak install flathub com.obsproject.Studio org.telegram.desktop com.discordapp.Discord org.nickvision.tubeconverter org.gnome.Boxes org.kde.krita  net.nokyan.Resources ru.linux_gaming.PortProton org.kde.kolourpaint com.heroicgameslauncher.hgl io.github.vikdevelop.SaveDesktop org.onlyoffice.desktopeditors -y
				# flatpak_apps
				echo -e $ge"Установка приложений из Zypper..."$nc
				# zypper_apps
				sudo zypper in -y wine steam goverlay elisa
				# zypper_apps
				;;
			6)
				echo -e $ge"Установка приложений из Flatpak..."$nc
				# flatpak_apps
				flatpak install flathub com.obsproject.Studio org.telegram.desktop  org.nickvision.tubeconverter org.gnome.Boxes org.kde.krita  net.nokyan.Resources org.kde.kolourpaint io.github.vikdevelop.SaveDesktop  org.onlyoffice.desktopeditors -y
				# flatpak_apps
				echo -e $ge"Установка приложений из Zypper..."$nc
				# zypper_apps
				sudo zypper in -y wine elisa
				# zypper_apps
				;;
			*)
				;;
		esac
		;;
	*)
		echo -e $ge"Ошибка определения DE"$nc
		;;
esac
#install_apps

#vscode
case $tumb_code in
	1)
		echo -e $ge"Установка приложений из Flatpak..."$nc
		flatpak install flathub com.visualstudio.code -y
		;;
	*)
		;;
esac
#vscode

#vlc
case $tumb_vlc in
	1)
		echo -e $ge"Установка приложений из Flatpak..."$nc
		flatpak install flathub org.videolan.VLC
		;;
	2)
		echo -e $ge"Установка приложений из Zypper..."$nc
		sudo zypper in -y opi
		opi codecs
		sudo zypper in -y vlc
		;;
	*)
		;;
esac
#vlc

# browser_install
case $tumb_browser in
	1)
		echo -e $ge"Установка приложений из Flatpak..."$nc
		flatpak install flathub com.google.Chrome -y
		# firefox_remove
		read -p "Стоит ли удалить Firefox?(yes/no):" browser_answer_del
		case $browser_answer_del in
			yes|y)
				echo $ge"Удаление Firefox..."$nc
				sudo zypper rm -y firefox
				;;
			*)
				;;
		esac
		# firefox_remove
		;;

	2)
		echo -e $ge"Установка приложений из Flatpak..."$nc
		flatpak install flathub org.chromium.Chromium -y
		# firefox_remove
		echo -e $ge"Стоит ли удалить Firefox?(yes/no)"$nc
		read -p browser_answer_del
		case $browser_answer_del in
			yes|y)
				echo -e $ge"Удаление Firefox..."$nc
				sudo zypper rm -y firefox
				;;
			*)
				;;
		esac
		# firefox_remove
		;;
	3)
		echo "Установка приложений из Flatpak..."$nc
		flatpak install flathub ru.yandex.Browser -y
		# firefox_remove
		read -p "Стоит ли удалить Firefox?(yes/no):" browser_answer_del
		case $browser_answer_del in
			yes|y)
				echo -e $ge"Удаление Firefox..."$nc
				sudo zypper rm -y firefox
				;;
			*)
				;;
		esac
		# firefox_remove
		;;
	*)
		;;
esac
# browser_install

#torrent_inst
case $tumb_torrent in
	1)
		echo -e $ge"Установка приложений из Flatpak..."$nc
		flatpak install flathub org.qbittorrent.qBittorrent -y
		;;
	2)
		echo -e $ge"Установка приложений из Zypper..."$nc
		sudo zypper in -y qbittorrent
		;;
	3)
		echo -e $ge"Установка приложений из Flatpak..."$nc
		flatpak install flathub de.haeckerfelix.Fragments -y
		;;

	*)
		;;
esac
#torrent_inst

#gnome_inst
case $tumb_gnome in
	yes|y)
		echo -e $ge"Установка приложений из Zypper..."$nc
		sudo zypper in -y gnome-disk-utility
		;;
	*)
		;;
esac
#gnome_inst

#virtualbox_setap_1
case $tumb_virtualbox in
	yes|y)
		echo -e $ge"Установка приложений из Zypper..."$nc
		sudo zypper in -y gcc kernel-source make automake autoconf kernel-syms virtualbox-host-source kernel-devel kernel-default-devel virtualbox virtualbox-qt
		echo -e $ge"Внимание рекомендуется произвести настройку Virtualbox"$nc
		;;
	*)
		;;
esac
#virtualbox_setap_1

#qemu_install
case $tumb_qemu in							#НЕ тестировано
	yes|y)
		echo -e $ge"Установка приложений из Zypper..."$nc
		sudo zypper in -y qemu virt-manager libvirt
		;;
	*)
		;;
esac
#qemu_install

}
#opensuse_tumb

# arch
function arch_install {
#question
read -p "Привет $USER ,этот проект находится в разработке($ver,$ser,$OS_info)"
echo "И да, видать у тебя..."
echo -e $cy"${OS}"$nc
read -p "c $DE"
clear
read -p "Починить блютуз?(yes/no):" arch_bluz
read -p "Установить yay?(yes/no)" arch_yay 
read -p "Нужно установить flatpak?(yes/no):" arch_flat
read -p "Установить фаервол?(1-ufw,2-firewalld,3-no)" arch_fire
read -p "Установить grub-btfs?(yes/no)" arch_btrfs
read -p "Настроить и установить nvidia prime?(yes/no)" arch_nvidia_prime
read -p "Установить драйвер на видеокарту?(1-amd,2-intel,3-nvidia)" arch_video
read -p "Установить zram?(yes/no)" arch_zram
read -p "Установить samba?(yes/no)" arch_samba
read -p "Настроить ssh?(yes/no)" arch_ssh
read -p "Установить подержку wallpaper engine?(yes/no)" arch_wall_eng
read -p "Какой пакет программ установить?(1-Полный,2-Минимальный,3-Полный без flatpak,4-минимальный без flatpak)?" arch_apps
read -p "Установить Virtualbox?(yes/no)" arch_virtual 
read -p "Установить qemu?(yes/no)" arch_qemu
clear
#question

#blut
case $arch_bluz in
	yes|y)
		echo -e $cy"Включаю передачю файлов по Bluetooth..."$nc
		sudo pacman -S bluez-obex --noconfirm
		systemctl --user start obex.service
		systemctl --user enable obex.service
		sudo systemctl enable bluetooth
		;;
	*)
		;;
esac
#blut

#yay
case $arch_yay in
	yes|y)
		echo -e $cy"Устанавливаю Yay..."$nc
		sudo pacman -S --needed base-devel git --noconfirm
		cd /home/$USER
		git clone https://aur.archlinux.org/yay.git
		cd yay 
		makepkg -si
		;;
	*)
		;;
esac
#yay	

#flatpak	
case $arch_flat in
	yes|y)
		echo -e $cy"Запуск полного обновления..."$nc
		sudo pacman -Syu --noconfirm
		echo -e $cy"Установка flatpak..."$nc
		sudo pacman -S flatpak --noconfirm
		case $DE in
			KDE)
				sudo pacman -S flatpak-kcm --noconfirm
				;;
			GNOME)
				;;
		esac ##!!!
		;;
	*)
		;;
esac
#flatpak

#firewall
case $arch_fire in
	1)
		echo -e $cy"Установка ufw..."$nc
		sudo pacman -S ufw 
		sudo systemctl enable ufw
		sudo systemctl start ufw
		;;
	2)
		echo -e $cy"Установка firewalld..."$nc
		sudo pacman -S firewalld
		sudo systemctl enable firewalld
		sudo systemctl start firewalld 
		;;
	*)
		;;
esac
#firewall

#btrfs
case $arch_btrfs in
	yes|y)
		echo -e $cy"Установка grub-btrfs..."$nc
		sudo pacman -S grub-btrfs timeshift inotify-tools --noconfirm
		sudo systemctl enable --now cronie.service
		read -p "ВНИМАНИЕ! нужно заменить /.snapshots на !(--timeshift-auto)!"
		sudo systemctl edit --full grub-btrfsd
		sudo systemctl enable --now grub-btrfsd
		sudo grub-mkconfig -o /boot/grub/grub.cfg
		;;
	*)
		;;
esac
#btrfs

#nvidia
case $arch_nvidia_prime in
	yes|y)
		case $DE in
			GNOME)
				echo -e $cy"Установка nvidia..."$nc
				sudo pacman -S nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader lib32-opencl-nvidia opencl-nvidia libxnvctrl --noconfirm
				echo -e $cy"Установка switcheroo-control..."$nc
				sudo pacman -S switcheroo-control --noconfirm
				sudo systemctl enable switcheroo-control
				read -p "Установить envycontrol?(yes/no)" arch_envy
				case $arch_envy in
					yes|y)
						echo -e $cy"Устанвливаю envycontrol..."$nc
						yay -S envycontrol
						;;
					*)
						;;
				esac
				;;
			KDE)
				echo -e $cy"Устанавливаю nvidia..."$nc
				sudo pacman -S nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader lib32-opencl-nvidia opencl-nvidia libxnvctrl --noconfirm
				read -p "Что установить? (1-switcheroo-control 2-optimus-manager)" nvidia_answer
				case  $nvidia_answer in
					1)
						echo -e $cy"Установка switcheroo-control..."$nc
						sudo pacman -S switcheroo-control --noconfirm
						sudo systemctl enable switcheroo-control
						exit
						;;
					2)
						echo -e $cy"Установка optimus_manager..."$nc
						yay -S optimus-manager
						yay -S optimus-manager-qt
						sudo systemctl enable --now optimus-manager
						;;
					*)
						;;
						
				esac
				;;
		esac
		;;
	*)
		;;
esac
#nvidia

#video_der
case $arch_video in
	1)
		echo -e $cy"Установка amd драйверов..."$nc
		sudo pacman -S lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader --noconfirm
		;;
	2)
		echo -e $cy"Установка intel драйверов..."$nc
		sudo pacman -S lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader intel-media-driver libva-intel-driver xf86-video-intel --noconfirm
		;;
	3)
		echo -e $cy"Установка nvidia драйверов..."$nc
		sudo pacman -S nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader lib32-opencl-nvidia opencl-nvidia libxnvctrl --noconfirm
		;;
esac
#video_der

#zram
case $arch_zram in 
	yes|y)
			echo -e $cy"Установка zram-generator..."$nc
			sudo pacman -S zram-generator --noconfirm
			read -p "Нужно вписать в конфиг минимум [zram0], и если надо размер файла подкачки"
			sudo nano /etc/systemd/zram-generator.conf
			echo -e $cy"Рекомендуется перезагрузка"$nc
			;;
	no|n)
			;;
esac
#zram

#samba
case $arch_samba in
        yes|y)
                echo -e $cy"Установка Samba если необходимо..."$nc
                sudo pacman -S samba --needed
		read -p "Какой фаервол установлен?(1-ufw 2-firewalld)" arch_samba_fire
		case $arch_samba_fire in
			1)
				echo -e $cy"Настройка фаервола..."$nc
				sudo ufw allow CIFS
				sudo ufw allow Samba
				;;
			2)
               			echo -e $cy"Настройка фаервола..."
                		firewall-cmd --permanent --add-service={samba,samba-client,samba-dc} --zone=public
                		echo -e $cy"Cервис добавлен в public"$nc
                		echo -e $cy"Настройка samba..."$nc
				;;
			*)
				;;
		esac                 
                sudo mkdir /var/lib/samba/usershares #                                                                        
                sudo mkdir /usr/samba
                sudo mkdir /usr/samba/var
                echo -e $cy"Добавление группы sambashare и добавление пользователя в неё..."$nc
                sudo groupadd sambashare
                sudo usermod -aG sambashare $USER
                read  -p "Настройте /etc/samba/smb.conf,пример в директории со скриптом"
                sudo nano /etc/samba/smb.conf
                echo -e $cy"Добавление пользователя в smb..."$nc
                read -p "Если хотите добавить нового пользователя то ведите sudo smbpasswd -a НОВЫЙ_ПОЛЬЗОВАТЕЛЬ"
                sudo smbpasswd -a $USER
                echo -e $cy"Запуск служб..."$nc
                sudo systemctl start smb nmb
                sudo systemctl enable smb nmb
                ;;
        *)
                ;;
esac
#samba

# sftp
case $arch_ssh in
        yes|y)
                read -p "Выполните настройку конфига"
                echo -e $cy"Переход в конфиг..."$nc
                sudo nano /etc/ssh/sshd_config
                read -p "Был изменен порт? (y/n)" port
				read -p "Какой фаервол установлен?(1-ufw 2-firewalld)" arch_ssh_wall
                case $port in
                        y|yes)
							case $arch_ssh_wall in
								1)
									sudo ufw allow ssh
									;;
								2)
                        			read -p "Ветите нынешний новый порт:" new_port
                        			sudo firewall-cmd --permanent --add-port=$new_port/tcp
									;;
							esac
                                ;;
                        n|no)
                        ;;
                esac
                echo -e $cy"Запуск ssh..."$nc
                sudo systemctl enable --now sshd
                ;;
        *)
                ;;
esac
# sftp

#wallp_eng
case $DE in
	KDE)
		case $arch_wall_eng in
			yes|y)
				echo -e $cy"Установка плагина wallpaper-engine-kde-plugin"$nc
				yay -S plasma6-wallpapers-wallpaper-engine-git
				;;
			*)
				;;
		esac
		;;
	*)
		case $arch_wall_eng in
		yes|y)
			echo -e $cy"Прости но твоя DE не поддерживается"$nc
			;;
		*)
			;;
		esac
		;;

esac
#wallp_eng

#app_install
case $DE in
	GNOME)
		case $arch_apps in
			1)
				echo -e $cy"Установка из pacman..."$nc
				sudo pacman -S ${arch_Full_gnome[@]} --noconfirm
				yay -S yandex-browser
				echo -e $cy"Установка из flatpak..."$nc
				flatpak install  org.nickvision.tubeconverter  -y
				;;
			2)
				echo -e $cy"Установка из pacman..."$nc
				sudo pacman -S ${arch_Min_gnome[@]} --noconfirm
				;;
			3)
				echo -e $cy"Установка из pacman..."$nc
				sudo pacman -S ${arch_Full_noflat_gnome[@]} --noconfirm
				yay -S yandex-browser
				;;
			4)
				echo -e $cy"Установка из pacman..."$nc
				sudo pacman -S ${arch_Min_noflat_gnome[@]} --noconfirm
				;;
			*)
				;;
		esac
		;;
	KDE)
		case $arch_apps in
			1)
				echo -e $cy"Установка из pacman..."$nc
				sudo pacman -S ${arch_Full_KDE[@]} --noconfirm
				yay -S yandex-browser
				echo -e $cy"Установка из flatpak..."$nc
				flatpak install org.nickvision.tubeconverter -y
				;;
			2)
				echo -e $cy"Установка из pacman..."$nc
				yay -S yandex-browser
				sudo pacman -S ${arch_Min_KDE[@]} --noconfirm
				echo -e $cy"Установка из flatpak..."$nc
				flatpak install  org.nickvision.tubeconverter  -y
				;;
			3)
				echo -e $cy"Установка из pacman..."$nc
				sudo pacman -S ${arch_Full_noflat_KDE[@]} --noconfirm
				yay -S yandex-browser
				;;
			4)
				echo -e $cy"Установка из pacman..."$nc
				sudo pacman -S ${arch_Min_noflat_KDE[@]} --noconfirm
				;;
			*)
				;;
		esac
		;;
	*)
		;;

esac
#app_install

#virtualbox
case $arch_virtual in
	yes|y)
		echo -e $cy"Установка virtualbox..."$nc
		sudo pacman -S virtualbox virtualbox-guest-iso
		sudo usermod -a -G vboxusers $USER
		;;
	*)
		;;
esac
#virtualbox

#qemu
case $arch_qemu in
	yes|y)
		echo -e $cy"Установка qemu..."$nc
		sudo pacman -S qemu virt-manager libvirt dnsmasq
		systemctl enable --now libvirtd
		;;
	*)
		;;
esac
#qemu

}
# arch

#install_apps
case $OS in
	EndeavourOS\ Linux|EndeavourOS)
			endev_set
		;;
	openSUSE\ Tumbleweed)
			opensuse_tumb_ins
		;;
	Arch\ Linux)	
			arch_install
		;;
	*)
		echo "Ошибка определения дистрибутива"
		echo "Рекомендуется установить lsb_release или fastfetch и запустить через ./setup.sh -f"
		exit
		;;
esac
