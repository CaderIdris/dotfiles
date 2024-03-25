local function map(m, k, v, c)
	s = s or true
	c = c or { silent = true, noremap = true }
	vim.keymap.set(m, k, v, c)
end

map('n', '<Leader><Up>', 'zt')
map('n', '<Leader><Down>', 'zb')
map('n', '<Leader><Left>', 'zz')
map('n', '<Leader><Right>', 'zz')

map('n', '<A-j>', ':move +1<CR>')
map('n', '<A-k>', ':move -2<CR>')
map('x', '<A-j>', [[:move '>+1<CR>gv=gv']])
map('x', '<A-k>', [[:move '<-2<CR>gv=gv]])

map('n', '<Leader>xx', function() vim.diagnostic.open_float() end)
map('n', '<Leader>xw', function() vim.diagnostic.setloclist() end)
