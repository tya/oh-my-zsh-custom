# -*- mode: sh -*-
################################################################################
#
# ZSH Setup
#
################################################################################

init() {
    PERSONALIZE=$ZSH_CUSTOM/plugins/personalize
    
    if [ -d ${HOME}/bin ]; then
        export PATH=${HOME}/bin:${PATH}
    fi
    
    if [ -d /usr/local/share/npm/bin ]; then
        export PATH=/usr/local/share/npm/bin:${PATH}
    fi
    
    directories=(default os local)
    for d in $directories; do
        for f ($PERSONALIZE/$d/*.zsh(N)); do
	    source $f
        done
    done
    unset d
    unset f

    setjavadefault
}

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
# Function setjavadefault
# usage: setjavadefault
#############################################################################
function setjavadefault {
    [ -d $JAVA_HOME_DEFAULT ] && export JAVA_HOME=$JAVA_HOME_DEFAULT 
}


#############################################################################
# Function setjava5
# usage: setjava5
#############################################################################
setjava5 () {
    [ -d $JAVA_HOME_5 ] && export JAVA_HOME=$JAVA_HOME_5
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

init
