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
  export GRAILS_OPTS="-server -Xms2048m -XX:MaxPermSize=2048m -Xmx4096M -XX:PermSize=2048m"
  export GRAILS_HOME=$HOME/grails/grails-2.5.0
  export PATH=$GRAILS_HOME/bin:$PATH
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_80.jdk/Contents/Home
  export JAVA_TOOL_OPTIONS=-Dhttps.protocols=TLSv1.2
  #export JAVA_HOME=$JAVA_HOME
}

function unset-grails(){
  WPATH=:$PATH:
  REMOVE=$GRAILS_HOME/bin
  WPATH=${WPATH/:$REMOVE:/:}
  WPATH=${WPATH%:}
  WPATH=${WPATH#:}
  PATH=$WPATH
  unset GRAILS_OPTS
  unset GRAILS_HOME
  unset JAVA_TOOL_OPTIONS
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_111.jdk/Contents/Home
}

source "$HOME/.zshenv"
source "$HOME/.iterm2_shell_integration.zsh"
JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_111.jdk/Contents/Home
#JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_80.jdk/Contents/Home
OCI_DIR=~/opt/oracle/instantclient_12_2
PATH=$HOME/bin:/usr/local/git/bin:/usr/local/mysql/bin:/usr/local/bin:$HOME/Library/Python/3.7/bin:$PATH
. ~/.liquidprompt/liquidprompt

eval "$(rbenv init -)"
