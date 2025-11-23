-- ========================================================================== --
--  1. BASIC SETTINGS
-- ========================================================================== --
vim.g.mapleader = " " -- Set Leader key to SPACE
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.mouse = "a" -- Enable mouse support
vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard
vim.opt.termguicolors = true -- Better colors

-- ========================================================================== --
--  2. LAZY.NVIM BOOTSTRAP (Plugin Manager)
-- ========================================================================== --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ========================================================================== --
--  3. PLUGINS & CONFIGURATION
-- ========================================================================== --
require("lazy").setup({

  -- A. SYNTAX HIGHLIGHTING (Treesitter)
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "typst", "markdown" },
        highlight = { enable = true },
      })
    end,
  },

  -- B. AUTOCOMPLETION (nvim-cmp)
  -- LSPs need this to show you the popup menu
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- Connects LSP to completion
      "L3MON4D3/LuaSnip", -- Snippet engine
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Enter to confirm
          ["<Tab>"] = cmp.mapping.select_next_item(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
        }),
      })
    end,
  },

  -- C. MASON & LSP (The Core Logic)
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    config = function()
      -- 1. Setup Mason
      require("mason").setup()

      -- 2. Ensure Tinymist is installed
      require("mason-lspconfig").setup({
        ensure_installed = { "tinymist", "lua_ls" },
      })

      -- 3. Setup LSP Servers
      local lspconfig = require("lspconfig")
      -- Capabilities ensures the LSP knows we have autocompletion
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      lspconfig.tinymist.setup({
        capabilities = capabilities,
        single_file_support = true,
        root_dir = function()
          return vim.fn.getcwd()
        end,
        settings = {
          exportPdf = "onType",
          outputPath = "$root/target/$name",
          -- 1. FORCE LOCALHOST (Fixes Safari 1006 Error)
          -- We override the default arguments to use 'localhost' instead of '127.0.0.1'
          preview = {
            browsing = {
              args = { "--data-plane-host=localhost:0", "--invert-colors=auto", "--open" },
            },
          },
        },
        on_attach = function(client, bufnr)
          vim.api.nvim_buf_create_user_command(bufnr, "TypstPreview", function()
            vim.lsp.buf.execute_command({
              command = "tinymist.do",
              arguments = {
                "preview.start",
                {
                  task = { { kind = "preview", target = "html" } },
                },
              },
            })
          end, { desc = "Start Tinymist Preview" })
          print("Tinymist Attached. Run :TypstPreview")
        end,
      })

      -- LUA CONFIG (Just so your config file doesn't error)
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = { Lua = { diagnostics = { globals = { "vim" } } } },
      })
    end,
  },
})

