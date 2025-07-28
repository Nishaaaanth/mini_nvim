local basePath = "~/coding/neovim/plugins/"
local keywords = { "stackmap.nvim", "present.nvim" }

local plugins = {}

for _, plugin in ipairs(keywords) do
    table.insert(plugins, { dir = basePath .. plugin })
end

return plugins
