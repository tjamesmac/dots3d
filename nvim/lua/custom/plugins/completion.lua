return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = "<tab>",
            -- accept_line = true
          }
        },
        copilot_node_command = vim.fn.expand('$HOME') .. "/.n/n/versions/node/20.5.1/bin/node"
      })
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    cmd = { "CopilotChat", "CopilotChatFix", "CopilotChatOpen", "CopilotChatToggle", "CopilotChatExplain" },
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" },  -- for curl, log wrapper
    },
    opts = {
      -- debug = true, -- Enable debugging
      -- See Configuration section for rest
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp"
  },
  {
    "hrsh7th/nvim-cmp",
    event = 'InsertEnter',
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "onsails/lspkind.nvim",
      "hrsh7th/cmp-cmdline",
      "windwp/nvim-autopairs",
      "saadparwaiz1/cmp_luasnip"
    },
    config = function()
      local cmp = require("cmp")
      local lspkind = require("lspkind")

      -- Enables autopairs on autocomplete
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
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
            require("luasnip").lsp_expand(args.body)
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
          -- ["<Tab>"] = cmp.mapping(function(fallback)
          --   local luasnip = require("luasnip")
          --   if cmp.visible() then
          --     cmp.select_next_item()
          --   elseif luasnip.expand_or_jumpable() then
          --     luasnip.expand_or_jump()
          --   else
          --     fallback()
          --   end
          -- end, { "i", "s" }),
          -- ["<S-Tab>"] = cmp.mapping(function(fallback)
          --   local luasnip = require("luasnip")
          --   if cmp.visible() then
          --     cmp.select_prev_item()
          --   elseif luasnip.jumpable(-1) then
          --     luasnip.jump(-1)
          --   else
          --     fallback()
          --   end
          -- end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          -- {
          --         name = "copilot",
          --         group_index = 1,
          --         priority = 100,
          --       },
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
}
