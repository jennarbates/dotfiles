return {
  {
    "chomosuke/typst-preview.nvim",
    lazy = false, -- or ft = 'typst'
    version = "1.*",
    build = function()
      require("typst-preview").update()
    end,
    opts = {
      invert_colors = "never",
      open_cmd = "open -a Firefox $(echo %s)",
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "mason.nvim", "williamboman/mason-lspconfig.nvim" },
    opts = {
      servers = {
        tinymist = {
          single_file_support = true,
          root_dir = function()
            return vim.fn.getcwd()
          end,
          settings = {
            exportPdf = "onType", -- Export a PDF as you type (optional)
            formatterMode = "typstyle", -- Use 'typstyle' for formatting
          },
        },
      },
    },
  },
}
