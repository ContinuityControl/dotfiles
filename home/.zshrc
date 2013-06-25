export EDITOR=vim
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.oh-my-zsh-custom
export ZSH_THEME="continuity"
plugins=(git git-flow rails3 ruby osx gem vi-mode rvm bundler)

source $ZSH/oh-my-zsh.sh

#disable ctrl-s/suspension
stty stop undef
setopt NO_FLOW_CONTROL
setopt magicequalsubst
setopt interactivecomments
bindkey '^R' history-incremental-search-backward
autoload -U zrecompile

#ignore obnoxious stuff
alias git='nocorrect git'

# Add the following to your ~/.bashrc or ~/.zshrc
#
# Alternatively, copy/symlink this file and source in your shell.  See `hitch --setup-path`.

hitch() {
  command hitch "$@"
  if [[ -s "$HOME/.hitch_export_authors" ]] ; then source "$HOME/.hitch_export_authors" ; fi
}
alias unhitch='hitch -u'

# Uncomment to persist pair info between terminal instances
hitch

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Allow for local environment configuration in ~/.zsh/*.zsh
for config_file (~/.zsh/*.zsh); do
  source $config_file
done
