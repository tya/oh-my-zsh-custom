# -*- mode: sh -*-
################################################################################
#
# ZSH Setup
#
################################################################################

PERSONALIZE=$ZSH_CUSTOM/plugins/personalize

directories=(default os local)
for d in $directories; do
    for f ($PERSONALIZE/$d/*.zsh(N)); do
	source $f
    done
done
unset d
unset f

#############################################################################
# function: setTerminalText
# usage setTerminalText <mode> <name>
# $1 = type; 0 - both, 1 - tab, 2 - title
# rest = text
#############################################################################
setTerminalText () {
    # echo works in bash & zsh
    local mode=$1 ; shift
    echo -ne "\033]$mode;$@\007"
}

iname () {
    setTerminalText 0 $@;
}

itab () {
    setTerminalText 1 $@;
}

ititle () {
    setTerminalText 2 $@;
}

#############################################################################
# Function cleanpath
# remove duplicates in PATH, but keep the order
# usage:  cleanpath
# 
#############################################################################
cleanpath() {
    PATH="$(printf "%s" "${PATH}" | /usr/bin/awk -v RS=: -v ORS=: '!($0 in a) {a[$0]; print}')"
    PATH="${PATH%:}"  # remove trailing colon
    export PATH
}

#############################################################################
# Function setjava5
# usage: setjava5
#############################################################################
setjava5 () {
    [ -d $JAVA_HOME_5 ] && export JAVA_HOME=$JAVA_HOME_5
    echo JAVA_HOME=$JAVA_HOME
}

#############################################################################
# Function setjava6
# usage: setjava6
#############################################################################
setjava6 () {
    [ -d $JAVA_HOME_6 ] && export JAVA_HOME=$JAVA_HOME_6 
}


#############################################################################
# Function setdebug
# usage: setdebug
#############################################################################
setdebug () {
    export MAVEN_OPTS="-Xmx2048m -Xms1024m -Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=5005,server=y,suspend=n"
}

#############################################################################
# Function nodebug
# usage: nodebug
#############################################################################
nodebug () {
    export MAVEN_OPTS="-Xmx2048m -Xms1024m"
}

