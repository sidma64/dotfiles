return {
	["<F2>"] = { MiniFiles.open, "Open mini.files" },
	["<leader>"] = {
		s = { "<cmd>Neotree<cr>", "Open neo-tree.nvim" },
		w = { vim.cmd.write, "Write" },
		g = { require("telescope.builtin").live_grep, "Live grep" },
		f = { require("telescope.builtin").find_files, "Find files" },
		h = { require("telescope.builtin").help_tags, "Help tags" },
		b = { require("telescope.builtin").buffers, "Find buffers" },
		F = {
			function()
				require("conform").format({ bufnr = vim.api.nvim_get_current_buf() })
			end,
			"Format with conform.nvim",
		},
		D = { vim.lsp.buf.declaration, "Jump to declaration" },
		d = { vim.lsp.buf.definition, "Jump to definition" },
		a = { vim.lsp.buf.code_action, "Code action" },
		l = { vim.lsp.buf.hover, "Hover LSP" },
		r = { vim.lsp.buf.rename, "Rename symbol" },
	},
	g = {
		t = { vim.lsp.buf.type_definition, "Jump to type definition"},
		d = { vim.lsp.buf.definition, "Goto definition" },
		r = { vim.lsp.buf.references, "Goto references" },
		D = { vim.lsp.buf.declaration, "Goto declaration" },
	},
	K = { vim.lsp.buf.hover, "Hover LSP" },
}
