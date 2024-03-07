return {
  "mistricky/codesnap.nvim",
  build = "make",
  lazy = false,
  opts = {
    mac_window_bar = true, -- (Optional) MacOS style title bar switch
    opacity = true, -- (Optional) The code snap has some opacity by default, set it to false for 100% opacity
    watermark = "", -- (Optional) you can custom your own watermark, but if you don't like it, just set it to ""
    preview_title = "Code Snapshot", -- (Optional) preview page title
    editor_font_family = "CaskaydiaCove Nerd Font", -- (Optional) preview code font family
    watermark_font_family = "Pacifico", -- (Optional) watermark font family
  },
}
