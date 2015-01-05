# dotfiles

The dotfiles we use when pairing.

Uses the `homesick` format.

## Installation

### First Setup

    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh # oh my zsh install
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
    cd ~/.homesick/repos/ContinuityControl/dotfiles
    bundle
