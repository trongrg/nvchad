return {
  ["rking/ag.vim"] = {},
  ["skwp/greplace.vim"] = {},
  ["ludovicchabant/vim-gutentags"] = {},
  ["editorconfig/editorconfig-vim"] = {},
  ["tpope/vim-fugitive"] = {},
  ["tpope/vim-git"] = {},
  ["mfussenegger/nvim-dap"] = {},
  ["rcarriga/nvim-dap-ui"] = {},
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
}
