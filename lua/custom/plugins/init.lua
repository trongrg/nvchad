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
    end,
  },
  ["glepnir/lspsaga.nvim"] = {
    branch = "main",
  },
  ["hrsh7th/cmp-nvim-lua"] = false,
  ["hrsh7th/cmp-nvim-lsp"] = false,
  ["hrsh7th/cmp-buffer"] = false,
  ["hrsh7th/cmp-path"] = false,
  ["saadparwaiz1/cmp_luasnip"] = false,
  ["hrsh7th/nvim-cmp"] = false,
  ["L3MON4D3/LuaSnip"] = {
    override_options = {
      after = "ag.vim",
    },
  },
  ["rafamadriz/friendly-snippets"] = {
    override_options = {
      module = { },
    },
  },
  ["windwp/nvim-autopairs"] = {
    override_options = {
      after = "ag.vim",
    },
  },
  ["ms-jpq/coq_nvim"] = {
    branch = "coq",
    cmd = { "COQnow" },
    run = ":COQnow --shut-up",
    setup = function()
      require("core.lazy_load").on_file_open "coq_nvim"
    end,
  },
  ["ms-jpq/coq.artifacts"] = {
    branch = "artifacts"
  },
}
