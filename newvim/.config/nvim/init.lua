vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
require("lspconfig").pyright.setup({})
require("lspconfig").bashls.setup({ filetypes = { "sh", "zsh" } })
require("lspconfig").ts_ls.setup({})
require("lspconfig").pylsp.setup({})
require("lspconfig").gopls.setup({})
require("lspconfig").clangd.setup({})
require("lspconfig").lua_ls.setup({
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc") then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          -- Depending on the usage, you might want to add additional paths here.
          "${3rd}/luv/library",
          "${3rd}/busted/library",
        },
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
        -- library = vim.api.nvim_get_runtime_file("", true)
      },
    })
  end,
  settings = {
    Lua = {},
  },
})

require("nvim-treesitter.configs").setup({
  auto_install = true,
  sync_install = false,
  modules = {},
  ensure_installed = {},
  ignore_install = {},
  highlight = { enable = true },
})

vim.o.shiftwidth = 4
vim.o.tabstop = 4
