export EDITOR=vim
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.oh-my-zsh-custom
export ZSH_THEME="continuity"
plugins=(git git-flow rails ruby macos gem vi-mode rvm bundler)

export LC_ALL=en_US.UTF-8

#disable ctrl-s/suspension
stty stop undef
setopt NO_FLOW_CONTROL
setopt magicequalsubst
setopt interactivecomments
bindkey '^R' history-incremental-search-backward
autoload -U zrecompile

fliptable() { echo "（╯°□°）╯ ┻━┻"; } # Flip a table. Example usage: fsck -y /dev/sdb1 || fliptable
alias tableflip='fliptable'
alias :fliptable:='fliptable'
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
alias :troll:='trollface'

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

doge() {
  echo "
  ─────────▄──────────────▄
  ────────▌▒█───────────▄▀▒▌
  ────────▌▒▒▀▄───────▄▀▒▒▒▐
  ───────▐▄▀▒▒▀▀▀▀▄▄▄▀▒▒▒▒▒▐
  ─────▄▄▀▒▒▒▒▒▒▒▒▒▒▒█▒▒▄█▒▐
  ───▄▀▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▀██▀▒▌
  ──▐▒▒▒▄▄▄▒▒▒▒▒▒▒▒▒▒▒▒▒▀▄▒▒▌
  ──▌▒▒▐▄█▀▒▒▒▒▄▀█▄▒▒▒▒▒▒▒█▒▐
  ─▐▒▒▒▒▒▒▒▒▒▒▒▌██▀▒▒▒▒▒▒▒▒▀▄▌
  ─▌▒▀▄██▄▒▒▒▒▒▒▒▒▒▒▒░░░░▒▒▒▒▌
  ─▌▀▐▄█▄█▌▄▒▀▒▒▒▒▒▒░░░░░░▒▒▒▐
  ▐▒▀▐▀▐▀▒▒▄▄▒▄▒▒▒▒▒░░░░░░▒▒▒▒▌
  ▐▒▒▒▀▀▄▄▒▒▒▄▒▒▒▒▒▒░░░░░░▒▒▒▐
  ─▌▒▒▒▒▒▒▀▀▀▒▒▒▒▒▒▒▒░░░░▒▒▒▒▌
  ─▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▐
  ──▀▄▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▄▒▒▒▒▌
  ────▀▄▒▒▒▒▒▒▒▒▒▒▄▄▄▀▒▒▒▒▄▀
  ───▐▀▒▀▄▄▄▄▄▄▀▀▀▒▒▒▒▒▄▄▀
  ──▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▀▀
  "
}
#ignore obnoxious stuff
alias git='nocorrect noglob git'
alias rake='noglob rake'
# Add the following to your ~/.bashrc or ~/.zshrc
#
# Alternatively, copy/symlink this file and source in your shell.  See `hitch --setup-path`.

hitch() {
  if [[ -s "$HOME/.rvm" ]]; then
    (rvm system; command hitch "$@")
  fi
  if [[ -s "$HOME/.hitch_export_authors" ]] ; then source "$HOME/.hitch_export_authors" ; fi
}
alias unhitch='hitch -u'
alias vi='vim'
alias openwork='vim -p $(git ls-files -m) $(git ls-files --others --exclude-standard)'

if [[ -s "$HOME/.rvm" ]]; then
  PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
  PATH=$PATH:$HOME/bin # Make personal scripts available
  PATH=$PATH:$HOME/.bin # Make dotfiles scripts available
fi

# tell nokogiri to use sysem libraries instead of compiling packaged libs
export NOKOGIRI_USE_SYSTEM_LIBRARIES=1

if [ -f "$HOME/.my_pairing_port" ]; then
  # Put your pairing port in ~/.my_pairing_port (single line with just your port number)
  my_pairing_port=$(cat $HOME/.my_pairing_port)
  alias rsp="rails server -u puma -b 127.0.0.1 --port ${my_pairing_port}"
fi

if [ -f "$HOME/.my_live_reload_port" ]; then
  # Put your live reload port in ~/.my_live_reload_port (single line with just your port number)
  export LIVE_RELOAD_PORT=$(cat $HOME/.my_live_reload_port)
fi

if [ -f "$HOME/.my_jasmine_server_port" ]; then
  # Put your jasmine port in ~/.my_jasmine_server_port (single line with just your port number)
  export JASMINE_SERVER_PORT=$(cat $HOME/.my_jasmine_server_port)
fi

# Allow for local environment configuration in ~/.zsh/*.zsh
if [ -d ~/.zsh ]; then
  for config_file (~/.zsh/*.zsh); do
    source $config_file
  done
fi

# Prevent warnings if the user has not set up a tmux user.conf file
if [ ! -f "$HOME/.tmux/user.conf" ]; then
  touch $HOME/.tmux/user.conf
fi
source $ZSH/oh-my-zsh.sh

# RVM is a silly thing. This fixes tmux not loading gemset
# http://stackoverflow.com/a/6097090/3010499
if [[ -s "$HOME/.rvm" ]]; then
  cd .
fi
