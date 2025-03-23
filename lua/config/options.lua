-- Line Numbers
vim.o.nu = true
vim.o.rnu = true

-- Indents
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true

-- Colors & Highlights
vim.o.termguicolors = true
vim.o.guicursor = 'n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20'
vim.g.bg = "dark"
vim.o.hlsearch = false
vim.o.signcolumn = "yes:1"

-- Split
vim.o.splitbelow = true
vim.o.splitright = true

-- Edit
vim.o.wrap = true
-- vim.o.scrolloff = 999
vim.o.virtualedit = "block"

-- Misc
vim.o.mouse = 'a'
vim.opt.inccommand = "split"
vim.o.updatetime = 50
vim.o.clipboard = "unnamedplus"
vim.opt.conceallevel = 0
vim.cmd [[hi @function.builtin guifg=yellow]]

-- Netrw
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 26

-- Augroup
local yank_group = vim.api.nvim_create_augroup("Highlight-Yank", {clear = true})
local terminal_group = vim.api.nvim_create_augroup("Terminal", {clear = true})

-- Autocmd
vim.api.nvim_create_autocmd("TextYankPost", {
  group = yank_group,
  callback = function()
    vim.highlight.on_yank()
  end
})

vim.api.nvim_create_autocmd("TermOpen", {
  group = terminal_group,
  command = "setlocal nonumber norelativenumber"
})

return {}
