require "user.plugins.dotfiles"
require "user.plugins.themes"
require "user.plugins.icons"
require "user.plugins.neogen"

return {
  colorscheme = "catppuccin-mocha",

  mappings = {
    n = {
      ["<leader>fT"] = { "<cmd>TodoTelescope<cr>", desc = "Find todo comments" },
      -- ["<leader>o"] = {"<cmd>"}
    },
  },
}
