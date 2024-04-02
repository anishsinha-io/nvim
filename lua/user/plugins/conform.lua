return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- python = { "isort", "black" },
        -- sql = { "sql-formatter" },
        -- ocaml = { "ocamlformat" },
        -- typescriptreact = { "rustywind --write ." },
        -- rust = { "rustfmt --edition=2021" },

        ["_"] = { "trim_whitespace" },
      },
    },
  },
}
