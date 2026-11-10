-- Colorscheme used when nothing else is configured. To pick a different one on
-- a single machine, create the untracked lua/config/local.lua:
--   return { colorscheme = "solarized" }
local default = "tokyonight-night"

local ok, machine = pcall(require, "config.local")
local active = ok and type(machine) == "table" and machine.colorscheme or default

-- Every scheme is installed everywhere; only the active one loads at startup.
-- The rest stay lazy and load on demand via `:colorscheme <name>`.
local function scheme(prefix, spec)
  local on = active:find("^" .. prefix) ~= nil
  local setup = spec.config
  spec.lazy = not on
  spec.priority = 1000
  spec.config = function(_, opts)
    if setup then
      setup(opts)
    end
    if on then
      vim.cmd.colorscheme(active)
    end
  end
  return spec
end

return {
  scheme("tokyonight", {
    "folke/tokyonight.nvim",
    opts = {
      style = "night",
      transparent = true, -- matches the transparent alacritty setup
      styles = {
        -- sidebars (neo-tree, aerial, help, qf) get their own hl groups
        -- and stay opaque unless told otherwise
        sidebars = "transparent",
      },
    },
    config = function(opts)
      require("tokyonight").setup(opts)
    end,
  }),

  scheme("solarized", {
    "maxmx03/solarized.nvim",
    opts = {
      variant = "autumn", -- closest to the classic Solarized palette
      transparent = { enabled = true }, -- matches the transparent alacritty setup
    },
    config = function(opts)
      vim.o.background = "dark"
      require("solarized").setup(opts)
    end,
  }),

  -- Lua port of the old ayu-vim
  scheme("ayu", { "Shatur/neovim-ayu" }),
}
