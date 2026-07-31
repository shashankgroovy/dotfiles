return {
  -- Formatting (replaces the LspAttach format-on-save autocmd and the
  -- vim-go / rust.vim format hooks). Filetypes without an entry fall back
  -- to LSP formatting, matching the old behavior.
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd = "ConformInfo",
    opts = {
      formatters_by_ft = {
        go = { "goimports", "gofmt" },
        rust = { "rustfmt" },
        sh = { "shfmt" },
      },
      default_format_opts = { lsp_format = "fallback" },
      format_on_save = { timeout_ms = 1000 },
    },
  },

  -- Linting
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufWritePost", "InsertLeave" },
    config = function()
      local lint = require("lint")

      lint.linters_by_ft = {
        sh = { "shellcheck" },
        bash = { "shellcheck" },
        zsh = { "shellcheck" },
        dockerfile = { "hadolint" },
        markdown = { "markdownlint-cli2" },
        yaml = { "yamllint" },
      }

      vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
        group = vim.api.nvim_create_augroup("NvimLint", { clear = true }),
        callback = function() require("lint").try_lint() end,
      })

      vim.keymap.set("n", "<leader>ll", function() require("lint").try_lint() end,
        { desc = "Trigger linting for current file" })
    end,
  },
}
