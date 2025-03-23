-- Window function
local M = {}

M.get_window = function(mode, orientation, message)
  local curr_file_dir = vim.fn.expand("%:h")
  local curr_file = vim.fn.expand("%:p:.")
  local sleep_time = 100

  if mode == "win" then
    if orientation == "v" then
      vim.cmd.vnew()
      vim.cmd("e " .. curr_file)
    else
      vim.cmd.new()
      vim.cmd("e " .. curr_file)
    end
  elseif mode == "term" then
    if orientation == "v" then
      vim.cmd.vnew()
      vim.cmd.term()
      vim.cmd.start()
      vim.uv.sleep(sleep_time)
      vim.api.nvim_feedkeys("cd ~/" .. curr_file_dir .. "\n", "t", true)
      vim.api.nvim_win_set_height(0, 12)
    elseif orientation == "h" then
      vim.cmd.new()
      vim.cmd.term()
      vim.cmd.start()
      vim.uv.sleep(sleep_time)
      vim.api.nvim_feedkeys("cd ~/" .. curr_file_dir .. "\n", "t", true)
      vim.api.nvim_win_set_height(0, 12)
    else
      vim.cmd.term()
      vim.cmd.start()
      vim.uv.sleep(sleep_time)
      vim.api.nvim_feedkeys("cd ~/" .. curr_file_dir .. "\n", "t", true)
    end
  elseif mode == "git" then
    if message == "add" then
      vim.cmd.new()
      vim.cmd.term()
      vim.cmd.start()
      vim.uv.sleep(sleep_time)
      vim.api.nvim_feedkeys("cd ~/" .. curr_file_dir .. "\n", "t", true)
      vim.api.nvim_feedkeys('git add .', "t", true)
      vim.api.nvim_win_set_height(0, 12)
    elseif message == "commit" then
      vim.cmd.new()
      vim.cmd.term()
      vim.cmd.start()
      vim.uv.sleep(sleep_time)
      vim.api.nvim_feedkeys("cd ~/" .. curr_file_dir .. "\n", "t", true)
      vim.api.nvim_feedkeys('git commit -m "', "t", true)
      vim.api.nvim_win_set_height(0, 12)
    elseif message == "push" then
      vim.cmd.new()
      vim.cmd.term()
      vim.cmd.start()
      vim.uv.sleep(sleep_time)
      vim.api.nvim_feedkeys("cd ~/" .. curr_file_dir .. "\n", "t", true)
      vim.api.nvim_feedkeys('git push', "t", true)
      vim.api.nvim_win_set_height(0, 12)
    end
  end
end

M.get_color = function (opts)
  local color = opts.color or ""
  vim.cmd.colo(color)
end


return M
