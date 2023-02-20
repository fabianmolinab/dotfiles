if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#FZF
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --no-ignore-vcs"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--height 96% --reverse --preview 'cat {}'"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

POWERLEVEL9K_MODE="nerdfont-complete"


# Uncomment the following line to use case-sensitive completion.
 CASE_SENSITIVE="true"


# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# COMPLETION_WAITING_DOTS="true"

# DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-z)
source $ZSH/oh-my-zsh.sh

 #Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='nano'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

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

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# pnpm
export PNPM_HOME="/home/fabian/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
