local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup({
	function(use)
		use 'wbthomason/packer.nvim'

		-- Required for telescope and gitsigns
		use 'nvim-lua/plenary.nvim'

		-- Required by some plugins for symbols
		use 'kyazdani42/nvim-web-devicons'

		-- Statusbar
		use 'nvim-lualine/lualine.nvim'
		require('lualine').setup {
			options = { theme = 'gruvbox_dark' }
		}

		-- Fidget. Shows lsp progress
		use 'j-hui/fidget.nvim'
		require('fidget').setup()

		-- Treesitter
		use {
			'nvim-treesitter/nvim-treesitter',
			run = function()
				require('nvim-treesitter.install').update({ with_sync = true })
			end,
		}
		use 'p00f/nvim-ts-rainbow'
		require('nvim-treesitter.configs').setup {
			ensure_installed = {"python", "lua", "rust", "bash", "markdown", "json", "bibtex", "latex", "html", "yaml", "toml"},
			rainbow = {
				enable = true,
				extended_mode = true,
				max_file_lines = nil
			},
			auto_install = true,
			highlight = {
				enable = true,
			},
		}


		-- Colour things in
		use 'norcalli/nvim-colorizer.lua'
		require('colorizer').setup()

		-- Gitsigns
		use 'lewis6991/gitsigns.nvim'
		require('gitsigns').setup()

		-- File tree
		use 'kyazdani42/nvim-tree.lua'
		require('nvim-tree').setup()

		--  Telescope
		use 'nvim-telescope/telescope.nvim'
		use 'nvim-telescope/telescope-fzf-native.nvim'
		use 'nvim-telescope/telescope-symbols.nvim'

		-- EasyNavigator replacement
		use 'phaazon/hop.nvim'
		require('hop').setup()

		-- Better scrolling
		use 'karb94/neoscroll.nvim'

		-- More surround commands
		use 'tpope/vim-repeat'
		use 'tpope/vim-surround'

		-- More word objects
		use 'AndrewRadev/splitjoin.vim'

		-- Autopairs
		use 'windwp/nvim-autopairs'

		-- Tagbar
		use 'preservim/tagbar'

		-- Jupyter integration 
		use 'untitled-ai/jupyter_ascending.vim'
		vim.g.jupyter_ascending_python_executable = 'python3'

		-- Emojis
		use 'junegunn/vim-emoji'

		-- Markdown Preview
		use 'euclio/vim-markdown-composer'
		vim.g.markdown_composer_port = '8001'

		-- Theme
		use 'ellisonleao/gruvbox.nvim'
		require("gruvbox").setup {
			undercurl = true,
			underline = true,
			bold = true,
			italic = false,
		}
		vim.cmd('set background=dark')
		vim.cmd('colorscheme gruvbox')

		-- LSP
		use 'neovim/nvim-lspconfig'
		local lspconfig = require('lspconfig')
		use 'williamboman/nvim-lsp-installer'
		require('nvim-lsp-installer').setup({ automatic_installation = true })
		use 'ms-jpq/coq_nvim'
		use 'ms-jpq/coq.artifacts'
		use 'ms-jpq/coq.thirdparty'

		use 'dense-analysis/ale'



		vim.g.coq_settings = { auto_start = true }

		local server = { 'bashls', 'cssls', 'html', 'jsonls', 'arduino_language_server', 'clangd', 'eslint', 'jedi_language_server', 'marksman', 'rust_analyzer', 'sumneko_lua', 'texlab', 'yamlls', 'pyright', 'taplo', 'r_language_server', 'esbonio', 'dockerls' }
		for _, lsp in ipairs(server) do
			lspconfig[lsp].setup(require('coq').lsp_ensure_capabilities({}))
		end
	end,

	config = {
		display = {
			open_fn = function()
				return require('packer.util').float({ border = 'single' })
			end,
			},
		},
})
