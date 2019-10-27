":checkhealt

"===========================================================
" Avoid nested terminal buffers

" nvr
" AUR: neovim-remote

if has('nvim') && executable('nvr')
    let $VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
endif

" Avoid nested terminal buffers END
"===========================================================

"===========================================================
" Clipboard

" xsel
" Command-line program for getting and setting the contents of the X selection.

":help clipboard
"set clipboard+=unnamedplus

"Copy to clipboard
vnoremap <leader>y "+y
nnoremap <leader>y "+y
nnoremap <leader>yy "+yy

"Paste from clipboard
nnoremap <leader>p "+p
vnoremap <leader>p "+p

" Clipboard END
"===========================================================

"===========================================================
" Default Settings

if &term =~ "rxvt-unicode-256color"
    set t_Co=256
    set encoding=utf8
endif

" Never use smartindent
" Use cindent or indentexpr instead
set nosmartindent
set autoindent

set smarttab
set shiftwidth=4
set tabstop=4
set expandtab

" Height Of The Command Bar
set cmdheight=2

" Always Show The Status Line
set laststatus=2

set notitle
set showtabline=1

" Highlight search results
set hlsearch

" Show matching brackets when text indicator is over them
set showmatch

" No annoying sound on errors
set noerrorbells
set visualbell
set t_vb=
set tm=500

" Default Settings END
"===========================================================

"===========================================================
" Word Count Function

" Here begins my automated wordcount addition.
" This combines several ideas from:
" http://stackoverflow.com/questions/114431/fast-word-count-function-in-vim
" source: http://cromwell-intl.com/linux/vim-word-count.html

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
augroup END

" Word Count Function END
"===========================================================

"===========================================================
" Statusline

" Switch to User1 color highlight
set statusline=%1*

set statusline+=\ %F%m%r%h\ %w\ Line:\ %l\ %c

" separator from left to right justified
set statusline+=%=

set statusline+=\ %{WordCount()}\ words,
set statusline+=\ %l/%L\ lines,\ %P " percentage through the file

" Statusline END
"===========================================================

"===========================================================
" Delete Trailing White Space Function

" Delete trailing white space on save, useful for Python and CoffeeScript
" e at the end of the substitute command?
" It simply prevent Vim to display an error message when the pattern is not found in a file.
function! DeleteTrailingWS()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//ge
    call cursor(l, c)
endfunc

" Delete Trailing White Space Function END
"===========================================================

"===========================================================
" On BufferWrite Delete Trailing White Space

"autodelete trailing whitespaces
"autocmd BufWrite *.txt :call DeleteTrailingWS()

" On BufferWrite Delete Trailing White Space END
"===========================================================

"===========================================================
" Custom Key Mappings

" map F12 to toggle on line numbers
noremap <silent> <F12> :set number!<CR>

" Hold Alt key up/down arrow to navigate visually shown lines.
nmap <A-DOWN> gj
nmap <A-UP> gk
imap <A-UP> <ESC>gki
imap <A-DOWN> <ESC>gji

" Custom Key Mappings END
"===========================================================

"===========================================================
" Package Function Helpers

function ShowRuntimePaths()
    echo join(split(&runtimepath, ','), "\n")
endfunction

function ShowPackages()
    for ix in split(&runtimepath, ',')
        if ix =~? '^.*/pack/.*$'
            echo ix
        endif
    endfor
endfunction

function HelpTagsAll()
    silent! helptags ALL
    echo "helptags generated."
endfunction

" Package Function Helpers END
"===========================================================

"===========================================================
" Filespecific Options
filetype plugin indent on

augroup txt_file
    autocmd!
    autocmd BufWrite *.txt call DeleteTrailingWS()
augroup END

augroup python_file
    autocmd!
    autocmd BufRead,BufNewFile  *.py setlocal ts=4 sw=4 expandtab
    autocmd BufWrite *.py call DeleteTrailingWS()
augroup END

augroup html_file
    autocmd!
    autocmd BufRead,BufNewFile  *.html setlocal ts=2 sw=2 expandtab
    "You can set the indent for the first line after <script> and <style>
    "autocmd BufRead,BufNewFile  *.html let g:html_indent_script1="zero"
    "autocmd BufRead,BufNewFile  *.html let g:html_indent_style1="zero"
    autocmd BufWrite *.html call DeleteTrailingWS()
augroup END

augroup css_file
    autocmd!
    autocmd BufRead,BufNewFile  *.css setlocal ts=2 sw=2 expandtab
    autocmd BufWrite *.css call DeleteTrailingWS()
augroup END
augroup javascript_file
    autocmd!
    autocmd BufRead,BufNewFile  *.js setlocal ts=2 sw=2 expandtab
    autocmd BufRead,BufNewFile  *.js setlocal cindent cinoptions+=>j1 cinoptions+=J1
    autocmd BufWrite *.js call DeleteTrailingWS()
augroup END

augroup json_file
    autocmd!
    autocmd BufRead,BufNewFile  *.json setlocal ts=2 sw=2 expandtab
    autocmd BufWrite *.json call DeleteTrailingWS()
augroup END

augroup sql_file
    autocmd!
    autocmd BufRead,BufNewFile  *.sql setlocal ts=4 sw=4 expandtab
augroup END

augroup c_file
    autocmd!
    autocmd BufRead,BufNewFile  *.c,*.h setlocal ts=4 sw=4 expandtab
    autocmd BufRead,BufNewFile  *.c,*.h setlocal cindent cinoptions+=>2 cinoptions+=^-2
    autocmd BufWrite *.c,*.h call DeleteTrailingWS()
augroup END

" Filespecific Options END
"===========================================================

"===========================================================
" Highlight Settings

augroup hi_gui
    " GUI
    autocmd!

    autocmd ColorScheme * highlight SignatureMarkText ctermbg=blue ctermfg=black
    "autocmd ColorScheme * highlight SignColumn ctermbg=blue ctermfg=none

    autocmd ColorScheme * highlight NeoMakeErrorSign ctermfg=red
    autocmd ColorScheme * highlight NeoMakeWarningSign ctermfg=brown
    autocmd ColorScheme * highlight NeoMakeMessageSign ctermfg=blue
    autocmd ColorScheme * highlight NeoMakeInfoSign ctermfg=yellow

    autocmd ColorScheme * highlight SpellBad ctermbg=none ctermfg=red
    autocmd ColorScheme * highlight SpellCap ctermbg=none ctermfg=blue
augroup END

augroup hi_status
    " Status Line
    autocmd!
    autocmd ColorScheme * highlight User1 ctermbg=green guibg=green ctermfg=black guifg=black
augroup END

set background=dark
colorscheme gruvbox

" colorscheme darkblue
" hi Normal cterm=NONE ctermfg=white ctermbg=black gui=NONE guifg=White guibg=grey20

" Highlight Settings END
"===========================================================
