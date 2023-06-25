require("core.settings")
require("core.keybinds")
require("core.plugins")
require("core.plugin_config.completion")
require("core.plugin_config.lsp_config")
require("core.plugin_config.nvim_tree")
require("core.plugin_config.telescope")
require("core.plugin_config.colorizer")
require("core.plugin_config.treesitter")
require("core.plugin_config.ident_lines")
require("core.plugin_config.live_server")
vim.cmd [[source ~/.config/nvim/lua/core/statusline.vim]]
vim.cmd [[source ~/.config/nvim/lua/core/tex.vim]]
vim.cmd [[colorscheme catppuccin-macchiato]]
vim.cmd [[hi! Normal ctermbg=NONE guibg=NONE]]
