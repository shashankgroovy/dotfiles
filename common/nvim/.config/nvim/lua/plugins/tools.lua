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

  -- Aligned CSV columns with field textobjects/navigation
  {
    "hat0uma/csvview.nvim",
    cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
    keys = { { "<leader>tv", "<cmd>CsvViewToggle<cr>", desc = "CSV view" } },
    opts = {
      parser = { comments = { "#", "//" } },
      keymaps = {
        textobject_field_inner = { "if", mode = { "o", "x" } },
        textobject_field_outer = { "af", mode = { "o", "x" } },
        jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
        jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
        jump_next_row = { "<Enter>", mode = { "n", "v" } },
        jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
      },
    },
  },
}
