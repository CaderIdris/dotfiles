plugin_files = {
	require('CaderIdris.plugins.ui'),
	require('CaderIdris.plugins.theme'),
	require('CaderIdris.plugins.treesitter'),
	require('CaderIdris.plugins.telescope'),
	require('CaderIdris.plugins.insert-mode-features'),
	require('CaderIdris.plugins.oil'),
	require('CaderIdris.plugins.tagbar'),
	require('CaderIdris.plugins.nvim-tmux'),
	require('CaderIdris.plugins.movement'),
	require('CaderIdris.plugins.neorg'),
	require('CaderIdris.plugins.cmp'),
	require('CaderIdris.plugins.lsp'),
	require('CaderIdris.plugins.neotest'),
	require('CaderIdris.plugins.dap'),
	require('CaderIdris.plugins.neoformat'),
	require('CaderIdris.plugins.silicon'),
	require('CaderIdris.plugins.dadbod'),
	require('CaderIdris.plugins.chatgippity'),
	require('CaderIdris.plugins.iconpicker'),
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
