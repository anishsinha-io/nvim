return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "isort", "black" },
        sql = { "sql-formatter" },
        ocaml = { "ocamlformat" },
        typescriptreact = { { "prettierd", "prettier" } },

        ["_"] = { "trim_whitespace" },
      },
    },
  },
}
