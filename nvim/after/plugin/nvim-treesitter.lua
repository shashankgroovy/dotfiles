local ts_config = require "nvim-treesitter.configs"

ts_config.setup {
  ensure_installed = {
    "bash",
    "comment",
    "go",
    "html",
    "javascript",
    "json",
    "jsonc",
    "lua",
    "make",
    "markdown",
    "markdown_inline",
    "php",
    "python",
    "query",
    "rasi",
    "rust",
    "terraform",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "yaml",
  },

  autotag = { enable = true },
  highlight = { enable = vim.g.vscode ~= 1 },
  indent = { enable = true },
  matchup = { enable = true },
  playground = { enable = true },

  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<Enter>",
      node_incremental = "<Enter>",
      node_decremental = "<BS>",
    },
  },

  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner",
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<Leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<Leader>A"] = "@parameter.inner",
      },
    },
    lsp_interop = {
      enable = true,
    },
  },
}
