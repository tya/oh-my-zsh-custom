export COMPLETION_WAITING_DOTS="true"
export DISABLE_AUTO_TITLE="true"
export DISABLE_CORRECTION="true"

# homebrew zsh completion and autompletion
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# https://github.com/zsh-users/zsh-completions#oh-my-zsh
#autoload -Uz compinit && compinit

# add aws-okta completion
source <(aws-okta completion zsh)
