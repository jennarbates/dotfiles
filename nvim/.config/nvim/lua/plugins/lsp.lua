return {
  -- LSP & Completion Infrastructure
  {
    "hrsh7th/nvim-cmp",
    enabled = true,
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping = vim.tbl_deep_extend("force", opts.mapping or {}, {
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      })
      opts.sources = cmp.config.sources({ { name = "nvim_lsp" }, { name = "luasnip" } })
    end,
  },
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "tinymist", "lua-language-server" })
    end,
  },

  -- Treesitter for syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "typst", "markdown" })
    end,
  },

  -- Main LSP Configuration
  {
    "neovim/nvim-lspconfig",
    dependencies = { "mason.nvim", "mason-org/mason-lspconfig.nvim" },
    opts = {
      servers = {
        -- Typst (tinymist) settings from both files
        tinymist = {
          single_file_support = true,
          root_dir = function() return vim.fn.getcwd() end,
          settings = {
            exportPdf = "onType",
            outputPath = "$root/target/$name",
            formatterMode = "typstyle", -- from typst.lua
            preview = {
              browsing = { args = { "--data-plane-host=localhost:0", "--invert-colors=auto", "--open" } },
            },
          },
        },
        -- Lua (lua_ls) settings
        lua_ls = {
          settings = {
            Lua = { diagnostics = { globals = { "vim" } } },
          },
        },
      },
    },
  },

  -- Custom command for Tinymist preview
  {
    "neovim/nvim-lspconfig",
    event = "LspAttach",
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("user_lsp_attach_tinymist", { clear = true }),
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client.name == "tinymist" then
            local bufnr = args.buf
            vim.api.nvim_buf_create_user_command(bufnr, "TypstPreview", function()
              vim.lsp.buf.execute_command({
                command = "tinymist.do",
                arguments = {
                  "preview.start",
                  { task = { { kind = "preview", target = "html" } } },
                },
              })
            end, { desc = "Start Tinymist Preview" })
            vim.notify("Tinymist Attached. Run :TypstPreview", vim.log.levels.INFO, { title = "LSP" })
          end
        end,
      })
    end,
  },
  
  -- Typst Previewer Plugin
  {
    "chomosuke/typst-preview.nvim",
    lazy = false,
    version = "1.*",
    build = function()
      require("typst-preview").update()
    end,
    opts = {
      invert_colors = "never",
      open_cmd = "open -a Firefox $(echo %s)",
    },
  },
}
