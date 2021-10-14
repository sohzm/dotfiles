autoload -U colors && colors
PROMPT="%F{26}[%f%F{27}%n%f%F{33}@%f%F{105}%m%f %F{111}%~%f%F{111}]%f%F{red}$ %f"

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

### VIM
alias v='nvim'
alias sv='sudo nvim'
alias vbs='nvim $HOME/.bashrc'
alias vi3='nvim $HOME/.config/i3/config'
alias vzh='nvim $HOME/.zshrc'
alias vrc='nvim $HOME/.config/nvim/init.vim'
alias vpb='nvim $HOME/.config/polybar/config'
alias val='nvim $HOME/.config/alacritty/alacritty.yml'

### COLOR
alias xat='lolcat'
alias ls='ls --color=auto'
alias cat='highlight -O ansi --force'
alias grep='grep --color'
alias nf='neofetch | lolcat'
alias rx='rxfetch'
alias ccat='pygmentize -g'

### ANDROID
alias droid_list='simple-mtpfs -l'
alias droid_connect='simple-mtpfs --device 1 Mobile/'
alias droid_disconnect='fusermount -u Mobile'

### NAVIGATION
alias cd..='cd ..'
alias cf='cd $HOME/exp/cf'
alias sde='cd $HOME/exp/sde'
alias vid='cd $HOME/Videos'
alias cxx='cd $HOME/exp/cxx'
alias prc='cd $HOME/exp/prc'
alias pic='cd $HOME/Pictures'
alias dow='cd $HOME/Downloads'

### OTHER
alias c='clear'
alias py='python'
alias rng='ranger'
alias ytd='youtube-dl '
alias pac='sudo pacman'
alias sxi='sxiv * -t'
alias wifix='sudo systemctl restart NetworkManager'
alias ffrec='ffmpeg -y -f x11grab -s 1920x1080 -i :0.0'
alias cy="ls *.cpp -lt | awk 'NR == 1 {print \$9}' | xargs xclip -selection clipboard && echo 'Copied!'"
alias gp="ls *.cpp -lt | awk 'NR == 1 {print \$9}' | xargs g++ && echo '> Compiled successfully' && ./a.out < input"
alias p='./a.out < input'
alias g='xclip -selection clipboard -o | ./a.out'

### GAMES
alias 0ad='gamemoderun prime-run 0ad'

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[2 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[2 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
source ~/.zsh/zsh-sug.sh

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
