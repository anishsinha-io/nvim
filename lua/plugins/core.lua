function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"
return {
  { "nvim-lua/plenary.nvim", lazy = true },
  { "echasnovski/mini.bufremove", lazy = true },
  { "AstroNvim/astrotheme", lazy = false, opts = { plugins = { ["dashboard-nvim"] = true } } },
  { "max397574/better-escape.nvim", event = "InsertCharPre", opts = { timeout = 300 } },
  { "NMAC427/guess-indent.nvim", event = "User AstroFile", config = require "plugins.configs.guess-indent" },
  { -- TODO: REMOVE neovim-session-manager with AstroNvim v4
    "Shatur/neovim-session-manager",
    event = "BufWritePost",
    cmd = "SessionManager",
    enabled = vim.g.resession_enabled ~= true,
  },
  {
    "stevearc/resession.nvim",
    enabled = vim.g.resession_enabled == true,
    lazy = true,
    opts = {
      buf_filter = function(bufnr) return require("astronvim.utils.buffer").is_restorable(bufnr) end,
      tab_buf_filter = function(tabpage, bufnr) return vim.tbl_contains(vim.t[tabpage].bufs, bufnr) end,
      extensions = { astronvim = {} },
    },
  },
  {
    "s1n7ax/nvim-window-picker",
    lazy = true,
    main = "window-picker",
    opts = { picker_config = { statusline_winbar_picker = { use_winbar = "smart" } } },
  },
  {
    "mrjones2014/smart-splits.nvim",
    lazy = true,
    opts = { ignored_filetypes = { "nofile", "quickfix", "qf", "prompt" }, ignored_buftypes = { "nofile" } },
  },
  {
    "windwp/nvim-autopairs",
    event = "User AstroFile",
    opts = {
      check_ts = true,
      ts_config = { java = false },
      fast_wrap = {
        map = "<M-e>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        offset = 0,
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "PmenuSel",
        highlight_grey = "LineNr",
      },
    },
    config = require "plugins.configs.nvim-autopairs",
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      icons = { group = vim.g.icons_enabled and "" or "+", separator = "" },
      disable = { filetypes = { "TelescopePrompt" } },
    },
    config = require "plugins.configs.which-key",
  },
  {
    "kevinhwang91/nvim-ufo",
    event = { "User AstroFile", "InsertEnter" },
    dependencies = { "kevinhwang91/promise-async" },
    opts = {
      preview = {
        mappings = {
          scrollB = "<C-b>",
          scrollF = "<C-f>",
          scrollU = "<C-u>",
          scrollD = "<C-d>",
        },
      },
      provider_selector = function(_, filetype, buftype)
        local function handleFallbackException(bufnr, err, providerName)
          if type(err) == "string" and err:match "UfoFallbackException" then
            return require("ufo").getFolds(bufnr, providerName)
          else
            return require("promise").reject(err)
          end
        end

        return (filetype == "" or buftype == "nofile") and "indent" -- only use indent until a file is opened
          or function(bufnr)
            return require("ufo")
              .getFolds(bufnr, "lsp")
              :catch(function(err) return handleFallbackException(bufnr, err, "treesitter") end)
              :catch(function(err) return handleFallbackException(bufnr, err, "indent") end)
          end
      end,
    },
  },
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gc", mode = { "n", "v" }, desc = "Comment toggle linewise" },
      { "gb", mode = { "n", "v" }, desc = "Comment toggle blockwise" },
    },
    opts = function()
      local commentstring_avail, commentstring = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
      return commentstring_avail and commentstring and { pre_hook = commentstring.create_pre_hook() } or {}
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    cmd = { "ToggleTerm", "TermExec" },
    opts = {
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<C-t>]],
      highlights = {
        Normal = { link = "Normal" },
        NormalNC = { link = "NormalNC" },
        NormalFloat = { link = "NormalFloat" },
        FloatBorder = { link = "FloatBorder" },
        StatusLine = { link = "StatusLine" },
        StatusLineNC = { link = "StatusLineNC" },
        WinBar = { link = "WinBar" },
        WinBarNC = { link = "WinBarNC" },
      },

      shell = vim.o.shell,
      auto_scroll = true,
      on_create = function()
        vim.opt.foldcolumn = "0"
        vim.opt.signcolumn = "no"
      end,
      insert_mappings = true,
      start_in_insert = true,
      terminal_mappings = true,
      shading_factor = 2,
      direction = "horizontal",
      close_on_exit = true,
      float_opts = { border = "none" },
    },
  },
}
