vim.cmd([[
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \| PlugInstall --sync | source $MYVIMRC
    \| endif
]])

local plugin = function(name)
	vim.cmd("Plug '" .. name .. "'")
end

vim.cmd("call plug#begin()")

plugin("tpope/vim-sensible")
plugin("lambdalisue/suda.vim")
plugin("tanvirtin/monokai.nvim")
plugin("tpope/vim-commentary")
plugin("mhartington/formatter.nvim")
plugin("nvim-lualine/lualine.nvim")
plugin("nvim-tree/nvim-web-devicons")
plugin("rust-lang/rust.vim")

plugin("williamboman/mason.nvim")
plugin("williamboman/mason-lspconfig.nvim")

plugin("neovim/nvim-lspconfig")
plugin("hrsh7th/cmp-nvim-lsp")
plugin("hrsh7th/cmp-buffer")
plugin("hrsh7th/cmp-path")
plugin("hrsh7th/cmp-cmdline")
plugin("hrsh7th/nvim-cmp")
-- plugin("L3MON4D3/LuaSnip")
plugin("rafamadriz/friendly-snippets")
vim.cmd("Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'}")
plugin("saadparwaiz1/cmp_luasnip")

plugin("windwp/nvim-autopairs")

vim.cmd("call plug#end()")

-- Misc Configs
require("config.misc")

-- LSP
require("config.nvim-cmp")

-- Formatter
require("config.formatter-nvim")

-- Tree
require("config.nvim-tree")
