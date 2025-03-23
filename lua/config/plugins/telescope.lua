return {
  "nvim-telescope/telescope.nvim",
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },

  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")
    local themes = require("telescope.themes")
    local grep = require("config.plugins.telescope.multigrep")
    telescope.setup {
      pickers = {
        find_files = {
          theme = "ivy"
        }
     },
      extensions = {
        fzf = {}
      }
    }

    telescope.load_extension("fzf")

    vim.keymap.set('n', '<leader>sf', builtin.find_files)
    vim.keymap.set('n', '<leader>sc', function()
      builtin.find_files {
        cwd = vim.fn.stdpath("config")
      }
    end)
    vim.keymap.set('n', '<leader>sg', builtin.git_commits)
    vim.keymap.set('n', '<leader>sh', builtin.help_tags)
    vim.keymap.set('n', '<leader><leader>', function() builtin.oldfiles(themes.get_ivy()) end)
    vim.keymap.set('n', '<leader>sm', function() grep.setup() end)

    -- for developer experience
    vim.keymap.set('n', '<leader>sd', function()
      builtin.find_files {
        cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
      }
    end)
  end
}
