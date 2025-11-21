<div align="center">

# 📟 THE MAINFRAME DOTFILES

![Badge](https://img.shields.io/badge/OS-macOS-white?style=for-the-badge&logo=apple&logoColor=black)
![Badge](https://img.shields.io/badge/Style-Retro_Industrial-fabd2f?style=for-the-badge)
![Badge](https://img.shields.io/badge/Theme-Gruvbox_Hard-d65d0e?style=for-the-badge)
![Badge](https://img.shields.io/badge/Font-IBM_3270-928374?style=for-the-badge)

**A keyboard-driven, GPU-accelerated development environment for macOS.**
<br>
*High contrast. No mouse required. 1980s aesthetics with 2025 speed.*

[View the Code](https://github.com/jennarbates/dotfiles) · [Report Bug](https://github.com/jennarbates/dotfiles/issues)

</div>

---


## 📸 The Interface

> **Note:** The setup features a tiling window manager with 15px gaps to showcase the procedurally generated noise wallpaper.

## 🛠 The Tech Stack

This setup replaces the standard macOS interface with a suite of high-performance CLI tools.

| Component | Tool | Why? |
| :--- | :--- | :--- |
| **Terminal** | [Ghostty](https://ghostty.org/) | GPU-accelerated, smooth rendering, shader support. |
| **Windows** | [AeroSpace](https://github.com/nikitabobko/AeroSpace) | Tiling window manager (i3-style) for macOS. |
| **Shell** | Zsh + [Starship](https://starship.rs/) | Minimalist, blocky prompt with Git status integration. |
| **Editor** | [Neovim](https://neovim.io/) | (LazyVim) Full IDE features, faster than VS Code. |
| **Files** | [Yazi](https://github.com/sxyazi/yazi) | Blazing fast terminal file manager with image previews. |
| **Nav** | [Zoxide](https://github.com/ajeetdsouza/zoxide) | Smarter `cd` that learns your most visited folders. |
| **Search** | [Fzf](https://github.com/junegunn/fzf) | Fuzzy finder for command history and files. |
| **Browser** | Qutebrowser | Keyboard-driven browser with Vim bindings. |
| **Multiplexer** | Zellij | Persistent terminal workspaces (Rust-based). |

---

## 🚀 Installation Guide

### 1. Prerequisites
You need **Homebrew** and the specific **Nerd Font** installed for the icons to render correctly.

```bash
# 1. Install Homebrew (if you haven't)
/bin/bash -c "$(curl -fsSL [https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh](https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh))"

# 2. Install the IBM 3270 Nerd Font
brew install --cask font-3270-nerd-font
```

### 2. Install Packages
Download all the required tools in one go:

```bash
brew install neovim ripgrep lazygit yazi ffmpeg sevenzip jq poppler fd fzf zoxide imagemagick fastfetch bat eza stow gh
brew install --cask ghostty nikitabobko/tap/aerospace
brew install --cask ghostty nikitabobko/tap/aerospace qutebrowser
```

### 3. Clone & Apply
We use **GNU Stow** to manage symlinks. This keeps your home directory clean and your configs organized in one repo.

```bash
# 1. Clone this repository
git clone [https://github.com/jennarbates/dotfiles.git](https://github.com/jennarbates/dotfiles.git) ~/dotfiles

# 2. Enter the vault
cd ~/dotfiles

# 3. Link the configurations
# We stow packages individually to ensure correct directory mapping
stow ghostty aerospace nvim yazi starship zsh
```

---

## 🎮 Controls & Cheatsheet

### 🪟 AeroSpace (Window Management)
*Managed via `Option` (Alt) Key*

| Key Combo | Action |
| :--- | :--- |
| `Alt + Enter` | **Spawn new Terminal** |
| `Alt + h/j/k/l` | Focus Left / Down / Up / Right |
| `Alt + Shift + h/j/k/l` | Move Window Left / Down / Up / Right |
| `Alt + f` | Toggle Fullscreen |
| `Alt + /` | Rotate Split (Vertical/Horizontal) |
| `Alt + Shift + 1-4` | Move Window to Workspace 1-4 |

### 📂 Yazi (File Manager)
*Launch with command: `y`*

| Key | Action |
| :--- | :--- |
| `j` / `k` | Navigation (Down/Up) |
| `l` / `Enter` | Open Folder or File |
| `h` | Go Back (Parent Directory) |
| `Space` | Select File |
| `a` | Create new file/folder |
| `r` | Rename |
| `q` | Quit |

### 📝 Neovim (Editor)
*Launch with command: `nvim`*

| Key | Action |
| :--- | :--- |
| `Space` | **Leader Key** (Opens Menu) |
| `Space + e` | Toggle File Explorer |
| `Space + f + f` | Find File |
| `Space + /` | Search text inside files |
| `:w` | Save |
| `:q` | Quit |

### 🐚 Shell Navigation
| Command | Action |
| :--- | :--- |
| `z <name>` | Teleport to folder (e.g., `z dot` goes to dotfiles) |
| `Ctrl + R` | Fuzzy Search History (Use `Ctrl+j/k` to select) |
| `ll` | List files with icons (uses `eza`) |
| `cat` | Read file with highlighting (uses `bat`) |

### 🌐 Qutebrowser (Web Surfing)
*Mouse-less browsing*

| Key | Action |
| :--- | :--- |
| `f` | **Hint Mode** (Show keys to click links) |
| `o` | Open URL or Search |
| `d` | Close Tab |
| `u` | Undo Close Tab |
| `J` / `K` | Next / Previous Tab |
| `H` / `L` | Go Back / Forward in History |

### 🧩 Zellij (Multiplexer)
*Keeps sessions alive.*

| Key | Action |
| :--- | :--- |
| `Ctrl` + `t` | New Tab |
| `Ctrl` + `h`/`j`/`k`/`l` | Move Focus |
| `Ctrl` + `d` | Detach Session (Background it) |

---

## 🎨 Extras & Aesthetics

### The Matrix Screensaver
If you leave the terminal idle for **60 seconds**, `cmatrix` will auto-launch in bold mode to prevent burn-in (and look cool). Press any key to return.

* **Browser:** Qutebrowser (Vim-based Web Surfing)

### Procedural Wallpaper
The wallpaper is generated using **ImageMagick** to create a noise texture that matches the Gruvbox palette perfectly.

To regenerate it:
```bash
magick -size 3840x2160 xc:'#1d2021' -attenuate 0.05 +noise Gaussian ~/.config/gruvbox-noise.png
```

---

<div align="center">

*Built with ❤️ and `h j k l`.*

</div>
