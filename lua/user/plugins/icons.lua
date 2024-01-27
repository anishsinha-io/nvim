return {
  {
    "nvim-tree/nvim-web-devicons",
    opts = {
      override = {
        -- toml
        toml = {
          icon = "",
          name = "toml",
        },
        -- ocaml
        ml = {
          icon = "󰘧",
          color = "#ee6a1a",
          cterm_color = "130",
          name = "ocaml",
        },
        ["dune-project"] = {
          icon = "󰏓",
          color = "#d7af87",
          cterm_color = "180",
          name = "duneproject",
        },
        dune = {
          icon = "",
          name = "dune",
        },
        [".ocamlformat"] = {
          icon = "",
          name = "ocamlformat",
        },
        opam = {
          icon = "",
          color = "#d75f00",
          cterm_color = "166",
          name = "opam",
        },
      },
    },
  },
}
