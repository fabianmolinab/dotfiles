# ref: ~/.zsh

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="spaceship"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"


# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# COMPLETION_WAITING_DOTS="true"

# DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git nvm zsh-autosuggestions zsh-syntax-highlighting zsh-z)
source $ZSH/oh-my-zsh.sh

#Plugin manager
source ~/.zplug/init.zsh

#Prompt
source ~/.spaceshiprc.zsh

#z-zsh
zplug "agkozak/zsh-z"

#zsh-autosuggestions
zplug "zsh-users/zsh-autosuggestions"

#zsh syntax-highlighting
zplug "zsh-users/zsh-syntax-highlighting"

zplug "spaceship-prompt/spaceship-prompt" 

#Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='nano'
 fi

#---- ALIAS -----
#exa
alias -g ll="exa -l -g --icons -h"
alias -g lla="exa -lahg --icons"
alias -g llh="exa -l -g --icons --tree --level=2"
alias fzfi="rg --files --hidden --follow --no-ignore-vcs -g '!{node_modules,.git}' | fzf"
alias tree='exa -T --git --icons --classify --group --group-directories-first --time-style=long-iso --color-scale -a -I=".git|.svn|.hg|CSV|.DS_Store|Thumbs.db|node_modules|bower_components|.code-search"'

# Pacman 
alias install="sudo pacman -S"
alias update="sudo pacman -Syyu"
alias clearCache="sudo pacman -Sc"

#Yay AUR Package
alias yu="yay -Syyu"

alias n="nvim"

#Git and github
alias g="git"
alias gl="git log --oneline --abbrev-commit --all --graph --decorate --color --pretty=format:'%C(yellow)%h%Creset -%C(red)%d%Creset %s %C(dim green)(%cr)'"

#work flow git
alias gst="git status -sb"
alias ga="git add ."
alias gc="git commit"

#Terminal
alias cl="clear" #Clear terminal
alias fh="find ~/ -name $1"

#-------- Paths Config
#----Go
export GOPATH=$HOME/go

#----PNPM 
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

#----NVM 
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
