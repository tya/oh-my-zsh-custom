# -*- mode: sh -*-
#############################################################################
# FILE: aliases.zsh
#
# This file loads sendgrid aliases
#
#############################################################################

# open buildkite page from withing a repo
alias sgbk="open https://buildkite.com/sendgrid/$(basename $(git config --get remote.origin.url) .git)"
