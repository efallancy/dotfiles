return {
  {
    "preservim/nerdtree",
    config = function() 

      vim.keymap.set("n", "<C-n>", "<cmd>NERDTreeToggle<cr>", { noremap = true, silent = true })

    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    config = function() 
      require("nvim-treesitter.configs").setup({
        ensure_installed = { 
          "clojure",
          "css",
          "html",
          "javascript",
          "typescript",
          "json",
          "markdown",
          "lua",
          "bash",
          "gitignore",
          "gitcommit",
          "yaml"
        },
        highlight = { enable = true },
        indent = { enable = true }
      })
    end
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function() 
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      require("mason-lspconfig").setup({
        ensure_installed = {
          "clojure_lsp",
          "eslint",
          "html",
          "tsserver"
        }
      })

      require("mason-lspconfig").setup_handlers {
        function (server_name)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities
          })
        end
      }
      
    end
  },
  {
    "mfussenegger/nvim-lint",
    event = {
      "BufReadPre",
      "BufNewFile"
    },
    config = function()
      local lint = require("lint")

      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })

      vim.keymap.set("n", "<leader>l", function()
        lint.try_lint()
      end, { desc = "Trigger linting for current file" })
    end
  },
  {
    "stevearc/conform.nvim",
    config = function() 
      require("conform").setup({
        formatters_by_ft = {
          javascript = { "prettier" },
          typescript = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          svelte = { "prettier" },
          css = { "prettier" },
          html = { "prettier" },
          json = { "prettier" },
          yaml = { "prettier" },
          markdown = { "prettier" },
          graphql = { "prettier" }
        }
      })

      vim.api.nvim_create_user_command("Format", function(args)
        local range = nil
        if args.count ~= -1 then
          local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
          range = {
            start = { args.line1, 0 },
            ["end"] = { args.line2, end_line:len() },
          }
        end
        require("conform").format({ async = true, lsp_fallback = true, range = range })
      end, { range = true })

    end
  },
  "neovim/nvim-lspconfig",
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp", event = "InsertEnter" },
      { "hrsh7th/cmp-buffer", event = "InsertEnter" },
      { "hrsh7th/cmp-path", event = "InsertEnter" },
      { "hrsh7th/cmp-cmdline", event = "InsertEnter" },
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        snippet = {
          expand = function(args)
            vim.snippet.expand(args.body)
          end
        },
        mapping = {
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              else
                fallback()
              end
            end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { "i", "s" }),
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "buffer" }
        }
      })
    end
  },
  {
    "nvim-telescope/telescope.nvim", tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
    end
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup()
    end
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require("tokyonight").setup()

      vim.cmd[[colorscheme tokyonight]]
    end
  }
}
