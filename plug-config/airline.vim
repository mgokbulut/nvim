let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
" let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:airline_left_sep = ''
let g:airline_right_sep = ''
" let g:airline_left_sep = ''
" let g:airline_right_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_alt_sep = ''

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
"let g:airline_symbols.whitespace = 'Ξ'

let g:airline_detect_spell=1
let g:airline_detect_spelllang=1
let g:airline_powerline_fonts = 1
let g:airline_exclude_preview = 0
" let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

let g:airline#extensions#coc#enabled = 1
let airline#extensions#coc#error_symbol = 'E:'
let airline#extensions#coc#warning_symbol = 'W:'
" let airline#extensions#coc#error_symbol = 'ⓧ '
" let airline#extensions#coc#warning_symbol = '⚠ '
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

let g:airline#extensions#fzf#enabled = 1

" * enable/disable displaying buffers with a single tab. (c) >
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1

" now in the which-key
" nmap <leader>1 <Plug>AirlineSelectTab1
" nmap <leader>2 <Plug>AirlineSelectTab2
" nmap <leader>3 <Plug>AirlineSelectTab3
" nmap <leader>4 <Plug>AirlineSelectTab4
" nmap <leader>5 <Plug>AirlineSelectTab5
" nmap <leader>6 <Plug>AirlineSelectTab6
" nmap <leader>7 <Plug>AirlineSelectTab7
" nmap <leader>8 <Plug>AirlineSelectTab8
" nmap <leader>9 <Plug>AirlineSelectTab9

" let g:airline#extensions#tabline#buffer_idx_format = {
"       \ '1': '1) ',
"       \ '2': '2) ',
"       \ '3': '3) ',
"       \ '4': '4) ',
"       \ '5': '5 ',
"       \ '6': '6 ',
"       \ '7': '7 ',
"       \ '8': '8 ',
"       \ '9': '9 ',
"       \ '0': '(0) '
"       \}


" * configure the minimum number of buffers needed to show the tabline. >
" let g:airline#extensions#tabline#buffer_min_count = 2
" * configure whether close button should be shown: >
let g:airline#extensions#tabline#show_close_button = 1
" * configure symbol used to represent close button >
let g:airline#extensions#tabline#close_symbol = 'ⓧ '


"" -------------------------------------                     *airline-tmuxline*
"" tmuxline <https://github.com/edkolev/tmuxline.vim>

"" * enable/disable tmuxline integration >
let g:airline#extensions#tmuxline#enabled = 1
"" * configure which mode colors should be used in tmux statusline >
" let airline#extensions#tmuxline#color_template = 'normal' (default)
let airline#extensions#tmuxline#color_template = 'insert'
" let airline#extensions#tmuxline#color_template = 'visual'
" let airline#extensions#tmuxline#color_template = 'replace'

" Stock presets:
" let g:tmuxline_preset = 'full'
" let g:tmuxline_preset = 'nightly_fox'
" visit https://github.com/edkolev/tmuxline.vim for more presets

let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '',
      \'c'    : '',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : '%a',
      \'y'    : '%R',
      \'z'    : '#H'}

" let g:tmuxline_preset = {
"       \'a'    : '#S',
"       \'b'    : '#W',
"       \'c'    : '#H',
"       \'win'  : '#I #W',
"       \'cwin' : '#I #W',
"       \'x'    : '%a',
"       \'y'    : '#W %R',
"       \'z'    : '#H'}

" Heavy duty status line
" let g:tmuxline_preset = {
"       \'a'    : '#S',
"       \'c'    : ['#(whoami)', '#(uptime | cut -d " " -f 1,2,3)'],
"       \'win'  : ['#I', '#W'],
"       \'cwin' : ['#I', '#W', '#F'],
"       \'x'    : '#(date)',
"       \'y'    : ['%R', '%a', '%Y'],
"       \'z'    : '#H'}

let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '>',
    \ 'right' : '',
    \ 'right_alt' : '<',
    \ 'space' : ' '}


" See color-scheme for theme
" let g:airline_theme = 'codedark'
" let g:airline_theme = "palenight"
" Switch to your current theme
" let g:airline_theme='nord-minimal'
" let g:airline_theme = 'onedark'
" let g:airline_theme='luna'

" Always show tabs
set showtabline=2
