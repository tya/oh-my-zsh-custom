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
# python setup
#############################################################################
if [ -d ${PYENV_ROOT}/bin ]; then
    export PATH=${PYENV_ROOT}/bin:${PATH}
fi


# pyenv setup
if which pyenv > /dev/null; then 
    eval "$(pyenv init -)"
fi


#############################################################################
# ruby setup
#############################################################################
if [ -d ${RBENV_ROOT}/bin ]; then
    export PATH=${RBENV_ROOT}/bin:${PATH}
fi


# rbenv setup
if which rbenv > /dev/null; then 
    eval "$(rbenv init -)"
fi



#############################################################################
# nodejs/npm setup
#############################################################################
if [ -d /usr/local/share/npm/bin ]; then
    export PATH=/usr/local/share/npm/bin:${PATH}
fi


#############################################################################
# add ssh key to ssh-agent (once)
#############################################################################
ssh-add -l &> /dev/null || ssh-add &> /dev/null
