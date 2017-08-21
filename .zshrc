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

function dartlist() {
ssh git@codehome.dartmouth.edu list
}

function set-grails25(){
  export GRAILS_OPTS="-server -Xms1024m -XX:MaxPermSize=1024m -Xmx2048M -XX:PermSize=256m"
  export GRAILS_HOME=$HOME/Grailses/grails-2.5.0
  export PATH=$GRAILS_HOME/bin:$PATH
  export JAVA_HOME=$JAVA_HOME
}

function unset-grails(){
  unset GRAILS_OPTS=""
  unset GRAILS_HOME=""
}

source "$HOME/.zshenv"
source "$HOME/.iterm2_shell_integration.zsh"
JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_111.jdk/Contents/Home
PATH=$HOME/bin:$HOME/Library/Python/2.7/bin:/usr/local/git/bin:/usr/local/mysql/bin:/usr/local/bin:$PATH
. ~/.liquidprompt/liquidprompt

eval "$(rbenv init -)"
