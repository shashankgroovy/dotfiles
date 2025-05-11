-- Configure LSP
local status, nvim_lsp = pcall(require, "lspconfig")
if not status then return end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- On Attach functionality
local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  -- Show hover doc
  if client.server_capabilities.hoverProvider then
    vim.keymap.set('n', 'gK', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gk', vim.lsp.buf.hover, bufopts)
  end

  if client.server_capabilities.completionProvider then
    vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gK', vim.lsp.buf.signature_help, bufopts)
  end

  if client.server_capabilities.definitionProvider then
    vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  end

  if client.server_capabilities.referencesProvider then
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  end

  -- Formatting
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function() vim.lsp.buf.formatting_seq_sync() end,
    })
  end

  -- Enable code action
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
end

-- Attach language clients
for _, lsp in ipairs(SERVERS) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Configure errors and diagnostics mappings
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.hide, opts)
vim.keymap.set('n', '<leader>E', vim.diagnostic.show, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

-- Handle LspAttach event
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local bufnr = args.buf

    on_attach(client, bufnr)
  end,
})
