return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform will run multiple formatters sequentially
			python = { "isort", "black" },
			javascript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			typescript = { "prettier" },
			cpp = { "clang_format" },
			c = { "clang_format" },
			go = { "gofmt" },
			sh = { "shfmt" },
			java = { "google-java-format" },
			prisma = { "prettier", "prettierd" },
			json = {"prettier", "prettierd"},
			rust = {"rustfmt"}
		},
	},
}
