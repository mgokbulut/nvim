" if plugin support is enabled
if (g:plugins_enabled == 1)

  " auto-install vim-plug
  if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
  else

    call plug#begin('~/.config/nvim/autoload/plugged')

      " ========== Must Haves ========== "
      if(g:must_have == 1)
        " Surround (ysiw, cs etc.)
        Plug 'tpope/vim-surround'
        " Repeating plugin mappings
        Plug 'tpope/vim-repeat'
        " Easier commenting
        Plug 'tpope/vim-commentary'
        " Better pair handling
        Plug 'jiangmiao/auto-pairs'
        " auto close tags
        Plug 'alvan/vim-closetag'
        " vim and tmux navigation integration
        Plug 'christoomey/vim-tmux-navigator'
        " a light version of gruvbox
        " Plug 'lifepillar/vim-gruvbox8'
        " non lightweight gruvbox
        Plug 'morhetz/gruvbox'
        " Dracula theme
        Plug 'dracula/vim', { 'as': 'dracula' }
        " indentation line indicators around 2.5ms
        Plug 'Yggdroot/indentLine'
        " To disable highlighting after the search is done
        Plug 'romainl/vim-cool'
      endif

      " ========== Should Haves ========== "
      if(g:should_have == 1)
        " fuzzy file search and rg
        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        Plug 'junegunn/fzf.vim'
        " Stable version of coc
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
        " See what leader mapped keys do
        Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
        " Git plugin
        Plug 'tpope/vim-fugitive'
        " fullscreen when in split view
        Plug 'szw/vim-maximizer'
        " Airline status-line
        Plug 'vim-airline/vim-airline'
      endif

      " ========== Could Haves ========== "
      if (g:could_have == 1)
        " test vim speed
        Plug 'tweekmonster/startuptime.vim'
        " smooth ctrl-d, ctrl-u
        " Plug 'psliwka/vim-smoothie'
        " Bunch of pre-made snippets
        Plug 'honza/vim-snippets'
        " Lazy git integration
        Plug 'kdheepak/lazygit.nvim'
      endif

      " ============== Lua ============== "
      if (g:lua_enabled == 1)
        " Colorizer
        Plug 'norcalli/nvim-colorizer.lua'
        " much much better syntax highlight
        Plug 'nvim-treesitter/nvim-treesitter', {'branch': '0.5-compat', 'do': ':TSUpdate'}
      endif

    call plug#end()

    " Automatically install missing plugins on startup
    autocmd VimEnter *
      \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \|   PlugInstall --sync | q
      \| endif

    " Plugin Configuration
    if(g:must_have == 1)
      source $HOME/.config/nvim/env/plug-config/tmux.vim
      source $HOME/.config/nvim/env/plug-config/colorscheme.vim
      source $HOME/.config/nvim/env/plug-config/closetag.vim
    endif

    if(g:should_have == 1)
      source $HOME/.config/nvim/env/plug-config/fzf.vim
      source $HOME/.config/nvim/env/plug-config/coc/coc.vim
      source $HOME/.config/nvim/env/plug-config/coc/coc-extensions.vim
      source $HOME/.config/nvim/env/plug-config/coc/coc-explorer.vim
      source $HOME/.config/nvim/env/plug-config/which-key.vim
      source $HOME/.config/nvim/env/plug-config/airline.vim
    endif

    if (g:lua_enabled == 1 && g:must_have == 1)
      luafile $HOME/.config/nvim/env/lua/plug-colorizer.lua
      luafile $HOME/.config/nvim/env/lua/plug-treesitter.lua
      " source $HOME/.config/nvim/env/plug-config/status-line.vim
      " luafile $HOME/.config/nvim/env/lua/status-line.lua
      " luafile $HOME/.config/nvim/env/lua/devicon.lua
    endif
  endif
endif
