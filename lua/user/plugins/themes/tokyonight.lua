return {
  "folke/tokyonight.nvim",
  lazy = false,
  opts = {
    -- transparent = true,
    style = "night",
    light_style = "day",
    transparent = false,
    terminal_colors = true,
    day_brightness = 0.3,
    hide_inactive_statusline = false,
    dim_inactive = false,
    lualine_bold = false,
    -- on_colors = function(colors) end,
    -- on_highlights = function(highlights, colors) end,
    styles = {
      -- sidebars = "transparent",
      -- floats = "transparent",
      -- Style to be applied to different syntax groups
      -- Value is any valid attr-list value for `:help nvim_set_hl`
      comments = { italic = true },
      keywords = { italic = true },
      functions = {},
      variables = {},
      -- Background styles. Can be "dark", "transparent" or "normal"
      sidebars = "dark", -- style for sidebars, see below
      floats = "dark", -- style for floating windows
    },
    sidebars = { "qf", "help", "terminal", "vista_kind" },
  },
}
