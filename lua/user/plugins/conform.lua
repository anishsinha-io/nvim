return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "isort", "black" },
        sql = { "sql-formatter" },
        ocaml = { "ocamlformat" },

        ["_"] = { "trim_whitespace" },
      },
    },
  },
}
