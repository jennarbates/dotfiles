-- lua/lsp/init.lua

-- Ensure lspconfig is loaded
local lspconfig = require("lspconfig")

-- Check if the Typst LSP executable is available
local typst_lsp_is_available = vim.fn.executable("typst-lsp") == 1

if typst_lsp_is_available then
  lspconfig.typst_lsp.setup({
    -- You can add any Typst-specific settings here, for example:
    -- settings = {
    --     exportPdf = "on_save",
    -- }
  })
  print("Typst LSP configured successfully!")
else
  -- This message is useful if the PATH somehow breaks later
  print("Warning: typst-lsp executable not found. LSP features disabled.")
end
