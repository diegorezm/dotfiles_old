	"       vim-plug
	if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
		echo "Downloading junegunn/vim-plug to manage plugins..."
		silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
		silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
		autocmd VimEnter * PlugInstall
	endif

	"	general conf 
	let b:tex_flavor = 'pdflatex'
	compiler tex
	set splitbelow splitright 
	set nowrap 
	set undodir=~/.config/nvim/undo
	set mouse=a
	set noswapfile 
	set confirm
	set autoindent
	set smartindent 
	set nocindent
	set smartcase
	set autoread 
	set inccommand=split
	filetype plugin indent on
	set wildmenu
	set smarttab 
	set expandtab
	set notermguicolors
	syntax on
	set nu!
	set relativenumber
	set laststatus=2
	set cursorline
	set encoding=UTF-8
	set complete+=kspell
	set completeopt=menuone
	set path+=**
	set colorcolumn=100

	"	plugin
call plug#begin('~/.config/nvim/plugged')
	"       themes
Plug 'gruvbox-community/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'joshdick/onedark.vim'
        "       code
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'lilydjwg/colorizer'
Plug 'tpope/vim-commentary'
" Completion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
call plug#end()

"	colors
colorscheme onedark
set background=dark
let base16colorspace=256

"	keys
let mapleader="\<space>"

"       copy and paste
vnoremap <C-c> "+y
vnoremap <C-p> "+p

"       vertical split
noremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"				change emmet leader key from control to just ,,
imap ,, <C-y>,

map <leader>p :setlocal spell spelllang=pt_br \| let g:completor_auto_trigger = 0 <CR>
map <leader>pd :set nospell \| let g:completor_auto_trigger = 1 <CR>
map <F6> <CR> :!compiler.sh % <CR>
map <leader>vs :vs <CR>
map <leader>cc :Comment<CR>
map <C-s> :w<CR>
map <leader>q :wq! <CR>
map <leader>b :Vexplore<CR>

"       Source
source  ~/.config/nvim/config/plugin.vim
source  ~/.config/nvim/config/statusline.vim 
