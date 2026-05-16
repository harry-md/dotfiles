export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="simple"
plugins=(git zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh
export PATH="$HOME/.local/bin":$PATH
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias update='sudo pacman -Syu;paru -Syu'
alias install='sudo pacman -S'
alias remove='sudo pacman -Rns'
alias search='pacman -Ss'
alias ainstall='paru -S'
alias asearch='paru -Ss'
alias aremove='paru -Rns'
alias yy='yazi'
alias v='nvim'
alias lv='NVIM_APPNAME=lv nvim'
alias lg='lazygit'
alias reboot='sudo reboot'
alias shutdown='sudo shutdown now'
alias dl='aria2c -x 16 -s 16'
alias sde='sudoedit'
alias hylock='systemctl suspend && hyprlock'
alias hylogout='hyprctl dispatch exit'
alias t="tmux new -s home"
alias ta='tmux attach -t'
alias tk='tmux kill-session -t'
alias tl='tmux ls'
alias df='df -h'
alias rm='rm -i --preserve-root'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias ping='ping -c 5'
alias la='ls -lah --color=always --group-directories-first'
alias l='ls -lh --color=always --group-directories-first'
alias winboot='sudo efibootmgr --bootnext 0003; sudo reboot'
alias mintboot='sudo efibootmgr --bootnext 0004; sudo reboot'
source <(fzf --zsh)
export EDITOR="/usr/bin/nvim"
export VISUAL="/usr/bin/nvim"
export TERMINAL="/usr/bin/ghostty"
export FIREFOX="/usr/bin/librewolf"

export FZF_COMPLETION_TRIGGER='::'
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
# export FZF_DEFAULT_OPTS=" \
# --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
# --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
# --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
# Use nvim for viewing man page
HISTSIZE=5000
HISTFILESIZE=10000
export MANPAGER='nvim +Man!'

export PATH=$PATH:$HOME/.local/bin

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin

bindkey "^[e" end-of-line
bindkey "^[w" backward-kill-word
bindkey "^[l" clear-screen
bindkey "^[[1;3D" backward-word
bindkey "^[[1;3C" forward-word
