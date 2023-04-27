local g = vim.g
local o = vim.o

-- Random config
o.termguicolors = true
o.number = true
o.numberwidth = 2
o.relativenumber = true
o.cursorline = true
o.expandtab = true
o.cindent = true
o.wrap = true
o.textwidth = 300
o.tabstop = 2
o.shiftwidth = 0
o.softtabstop = -1 -- If negative, shiftwidth value is used
o.noswapfile = true
o.list = true
o.listchars = 'trail:·,nbsp:◇,tab: ,extends:▸,precedes:◂'

-- Clipboard 
o.clipboard = 'unnamedplus'

o.ignorecase = true
o.smartcase = true

-- leader to space
g.mapleader = ' '
g.maplocalleader = ' '

o.splitkeep = 'screen'
o.history = 50

