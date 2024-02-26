local g = vim.g
local o = vim.o
local a = vim.api

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
o.updatetime = 2000

o.termguicolors = true
a.nvim_command('hi Error ctermfg=Black')
a.nvim_command('hi SpellBad ctermfg=Black')
a.nvim_command('hi SpellCap ctermfg=Black')
a.nvim_command('hi SpellLocal ctermfg=Black')

o.foldmethod = 'expr'
o.foldexpr = 'nvim_treesitter#fold_expr()'
o.foldnestmax = 10
o.foldenable = true
o.foldlevel = 10

o.spell = true
o.spelllang = "en_gb,cy"

o.undofile = true

o.titlestring = "%t"
o.title = true

g.mapleader = " "
g.maplocalleader = " "

a.nvim_create_autocmd(
    {
        "BufNewFile",
        "BufRead",
    },
    {
        pattern = "*.py",
        callback = function()
		o.colorcolumn = "80"
        end
    }
)

a.nvim_create_autocmd(
    {
        "BufNewFile",
        "BufRead",
    },
    {
        pattern = "*.just,justfile",
        callback = function()
		a.nvim_command('set filetype=make')
        end
    }
)

a.nvim_create_autocmd(
    {
        "CursorHold"
    },
    {
        callback = function()
		vim.diagnostic.open_float()
        end
    }
)
