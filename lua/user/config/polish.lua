return function()
  vim.filetype.add {
    filename = {
      zsh = "sh",
      [".zshrc"] = "sh",
      [".env.example"] = "sh",
    },
  }
end
