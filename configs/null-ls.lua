local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  b.formatting.phpcbf.with {
    command = "vendor/bin/phpcbf",
    args = { "-" },
    condition = function(utils)
      return utils.root_has_file "vendor/bin/phpcbf"
        or utils.root_has_file "phpcs.xml"
        or utils.root_has_file "phpcs.xml.dist"
    end,
  },
  b.formatting.phpcsfixer.with {
    command = "vendor/bin/php-cs-fixer",
    condition = function(utils)
      return utils.root_has_file "vendor/bin/php-cs-fixer"
        or utils.root_has_file ".php_cs"
        or utils.root_has_file ".php_cs.dist"
        or utils.root_has_file ".php-cs-fixer.php"
        or utils.root_has_file ".php-cs-fixer.dist.php"
    end,
  },
  b.diagnostics.phpstan.with {
    command = "vendor/bin/phpstan",
    extra_args = { "--memory-limit=-1" },
    condition = function(utils)
      return utils.root_has_file "phpstan.neon" or utils.root_has_file "phpstan.neon.dist"
    end,
  },
  b.diagnostics.psalm.with {
    command = "vendor/bin/psalm",
    extra_args = { "--threads=4" },
    condition = function(utils)
      return utils.root_has_file "psalm.xml" or utils.root_has_file "psalm.xml.dist"
    end,
  },

}

require("mason").setup()
require("mason-null-ls").setup({
  ensure_installed = {
    'phpcs', 'phpstan', 'phpmd'
    -- Opt to list sources here, when available in mason.
  },
  automatic_installation = true,
});

null_ls.setup {
  debug = false,
  sources = sources,
}
