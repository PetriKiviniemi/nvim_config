" C++ helpers

" switch between hpp and cpp
au BufEnter,BufNew *.cpp nnoremap <silent><leader>p :e %<.hpp<CR>
au BufEnter,BufNew *.hpp nnoremap <silent><leader>p :e %<.cpp<CR>

au BufEnter,BufNew *.cpp nnoremap <silent><leader>vp :leftabove vs %<.hpp<CR>
au BufEnter,BufNew *.hpp nnoremap <silent><leader>vp :rightbelow vs %<.cpp<CR>

au BufEnter,BufNew *.cpp nnoremap <silent><leader>xp :leftabove split %<.hpp<CR>
au BufEnter,BufNew *.hpp nnoremap <silent><leader>xp :rightbelow split %<.cpp<CR>

" surround with std::optional
nnoremap <silent> ;cso :execute 's/\(' . expand('<cWORD>') . '\)/std::optional<\1>'<CR>:noh<CR>

" enable history for fzf
let g:fzf_history_dir = '~/.local/share/fzf-history'

" easy-motion
" disable default mappings, turn on case-insensitivity
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1

" faster updates!
set updatetime=100

" no hidden buffers
set hidden&

" automatically read on change
set autoread

" auto-pairs
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'

" easy search
nnoremap ;s :s/

" easy search/replace with current visual selection
xnoremap ;s y:%s/<C-r>"//g<Left><Left>

" language-specific formatters
au FileType cpp set formatprg=clang-format | set equalprg=clang-format

let g:lion_squeeze_spaces = 1

" rainbow parens
let g:rainbow_active = 1

" rust config
let g:rustfmt_autosave = 1

set nocompatible
let c_no_curly_error=1

" fzf in runtimepath
set rtp+=/usr/local/opt/fzf

" Colorscheme
set termguicolors
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='hard'
colorscheme gruvbox
hi LspCxxHlGroupMemberVariable guifg=#83a598

" Syntax highlighting
syntax on

" Position in code
set number
set ruler

" Don't make noise
set visualbell

" default file encoding
set encoding=utf-8

" Line wrap
set wrap

" C-p: FZF find files
nnoremap <silent> <C-p> :Files<CR>

" C-g: FZF ('g'rep)/find in files
nnoremap <silent> <C-g> :Rg<CR>

" Function to set tab width to n spaces
function! SetTab(n)
  let &tabstop=a:n
  let &shiftwidth=a:n
  let &softtabstop=a:n
  set expandtab
  set autoindent
  set smartindent
endfunction

command! -nargs=1 SetTab call SetTab(<f-args>)

set noexpandtab
set autoindent
set smartindent

" Function to trim extra whitespace in whole file
function! Trim()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

command! -nargs=0 Trim call Trim()

set laststatus=2

" Highlight search results
set hlsearch
set incsearch

set t_Co=256

autocmd BufRead,BufNewFile *.c SetTab 4
autocmd BufRead,BufNewFile *.h SetTab 4
autocmd BufRead,BufNewFile *.cpp SetTab 4
autocmd BufRead,BufNewFile *.hpp SetTab 4

" C/C++ indent options: fix extra indentation on function continuation
set cino=(0,W4

" nim config
autocmd BufRead,BufNewFile *.nim  setlocal colorcolumn=80
autocmd BufRead,BufNewFile *.nims setlocal colorcolumn=80
autocmd BufRead,BufNewFile *.nim SetTab 2
autocmd BufRead,BufNewFile *.nims SetTab 2

" ASM == JDH8
augroup jdh8_ft
  au!
  autocmd BufNewFile,BufRead *.asm    set filetype=jdh8
augroup END

" SQL++ == SQL
augroup sqlpp_ft
  au!
  autocmd BufNewFile,BufRead *.sqlp   set syntax=sql
augroup END

" .S == gas
augroup gas_ft
  au!
  autocmd BufNewFile,BufRead *.S      set syntax=gas
augroup END

" .vs = glsl
augroup vs_ft
  au!
  autocmd BufNewFile,BufRead *.vs     set syntax=glsl
augroup END

" .fs = glsl
augroup fs_ft
  au!
  autocmd BufNewFile,BufRead *.fs     set syntax=glsl
augroup END

" .sc = glsl
augroup sc_ft
  au!
  autocmd BufNewFile,BufRead *.sc     set filetype=glsl
augroup END

" JFlex syntax highlighting
augroup jfft
  au BufRead,BufNewFile *.flex,*.jflex    set filetype=jflex
augroup END
au Syntax jflex    so ~/.vim/syntax/jflex.vim


" Map F8 to Tagbar
nmap <F8> :TagbarToggle<CR>

" disable backup files
set nobackup
set nowritebackup

set shortmess+=c

" show syntax group of symbol under cursor
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
