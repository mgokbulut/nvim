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
* better surround a section with paranthesis where you know the start end don't know the end yet. just a single ( is hard
so maybe use sneak nvim to jump to end of the parenthesis or nvim surround to select the end charcter.
* neo tree to rm -rfi into trash.
* fix delete_until_start_of_line
* ctrl-o ctrl-o to delete the previous buffer while you trace back
* get previous clipboard item and swap with current keymap
* find a way to change the color of the cursor
* terminal emoji support
* use harpoon to create temporary buffer implementation and using buff edited autocommand
* vim grep via telescope the primeogen 
* kickstart.nvim tjs defaults
* remove all plugins and start from zero
* investigate filetree being on tmux by default
* flutter specific config
* react specific config
* see if (organize imports) or other suggestions can be keymapped
* better delete register so that previous deletions can be used
* COPILOT

 
To Test:
* git-conflict.nvim
 
Extas:
* Export color scheme to kitty: https://www.reddit.com/r/neovim/comments/10nphrj/lua_function_to_dump_current_neovim_colorscheme/
