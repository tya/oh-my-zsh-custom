# -*- mode: sh -*-
#############################################################################
# FILE: exports.zsh
#
# This file loads osx zsh exports.
#
#############################################################################

#############################################################################
# osx setup
#############################################################################
if [[ "$OS" == 'osx' ]]; then
    export JAVA_HOME_5="/System/Library/Frameworks/JavaVM.framework/Versions/1.5/Home"
    export JAVA_HOME_6="/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home"
    export JAVA_HOME_DEFAULT="$(/usr/libexec/java_home)"
    export XBMC_ADDONS="$HOME/Library/Application Support/XBMC/addons"
fi
