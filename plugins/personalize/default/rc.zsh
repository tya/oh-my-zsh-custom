# -*- mode: sh -*-
#############################################################################
# FILE: rc.zsh
#
# This file loads Ty's zsh run control.
#
#############################################################################

#############################################################################
# zsh setup
#############################################################################
# add to path
if [ -d ${HOME}/bin ]; then
    export PATH=${HOME}/bin:${PATH}
fi

# load zsh auto-completion
fpath=(/usr/local/share/zsh-completions $fpath)

# load the grc colorization aliases
source "`brew --prefix grc`/etc/grc.bashrc"


#############################################################################
# java setup
#############################################################################
setjavadefault
nojavadebug

#############################################################################
# add ssh key to ssh-agent (once)
#############################################################################
ssh-add -l &> /dev/null || ssh-add &> /dev/null
