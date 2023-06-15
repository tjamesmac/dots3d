vim.g.mapleader = " "
vim.g.globalstatus = true

require("options")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

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
    --   "feline-nvim/feline.nvim",
    --   lazy = false,
    --   opts = function()
    --     local lsp = require("feline.providers.lsp")
    --     local vi_mode_utils = require("feline.providers.vi_mode")
    --
    --     local force_inactive = {
    --       filetypes = {},
    --       buftypes = {},
    --       bufnames = {},
    --     }
    --
    --     local components = {
    --       active = { {}, {}, {} },
    --       inactive = { {}, {}, {} },
    --     }
    --
    --     local colors = {
    --       -- bg = "#1F1F28",
    --       -- github dark-theme = #24292e
    --       bg = "0x24283b", -- github dark theme
    --       black = "#282828",
    --       yellow = "#d8a657",
    --       cyan = "#89b482",
    --       oceanblue = "#45707a",
    --       green = "#a9b665",
    --       orange = "#e78a4e",
    --       violet = "#d3869b",
    --       magenta = "#c14a4a",
    --       white = "#a89984",
    --       fg = "#282828",
    --       skyblue = "#7daea3",
    --       red = "#ea6962",
    --     }
    --
    --     local vi_mode_colors = {
    --       NORMAL = "red",
    --       OP = "green",
    --       INSERT = "green",
    --       CONFIRM = "red",
    --       VISUAL = "skyblue",
    --       LINES = "skyblue",
    --       BLOCK = "skyblue",
    --       REPLACE = "violet",
    --       ["V-REPLACE"] = "violet",
    --       ENTER = "cyan",
    --       MORE = "cyan",
    --       SELECT = "orange",
    --       COMMAND = "green",
    --       SHELL = "green",
    --       TERM = "green",
    --       NONE = "yellow",
    --     }
    --
    --     local vi_mode_text = {
    --       NORMAL = "<|",
    --       OP = "<|",
    --       INSERT = "|>",
    --       VISUAL = "<>",
    --       LINES = "<>",
    --       BLOCK = "<>",
    --       REPLACE = "<>",
    --       ["V-REPLACE"] = "<>",
    --       ENTER = "<>",
    --       MORE = "<>",
    --       SELECT = "<>",
    --       COMMAND = "<|",
    --       SHELL = "<|",
    --       TERM = "<|",
    --       NONE = "<>",
    --       CONFIRM = "|>",
    --     }
    --
    --     force_inactive.filetypes = {
    --       "NvimTree",
    --       "dbui",
    --       "packer",
    --       "startify",
    --       "fugitive",
    --       "fugitiveblame",
    --     }
    --
    --     force_inactive.buftypes = {
    --       "terminal",
    --     }
    --
    --     -- LEFT
    --
    --     -- vi-mode
    --     components.active[1][1] = {
    --       provider = " NVIM ",
    --       hl = function()
    --         local val = {}
    --
    --         val.bg = vi_mode_utils.get_mode_color()
    --         val.fg = "black"
    --         val.style = "bold"
    --
    --         return val
    --       end,
    --       right_sep = " ",
    --     }
    --     -- git branch
    --     components.active[1][2] = {
    --       provider = "git_branch",
    --       hl = {
    --         fg = "yellow",
    --         bg = "bg",
    --         style = "bold",
    --       },
    --       right_sep = {
    --         str = " | ",
    --         hl = {
    --           fg = "yellow",
    --           bg = "bg",
    --           style = "bold",
    --         },
    --       },
    --     }
    --     -- filename
    --     components.active[1][3] = {
    --       provider = function()
    --         return vim.fn.expand("%:t")
    --       end,
    --       hl = {
    --         fg = "white",
    --         bg = "bg",
    --         style = "bold",
    --       },
    --       right_sep = " ",
    --     }
    --
    --     components.active[1][4] = {
    --       provider = function()
    --         return "%m"
    --       end,
    --       hl = {
    --         fg = "white",
    --         bg = "bg",
    --         style = "bold",
    --       },
    --     }
    --
    --     -- MID
    --     -- gitBranch
    --     components.active[2][1] = {
    --       provider = "git_branch",
    --       hl = {
    --         fg = "yellow",
    --         bg = "bg",
    --         style = "bold",
    --       },
    --     }
    --     -- diagnosticErrors
    --     components.active[2][1] = {
    --       provider = "diagnostic_errors",
    --       enabled = function()
    --         return lsp.diagnostics_exist(vim.diagnostic.severity.ERROR)
    --       end,
    --       hl = {
    --         fg = "red",
    --         style = "bold",
    --       },
    --     }
    --     -- diagnosticWarn
    --     components.active[2][2] = {
    --       provider = "diagnostic_warnings",
    --       enabled = function()
    --         return lsp.diagnostics_exist(vim.diagnostic.severity.WARN)
    --       end,
    --       hl = {
    --         fg = "yellow",
    --         style = "bold",
    --       },
    --     }
    --     -- diagnosticHint
    --     components.active[2][3] = {
    --       provider = "diagnostic_hints",
    --       enabled = function()
    --         return lsp.diagnostics_exist(vim.diagnostic.severity.HINT)
    --       end,
    --       hl = {
    --         fg = "cyan",
    --         style = "bold",
    --       },
    --     }
    --     -- diagnosticInfo
    --     components.active[2][4] = {
    --       provider = "diagnostic_info",
    --       enabled = function()
    --         return lsp.diagnostics_exist(vim.diagnostic.severity.INFO)
    --       end,
    --       hl = {
    --         fg = "skyblue",
    --         style = "bold",
    --       },
    --     }
    --
    --     -- RIGHT
    --     -- LspName
    --     components.active[3][1] = {
    --       provider = "lsp_client_names",
    --       hl = {
    --         fg = "yellow",
    --         bg = "bg",
    --         style = "bold",
    --       },
    --       right_sep = " ",
    --     }
    --     -- fileIcon
    --     components.active[3][2] = {
    --       provider = function()
    --         local filename = vim.fn.expand("%:t")
    --         local extension = vim.fn.expand("%:e")
    --         local icon = require("nvim-web-devicons").get_icon(filename, extension)
    --         if icon == nil then
    --           icon = ""
    --         end
    --         return icon
    --       end,
    --       hl = function()
    --         local val = {}
    --         local filename = vim.fn.expand("%:t")
    --         local extension = vim.fn.expand("%:e")
    --         local icon, name = require("nvim-web-devicons").get_icon(filename, extension)
    --         if icon ~= nil then
    --           val.fg = vim.fn.synIDattr(vim.fn.hlID(name), "fg")
    --         else
    --           val.fg = "white"
    --         end
    --         val.bg = "bg"
    --         val.style = "bold"
    --         return val
    --       end,
    --       right_sep = " ",
    --     }
    --     -- fileType
    --     components.active[3][3] = {
    --       provider = "file_type",
    --       hl = function()
    --         local val = {}
    --         local filename = vim.fn.expand("%:t")
    --         local extension = vim.fn.expand("%:e")
    --         local icon, name = require("nvim-web-devicons").get_icon(filename, extension)
    --         if icon ~= nil then
    --           val.fg = vim.fn.synIDattr(vim.fn.hlID(name), "fg")
    --         else
    --           val.fg = "white"
    --         end
    --         val.bg = "bg"
    --         val.style = "bold"
    --         return val
    --       end,
    --       right_sep = " ",
    --     }
    --     -- fileSize
    --     components.active[3][4] = {
    --       provider = "file_size",
    --       enabled = function()
    --         return vim.fn.getfsize(vim.fn.expand("%:t")) > 0
    --       end,
    --       hl = {
    --         fg = "skyblue",
    --         bg = "bg",
    --         style = "bold",
    --       },
    --       right_sep = " ",
    --     }
    --     -- lineInfo
    --     components.active[3][6] = {
    --       provider = "position",
    --       hl = {
    --         fg = "white",
    --         bg = "bg",
    --         style = "bold",
    --       },
    --       right_sep = " ",
    --     }
    --     -- linePercent
    --     components.active[3][7] = {
    --       provider = "line_percentage",
    --       hl = {
    --         fg = "white",
    --         bg = "bg",
    --         style = "bold",
    --       },
    --       right_sep = " ",
    --     }
    --     -- scrollBar
    --     components.active[3][8] = {
    --       provider = "scroll_bar",
    --       hl = {
    --         fg = "yellow",
    --         bg = "bg",
    --       },
    --     }
    --
    --     -- fileType
    --     components.inactive[1][1] = {
    --       provider = "file_type",
    --       hl = {
    --         fg = "black",
    --         bg = "cyan",
    --         style = "bold",
    --       },
    --       left_sep = {
    --         str = " ",
    --         hl = {
    --           fg = "NONE",
    --           bg = "cyan",
    --         },
    --       },
    --       right_sep = {
    --         {
    --           str = " ",
    --           hl = {
    --             fg = "NONE",
    --             bg = "cyan",
    --           },
    --         },
    --         " ",
    --       },
    --     }
    --
    --     return {
    --       theme = colors,
    --       default_bg = colors.yellow,
    --       default_fg = colors.yellow,
    --       vi_mode_colors = vi_mode_colors,
    --       components = components,
    --       force_inactive = force_inactive,
    --     }
    --   end
    -- },

    {
      "lewis6991/gitsigns.nvim",
    },

    -- {
    --   "kyazdani42/nvim-tree.lua",
    --   opts = {
    --     view = {
    --       adaptive_size = true,
    --       side = "right",
    --     },
    --     actions = {
    --       open_file = {
    --         window_picker = {
    --           enable = false,
    --         },
    --       },
    --     },
    --   },
    --   dependencies = {
    --     "kyazdani42/nvim-web-devicons",
    --   },
    -- },

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
          "regex"
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
            },
            layout_strategy = "vertical",
            layout_config = {
              horizontal = { width = 0.9 },
            },
          },
        })
        require("telescope").load_extension("harpoon")
        require("telescope").load_extension("live_grep_args")
        require("telescope").load_extension("fzf")
      end,
      version = false,
      dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-live-grep-args.nvim" },
        { "ThePrimeagen/harpoon",                        dependencies = "nvim-lua/plenary.nvim" },
      }
    },

    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

    {
      'projekt0n/github-nvim-theme',
      -- lazy = false, -- make sure we load this during startup if it is your main colorscheme
      -- priority = 1000, -- make sure to load this before all the other start plugins
      config = function()
        require('github-theme').setup({
          -- ...
        })

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
          'tsserver',
          'eslint',
          -- 'gopls',
          'lua_ls',
          'rust_analyzer',
          'denols'
        })

        -- lsp.skip_server_setup({'tsserver'})
        -- lsp.skip_server_setup({'denols'})

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
            vim.keymap.set("n", "<leader>fs", function()
              local params = vim.lsp.util.make_formatting_params({})
              client.request("textDocument/formatting", params, nil, bufnr)
            end, { buffer = bufnr })
          end
        end

        local capabilities = require('cmp_nvim_lsp').default_capabilities()

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

        -- lsp.configure('cssmodules_ls', {
        --   on_attach = on_attach
        -- })

        lsp.configure('denols', {
          on_attach = on_attach,
          cmp_capabilities = capabilities,
          single_file_support = false,
        })

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
    { "jose-elias-alvarez/null-ls.nvim",   dependencies = "nvim-lua/plenary.nvim" },

    -- Lua
    {
      "folke/trouble.nvim",
      dependencies = "kyazdani42/nvim-web-devicons",
    },

    { "folke/tokyonight.nvim" },

    { "mbbill/undotree" },

    { "MunifTanjim/prettier.nvim" },

    { 'JoosepAlviste/nvim-ts-context-commentstring' },

    -- {
    --   "folke/noice.nvim",
    --   event = "VeryLazy",
    --   views = {
    --     cmdline_popup = {
    --       border = {
    --         style = "none",
    --         padding = { 2, 3 },
    --       },
    --       filter_options = {},
    --       win_options = {
    --         winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
    --       },
    --     },
    --   },
    --   opts = {
    --     lsp = {
    --       override = {
    --         ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
    --         ["vim.lsp.util.stylize_markdown"] = true,
    --       },
    --     },
    --     presets = {
    --       bottom_search = true,
    --       command_palette = false,
    --       long_message_to_split = true,
    --     },
    --   },
    --   dependencies = {
    --     "MunifTanjim/nui.nvim",
    --     "rcarriga/nvim-notify",
    --   }
    -- },

    { "norcalli/nvim-colorizer.lua" },

    { "ray-x/go.nvim" },

    {
      "rebelot/kanagawa.nvim",
      config = function()
        -- vim.cmd('colorscheme kanagawa')
      end
    },

    {
      "numToStr/Navigator.nvim",
      config = function()
        require('Navigator').setup()
      end
    },

    {
      "catppuccin/nvim",
      config = function()
        require('catppuccin').setup({
          flavour = "frappe",
          color_overrides = {
            mocha = {
              base = "#000000",
            },
          },
          integrations = {
            nvimtree = true,
            telescope = false,
          },
          highlight_overrides = {
            mocha = function(mocha)
              return {
                NvimTreeNormal = { bg = mocha.none },
              }
            end,
          },
        })

        -- vim.cmd('colorscheme catppuccin')
      end
    }
  },


  {})

require('keymaps')
