-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")

-- EXAMPLE
local servers = { "html", "cssls", "omnisharp", "gopls", "ts_ls", "lua_ls" }
local nvlsp = require("nvchad.configs.lspconfig")

local configs = {
	["omnisharp"] = {
		cmd = { vim.fn.stdpath("data") .. "/mason/bin/omnisharp" },

		enable_ms_build_load_projects_on_demand = false,

		enable_editorconfig_support = true,

		enable_roslyn_analysers = true,

		enable_import_completion = true,

		organize_imports_on_format = true,

		enable_decompilation_support = true,

		analyze_open_documents_only = false,

		filetypes = { "cs", "vb", "csproj", "sln", "slnx", "props", "csx", "targets" },
	},
}

-- lsps with default config
for _, lsp in ipairs(servers) do
	local default_config = {
		on_attach = nvlsp.on_attach,
		on_init = nvlsp.on_init,
		capabilities = nvlsp.capabilities,
	}
	local config = vim.tbl_deep_extend("force", default_config, configs[lsp] or {})
	lspconfig[lsp].setup(config)
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
