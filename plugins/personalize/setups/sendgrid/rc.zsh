# -*- mode: sh -*-
#############################################################################
# FILE: rc.zsh
#
# This file loads sendgrid zsh run control.
#
#############################################################################
# load sendgrid settings (don't want to keep these in public github)
for f ($HOME/.sendgrid/*.zsh(N)); do
  source $f
done
