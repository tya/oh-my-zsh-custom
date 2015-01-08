# -*- mode: sh -*-
################################################################################
#
# ZSH Setup
#
################################################################################

sendgrid() {
    SENDGRID=$ZSH_CUSTOM/plugins/sendgrid
    directories=(functions default)
    for d in $directories; do
        for f ($SENDGRID/$d/*.zsh(N)); do
	    source $f
        done
    done
    unset d
    unset f
}

sendgrid
