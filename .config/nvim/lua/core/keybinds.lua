local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

 -- nvim tree
map('n','<leader>b',':NvimTreeFindFileToggle<CR>')

-- Quit neovim
map('n', '<C-q>', '<CMD>q<CR>')

-- copy and paste

map('n','<C-c>','"*y',{noremap=true,silent=true})
map('n','<C-v>','"+p',{noremap=true,silent=true})

-- vertical split
map('n','<C-w>l','<C-l>',{ silent = true })
map('n','<C-w>k','<C-k>',{silent = true})
map('n','<C-w>j','<C-j>',{silent = true})
map('n','<C-w>h','<C-h>',{silent = true})

-- map split
map('n','<leader>vs',':vs<CR>')

-- tab nav
map('n','<leader>h',':tabr<CR>')
map('n','<leader>l',':tabl<CR>')
map('n','<C-n>',':tabn<CR>')


-- comment
map('n','<leader>cc',':Comment<CR>')

