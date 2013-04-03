export EDITOR=vim
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.oh-my-zsh-custom
export ZSH_THEME="continuity"
plugins=(git git-flow rails3 ruby osx gem vi-mode rvm bundler)

if [[ -f $HOME/rvm/bin/rvm-prompt ]]; then
  alias rvm-prompt=$HOME/rvm/bin/rvm-prompt
elif [[ -f /usr/local/rvm/bin/rvm-prompt ]]; then
  alias rvm-prompt=/usr/local/rvm/bin/rvm-prompt
fi

source $ZSH/oh-my-zsh.sh

# oh-my-zsh aliases cd. since system-wide rvm loads before oh-my-zsh re-source rvm cd so per project .rvmrc works
if [[ -f /usr/local/rvm/scripts/cd ]]; then
  source /usr/local/rvm/scripts/cd
fi

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

__rvm_project_rvmrc
