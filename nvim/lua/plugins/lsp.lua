return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "folke/neodev.nvim", opts = {} },
		"b0o/schemastore.nvim",
	},
	config = function()
		require("neodev").setup({})

		local server_configs = {
			jsonls = {
				settings = {
					json = {
						schemas = require("schemastore").json.schemas(),
						validate = { enable = true },
					},
				},
			},
			yamlls = {
				settings = {
					yaml = {
						schemaStore = {
							-- You must disable built-in schemaStore support if you want to use
							-- this plugin and its advanced options like `ignore`.
							enable = false,
							-- Avoid TypeError: Cannot read properties of undefined (reading 'length')
							url = "",
						},
						schemas = require("schemastore").yaml.schemas(),
					},
				},
			},
			cmake = {
				settings = {
					CMake = {
						filetypes = { "cmake", "CMakeLists.txt" },
					},
				},
			},
			rust_analyzer = {},
			tsserver = {},
			pyright = {},
			lua_ls = {},
			clangd = {},
			taplo = {},
			html = {},
			cssls = {},
			cssmodules_ls = {},
			graphql = {},

		}

		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local default_config = {
			capabilities = capabilities,
		}
		for k, v in pairs(server_configs) do
			local config = vim.tbl_deep_extend("force", default_config, v)
			require("lspconfig")[k].setup(config)
		end
	end,
}
