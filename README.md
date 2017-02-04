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

If you're going to use hitch or other ruby scripts in our dotfiles, install gem
dependencies by installing bundler (`gem install bundler`), and then running
`bundle` in the dotfiles directory:

    cd ~/.homesick/repos/dotfiles/home
    bundle

### Git Submodules

In order for vim plugins (and a couple tmux ones) to work correctly, you have
to go through a few steps.

Enter your git user details into `~/.gitconfig.d/user` and make sure you have
an ssh key added to Github.

```
[user]
  name = [YOUR NAME HERE]
  email = [YOUR EMAIL HERE]
```

Run `git submodule update` from the `~/.homesick/repos/dotfiles/home/.vim/bundle`
directory.

If at this point you have a bunch of unstaged changes in the gitsubmodule
directories, this is a known quirk with submodules and can be fixed. Until you
do, opening vim will likely result in a bunch of errors.

Note: These steps assume that the unstaged changes are a bunch of deletions in
each submodule directory. If this is not the case for you, then modify the
`foreach` commands to execute the correct git commands to undo the changes you
have.

1. Run `git submodule foreach --recursive git reset`
2. Run `git submodule foreach --recursive git co .`

### Updates

    homesick pull     homesick-vi-everywhere
    homesick pull     dotfiles
    homesick symlink  homesick-vi-everywhere
    homesick symlink  dotfiles

### Updating

    cd ~/.homesick/repos/dotfiles
    bundle
