local dotfiles = require "user.plugins.dotfiles"
local themes = require "user.plugins.themes"
local icons = require "user.plugins.icons"
local neogen = require "user.plugins.neogen"
local conform = require "user.plugins.conform"
local snippets = require "user.plugins.telescope-luasnip"
local minimap = require "user.plugins.minimap"
local tmux = require "user.plugins.tmux"
local autotags = require "user.plugins.autotags"

local tailwind = require "user.plugins.tailwind-rename"

local mappings = require "user.config.mappings"

return {
  colorscheme = "catppuccin-mocha",
  options = {
    opt = {
      showtabline = 0,
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

  mappings = mappings,
}
