-- nvim-treesitter `main` branch (required for Neovim 0.12+).
-- The old `master` API (setup{ensure_installed=…, highlight, indent, …})
-- is gone; parsers are installed via `.install()` and highlight/indent
-- are wired up through the built-in vim.treesitter APIs.

local ok, ts = pcall(require, "nvim-treesitter")
if not ok then return end

ts.install({
  "bash",
  "comment",
  "go",
  "html",
  "javascript",
  "json",
  "lua",
  "make",
  "markdown",
  "markdown_inline",
  "php",
  "python",
  "query",
  "rasi",
  "rust",
  "terraform",
  "toml",
  "tsx",
  "typescript",
  "vim",
  "vimdoc",
  "yaml",
})

if vim.g.vscode == 1 then return end

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("tuner_treesitter", { clear = true }),
  callback = function(args)
    local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
    if not lang then return end
    if not pcall(vim.treesitter.start, args.buf, lang) then return end
    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
