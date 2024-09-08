plugin_files = {
	require('plugins.ui'),
	require('plugins.theme'),
	require('plugins.treesitter'),
	require('plugins.telescope'),
	require('plugins.insert-mode-features'),
	require('plugins.oil'),
	require('plugins.tagbar'),
	require('plugins.nvim-tmux'),
	require('plugins.hop'),
	require('plugins.neorg'),
	require('plugins.cmp'),
	require('plugins.lsp'),
	require('plugins.neotest'),
	require('plugins.dap'),
	require('plugins.neoformat'),
	require('plugins.silicon'),
	require('plugins.dadbod'),
	require('plugins.chatgippity'),
	require('plugins.iconpicker'),
}

local plugins = {
	{ "nvim-lua/plenary.nvim" },

}

for _, file in ipairs(plugin_files) do
	for _, plugin in ipairs(file) do
		table.insert(plugins, plugin)
	end
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup(plugins, opts)
