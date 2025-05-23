call plug#begin(stdpath('data') . '/plugged')
    Plug 'neoclide/coc.nvim', {'branch': 'release'} " lsp
    Plug 'numToStr/Comment.nvim' " gc for comments
    Plug 'sonph/onehalf', { 'rtp' : 'vim' } " theme
    Plug 'itchyny/vim-gitbranch' " git statusline
    Plug 'kshenoy/vim-signature' " marks
    Plug 'ap/vim-buftabline' " tabs are stupid make it buffers instead
    Plug 'preservim/nerdtree' " filelist with C-n
    Plug 'folke/tokyonight.nvim' " dark mode theme
    Plug 'chaoren/vim-wordmotion' " make underscores and camelCase word boundaries
    Plug 'RRethy/vim-illuminate' " highlight same word as hover
    Plug 'tpope/vim-surround', 
    Plug 'vim-python/python-syntax', 
    Plug 'yaegassy/coc-ruff', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neovim/nvim-lspconfig'
    Plug 'ap/vim-css-color'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'stevearc/aerial.nvim'
call plug#end()

let $HOST = split(system('hostname'), '\.')[0]  " Get only the first part before '.'
let &titlestring = $HOST . '  ' . expand('%:t')
set title

luafile $XDG_CONFIG_HOME/nvim/lua.lua

lua require('Comment').setup()

let g:python_highlight_all = 1

lua require('open_file_at_line')

let NERDTreeQuitOnOpen=1

let g:buftabline_show=1
let g:pyindent_open_paren=shiftwidth()
let g:netrw_banner=0

" indents
set smartindent
set expandtab
set breakindent
set shiftwidth=4
set tabstop=4
" -------- visuals ----------
set relativenumber
set number
set scrolloff=999
set cursorline
set list
set listchars=lead:·,trail:·,tab:>·

" beautiful dark theme
colorscheme tokyonight

set spelllang=nb,en

hi Search guibg=#40334a
hi Search guifg=#8888FF

autocmd BufWritePost *.py silent! execute '!ruff format % && ruff check --select I --fix % && ruff check %'
" folds
set foldlevel=99


" statusline stuff
set statusline=
set statusline+=\ %{gitbranch#name()}\ 
set statusline+=%#LineNr#
set statusline+=%1*\ %<%F\ %m%r%h%w\ 
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ \[%{&fileencoding?&fileencoding:&encoding}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 
set ignorecase
set smartcase
" end statusline

" do an operator on every line in the file (daG, yaG, =aG)
xnoremap aG ggoG
onoremap aG :normal VaG<cr>

" bogo operator on functions by using folds
vnoremap af :<C-U>silent! normal! [zkVj]z<CR>
onoremap af :normal Vaf<CR>

" move lines
nnoremap <A-j> :m .+1<CR>
nnoremap <A-k> :m .-2<CR>
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

nnoremap <C-n> :NvimTreeToggle<CR>

" -------- leader kommandoer -----------
let mapleader=" "

" clipboard
nnoremap <leader>p "+p
nnoremap <leader>y "+y
vnoremap <leader>y "+y


nnoremap gp :put<CR>

" toggle wordmotion

let g:wordmotion_nomap = 1
let g:wordmotion_on = 0

nnoremap <buffer> <nowait> <leader>w :call WordMotionToggle()<cr>


nnoremap <silent> <leader>o :lua require('open_file_at_line').open_file_at_line()<CR>

function! WordMotionToggle()
    if g:wordmotion_on
        echo "WordMotion off"
        let g:wordmotion_on = 0
        unmap w
        unmap b
        unmap e
        unmap iw
        unmap aw

    else
        echo "WordMotion on"
        let g:wordmotion_nomap = 0
        let g:wordmotion_on = 1

        call wordmotion#reload()


    endif
endfunction

" remove highlight for last searched
nnoremap <leader><Backspace> :noh<CR>
" nnoremap <Enter> :!touch /tmp/tmp.pw.socket2<CR><CR>
nnoremap <Tab> :NvimTreeToggle<CR>


function! ProseStart()
  setlocal linebreak
  nnoremap <buffer> j gj
  nnoremap <buffer> k gk
endfunction

function! ProseStop()
  setlocal nolinebreak
  unmap <buffer> j
  unmap <buffer> k
endfunction

" schmoovement
noremap J :keepjumps normal! }<CR>
noremap K :keepjumps normal! {<CR>

xnoremap J :<C-u>keepjumps normal! gv}<CR>
xnoremap K :<C-u>keepjumps normal! gv{<CR>

nnoremap } J


" S is cc so pointless. S is for save
nnoremap S :w<CR>
" M is for middle of screen but who cares. M for Make this damn file close
nnoremap M :q<CR>
" U is undo line which is stupid
nnoremap U <C-r>


" move mellom tabs
nnoremap H :bprev<CR>
nnoremap L :bnext<CR>
" aapne tabs og splits
nnoremap <leader>t :tabnew
nnoremap <leader>v :vsplit
nnoremap <leader>g :lua require('telescope.builtin').find_files()<CR>
" replace alt som ble soekt paa sist
nnoremap <leader>s :%s///g<Left><Left>
vnoremap <leader>s :s///g<Left><Left>
" bedre shift yank
map Y y$
" format python
" make print(x) into print(f"{x=}")
nnoremap <leader>f 0f(af"{<ESC>$i=}"<ESC>
nnoremap <leader>m :delmarks!<CR>
nnoremap <leader>z :!zathura %<.pdf & disown<CR><CR>
nnoremap <silent> <leader>d :bp<BAR>bd#<CR>
nnoremap <leader>c :colorscheme 

nnoremap <leader>h :call SynStack()<CR>

nnoremap <Tab> :NERDTreeToggle<CR>

" go to the position I was when last editing the file
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif


" keep undo history even after closing file
set undodir=$HOME/.config/nvim/undo_dir
set undofile


function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc


" ------------ COC ---------------- "
" random things that need to be set for coc to work maybe
set hidden
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
set signcolumn=number
set signcolumn=yes

" tab completion
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" part of tab completion
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col-1] =~# '\s'
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)

" Use ? to show documentation in preview window.
nnoremap <silent> ? :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
" ---------- end COC -------------


autocmd FileType python command! Main execute "normal! idef main():<CR><CR><BS>if __name__ == '__main__':<CR>main()<ESC>gg$"
autocmd FileType c command! Main execute "normal! i#include <stdlib.h><CR><CR>void main() {<CR>}<ESC>k$"
""""""""""""" Her maa de legges til conditional execution --------------

" build stuff

" ------- python --------
autocmd FileType python map <buffer> <C-b> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <C-b> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
" pyright sucks at diagnostics

autocmd FileType python set foldmethod=indent

nnoremap <leader>l :call CocAction('diagnosticToggle')<CR>


" ------- latex ---------
"

hi MatchParen guifg=#f2b252 gui=none


" hi texDelim guifg=wheat
autocmd FileType text,markdown,vimwiki,tex call ProseStart()

function! TexCompile()
  " Save the current file
    write
    execute '!pdflatex ' . expand('%')
    silent execute '!biber main'
    silent execute '!pdflatex ' . expand('%')
endfunction

function! ToggleSpellCheck()
  if &spell
    set nospell
  else
    set spell
  endif
endfunction

function! GrepSearchWord()
  let l:search_term = input('Enter search term: ')
  execute 'term grep --binary-files=without-match --exclude-dir={.venv,.ruff_cache,__pycache__} -Rn . -e ' . shellescape(l:search_term)
endfunction

nnoremap <leader>/ :call GrepSearchWord()<CR>


autocmd FileType tex imap <buffer> <C-b> <esc>:silent !latexmk -pdf<CR>
autocmd FileType tex map <buffer> <C-b> <esc>:silent !latexmk -pdf<CR>
autocmd FileType tex map <buffer> <leader>l :w<CR>:exec '!pdflatex %'<CR>

autocmd FileType tex set spell
autocmd FileType tex set conceallevel=0
autocmd FileType tex nnoremap <leader>b :!bibtex %<<CR>
autocmd FileType tex nnoremap <leader>v :!biber %<<CR>

" --------- C -----------
autocmd FileType c map <buffer> <C-b> :w<CR>:!gcc -g -Wall -Wextra -std=gnu11 % -o %< && ./%<<CR>
autocmd FileType c imap <buffer> <C-b> <esc> :w<CR>:!gcc -g -Wall -Wextra -std=gnu11 % -o %< && ./%<<CR>

" --------- C++ ---------
autocmd FileType cpp map <buffer> <C-b> :w<CR>:!g++ % && ./a.out<CR>
autocmd FileType cpp imap <buffer> <C-b> <esc> :w<CR>:!g++ % -o %< && ./%<<CR>

" -------- Java ---------
autocmd FileType java map <buffer> <C-b> :w<CR>:exec '!javac *.java && java %<'<CR>
autocmd FileType java imap <buffer> <C-b> <esc> :w<CR>:!javac *.java && java %<<CR>

" -------- VHDL ---------
autocmd FileType vhdl set expandtab
autocmd FileType vhdl set shiftwidth=2

" -------- shell --------
autocmd FileType sh map <buffer> <C-b> :w<CR>:!sh %<CR>
autocmd FileType sh imap <buffer> <C-b> <esc> :w<CR>:!sh %<CR>

" -------- lua --------
autocmd FileType lua map <buffer> <C-b> :w<CR>:!lua %<CR>
autocmd FileType lua imap <buffer> <C-b> <esc> :w<CR>:!lua %<CR>

" --------- R -----------
autocmd FileType r map <buffer> <C-b> :w<CR>:!Rscript %<CR>
autocmd FileType r imap <buffer> <C-b> <esc> :w<CR>:!Rscript %<CR>
autocmd FileType r set shiftwidth=2
autocmd FileType r nnoremap <leader>r {opng("temp")<esc>}Odev.off()<CR>system("xdg-open temp")<esc>


" ------ markdown --------

autocmd FileType markdown map <buffer> <C-b> :w<CR>:exec '!pandoc % --standalone --output .%<.html'<CR>
autocmd FileType markdown map <buffer> <leader>z :exec '!firefox .%<.html'<CR>
autocmd FileType tex imap <buffer> <C-b> <esc>:w<CR>:exec '!pandoc % -o %<.pdf &'<CR><CR>:echo "Building in background..."<CR>



" Remote files
autocmd BufRead scp://* set cmdheight=2 " this is to stop stupid confirmation message

" dont show buffers in vimwiki because there are so many
" autocmd FileType vimwiki let g:buftabline_show=0


