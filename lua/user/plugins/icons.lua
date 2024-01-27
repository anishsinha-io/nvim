return {
  {
    "nvim-tree/nvim-web-devicons",
    opts = {
      strict = true,

      override_by_filename = {
        -- FIXME: create an issue on [nvim web devicons](https://github.com/nvim-tree/nvim-web-devicons)
        -- Cargo.toml override does not work (while opam overrides, not shown below, but tested, do work)
        -- ["Cargo.toml"] = {
        --   icon = "󰏓",
        --   color = "#d7af87",
        --   cterm_color = "180",
        --   name = "Cargo",
        -- },
        ["test.opam"] = {
          icon = "",
          color = "#d75f00",
          cterm_color = "166",
          name = "Opam",
        },
        [".ocamlformat"] = {
          icon = "",
          name = "OCamlFormat",
        },
        ["dune-project"] = {
          icon = "󰏓",
          color = "#d7af87",
          cterm_color = "180",
          name = "DuneProject",
        },
        dune = {
          icon = "",
          name = "Dune",
        },
      },
      override_by_extension = {
        ml = {
          icon = "󰘧",
          color = "#ee6a1a",
          cterm_color = "130",
          name = "OCaml",
        },
        toml = {
          icon = "",
          name = "TOML",
        },
        pro = {
          icon = "",
          color = "#d75f5f",
          cterm_color = "167",
          name = "Prolog",
        },
      },
    },
  },
}
