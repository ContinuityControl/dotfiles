export EDITOR=vim
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.oh-my-zsh-custom
export ZSH_THEME="continuity"
plugins=(git git-flow rails ruby osx gem vi-mode rvm bundler)

source $ZSH/oh-my-zsh.sh

export LC_ALL=en_US.UTF-8

#disable ctrl-s/suspension
stty stop undef
setopt NO_FLOW_CONTROL
setopt magicequalsubst
setopt interactivecomments
bindkey '^R' history-incremental-search-backward
autoload -U zrecompile

wemuxj() {
  cd "$HOME/workspace/control"
  wemux join "$1" && wemux
}

fliptable() { echo "（╯°□°）╯ ┻━┻"; } # Flip a table. Example usage: fsck -y /dev/sdb1 || fliptable
alias tableflip='fliptable'
trollface() {
	echo "
	░░░░░▄▄▄▄▀▀▀▀▀▀▀▀▄▄▄▄▄▄░░░░░░░
	░░░░░█░░░░▒▒▒▒▒▒▒▒▒▒▒▒░░▀▀▄░░░░
	░░░░█░░░▒▒▒▒▒▒░░░░░░░░▒▒▒░░█░░░
	░░░█░░░░░░▄██▀▄▄░░░░░▄▄▄░░░░█░░
	░▄▀▒▄▄▄▒░█▀▀▀▀▄▄█░░░██▄▄█░░░░█░
	█░▒█▒▄░▀▄▄▄▀░░░░░░░░█░░░▒▒▒▒▒░█
	█░▒█░█▀▄▄░░░░░█▀░░░░▀▄░░▄▀▀▀▄▒█
	░█░▀▄░█▄░█▀▄▄░▀░▀▀░▄▄▀░░░░█░░█░
	░░█░░░▀▄▀█▄▄░█▀▀▀▄▄▄▄▀▀█▀██░█░░
	░░░█░░░░██░░▀█▄▄▄█▄▄█▄████░█░░░
	░░░░█░░░░▀▀▄░█░░░█░█▀██████░█░░
	░░░░░▀▄░░░░░▀▀▄▄▄█▄█▄█▄█▄▀░░█░░
	░░░░░░░▀▄▄░▒▒▒▒░░░░░░░░░░▒░░░█░
	░░░░░░░░░░▀▀▄▄░▒▒▒▒▒▒▒▒▒▒░░░░█░
	░░░░░░░░░░░░░░▀▄▄▄▄▄░░░░░░░░█░░
	"
}

dayum() {
  echo "

                     ---------------
               -----------------------------
          ---------o-------o----o------o--------
       ----------o-----o------o----o------o--------
     -+----o---o----------o--------o----------------
    -++-----------o----------o------------o----------
    +++-----------------o----------o-----------------
   -+++++++++++++++++++++?-----------7Z88888888888888888
 SSSSOOOOOOSSSSSSSSSSOOOOSSSSSSZ888888888O8888OOOOOOOOOOOO
SSSSSSSSSSSSSSSS888888888OO88OOZO8OOOOOOOOOOOOOOOOOOOO8
SSSSSSSS..?OOO8888OOOOOOOO??OOO..OOOOODDOOODDOOODDDDOO88
SSSDDDDDDD..??OOOOOZZOOZ???+..DD888888888888888888888888
  8DDDDDDDDD..???????????..88888888888888888888888888888
  88DDDDDD888..???????..888888888888888888888888O7----
   -Z8888888888..???..888888Z--------------------------
   -------------...+-----------------------------------
   -+--------------------------------------------------
   -+++------------------------------------------------
   -++++++++++?---------------------------------------
  "
}
#ignore obnoxious stuff
alias git='nocorrect git'
alias rake='noglob rake'
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
PATH=$PATH:$HOME/bin # Make personal scripts available

# tell nokogiri to use sysem libraries instead of compiling packaged libs
export NOKOGIRI_USE_SYSTEM_LIBRARIES=1

# Allow for local environment configuration in ~/.zsh/*.zsh
if [ -d ~/.zsh ]; then
  for config_file (~/.zsh/*.zsh); do
    source $config_file
  done
fi

# RVM is a silly thing. This fixes tmux not loading gemset
# http://stackoverflow.com/a/6097090/3010499
cd .
