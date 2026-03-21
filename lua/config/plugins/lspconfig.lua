--local lspconfig = require("lspconfig")
local vimconfig = vim.lsp.config

-- Enable Go LSP (gopls)
vimconfig("gopls", {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
-- lspconfig.gopls.setup {
--   capabilities = require("cmp_nvim_lsp").default_capabilities(),
-- }

-- Enable Python LSP (pylsp)
vimconfig("pylsp", {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
-- lspconfig.pylsp.setup {
--     capabilities = require("cmp_nvim_lsp").default_capabilities(),
-- }

vimconfig("emmet_language_server", {
        -- Optional: Configure filetypes and other options
        filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
        init_options = {
            html = {
                options = {
                    ["bem.enabled"] = true,
                },
            },
        },
})
        -- Optional: Configure filetypes and other options
    --     lspconfig.emmet_language_server.setup({
    --     filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
    --     init_options = {
    --         html = {
    --             options = {
    --                 ["bem.enabled"] = true,
    --             },
    --         },
    --     },
    -- })

-- Auto-format on save (optional)
vim.cmd [[autocmd BufWritePre *.go lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.py lua vim.lsp.buf.format()]]
