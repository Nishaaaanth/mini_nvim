return {
  {
    "neovim/nvim-lspconfig",

    config = function()
      local lspconfig = require('lspconfig')
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      lspconfig.lua_ls.setup {
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT',
            },
            diagnostics = {
              globals = {
                'vim',
                'require'
              },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
              enable = false,
            },
          },
        },
        capabilities = capabilities
      }
      lspconfig.clangd.setup {}

      vim.keymap.set('n', "<leader>lr", function() vim.lsp.buf.rename() end, { desc = "[L]sp [r]ename" })
      vim.keymap.set('n', "<leader>lk", function() vim.lsp.buf.hover() end, { desc = "[L]sp [k]nowledge" })
      vim.keymap.set('n', "<leader>ld", function() vim.lsp.buf.definition() end, { desc = "[L]sp [d]efinition" })
      vim.keymap.set('n', "<leader>li", function() vim.lsp.buf.implementation() end,
        { desc = "[L]sp [i]mplementation" })
      vim.keymap.set('n', "<leader>lt", function() vim.lsp.buf.type_definition() end,
        { desc = "[L]sp [t]ype definition" })
      vim.keymap.set('n', "<leader>lq", function() vim.lsp.buf.references() end, { desc = "[L]sp [r]eferences" })
      vim.keymap.set('n', "<M-d>", function() vim.diagnostic.setqflist() end, { desc = "Lsp [d]iagnostics" })
      vim.keymap.set('n', "<leader>lf", function() vim.lsp.buf.format() end,
        { desc = "[L]sp [f]ormat" })
      vim.keymap.set('n', "<leader>la", vim.lsp.buf.code_action, { desc = "[L]sp code [a]ction" })
      vim.keymap.set('n', "<leader>dn", function() vim.diagnostic.jump({ count = 1, float = true }) end,
        { desc = "[D]iagnostic [n]ext" })
      vim.keymap.set('n', "<leader>dp", function() vim.diagnostic.jump({ count = 1, float = true }) end,
        { desc = "[D]iagnostic [p]rev" })
    end
  }
}
