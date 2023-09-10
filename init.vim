set number
set mouse=a
syntax enable
set numberwidth=1
set showcmd
set ruler
set encoding=UTF-8
set sw=2
set relativenumber
set laststatus=2
set noshowmode
set splitright
set foldmethod=indent

let mapleader=" "

"-----------------------------------------------------------------------------------------------

call plug#begin('~/AppData/Local/nvim/plugged')

" Themes
Plug 'sainnhe/gruvbox-material'
Plug '/folke/tokyonight.nvim'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'

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
Plug 'kshenoy/vim-signature'
Plug 'ryanoasis/vim-devicons'

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
"Plug 'neovim/nvim-lspconfig'
"Plug 'nvim-lua/completion-nvim'

" Git
Plug 'tpope/vim-fugitive'

" Tests
Plug 'tyewang/vimux-jest-test'
Plug 'janko-m/vim-test'

" LiveServer
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}

call plug#end()

"-----------------------------------------------------------------------------------------------

"Gruvbox config
let g:gruvbox_italic=1
set background=dark
let g:gruvbox_material_background='medium'
let g:gruvbox_material_better_performance = 1
"colorscheme gruvbox-material
colorscheme tokyonight-storm
let g:airline_theme='ayu_dark'

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

"Lightline config
let g:lightline = {
      \'colorscheme': 'gruvbox',
      \'active': {
      \  'left': [['mode', 'paste'], ['relativepath', 'modified']],
      \  'right': [['filetype', 'percent', 'lineinfo','gitbranch']]
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
      \  'gitbranch': 'FugitiveHead'
      \   },
      \'subseparator': {
      \  'left': '',
      \  'right': ''
      \ }
      \}
let g:lightline.colorscheme = 'gruvbox'
"let g:lightline = { 'colorscheme': 'onehalfdark' }

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
nmap <Leader>x :!node %<CR>
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

" LSP Config
"lua << EOF
"require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}
"EOF

" CocPrettier Config
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

"Coc config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

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

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
" airline symbols                                                                                                                              
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeDecorateFolderNodeDefaultSymbol = ''

let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['nerdtree'] = ''
