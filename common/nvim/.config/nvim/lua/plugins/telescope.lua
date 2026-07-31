return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = {
      { ";f", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { ";r", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
      { "\\\\", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({})
      pcall(telescope.load_extension, "fzf")
    end,
  },
}
