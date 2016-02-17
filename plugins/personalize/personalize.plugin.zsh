# -*- mode: sh -*-
################################################################################
#
# ZSH Setup
#
################################################################################

personalize() {
  PERSONALIZE=$ZSH_CUSTOM/plugins/personalize

  # load global settings
  for f ($PERSONALIZE/global/*.zsh(N)); do
    source $f
  done

  # load os specific ettings settings
  for f ($PERSONALIZE/$OS/*.zsh(N)); do
    source $f
  done

  # load sendgrid settings
  for f ($PERSONALIZE/sendgrid/*.zsh(N)); do
    source $f
  done
}

personalize

# remove duplicates from path
cleanpath
