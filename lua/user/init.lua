local dotfiles = require "user.plugins.dotfiles"
local themes = require "user.plugins.themes"
local icons = require "user.plugins.icons"
local neogen = require "user.plugins.neogen"
local conform = require "user.plugins.conform"
local snippets = require "user.plugins.telescope-luasnip"
local minimap = require "user.plugins.minimap"
local tmux = require "user.plugins.tmux"
local autotags = require "user.plugins.autotags"
local noice = require "user.plugins.noice"
local overseer = require "user.plugins.overseer"
local tailwind = require "user.plugins.tailwind-rename"
local heirline = require "user.plugins.heirline"
local harpoon = require "user.plugins.harpoon"
local legendary = require "user.plugins.legendary"

local mappings = require "user.config.mappings"
local highlights = require "user.config.highlights"
local polish = require "user.config.polish"

local ocamllsp = require "user.lsp.ocaml"
local prolog_lsp = require "user.lsp.prolog"
local cssls = require "user.lsp.css"

return {
  colorscheme = "catppuccin-mocha",
  options = {
    opt = {
      showtabline = 0,
    },
  },

  icons = {
    VimIcon = "",
    ScrollText = "",
    GitBranch = "",
    GitAdd = "",
    GitChange = "",
    GitDelete = "",
  },

  heirline = {
    -- define the separators between each section
    separators = {
      left = { "", " " }, -- separator for the left side of the statusline
      right = { " ", "" }, -- separator for the right side of the statusline
      tab = { "", "" },
    },
    -- add new colors that can be used by heirline
    colors = function(hl)
      local get_hlgroup = require("astronvim.utils").get_hlgroup
      -- use helper function to get highlight group properties
      local comment_fg = get_hlgroup("Comment").fg
      hl.git_branch_fg = comment_fg
      hl.git_added = comment_fg
      hl.git_changed = comment_fg
      hl.git_removed = comment_fg
      hl.blank_bg = get_hlgroup("Folded").fg
      hl.file_info_bg = get_hlgroup("Visual").bg
      -- hl.nav_icon_bg = get_hlgroup("String").fg
      hl.nav_icon_bg = "#a6e3a1"
      hl.nav_fg = hl.nav_icon_bg
      hl.folder_icon_bg = get_hlgroup("Error").fg
      hl.folder_icon_bg = "#f38ba8"
      return hl
    end,
    attributes = {
      mode = { bold = true },
    },
    icon_highlights = {
      file_icon = {
        statusline = false,
      },
    },
  },

  polish = polish,

  plugins = {
    dotfiles,
    themes,
    icons,
    neogen,
    conform,
    snippets,
    minimap,
    tmux,
    autotags,
    tailwind,
    noice,
    overseer,
    heirline,
    harpoon,
    legendary,
  },

  lsp = {
    servers = {
      "ocamllsp",
      "prolog_lsp",
      "cssls",
    },
    config = {
      ocamllsp = ocamllsp,
      prolog_lsp = prolog_lsp,
      cssls = cssls,
    },
    formatting = {
      disabled = {
        "lua_ls",
      },
    },
  },

  highlights = highlights,
  mappings = mappings,
}
