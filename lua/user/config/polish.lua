return function()
  local legendary = require "legendary"
  legendary.setup {
    extensions = {
      lazy_nvim = {
        auto_register = true,
      },
    },
    keymaps = {
      {
        itemgroup = "Find",
        description = "Fuzzy finding items",
        icon = "",
        keymaps = {
          { "<leader>ff", "<cmd>Telescope find_files<cr>", description = "Find files" },
          { "<leader>fp", "<cmd>Telescope projects<cr>", description = "Find projects" },
          { "<leader>fb", "<cmd>Telescope buffers<cr>", description = "Find buffers" },
          { "<leader>fW", "<cmd>Telescope live_grep<cr>", description = "Find words" },
          { "<leader>ft", "<cmd>Telescope colorscheme<cr>", description = "Find colorschemes" },
          { "<leader>fC", "<cmd>Telescope commands<cr>", description = "Find commands" },
        },
      },
    },
    select_prompt = " Command Palette",
  }

  vim.filetype.add {
    filename = {
      zsh = "sh",
      [".zshrc"] = "sh",
      [".env.example"] = "sh",
    },
  }

  vim.api.nvim_create_autocmd({ "FocusGained", "VimEnter" }, {
    pattern = "*",
    command = "silent !tmux set status off",
  })

  vim.api.nvim_create_autocmd({ "FocusLost", "VimLeave" }, {
    pattern = "*",
    command = "silent !tmux set status on",
  })

  vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = { "*.sql" },
    command = "silent !npx psqlformat --write --spaces=2 --keywordCase=lowercase --noSpaceFunction % &>/dev/null",
  })

  vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = { "*.hs" },
    command = "silent! !fourmolu -i % &> /dev/null",
  })
end
