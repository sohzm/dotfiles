# dotfiles

Take whatever you want.

Current GTK theme is [Flat Remix](https://github.com/daniruiz/flat-remix-gtk).

GTK theme was taken from [Tokyo Night Linux theme](https://github.com/koiosdev/Tokyo-Night-Linux).

i3wm has a dwm like master-stack layout taken from [i3-layouts](https://github.com/eliep/i3-layouts), so you'll have to install that too [IMPORTANT]

The font used in terminal and dunst is [Iosevka Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Iosevka)

### OUICK COMMANDS

```sh
### change pacman settings from /etc/pacman.conf: parallel downloads and color
pacman -Syu git base-devel ripgrep fd exa fzf tmux ttf-iosevka-nerd highlight zathura yarn alacritty xclip clipmenu btop xsel pulseaudio alsa-utils pulseaudio-alsa pavucontrol xdg-utils xdg-user-dirs prime-run sof-firmware alsa-firmware intel-ucode linux-headers linux linux-firmware nvidia nvidia-utils nvidia-settings

### YAY
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

### DMENU
git clone https://github.com/sohzm/dmenu.git
cd dmenu
make clean install

### INSTALL
yay -S brave-bin picom-git

### CHANGE SHELL TO ZSH
chsh -s $(which zsh)

### GEN SSH KEYS
ssh-keygen -t ed25519 -C "my-mail@gmail.com"
```

## Screenshots

![](https://github.com/sz47/dotfiles/blob/main/screenshots/a.png)

![](https://github.com/sz47/dotfiles/blob/main/screenshots/b.png)

![](https://github.com/sz47/dotfiles/blob/main/screenshots/c.png)

![](https://github.com/sz47/dotfiles/blob/main/screenshots/d.png)
