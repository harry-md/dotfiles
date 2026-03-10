set highlightedyank
let g:highlightedyank_highlight_color = "rgba(160, 160, 160, 155)"
let g:highlightedyank_highlight_duration = "500"
nnoremap Y y$
inoremap <A-n> <C-n>
inoremap <A-p> <C-p>
nnoremap <A-u> <C-u>
nnoremap <A-d> <C-d>
nnoremap <C-j> 10jzz
nnoremap <C-k> 10kzz
vnoremap <C-j> 10j
vnoremap <C-k> 10k
nnoremap O O<esc>
nnoremap <S-h> :bp<CR>
nnoremap <S-l> :bn<CR>
map s <Action>(flash.search)
inoremap <C-s> <esc>:w<CR>
nnoremap <C-s> <esc>:w<CR>
vnoremap <C-s> <esc>:w<CR>
set relativenumber
set number
set tabstop=4
set shiftwidth=4
set expandtab
set ideajoin
set clipboard=unnamedplus
set clipboard+=ideaput
