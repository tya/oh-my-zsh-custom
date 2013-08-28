# -*- mode: sh -*-
#############################################################################
# FILE: aliases.zsh
#
# This file loads Ty's personalized aliases
#
#############################################################################

#############################################################################
# Direcotry movement aliases
#############################################################################
alias up='cd ..; echo $PWD'
alias up2='cd ../..; echo $PWD'
alias up3='cd ../../..; echo $PWD'
alias up4='cd ../../../..; echo $PWD'


#############################################################################
# ls aliases
#############################################################################
alias ls='ls -hG'
alias lll='ls -alhG $1 | less'
alias llm='ls -alhG $1 | more'
alias ll='ls -lhG'
alias la='ls -alhG'
alias lt='ls -ltG'


#############################################################################
# Terminal aliases
#############################################################################
alias pd=pushd
alias pop=popd
alias so=source


#############################################################################
# Display aliases
#############################################################################
alias pdis='echo DISPLAY=$DISPLAY'


#############################################################################
# Program shortcut aliases
#############################################################################
alias c='clear'
alias h=history
alias l=less
alias m=more
alias lns='ln -s $1'
alias dirs='dirs -v'
alias grep='grep --color'
alias egrep='egrep --color'
alias fgrep='fgrep --color'


#############################################################################
# Search aliases
#############################################################################
alias fndenv='env | grep -i $1'
alias fndcmd='history | grep -i $1'
alias fenv='env | grep -i $1'
alias fcmd='history | grep -i $1'


#############################################################################
# Typo aliases
#############################################################################
alias chomd=chmod
alias suod=sudo

alias sudo='sudo '
#(recognize the space!) 
# see http://serverfault.com/questions/61321/how-to-pass-alias-through-sudo
# manpage: A trailing space in value causes the next word to be checked for
#          alias substitution when the alias is expanded


#############################################################################
# scm aliases
#############################################################################
alias rmorig='find . -type f -name "*.orig" -delete'


#############################################################################
# git scm aliases
#############################################################################
alias gf="git fetch"
alias gs="git st"
alias gl="git log -n 5"

alias gitf="git flow"
alias gff="git flow feature"
alias gitff="git flow feature"


#############################################################################
# maven aliases
#############################################################################
alias mvnpre='mvn release:prepare'
alias mvnperf='mvn -Darguments="-DskipTests" release:perform'