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
# golang stuff
#############################################################################
export GOPATH="${HOME}/.gopath"
export GOBIN="${GOPATH}/bin"
export GOROOT="${GOENV_ROOT}/versions/$(goenv version | cut -f1 -d' ')"
export GOENV_DISABLE_GOPATH=1

#############################################################################
# AWS SAM stuff
#############################################################################
export SAM_CLI_TELEMETRY=0
