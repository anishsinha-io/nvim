return {
  "folke/noice.nvim",
  opts = {
    presets = {
      lsp_doc_border = false, -- add a border to hover docs and signature help
    },
    routes = {
      {
        filter = {
          event = "msg_show",
          kind = "",
          find = "written",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "warn",
          find = "LSP Timeout",
        },
        opts = { skip = true },
      },
    },

    -- cmdline = {
    --   view = "cmdline",
    -- },

    views = {
      border = {
        style = "single",
      },

      cmdline_popup = {
        border = {
          style = "none",
          padding = { 1, 2 },
        },
        filter_options = {},
        win_options = {
          winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
        },
      },
    },
  },
}
