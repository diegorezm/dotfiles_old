local function map(m, k, v)
  vim.keymap.set(m, k, v, { silent = true })
end


local opts = { silent = true, noremap = true }

-- nvim tree
map('n', '<leader>b', ':NvimTreeFindFileToggle<CR>')


-- Quit neovim
map('n', '<C-q>', '<CMD>q<CR>')

-- copy and paste

map({ "n", "v" }, "<C-c>", [["+y]])
map("n", "<C-c>", [["+Y]])

-- vertical split
map('n', '<C-w>l', '<C-l>', opts)
map('n', '<C-w>k', '<C-k>', opts)
map('n', '<C-w>j', '<C-j>', opts)
map('n', '<C-w>h', '<C-h>', opts)

-- map split
map('n', '<leader>vs', ':vs<CR>')

-- tab nav
map('n', '<leader>h', ':tabr<CR>')
map('n', '<leader>l', ':tabl<CR>')
map('n', '<C-n>', ':tabn<CR>')