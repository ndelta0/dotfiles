local fts = require("formatter.filetypes")

require("formatter").setup({
	log_level = 2,
	filetype = {
		["*"] = { fts.any.remove_trailing_whitespace },
		c = { fts.c.clangformat },
		cmake = { fts.cmake.cmakeformat },
		cpp = { fts.cpp.clangformat },
		cs = { fts.cs.dotnetformat },
		go = { fts.go.gofmt },
		html = { fts.html.prettierd },
		json = { fts.json.prettierd },
		jsonc = { fts.json.prettierd },
		latex = { fts.latex.latexindent },
		lua = { fts.lua.stylua },
		markdown = { fts.markdown.prettierd },
		python = { fts.python.black },
		rust = { fts.rust.rustfmt },
		sh = { fts.sh.shfmt },
		toml = { fts.toml.taplo },
		yaml = { fts.yaml.prettierd },
        zsh = { fts.zsh.beautysh }
	},
})

vim.cmd([[
augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost * FormatWrite
augroup END
]])
