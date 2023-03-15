local M = {}

-- local function setup_navic(client, buffer)
-- 	if client.server_capabilities.documentSymbolProvider then
-- 		require("nvim-navic").attach(client, buffer)
-- 	end
-- end

function M.typescript(client, buffer)
	if client.name == "tsserver" then
		vim.keymap.set("n", "<leader>lo", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
		-- vim.keymap.set("n", "<leader>lr", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
		-- vim.keymap.set("n", "gR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
	end
end

function M.on_attach(client, buffer)
	-- setup_navic(client, buffer)
	M.typescript(client, buffer)
end

return M
