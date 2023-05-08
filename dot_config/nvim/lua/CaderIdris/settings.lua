local g = vim.g
local o = vim.o

o.incsearch = true
o.ignorecase = true
o.smartcase = true

o.autoindent = true
o.ruler = true
o.number = true
o.list = true
o.listchars = 'tab:▸ '
o.cul = true
o.rnu = true

o.termguicolors = true
vim.api.nvim_command('hi Error ctermfg=Black')
vim.api.nvim_command('hi SpellBad ctermfg=Black')
vim.api.nvim_command('hi SpellCap ctermfg=Black')
vim.api.nvim_command('hi SpellLocal ctermfg=Black')

o.foldmethod = 'indent'
o.foldnestmax = 10
o.foldenable = true
o.foldlevel = 10
--vim.api.nvim_create_autocmd({'BufEnter'}, {pattern=command = "set foldenable"})

o.spell = true
o.spelllang = "en_gb,cy"

o.undofile = true

o.titlestring = "%t"
o.title = true

g.mapleader = " "
g.maplocalleader = " "

