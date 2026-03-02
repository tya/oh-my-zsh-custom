export COMPLETION_WAITING_DOTS="true"
export DISABLE_AUTO_TITLE="true"
export DISABLE_CORRECTION="true"

# brew info zsh-completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit

fi

