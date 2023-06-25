require'nvim-treesitter.configs'.setup {
  ensure_installed = {  "lua", "vim", "vimdoc", "html","css","java","bash"},
  sync_install = false,
  auto_install = true,
  ignore_install = { "javascript" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
