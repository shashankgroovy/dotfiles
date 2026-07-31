local opt = vim.opt

-- UI
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.scrolloff = 3
opt.termguicolors = true
opt.wrap = false
opt.visualbell = false
opt.linespace = 3
opt.guifont = "Iosevka Nerd Font:h17"

-- Indentation
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.shiftround = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.gdefault = true

-- Folding
opt.foldmethod = "indent"
opt.foldlevel = 1
opt.foldnestmax = 10

-- Editing
opt.mouse = "a"
opt.undofile = true
opt.splitright = true
opt.splitbelow = true

-- Use ripgrep for :grep when available
if vim.fn.executable("rg") == 1 then
  opt.grepprg = "rg --vimgrep --smart-case"
  opt.grepformat = "%f:%l:%c:%m"
end
