return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    -- import nvim-treesitter plugin
    local treesitter = require("nvim-treesitter.configs")

    -- configure treesitter
    treesitter.setup({ -- enable syntax highlighting
      highlight = {
        enable = true,
      },
      -- enable indentation
      indent = { enable = true },
      -- enable autotagging (w/ nvim-ts-autotag plugin)
      autotag = {
        enable = true,
      },
      -- ensure these language parsers are installed
      ensure_installed = {
        "json",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "prisma",
        "markdown",
        "markdown_inline",
        "svelte",
        "graphql",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "query",
        "vimdoc",
        "c",
        "java",
        "cpp",
        "python",
        "angular",
        "dart",
        "go",
        "graphql",
        "http",
        "helm",
        "kotlin",
        "prisma",
        "rust",
        "sql",
        "yaml"
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-CR>",          -- Start selection with Control + Return
          node_incremental = "<C-CR>",        -- Expand selection with Control + Return
          scope_incremental = false,       -- Expand by scope with Option + Return
          node_decremental = "<C-BS>",        -- Shrink selection with Control + Backspace        
        },
      },
    })
  end,
}
