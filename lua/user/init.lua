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

local mappings = require "user.config.mappings"
local highlights = require "user.config.highlights"

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
      hl.nav_icon_bg = get_hlgroup("String").fg
      hl.nav_fg = hl.nav_icon_bg
      hl.folder_icon_bg = get_hlgroup("Error").fg
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

  polish = function()
    vim.filetype.add {
      filename = {
        zsh = "sh",
        [".zshrc"] = "sh",
        [".env.example"] = "sh",
      },
    }
  end,

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
  },

  lsp = {
    servers = {
      "ocamllsp",
      -- "prolog_lsp",
      "cssls",
    },
    config = {
      cssls = {
        settings = {
          css = { validate = true, lint = {
            unknownAtRules = "ignore",
          } },
          scss = { validate = true, lint = {
            unknownAtRules = "ignore",
          } },
          less = { validate = true, lint = {
            unknownAtRules = "ignore",
          } },
        },
      },
      -- prolog_lsp = function()
      --   local lsp = require "lspconfig"
      --   vim.filetype.add { extension = { pro = "prolog" } }
      --   return {
      --     cmd = {
      --       "swipl",
      --       "-g",
      --       "use_module(library(lsp_server)).",
      --       "-g",
      --       "lsp_server:main",
      --       "-t",
      --       "halt",
      --       "--",
      --       " stdio",
      --     },
      --     filetypes = { "prolog", "pro" },
      --
      --     root_dir = lsp.util.root_pattern "pack.pro",
      --   }
      -- end,
      ocamllsp = function()
        local lsp = require "lspconfig"

        local c = vim.lsp.protocol.make_client_capabilities()
        c.textDocument.completion.completionItem.snippetSupport = true
        c.textDocument.completion.completionItem.resolveSupport = {
          properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
          },
        }

        local on_attach = function(client, bufnr)
          -- enable completion triggered by <C-x><C-o>
          vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

          -- TODO: remove the following block (unnecessary since conform is configured with ocamlformat now)
          --
          -- if client.server_capabilities.documentFormattingProvider then
          --   vim.api.nvim_create_autocmd("BufWritePre", {
          --     group = vim.api.nvim_create_augroup("Format", { clear = true }),
          --     buffer = bufnr,
          --     callback = function() vim.lsp.buf.formatting_seq_sync() end,
          --   })
          -- end
          --
          -- code lens
          if client.resolved_capabilities.code_lens then
            local codelens = vim.api.nvim_create_augroup("LSPCodeLens", { clear = true })
            vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "CursorHold" }, {
              group = codelens,
              callback = function() vim.lsp.codelens.refresh() end,
              buffer = bufnr,
            })
          end
        end

        local capabilities = require("cmp_nvim_lsp").default_capabilities(c)

        return {
          cmd = { "ocamllsp" },
          filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
          root_dir = lsp.util.root_pattern(
            "*.opam",
            "esy.json",
            "package.json",
            ".git",
            "dune-project",
            "dune-workspace"
          ),
          on_attach = on_attach,
          capabilities = capabilities,
        }
      end,
    },
  },

  -- custom telescope theme
  highlights = highlights,

  mappings = mappings,
}
