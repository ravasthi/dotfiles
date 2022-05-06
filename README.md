# Richa’s dotfiles

These are the command-line setup and configuration files I use for all my computers, stored on Github for easier sharing between computers and with other people.

## Credits

* Inspired by dotfiles from [Ryan Bates](https://github.com/ryanb/dotfiles) and [thoughtbot](http://github.com/thoughtbot/dotfiles).
* ~~Mostly stolen~~ Tweaked from [Matt’s dotfiles](https://github.com/mbrictson/dotfiles).
* vim, tmux and zsh setup informed heavily by [Trae’s dotfiles](https://github.com/trobrock)
* Other utilities repurposed, tweaked or outright stolen from around the internet.

## Prerequisites

These dotfiles assume a Mac with the Xcode command line tools, rvm, rbenv, or asdf, and Homebrew. See *Shell support* for details. In addition, the `highline` gem is required to run the installation script.

## What’s in the box

### Shell support

These dotfiles support both bash and oh my zsh.

Some features of the `bashrc` may work only with bash version 4.2 and greater with bash-completion, which may not be installed by default on the Mac, depending on the version of your OS. Consider using these steps to get it:

* `brew install bash bash-completion`
* Add `$HOMEBREW_PREFIX/bin/bash` to `/etc/shells`
* Change your shell to `$HOMEBREW_PREFIX/bin/bash` by running `chsh`

For oh my zsh setup, do the following:

* Install [oh my zsh](https://github.com/robbyrussell/oh-my-zsh)

### Command-line goodness

* Shell configuration includes a supercharged prompt for both bash and zsh with ruby and git information, with help from the [zsh-git-prompt](https://github.com/olivierverdier/zsh-git-prompt/blob/master/zshrc.sh) and [bash-git-prompt](https://github.com/magicmonty/bash-git-prompt) plugins. To tweak, change the configuration in `git-prompt-colors.sh` for bash and `oh-my-zsh-custom/themes/richa.zsh-theme` for zsh.

    <img style="max-width: 100%;" src="https://s3.amazonaws.com/f.cl.ly/items/1D300k0E3y3F3U392s3r/Screen%20Shot%202015-12-21%20at%209.59.22%20AM.png" alt="fancy prompt!" />

* [vi command mode](http://www.catonmat.net/blog/bash-vi-editing-mode-cheat-sheet/) is enabled by default in both bash and zsh. To switch back to the default emacs mode, remove the `set -o vi` line in `bashrc` and the `vi-mode` plugin from `zshrc`.

### Editors

* Vim configuration with support for selected plugins, with plugin management by [vim-plug](https://github.com/junegunn/vim-plug). To use:

    * `curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
    * If desired, tweak the font and color scheme settings. The default color scheme is [PaperColor](http://vimcolors.com/234/PaperColor/light). The default font is [Espresso Mono](https://twitter.com/chrisbowler/status/205688974369492992), a variant of [DejaVu Sans Mono](http://dejavu-fonts.org/wiki/Main_Page).
    * Start vim
    * Run `PlugInstall` in command mode.

* An `edit` shim will launch `code` (Visual Studio Code) if you are on your local Mac, and fall back to `vi` if you are logged in via ssh. This shim is used as the git editor and svn editor.
### Ruby stuff

An `r` command serves as a shortcut for running `bundle exec rake` or `bundle exec rails`. It's pretty smart, so `r s` will expand to `bundle exec rails server`, and `r db` will expand to `bundle exec rake db:console`. No more fat-finger mistakes of `rails` vs `rake`!

### Other goodies

* This repo also comes with tmux configuration, for you terminal purists. To use:

    * `brew install tmux`
    * `brew install reattach-to-user-namespace`

* Multi-monitor window management setup files are available for [Hammerspoon](http://www.hammerspoon.org):
    * Download and install the [latest release](https://github.com/Hammerspoon/hammerspoon/releases/latest)
    * Tweak the configuration in `hammerspoon/init.lua` as you like


## Installation

1. Install the `highline` gem:

        gem install highline

2. Choose a place to store the dotfiles, like `~/Library/dotfiles`.

    ```
    git clone git://github.com/ravasthi/dotfiles ~/Library/dotfiles
    cd ~/Library/dotfiles
    git submodule init
    git submodule update
    rake install
    ```

