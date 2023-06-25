local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


local plugins = {
  -- Random plugins
    { "catppuccin/nvim", name = "catppuccin" },
    'tpope/vim-commentary',
    'norcalli/nvim-colorizer.lua',

    -- Completion
     {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
        }
    },


    -- nvim tree
    'nvim-tree/nvim-tree.lua',
    'nvim-tree/nvim-web-devicons',

    {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
-- or                              , branch = '0.1.1',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },

    'nvim-treesitter/nvim-treesitter',

    { "lukas-reineke/indent-blankline.nvim" },

  {
       'barrett-ruth/live-server.nvim',
       build = 'yarn global add live-server',
       config = true
  },

    -- autopair
    {
    "windwp/nvim-autopairs",
     config = function() require("nvim-autopairs").setup {} end
  }


}


local opts = {}


require("lazy").setup(plugins, opts)
