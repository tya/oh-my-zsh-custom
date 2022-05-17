# -*- mode: sh -*-
#############################################################################
# FILE: rc.zsh
#
# This file loads twilio zsh run control.
#
#############################################################################
# load twilio settings (don't want to keep these in public github)
for f ($HOME/.segment/*.zsh(N)); do
  source $f
done
