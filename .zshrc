# 
# This file is based on the configuration written by
# Bruno Bonfils, <asyd@debian-fr.org> 
# Written since summer 2001

#
# My functions (don't forget to modify fpath before call compinit !!)
fpath=($HOME/.zsh/functions $fpath)

# colors
# eval `dircolors $HOME/.zsh/colors`

autoload -U zutil
autoload -U compinit
autoload -U complist

bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward
bindkey '^K' kill-whole-line
bindkey "\e[H" beginning-of-line        # Home (xorg)
bindkey "\e[1~" beginning-of-line       # Home (console)
bindkey "\e[4~" end-of-line             # End (console)
bindkey "\e[F" end-of-line              # End (xorg)
bindkey "\e[2~" overwrite-mode          # Ins
bindkey "\e[3~" delete-char             # Delete
bindkey '\eOH' beginning-of-line
bindkey '\eOF' end-of-line

# Activation
compinit

# Resource files
for file in $HOME/.zsh/rc/*.rc; do
	source $file
done

export HISTFILE=~/.zsh_history
export HISTSIZE=500
export SAVEHIST=500

if [ -x /Applications/MacVim.app/Contents/MacOS/Vim ]
then
  export EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim'
else
  export EDITOR='vim'
fi

setopt append_history hist_ignore_dups hist_find_no_dups

# Git command for Dartmouth
function new-git() {
ssh webops@dev.dartmouth.edu "mkdir git/$1.git && cd git/$1.git && git --bare init"
git remote add origin webops@dev.dartmouth.edu:git/$1.git
git push origin master
git config branch.master.remote origin
git config branch.master.merge refs/heads/master
git config push.default current
}

source "$HOME/.zshenv"
PATH=$HOME/bin:/usr/local/git/bin:/usr/local/mysql/bin:/usr/local/bin:$PATH
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
. ~/.liquidprompt/liquidprompt
