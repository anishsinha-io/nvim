require "user.plugins.dotfiles"
require "user.plugins.themes"
require "user.plugins.icons"
require "user.plugins.neogen"
require "user.plugins.conform"
require "user.plugins.telescope-luasnip"
require "user.plugins.minimap"

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
      -- local red = "#f38ba8"
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
        TelescopePromptPrefix = { fg = pink, bg = bg },
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
      ["<leader>fs"] = { "<cmd>lua require'telescope'.extensions.luasnip.luasnip{}<cr>", desc = "Search snippets" },
      ["<leader>ta"] = { "<cmd>ToggleTermToggleAll<cr>", desc = "Toggle all terminal sessions" },
      ["<leader>ts"] = { "<cmd>TermSelect<cr>", desc = "Select a terminal session" },
      ["<leader>tr"] = { "<cmd>ToggleTermSetName<cr>", desc = "Rename a terminal session" },
      ["<leader>sr"] = { "<cmd>lua require'sniprun'.run()<cr>", desc = "Run a line of code" },
      ["<leader>sc"] = { "<cmd>lua require'sniprun.display'.close_all()<cr>", desc = "Close sniprun windows" },
      ["<leader>M"] = { "<cmd>lua require'codewindow'.toggle_minimap()<cr>", desc = "Toggle minimap" },
    },
    v = {
      ["<leader>sr"] = { "<cmd>lua require'sniprun'.run('v')<cr>", desc = "Run block" },
    },
  },
}
