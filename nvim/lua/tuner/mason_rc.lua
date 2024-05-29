-- Attempt to load mason
local mason_status, mason = pcall(require, "mason")
if not mason_status then
    vim.notify("Failed to load mason", vim.log.levels.ERROR)
    return
end

-- Attempt to load mason-lspconfig
local lspconfig_status, lspconfig = pcall(require, "mason-lspconfig")
if not lspconfig_status then
    vim.notify("Failed to load mason-lspconfig", vim.log.levels.ERROR)
    return
end

-- Ensure SERVERS is defined
if not SERVERS then
    vim.notify("SERVERS is not defined", vim.log.levels.ERROR)
    return
end

-- Configure Mason
mason.setup({})

-- Configure Mason-LSPconfig with the servers to install
lspconfig.setup {
    ensure_installed = SERVERS,
    automatic_installation = true,
}

