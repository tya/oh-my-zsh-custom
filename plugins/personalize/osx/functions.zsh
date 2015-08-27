############################################################################
# FILE: functions.zsh
#
# This file loads Ty's OSX zsh functions
#
#############################################################################

#############################################################################
# function: setTerminalText
# usage setTerminalText <mode> <name>
# $1 = type; 0 - both, 1 - tab, 2 - title
# return = text
#############################################################################
function setTerminalText {
    # echo works in bash & zsh
    local mode=$1 ; shift
    echo -ne "\033]$mode;$@\007"
}

#############################################################################
# function: iname (set tab name and window title)
# usage iname <name>
# $1 = name
# return = text
#############################################################################
function iname {
    setTerminalText 0 $@;
}

#############################################################################
# function: itab
# usage itab <tabname>
# $1 = tabname
# return = text
#############################################################################
function itab  {
    setTerminalText 1 $@;
}

#############################################################################
# function: ititle
# usage ititle <titlename>
# $1 = type; 0 - both, 1 - tab, 2 - title
# return = text
#############################################################################
function ititle {
    setTerminalText 2 $@;
}
