return function()
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
end
