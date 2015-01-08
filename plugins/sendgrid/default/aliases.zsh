# -*- mode: sh -*-
#############################################################################
# FILE: aliases.zsh
#
# This file loads sendgrid aliases
#
#############################################################################

#############################################################################
## Fixup for sendgrid
## PROBLEM ss command overloaded
## * oh-my-zsh rails.plugin.zsh plugin defines alias ss
## * uptime CLI tool is ss (see uptime.sendgrid.net)
## SOLUTION: unalias zsh plugin alias off ss
##############################################################################
unalias ss
