" if plugin support is enabled
if (g:plugins_enabled == 1)

  " auto-install vim-plug
  if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
  else

    call plug#begin('~/.config/nvim/autoload/plugged')

      " ========== Must Haves ========== "
        " Surround (ysiw, cs etc.)
        Plug 'tpope/vim-surround'
        " Repeating plugin mappings
        Plug 'tpope/vim-repeat'
        " Easier commenting
        Plug 'tpope/vim-commentary'
        " auto close tags
        Plug 'alvan/vim-closetag'
        " vim and tmux navigation integration
        Plug 'christoomey/vim-tmux-navigator'
        " a light version of gruvbox
        Plug 'lifepillar/vim-gruvbox8'
        " fuzzy file search and rg
        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        Plug 'junegunn/fzf.vim'

      " ========== Should Haves ========== "
        " indentation line indicators around 2.5ms
        Plug 'Yggdroot/indentLine'
        " Stable version of coc
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
        " See what leader mapped keys do
        Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
        " Git plugin
        Plug 'tpope/vim-fugitive'

      " ========== Could Haves ========== "
        " test vim speed
        Plug 'tweekmonster/startuptime.vim'
        " smooth ctrl-d, ctrl-u
        Plug 'psliwka/vim-smoothie'
        " Bunch of pre-made snippets
        Plug 'honza/vim-snippets'
        " Colorscheme

      " ============== Lua ============== "
      if (g:lua_enabled == 1)
        " Colorizer
        Plug 'norcalli/nvim-colorizer.lua'
        " much much better syntax highlight
        Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
      endif

    call plug#end()

    " Automatically install missing plugins on startup
    autocmd VimEnter *
      \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \|   PlugInstall --sync | q
      \| endif


    source $HOME/.config/nvim/env/plug-config/fzf.vim
    source $HOME/.config/nvim/env/plug-config/tmux.vim
    source $HOME/.config/nvim/env/plug-config/colorscheme.vim
    source $HOME/.config/nvim/env/plug-config/closetag.vim
    source $HOME/.config/nvim/env/plug-config/coc/coc.vim
    source $HOME/.config/nvim/env/plug-config/coc/coc-extensions.vim
    source $HOME/.config/nvim/env/plug-config/coc/coc-explorer.vim
    source $HOME/.config/nvim/env/plug-config/which-key.vim

    if (g:lua_enabled == 1)
      luafile $HOME/.config/nvim/env/lua/plug-colorizer.lua
      luafile $HOME/.config/nvim/env/lua/plug-treesitter.lua
      " source $HOME/.config/nvim/env/plug-config/status-line.vim
      " luafile $HOME/.config/nvim/env/lua/status-line.lua
      " luafile $HOME/.config/nvim/env/lua/devicon.lua
    endif
  endif
endif
