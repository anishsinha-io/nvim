return function()
  local lsp = require "lspconfig"
  vim.filetype.add { extension = { pro = "prolog" } }
  return {
    cmd = {
      "swipl",
      "-g",
      "use_module(library(lsp_server)).",
      "-g",
      "lsp_server:main",
      "-t",
      "halt",
      "--",
      " stdio",
    },
    filetypes = { "prolog", "pro" },

    root_dir = lsp.util.root_pattern "pack.pro",
  }
end
