let g:startify_custom_header = [
        \ '   _       __     __                             __               __  ',    
        \ '  | |     / /__  / /________  ____ ___  ___     / /_  ____ ______/ /__',    
        \ '  | | /| / / _ \/ / ___/ __ \/ __ `__ \/ _ \   / __ \/ __ `/ ___/ //_/',    
        \ '  | |/ |/ /  __/ / /__/ /_/ / / / / / /  __/  / /_/ / /_/ / /__/ ,<   ',    
        \ '  |__/|__/\___/_/\___/\____/_/ /_/ /_/\___/  /_.___/\__,_/\___/_/|_|  ',    
        \ '                                                                      ',    
        \ '      __  ___     ______      __   __          __      __             ',    
        \ '     /  |/  /____/ ____/___  / /__/ /_  __  __/ /_  __/ /_            ',    
        \ '    / /|_/ / ___/ / __/ __ \/ //_/ __ \/ / / / / / / / __/            ',    
        \ '   / /  / / /  / /_/ / /_/ / ,< / /_/ / /_/ / / /_/ / /_              ',    
        \ '  /_/  /_/_(_) \____/\____/_/|_/_.___/\__,_/_/\__,_/\__/              ',    
        \]
                                      
let g:startify_session_dir = '~/.config/nvim/session'


let g:startify_lists = [
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']                    },
          \ { 'type': 'files',     'header': ['   Files']                        },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']                     },
          \ ]


let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1

let g:webdevicons_enable_startify = 1

" function! StartifyEntryFormat()
"         return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
"     endfunction

let g:startify_bookmarks = [
            \ { 'i': '~/.config/nvim/init.vim' },
            \ '~/Documents/TU-Delft/2nd year',
            \ '~/Documents/Projects',
            \ '~/Desktop',
            \ ]

let g:startify_enable_special = 0 
