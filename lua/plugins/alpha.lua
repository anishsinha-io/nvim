return {
  "goolord/alpha-nvim",
  cmd = "Alpha",
  opts = function()
    local dashboard = require "alpha.themes.dashboard"

    dashboard.section.header.val = {
      "                                     ====╔╓_                                    ",
      "                               _     `░░░╚╩╝▀%__                                ",
      "                               `  `^__::░░░░░░╠D╣▓█╗▄___                        ",
      "            . _     __-¬_     _.____░:░:░░░░░░Ü░░░░░Ü░░╚╠╠D▓▓▓@æφφ╗▄▄           ",
      "             `` `_____:=+░ⁿ░:::░:░:;░░░░░░░░░░░░░░ÜÜÜ░░Ü╚D╠║╣▓╗╣╣╣╩▀╙           ",
      "                     ```````==========└==░==≡░░░░░░░ÜÖTT╙└└└` `                 ",
      "                                    _ __```===``                                ",
      "                                 ╣RDÅ▒╚░░░≡R[_                                  ",
      "░:░░░░░░░░░░░░░░░░░░░░░░░░░░]Ü░░║╠╬D╬D▒╠DD╠╬╬D╬╬D╠╠╠╬╬╩╬╬╬╬╬╬╬╬╬╬╬╩╬╬╬╬╬DDDD░░░░",
      "░░░░░░░░░░░░░░░░░░░░░░░░░░░ÜÜ░ÜÜ║╬╣╣╬╬╬╠╠╬╬╬D╣╬╬╬╠╬╠╠╠╠╠╬╬╬╬╬╬╬╬╩╬╬╬╬╬╬╬╠╠╠╠Ü░░Ü",
      "░░░░░░░░░░░░░░░░]]]Ü░░░░░░ÜÜÜ╠╠╠╣╣╣╣╣╣╬╬╬╬╬╬╪╣╬╠╬╬╬╬╩╬╬╬╬╬╬╬╬╬╬╬╩╬╬╬╬╬╬╬╬╠╠ÜÜÜ░░",
      "░░░░░░░░░ÜÜÜ░░░░░╚╚╚╚╚╚╚╚╩╩╩╩╩╩╩╣╣╬╬╬╬╩╬╬╬╬╬╬╣▒╬╬╬╣╣╣╣╬╣╬╣╣╣╬╣╬╣╣╣╣╬╬╬╬╬╬╬╬╠╠ÜÜ░",
      "░ÜÜÜÜÜÜÜÜÜÜÜ░░░░░░░]]Ü╦░░░░░░ÜÜ╠╠╬╬╬╬╬╬╬╬╬╬╬╬╣╬╣╬╣╣╣╬╬╩╬╩╩╬╬╬╩╬╬╬╬╬╩╩╬╬╬╬╬D╠ÜÜ░░",
      "░░░░ÜÜ░░░░░░░░ÜÜ░░░░░░░ÜÜÜÜÜ╠╠╠╠╠╬╬╬╬╬╬╬╬╬╬╬╬╬D╬╬╬╠╬╬╬╬╬╬╬╬╬╬╬╬╬╬╩╬╩╬╬╬╬╬╠╠ÜÜ░░Ü",
      "░░░░=░░=░====░░░░░░░^^░░░░░░░╚╚╠╠╠╠╠╠╠╠╬╬╬╬╬╬╬D╬╠╠╠╬╠╠╬╬╠╬╬╬╬╬╬╬╬╬╬╬╬╠╠╠╠╠╚Ü░░░░",
      "=``                 ___`::┌=:░░[Ü╠╠╠╠╠╠╠╠╬╬╬╬╬╬╠╠╠╠╠╠╬╬╬╬╬╬╬╩╬╬╬╬╬╬╬╬╬╬╠╠╠Ü░░░Ü░",
      "`                 ````````:===jÜ╠╠╠╬╬╬╬╬╬╬╬╬╬╩╬Ü╠╠╠╠╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╠╠╠╠ÜÜ░░Ü░░",
      -- "                              _╙╩╠╠╠╠╠╠╠╠╠╠╠╠╝╩Ü╠╠╠╠╠╠╠╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╠╠╠ÜÜ░░Ü░░",
      -- "                             ___░░░]╚░░░░░░░░╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╬╠╠╠╚╠╠╠╠╠╠╠ÜÜÜ░░Ü░░",
      -- "░__                   ______░░░░░░░░░░░ÜÜÜÜ░░░ÜÜ╠Ü╠Ü╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠ÜÜ░░░Ü░░",
      -- "░░░░░░░-___░░░_____==:░░░=░░░░░░ÜÜ░░░░░░░░░░Ü╠╠ÜÜÜÜ╠ÜÜ╠╠╠╠╠╠╠╠╠╠╠╠Ü╠ÜÜÜÜÜ░░░Ü░░░",
    }

    -- dashboard.section.header.val = {
    --   " █████  ███████ ████████ ██████   ██████",
    --   "██   ██ ██         ██    ██   ██ ██    ██",
    --   "███████ ███████    ██    ██████  ██    ██",
    --   "██   ██      ██    ██    ██   ██ ██    ██",
    --   "██   ██ ███████    ██    ██   ██  ██████",
    --   " ",
    --   "    ███    ██ ██    ██ ██ ███    ███",
    --   "    ████   ██ ██    ██ ██ ████  ████",
    --   "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
    --   "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
    --   "    ██   ████   ████   ██ ██      ██",
    -- }
    dashboard.section.header.opts.hl = "Error"
    -- dashboard.section.header.opts.hl = "DashboardHeader"
    dashboard.section.footer.opts.hl = "DashboardFooter"

    local button, get_icon = require("astronvim.utils").alpha_button, require("astronvim.utils").get_icon
    dashboard.section.buttons.val = {
      button("LDR n  ", get_icon("FileNew", 2, true) .. "New File  "),
      button("LDR f f", get_icon("Search", 2, true) .. "Find File  "),
      button("LDR f o", get_icon("DefaultFile", 2, true) .. "Recents  "),
      button("LDR f w", get_icon("WordFile", 2, true) .. "Find Word  "),
      button("LDR f '", get_icon("Bookmarks", 2, true) .. "Bookmarks  "),
      button("LDR S l", get_icon("Refresh", 2, true) .. "Last Session  "),
      button("LDR f p", "󱌣  Projects"),
    }

    dashboard.config.layout = {
      { type = "padding", val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) } },
      dashboard.section.header,
      { type = "padding", val = 5 },
      dashboard.section.buttons,
      { type = "padding", val = 3 },
      dashboard.section.footer,
    }
    dashboard.config.opts.noautocmd = true
    return dashboard
  end,
  config = require "plugins.configs.alpha",
}
