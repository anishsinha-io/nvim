return function()
  local lsp = require "lspconfig"

  local c = vim.lsp.protocol.make_client_capabilities()
  c.textDocument.completion.completionItem.snippetSupport = true
  c.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  }

  local on_attach = function(client, bufnr)
    -- enable completion triggered by <C-x><C-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- TODO: remove the following block (unnecessary since conform is configured with ocamlformat now)
    --
    -- if client.server_capabilities.documentFormattingProvider then
    --   vim.api.nvim_create_autocmd("BufWritePre", {
    --     group = vim.api.nvim_create_augroup("Format", { clear = true }),
    --     buffer = bufnr,
    --     callback = function() vim.lsp.buf.formatting_seq_sync() end,
    --   })
    -- end
    --
    -- code lens
    if client.resolved_capabilities and client.resolved_capabilities.code_lens then
      local codelens = vim.api.nvim_create_augroup("LSPCodeLens", { clear = true })
      vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "CursorHold" }, {
        group = codelens,
        callback = function() vim.lsp.codelens.refresh() end,
        buffer = bufnr,
      })
    end
  end

  local capabilities = require("cmp_nvim_lsp").default_capabilities(c)

  return {
    cmd = { "ocamllsp" },
    filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
    root_dir = lsp.util.root_pattern("*.opam", "esy.json", "package.json", ".git", "dune-project", "dune-workspace"),
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
