local M = {}

M.ensure_installed = {
	"tsserver",
	"eslint",
	"html",
	"cssls",
}

function M.on_attach(opts)
	-- setup autoformat
	require("plugins.lsp.format").autoformat = opts.autoformat
	-- setup formatting and keymaps
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local buffer = args.buf
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			require("plugins.lsp.format").on_attach(client, buffer)
			require("plugins.lsp.keymaps").on_attach(client, buffer)
			-- require("plugins.lsp.extras.config").on_attach(client, buffer)
		end,
	})
	return opts
end

function M.diagnostics(opts)
	local icons = {
		Error = " ",
		Warn = " ",
		Hint = " ",
		Info = " ",
	}
	-- diagnostics
	for name, icon in pairs(icons) do
		name = "DiagnosticSign" .. name
		vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
	end
	vim.diagnostic.config(opts.diagnostics)
	return opts
end

function M.mason_setup(opts)
	local servers = opts.servers
	local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

	-- don't touch this functions parameters
	local function server_setup(server)
		local server_opts = servers[server] or {}
		server_opts.capabilities = capabilities
		if opts.setup[server] then
			if opts.setup[server](server, server_opts) then
				return
			end
		elseif opts.setup["*"] then
			if opts.setup["*"](server, server_opts) then
				return
			end
		end
		require("lspconfig")[server].setup(server_opts)
	end

	-- Mason setup
	local mlsp = require("mason-lspconfig")
	local available = mlsp.get_available_servers()

	for server, server_opts in pairs(servers) do
		if server_opts then
			server_opts = server_opts == true and {} or server_opts
			-- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
			if server_opts.mason == false or not vim.tbl_contains(available, server) then
				server_setup(server)
			else
				M.ensure_installed[#M.ensure_installed + 1] = server
			end
		end
	end

	require("mason-lspconfig").setup({ ensure_installed = M.ensure_installed })
	require("mason-lspconfig").setup_handlers({ server_setup })
end

function M.setup(opts)
	M.on_attach(opts)
	M.diagnostics(opts)
	M.mason_setup(opts)
	-- M.filterNotifications()
end

return M
