return {
  {
    'VonHeikemen/lsp-zero.nvim',
    -- lazy = true,
    event = 'BufReadPre',
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
        -- sign_icons = {
        --   error = '✘',
        --   warn = '▲',
        --   hint = '⚑',
        --   info = ''
        -- }
      })

      lsp.ensure_installed({
        'html',
        'cssmodules_ls',
        'tsserver',
        'eslint',
        -- 'gopls',
        'lua_ls',
        'rust_analyzer',
        'denols',
        'tailwindcss',
        'tsserver',
        'astro'
      })

      lsp.skip_server_setup({ 'eslint' })

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
          print(client.name)
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


      -- lsp.configure('tsserver', {
      --   on_attach = on_attach,
      --   single_file_support = false,
      --   root_dir = function()
      --     return vim.fs.dirname(vim.fs.find({ 'package.json' }, { upward = true })[1])
      --   end
      -- })
      --
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

      lsp.configure('astro', {
        on_attach = on_attach,
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
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      on_attach = function(client, bufnr)
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

        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        -- if client.name ~= "tsserver" and client.name ~= "cssls" and client.name ~= 'rust_analyzer' then
        --   vim.keymap.set("n", "<leader>s", function()
        --     local params = vim.lsp.util.make_formatting_params({})
        --     client.request("textDocument/formatting", params, nil, bufnr)
        --   end, { buffer = bufnr })
        -- end
      end

    },
    event = "VeryLazy"
    config = function()
      require("typescript-tools").setup({
        root_dir = function()
          return vim.fs.dirname(vim.fs.find({ 'package.json' }, { upward = true })[1])
        end
      })
    end
  }
  {
    "neovim/nvim-lspconfig",
    event = { 'BufReadPre', 'BufNewFile' },
  },
}
