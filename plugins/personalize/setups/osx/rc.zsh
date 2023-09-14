# -*- mode: sh -*-
#############################################################################
# FILE: rc.zsh
#
# This file loads Ty's OSX zsh run control.
#
#############################################################################

#############################################################################
# anyenv setup
#   do this before homebrew
#############################################################################
if command -v anyenv &> /dev/null ; then
    eval "$(anyenv init -)"
fi

#############################################################################
# command-not-found
#############################################################################
if brew command command-not-found-init > /dev/null 2>&1; then
    export HB_CNF_HANDLER="$(brew --prefix)/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"
    if [ -f "$HB_CNF_HANDLER" ]; then
      source "$HB_CNF_HANDLER";
    fi
fi
