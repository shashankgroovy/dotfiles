return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    cmd = "ToggleTerm",
    keys = { { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Terminal" } },
    opts = {},
  },

  -- VeryLazy (not InsertEnter) so copilot's <Tab> map exists before
  -- blink.cmp's, letting blink's fallback reach it
  { "github/copilot.vim", event = "VeryLazy" },

  { "wakatime/vim-wakatime", event = "VeryLazy" },

  -- In-buffer markdown rendering (headings, tables, checkboxes)
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = "markdown",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
}
