" general settings

syntax on
set number
set hidden
set nocompatible

set expandtab
set tabstop=2
set shiftwidth=0
set autoindent
set smartindent

set listchars+=space:.
set list

set nobackup
set noswapfile

" folds
set foldmethod=syntax
set foldlevelstart=20

" splits
set splitbelow
set splitright

nnoremap <leader>\| :vsplit<CR>
nnoremap <leader>- :split<CR>

nnoremap <A-L> <C-W><C-L>
nnoremap <A-H> <C-W><C-H>
nnoremap <A-K> <C-W><C-K>
nnoremap <A-J> <c-W><C-J>

" buffer movement/control
nnoremap <C-h> :bprevious<CR>
nnoremap <C-l> :bnext<CR>
nnoremap <C-w> :bdelete<CR>
nnoremap <C-A-w> :bdelete!<CR>

set noshowmode

" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'rakr/vim-one'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdcommenter'
Plug 'matze/vim-move'
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/vim-cursorword'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'

Plug 'posva/vim-vue'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx', {'for': 'javascript.jsx'}

Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }

Plug 'w0rp/ale'

Plug 'leafgarland/typescript-vim', {'for': 'typescript'}
Plug 'peitalin/vim-jsx-typescript'

Plug 'tarnas14/workflowish', {'for': 'workflowish'}

Plug 'itchyny/calendar.vim'
call plug#end()

" Turn off linewise keys. Normally, the `j' and `k' keys move the cursor down one entire line. with
" line wrapping on, this can cause the cursor to actually skip a few lines on the screen because
" it's moving from line N to line N+1 in the file. I want this to act more visually -- I want `down'
" to mean the next line on the screen
nmap j gj
nmap k gk

colorscheme one
set background=dark

" COLOURS

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif

" PLUGIN easymotion/vim-easymotion
" bidirectional character search
map <leader>f <Plug>(easymotion-bd-f)

" lightline
let g:lightline = {
      \ 'colorscheme': 'one'
      \ }

" FZF
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>, fzf#vim#with_preview('right:50%'), <bang>0)
map <C-p> :Files<CR>
map <C-space> :Buffers<CR>
map <leader>/ :Ag<CR>
map <leader>l :Blines<CR>
let FZF_DEFAULT_COMMAND = 'ag -g ""'

" PLUGIN scrooloose/nerdcommenter
"
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" DONT EVEN GET ME STARTED
" apparently command-line vim gets <C-_> when you press ctrl+/
noremap <C-_> :call NERDComment(0,"toggle")<CR>
noremap <C-/> :call NERDComment(0,"toggle")<CR>

" PLUGIN matze/vim-move

let g:move_key_modifier = 'C-A'

" PLUGIN w0rp/ale

let g:ale_linters = {
\  'javascript': ['flow', 'eslint'],
\  'typescript': ['tslint']
\}
highlight clear ALEWarningSign " otherwise uses error bg color (typically red)
let g:ale_statusline_format = ['X %d', '? %d', '']
" %linter% is the name of the linter that provided the message
" %s is the error or warning message
let g:ale_echo_msg_format = '%linter% says %s'
" Map keys to navigate between lines with errors and warnings.
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>

" PLUG Shougo/deoplete
" let g:deoplete#enable_at_startup=1
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" PLUG peitalin/vim-jsx-typescript
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.jsx

" PLUG itchyny/calendar.vim
let g:calendar_google_calendar = 1
command! Cal Calendar -view=week
command! Calm Calendar -view=month

" PLUG tpope/vim-fugitive
map <leader>gs :Gstatus<CR>
map <leader>gf :Git! diff<CR>
map <leader>gt :Git! diff --staged<CR>
map <leader>gc :Gcommit<CR>
map <leader>gl :Commits<CR>
map <leader>gp :Gpush<CR>

" disable arrows
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

command! -nargs=1 R :silent !tmux send-keys -t right <f-args> <C-m>
