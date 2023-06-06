-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

if vim.g.neovide then
    -- Put anything you want to happen only in Neovide here
  vim.o.guifont = "FantasqueSansM Nerd Font:h18"
end
