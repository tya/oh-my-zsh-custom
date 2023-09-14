# -*- mode: sh -*-
#############################################################################
# FILE: exports.zsh
#
# This file loads Ty's zsh exports.
#
#############################################################################

#############################################################################
# ohai stuff
#############################################################################
ARCHITECTURE=`uname -m`
PLATFORM=`uname -s`
OS='unknown'

if [[ "$PLATFORM" == 'Linux' ]]; then
    OS='linux'
elif [[ "$PLATFORM" == 'Darwin' ]]; then
    OS='osx'
fi

export ARCHITECTURE
export PLATFORM
export OS

#############################################################################
# shell settings
#############################################################################
export HISTCONTROL=ignoredups
export EDITOR=vim
export LESS="-RFX"

#############################################################################
# AWS SAM stuff
#############################################################################
export SAM_CLI_TELEMETRY=0
export AWS_SESSION_TTL=12h
export AWS_ASSUME_ROLE_TTL=12h
