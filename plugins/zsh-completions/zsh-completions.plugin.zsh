export COMPLETION_WAITING_DOTS="true"
export DISABLE_AUTO_TITLE="true"
export DISABLE_CORRECTION="true"

fpath=(/usr/local/share/zsh-completions $fpath)

# https://github.com/zsh-users/zsh-completions#oh-my-zsh
autoload -U compinit && compinit
