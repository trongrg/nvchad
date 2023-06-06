---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

M.customTelescope = {
  n = {
    [",t"] = {"<cmd>Telescope find_files<CR>", "Open Telescope Find Files"},
    ["vv"] = {"<C-w>v", "Vertically split screen"},
    ["ss"] = {"<C-w>s", "Horizontally split screen"},
  },
}

-- more keybinds!

return M
