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
# goenv setup
#############################################################################
export GOENV_BIN="/Users/ty.alexander/.anyenv/envs/goenv/bin"

#############################################################################
# golang stuff
#############################################################################
export GOPATH="${HOME}/.gopath"
export GOBIN="${GOPATH}/bin"
export GOROOT="${GOENV_ROOT}/versions/$($GOENV_BIN/goenv version | cut -f1 -d' ')"
export GOENV_DISABLE_GOPATH=1

#############################################################################
# AWS SAM stuff
#############################################################################
export SAM_CLI_TELEMETRY=0
