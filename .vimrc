syntax on
set showmatch      " Show matching brackets
set nocompatible   " Don't emulate vi's limitations
filetype plugin indent on " Enable filetype-specific indenting and plugins (andrea@)

set smarttab
set shiftwidth=2
set smartindent
set noexpandtab
set textwidth=0
set modeline

"Load matchit (% to bounce from do to end, etc.)
runtime! macros/matchit.vim
   
set background=dark
colorscheme solarized

"set incsearch

set title                        " Set a title on the terminal
set laststatus=2                 " Always display the status line
set shortmess=atI                " Enable short messages (press a key is annoying)
set statusline=%r%t%m\ \Buffer:\ %n\ %=Line\ %l/%L\ \ Col:\ %c\ (%p%%)

"per filetype configuration (andrea@)
augroup myfiletypes
 "clear old autocmds in group
 autocmd!
 autocmd FileType ruby,eruby,yaml set list | set list listchars=trail:. ai sw=2 sts=2 et
 autocmd FileType js set list | set list listchars=trail:. ai sw=2 sts=2 et
 "       set omnifunc=rubycomplete#Complete
 "       let g:rubycomplete_buffer_loading = 1
 "       let g:rubycomplete_rails = 1
 "       let g:rubycomplete_classes_in_global = 1
 autocmd FileType tcl set is tw=0 si ai sta sw=4 ts=4 | set list | set list listchars=tab:>.,trail:.
 autocmd FileType java set ai sw=4 sts=4 et
 autocmd FileType tex set spell spelllang=en
 autocmd FileType tex syntax spell toplevel
augroup END
