# -*- mode: sh -*-
#############################################################################
# FILE: rc.zsh
#
# This file loads sendgrid zsh run control.
#
#############################################################################

#############################################################################
# chefdk setup
#############################################################################
eval "$(chef shell-init zsh)"

#############################################################################
# setup boot2docker
#############################################################################
# To reload boot2docker after an upgrade:
#   launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.boot2docker.plist
#   launchctl load ~/Library/LaunchAgents/homebrew.mxcl.boot2docker.plist
#[[ $(boot2docker status) == "running" ]] && $(boot2docker shellinit 2>/dev/null)
#$(boot2docker shellinit 2>/dev/null)
