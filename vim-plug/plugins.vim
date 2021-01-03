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
  " Easier commenting
  Plug 'tpope/vim-commentary'
  " test vim speed
  Plug 'tweekmonster/startuptime.vim'
  " Repeating plugin mappings
  Plug 'tpope/vim-repeat'
  " Better Syntax Support
  Plug 'sheerun/vim-polyglot'
  " Auto pairs for '(' '[' '{'
  Plug 'jiangmiao/auto-pairs'
  " Auto close tags 
  Plug 'alvan/vim-closetag'
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
  " See what leader mapped keys do 
  Plug 'liuchengxu/vim-which-key'
  " vim and tmux navigation integration
  Plug 'christoomey/vim-tmux-navigator'
  " smooth ctrl-d, ctrl-u
  Plug 'psliwka/vim-smoothie'
  " for tsconfig to work properly
  Plug 'neoclide/jsonc.vim'
  " JavaScript support
  Plug 'pangloss/vim-javascript'    
  " TypeScript syntax
  Plug 'HerringtonDarkholme/yats.vim' "heavier
  " Plug 'leafgarland/typescript-vim' "lighter
  " JS and JSX syntax
  Plug 'maxmellon/vim-jsx-pretty'   
  " dev icons
  Plug 'ryanoasis/vim-devicons'
  " shows changes of file on left bar
  Plug 'mhinz/vim-signify'
  " View and search LSP symbols, tags
  Plug 'liuchengxu/vista.vim'

  
  " Debugging
  " Plug 'puremourning/vimspector'
  " Plug 'szw/vim-maximizer'
  
  " Wait for neovim 0.5 on mac 
  " lua dev icons
  " Plug 'kyazdani42/nvim-web-devicons'
  " better tab bar
  " Plug 'romgrk/barbar.nvim'
  " Status Line
  " Plug 'glepnir/galaxyline.nvim'
  " GraphQL syntax
  " Plug 'jparise/vim-graphql'    




  " Best Color Scheme ever!!!
  Plug 'morhetz/gruvbox'
  " vscode Color Scheme
  Plug 'tomasiser/vim-code-dark'
  
  " Start Screen
  " Plug 'mhinz/vim-startify'
  " File Explorer
  " Plug 'scrooloose/NERDTree'
  " Rainbow parenthesis 
  " Plug 'junegunn/rainbow_parentheses.vim'
  " Sneak (remaps s key)
  " Plug 'justinmk/vim-sneak'
call plug#end()

" set Color Scheme
colorscheme codedark 

" allow nvim to be transparent
hi! Normal ctermbg=NONE guibg=NONE 
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE 

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
