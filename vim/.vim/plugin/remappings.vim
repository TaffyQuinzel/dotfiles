" save file with sudo permissions
cmap w!! %w !sudo tee %

" don't use shift as much
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" leader is <Space> and 'comma' not \ (because mapleader is not working)
map , <leader>
map <Space> <leader>
