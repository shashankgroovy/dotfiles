return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    cmd = "ToggleTerm",
    keys = { { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Terminal" } },
    opts = {},
  },

  -- AI chat
  {
    "robitx/gp.nvim",
    cmd = { "GpChatToggle", "GpChatNew", "GpChatFinder" },
    keys = { { "<leader>gp", "<cmd>GpChatToggle<cr>", desc = "AI chat" } },
    opts = {
      openai_api_key = { "cat", "~/.config/openai/api_key" },
    },
  },

  -- VeryLazy (not InsertEnter) so copilot's <Tab> map exists before
  -- blink.cmp's, letting blink's fallback reach it
  { "github/copilot.vim", event = "VeryLazy" },

  { "wakatime/vim-wakatime", event = "VeryLazy" },
}
