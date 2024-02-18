autoload -U colors && colors

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}

setopt PROMPT_SUBST
PROMPT='%F{27}%~%f%{%F{green}%}$(parse_git_branch)%{%F{none}%}%F{red} $ %f'

export PATH=$PATH:/usr/local/go/bin
export TERM='xterm-256color'
export PYTHONSTARTUP=~/.pyrc
export XDG_DESKTOP_DIR="/home/soham"
export LC_ALL="en_US.UTF-8"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/lib/go
export PATH=$PATH:/home/soham/.cargo/bin
export PATH=$PATH:/home/soham/.local/bin
export PATH=$PATH:/home/soham/.npm-global/bin
export PATH=$PATH:/home/soham/.emacs.d/bin
# export PATH="$HOME/.tmuxifier/bin:$PATH"

export MANPAGER="nvim -c 'Man!' -o -"
export EDITOR=nvim
export VISUAL=nvim
export QT_QPA_PLATFORMTHEME=qt5ct
export LUTRIS_SKIP_INIT=1
export NPM_CONFIG_PREFIX=~/.npm-global

HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE=~/.zsh_history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

### VIM
alias v='nvim'
alias v.='v .'
alias sv='sudo nvim'
alias vbs='nvim $HOME/.bashrc'
alias vi3='nvim $HOME/.config/i3/config'
alias vzh='nvim $HOME/.zshrc'
alias vt='nvim $HOME/temp.md'
alias vrc='nvim $HOME/.config/nvim/init.vim'
alias vpb='nvim $HOME/.config/polybar/config'
alias val='nvim $HOME/.config/alacritty/alacritty.yml'

### COLOR
alias xat='lolcat'
alias cat='highlight -O ansi --force'
alias ls='exa'
alias grep='grep --color'
alias nf='neofetch | lolcat'
alias ccat='pygmentize -g'

### NAVIGATION
alias cd..='cd ..'
alias cd.='cd ..'
alias cfs='cd $HOME/exp/cf'
alias hs='cd $HOME/exp/cf/hs'
alias cx='cd $HOME/exp/cxx'
alias la='ls -lah'

### OTHER
alias cr='clear'
alias vlang='\v'
alias cpx='nvim ~/exp/temp/cp-sheet.md'
alias bld='./build.sh'
alias run='./bin/out'
alias b='./build.sh && ./bin/out'
alias py='python'
alias rng='ranger'
alias n='nvim $(fzf)'
alias pac='sudo pacman'
alias sxi='sxiv * -t'
alias wifix='sudo systemctl restart NetworkManager'
alias ffrec='ffmpeg -y -f x11grab -s 1920x1080 -i :0.0'
alias cy="ls *.cpp -lt | awk 'NR == 1 {print \$9}' | xargs xclip -selection clipboard && echo 'Copied!'"
alias p="xclip -selection c -o > input"
alias gp="ls *.cpp -lt | awk 'NR == 1 {print \$9}' | xargs g++ -std=c++20 -ggdb -Wall -Wextra && echo '> Compiled successfully' && ./a.out < input"
alias gh="ls *.hs -lt | awk 'NR == 1 {print \$9}' | xargs ghc -dynamic -o a.out && echo '> Compiled successfully' && ./a.out < input"
alias zg="zig build run"
alias gx="ls *.c -lt | awk 'NR == 1 {print \$9}' | xargs gcc -std=c11 -Wall -Wextra && echo '> Compiled successfully' && ./a.out < input"
alias new="/home/soham/Random/Scripts/./new.sh"
alias newh="/home/soham/Random/Scripts/./newh.sh"
alias newc="/home/soham/Random/Scripts/./newc.sh"
alias g='xclip -selection clipboard -o | ./a.out'
alias bashtop='btop'
alias c='cd $(fd --type directory | fzf)'
alias h='fzf-history-widget'
alias t='clear && glow ~/temp.md'
alias plt='echo "Alice->Bob: Hello" | java -jar plantuml-lgpl/build/libs/plantuml-lgpl-1.2023.10.jar -tpng -pipe | tail -n +2 > native.png && sxiv native.png && rm native.png'
alias x='git add . && git commit -m "updated stuff" && git push'

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
source ~/.zsh/zsh-sug.sh

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

MOZ_X11_EGL=1

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"
export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

#export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*}"'
#bindkey '^i' history-incremental-search-backward


# eval "$(tmuxifier init -)"
export NEOVIDE_MULTIGRID=true

# Turso
export PATH="/home/soham/.turso:$PATH"
