
# Force a blinking block cursor on startup
echo -ne '\e[2 q'

export PATH=/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/Applications/iTerm.app/Contents/Resources/utilities:/opt/homebrew/bin:/opt/homebrew/bin

eval "$(/opt/homebrew/bin/brew shellenv)"

eval "$(/opt/homebrew/bin/brew shellenv)"

# Created by `pipx` on 2025-11-20 12:25:46
export PATH="$PATH:/Users/jennabates/.local/bin"

eval "$(starship init zsh)"

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# --- MATRIX SCREENSAVER ---
# Number of seconds to wait before running the screensaver
TMOUT=600

# This function runs automatically when the timer hits 0
TRAPALRM() {
    # -s = screensaver mode (any key exits)
    # -b = bold characters (looks better on 3270)
    cmatrix -sb
}

# Make 'bat' use the Gruvbox theme
export BAT_THEME="gruvbox-dark"

# Make 'cat' command actually run 'bat'
alias cat="bat"

# To make it so that when you quit Yazi, your terminal stays in the folder you were looking at, you need a special shell function.
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
