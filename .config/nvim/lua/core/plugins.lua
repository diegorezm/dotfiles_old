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
    'sheerun/vim-polyglot',
    'lilydjwg/colorizer',
    'tpope/vim-commentary',
    -- Completion
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets',
    'neovim/nvim-lspconfig',
    'williamboman/mason-lspconfig.nvim',
    'saadparwaiz1/cmp_luasnip',
    "L3MON4D3/LuaSnip",

    -- nvim tree
    'nvim-tree/nvim-tree.lua',
    'nvim-tree/nvim-web-devicons',

}


local opts = {}


require("lazy").setup(plugins, opts)
