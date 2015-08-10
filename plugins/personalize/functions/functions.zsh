############################################################################
# FILE: functions.zsh
#
# This file loads Ty's zsh functions
#
#############################################################################

#############################################################################
# function: itab  (name an iterm tab)
# usage itab <name>
#############################################################################
function itab {
    echo -ne "\033]0;"$@"\007"
}

#############################################################################
# Function cleanpath
# remove duplicates in PATH, but keep the order
# usage:  cleanpath
#
#############################################################################
function cleanpath {
    PATH="$(printf "%s" "${PATH}" | /usr/bin/awk -v RS=: -v ORS=: '!($0 in a) {a[$0]; print}')"
    PATH="${PATH%:}"  # remove trailing colon
    export PATH
}

#############################################################################
# Function ddig (docker dig)
# usage: ddig
#############################################################################
function ddig {
    dig @$(boot2docker ip) $@.docker +search +short
}

#############################################################################
# Function setjava5
# usage: setjava5
#############################################################################
function setjava5 {
    [ -d $JAVA_HOME_5 ] && export JAVA_HOME=$JAVA_HOME_5
    echo JAVA_HOME=$JAVA_HOME
}

#############################################################################
# Function setjava6
# usage: setjava6
#############################################################################
function setjava6 {
    [ -d $JAVA_HOME_6 ] && export JAVA_HOME=$JAVA_HOME_6
}


#############################################################################
# Function setdebug
# usage: setdebug
#############################################################################
function setdebug {
    export MAVEN_OPTS="-Xmx2048m -Xms1024m -Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=5005,server=y,suspend=n"
}

#############################################################################
# Function nodebug
# usage: nodebug
#############################################################################
function nodebug {
    export MAVEN_OPTS="-Xmx2048m -Xms1024m"
}

#############################################################################
# Function nodebug
# usage: nodebug
#############################################################################
function route2docker {
    sudo route -n add 172.17.0.0/16 $(boot2docker ip)
}

