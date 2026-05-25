source /usr/share/cachyos-fish-config/cachyos-config.fish

set fish_greeting
set -g fish_completion_limit 100
set -gx EDITOR /usr/bin/nvim
set -gx VISUAL /usr/bin/nvim
set -gx TERMINAL /usr/bin/ghostty
set -gx FIREFOX /usr/bin/librewolf
set -gx FZF_COMPLETION_TRIGGER '::'
set -gx MANPAGER 'nvim +Man!'

# fish_add_path "$HOME/.local/bin"

set -gx ANDROID_HOME "$HOME/Android/Sdk"
fish_add_path "$ANDROID_HOME/emulator"
fish_add_path "$ANDROID_HOME/platform-tools"
fish_add_path "$ANDROID_HOME/tools"
fish_add_path "$ANDROID_HOME/tools/bin"

zoxide init fish | source
starship init fish | source
fzf --fish | source

alias ..='z ..'
alias ...='z ../..'
alias ....='z ../../..'
alias .....='z ../../../..'

alias update='sudo pacman -Syu; paru -Syu'
alias install='sudo pacman -S'
alias remove='sudo pacman -Rns'
alias search='pacman -Ss'
alias ainstall='paru -S'
alias asearch='paru -Ss'
alias aremove='paru -Rns'

alias g='git'
alias gst='git status'
alias gp='git push'
alias gpd='git push --dry-run'
alias gl='git pull'
alias gd='git diff'
alias gb='git branch'
alias gco='git checkout'
alias gcb='git checkout -b'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit --verbose'
alias gm='git merge'

alias v='nvim'
alias lv='NVIM_APPNAME=lv nvim'
alias lg='lazygit'
alias reboot='sudo reboot'
alias shutdown='sudo shutdown now'
alias dl='aria2c -x 16 -s 16'
alias sde='sudoedit'

alias t="tmux new -s home"
abbr ta 'tmux attach -t'
abbr tk 'tmux kill-session -t'
abbr tl 'tmux ls'

abbr df 'df -h'
abbr rm 'rm -i --preserve-root'
abbr cp 'cp -i'
abbr mv 'mv -i'
abbr mkdir 'mkdir -p'
abbr ping 'ping -c 5'
alias la='ls -lah --color=always --group-directories-first'
# alias l='ls -lh --color=always --group-directories-first'
alias l='eza -l --color=always --group-directories-first --icons'
alias winboot='sudo efibootmgr --bootnext 0003; sudo reboot'
alias mintboot='sudo efibootmgr --bootnext 0004; sudo reboot'

bind \ee end-of-line
bind \ew backward-kill-word
bind \el clear-screen
bind \e\[1\;3D backward-word
bind \e\[1\;3C forward-word

complete -c paru -n "string match -r -- '-S[a-z]*s|--search' (commandline -txt)" -e
