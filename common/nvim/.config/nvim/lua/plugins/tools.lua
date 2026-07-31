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
      -- gp spawns the command without a shell, so ~ must be pre-expanded
      openai_api_key = os.getenv("OPENAI_API_KEY")
        or { "cat", vim.fn.expand("~/.config/openai/api_key") },
    },
  },

  -- VeryLazy (not InsertEnter) so copilot's <Tab> map exists before
  -- blink.cmp's, letting blink's fallback reach it
  { "github/copilot.vim", event = "VeryLazy" },

  { "wakatime/vim-wakatime", event = "VeryLazy" },
}
