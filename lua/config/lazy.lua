local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

local plugins = {
   {
	  'nvim-telescope/telescope.nvim', version = '*',
	  dependencies = { {'nvim-lua/plenary.nvim'} },
    config = function()
      local telescope = require('telescope')
      local previewers = require('telescope.previewers')

    telescope.setup({
      defaults = {
 buffer_previewer_maker = function(filepath, bufnr, opts)
          opts = opts or {}
          local xxd_output = vim.fn.system({ 'xxd', '-l', '512', filepath })
          vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, vim.split(xxd_output, '\n'))
        end,
      },
    })
  end,
  },

  {
	  'artanikin/vim-synthwave84',
	  config = function ()
		  vim.cmd('colorscheme synthwave84')
	  end
  },

 {
    "bjarneo/aether.nvim",
    branch = "v2",
    name = "aether",
    config = function()
        require("aether").setup({
            transparent = false,
            colors = {
                bg = "#1c1e26",
                bg_dark = "#1c1e26",
                bg_highlight = "#6c6f93",
                fg = "#fadad1",
                fg_dark = "#fadad1",
                comment = "#6c6f93",
                red = "#e95678",
                orange = "#ec6a88",
                yellow = "#fab795",
                green = "#29d398",
                cyan = "#59e3e3",
                blue = "#26bbd9",
                purple = "#ee64ac",
                magenta = "#f075b5",
            },
        })
        vim.cmd.colorscheme("aether")
    end
},


  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
  'ThePrimeagen/harpoon',
  'mbbill/undotree',
  'tpope/vim-fugitive',
  'jose-elias-alvarez/null-ls.nvim',
  'MunifTanjim/prettier.nvim',
  'olrtg/nvim-emmet',
  'brenoprata10/nvim-highlight-colors',
  'nvim-mini/mini.icons',

  -- lsp configuration
  'neovim/nvim-lspconfig',
  'williamboman/mason.nvim',       -- LSP installer
  'williamboman/mason-lspconfig.nvim', --bridge Mason with lspconfig

  -- autocompletion
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'saadparwaiz1/cmp_luasnip',
  'L3MON4D3/LuaSnip',
  'rafamadriz/friendly-snippets',

}

-- Setup lazy.nvim
require("lazy").setup({
  spec = plugins,
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
