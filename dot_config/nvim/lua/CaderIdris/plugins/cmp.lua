return {
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	{
		"andersevenrud/cmp-tmux"
	},
	{
		"petertriho/cmp-git"
	},
	{
		"hrsh7th/cmp-calc"
	},
	{
		"ray-x/cmp-treesitter"
	},
	{
		"lukas-reineke/cmp-under-comparator"
	},
	{
		"hrsh7th/cmp-nvim-lsp-document-symbol"
	},
	{
		"chrisgrieser/cmp-nerdfont"
	},
	{
		"kdheepak/cmp-latex-symbols"
	},
	{
		"saadparwaiz1/cmp_luasnip"
	},
	{
		"hrsh7th/cmp-emoji"
	},
	{
		"hrsh7th/cmp-nvim-lsp"
	},
	{
		"hrsh7th/cmp-buffer"
	},
	{
		"hrsh7th/cmp-path"
	},
	{
		"hrsh7th/cmp-cmdline"
	},
	{
		"micangl/cmp-vimtex"
	},
	{
		"rafamadriz/friendly-snippets"
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			cmp.setup(
				{
					snippet = {
						expand = function(args)
							require('luasnip').lsp_expand(args.body)
						end,
					},
					sources = cmp.config.sources(
						{
							{ name = 'nvim_lsp' },
							{ name = 'luasnip' },
							{ name = 'treesitter' },
							{ name = 'neorg' },
							{ name = 'buffer' },
							{ name = 'calc' },
							{ name = 'latex_symbols' },
							{ name = 'vimtex' },
							{
								name = 'tmux',
								option = {
									all_panes = false,
									capture_history = false,
								}
							},
							{ name = 'path' },
							{ name = 'emoji' },
							{ name = 'nerdfont' }
						}
					),
					mapping = cmp.mapping.preset.insert(
						{
							["<Tab>"] = cmp.mapping.select_next_item(),
							["<S-Tab>"] = cmp.mapping.select_prev_item(),
							["<CR>"] = cmp.mapping.confirm({select = false})
						}
					),
					sorting = {
						comparators = {
							cmp.config.compare.offset,
							cmp.config.compare.exact,
							cmp.config.compare.score,
							require("cmp-under-comparator").under,
							cmp.config.compare.kind,
							cmp.config.compare.sort_text,
							cmp.config.compare.length,
							cmp.config.compare.order,
						},
					},
				}
			)
			cmp.setup.filetype(
				'gitcommit',
				{
					sources = cmp.config.sources(
						{
							{ name = 'git' },
						}, {
							{ name = 'buffer' },
						}
					)
				}
			)

			cmp.setup.filetype(
				{'sql', 'mysql', 'plsql'},
				{
					sources = cmp.config.sources(
						{
							{ name = 'vim-dadbod-completion' },
						}
					)
				}
			)

			cmp.setup.cmdline(
				{ '/', '?' },
				{
					mapping = cmp.mapping.preset.cmdline(),
					sources = {
						{
							{ name = 'nvim_lsp_document_symbol' }
						},
						{
							{ name = 'buffer' }
						}
					}
				}
			)

			cmp.setup.cmdline(
				':',
				{
					mapping = cmp.mapping.preset.cmdline(),
					sources = cmp.config.sources(
						{
							{ name = 'path' }
						}, {
							{ name = 'cmdline' }
						}
					),
					matching = { disallow_symbol_nonprefix_matching = false }
				}
			)
		end,
	}
}
