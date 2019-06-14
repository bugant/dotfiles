set nocompatible
filetype off
let &runtimepath.=',~/.vim/bundle/ale'
filetype plugin on
let g:ale_linters = {
\   'python': ['pyls'],
\   'markdown': ['mdl'],
\}
let g:ale_fixers = {
\   'elixir': 'mix_format',
\   'python': ['autopep8'],
\}

" \   'python': ['flake8', 'mypy'],

set backupdir=~/.vim/.backup//

set backspace=indent,eol,start
syntax on
set showmatch      " Show matching brackets
set nocompatible   " Don't emulate vi's limitations
filetype indent on
" filetype plugin indent on " Enable filetype-specific indenting and plugins (andrea@)

set smarttab
set shiftwidth=2
set smartindent
set expandtab
set textwidth=0
set modeline
set hlsearch

"Load matchit (% to bounce from do to end, etc.)
runtime! macros/matchit.vim

" monokai
" set background=dark
" colorscheme monokai
" set t_Co=256  " vim-monokai now only support 256 colours in terminal.

" solarized color scheme
" set background=dark
" colorscheme solarized
" highlight Normal ctermbg=NONE

" toothpaste color scheme
colorscheme toothpaste
" highlight Normal ctermbg=NONE

" set background=dark
" colorscheme gruvbox

"set incsearch

set title                        " Set a title on the terminal
set laststatus=2                 " Always display the status line
set shortmess=atI                " Enable short messages (press a key is annoying)
set statusline=%r%t%m\ \Buffer:\ %n\ %=Line\ %l/%L\ \ Col:\ %c\ (%p%%)

" execute pathogen#infect()

"per filetype configuration (andrea@)
augroup myfiletypes
 "clear old autocmds in group
 autocmd!
 autocmd FileType ruby,eruby,yaml,sls set list | set list listchars=trail:. ai sw=2 sts=2 et
 " autocmd FileType python set list | set list listchars=trail:. ai sw=4 sts=4 et | let g:PyFlakeMaxLineLength = 119 | let g:PyFlakeOnWrite = 1
 autocmd FileType python set list | set list listchars=trail:. ai sw=4 sts=4 et
 " autocmd FileType js set list | set list listchars=trail:. ai sw=2 sts=2 et
 autocmd FileType javascript set list! | set expandtab | set smartindent | set list listchars=trail:. ai sw=2 sts=2 et
  
 autocmd FileType hbs ai sw=2 sts=2 et set list! | set expandtab | set list listchars=trail:. | set ft=html syntax=handlebars | set spell spelllang=en | syntax spell toplevel
 "       set omnifunc=rubycomplete#Complete
 "       let g:rubycomplete_buffer_loading = 1
 "       let g:rubycomplete_rails = 1
 "       let g:rubycomplete_classes_in_global = 1
 autocmd FileType tcl set is tw=0 si ai sta sw=4 ts=4 | set list | set list listchars=tab:>.,trail:.
 autocmd FileType java set ai sw=4 sts=4 et
 autocmd FileType cs set ai sw=4 sts=4 et
 autocmd FileType tex,markdown,txt set spell spelllang=en
 autocmd FileType tex,markdown,txt syntax spell toplevel
augroup END

"Ale short-cuts
nnoremap <c-]> :ALEGoToDefinitionInVSplit<cr>
nnoremap <C-\> :ALEFindReferences<CR>
nnoremap <c-h> :ALEHover<CR>
nnoremap <Leader>f :ALEFix<CR>
nnoremap <c-l> :ElixirLsCompile<CR>

" hbs
au BufRead,BufNewFile *.handlebars,*.hbs set ft=html syntax=handlebars

" python
au FileType python map <silent> <F5> oimport pdb; pdb.set_trace()<esc>

" js
au FileType javascript map <silent> <F5> odebugger;<esc>

" rb
au FileType ruby map <silent> <F5> obyebug<esc>

" elixir
au FileType elixir set list | set list listchars=trail:. et | map <silent> <F5> orequire IEx; IEx.pry()<esc>

" go
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4

call plug#begin('~/.vim/plugged')
Plug 'GrzegorzKozub/vim-elixirls', { 'do': ':ElixirLsCompileSync' }
call plug#end()

let s:user_dir = has('win32') ? expand('~/vimfiles/') : expand('~/.vim/')
let g:ale_elixir_elixir_ls_release = s:user_dir . 'plugged/vim-elixirls/elixir-ls/release'
let g:ale_elixir_elixir_ls_config = { 'elixirLS': { 'dialyzerEnabled': v:false } }
let g:ale_linters.elixir = [ 'credo', 'elixir-ls' ]
let g:ale_c_parse_makefile = 1

" " Syntastic settings
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" 
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
