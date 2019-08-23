#############################################################################
# FILE: aliases.zsh
#
# This file loads OSX personalized aliases
#
#############################################################################

#############################################################################
# Application Aliases
#############################################################################
if [[ "$OS" == 'osx' ]]; then
    alias emacs='open -a Emacs'
    alias st='open -a SourceTree'
fi

# open buildkite page from withing a repo
alias bk="open https://buildkite.com/sendgrid/$(basename $(git config --get remote.origin.url) .git)"
