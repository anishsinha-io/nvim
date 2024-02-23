return {
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
    ["<leader>i"] = {
      function()
        if vim.bo.filetype == "neo-tree" then
          vim.cmd.wincmd "p"
        else
          vim.cmd.Neotree "focus"
        end
      end,
      desc = "Toggle Explorer Focus",
    },
  },
  v = {
    ["<leader>sr"] = { "<cmd>lua require'sniprun'.run('v')<cr>", desc = "Run block" },
  },
}
