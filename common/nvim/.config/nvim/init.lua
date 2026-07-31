--
--       _                 _           __  _       _    __ _ _
--   ___| |__   __ _ _ __ | | _____   / /_| | ___ | |_ / _(_) | ___  ___
--  / __| '_ \ / _` | '_ \| |/ / __| / / _` |/ _ \| __| |_| | |/ _ \/ __|
--  \__ \ | | | (_| | | | |   <\__ \/ / (_| | (_) | |_|  _| | |  __/\__ \
--  |___/_| |_|\__,_|_| |_|_|\_\___/_/ \__,_|\___/ \__|_| |_|_|\___||___/
--
--  Neovim configuration, part of my dotfiles setup.
--  https://github.com/shashankgroovy/dotfiles

-- Leader must be set before lazy.nvim loads any plugin
vim.g.mapleader = ","
vim.g.maplocalleader = ","

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.lazy")
