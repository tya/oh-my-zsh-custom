# -*- mode: sh -*-
#############################################################################
# FILE: rc.zsh
#
# This file loads Ty's global zsh run control.
#
#############################################################################

#############################################################################
# path setup
#############################################################################
if [ -d /usr/local/sbin ]; then
    export PATH=/usr/local/sbin:${PATH}
fi
if [ -d ${GOBIN} ]; then
    export PATH=${GOBIN}:${PATH}
fi
if [ -d ${HOME}/bin ]; then
    export PATH=${HOME}/bin:${PATH}
fi

#############################################################################
# tmux tpm install
#############################################################################
if [ ! -d ~/.tmux/plugins/tpm ]; then
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm \
   && ~/.tmux/plugins/tpm/bin/install_plugins
fi

#############################################################################
# anyenv setup
#############################################################################
eval "$(anyenv init -)"

#############################################################################
# github setup
#############################################################################
eval "$(hub alias -s)"
