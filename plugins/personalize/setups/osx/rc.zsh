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
  export HOMEBREW_COMMAND_NOT_FOUND_HANDLER="$(brew --repository)/Library/Homebrew/command-not-found/handler.sh"
  if [ -f "$HOMEBREW_COMMAND_NOT_FOUND_HANDLER" ]; then
    source "$HOMEBREW_COMMAND_NOT_FOUND_HANDLER";
  fi
fi
