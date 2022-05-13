set number
set mouse=a
syntax enable
set numberwidth=1
set showcmd
set ruler
set encoding=utf-8
set sw=2
set relativenumber
set laststatus=2
set noshowmode
set splitright

let mapleader=" "

"-----------------------------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

" Themes
Plug 'sainnhe/gruvbox-material'
Plug 'shinchu/lightline-gruvbox.vim'

" IDE
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-signify'
Plug 'yggdroot/indentline'
Plug 'scrooloose/nerdcommenter'

" Syntax 
Plug 'sheerun/vim-polyglot'
      
" Status bar    
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'
            
" Typing
Plug 'jiangmiao/auto-pairs' " Autocomplete () [] {}
Plug 'alvan/vim-closetag' " Autocomplete html or React tags
Plug 'tpope/vim-surround' " Wrap a variable with 'cs'
Plug 'mattn/emmet-vim' " Emmet autocomplete for html

" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

" Git
Plug 'tpope/vim-fugitive'

" Tests
Plug 'tyewang/vimux-jest-test'
Plug 'janko-m/vim-test'

call plug#end()

"-----------------------------------------------------------------------------------------------

"Gruvbox config
set background=dark
let g:gruvbox_material_background='medium'
colorscheme gruvbox-material

" Git
nnoremap <Leader>G :G<cr>

"FZF config
map <Leader>f :Files<CR>

"Easymotion config
nmap <Leader>s <Plug>(easymotion-s2)

" Emmet config
let g:user_emmet_leader_key=','

"Nerdtree config
let NERDTreeQuitOnOpen=1
nmap <Leader>nj :NERDTreeFind<CR>

"Signify config
set updatetime=100

" LSP config (declare autocomplete for many languages)
lua << EOF
require('lspconfig').tsserver.setup()
EOF

"Lightline config
let g:lightline = {
      \'active': {
      \  'left': [['mode', 'paste'], [], ['relativepath', 'modified']],
      \  'right': [['kitestatus'], ['filetype', 'percent', 'lineinfo'], ['gitbranch']]
      \  },
      \'inactive': {
      \  'left': [['inactive'], ['relativepath']],
      \  'right': [['bufnum']]
      \  },
      \'component': {
      \  'bufnum': '%n',
      \  'inactive': 'inactive'
      \  },
      \'component_function': {
      \  'gitbranch': 'fugitive#head',
      \  'kitestatus': 'kite#statusline'
      \   },
      \'colorscheme': 'gruvbox',
      \'subseparator': {
      \  'left': '',
      \  'right': ''
      \ }
      \}
let g:lightline.colorscheme = 'gruvbox'

"VimuxJestTest
nnoremap <Leader>t :TestNearest<CR>
nnoremap <Leader>T :TestFile<CR>
nnoremap <Leader>TT :TestSuite<CR>

"VimuxTmuxNavigator (Split resize)
nnoremap <Leader>> 10<C-w>>
nnoremap <Leader>< 10<C-w><

"My config
nmap <A-j> 10<C-E>
nmap <A-k> 10<C-Y>
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>, $a;<Esc>
inoremap mm <Esc>
inoremap <A-h> <Left>
inoremap <A-j> <Down>
inoremap <A-k> <Up>
inoremap <A-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>
nmap <Leader>ob :Buffer<CR>

"Coc config
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
