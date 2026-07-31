local cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
local capabilities = cmp_ok and cmp_nvim_lsp.default_capabilities() or {}

vim.lsp.config('*', {
  capabilities = capabilities,
})

if SERVERS then
  vim.lsp.enable(SERVERS)
end

-- nvim 0.11+ already provides default LspAttach mappings (K, grr, gri, gra,
-- grn, gO) and sets omnifunc/tagfunc. Only define mappings that diverge from
-- those defaults.
local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  if client.server_capabilities.hoverProvider then
    vim.keymap.set('n', 'gK', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gk', vim.lsp.buf.hover, bufopts)
  end

  if client.server_capabilities.completionProvider then
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gK', vim.lsp.buf.signature_help, bufopts)
  end

  if client.server_capabilities.definitionProvider then
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  end

  if client.server_capabilities.referencesProvider then
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  end

  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function() vim.lsp.buf.format({ async = false }) end,
    })
  end

  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
end

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.hide, opts)
vim.keymap.set('n', '<leader>E', vim.diagnostic.show, opts)
vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)
vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client then
      on_attach(client, args.buf)
    end
  end,
})
