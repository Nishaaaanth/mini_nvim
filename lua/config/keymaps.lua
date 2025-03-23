local functions = require("config.functions")

-- Netrw
vim.keymap.set('n', "<leader>e", vim.cmd.Ex)

-- Generals
vim.keymap.set('v', "J", ":m '>+1<CR>gv=gv")
vim.keymap.set('v', "K", ":m '<-2<CR>gv=gv")
vim.keymap.set('t', "<esc>", "<C-\\><C-n>")

-- Splits
-- -- terminal
vim.keymap.set('n', "<leader>tt", function() functions.get_window("term", "h") end, { desc = '[T]erm [V]ertical' })
vim.keymap.set('n', "<leader>tv", function() functions.get_window("term", "v") end, { desc = '[T]erm [H]ertical' })
vim.keymap.set('n', "<leader>T", function() functions.get_window("term", "") end, { desc = '[T]erm' })
-- -- windows
vim.keymap.set('n', "<leader>wv", function() functions.get_window("win", "v") end, { desc = '[W]indow [v]ertical' })
vim.keymap.set('n', "<leader>ww", function() functions.get_window("win", "h") end, { desc = '[W]indow [h]orizontal' })
-- -- git
vim.keymap.set('n', "<leader>ga", function() functions.get_window("git", "", "add") end, {})
vim.keymap.set('n', "<leader>gc", function() functions.get_window("git", "", "commit") end, {})
vim.keymap.set('n', "<leader>gp", function() functions.get_window("git", "", "push") end, {})
-- -- resize
vim.keymap.set('n', "<leader>+", function()
  vim.cmd.res("15")
end, { desc = '[+] window' })

-- Colors
vim.keymap.set('n', "<leader>cg", function() functions.get_color("gruber-darker") end,
  { desc = '[C]olor [g]ruber-darker' })
vim.keymap.set('n', "<leader>ctn", function() functions.get_color("tokyonight-night") end,
  { desc = '[C]olor [t]tokyonight-[n]ight' })
vim.keymap.set('n', "<leader>ctd", function() functions.get_color("tokyonight-day") end,
  { desc = '[C]olor [t]tokyonight-[d]ay' })
vim.keymap.set('n', "<leader>ctm", function() functions.get_color("tokyonight-moon") end,
  { desc = '[C]olor [t]tokyonight-[m]oon' })

-- Tabs Controls
vim.keymap.set('n', "<M-t>", "<CMD>tabnew<CR>", {})
vim.keymap.set('n', "<M-n>", "<CMD>tabNext<CR>", {})

-- Windows controls
vim.keymap.set('n', "<M-,>", "<C-w>3>", {})
vim.keymap.set('n', "<M-.>", "<C-w>3<", {})
vim.keymap.set('n', "<M-=>", "<C-w>3+", {})
vim.keymap.set('n', "<M-->", "<C-w>3-", {})

-- Quick fix
vim.keymap.set('n', "<M-j>", "<CMD>cnext<CR>", {})
vim.keymap.set('n', "<M-k>", "<CMD>cprev<CR>", {})

return {}
