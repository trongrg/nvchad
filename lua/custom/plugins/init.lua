return {
  ["rking/ag.vim"] = {},
  ["skwp/greplace.vim"] = {},
  ["ludovicchabant/vim-gutentags"] = {},
  ["editorconfig/editorconfig-vim"] = {},
  ["tpope/vim-fugitive"] = {}, ["tpope/vim-git"] = {},
  ["mfussenegger/nvim-dap"] = {},
  ["rcarriga/nvim-dap-ui"] = {},
  ["jose-elias-alvarez/typescript.nvim"] = {},
  ["williamboman/mason.nvim"] = {
    override_options = {
      ensure_installed = { "typescript-language-server", "lua-language-server", "angular-language-server", "intelephense", "json-lsp" }
    }
  },
  ["kevinhwang91/nvim-ufo"] = {
    requires = "kevinhwang91/promise-async",
  },
  ["m-demare/hlargs.nvim"] = {
    requires = "nvim-treesitter/nvim-treesitter"
  },
  ["nvim-telescope/telescope-fzf-native.nvim"] = {
    run = "make",
  },
  ["nvim-telescope/telescope.nvim"] = {
    override_options = function()
      local telescope_actions = require('telescope.actions')
      return {
        defaults = {
          mappings = {
            i = { ["<esc>"] = telescope_actions.close },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
          }
        },
        extensions_list = { "themes", "terms", "fzf" },
      }
    end,
  },
  ["jose-elias-alvarez/null-ls.nvim"] = {},
  ["lvimuser/lsp-inlayhints.nvim"] = {
    config = function()
      require('lsp-inlayhints').setup()
    end
  },
  ["glepnir/lspsaga.nvim"] = {
    branch = "main",
  },
}
