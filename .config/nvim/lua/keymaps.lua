vim.keymap.set("n", "-", "<cmd>edit %:p:h<cr>", { desc = "Open parent directory" })

vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP actions",
  callback = function(event)
    local opts = { buffer = event.buf }

    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  end,
})

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

if vim.g.neovide then
  vim.keymap.set("", "<F11>", function() vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen end)
end

vim.keymap.set("n", "<C-s>", ":w<CR>") -- Save

-- Window navigation for terminal
vim.keymap.set('t', '<C-w>h', '<C-\\><C-n><C-w>h', { desc = 'Move to left window' })
vim.keymap.set('t', '<C-w>j', '<C-\\><C-n><C-w>j', { desc = 'Move to bottom window' })
vim.keymap.set('t', '<C-w>k', '<C-\\><C-n><C-w>k', { desc = 'Move to top window' })
vim.keymap.set('t', '<C-w>l', '<C-\\><C-n><C-w>l', { desc = 'Move to right window' })

vim.keymap.set('n', '<C-a>', 'ggVG', { desc = 'Select all' })

-- Navigation and window management
vim.keymap.set('n', '<M-h>', '<C-w>h', { desc = 'Move to left window' })
vim.keymap.set('n', '<M-j>', '<C-w>j', { desc = 'Move to bottom window' })
vim.keymap.set('n', '<M-k>', '<C-w>k', { desc = 'Move to top window' })
vim.keymap.set('n', '<M-l>', '<C-w>l', { desc = 'Move to right window' })

-- Window resizing
vim.keymap.set('n', '<M-Left>', '<cmd>vertical resize -2<CR>', { desc = 'Decrease window width' })
vim.keymap.set('n', '<M-Right>', '<cmd>vertical resize +2<CR>', { desc = 'Increase window width' })
vim.keymap.set('n', '<M-Up>', '<cmd>resize +2<CR>', { desc = 'Increase window height' })
vim.keymap.set('n', '<M-Down>', '<cmd>resize -2<CR>', { desc = 'Decrease window height' })

-- Buffer management
vim.keymap.set('n', '<M-,>', '<cmd>bprevious<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<M-.>', '<cmd>bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<M-c>', '<cmd>bdelete<CR>', { desc = 'Close buffer' })
vim.keymap.set('n', '<M-b>', '<cmd>buffers<CR>', { desc = 'List buffers' })

-- Quick actions
vim.keymap.set('n', '<M-s>', '<cmd>write<CR>', { desc = 'Quick save' })
vim.keymap.set('n', '<M-q>', '<cmd>quit<CR>', { desc = 'Quick quit' })
vim.keymap.set('n', '<M-/>>', '<cmd>nohl<CR>', { desc = 'Clear highlights' })

-- Terminal integration
vim.keymap.set('n', '<M-t>', '<cmd>terminal<CR>', { desc = 'Open terminal' })

-- File explorer and fuzzy finding
vim.keymap.set('n', '<M-f>', '<cmd>e .<CR>', { desc = 'Find files' })
