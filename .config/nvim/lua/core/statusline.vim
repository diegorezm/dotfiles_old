set laststatus=2 

hi statusline guibg=green

set statusline+=%#RedrawDebugNormal#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}
set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''}

set statusline+=%#CocListLine#
set statusline+=%=
set statusline+=%h%m%r
set statusline+=%#CocListBgBlack#
set statusline+=\<<\%f\>>\%*

