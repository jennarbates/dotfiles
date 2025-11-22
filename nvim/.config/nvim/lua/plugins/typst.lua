-- plugins/typst.lua
return {
  {
    "chomosuke/typst-preview.nvim",
    -- Load the plugin when a typst file is opened
    ft = "typst",
    version = "1.*",
    opts = {},
  },
}
