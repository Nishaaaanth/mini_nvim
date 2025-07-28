return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require 'nvim-treesitter.configs'.setup {
        ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query', 'markdown', 'markdown_inline', 'tsx'},
        auto_install = true,
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        ignore_install = {},
        sync_install = false,
        modules = {},
      }

      local highlight_group = vim.api.nvim_create_augroup("Highlight", { clear = true })
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
        group = highlight_group,
        pattern = { "*.prisma" },
        callback = function()
          vim.cmd("TSEnable highlight")
        end
      })
    end
  }
}
