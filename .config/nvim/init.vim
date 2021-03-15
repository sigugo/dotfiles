" disable legacy vi compatibility
set nocompatible

filetype off

" ===========================================

" start plug execution
call plug#begin('~/.config/nvim/plugged')

" self manage
Plug 'junegunn/vim-plug'

" load plugins
" function
Plug 'tpope/vim-fugitive'
Plug 'git://git.wincent.com/command-t.git'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
" Plug 'ervandew/supertab'
Plug 'easymotion/vim-easymotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'nathanaelkane/vim-indent-guides'

" COC Autocomplete /
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

" language support
Plug 'fatih/vim-go'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'PProvost/vim-ps1'

" visual 
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'vwxyutarooo/nerdtree-devicons-syntax'
Plug 'NLKNguyen/papercolor-theme'
Plug 'trusktr/seti.vim'
" Plug 'fatih/molokai'

" end vundle
call plug#end()

" coc modules
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json',
  \ 'coc-markdownlint'
  \ ]


" ===========================================

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

" ===========================================

" coc config
" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
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
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Prettier shorthand
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" coc-sql format shorthand
command! -nargs=0 SQLFormat :CocCommand sql.Format

" ===========================================

" force encoding
set encoding=UTF-8

" enable syntax and filetype plugins
syntax enable
filetype plugin indent on

" vim-go syntax highlighting settings
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators =1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

" indent
set shiftwidth=4
set tabstop=4

" enable highlight on serarch
set hls

" enable line numbering
set nu

" code folding
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=2

" set to colorscheme and design
set t_Co=256
set background=dark
" set background=light

" solarized
let g:solarized_termcolors=256
colorscheme solarized

" donttouchme
" colorscheme donttouchme 

" molokai
let g:rehash256 = 1
let g:molokai_original = 1
" colorscheme molokai
" colorscheme PaperColor
" colorscheme seti


" let g:airline_theme='solarized_flood'
if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

" let g:airline_theme='molokai'
let g:airline_theme='solarized'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" always display the status line
set laststatus=2

" configure the status line
set statusline=
set statusline+=%7*\[%n]                                  "buffernr
set statusline+=%1*\ %<%F\                                "File+path
set statusline+=%2*\ %y\                                  "FileType
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..) 
set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
set statusline+=%8*\ %=\ row:%l/%L                        "Rownumber/total (%)
set statusline+=%9*\ col:%03c\                            "Colnr
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.



function! HighlightSearch()
  if &hls
    return 'H'
  else
    return ''
  endif
endfunction

hi User1 guifg=#ffdad8	guibg=#880c0e	ctermfg=181	ctermbg=88
" hi User2 guifg=#000000  guibg=#F4905C 	ctermfg=58	ctermbg=172	gui=bold	cterm=bold
hi User2 guifg=#000000  guibg=#F4905C 	ctermfg=255	ctermbg=172	gui=bold	cterm=bold
hi User3 guifg=#292b00  guibg=#f4f597	ctermfg=148	ctermbg=100
hi User4 guifg=#112605  guibg=#aefe7B	ctermfg=0	ctermbg=114
hi User5 guifg=#051d00  guibg=#7dcc7d	ctermfg=0	ctermbg=37
hi User7 guifg=#ffffff  guibg=#880c0e	ctermfg=255	ctermbg=52	gui=bold	cterm=bold
hi User8 guifg=#ffffff  guibg=#5b7fbb	ctermfg=255	ctermbg=19
hi User9 guifg=#ffffff  guibg=#810085	ctermfg=255	ctermbg=54
hi User0 guifg=#ffffff  guibg=#094afe	ctermfg=255	ctermbg=26

hi Normal ctermbg=NONE

" Keybinds
nnoremap <leader>y "+yy
vnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>p "+p

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

hi Normal guibg=#111111 ctermbg=016
" hi Normal guibg=#111111 ctermbg=232
