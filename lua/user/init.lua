require "user.plugins.dotfiles"
require "user.plugins.themes"
require "user.plugins.icons"
require "user.plugins.neogen"
require "user.plugins.conform"

return {
  colorscheme = "catppuccin-mocha",
  options = {
    opt = {
      showtabline = 0,
    },
  },

  -- custom telescope theme
  highlights = {
    init = function()
      local get_hlgroup = require("astronvim.utils").get_hlgroup
      -- get highlights from highlight groups
      local normal = get_hlgroup "Normal"
      local fg, bg = normal.fg, normal.bg
      -- local bg_alt = get_hlgroup("Visual").bg
      -- local green = get_hlgroup("String").fg
      -- local red = get_hlgroup("Error").fg

      local border_color = "#585b70"
      local red = "#f38ba8"
      local mauve = "#cba6f7"
      local peach = "#fab387"
      local pink = "#f5c2e7"
      -- return a table of highlights for telescope based on colors gotten from highlight groups
      return {
        TelescopeBorder = { fg = border_color, bg = bg },
        TelescopeNormal = { bg = bg },
        TelescopePreviewBorder = { fg = border_color, bg = bg },
        TelescopePreviewNormal = { bg = bg },
        TelescopePreviewTitle = { fg = bg, bg = peach },
        TelescopePromptBorder = { fg = border_color, bg = bg },
        TelescopePromptNormal = { fg = fg, bg = bg },
        TelescopePromptPrefix = { fg = red, bg = bg },
        TelescopePromptTitle = { fg = bg, bg = mauve },
        TelescopeResultsBorder = { fg = border_color, bg = bg },
        TelescopeResultsNormal = { bg = bg },
        TelescopeResultsTitle = { fg = bg, bg = pink },
      }
    end,
  },

  mappings = {
    n = {
      ["<leader>fT"] = { "<cmd>TodoTelescope<cr>", desc = "Find todo comments" },
      ["<leader>fp"] = { "<cmd>Telescope projects<cr>", desc = "Find projects" },
      ["<leader>o"] = { "<cmd>OverseerRun<cr>", desc = "Run task" },
      ["<leader>g"] = { "<cmd>lua require'neogen'.generate()<cr>", desc = "Create doc comment" },
    },
  },
}
