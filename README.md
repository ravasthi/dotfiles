# ravasthi's dotfiles

**Please note that the TextMate features of these dotfiles require TextMate 2, currently in beta.**

## Installation

Choose a place to store the dotfiles, like `~/Library/dotfiles`.

```
git clone git://github.com/ravasthi/dotfiles ~/Library/dotfiles
cd ~/Library/dotfiles
rake install
```

### Shell support

This dotfiles repo currently supports both bash and oh my zsh, with bash support being deprecated sometime in the near future.

Some features of the `bashrc` may work only with bash version 4.2 and greater, which is not installed by default on the Mac. Consider using these steps to get it:

* `brew install bash`
* Add `/usr/local/bin/bash` to `/etc/shells`
* Change your shell to `/usr/local/bin/bash` by running `chsh`

For oh my zsh setup, do the following:

* Install [oh my zsh](https://github.com/robbyrussell/oh-my-zsh)
* Install [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
* Install the [github gem](https://github.com/defunkt/github-gem)—this is preferred over the `hub` brew.

## Notable features

* These dotfiles assume a Mac setup that uses `rvm` and Homebrew, with the `bash-completion` and `git` brews installed. See *Shell support* above for details.

* An `r` command serves as a shortcut for running `bundle exec rake` or `bundle exec rails`. It's pretty smart, so `r s` will expand to `bundle exec rails server`, and `r db` will expand to `bundle exec rake db:console`. No more fat-finger mistakes of `rails` vs `rake`!

* On your local Mac the Bash prompt will be nice and concise. Notice that deep paths are truncated to the last 2 segments:

        ~/.../Application Support/TextMate$

    When logged into a remote machine, you'll be reminded with the hostname:

        myserver /usr/local$

    Fancy git status is automatically included in the prompt:

        ~/.../ravasthi/dotfiles (master *%)$

    For oh my zsh users, the prompt contains much the same information, along with the current ruby version and gemset.

* An `edit` shim will launch `mate` (TextMate) if you are on your local Mac, and fall back to `vi` if you are logged in via ssh. This shim is used as the git editor and svn editor.

* The `mp` script (short for "(Text)Mate project") opens a directory in TextMate. But unlike the basic `mate` command, if the directory does not already have a `.tm_properties`, a basic one will be created.

* This repo also comes with tmux and vim configurations, for you terminal purists. To use:

    * `brew install tmux`
    * `brew install reattach-to-user-namespace`

* Multi-monitor window management setup files are available for both [Slate](https://github.com/jigish/slate) and [Mjolnir](http://mjolnir.io):
    * Install Slate by [downloading the binary](http://slate.ninjamonkeysoftware.com/Slate.dmg). Note that Slate is a discontinued open-source project and support for it will be removed from this repo soon.
    * Install Mjolnir:
        * Download and install the [latest release](https://github.com/sdegutis/mjolnir/releases/latest)
        * Install the dependencies
              ```
              brew install lua
              brew install luarocks
              luarocks install mjolnir._asm.watcher.screen
              luarocks install mjolnir.alert
              luarocks install mjolnir.application
              luarocks install mjolnir.bg.grid
              luarocks install mjolnir.cmsj.appfinder
              luarocks install mjolnir.fnutils
              luarocks install mjolnir.geometry
              luarocks install mjolnir.hotkey
              luarocks install mjolnir.keycodes
              luarocks install mjolnir.screen
              ```

## Credits

* Inspired by dotfiles from [Ryan Bates](https://github.com/ryanb/dotfiles) and [thoughtbot](http://github.com/thoughtbot/dotfiles).
* Tweaked from [Matt's version](https://github.com/mbrictson/dotfiles).
* vim, tmux and zsh setup informed heavily by [Trae's dotfiles](https://github.com/trobrock)
