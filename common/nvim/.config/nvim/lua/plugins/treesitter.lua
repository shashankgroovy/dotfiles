-- nvim-treesitter `main` branch (required for Neovim 0.12+).
-- The old `master` API (setup{ensure_installed=…, highlight, indent, …})
-- is gone; parsers are installed via `.install()` and highlight/indent
-- are wired up through the built-in vim.treesitter APIs.
return {
  -- Pin the enclosing function/class signature to the top while scrolling
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufReadPre", "BufNewFile" },
    opts = { max_lines = 4 },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      local ts = require("nvim-treesitter")

      -- Keep parsers in stdpath("data")/site: reuses the already-compiled
      -- ones and survives plugin reinstalls
      ts.setup({ install_dir = vim.fn.stdpath("data") .. "/site" })

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

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("treesitter_start", { clear = true }),
        callback = function(args)
          local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
          if not lang then return end
          -- without a highlights query, starting treesitter would disable
          -- legacy syntax and render a colorless buffer - fall back instead
          if not vim.treesitter.query.get(lang, "highlights") then return end
          if not pcall(vim.treesitter.start, args.buf, lang) then return end
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}
