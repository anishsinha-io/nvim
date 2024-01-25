return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "isort", "black" },
        -- sql = { "sql-formatter" },

        ["_"] = { "trim_whitespace" },
      },
    },
  },
}
