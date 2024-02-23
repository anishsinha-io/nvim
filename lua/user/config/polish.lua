return function()
  vim.filetype.add {
    filename = {
      zsh = "sh",
      [".zshrc"] = "sh",
      [".env.example"] = "sh",
    },
  }
  vim.api.nvim_create_autocmd({ "FocusGained" }, {
    pattern = "*",
    command = "silent !tmux set status off",
  })

  vim.api.nvim_create_autocmd({ "FocusLost" }, {
    pattern = "*",
    command = "silent !tmux set status",
  })
end
