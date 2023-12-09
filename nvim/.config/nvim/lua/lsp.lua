require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

require("mason-lspconfig").setup({
	ensure_installed = {
		"cmake",
		"pylsp",
		"gopls",
		"lua_ls",
		"rust_analyzer",
		"clangd",
		"autotools_ls",
		"asm_lsp",
		"bashls",
		"omnisharp",
		"dockerls",
		"docker_compose_language_service",
		"jsonls",
		"marksman",
		"taplo",
		"yamlls",
	},
})

local lspconfig = require("lspconfig")

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<space>f", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)
end

lspconfig.asm_lsp.setup({
    on_attach = on_attach,
})

lspconfig.autotools_ls.setup({
    on_attach = on_attach,
})

lspconfig.bashls.setup({
    on_attach = on_attach,
})

lspconfig.clangd.setup({
    on_attach = on_attach,
})

lspconfig.cmake.setup({
	on_attach = on_attach,
})

lspconfig.docker_compose_language_service.setup({
    on_attach = on_attach,
})

lspconfig.dockerls.setup({
    on_attach = on_attach,
})

lspconfig.gopls.setup({
	on_attach = on_attach,
})

lspconfig.jsonls.setup({
    on_attach = on_attach,
})

lspconfig.lua_ls.setup({
	on_attach = on_attach,
})

lspconfig.marksman.setup({
    on_attach = on_attach,
})

lspconfig.omnisharp.setup({
    on_attach = on_attach,
})

lspconfig.pylsp.setup({
	on_attach = on_attach,
})

lspconfig.rust_analyzer.setup({
	on_attach = on_attach,
})

lspconfig.taplo.setup({
	on_attach = on_attach,
})

lspconfig.yamlls.setup({
	on_attach = on_attach,
})
