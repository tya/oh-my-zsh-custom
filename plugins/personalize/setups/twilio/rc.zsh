# -*- mode: sh -*-
#############################################################################
# FILE: rc.zsh
#
# This file loads twilio zsh run control.
#
#############################################################################
# load twilio settings (don't want to keep these in public github)
for f ($HOME/.twilio/*.zsh(N)); do
  source $f
done

# load owl settings
if command -V "$OWL/bin/owl" &> /dev/null; then
  eval "$("$OWL/bin/owl" init -)"
fi
