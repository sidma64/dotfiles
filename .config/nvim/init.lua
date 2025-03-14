-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
require("keymaps")
vim.g.maplocalleader = " "
vim.g.mapleader = " "
-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  checker = { enabled = false },
  ui = {
    icons = {
      cmd = "⌘",
      config = "🧰",
      ft = "📂",
      init = "⚙️ ",
      keys = "🔑",
      plugin = "🔌",
      runtime = "💻",
      require = "🌙",
      source = "📁",
      start = "🚀",
      task = "📌",
      lazy = "💤",
      event = "⚡",
      loaded = "✔️ ",
      favorite = "⭐",
      not_loaded = "❌",
      import = "📥",
    },
  },
})
vim.opt.termguicolors = true
vim.opt.number = true
-- vim.o.clipboard = "unnamedplus"
vim.cmd([[colorscheme catppuccin]])



if vim.g.neovide then
  vim.o.guifont = "JetBrains Mono,Noto_Color_Emoji:h10"
  vim.g.neovide_opacity = 0.99
  vim.g.neovide_theme = 'auto'
  vim.g.neovide_cursor_vfx_mode = "pixiedust"
  vim.g.neovide_cursor_animation_length = 0.04
  vim.g.neovide_cursor_trail_size = 0.1
end

-- if vim.g.neovide then
--   vim.g.terminal_color_0 = "#45475a"
--   vim.g.terminal_color_1 = "#f38ba8"
--   vim.g.terminal_color_2 = "#a6e3a1"
--   vim.g.terminal_color_3 = "#f9e2af"
--   vim.g.terminal_color_4 = "#89b4fa"
--   vim.g.terminal_color_5 = "#f5c2e7"
--   vim.g.terminal_color_6 = "#94e2d5"
--   vim.g.terminal_color_7 = "#bac2de"
--   vim.g.terminal_color_8 = "#585b70"
--   vim.g.terminal_color_9 = "#f38ba8"
--   vim.g.terminal_color_10 = "#a6e3a1"
--   vim.g.terminal_color_11 = "#f9e2af"
--   vim.g.terminal_color_12 = "#89b4fa"
--   vim.g.terminal_color_13 = "#f5c2e7"
--   vim.g.terminal_color_14 = "#94e2d5"
--   vim.g.terminal_color_15 = "#a6adc8"
-- end
-- Hyprlang LSP
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.hl", "hypr*.conf" },
  callback = function(event)
    print(string.format("starting hyprls for %s", vim.inspect(event)))
    vim.lsp.start({
      name = "hyprlang",
      cmd = { "hyprls" },
      root_dir = vim.fn.getcwd(),
    })
  end,
})
