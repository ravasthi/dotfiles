# Richa's dotfiles

These are the command-line setup and configuration files I use for all my computers, stored on Github for easier sharing between computers and with other people.

## Credits

* Inspired by dotfiles from [Ryan Bates](https://github.com/ryanb/dotfiles) and [thoughtbot](http://github.com/thoughtbot/dotfiles).
* ~~Mostly stolen~~ Tweaked from [Matt's dotfiles](https://github.com/mbrictson/dotfiles).
* vim, tmux and zsh setup informed heavily by [Trae's dotfiles](https://github.com/trobrock)
* Other utilities repurposed, tweaked or outright stolen from around the internet.

## Prerequisites

* macOS on Apple Silicon (ARM64) — Intel Macs are still supported but ARM is the primary target
* Xcode command line tools: `xcode-select --install`
* [Homebrew](https://brew.sh) installed natively at `/opt/homebrew` (ARM) or `/usr/local` (Intel) — see *Installation* below
* asdf for managing language runtimes (Ruby, Node) — installed via Homebrew as part of `rake install`
* The `highline` gem for the installation script: `gem install highline`

## What's in the box

### Shell support

These dotfiles support both bash and zsh, with zsh (via oh my zsh) as the primary shell.

The default shell is `/bin/zsh` — the macOS system zsh, which is a universal binary that runs natively on both ARM and Intel. Homebrew-installed zsh is also supported but not required; note that Homebrew zsh at `/usr/local/bin/zsh` is x86_64 only and will run under Rosetta on Apple Silicon.

For oh my zsh setup:

* Install [oh my zsh](https://ohmyz.sh)

Some features of the `bashrc` may work only with bash 4.2+ with bash-completion, which may not be installed by default on the Mac. These can be installed via Homebrew:

* `brew install bash bash-completion`
* Add `$HOMEBREW_PREFIX/bin/bash` to `/etc/shells`
* Change your shell to `$HOMEBREW_PREFIX/bin/bash` by running `chsh`

### Command-line goodness

* Shell configuration includes a supercharged prompt for both bash and zsh with ruby and git information, with help from the [zsh-git-prompt](https://github.com/olivierverdier/zsh-git-prompt/blob/master/zshrc.sh) and [bash-git-prompt](https://github.com/magicmonty/bash-git-prompt) plugins. To tweak, change the configuration in `git-prompt-colors.sh` for bash and `oh-my-zsh-custom/themes/richa.zsh-theme` for zsh.

    <img style="max-width: 100%;" src="https://p198.p4.n0.cdn.getcloudapp.com/items/xQuq1ZYj/eead0696-3847-466a-928c-2811777a5ac4.png?v=89d36a3d24117abb4f55164abc00dee1" alt="fancy prompt!" />

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

* This repo also comes with tmux configuration, for you terminal purists. `brew install tmux` is included in the Brewfile.

* Multi-monitor window management setup files are available for [Hammerspoon](http://www.hammerspoon.org):
    * Download and install the [latest release](https://github.com/Hammerspoon/hammerspoon/releases/latest)
    * Tweak the configuration in `hammerspoon/init.lua` as you like


## Installation

1. Install Xcode command line tools:

        xcode-select --install

2. Install [Homebrew](https://brew.sh) natively for your architecture. On Apple Silicon, make sure to run the installer under native ARM — not Rosetta — by prefixing with `arch -arm64`:

        arch -arm64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    On Intel, just run the standard installer:

        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

3. Clone this repo:

        git clone git@github.com:ravasthi/dotfiles.git ~/Library/dotfiles
        cd ~/Library/dotfiles
        git submodule init
        git submodule update

4. Install the `highline` gem:

        gem install highline

5. Run the installer, which installs all Homebrew packages (via `Brewfile`) and symlinks dotfiles into your home directory:

        rake install

6. Change your default shell to `/bin/zsh`:

        chsh -s /bin/zsh

    Open a new terminal window or tab to pick up the new shell.
