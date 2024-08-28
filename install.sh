#!/bin/bash

echo "                                                                                              ";
echo "   __             _      __                                            __                 __  ";
echo "  / _)           | |     \ \                                           \ \               / _) ";
echo "  \ \   ___ ___ _| |_  _  \ \   ___ ____ _____ _ __  _  _  _ ______ ___ \ \   __  ___  __\ \  ";
echo " / _ \ / _ (   )     \| |  > \ / __)  ._|_____) '_ \| || || (  __  ) _ \ > \ /  \/ / |/ / _ \ ";
echo "( (_) | (_) ) ( (| |) ) | / ^ \> _| () )      | | | | \| |/ || || | |_) ) ^ ( ()  <| / ( (_) )";
echo " \___/ \___/ \_)_   _/ \_)_/ \_\___)__/       |_| | |\_   _/ |_||_|  __/_/ \_\__/\_\__/ \___/ ";
echo "                 | |                              | |  | |        | |                         ";
echo "                 |_|                              |_|  |_|        |_|                         ";
echo "";
echo "this script will automatically install the programs and move the configuration files to the";
echo "correct places. additionally, it will enable some services that will be needed via systemctl."
echo ""

# install paru, required for a lot of the programs i use
# install git
echo "please type your password to grant the script superuser permissions"
sudo echo "access granted! proceeding with installation..."
sudo pacman -Sy

echo "installing git and rust for paru installation..."
sudo pacman -S rust --noconfirm

echo "installing paru..."

# under the assumption paru is not installed. should detect if paru is installed or not, idk.
# > todo: add a module which detects if paru or other aur helper is installed
temporarily comment this out for test purposes!
sleep 3
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si --noconfirm
echo "installed paru! deleting paru dir..."
cd ..
rm -rf paru

# define packages to install via pacman and paru
pkg_pacman=("kitty zsh hyprland hyprpaper hyprlock rofi-wayland waybar sddm xdg-desktop-portal-hyprland xdg-desktop-portal nemo nemo-fileroller nemo-image-converter swaync pavucontrol fastfetch btop nwg-look mate-polkit ttf-terminus-nerd ttf-arimo-nerd wl-clipboard grim slurp brightnessctl playerctl noto-fonts-cjk noto-fonts-emoji qt5ct qt6ct papirus-icon-theme zoxide")
pkg_aur=("hyprpicker hyprshade hyprshot wl-screenrec clipse checkupdates-with-aur auto-cpufreq ungoogled-chromium-bin catppuccin-cursors-mocha rofi-emoji-git")

#download pokeget
git clone --recurse-submodules https://github.com/talwat/pokeget-rs.git
cd pokeget-rs
cargo build --release
sudo mv target/release/pokeget ~/usr/bin
cd ..
rm -rf pokeget-rs

clear
echo "installing required packages from arch repos..."
sleep 1;
paru -S $pkg_pacman --noconfirm
echo "done!"
sleep 1;

clear
echo "install aur shit idk"
sleep 1;
paru -S $pkg_aur --noconfirm
echo "done!"
sleep 1;

# script permissions + move files to correct dirs
clear
echo "setting all dotfile scripts to have executable permissions..."
chmod +x ~/dotfiles-hyprland/.scripts/*.sh
chmod +x ~/dotfiles-hyprland/.config/rofi/launchers/type-6/launcher.sh
chmod +x ~/dotfiles-hyprland/.config/rofi/powermenu/type-5/powermenu.sh
chmod +x ~/dotfiles-hyprland/.config/rofi/scripts/rofi-wifi-menu.sh
echo "done!"

echo "moving files to correct locations..."
cp -r "/home/$USER/dotfiles-hyprland/.config" "/home/$USER"
cp -r "/home/$USER/dotfiles-hyprland/.local" "/home/$USER"
cp -r "/home/$USER/dotfiles-hyprland/.scripts" "/home/$USER"
cp -r "/home/$USER/dotfiles-hyprland/.zsh" "/home/$USER"
cp -r "/home/$USER/dotfiles-hyprland/Pictures" "/home/$USER"
cp "/home/$USER/dotfiles-hyprland/.env" "/home/$USER"
cp "/home/$USER/dotfiles-hyprland/.zsh-alias" "/home/$USER"
cp "/home/$USER/dotfiles-hyprland/.zshrc" "/home/$USER"
echo "done!"
sleep 1;

# enable services
# >todo: finish
sudo systemctl enable sddm.service

# finish msg
echo "finished installing."
