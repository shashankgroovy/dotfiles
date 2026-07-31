return {
  -- Jump anywhere on screen (replaces vim-easymotion)
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash jump" },
      -- no "x" mode: visual S belongs to nvim-surround (surround selection)
      { "S", mode = { "n", "o" }, function() require("flash").treesitter() end, desc = "Flash treesitter" },
    },
  },

  -- Auto-close pairs (replaces auto-pairs)
  { "echasnovski/mini.pairs", event = "InsertEnter", opts = {} },

  -- Surroundings with the classic ys/cs/ds keys (replaces vim-surround)
  { "kylechui/nvim-surround", event = "VeryLazy", opts = {} },

  -- Multiple cursors, same <C-n> flow (successor of vim-multiple-cursors)
  {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
    init = function()
      -- default VM leader is \\ which would put a timeout on the \\ buffers map
      vim.g.VM_leader = ",m"
    end,
  },

  -- gS / gJ split-join
  { "AndrewRadev/splitjoin.vim", keys = { "gS", "gJ" } },

  -- Project-wide search & replace with live preview
  {
    "MagicDuck/grug-far.nvim",
    cmd = "GrugFar",
    keys = { { ";s", "<cmd>GrugFar<cr>", desc = "Search & replace" } },
    opts = {},
  },

  -- Undo history visualizer
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    keys = { { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undo tree" } },
  },

  -- Symbols outline via LSP/treesitter (replaces tagbar, no ctags needed)
  {
    "stevearc/aerial.nvim",
    cmd = { "AerialToggle", "AerialOpen" },
    keys = { { "<leader>c", "<cmd>AerialToggle!<cr>", desc = "Symbols outline" } },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
}
