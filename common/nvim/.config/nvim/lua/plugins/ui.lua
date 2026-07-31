return {
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- Popup cheatsheet for pending keymaps (pause after , g z [ ...)
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- Statusline + buffer tabline (replaces vim-airline); rendering both
  -- through lualine keeps the two bars visually identical, airline-style
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = { theme = "tokyonight", globalstatus = false },
      tabline = {
        lualine_a = { { "buffers", symbols = { modified = " ●", alternate_file = "" } } },
        lualine_z = { "tabs" },
      },
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
        dashboard.button("f", "  Open File", "<cmd>Telescope find_files<cr>"),
        dashboard.button("o", "  Recent files", "<cmd>Telescope oldfiles<cr>"),
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

  -- Experimental: popup cmdline / message / LSP-progress UI.
  -- ,N toggles it; :Noice disable also works. Remove the spec if it doesn't stick.
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify", -- toast notifications; noice falls back to a bare overlay without it
    },
    keys = {
      {
        "<leader>N",
        function()
          if require("noice.config").is_running() then
            vim.cmd("Noice disable")
            -- noice leaves this behind; blink's cmdline menu would keep
            -- floating at the old popup position
            vim.g.ui_cmdline_pos = nil
            pcall(function() require("noice.ui.cmdline").position = nil end)
            vim.notify("noice disabled")
          else
            vim.cmd("Noice enable")
            vim.notify("noice enabled")
          end
        end,
        desc = "Toggle noice UI",
      },
    },
    opts = {
      lsp = {
        -- blink.cmp owns signature help already
        signature = { enabled = false },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        },
      },
      presets = {
        bottom_search = true,        -- / search stays at the bottom
        long_message_to_split = true,
        lsp_doc_border = true,       -- borders read better on transparent bg
      },
      -- centered cmdline popup (instead of the top-pinned command_palette preset)
      views = {
        cmdline_popup = {
          position = { row = "45%", col = "50%" },
          size = { min_width = 60, width = "auto" },
        },
        popupmenu = {
          relative = "editor",
          position = { row = "55%", col = "50%" },
          size = { width = 60, height = 10 },
        },
      },
    },
  },

  -- Zen mode (replaces goyo + limelight)
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    dependencies = { { "folke/twilight.nvim", opts = {} } },
    keys = {
      { "<leader><leader>z",  "<cmd>ZenMode<cr>",  desc = "Zen mode" },
      { "<leader><leader>zl", "<cmd>Twilight<cr>", desc = "Dim inactive code" },
    },
    opts = {},
  },
}
