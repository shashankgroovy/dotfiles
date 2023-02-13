local status, mason = pcall(require, "mason")
if (not status) then return end

local status_lsp, lspconfig = pcall(require, "mason-lspconfig")
if (not status_lsp) then return end

-- Configure Mason before Lsp
mason.setup({})

-- Configure the servers
lspconfig.setup {
    ensure_installed = SERVERS,
    automatic_installation = true
}
