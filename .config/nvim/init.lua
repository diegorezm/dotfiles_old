require("core.settings")
require("core.keybinds")
require("core.plugins")
require("core.plugin_config.completion")
require("core.plugin_config.lsp_config")
require("core.plugin_config.nvim_tree")
vim.cmd [[ source ~/.config/nvim/lua/core/statusline.vim ]]

vim.cmd [[colorscheme catppuccin-macchiato]]
