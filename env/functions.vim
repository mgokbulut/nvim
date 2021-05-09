"Auto Whitspace trimming!!
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
" autocmd BufWritePre * :call TrimWhitespace()

" ===============================================================================

"self descriptive -- highlights yanked text for a little extra visual feedback
augroup highlight_yank
    if has("nvim-0.5")
        autocmd!
        autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
    endif
augroup END

" ===============================================================================

" Clear cmd line message
function! s:empty_message(timer)
  if mode() ==# 'n'
    echon ''
  endif
endfunction

augroup cmd_msg_cls
    autocmd!
    autocmd CmdlineLeave :  call timer_start(4000, funcref('s:empty_message'))
augroup END " Hide status line

" ===============================================================================

" make sure the python indenting is fixed
autocmd FileType python setlocal shiftwidth=2 softtabstop=2 expandtab

" ===============================================================================

" Git branch
" function! Statusline_git() abort
"     let git = fugitive#head()
"     if git != ''
"         return ' '.fugitive#head()
"     else
"         return ''
"     endif
" endfunction

" ===============================================================================

" CompileAndRun
function! GetCompileScript() abort
		if &filetype == 'c'
		 return "gcc -std=c99 %s && time ./a.out"
		elseif &filetype == 'cpp'
			return "g++ %s && time ./a.out"
		elseif &filetype == 'java'
			return "javac %s && time java ".expand('%:t:r')
		elseif &filetype == 'scala'
			return "scala %s"
		else
		 	return "echo \"not supported file type\""
	endif
	return "echo \"Something went wrong!\""
endfunction

function! TermWrapper(command) abort
	if !exists('g:split_term_style') | let g:split_term_style = 'vertical' | endif
	if g:split_term_style ==# 'vertical'
		let buffercmd = 'vnew'
	elseif g:split_term_style ==# 'horizontal'
		let buffercmd = 'new'
	else
		echoerr 'ERROR! g:split_term_style is not a valid value (must be ''horizontal'' or ''vertical'' but is currently set to ''' . g:split_term_style . ''')'
		throw 'ERROR!:split_term_style is not a valid value (must be ''horizontal'' or ''vertical'')'
	endif
	if exists('g:split_term_resize_cmd')
		exec g:split_term_resize_cmd
  endif
	exec buffercmd
	exec 'term ' . a:command
	exec 'startinsert'
endfunction

command! -nargs=0 GetCompileScript call GetCompileScript()
command! -nargs=0 CompileAndRun call TermWrapper(printf(GetCompileScript(), expand('%')))
command! -nargs=1 CompileAndRunWithArguments call TermWrapper(printf(GetCompileScript()." %s", expand('%'), <args>))

autocmd FileType c    nnoremap <F6> :CompileAndRun<CR>
autocmd FileType cpp  nnoremap <F6> :CompileAndRun<CR>
autocmd FileType java nnoremap <F6> :CompileAndRun<CR>
autocmd FileType scala nnoremap <F6> :CompileAndRun<CR>
