export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.oh-my-zsh-custom
export ZSH_THEME="jnimety"
plugins=(git git-flow rails3 ruby osx gem vi-mode bundler)

source $ZSH/oh-my-zsh.sh

#disable ctrl-s/suspension
stty stop undef
setopt NO_FLOW_CONTROL
setopt magicequalsubst
setopt interactivecomments
bindkey '^R' history-incremental-search-backward
autoload -U zrecompile

__rvm_project_rvmrc
