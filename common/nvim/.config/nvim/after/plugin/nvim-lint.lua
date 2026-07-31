local lint_ok, lint = pcall(require, "lint")
if not lint_ok then return end

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
