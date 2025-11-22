# Load simple autoconfig.yml if it exists (usually from :set commands)
# Since you have extensive config here, we will load it last to ensure
# our custom settings take precedence.
config.load_autoconfig(False)

# --- 1. General & Aesthetic Settings (Terminal Look) ---
c.url.start_pages = ["about:blank"]
c.url.default_page = "about:blank"
c.scrolling.smooth = False        # Instant scrolling feels faster
c.tabs.position = "top"
c.tabs.show = "never"             # MAX terminal aesthetic (use bindings)
c.statusbar.show = "in-mode"      # Only show when typing commands
c.statusbar.widgets = ['url', 'keypress', 'history', 'progress'] # Keep minimal info

# --- 2. Fonts (Matches your 3270 Nerd Font) ---
# Use 3270 for all main UI elements
c.fonts.default_family = "3270 Nerd Font"
c.fonts.default_size = "14pt"
c.fonts.completion.entry = "14pt 3270 Nerd Font"
c.fonts.contextmenu = "14pt 3270 Nerd Font"
c.fonts.statusbar = "14pt 3270 Nerd Font"
c.fonts.tabs = "14pt 3270 Nerd Font"
c.fonts.hints = "bold 14pt 3270 Nerd Font" # Bold hints for clarity
c.fonts.keyhint = "14pt 3270 Nerd Font"

# --- 3. Gruvbox Dark Hard Theme ---
# Variables for easy color adjustments
bg0_hard = "#1d2021"
bg1      = "#3c3836"
fg       = "#ebdbb2"
red      = "#cc241d"
green    = "#98971a"
yellow   = "#d79921"
blue     = "#458588"
purple   = "#b16286"

# Use the Gruvbox hard background color for the default webpage background
c.colors.webpage.bg = bg0_hard
c.colors.webpage.bg = "#1d2021"

# Backgrounds & Text
c.colors.completion.category.bg = bg0_hard
c.colors.completion.even.bg = bg0_hard
c.colors.completion.odd.bg = bg0_hard
c.colors.completion.fg = fg
c.colors.completion.item.selected.bg = blue
c.colors.completion.item.selected.fg = fg
c.colors.completion.item.selected.match.fg = yellow # Highlight matches

# Command Line & Statusbar
c.colors.statusbar.normal.bg = bg0_hard
c.colors.statusbar.normal.fg = fg
c.colors.statusbar.insert.bg = green     # Green for Insert mode
c.colors.statusbar.insert.fg = bg0_hard
c.colors.statusbar.passthrough.bg = purple # Purple for Passthrough mode
c.colors.statusbar.command.bg = bg1        # Slightly lighter for cmd line
c.colors.statusbar.command.fg = fg
c.colors.statusbar.url.success.fg = fg
c.colors.statusbar.url.warn.fg = yellow

# Tabs (Hidden, but colors still apply if you toggle them)
c.colors.tabs.bar.bg = bg0_hard
c.colors.tabs.odd.bg = bg0_hard
c.colors.tabs.even.bg = bg0_hard
c.colors.tabs.selected.even.bg = blue
c.colors.tabs.selected.odd.bg = blue
c.colors.tabs.selected.even.fg = fg
c.colors.tabs.selected.odd.fg = fg

# Hints (Set to match Gruvbox, border removed for terminal look)
c.colors.hints.bg = yellow
c.colors.hints.fg = bg0_hard
c.hints.border = "0px solid #000000"
c.hints.chars = 'asdfghjkl' # Use standard keyboard row for hints

# --- 4. nvim/Vim-style Keybindings ---

# --- MAPPING: GENERAL COMMANDS ---
# Remap 'o' to feel like Vim's command mode for opening URLs.
config.bind('o', 'set-cmd-text -s :open')
config.bind('O', 'set-cmd-text -s :open -t') # Shift+O for new tab

# Use 'dd' to close a tab (like deleting a line)
config.bind('dd', 'tab-close')
config.bind('u', 'undo') # Keep 'u' for undo

# Use ':w' to reload the page (like writing the file)
config.bind('r', 'reload') # Simple reload

# --- MAPPING: TAB NAVIGATION ---
# Map Tab Switching to Ctrl+j/Ctrl+k (Common nvim split navigation)
config.bind('<Ctrl-j>', 'tab-next')
config.bind('<Ctrl-k>', 'tab-prev
