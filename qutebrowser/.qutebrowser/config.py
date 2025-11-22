#import dracula.draw

# Load settings from the simple autoconfig.yml if it exists
config.load_autoconfig(False)

# --- General Settings ---
c.url.start_pages = ["about:blank"]
c.url.default_page = "about:blank"
c.scrolling.smooth = False  # Instant scrolling feels faster for tiling users
c.tabs.position = "top"
c.tabs.show = "multiple"    # Hide tab bar if only one tab is open
c.statusbar.show = "in-mode" # Only show status bar when typing commands

# --- Fonts (Matches your Nerd Font) ---
c.fonts.default_family = "3270 Nerd Font"
c.fonts.default_size = "14pt"

# --- Gruvbox Dark Hard Theme ---
bg0_hard = "#1d2021"
bg0_soft = "#32302f"
fg       = "#ebdbb2"
bg1      = "#3c3836"
bg2      = "#504945"
red      = "#cc241d"
green    = "#98971a"
yellow   = "#d79921"
blue     = "#458588"
purple   = "#b16286"
aqua     = "#689d6a"
orange   = "#d65d0e"

# Backgrounds
c.colors.completion.category.bg = bg0_hard
c.colors.completion.even.bg = bg0_hard
c.colors.completion.odd.bg = bg0_hard
c.colors.completion.fg = fg
c.colors.completion.item.selected.bg = yellow
c.colors.completion.item.selected.border.bottom = yellow
c.colors.completion.item.selected.border.top = yellow
c.colors.completion.item.selected.fg = bg0_hard

# Statusbar
c.colors.statusbar.normal.bg = bg0_hard
c.colors.statusbar.normal.fg = fg
c.colors.statusbar.insert.bg = blue
c.colors.statusbar.insert.fg = bg0_hard
c.colors.statusbar.passthrough.bg = purple
c.colors.statusbar.command.bg = bg1
c.colors.statusbar.command.fg = fg

# Tabs
c.colors.tabs.bar.bg = bg0_hard
c.colors.tabs.even.bg = bg0_hard
c.colors.tabs.odd.bg = bg0_hard
c.colors.tabs.selected.even.bg = bg2
c.colors.tabs.selected.odd.bg = bg2
c.colors.tabs.selected.even.fg = fg
c.colors.tabs.selected.odd.fg = fg

# Hints (The little yellow boxes)
c.colors.hints.bg = yellow
c.colors.hints.fg = bg0_hard
c.hints.border = "1px solid " + bg0_hard
