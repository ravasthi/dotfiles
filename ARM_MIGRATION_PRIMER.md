# Apple Silicon (ARM64) Setup Primer

This guide covers setting up a new Apple Silicon Mac with fully native ARM64 tooling, and diagnosing/fixing an existing machine that accidentally ended up running under Rosetta.

---

## Quick architecture check

```bash
uname -m          # should print: arm64
arch              # should print: arm64
brew --prefix     # should print: /opt/homebrew
```

If you see `x86_64` / `i386` / `/usr/local`, read the **Fixing an existing Rosetta-infected machine** section below.

---

## Fresh machine setup

### 1. Verify Terminal.app is running natively

Open Terminal.app (or iTerm2, Ghostty, etc.). It should launch as a native ARM64 process on Apple Silicon — but confirm:

```bash
uname -m    # arm64 = native ARM64 ✓
```

> **If you see `x86_64`:** The terminal application itself may be running under Rosetta. Open the app's Info pane in Finder, uncheck "Open using Rosetta", then relaunch.

### 2. Install Xcode command line tools

```bash
xcode-select --install
```

### 3. Clone the dotfiles repo

```bash
git clone git@github.com:ravasthi/dotfiles.git ~/Library/dotfiles
cd ~/Library/dotfiles
git submodule init
git submodule update
```

### 4. Install the `highline` gem (needed by the Rakefile)

The system Ruby is fine for this:

```bash
gem install highline
```

### 5. Run the installer

```bash
cd ~/Library/dotfiles
rake install
```

This will:
- Detect Apple Silicon and install Homebrew natively to `/opt/homebrew` (via `arch -arm64`)
- Run `brew bundle --file=Brewfile --no-upgrade` to install all packages
- Symlink dotfiles into your home directory

> **Note:** Some casks (temurin, xquartz) require an interactive `sudo` prompt and cannot be installed from a non-interactive session. After `rake install` completes, install those manually:
>
> ```bash
> brew install --cask temurin xquartz
> ```

### 6. Open a new terminal window

This picks up the new shell environment, Homebrew PATH, and dotfiles symlinks.

Verify the new session is native ARM64:

```bash
uname -m          # arm64
brew --prefix     # /opt/homebrew
which asdf        # /opt/homebrew/bin/asdf
```

### 7. Install oh-my-zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### 8. Install vim-plug and plugins (optional)

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
```

### 9. Install asdf language runtimes

From a **native ARM64 terminal session** (confirmed by `uname -m` = `arm64`):

```bash
# Install plugins if not already present
asdf plugin add ruby
asdf plugin add nodejs

# Install the versions from ~/.tool-versions
asdf install
```

Verify they're ARM64:

```bash
file ~/.asdf/installs/ruby/*/bin/ruby
file ~/.asdf/installs/nodejs/*/bin/node
# Should show: Mach-O 64-bit executable arm64
```

### 10. Install global gems

```bash
gem install bundler
# or let asdf + default_gems handle it (see default_gems file in dotfiles)
```

---

## Fixing an existing Rosetta-infected machine

If your Mac has been set up with Rosetta, you'll have:
- Homebrew at `/usr/local` instead of `/opt/homebrew`
- All formulae compiled for x86_64
- asdf runtimes installed as x86_64

### Step 1: Diagnose

```bash
uname -m          # shows x86_64 on a Rosetta session
brew --prefix     # shows /usr/local (Intel Homebrew)
file $(which ruby)  # Mach-O 64-bit executable x86_64
```

### Step 2: Install native ARM Homebrew alongside the existing one

The Intel Homebrew at `/usr/local` can stay for now — the ARM one installs to a different prefix.

```bash
arch -arm64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Verify:

```bash
/opt/homebrew/bin/brew --version
file /opt/homebrew/bin/brew   # should be arm64
```

### Step 3: Pull latest dotfiles and run bundle

```bash
cd ~/Library/dotfiles
git pull
arch -arm64 /opt/homebrew/bin/brew bundle --file=Brewfile --no-upgrade
```

> Install any casks that need sudo interactively:
> ```bash
> arch -arm64 /opt/homebrew/bin/brew install --cask temurin xquartz
> ```

### Step 4: Open a new terminal window

Your shell's `~/.zshenv` and `~/.zshrc` (via the dotfiles) will now prefer `/opt/homebrew/bin` in PATH. Open a fresh terminal and verify:

```bash
uname -m          # arm64
brew --prefix     # /opt/homebrew
which asdf        # /opt/homebrew/bin/asdf
```

If `uname -m` still shows `x86_64`, check that your terminal app isn't set to "Open using Rosetta" (see Finder → Get Info on the app).

### Step 5: Reinstall asdf runtimes as ARM64

Existing runtimes were compiled as x86_64 and must be reinstalled from a **native ARM64 shell** (i.e., after opening a new terminal per Step 4).

For each runtime in your `~/.tool-versions`:

```bash
# Check current architecture
file ~/.asdf/installs/ruby/*/bin/ruby
file ~/.asdf/installs/nodejs/*/bin/node

# Reinstall each x86_64 version (example):
asdf uninstall ruby 4.0.5
asdf install ruby 4.0.5

asdf uninstall nodejs 26.2.0
asdf install nodejs 26.2.0
```

> **Important:** Ruby is compiled from source — it picks up the ARM Homebrew's openssl, libyaml, and gmp automatically. Node downloads a pre-built binary — it detects ARM64 from `uname -m` and downloads the `darwin-arm64` tarball.

Verify after reinstall:

```bash
file ~/.asdf/installs/ruby/*/bin/ruby   # arm64
file ~/.asdf/installs/nodejs/*/bin/node # arm64
ruby --version    # should show [arm64-darwin...]
node --version    # should work fine
```

### Step 6: (Optional) Clean up old Intel Homebrew

Once you're confident everything works natively, you can remove the Rosetta Homebrew:

```bash
arch -x86_64 /usr/local/bin/brew uninstall --force $(arch -x86_64 /usr/local/bin/brew list --formula)
arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
```

> **Caveat:** Only do this if you're sure no tools still depend on `/usr/local`. Check `echo $PATH` for remnants.

---

## Verifying full ARM64 hygiene

Run these after setup to confirm nothing is still Rosetta:

```bash
# Shell
uname -m                          # arm64
arch                              # arm64

# Homebrew
brew --prefix                     # /opt/homebrew
file $(brew --prefix)/bin/brew    # arm64

# Key tools
file $(which git)                 # arm64
file $(which ruby)                # arm64
file $(which node)                # arm64
file $(which python3)             # arm64

# asdf
file $(asdf which ruby)           # arm64
file $(asdf which node)           # arm64
```

Everything should show `Mach-O 64-bit executable arm64`.
