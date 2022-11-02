return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'morhetz/gruvbox'
    use 'zefei/vim-colortuner'
    use 'nvim-treesitter/nvim-treesitter'
    use 'windwp/nvim-autopairs'
    use 'prabirshrestha/vim-lsp'
    use 'prabirshrestha/asyncomplete.vim'
    use 'prabirshrestha/asyncomplete-lsp.vim'
    use 'mattn/vim-lsp-settings'
end)
