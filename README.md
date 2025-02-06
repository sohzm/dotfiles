# dotfiles

Take whatever you want.

Current GTK theme is [Flat Remix](https://github.com/daniruiz/flat-remix-gtk).

GTK theme was taken from [Tokyo Night Linux theme](https://github.com/koiosdev/Tokyo-Night-Linux).

i3wm has a dwm like master-stack layout taken from [i3-layouts](https://github.com/eliep/i3-layouts), so you'll have to install that too [IMPORTANT]

The font used in terminal and dunst is [Iosevka Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Iosevka)

### OUICK COMMANDS (for myself :p)

```sh
# change pacman settings from /etc/pacman.conf: parallel downloads and color
pacman -Syu git base-devel ripgrep fd exa fzf tmux ttf-iosevka-nerd unzip vlc highlight zathura yarn alacritty xclip clipmenu btop xsel pulseaudio mpv alsa-utils pulseaudio-alsa pavucontrol xdg-utils xdg-user-dirs nvidia-prime sof-firmware alsa-firmware intel-ucode linux-headers linux linux-firmware  nvidia nvidia-utils nvidia-settings nitrogen playerctl ttf-fantasque-nerd zsh-syntax-highlighting python-pipx rofi rofi-calc scrot xcolor npm ttf-jetbrains-mono-nerd noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra chromium firefox    

# YAY
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# DMENU
git clone https://github.com/sohzm/dmenu.git
cd dmenu
make clean install

# INSTALL
yay -S brave-bin picom-git ttf-material-design-iconic-font light flat-remix flat-remix-gtk

# OTHER
git config --global core.pager cat
chsh -s $(which zsh)
pipx install i3-layouts

# GEN SSH KEYS
ssh-keygen -t ed25519 -C "my-mail@gmail.com"
```

## Screenshots

![](https://github.com/sz47/dotfiles/blob/main/screenshots/a.png)

![](https://github.com/sz47/dotfiles/blob/main/screenshots/b.png)

![](https://github.com/sz47/dotfiles/blob/main/screenshots/c.png)

![](https://github.com/sz47/dotfiles/blob/main/screenshots/d.png)
