# -*- mode: sh -*-
#############################################################################
# FILE: rc.zsh
#
# This file loads Ty's OSX zsh run control.
#
#############################################################################
# command-not-found
if brew command command-not-found-init > /dev/null 2>&1; then eval "$(brew command-not-found-init)"; fi
