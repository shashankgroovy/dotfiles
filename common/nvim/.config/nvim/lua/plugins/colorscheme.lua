return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      transparent = true, -- matches the transparent alacritty setup
      styles = {
        -- sidebars (neo-tree, aerial, help, qf) get their own hl groups
        -- and stay opaque unless told otherwise
        sidebars = "transparent",
      },
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme("tokyonight-night")
    end,
  },

  -- Alternate scheme: Lua port of the old ayu-vim
  { "Shatur/neovim-ayu", lazy = true },
}
