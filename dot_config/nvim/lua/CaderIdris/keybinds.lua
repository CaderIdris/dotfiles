local function map(m, k, v, s)
	s = s or true
	vim.keymap.set(m, k, v, { silent = s })
end

map('n', '<Leader><Up>', 'zt')
map('n', '<Leader><Down>', 'zb')
map('n', '<Leader><Left>', 'zz')
map('n', '<Leader><Right>', 'zz')

map('n', '<A-j>', ':move +1<CR>')
map('n', '<A-k>', ':move -2<CR>')
map('x', '<A-j>', [[:move '>+1<CR>gv=gv']])
map('x', '<A-k>', [[:move '<-2<CR>gv=gv]])

map('n', '<Leader>t', ':Tagbar<CR>')
map('n', '<Leader>o', ':NvimTreeToggle<CR>')
map('n', '<Leader>f', ':Telescope find_files<CR>') 
map('n', '<Leader>g', ':Telescope grep_string<CR>') 

map('n', '<Leader><Leader>w', ':HopWord<CR>')
map('n', '<Leader><Leader>p', ':HopPattern<CR>')
map('n', '<Leader><Leader>l', ':HopLine<CR>')
