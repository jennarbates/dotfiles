The Minframe Dotfiles
<div align="center">

A keyboard-driven, GPU-accelerated, retro-industrial development environment.

</div>

📸 The Aesthetics
Terminal: Ghostty (GPU Accelerated)

Font: 3270 Nerd Font (IBM Mainframe Style)

Theme: Gruvbox Dark Hard (High Contrast)

Window Manager: AeroSpace (Tiling with 15px Gaps)

Wallpaper: Procedurally generated noise (magick + osascript)

🛠 The Stack
Component	Tool	Description
Window Manager	AeroSpace	Tiling window manager for macOS (i3-style).
Shell	Zsh + Starship	Custom "Blocky" prompt configuration.
Editor	Neovim	LazyVim distribution with Gruvbox theme.
File Manager	Yazi	Blazing fast terminal file manager with image previews.
Navigation	Zoxide	Smarter cd command.
Search	Fzf	Fuzzy finder for history and files.
Extras	bat, eza, fastfetch	Modern replacements for cat, ls, and neofetch.
🚀 Installation
1. Prerequisites

You need Homebrew and the Nerd Font installed first.

Bash
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install the 3270 Nerd Font
brew install --cask font-3270-nerd-font
2. Install Packages

Install all the core tools in one go:

Bash
brew install neovim ripgrep lazygit yazi ffmpeg sevenzip jq poppler fd fzf zoxide imagemagick fastfetch bat eza stow gh
brew install --cask ghostty nikitabobko/tap/aerospace
3. Clone & Stow

Clone this repository to your home folder and use GNU Stow to symlink the configurations.

Bash
# 1. Clone the repo
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles

# 2. Enter the directory
cd ~/dotfiles

# 3. Stow (Link) the configs
stow .
🎮 Controls & Cheatsheet
🪟 AeroSpace (Window Management)

Managed via Option (Alt) Key

Key Combo	Action
Alt + Enter	Spawn new Terminal
Alt + h/j/k/l	Focus Left / Down / Up / Right
Alt + Shift + h/j/k/l	Move Window Left / Down / Up / Right
Alt + f	Toggle Fullscreen
Alt + /	Rotate Split (Vertical/Horizontal)
Alt + Shift + 1-4	Move Window to Workspace 1-4
📂 Yazi (File Manager)

Launch with command: y

Key	Action
j / k	Navigation
l / Enter	Open Folder or File
h	Go Back (Parent Directory)
Space	Select File
q	Quit
📝 Neovim (Editor)

Launch with command: nvim

Key	Action
Space	Leader Key (Opens Menu)
Space + e	Toggle File Explorer
Space + f + f	Find File
Space + /	Search in File
:w	Save
:q	Quit
🐚 Shell Navigation

Command	Action
z <name>	Jump to folder (e.g., z dot)
Ctrl + R	Fuzzy Search History
ll	List files with icons (eza)
cat	Read file with highlighting (bat)
🎨 Extras
The Matrix Screensaver

If you leave the terminal idle for 600 seconds, cmatrix will auto-launch in bold mode. Press any key to return.

Wallpaper Generation

To regenerate the custom noise background:

Bash
magick -size 3840x2160 xc:'#1d2021' -attenuate 0.05 +noise Gaussian ~/.config/gruvbox-noise.png
<div align="center">

Built with high contrast and clicky keys.

Folders you must NEVER commit ❌

Never put these in your dotfiles repo:

~/.ssh/ (Contains your private SSH keys. If you leak these, hackers can access your servers/GitHub).

~/.gnupg/ (PGP keys).

~/.aws/ (AWS credentials).


To double check, use the grep -rE "key|token|password|secret|private" . | pbcopy command

</div>


