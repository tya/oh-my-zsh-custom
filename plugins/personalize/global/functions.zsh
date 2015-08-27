############################################################################
# FILE: functions.zsh
#
# This file loads Ty's global zsh functions
#
#############################################################################

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
# usage: ddig <machine_name> <lookup_pattern>
#############################################################################
function ddig {
    local machine_name=$1 ; shift
    dig @$(docker-machine ip $machine) $@.docker +search +short
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
function setjava5 {
    [ -d $JAVA_HOME_5 ] && export JAVA_HOME=$JAVA_HOME_5
}

#############################################################################
# Function setjava6
# usage: setjava6
#############################################################################
function setjava6 {
    [ -d $JAVA_HOME_6 ] && export JAVA_HOME=$JAVA_HOME_6
}

#############################################################################
# Function setjavadebug
# usage: setjavadebug
#############################################################################
function setjavadebug {
    export MAVEN_OPTS="-Xmx2048m -Xms1024m -Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=5005,server=y,suspend=n"
}

#############################################################################
# Function nojavadebug
# usage: nojavadebug
#############################################################################
function nojavadebug {
    export MAVEN_OPTS="-Xmx2048m -Xms1024m"
}
