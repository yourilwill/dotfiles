" プラグイン読み込み前にleaderを設定
let mapleader = "\<Space>"

filetype plugin indent on
syntax enable

if has('vim_starting')
    " 挿入モード時に非点滅の縦棒タイプのカーソル
    let &t_SI .= "\e[6 q"
    " ノーマルモード時に非点滅のブロックタイプのカーソル
    let &t_EI .= "\e[2 q"
    " 置換モード時に非点滅の下線タイプのカーソル
    let &t_SR .= "\e[4 q"
endif

" --------------------------------------------------
"  keybind
" --------------------------------------------------
"  Normal mode
noremap <Leader>init :<C-u>edit $MYVIMRC<CR>    " init.vim呼び出し
"noremap <Space>fed :<C-u>edit $MYVIMRC<CR>     " init.vim呼び出し
"command init :<C-u>edit $MYVIMRC<CR>          " init.vim呼び出し
"noremap <Space>s :source $MYVIMRC<CR>          " init.vim読み込み
noremap <Leader>fr :source $MYVIMRC<CR>          " init.vim読み込み
noremap <Leader>w :<C-u>w<CR>                   " ファイル保存

" Ex mode
set pastetoggle=<f5>
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
"cnoremap <C-b> <Left>
"cnoremap <C-f> <Right>
"cnoremap <C-a> <Home>
"cnoremap <C-e> <End>
"cnoremap <C-d> <Del>

" Insert mode
" inoremap <silent> fd <ESC>:<C-u>w<CR>" Insert modeを抜けてファイルを保存
inoremap fd <ESC>         " Insert modeを抜けてファイルを保存

" editor settings
set number                                     " 行番号表示
set splitbelow                                 " 水平分割時に下に表示
set splitright                                 " 縦分割時を右に表示
set noequalalways                              " 分割時に自動調整を無効化
set wildmenu                                   " コマンドモードの補完
" set relativenumber                             " 行番号を相対表示に
set smartindent                                " インデントを改善
set showmatch                                  " 対応するカッコを強調
set matchtime=1                                " 強調する時間を短く
set hlsearch                                   " 検索結果をハイライト
set hidden                                     " 保存せずに別ファイルに切り替える
syntax on                                      " シンタックスハイライト
set list                                       " 不可視文字の表示
set listchars=tab:»-,trail:-,eol:↓,extends:»,precedes:«,nbsp:%
nnoremap <silent> <C-j> :bnext<CR>
nnoremap <silent> <C-k> :bprev<CR>
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" cursor settings
set ruler                                      " カーソルの位置表示
set cursorline                                 " カーソルハイライト

" tab settings
set expandtab                                  " tabを複数のspaceに置き換え
set tabstop=2                                  " tabは半角2文字
set shiftwidth=2                               " tabの幅

" split window
nmap ss :split<Return><C-w>w                   " windowを水平方向に分割
nmap sv :vsplit<Return><C-w>w<C-w>=            " windowを縦方向に分割
nmap sw <C-w>c                                 " windowを閉じる
nmap s- <C-w>_                                 " 縦に最大化
nmap s\ <C-w>\|                                " 横に最大化
nmap sz <C-w>_<C-w>\|                          " 縦横に最大化
nmap s= <C-w>=                                 " 大きさを揃える

" move window
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l

" switch
nmap te :tabnew<Return>
nnoremap <S-tab> gT
nnoremap <tab> gt

" search and replace
set ignorecase
set smartcase
set wrapscan
set incsearch

tnoremap <silent> <ESC> <C-\><C-n>
tnoremap <silent> fd <C-\><C-n>

" use OS clipboard
set clipboard+=unnamedplus

" use histogram diff algorithm (better diff)
set diffopt=filler,internal,algorithm:histogram,indent-heuristic

" Resize window
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'dracula/vim'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Yggdroot/indentLine'
call plug#end()

" Plugin settings
colorscheme dracula
noremap sf :NERDTreeToggle<CR>

autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none
set background="dark"

let g:airline_theme = 'deus'
"let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

map <Leader>ff <Plug>(easymotion-f2)
nmap <Leader>ss <Plug>(easymotion-s2)
xmap <Leader>ss <Plug>(easymotion-s2)
" surround.vimと被らないように
omap z <Plug>(easymotion-s2)

hi SpecialKey ctermbg=NONE ctermfg=59 guibg=NONE guifg=NONE
hi NonText ctermbg=NONE ctermfg=59 guibg=NONE guifg=NONE

if &term =~ "screen-256color"
    let &t_BE = "\e[?2004h"
    let &t_BD = "\e[?2004l"
    exec "set t_PS=\e[200~"
    exec "set t_PE=\e[201~"
endif
