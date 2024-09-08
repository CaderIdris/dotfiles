lsp_servers = {
	'bashls',
	'cssls',
	'html',
	'jsonls',
	'arduino_language_server',
	'eslint',
	'marksman',
	'rust_analyzer',
	'clangd',
	'lua_ls',
	'pyright',
	'taplo',
	'yamlls',
	'texlab',
	'yamlls',
	'taplo',
	'esbonio',
	'dockerls',
	'ruff_lsp',
	'htmx',
	'jinja_lsp'
	--'gleam'
}

return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup {
				ensure_installed = lsp_servers
			}
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			for _, server in ipairs(lsp_servers) do
				require("lspconfig")[server].setup(
					{
					}
				)
			end
		end,
	},
}
