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

call plug#begin()

" Themes
"Plug 'sainnhe/gruvbox-material'
"Plug '/folke/tokyonight.nvim'
Plug 'hachy/eva01.vim', { 'branch': 'main' }

" IDE
Plug 'easymotion/vim-easymotion' " para usar el <Leader> s (mover el cursor)
Plug 'scrooloose/nerdtree' " navegar entre archivos (barra izquierda) <Leader> nj
Plug 'christoomey/vim-tmux-navigator' " cambiar tamaño de tabs en vim
Plug 'mg979/vim-visual-multi', {'branch': 'master'} " cursor multilinea
Plug 'junegunn/fzf' " facilita el navegar por archivos <Leader> f
Plug 'mhinz/vim-signify' " muestra si la línea se ah modificado, borrado o agregado
Plug 'yggdroot/indentline' " Muestra la línea de indentación, tener cuidado porq modifica el conceal
Plug 'scrooloose/nerdcommenter' " Comenta las líneas seleccionadas
Plug 'kshenoy/vim-signature' " Muestra las marcas que tienes en el buffer
Plug 'ryanoasis/vim-devicons' " Pa q se vean los íconos en el nerdtree
Plug 'wuelnerdotexe/vim-astro' "  Provee resaltado de sintaxis y identación para archivos .astro

" Syntax 
Plug 'sheerun/vim-polyglot' " Resaltado de sintaxis de distintos lenguajes
      
" Status bar    
Plug 'vim-airline/vim-airline-themes' " Temas de la línea de estado
Plug 'vim-airline/vim-airline' " Línea de estado de NVIM

" Typing
Plug 'jiangmiao/auto-pairs' " Autocomplete () [] {}
Plug 'tpope/vim-surround' " Wrap a variable with 'cs'
Plug 'mattn/emmet-vim' " Emmet autocomplete for html

" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'} " El poderoso COC

" LSP
Plug 'williamboman/mason.nvim'
Plug 'neovim/nvim-lspconfig' " Servidor q te muestra las recomendaciones de autocompletado

" Git
Plug 'tpope/vim-fugitive' " Usar git en neovim

call plug#end()

"-----------------------------------------------------------------------------------------------

"Colorscheme config
colorscheme eva01-LCL
let g:airline_theme='deus'

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

"VimuxTmuxNavigator (Split resize)
nnoremap <Leader>> 10<C-w>>
nnoremap <Leader>< 10<C-w><

" LSP Config
"lua << EOF
"require("mason").setup()
"require'lspconfig'.tsserver.setup{}
"require'lspconfig'.astro.setup{}
"require'lspconfig'.emmet_ls.setup{}
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

" ----------------------------------------------------

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

" ---------------------------------------------------------------------------------

"My shortcuts
nmap <A-j> 10<C-E>
nmap <A-k> 10<C-Y>
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>, $a;<Esc>
nmap <Leader>x :!node %<CR>
inoremap MM <Esc>
inoremap <A-h> <Left>
inoremap <A-j> <Down>
inoremap <A-k> <Up>
inoremap <A-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>
nmap <Leader>ob :Buffer<CR>
nmap <Leader>p :CocCommand prettier.formatFile<CR>
