vim.g.mapleader = " "
vim.g.globalstatus = true

require("options")

local lazypath = vim.fn.stdpath("data") .. "elazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
      'glepnir/dashboard-nvim',
      event = 'VimEnter',
      config = function()
        require('dashboard').setup {
          -- config
          config = {
            header = {
              "                                                                              ",
              "=================     ===============     ===============   ========  ========",
              "\\\\ . . . . . . .\\\\   //. . . . . . .\\\\   //. . . . . . .\\\\  \\\\. . .\\\\// . . //",
              "||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\\/ . . .||",
              "|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||",
              "||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||",
              "|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\\ . . . . ||",
              "||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\\_ . .|. .||",
              "|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\\ `-_/| . ||",
              "||_-' ||  .|/    || ||    \\|.  || `-_|| ||_-' ||  .|/    || ||   | \\  / |-_.||",
              "||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \\  / |  `||",
              "||    `'         || ||         `'    || ||    `'         || ||   | \\  / |   ||",
              "||            .===' `===.         .==='.`===.         .===' /==. |  \\/  |   ||",
              "||         .=='   \\_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \\/  |   ||",
              "||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \\/  |   ||",
              "||   .=='    _-'          `-__\\._-'         `-_./__-'         `' |. /|  |   ||",
              "||.=='    _-'                                                     `' |  /==.||",
              "=='    _-'                        N E O V I M                         \\/   `==",
              "\\   _-'                                                                `-_   /",
              " `''                                                                      ``'  ",
            }
          } }
      end,
      dependencies = { { 'nvim-tree/nvim-web-devicons' } }
    },

    { "nvim-lua/plenary.nvim" },

    { "ggandor/lightspeed.nvim" },

    {
      "numToStr/Comment.nvim",
      config = function()
        require('Comment').setup {
          pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
        }
      end,
    },

    -- {
    --   "lewis6991/gitsigns.nvim",
    -- },
    --

    {
      "windwp/nvim-autopairs",
      config = function()
        require('nvim-autopairs').setup()
      end
    },

    {
      "nvim-treesitter/nvim-treesitter",
      version = false,
      build = ":TSUpdate",
      event = "BufReadPost",
      opts = {
        ensure_installed = {
          "bash",
          "css",
          "html",
          "javascript",
          "json",
          "rust",
          "tsx",
          "typescript",
          "yaml",
          "lua",
          "go",
          "markdown",
          "markdown_inline",
          "regex",
          "vim"
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        },
        sync_install = false,
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
      },
      config = function(plugin, opts)
        require("nvim-treesitter.configs").setup(opts)
      end
    },

    { "neovim/nvim-lspconfig" },

    {
      "nvim-telescope/telescope.nvim",
      config = function()
        require("telescope.actions")
        local trouble = require("trouble.providers.telescope")
        require('telescope').setup({
          defaults = {
            mappings = {
              i = { ["<c-t>"] = trouble.open_with_trouble },
              n = { ["<c-t>"] = trouble.open_with_trouble },
            },
            file_ignore_patterns = {
              "node_modules",
              "yarn.lock",
              "deno.lock",
            },
            layout_strategy = "bottom_pane",
            -- layout_config = {
            --   horizontal = { width = 0.9 },
            -- },
          },
        })
        require("telescope").load_extension("harpoon")
        require("telescope").load_extension("live_grep_args")
        require("telescope").load_extension("fzf")
      end,
      tag = '0.1.1',
      dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-live-grep-args.nvim" },
        { "ThePrimeagen/harpoon",                        dependencies = "nvim-lua/plenary.nvim" },
      }
    },

    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

    {
      'projekt0n/github-nvim-theme',
      lazy = false, -- make sure we load this during startup if it is your main colorscheme
      -- priority = 1000, -- make sure to load this before all the other start plugins
      config = function()
        require('github-theme').setup({})

        vim.cmd('colorscheme github_dark_high_contrast')
      end,
    },

    -- AUTOCOMPLETION
    {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "onsails/lspkind.nvim",
        "hrsh7th/cmp-cmdline",
        "windwp/nvim-autopairs",
      },
      config = function()
        local cmp = require("cmp")
        local lspkind = require("lspkind")

        -- Enables autopairs on autocomplete
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        local cmp = require('cmp')
        cmp.event:on(
          'confirm_done',
          cmp_autopairs.on_confirm_done()
        )
        cmp.setup({
          formatting = {
            format = lspkind.cmp_format(),
          },
          snippet = {
            expand = function(args)
              local luasnip = require("luasnip")
              if not luasnip then
                return
              end
              luasnip.lsp_expand(args.body)
            end,
          },
          mapping = cmp.mapping.preset.insert({
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
            -- ["<C-j>"] = cmp.mapping(function()
            -- 	cmp.mapping.abort()
            -- end),
            ["<Tab>"] = cmp.mapping(function(fallback)
              local luasnip = require("luasnip")
              if cmp.visible() then
                cmp.select_next_item()
              elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              else
                fallback()
              end
            end, { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
              local luasnip = require("luasnip")
              if cmp.visible() then
                cmp.select_prev_item()
              elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end, { "i", "s" }),
          }),
          sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "luasnip" },
          }, {
            { name = "buffer" },
          }),
        })

        cmp.setup.cmdline("/", {
          mapping = cmp.mapping.preset.cmdline(),
          sources = {
            { name = "buffer" },
          },
        })

        cmp.setup.cmdline(":", {
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources({
            { name = "path" },
          }, {
            { name = "cmdline" },
          }),
        })
      end,
    },

    { "saadparwaiz1/cmp_luasnip" },

    {
      "L3MON4D3/LuaSnip",
      dependencies = "nvim-cmp",
    },

    {
      'VonHeikemen/lsp-zero.nvim',
      config = function()
        local lsp = require('lsp-zero')

        lsp.set_preferences({
          suggest_lsp_servers = false,
          setup_servers_on_start = true,
          set_lsp_keymaps = true,
          configure_diagnostics = true,
          cmp_capabilities = true,
          manage_nvim_cmp = false,
          call_servers = 'local',
          sign_icons = {
            error = '✘',
            warn = '▲',
            hint = '⚑',
            info = ''
          }
        })

        lsp.ensure_installed({
          'html',
          'cssmodules_ls',
          -- 'tsserver',
          'eslint',
          -- 'gopls',
          'lua_ls',
          'rust_analyzer',
          'denols',
          'tailwindcss'
        })

        local on_attach = function(client, bufnr)
          local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
          end

          -- Mappings.
          local opts = { noremap = true, silent = true }

          buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
          buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
          buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
          buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
          buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
          buf_set_keymap("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
          buf_set_keymap("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
          buf_set_keymap("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
          buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
          buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
          buf_set_keymap("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
          -- buf_set_keymap("n", "gr", "TroubleToggle lsp_references<CR>", opts)
          buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
          buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
          if client.name ~= "tsserver" and client.name ~= "cssls" and client.name ~= 'rust_analyzer' then
            vim.keymap.set("n", "<leader>s", function()
              local params = vim.lsp.util.make_formatting_params({})
              client.request("textDocument/formatting", params, nil, bufnr)
            end, { buffer = bufnr })
          end
        end

        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        lsp.configure('lua_ls', {
          on_attach = on_attach,
          settings = {
            Lua = {
              diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
              },
              workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
              },
            },
          },
        })


        lsp.configure('tsserver', {
          on_attach = on_attach,
          single_file_support = false,
          root_dir = function()
            return vim.fs.dirname(vim.fs.find({ 'package.json' }, { upward = true })[1])
          end
        })

        lsp.configure('denols', {
          on_attach = on_attach,
          cmp_capabilities = capabilities,
          root_dir = function()
            return vim.fs.dirname(vim.fs.find({ 'deno.json' }, { upward = true })[1])
          end
          -- single_file_support = false,
        })

        lsp.configure('cssls', {
          on_attach = on_attach,
          cmp_capabilities = capabilities
        })

        lsp.configure('rust_analyzer', {
          on_attach = on_attach,
        })

        lsp.configure('gopls', {
          on_attach = on_attach,
        })

        -- TODO: one day
        -- lsp.configure('cssmodules_ls', {
        --   on_attach = on_attach
        -- })

        lsp.setup()
      end,
      dependencies = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' },
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },
      }
    },

    {
      "TimUntersberger/neogit",
      opts = {
        disable_commit_confirmation = true,
        disable_insert_on_commit = false,
      },
      dependencies = "nvim-lua/plenary.nvim"
    },

    { "ThePrimeagen/harpoon",              dependencies = "nvim-lua/plenary.nvim" },

    { "tpope/vim-surround" },

    { "jose-elias-alvarez/typescript.nvim" },

    {
      "folke/trouble.nvim",
      dependencies = "nvim-tree/nvim-web-devicons",
      opts = {
        position = 'right'
      }
    },

    { "mbbill/undotree" },

    { "MunifTanjim/prettier.nvim" },

    { 'JoosepAlviste/nvim-ts-context-commentstring' },

    {
      "folke/noice.nvim",
      event = "VeryLazy",
      opts = {
        routes = {
          {
            filter = {
              event = "msg_show",
              kind = "",
              find = "written",
            },
            opts = { skip = true },
          },
        },
        views = {
          -- unsure on this 'clean' cmdline popup
          -- https://github.com/folke/noice.nvim/wiki/Configuration-Recipes
          cmdline_popup = {
            border = {
              -- style = "none",
              padding = { 2, 3 },
            },
            filter_options = {},
            win_options = {
              winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
            },
          },
          -- this doesn't work at all
          popupmenu = {
            relative = "editor",
            position = {
              row = 8,
              col = "50%",
            },
            size = {
              width = 60,
              height = 10,
            },
            border = {
              style = "rounded",
              padding = { 0, 1 },
            },
            win_options = {
              winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
            },
          },
          notify = {
            render = 'compact'
          },
        },
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          bottom_search = false,
          command_palette = false,
          long_message_to_split = true,
          inc_rename = false,
        },
      },
      dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
      }
    },

    { "norcalli/nvim-colorizer.lua" },

    { "ray-x/go.nvim" },

    {
      "pmizio/typescript-tools.nvim",
      dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
      opts = {},
    },

    { "lewis6991/gitsigns.nvim" },

    -- move between tmux and nvim easily
    {
      "numToStr/Navigator.nvim",
      config = function()
        require('Navigator').setup()
      end
    },

    -- Lua
    {
      "folke/persistence.nvim",
      event = "BufReadPre", -- this will only start session saving when an actual file was opened
      opts = {}
    },

    {
      "folke/flash.nvim",
      event = "VeryLazy",
      opts = {},
      keys = {
        {
          "s",
          mode = { "n", "x", "o" },
          function()
            -- default options: exact mode, multi window, all directions, with a backdrop
            require("flash").jump()
          end,
        },
        {
          "S",
          mode = { "n", "o", "x" },
          function()
            require("flash").treesitter()
          end,
        },
      },
    },
    {
      'stevearc/oil.nvim',
      opts = {},
      -- Optional dependencies
      dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    {
      "rebelot/heirline.nvim",
      -- You can optionally lazy-load heirline on UiEnter
      -- to make sure all required plugins and colorschemes are loaded before setup
      event = "VeryLazy",
      config = function()
        require("heirline").setup({
          -- config goes here
        })
      end
    },
  },
  {})

require('keymaps')
require('keymaps')
