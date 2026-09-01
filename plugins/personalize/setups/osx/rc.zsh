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

#############################################################################
# Ghostty config editor -> MacVim
#   Ghostty's open_config (cmd+,) hands the config file to the macOS default
#   handler, not $EDITOR. Point plain-text files at MacVim so it opens in vim.
#   Idempotent: the `duti -d` probe keeps re-launched shells cheap, `duti -s`
#   only fires when the handler isn't already MacVim.
#   (The Ghostty config path is extensionless -> typed public.data, which
#   can't be reassigned; ~/.config/ghostty/config is a symlink to a .txt
#   target so cmd+, resolves through this public.plain-text handler.)
#############################################################################
if command -v duti &> /dev/null && [ -d "/Applications/MacVim.app" ]; then
  if [[ "$(duti -d public.plain-text 2>/dev/null)" != "org.vim.MacVim" ]]; then
    duti -s org.vim.MacVim public.plain-text all
  fi
fi
