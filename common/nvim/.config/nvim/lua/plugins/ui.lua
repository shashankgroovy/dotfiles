return {
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- Popup cheatsheet for pending keymaps (pause after , g z [ ...)
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- Statusline (replaces vim-airline)
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = { theme = "tokyonight" },
    },
  },

  -- Buffer tabline (replaces airline's tabline)
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = { mode = "buffers", diagnostics = "nvim_lsp" },
    },
  },

  -- Greeter dashboard
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = {
        "                                                     ",
        "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
        "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
        "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
        "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
        "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
        "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
        "                                                     ",
        "        .    '                   .  '   '            ",
        "              .  .  .                 '      '       ",
        "       `       .   .                                 ",
        "                                       '     '       ",
        "            '      _______________                   ",
        "               ==c(___(o(______(_()                  ",
        "                      \\=\\                          ",
        "                       )=\\                          ",
        "                       //|\\                         ",
        "                      //|| \\                        ",
        "                     // ||  \\                       ",
        "                    //  ||   \\                      ",
        "                   //         \\                     ",
      }

      dashboard.section.buttons.val = {
        dashboard.button("e", "  New file", "<cmd>ene <BAR> startinsert<cr>"),
        dashboard.button("n", "  Toggle file explorer", "<cmd>Neotree toggle<cr>"),
        dashboard.button("o", "󰱼  Open File", "<cmd>Telescope find_files<cr>"),
        dashboard.button("f", "  Recent files", "<cmd>Telescope oldfiles<cr>"),
        dashboard.button("r", "  Find Word", "<cmd>Telescope live_grep<cr>"),
        dashboard.button("m", "  Find Marks", "<cmd>Telescope marks<cr>"),
        dashboard.button("q", "  Quit NVIM", "<cmd>qa<cr>"),
      }

      require("alpha").setup(dashboard.opts)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "alpha",
        callback = function()
          vim.opt_local.foldenable = false
        end,
      })
    end,
  },

  -- Zen mode (replaces goyo + limelight)
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    dependencies = { { "folke/twilight.nvim", opts = {} } },
    keys = {
      { "<leader><leader>z", "<cmd>ZenMode<cr>", desc = "Zen mode" },
      { "<leader><leader>zl", "<cmd>Twilight<cr>", desc = "Dim inactive code" },
    },
    opts = {},
  },
}
