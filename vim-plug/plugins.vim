" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

  " Surround (ysiw, cs etc.)
  Plug 'tpope/vim-surround'
  " Better Syntax Support
  Plug 'sheerun/vim-polyglot'
  " Auto pairs for '(' '[' '{'
  Plug 'jiangmiao/auto-pairs'
  " Stable version of coc
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Bunch of pre-made snippets
  Plug 'honza/vim-snippets'
  " Status line and tab bar
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " Ranger file browser
  Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
  " Have the file system follow you around (exclude files in browser line .git)
  Plug 'airblade/vim-rooter'
  " FZF
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release', 'do': ':UpdateRemotePlugins' }
  Plug 'junegunn/fzf.vim' 
  " Text Navigation (pressing f highlights the character)
  Plug 'unblevable/quick-scope'
  " Colorizer
  Plug 'norcalli/nvim-colorizer.lua'




  " Best Color Scheme ever!!!
  Plug 'morhetz/gruvbox'
  
  " File Explorer
  " Plug 'scrooloose/NERDTree'
  " Rainbow parenthesis 
  " Plug 'junegunn/rainbow_parentheses.vim'
call plug#end()

" set Color Scheme
colorscheme gruvbox

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
