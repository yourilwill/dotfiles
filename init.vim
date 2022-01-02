" プラグイン読み込み前にleaderを設定
let mapleader = "\<Space>"
if has('vim_starting')
    " 挿入モード時に非点滅の縦棒タイプのカーソル
    let &t_SI .= "\e[6 q"
    " ノーマルモード時に非点滅のブロックタイプのカーソル
    let &t_EI .= "\e[2 q"
    " 置換モード時に非点滅の下線タイプのカーソル
    let &t_SR .= "\e[4 q"
endif

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Dein自身の自動インストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " TOMLを読み込み，キャッシュしておく
  call dein#load_toml('~/.vim/rc/dein.toml',      {'lazy': 0})
  call dein#load_toml('~/.vim/rc/dein_lazy.toml', {'lazy': 1})

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "calet  dein#add('Shougo/neosnippet-snippets')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------


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
nmap <silent> [ale]<C-P> <Plug>(ale_previous)
nmap <silent> [ale]<C-N> <Plug>(ale_next)

" Insert mode
" inoremap <silent> fd <ESC>:<C-u>w<CR>" Insert modeを抜けてファイルを保存
" inoremap fd <ESC>         " Insert modeを抜けてファイルを保存

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

" encoding settings
set encoding=utf-8

" editor settings
set number                                     " 行番号表示
set splitbelow                                 " 水平分割時に下に表示
set splitright                                 " 縦分割時に右に表示
set noequalalways                              " 分割時に自動調整を無効化
set wildmenu                                   " コマンドモードの補完
"set relativenumber                             " 行番号を相対表示に
set smartindent                                " インデントを改善
set showmatch                                  " 対応するカッコを強調
set matchtime=1                                " 強調する時間を短く
set hlsearch                                   " 検索結果をハイライト
set hidden                                     " 保存せずに別ファイルに切り替える
set list                                       " 不可視文字の表示
set listchars=tab:»-,trail:-,eol:↓,extends:»,precedes:«,nbsp:%
syntax on                                      " シンタックスハイライト
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
set inccommand=split

" Resize window
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-

" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

let s:denite_win_width_percent = 0.85
let s:denite_win_height_percent = 0.7

" Change denite default options
call denite#custom#option('default', {
    \ 'split': 'floating',
    \ 'winwidth': float2nr(&columns * s:denite_win_width_percent),
    \ 'wincol': float2nr((&columns - (&columns * s:denite_win_width_percent)) / 2),
    \ 'winheight': float2nr(&lines * s:denite_win_height_percent),
    \ 'winrow': float2nr((&lines - (&lines * s:denite_win_height_percent)) / 2),
    \ })

" plugin keymaps
" let g:terraform_fmt_on_save=1 "format terraform on save
noremap <Leader>tf :<C-u>TerraformFmt<CR>

tnoremap <silent> <ESC> <C-\><C-n>
tnoremap <silent> fd <C-\><C-n>

" use OS clipboard
set clipboard+=unnamedplus

" use histogram diff algorithm (better diff)
set diffopt=filler,internal,algorithm:histogram,indent-heuristic
