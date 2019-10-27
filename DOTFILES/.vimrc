set nocompatible
set ruler
set showcmd
set history=1000
syntax on
set showmatch
set smartindent
"set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set hlsearch
set encoding=utf8
set laststatus=2
set clipboard=unnamedplus
set title
set showtabline=1

" map F12 to toggle on line numbers
noremap <silent> <F12> :set number!<CR>

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" Hold Alt key up/down arrow to navigate visually shown lines.
nmap <A-DOWN> gj
nmap <A-UP> gk
imap <A-UP> <ESC>gki
imap <A-DOWN> <ESC>gji

" No annoying sound on errors
set noerrorbells
set visualbell
set t_vb=
set tm=500

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Here begins my automated wordcount addition.
" This combines several ideas from:
" http://stackoverflow.com/questions/114431/fast-word-count-function-in-vim
" source: http://cromwell-intl.com/linux/vim-word-count.html
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:word_count="<unknown>"
function WordCount()
    return g:word_count
endfunction
function UpdateWordCount()
    let lnum = 1
    let n = 0
    while lnum <= line('$')
        let n = n + len(split(getline(lnum)))
        let lnum = lnum + 1
    endwhile
    let g:word_count = n
endfunction
" Update the count when cursor is idle in command or insert mode.
" Update when idle for 1000 msec (default is 4000 msec).
set updatetime=1000
augroup WordCounter
    au! CursorHold,CursorHoldI * call UpdateWordCount()
augroup ENDi

" Set height of the command bar
set cmdheight=2

" Set the format for the status line
"
" Switch to User1 color highlight
set statusline=%1*
set statusline+=\ %F%m%r%h\ %w\ Line:\ %l\ %c
" separator from left to right justified
set statusline+=%=
set statusline+=\ %{WordCount()}\ words,
" percentage through the file
set statusline+=\ %l/%L\ lines,\ %P

" Delete trailing white space on save, useful for Python and CoffeeScript
func! DeleteTrailingWS()
    " exe "normal mz"
    %s/\s\+$//ge
    " exe "normal `z"
    " exe "normal :delmarks z"
endfunc

"autodelete trailing whitespaces
autocmd BufWrite *.txt :call DeleteTrailingWS()
autocmd BufWrite *.html :call DeleteTrailingWS()
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.css :call DeleteTrailingWS()
