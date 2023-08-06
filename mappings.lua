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
  }
}

M.macMapping = {
  n = {
    ["<D-a>"] = {"ggVG", "Select all texts", opts = { nowait = true, noremap = true, silent = true }},
    ["vv"] = {"<C-w>v", "Vertically split screen"},
    ["ss"] = {"<C-w>s", "Horizontally split screen"},
    ["<D-s>"] = {":w<CR>", "Save current buffer", opts = { nowait = true, noremap = true, silent = true }},
    ["<D-w>"] = {":q<CR>", "Close current buffer", opts = { nowait = true, noremap = true, silent = true }},
    ["<D-v>"] = {"\"+P", "Paste from clipboard", opts = { nowait = true, noremap = true, silent = true }},
    ["<D-c>"] = {"\"+y", "Copy to clipboard", opts = { nowait = true, noremap = true, silent = true }},
  },
  v = {
    ["<D-v>"] = {"\"+P", "Paste from clipboard", opts = { nowait = true, noremap = true, silent = true }},
    ["<D-c>"] = {"\"+y", "Copy to clipboard", opts = { nowait = true, noremap = true, silent = true }},
    ["<D-x>"] = {"\"+c", "Cut to clipboard", opts = { nowait = true, noremap = true, silent = true }},
  },
  i = {
    ["<D-a>"] = {"<ESC>ggG", "Select all texts", opts = { nowait = true, noremap = true, silent = true }},
    ["<D-s>"] = {"<ESC>:w<CR>a", "Save current buffer", opts = { nowait = true, noremap = true, silent = true }},
    ["<D-w>"] = {"<ESC>:q<CR>", "Close current buffer", opts = { nowait = true, noremap = true, silent = true }},
    ["<D-v>"] = {"<C-R>+", "Paste from clipboard", opts = { nowait = true, noremap = true, silent = true }},
  }
}

M.ndapMapping = {
  n = {
    ["<F2>"] = {"<Cmd>lua require'dap'.step_into()<CR>", "Step Into", opts = { silent = true, noremap = true }},
    ["<F3>"] = {"<Cmd>lua require'dap'.step_over()<CR>", "Step Over", opts = { silent = true, noremap = true }},
    ["<F4>"] = {"<Cmd>lua require'dap'.step_out()<CR>", "Step Out", opts = { silent = true, noremap = true }},
    ["<F5>"] = {"<Cmd>lua require'dap'.continue()<CR>", "Continue", opts = { silent = true, noremap = true }},
    ["<F6>"] = {"<Cmd>lua require'dap'.close()<CR>", "Close", opts = { silent = true, noremap = true }},
    ["<F10>"] = {"<Cmd>lua require'dap'.toggle_breakpoint()<CR>", "Toggle Breakpoint", opts = { silent = true, noremap = true }},
  }
}

-- more keybinds!

return M
