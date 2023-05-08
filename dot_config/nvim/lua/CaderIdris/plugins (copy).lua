return require('packer').startup(
	{
		function(use)
			-- Package manager
			use('wbthomason/packer.nvim')

			-- Required packages
			-- Used for telescope, gitsigns
			use('nvim-lua/plenary.nvim')

			-- Statusbar and lsp progressbar
			use(
				{
					'nvim-lualine/lualine.nvim',
					event = 'BufEnter',
				},
				{
					'j-hui/fidget.nvim',
					after='lualine.nvim',
					config = function()
						require('fidget').setup()
					end,
				}
			)

			-- Highlight colours
			use(
				{
					'norcalli/nvim-colorizer.lua',
					event = 'CursorHold',
					config = function()
						require('colorizer').setup()
					end,
				}
			)

			-- Git highlighting in sidebar
			use(
				{
					'lewis6991/gitsigns.nvim',
					event = 'BufRead',
				}
			)

			-- File tree
			use(
				{
					'kyazdani42/nvim-tree.lua',
					event = 'CursorHold',
				}
			)

			-- Telescope
			use(
				{
					{
						'nvim-telescope/telescope.nvim',
						event = 'CursorHold',
					},
					{
						'nvim-telescope/telescope-fzf-native.nvim',
						after = 'telescope.nvim',
						run = 'make',
						config = function()
							require('telescope').load_extension('fzf')
						end,
					},
					{
						'nvim-telescope/telescope-symbols.nvim',
						after = 'telescope.nvim'
					}
				}
			)

			-- Easymotion but for nvim
			use(
				{
					'phaazon/hop.nvim',
					event = 'BufRead',
				}
			)

			-- Smooth scrolling motion
			use(
				{
					'karb94/neoscroll.nvim',
					event = 'WinScrolled',
					config = function()
						require('neoscroll').setup({ hide_cursor = false })
					end,
				}
			)

			-- Surround commands
			use(
				{
					'tpope/vim-surround',
					event = 'BufRead',
					requires = {
						{
							'tpope/vim-repeat',
							event = 'BufRead'
						}
					}
				}
			)

			-- More word objects
			use(
				{
					'wellle/targets.vim',
					event = 'BufRead'
				}
			)

			-- Split and join single/multi line statements
			use(
				{
					'AndrewRadev/splitjoin.vim',
					event = "CursorHold"
				}
			)

			use(
				{
					'neovim/nvim-lspconfig',
					event = 'BufRead',
					requires = {
						{
							'hrsh7th/cmp-nvim-lsp',
						},
					},
				}
			)

			use(
				{
					'jose-elias-alvarez/null-ls.nvim',
					event = 'BufRead',
				}
			)

			use(
				{
					{
						'hrsh7th/nvim-cmp',
						event = 'InsertEnter',
						requires = {
							{
								'L3MON4D3/LuaSnip',
								event = 'InsertEnter',
								requires = {
									{
										'rafamadriz/friendly-snippets',
										event = 'CursorHold',
									},
								},
							},
						},
					},
					{ 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
					{ 'hrsh7th/cmp-path', after = 'nvim-cmp' },
					{ 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
				}
			)

			-- NOTE: nvim-autopairs needs to be loaded after nvim-cmp, so that <CR> would work properly
			use(
				{
					'windwp/nvim-autopairs',
					event = 'InsertCharPre',
					after = 'nvim-cmp',
				}
			)
		end,
		config = {
			display = {
				open_fn = function()
					return require('packer.util').float({ border = 'single' })
				end,
			},
		},
	}    
)



