return {
  { "lewis6991/gitsigns.nvim", event = { "BufReadPre", "BufNewFile" }, opts = {} },

  -- VeryLazy, not cmd-gated: fugitive has dozens of entry commands
  -- (:Gwrite, :Gread, :Gclog, ...) and is cheap to load
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
    dependencies = { "tpope/vim-rhubarb" },
  },

  -- Branch/PR diffs and per-file git history
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose" },
  },

  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = { { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" } },
  },
}
