local M = {}

function M.typescript(opts)
	require("typescript").setup({ server = opts })
	return true
end

return M
