-- Setup installer & lsp configs
local mason_ok, _ = pcall(require, 'mason')

if not mason_ok then
  return
end

require "plugins.configs.mason"

local M = require "plugins.configs.lspconfig"

local lspconfig = require('lspconfig')
local util = require 'lspconfig.util'

-- Order matters
local typescript_ok, typescript = pcall(require, 'typescript')

local coq = require("coq")

-- It enables tsserver automatically so no need to call lspconfig.tsserver.setup
if typescript_ok then
  typescript.setup({
    disable_commands = false, -- prevent the plugin from creating Vim commands
    debug = false, -- enable debug logging for commands
    -- LSP Config options
    server = {
      root_dir = function(fname)
        return util.root_pattern 'nx.json'(fname)
          or util.root_pattern 'tsconfig.json'(fname)
          or util.root_pattern('package.json', 'jsconfig.json', '.git')(fname)
      end,
      on_attach = M.on_attach,
      capabilities = M.capabilities,
      handlers = require('custom.lsp.servers.tsserver').handlers,
      settings = require('custom.lsp.servers.tsserver').settings,
    }
  })
end

lspconfig.cssls.setup(coq.lsp_ensure_capabilities({
  capabilities = M.capabilities,
  on_attach = M.on_attach,
  settings = require('custom.lsp.servers.cssls').settings,
}))

lspconfig.eslint.setup(coq.lsp_ensure_capabilities({
  capabilities = M.capabilities,
  on_attach = M.on_attach,
  settings = require('custom.lsp.servers.eslint').settings,
}))

lspconfig.jsonls.setup(coq.lsp_ensure_capabilities({
  capabilities = M.capabilities,
  on_attach = M.on_attach,
  settings = require('custom.lsp.servers.jsonls').settings,
}))

lspconfig.vuels.setup(coq.lsp_ensure_capabilities({
  filetypes = require('custom.lsp.servers.vuels').filetypes,
  init_options = require('custom.lsp.servers.vuels').init_options,
  capabilities = M.capabilities,
  on_attach = M.on_attach,
}))

for _, server in ipairs { "bashls", "emmet_ls", "graphql", "html", "volar", "prismals" } do
  lspconfig[server].setup(coq.lsp_ensure_capabilities({
    on_attach = M.on_attach,
    capabilities = M.capabilities,
  }))
end

vim.g.coq_settings = {
  keymap = {
    jump_to_mark = "<C-Tab>",
  }
}

vim.cmd("COQnow --shut-up")
