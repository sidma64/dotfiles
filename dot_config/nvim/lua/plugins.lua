return {
  -- Lua
  {
    "folke/persistence.nvim",
    opts = {},
    config = function(_, opts)
      local persistence = require("persistence")
      persistence.setup(opts)

      -- load the session for the current directory
      vim.keymap.set("n", "<leader>qs", function()
        persistence.load()
      end)

      -- select a session to load
      vim.keymap.set("n", "<leader>qS", function()
        persistence.select()
      end)

      -- load the last session
      vim.keymap.set("n", "<leader>ql", function()
        persistence.load({ last = true })
      end)

      -- stop Persistence => session won't be saved on exit
      vim.keymap.set("n", "<leader>qd", function()
        persistence.stop()
      end)
    end,
  },
  { "akinsho/toggleterm.nvim", version = "*", opts = {} },
  {
    "lewis6991/gitsigns.nvim",
    opts = {},
  },
  {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      require("mini.ai").setup()
      require("mini.surround").setup()
      require("mini.icons").setup()
      require("mini.basics").setup()
      require("mini.bracketed").setup()
      require("mini.statusline").setup()
      require("mini.comment").setup()
    end,
  },
  -- {
  --   "aaronik/treewalker.nvim",
  --
  --   -- The following options are the defaults.
  --   -- Treewalker aims for sane defaults, so these are each individually optional,
  --   -- and setup() does not need to be called, so the whole opts block is optional as well.
  --   opts = {
  --     -- Whether to briefly highlight the node after jumping to it
  --     highlight = true,
  --
  --     -- How long should above highlight last (in ms)
  --     highlight_duration = 250,
  --
  --     -- The color of the above highlight. Must be a valid vim highlight group.
  --     -- (see :h highlight-group for options)
  --     highlight_group = "CursorLine",
  --   },
  --   config = function(_, opts)
  --     require("treewalker").setup(opts)
  --     -- movement
  --     vim.keymap.set({ "n", "v" }, "<C-k>", "<cmd>Treewalker Up<cr>", { silent = true })
  --     vim.keymap.set({ "n", "v" }, "<C-j>", "<cmd>Treewalker Down<cr>", { silent = true })
  --     vim.keymap.set({ "n", "v" }, "<C-h>", "<cmd>Treewalker Left<cr>", { silent = true })
  --     vim.keymap.set({ "n", "v" }, "<C-l>", "<cmd>Treewalker Right<cr>", { silent = true })
  --
  --     -- swapping
  --     vim.keymap.set("n", "<C-S-k>", "<cmd>Treewalker SwapUp<cr>", { silent = true })
  --     vim.keymap.set("n", "<C-S-j>", "<cmd>Treewalker SwapDown<cr>", { silent = true })
  --     vim.keymap.set("n", "<C-S-h>", "<cmd>Treewalker SwapLeft<cr>", { silent = true })
  --     vim.keymap.set("n", "<C-S-l>", "<cmd>Treewalker SwapRight<cr>", { silent = true })
  --   end,
  -- },
  {
    "stevearc/oil.nvim",
    opts = {},
  },
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function(_, opts)
      require("telescope").setup(opts)
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = "dark" -- or "light" for light mode
      vim.cmd([[colorscheme gruvbox]])
    end,
  },
  -- {
  --   "akinsho/bufferline.nvim",
  --   version = "*",
  --   dependencies = "nvim-tree/nvim-web-devicons",
  --   opts = { options = { seperator_style = "slant" } },
  --   config = function(_, opts)
  --     vim.opt.termguicolors = true
  --     require("bufferline").setup(opts)
  --   end,
  -- },
  { "rafamadriz/friendly-snippets" },
  {
    "saghen/blink.cmp",
    version = "*",
    opts = {
      keymap = { preset = "default" },
      sources = {
        -- add lazydev to your completion providers
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
        },
      },
      signature = { enabled = true },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        ensure_installed = {},
        modules = {},
        incremental_selection = {
          enable = false,
          keymaps = {
            init_selection = "gnn", -- set to `false` to disable one of the mappings
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decrecental = "grm",
          },
        },
        auto_install = true,
        sync_install = true,
        ignore_install = {},
        highlight = { enable = true, additional_vim_regex_highlighting = false },
        indent = { enable = true },
      })
    end,
  },
  { "williamboman/mason.nvim", opts = {}, dependencies = { "williamboman/mason-lspconfig.nvim" } },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
    config = function()
      local configs = {
        ["lua_ls"] = {},
      }
      local default_config = {}
      for name, config in pairs(configs) do
        config = vim.tbl_deep_extend("force", default_config, config)
        config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
        require("lspconfig")[name].setup(config)
      end
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "isort", "black" },
        -- You can customize some of the format options for the filetype (:help conform.format)
        rust = { "rustfmt", lsp_format = "fallback" },
        -- Conform will run the first available formatter
        javascript = { "prettierd", "prettier", stop_after_first = true },
      },
    },
  },
  { "tpope/vim-sleuth" },
}
