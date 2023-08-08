return {
  {
    "VonHeikemen/lsp-zero.nvim",
    lazy = true,
    event = "BufReadPre",
    config = function()
      local lsp = require("lsp-zero")
      local cmp = require('cmp')
      local null_ls = require("null-ls")
      local null_opts = lsp.build_options('null-ls', {})

      lsp.preset("recommended")

      lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({ buffer = bufnr })
        lsp.buffer_autoformat()
      end)

      lsp.set_sign_icons({
        error = "",
        warn = "",
        hint = "",
        info = "",
        other = "﫠",
      })

      lsp.setup_nvim_cmp({
        sources = {
          { name = "copilot" },
          { name = "nvim_lsp" },
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-.>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false
          }),
        }),
      })

      lsp.nvim_workspace()
      lsp.setup()

      null_ls.setup({
        on_attach = function(client, bufnr)
          null_opts.on_attach(client, bufnr)
        end,
        sources = {
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.code_actions.eslint_d,
          null_ls.builtins.diagnostics.eslint_d,
          null_ls.builtins.formatting.stylua,
        }
      })
    end,
    dependencies = {
      "nvim-lspconfig",
      "hrsh7th/nvim-cmp",
      "mason.nvim",
      "null-ls.nvim",
      "mason-lspconfig.nvim",
      "nvim-cmp",
      "cmp-nvim-lsp",
      "cmp_luasnip",
      "cmp-buffer",
      "cmp-path",
      "cmp-cmdline",
    },
  },
  { "jose-elias-alvarez/null-ls.nvim",   lazy = true },
  { "neovim/nvim-lspconfig",             lazy = true },
  { "williamboman/mason-lspconfig.nvim", lazy = true },
  { "williamboman/mason.nvim",           lazy = true },
  { "hrsh7th/nvim-cmp",                  lazy = true },
  { "ray-x/lsp_signature.nvim",          config = true },
  { "hrsh7th/cmp-nvim-lsp",              lazy = true },
  { "hrsh7th/cmp-buffer",                lazy = true },
  { "hrsh7th/cmp-path",                  lazy = true },
  { "hrsh7th/cmp-cmdline",               lazy = true },
  { "saadparwaiz1/cmp_luasnip",          lazy = true },
  { "L3MON4D3/LuaSnip",                  lazy = true },
  { "rafamadriz/friendly-snippets",      lazy = true },
}
