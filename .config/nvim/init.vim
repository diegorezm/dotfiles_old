source ~/.config/nvim/config/statusline.vim
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
	let g:netrw_winsize = 25
	let g:netrw_banner = 0
	let g:netrw_localcopydircmd = 'cp -r'
	hi! link netrwMarkFile Search
	let g:vimtex_view_method = 'zathura'

	"	plugin
call plug#begin('~/.config/nvim/plugged')
	"       themes
Plug 'joshdick/onedark.vim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
        "       code
Plug 'sheerun/vim-polyglot'
Plug 'lilydjwg/colorizer'
Plug 'tpope/vim-commentary'
Plug 'lervag/vimtex'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
call plug#end()

"	colors
colorscheme catppuccin-macchiato
let base16colorspace=256
"	keys
let mapleader="\<space>"
let maplocalleader = "\<space>"

"       copy and paste
vnoremap <C-c> "+y
vnoremap <C-p> "+p

" Tab nav
noremap <leader>h :tabr<CR>
noremap <leader>l :tabl<CR>
noremap <C-n> :tabn<CR>


"       vertical split
noremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

map <leader>p :setlocal spell spelllang=pt_br \| let g:completor_auto_trigger = 0 <CR>
map <leader>pd :set nospell \| let g:completor_auto_trigger = 1 <CR>
map <F6> <CR> :!compiler.sh % <CR>
map <leader>vs :vs <CR>
map <leader>cc :Comment<CR>
map <C-s> :w<CR>
map <leader>q :wq! <CR>

" Netrw
map <leader>b :Vexplore<CR>

let g:coq_settings = { 'auto_start': v:true }
