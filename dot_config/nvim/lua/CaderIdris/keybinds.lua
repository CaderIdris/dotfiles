local function map(m, k, v, c)
	s = s or true
	c = c or { silent = true, noremap = true }
	vim.keymap.set(m, k, v, c)
end

local wk = require("which-key")
wk.add(
	{
		{ "<leader><Down>", "zb", desc = "Bottom of window to cursor" },
		{ "<leader><Enter>", ":noh<cr>", desc = "Clear search highlighting" },
		{ "<leader><Left>", "zz", desc = "Center of window to cursor" },
		{ "<leader><Right>", "zz", desc = "Center of window to cursor" },
		{ "<leader><Up>", "zt", desc = "Top of window to cursor" },
		{ "<leader>x", group = "Diagnostics" },
		{ "<leader>xw", function() vim.diagnostic.setloclist() end, desc = "All issues" },
		{ "<leader>xx", function() vim.diagnostic.open_float() end, desc = "Issue at cursor" },
	}
)
map('n', '<A-J>', ':move +1<CR>')
map('n', '<A-K>', ':move -2<CR>')
map('x', '<A-j>', [[:move '>+1<CR>gv=gv']])
map('x', '<A-K>', [[:move '<-2<CR>gv=gv]])
