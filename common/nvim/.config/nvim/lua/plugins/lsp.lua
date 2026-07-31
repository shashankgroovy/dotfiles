-- Language servers (lspconfig names). mason-lspconfig v2 installs these and
-- auto-enables every installed server (automatic_enable defaults to true),
-- so there is no manual vim.lsp.enable() call anywhere.
local servers = {
  "bashls",
  "cmake",
  "dockerls",
  "eslint",
  "gopls",
  "intelephense",
  "lua_ls",
  "marksman",
  "pyright",
  "rust_analyzer",
  "terraformls",
  "ts_ls",
  "vimls",
  "yamlls",
}

return {
  -- nvim API types/completions for lua_ls when editing this config
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      -- LSP server stderr (terraform-ls is chatty) otherwise bloats
      -- ~/.local/state/nvim/lsp.log; flip to WARN when debugging LSP issues
      vim.lsp.log.set_level(vim.log.levels.OFF)

      -- float on [d / ]d jumps (jump.float is deprecated, gone in 0.14)
      vim.diagnostic.config({
        jump = {
          on_jump = function(_, bufnr)
            vim.diagnostic.open_float({ bufnr = bufnr, scope = "cursor", focus = false })
          end,
        },
      })

      -- Advertise blink.cmp completion capabilities to every server
      local ok, blink = pcall(require, "blink.cmp")
      if ok then
        vim.lsp.config("*", { capabilities = blink.get_lsp_capabilities() })
      end

      require("mason-lspconfig").setup({ ensure_installed = servers })

      -- 0.11+ ships defaults: K hover, grr references, gri implementation,
      -- grn rename, gra code action, grt type definition, gO symbols,
      -- <C-s> signature help (insert), [d / ]d diagnostics.
      -- Map only what diverges from those. Format-on-save is owned by
      -- conform.nvim (see format-lint.lua), not the LSP attach handler.
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("user_lsp_attach", { clear = true }),
        callback = function(args)
          local bufopts = { silent = true, buffer = args.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
          vim.keymap.set("n", "gK", vim.lsp.buf.signature_help, bufopts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
        end,
      })
    end,
  },
}
