local M = {}

M.customTelescope = {
  n = {
    [",t"] = {"<cmd>Telescope find_files<CR>", "Open Telescope Find Files"},
    ["vv"] = {"<C-w>v", "Vertically split screen"},
    ["ss"] = {"<C-w>s", "Horizontally split screen"},
  },
}

return M
