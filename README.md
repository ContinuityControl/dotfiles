# dotfiles

The dotfiles we use when pairing.

Uses the `homesick` format.

## Installation

### Warning, Warning Will Robinson!

Using the stock OSX version of git will likely cause problems. You probably want to `brew install git` and ensure that /usr/local/bin precedes /usr/bin in your $PATH. You may also want to `brew install vim` (if you don't, you'll run into a bug in `vim` that causes it to crash with the message `Caught deadly ABRT signal`).

### First Setup

    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
    gem install homesick
    homesick clone    benjaminoakes/homesick-vi-everywhere
    homesick clone    ContinuityControl/dotfiles
    homesick symlink  homesick-vi-everywhere
    homesick symlink  dotfiles

### Optional
If you're going to use hitch install it by running bundle in the dotfiles directory

    cd ~/.homesick/repos/dotfiles/home
    bundle

### Updates

    homesick pull     homesick-vi-everywhere
    homesick pull     dotfiles
    homesick symlink  homesick-vi-everywhere
    homesick symlink  dotfiles

### Updating

    cd ~/.homesick/repos/dotfiles
    bundle
