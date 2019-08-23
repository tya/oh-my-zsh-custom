# -*- mode: sh -*-
################################################################################
#
# ZSH Setup
#
################################################################################
# personalize zsh shell
personalize() {
  export PERSONALIZE_HOME="${ZSH_CUSTOM}/plugins/personalize"

  # source setups
  setups="${PERSONALIZE_HOME}/setups"
  for setup in $(find "${setups}" -iname "*.zsh" | sort -r); do
    source "${setup}"
  done
}

# load personalize scripts
personalize

# remove duplicates from path
cleanpath
