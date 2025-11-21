return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = true, 
    opts = {
       contrast = "hard", -- matches your Ghostty "Hard" setting
       transparent_mode = false,
    },
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
