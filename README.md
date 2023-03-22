Todos:
 
* Testing plugins such as neotest
* Better folding (nvim-ufo)
* image rendering image.nvim
* Interchangeable color scheme

+ * fix smart_j smart_k
+ * autocommand that checks if the column is 0, then indents by putting space
+ * smart_k send_keys
+ * smart_k undo filter
* trim whitespaces undo filter
* make sure lsp doesn't cry for whitespaces

* move jump to first word functionality from smart_j/k to autocommand
* after gc or gv, select the line incorrectly
 
* I want a vim.api.nvim_create_autocmd("CursorMoved",  and i want this cursormoved autocommand to be triggered after buffer is written

* check if the previous buffer exists when doing mv operations
* figure out why vim.fn.indent doesn't work
* incorparate paranthesis evaluators correctly

Projects:
* vim grep via telescope the primeogen 
* kickstart.nvim tjs defaults
* remove all plugins and start from zero
* investigate filetree being on tmux by default
* flutter specific config
* react specific config
* see if (organize imports) or other suggestions can be keymapped

 
To Test:
* git-conflict.nvim
 
Extas:
* Export color scheme to kitty: https://www.reddit.com/r/neovim/comments/10nphrj/lua_function_to_dump_current_neovim_colorscheme/
