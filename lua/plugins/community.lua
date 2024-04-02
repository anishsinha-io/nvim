return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of importing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity
  --
  -- lang
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.clojure" },
  -- { import = "astrocommunity.pack.cmake" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.dart" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.elm" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.godot" },
  { import = "astrocommunity.pack.helm" },
  -- { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.julia" },
  { import = "astrocommunity.pack.just" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.prisma" },
  { import = "astrocommunity.pack.proto" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.python-ruff" },
  { import = "astrocommunity.pack.ruby" },
  { import = "astrocommunity.pack.scala" },
  { import = "astrocommunity.pack.svelte" },
  { import = "astrocommunity.pack.swift" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.terraform" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.typescript-all-in-one" },
  { import = "astrocommunity.pack.vue" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.zig" },

  --
  -- framework
  { import = "astrocommunity.pack.angular" },
  { import = "astrocommunity.pack.ansible" },
  { import = "astrocommunity.pack.astro" },

  --
  -- diagnostics
  { import = "astrocommunity.diagnostics.trouble-nvim" },

  --
  -- editing support
  { import = "astrocommunity.editing-support.todo-comments-nvim" },

  --
  -- ui
  { import = "astrocommunity.scrolling.mini-animate" },
  { import = "astrocommunity.scrolling.vim-smoothie" },
  { import = "astrocommunity.utility.noice-nvim" },

  --
  -- test
  -- { import = "astrocommunity.test.neotest" },
  -- { import = "astrocommunity.test.nvim-coverage" },

  --
  -- project
  { import = "astrocommunity.project.project-nvim" },

  --
  -- code runner
  { import = "astrocommunity.code-runner.overseer-nvim" },

  --
  -- note taking
  -- { import = "astrocommunity.note-taking.neorg" },
}
