require('plugins')

-- comma as leader
vim.g.mapleader = ","
vim.g.maplocalleader = ","
local o = vim.o

require('mylsp')
require('nvimcmp')

-- nvim-treesitter
require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true,
    },
}

require('nvim-autopairs').setup {}

vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd Filetype html setlocal ts=2 sw=2 expandtab
    autocmd Filetype jsx setlocal ts=2 sw=2 expandtab
    autocmd Filetype js setlocal ts=2 sw=2 expandtab
  augroup end
]]

o.termguicolors = true
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true
o.smartcase = true
o.ignorecase = true
o.number = true
o.numberwidth = 4
o.autoindent = true
o.cindent = true

local ok, _ = pcall(vim.cmd, 'colorscheme gruvbox')
local okk, _ = pcall(vim.cmd, 'so C:\\Users\\Petri\\AppData\\Local\\nvim\\legacy.vim')
