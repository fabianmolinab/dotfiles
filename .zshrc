# !/bin/zsh
#This file uses zinit as the zsh package manager, for the prompt style it uses PowerLevel10k.
# As a requirement you must have zsh and zinit installed.
# To install zinit with the following command: 
# bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install .sh)"

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Source and auto loading of `zinit` plugin manager.
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

#Load powerlevel10k
zinit ice depth"1" 
zinit light romkatv/powerlevel10k

# Add zsh-z plugin.
zinit light agkozak/zsh-z

# Add zsh-autosuggestions plugin.
zinit light zsh-users/zsh-autosuggestions

# Add zsh-syntax-highlighting plugin.
zinit light zdharma-continuum/fast-syntax-highlighting

# Annexes for `zinit`.
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

#Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='nano'
 fi

 #Text Editor Git
export GIT_EDITOR='/usr/bin/nvim -c "set fenc=utf-8" -c "set spell" -c "set syn=gitcommit"'

#---- ALIAS -----
#eza
alias -g ll="eza -l --group-directories-first --icons --classify -h --no-user"
alias -g lla="eza -lah --group-directories-first --icons --classify --no-user"
alias -g llh="eza -l --group-directories-first --icons --tree --classify --no-user --level=2"
alias fzfi="rg --files --hidden --follow --no-ignore-vcs -g '!{node_modules,.git}' | fzf"
alias tree='eza -T --icons --classify --group --group-directories-first --time-style=long-iso --color-scale -a -I=".git|.svn|.hg|CSV|.DS_Store|Thumbs.db|node_modules|bower_components|.code-search"'

# Package
alias install="sudo apt install"
alias update="sudo apt upgrade"

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
#export GOROOT=/usr/local/go

#----PNPM 
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

#----NVM 
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# --- Deno
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

#--- Browsers
export LAUNCHPAD_BROWSERS="chrome,firefox"

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# bun completions
[ -s "/home/fabian/.bun/_bun" ] && source "/home/fabian/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/home/fabian/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
