" for detecting OS
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif

" important option that should already be set!
set hidden

"func! CompileRunGcc()
"	exec "w"
"	if &filetype == 'c'
"	exec "!gcc % -o %<"
"	exec "!time ./%<"
"	elseif &filetype == 'cpp'
"	exec "!g++ % -o %<"
"	exec "!time ./%<"
"	elseif &filetype == 'java'
"	exec "!javac %"
"	exec "!time java -cp %:p:h %:t:r"
"	elseif &filetype == 'sh'
"	exec "!time bash %"
"	elseif &filetype == 'python'
"	exec "!time python2.7 %"
"	elseif &filetype == 'html'
"	exec "!firefox % &"
"	elseif &filetype == 'go'
"	exec "!go build %<"
"	exec "!time go run %"
"	elseif &filetype == 'mkd'
"	exec "!~/.vim/markdown.pl % > %.html &"
"	exec "!firefox %.html &"
"	endif
"endfunc

function! GetCompileScript() abort
		if &filetype == 'c'
		 return "gcc -std=c99 %s && time ./a.out"
		elseif &filetype == 'cpp'
			return "g++ %s && time ./a.out"
		elseif &filetype == 'java'
			return "javac %s && time java ".expand('%:t:r')
		else
		 	return "echo \"not supported file type\""
	endif
	return "echo \"Something went wrong!\""
endfunction

" available options:
" * g:split_term_style
" * g:split_term_resize_cmd
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
" command! -nargs=0 RunC call TermWrapper(printf('gcc -std=c99 %s && ./a.out', expand('%')))
" command! -nargs=1 CompileAndRunWithFile call TermWrapper(printf('g++ -std=c++11 %s && ./a.out < %s', expand('%'), <args>))
autocmd FileType c    nnoremap <F6> :CompileAndRun<CR>
autocmd FileType cpp  nnoremap <F6> :CompileAndRun<CR>
autocmd FileType java nnoremap <F6> :CompileAndRun<CR>


" options
" choose between 'vertical' and 'horizontal' for how the terminal window is split
" (default is vertical)
let g:split_term_style = 'vertical'

" add a custom command to resize the terminal window to your preference
" (default is to split the screen equally)
let g:split_term_resize_cmd = 'vertical resize 40'
" (or let g:split_term_resize_cmd = 'vertical resize 40')

