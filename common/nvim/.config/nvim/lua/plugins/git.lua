return {
  { "lewis6991/gitsigns.nvim", event = { "BufReadPre", "BufNewFile" }, opts = {} },

  -- VeryLazy, not cmd-gated: fugitive has dozens of entry commands
  -- (:Gwrite, :Gread, :Gclog, ...) and is cheap to load
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
    dependencies = { "tpope/vim-rhubarb" },
  },

  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = { { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" } },
  },
}
