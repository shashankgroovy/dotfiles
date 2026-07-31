local map = vim.keymap.set

-- Better Esc
map("i", "jk", "<Esc>")

-- Better use of H and L
map("n", "H", "^")
map("n", "L", "$")

-- Folds on Space
map("n", "<Space>", "za")

-- Tab control
map("n", "tn", "<cmd>tabnew<cr>")
map("n", "td", "<cmd>tabclose<cr>")
map("n", "tj", "<cmd>tabnext<cr>")
map("n", "tk", "<cmd>tabprev<cr>")
map("n", "<C-Tab>", "<cmd>tabnext<cr>")
map("n", "<C-S-Tab>", "<cmd>tabprevious<cr>")

-- Buffer control
map("n", "<leader>bn", "<cmd>bnext<cr>")
map("n", "<leader>bp", "<cmd>bprevious<cr>")
map("n", "<C-`>", "<cmd>bnext<cr>")
map("n", "<C-S-`>", "<cmd>bprevious<cr>")

-- Window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Move lines in visual mode
map("v", "<C-j>", ":m '>+1<CR>gv=gv")
map("v", "<C-k>", ":m '<-2<CR>gv=gv")

-- System clipboard
map({ "n", "v" }, "<leader>y", '"+y')
map({ "n", "v" }, "<leader>p", '"+p')

-- Toggle spell check
map("n", "<leader>s", "<cmd>set spell!<cr>")

-- Clear search highlight
map("n", ";h", "<cmd>nohlsearch<cr>")
map("n", "<CR>", function()
  -- Keep <CR> functional in quickfix/loclist and the cmdline window
  if vim.bo.buftype == "quickfix" or vim.fn.getcmdwintype() ~= "" then
    return "<CR>"
  end
  return "<cmd>nohlsearch<cr>"
end, { expr = true, silent = true })

-- Format JSON via jq
map("n", "gj", ":%!jq .<CR>:set ft=json<CR>", { silent = true })

-- Format SQL via sqlformat
map("n", "<leader>gs", function()
  if vim.fn.executable("sqlformat") ~= 1 then
    vim.notify("sqlformat not found (uv tool install sqlparse)", vim.log.levels.WARN)
    return
  end
  vim.opt_local.autoindent = false
  vim.cmd([[%!sqlformat --reindent --keywords upper --identifiers lower -]])
  vim.bo.syntax = "sql"
end, { desc = "Format buffer as SQL" })

-- Terminal: easily exit terminal mode
map("t", "<Esc>", [[<C-\><C-n>]])

-- Diagnostics (jump maps [d / ]d are built-in)
map("n", "<leader>e", vim.diagnostic.hide)
map("n", "<leader>E", vim.diagnostic.show)
map("n", "<leader>q", vim.diagnostic.setloclist)

-- Toggle light/dark background
map("n", "<leader>bg", function()
  vim.o.background = (vim.o.background == "dark") and "light" or "dark"
end)

-- Edit this config in a jiffy
map("n", "<leader><leader>v", "<cmd>edit $MYVIMRC<cr>")

-- Save as sudo when vim wasn't started with it
map("c", "w!!", "w !sudo tee > /dev/null %")

-- Change to directory of current file
vim.api.nvim_create_user_command("CDC", "lcd %:p:h", { desc = "cd to current file's directory" })

-- Delete all other buffers (replaces BufOnly.vim); keeps modified ones
vim.api.nvim_create_user_command("BufOnly", function()
  local cur = vim.api.nvim_get_current_buf()
  local closed = 0
  for _, b in ipairs(vim.api.nvim_list_bufs()) do
    if b ~= cur and vim.bo[b].buflisted and not vim.bo[b].modified then
      vim.api.nvim_buf_delete(b, {})
      closed = closed + 1
    end
  end
  vim.notify(("Closed %d buffer(s)"):format(closed))
end, { desc = "Delete all buffers except the current one" })
