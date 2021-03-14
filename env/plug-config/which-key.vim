" Timeout
let g:which_key_timeout = 100
let g:which_key_display_names = {'<CR>': '↵', '<TAB>': '⇆'}

let g:which_key_centered = 0
let g:which_key_hspace = 5

" Map leader to which_key
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" map <leader><leader> :

" Create map to add keys to - necessary
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100

" Coc Search & refactor
" nnoremap <leader>? CocSearch <C-R>=expand("<cword>")<CR><CR>
" let g:which_key_map['?'] = 'search word'

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0
let g:which_key_max_size = 0

" let g:which_key_position = 'botright'
" let g:which_key_position = 'topleft'
" let g:which_key_vertical = 1

" autocmd! FileType which_key
" autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
" highlight Cursor ctermbg=blue guibg=blue guifg=blue ctermfg=blue
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0
  \| autocmd BufLeave <buffer> set laststatus=2

" Single mappings
let g:which_key_map['/'] = [ 'gc'                                                     , 'comment' ]
" let g:which_key_map['.'] = [ ':e $MYVIMRC'                                          , 'open init' ]
let g:which_key_map[';'] = [ ':Commands'                                              , 'commands' ]
" let g:which_key_map['='] = [ '<C-W>='                                               , 'balance windows' ]

let g:which_key_map['e'] = [ ':CocCommand explorer --toggle --sources=buffer+,file+'  , 'explorer' ]
let g:which_key_map['q'] = [ '<Plug>(coc-fix-current)'                                , 'quickfix' ]
" let g:which_key_map['T'] = [ ':TSHighlightCapturesUnderCursor'                      , 'treesitter highlight' ]
" let g:which_key_map['u'] = [ ':UndotreeToggle'                                      , 'undo tree']
" let g:which_key_map['r'] = [ ':RnvimrToggle'                                        , 'ranger' ]
let g:which_key_map['r'] = [ ':CocCommand explorer --preset floating'                 , 'file manager' ]
let g:which_key_map['S'] = [ ':set spell!'                                            , 'spelling' ]
let g:which_key_map['j'] = [ ":call Buffers_open()"                                   , 'buffers' ]
let g:which_key_map[' '] = [ ':Files'                                                 , 'files' ]
let g:which_key_map['f'] = [ ':Rg'                                                    , 'ripgrep' ]
let g:which_key_map['c'] = [ ':CompileAndRun'                                         , 'compile&run' ]
let g:which_key_map['z'] = [ ':MaximizerToggle'                                       , 'maximizer' ]

" a is for actions
let g:which_key_map.a = {
      \ 'name' : '+actions' ,
      \ 'C' : [':ColorizerToggle'                        , 'colorizer'],
      \ 'f' : [':Finder'                                 , 'open in finder'],
      \ 'o' : [':Finder'                                 , 'open in finder'],
      \ 'n' : [':set nonumber!'                          , 'line-numbers'],
      \ 's' : ['ysi'                                     , 'surround'],
      \ 'r' : [':set norelativenumber!'                  , 'relative line nums'],
      \ 'g' : [':SignifyToggle'                          , 'signify'],
      \ 't' : [':call Toggle_transparent_background()'   , 'transparent background'],
      \ }

" let g:which_key_map.a.c = {
"       \ 'name' : '+Colorschemes' ,
"       \ '1' : [':call ChangeColorscheme(1) | sleep 100ms | call ChangeColorscheme(1)'       , 'gruvbox'],
"       \ '2' : [':call ChangeColorscheme(2) | sleep 100ms | call ChangeColorscheme(2)'       , 'codedark'],
"       \ '3' : [':call ChangeColorscheme(3) | sleep 100ms | call ChangeColorscheme(3)'       , 'aurora'],
"       \ '4' : [':call ChangeColorscheme(4) | sleep 100ms | call ChangeColorscheme(4)'       , 'palenight'],
"       \ '5' : [':call ChangeColorscheme(5) | sleep 100ms | call ChangeColorscheme(5)'       , 'nord'],
"       \ '6' : [':call ChangeColorscheme(6) | sleep 100ms | call ChangeColorscheme(6)'       , 'dracula'],
"       \ '7' : [':call ChangeColorscheme(7) | sleep 100ms | call ChangeColorscheme(7)'       , 'onedark'],
"       \ '8' : [':call ChangeColorscheme(8) | sleep 100ms | call ChangeColorscheme(8)'       , 'snazzy'],
"       \ }

" s is for search
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'                               , 'history'],
      \ ';' : [':FzfPreviewCommandPalette'               , 'commands'],
      \ 'a' : [':Ag'                                     , 'text Ag'],
      \ 'b' : [':CocCommand fzf-preview.BufferLines'     , 'current buffer'],
      \ 'B' : [':CocCommand fzf-preview.Buffers'         , 'open buffers'],
      \ 'c' : [':Commits'                                , 'commits'],
      \ 'C' : [':BCommits'                               , 'buffer commits'],
      \ 'd' : [':CocCommand fzf-preview.DirectoryFiles'  , 'directories'],
      \ 'f' : [':CocCommand fzf-preview.ProjectFiles'    , 'files'],
      \ 'g' : [':CocCommand fzf-preview.GitFiles'        , 'git files'],
      \ 'G' : [':GFiles?'                                , 'modified git files'],
      \ 'h' : [':History'                                , 'file history'],
      \ 'H' : [':History:'                               , 'command history'],
      \ 'l' : [':Lines'                                  , 'lines'] ,
      \ 'm' : [':CocCommand fzf-preview.Marks'           , 'list marks'],
      \ 'M' : [':Maps'                                   , 'normal maps'] ,
      \ 'p' : [':Helptags'                               , 'help tags'] ,
      \ 'P' : [':Tags'                                   , 'project tags'],
      \ 'q' : [':CocCommand fzf-preview.QuickFix'        , 'quickfix list'],
      \ 's' : [':CocList snippets'                       , 'snippets'],
      \ 'S' : [':Colors'                                 , 'color schemes'],
      \ 't' : [':Rg'                                     , 'text Rg'],
      \ 'T' : [':BTags'                                  , 'buffer tags'],
      \ 'w' : [':Windows'                                , 'search windows'],
      \ 'y' : [':Filetypes'                              , 'file types'],
      \ 'z' : [':FZF'                                    , 'FZF'],
      \ }

" g is for git
let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 'a' : [':Git add .'                        , 'add all'],
      \ 'A' : [':CocCommand fzf-preview.GitStatus' , 'actions'],
      \ 'b' : [':Git blame'                        , 'blame'],
      \ 'B' : [':GBrowse'                          , 'browse'],
      \ 'c' : [':Git commit'                       , 'commit'],
      \ 'd' : [':Git diff'                         , 'diff'],
      \ 'D' : [':Gdiffsplit'                       , 'diff split'],
      \ 'g' : [':Gstatus'                          , 'status'],
      \ 's' : [':Gstatus'                          , 'status'],
      \ 'l' : [':Git log'                          , 'log'],
      \ 'p' : [':Git push'                         , 'push'],
      \ 'P' : [':Git pull'                         , 'pull'],
      \ 'r' : [':GRemove'                          , 'remove'],
      \ 'S' : [':CocCommand fzf-preview.GitStatus' , 'status'],
      \ }
      " \ 'A' : [':Git add %'                        , 'add current'],
      " \ 'S' : [':!git status'                      , 'status'],
      " \ 'h' : [':GitGutterLineHighlightsToggle'    , 'highlight hunks'],
      " \ 'H' : ['<Plug>(GitGutterPreviewHunk)'      , 'preview hunk'],
      " \ 'j' : ['<Plug>(GitGutterNextHunk)'         , 'next hunk'],
      " \ 'k' : ['<Plug>(GitGutterPrevHunk)'         , 'prev hunk'],
      " \ 'm' : ['<Plug>(git-messenger)'             , 'message'],
      " \ 'i' : [':Gist -b'                          , 'post gist'],
      " \ 'G' : [':GGrep'                            , 'git grep'],
      " \ 'u' : ['<Plug>(GitGutterUndoHunk)'         , 'undo hunk'],
      " \ 's' : ['<Plug>(GitGutterStageHunk)'        , 'stage hunk'],
      " \ 'v' : [':GV'                               , 'view commits'],
      " \ 'V' : [':GV!'                              , 'view buffer commits'],
      " \ 't' : [':GitGutterSignsToggle'             , 'toggle signs'],

" l is for language server protocol
let g:which_key_map.l = {
      \ 'name' : '+lsp' ,
      \ '.' : [':CocConfig'                          , 'config'],
      \ ';' : ['<Plug>(coc-refactor)'                , 'refactor'],
      \ 'a' : ['<Plug>(coc-codeaction)'              , 'code action'],
      \ 'A' : ['<Plug>(coc-codeaction-selected)'     , 'selected action'],
      \ 'b' : [':CocNext'                            , 'next action'],
      \ 'B' : [':CocPrev'                            , 'prev action'],
      \ 'c' : [':CocList commands'                   , 'commands'],
      \ 'd' : ['<Plug>(coc-definition)'              , 'definition'],
      \ 'D' : ['<Plug>(coc-declaration)'             , 'declaration'],
      \ 'e' : [':CocList extensions'                 , 'extensions'],
      \ 'f' : ['<Plug>(coc-format-selected)'         , 'format selected'],
      \ 'F' : ['<Plug>(coc-format)'                  , 'format'],
      \ 'h' : ['<Plug>(coc-float-hide)'              , 'hide'],
      \ 'i' : ['<Plug>(coc-implementation)'          , 'implementation'],
      \ 'I' : [':CocList diagnostics'                , 'diagnostics'],
      \ 'j' : ['<Plug>(coc-float-jump)'              , 'float jump'],
      \ 'l' : ['<Plug>(coc-codelens-action)'         , 'code lens'],
      \ 'n' : ['<Plug>(coc-diagnostic-next)'         , 'next diagnostic'],
      \ 'N' : ['<Plug>(coc-diagnostic-next-error)'   , 'next error'],
      \ 'O' : [':CocList outline'                    , 'search outline'],
      \ 'p' : ['<Plug>(coc-diagnostic-prev)'         , 'prev diagnostic'],
      \ 'P' : ['<Plug>(coc-diagnostic-prev-error)'   , 'prev error'],
      \ 'q' : ['<Plug>(coc-fix-current)'             , 'quickfix'],
      \ 'r' : ['<Plug>(coc-references)'              , 'references'],
      \ 'R' : ['<Plug>(coc-rename)'                  , 'rename'],
      \ 's' : [':CocList -I symbols'                 , 'references'],
      \ 'S' : [':CocList snippets'                   , 'snippets'],
      \ 't' : ['<Plug>(coc-type-definition)'         , 'type definition'],
      \ 'u' : [':CocListResume'                      , 'resume list'],
      \ 'U' : [':CocUpdate'                          , 'update CoC'],
      \ 'z' : [':CocDisable'                         , 'disable CoC'],
      \ 'Z' : [':CocEnable'                          , 'enable CoC'],
      \ }
      " \ 'o' : ['<Plug>(coc-openlink)'                , 'open link'],

" Register which key map
autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map')
