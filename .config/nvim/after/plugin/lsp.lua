local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- to learn how to use mason.nvim
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'astro',
    'cssls',
    'dockerls',
    'docker_compose_language_service',
    'gopls',
    'gradle_ls',
    'graphql',
    'html',
    'jdtls',
    'jsonls',
    'tsserver',
    'ltex',
    'remark_ls',
    'mdx_analyzer',
    'rust_analyzer',
    'sqls',
    'svelte',
    'tailwindcss',
    'yamlls'
  },
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  },
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    -- ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }, {
    { name = 'buffer' },
  })
})
local cmp_mappings = lsp_zero.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ['<C-Space>'] = cmp.mapping.complete(),
})

-- lsp_zero.on_attach(function(client, buffer)
  --   local opts = { buffer = e.buf }
  --   vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  --   vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  --   vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  --   vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  --   vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  --   vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  --   vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  --   vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  --   vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  --   vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  -- end)

  lsp_zero.setup()

