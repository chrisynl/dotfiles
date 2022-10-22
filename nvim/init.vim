" my config
let mapleader=" "
set nocompatible
set mouse=a
set encoding=utf-8
"set tabstop=2
set tabstop=2 shiftwidth=2 expandtab
set number
set relativenumber
set cursorline
set wrap
set showcmd
set wildmenu
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase
set scrolloff=5
" set backspace=indent,eol,start
set indentexpr=
set smartindent
set autochdir

set grepprg=rg\ --vimgrep\ --smart-case\ --follow

filetype plugin on

"set ft=tmux tw=0

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"


" no recursive map
" chang the move and reuse
noremap H 5h
noremap J 5j
noremap K 5k
noremap L 5l


" search
noremap = nzz
noremap - Nzz
noremap <LEADER><CR> :nohlsearch<CR>

":map <F2> :echo 'Current time is ' . strftime('%c')<CR>

map s <nop>
map S :w<CR>
"map r :w<CR>
map Q :q<CR>
map U :u<CR>
map R :source $HOME/.config/nvim/init.vim<CR>
map ; :

map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sj :set splitbelow<CR>:split<CR>
map sk :set nosplitbelow<CR>:split<CR>
noremap <LEADER>k <C-w>k 
noremap <LEADER>j <C-w>j
noremap <LEADER>h <C-w>h
noremap <LEADER>l <C-w>l
map <LEADER><up> :res +5<CR>
map <LEADER><down> :res -5<CR>
map <LEADER><left> :vertical resize+5<CR>
map <LEADER><right> :vertical resize-5<CR>

map tk :tabe<CR>
map th :-tabnext<CR>
map tl :+tabnext<CR>

call plug#begin()


Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/sonokai'
Plug 'tomasiser/vim-code-dark'
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'
Plug 'ryanoasis/vim-devicons'
Plug 'mg979/vim-xtabline'
Plug 'liuchengxu/vista.vim'

Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'preservim/nerdcommenter'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'

Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'gcmt/wildfire.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" tabline
Plug 'mg979/vim-xtabline'

call plug#end()

let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_palette = 'mix'
let g:gruvbox_material_visual = 'green background'
let g:gruvbox_material_ui_contrast = 'high'
colorscheme gruvbox-material
"colorscheme codedark
"colorscheme gruvbox
let g:airline#extensions#vista#enabled = 0
let g:airline_theme='base16_gruvbox_dark_soft'

" Opening a terminal window
noremap <LEADER>/ :set splitbelow<CR>:split<CR>:res +1<CR>:term<CR>


" ===
" === NERDTree or coc-explore
" ===
" map tt :NERDTreeToggle<CR>
nmap <LEADER>e :CocCommand explorer<CR>

" ===
" === Vista
" ===
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
" autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'method' ] ]
      \ },
      \ 'component_function': {
      \   'method': 'NearestMethodOrFunction'
      \ },
      \ }

let g:vista#renderer#enable_icon = 1

let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

let g:vista_default_executive = 'coc'
nmap <LEADER>v :Vista!!<CR>



" ===
" === AutoPairs
" ===
"au Filetype cpp let b:AutoPairs = AutoPairsDefine({"<": ">"})
"let g:AutoPairsFlyMode = 1
"let g:AutoPairsShortcutBackInsert = '<M-b>'

" ===
" === Markdown
" ===
" specify browser to open preview page
" default: ''
let g:mkdp_browser = 'firefox'
" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'


" ===
" === exec
" ===
" Compile function
noremap <F12> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!gcc % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'lua'
		set splitbelow
		:sp
		:term lua %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		exec "CocCommand flutter.run -d ".g:flutter_default_device
		silent! exec "CocCommand flutter.dev.openDevLog"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc


" ===
" === fzf
" ===
noremap <C-l> :Lines<CR>

noremap <leader>p :GFiles<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR>

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number -- '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

" Word completion with custom spec with popup layout option
"inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'window': { 'width': 0.4, 'height': 0.5 }})
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
"xmap <leader><tab> <plug>(fzf-maps-x)
"omap <leader><tab> <plug>(fzf-maps-o)
" Insert mode completion
"imap <c-x><c-k> <plug>(fzf-complete-word)
"imap <c-x><c-l> <plug>(fzf-complete-line)

" ===
" === ultisnips
" ===

" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<nop>"
let g:UltiSnipsJumpForwardTrigger="<nop>"
let g:UltiSnipsJumpBackwardTrigger="<nop>"

" ===
" === coc config
" ===
let g:coc_global_extensions = [ 'coc-vimlsp', 'coc-json', 'coc-git', 'coc-emmet',
      \'coc-highlight', 'coc-marketplace']
let g:loaded_python_provider = 0

autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
autocmd CursorHold * silent call CocActionAsync('highlight')
" use below code or coc-highlight will not work
if (has("termguicolors"))
  set termguicolors
endif

set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Use K to show documentation in preview window.
nnoremap <silent> gK :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')

" ===
" === xtabline
" ===
let g:xtabline_settings = {}
let g:xtabline_settings.enable_mappings = 1
let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
let g:xtabline_settings.enable_persistance = 0
let g:xtabline_settings.last_open_first = 1

" ===
" === go
" ===
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')


" ===
" === treesitter
" ===
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { 'html', 'javascript', 'typescript', 'tsx', 'css', 'json' },
  -- ensure_installed = "all", -- or maintained
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true
  },
  indent = {
    enable = false
  },
  context_commentstring = {
    enable = true
  }
}
EOF
