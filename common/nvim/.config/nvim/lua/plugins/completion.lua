return {
  -- Completion engine (replaces nvim-cmp + cmp-* + vsnip + lspkind +
  -- lsp_signature): cmdline completion, signature help, kind icons and
  -- native vim.snippet support are all built in.
  {
    "saghen/blink.cmp",
    version = "1.*",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = { "rafamadriz/friendly-snippets" },
    opts = {
      keymap = {
        -- <CR> confirms, like the old cmp setup
        preset = "enter",
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
        -- With the menu closed, Tab falls through to copilot.vim's
        -- ghost-text accept
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
      },
      appearance = { nerd_font_variant = "normal" },
      completion = {
        documentation = { auto_show = true },
      },
      signature = { enabled = true },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
  },
}
