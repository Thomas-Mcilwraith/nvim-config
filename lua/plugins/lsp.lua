return{
    {
        "folke/neodev.nvim",
        opts = {},
        config = function()
            require('neodev').setup({
                library = {
                    types = true,  -- enable Lua typing for common libs
                    plugins = true, -- include runtime plugins
                },
                setup_jsonls = true, -- optional, for sumneko json support
                globals = { "vim", "it", "describe", "before_each", "after_each" },
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            -- "williamboman/mason.nvim",
            -- "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/nvim-cmp",
        },

        config = function()

            -- configure language servers
            -- python
            vim.lsp.config("pyright", {
                cmd = { vim.fn.expand("~/.local/bin/pyright-langserver"), "--stdio" },
                filetypes = { "python" },
                root_markers = { "pyproject.toml", "setup.py", ".git" },

                single_file_support = true,
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = "basic",
                            reportOptionalCall = "none",
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                            diagnosticMode = "workspace",
                        },
                    },
                },
            })

            -- fortran
            vim.lsp.config("fortls", {
                cmd = { vim.fn.expand("$HOME/.local/bin/fortls") },

                filetypes = { "fortran" },

                root_markers = {
                    "fpm.toml",
                    "CMakeLists.txt",
                    ".git",
                },

                capabilities = capabilities,

                settings = {
                    fortls = {
                        -- Diagnostics
                        diagnostics = true,

                        -- Code intelligence
                        hover_signature = true,
                        use_signature_help = true,

                        -- Completion
                        autocompletion = true,

                        -- Formatting (optional)
                        enable_code_actions = true,
                    },
                },
            })

            local cmp = require('cmp')
            local cmp_lsp = require('cmp_nvim_lsp')
            local capabilities = vim.tbl_deep_extend(
                "force",
                {},
                vim.lsp.protocol.make_client_capabilities(),
                cmp_lsp.default_capabilities()
            )

            -- -- MASON SETUP
            -- require("mason").setup()
            -- require("mason-lspconfig").setup({
                --     ensure_installed = {
                    --         "lua_ls",
                    --         "pyright"
                    --     },
                    --
                    --     handlers = {
                        --         function(server_name)
                            --             require("lspconfig")[server_name].setup{
                                --                 capabilities = capabilities,
                                --             }
                                --         end,
                                --
                                --     }
                                -- })

                                -- CMP setup
                                local cmp_select = { behaviour = cmp.SelectBehavior.Select }

                                cmp.setup({
                                    window = {
                                        completion = cmp.config.window.bordered(),
                                        documentation = cmp.config.window.bordered()
                                    },
                                    mapping = cmp.mapping.preset.insert({
                                        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                                        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                                        ['<C-y>'] = cmp.mapping.confirm({select=true}),
                                        -- 👇 THIS enables the preview
                                        ['<C-d>'] = cmp.mapping.scroll_docs(4),
                                        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                                    }),
                                    sources = cmp.config.sources({
                                        {name='nvim_lsp'},
                                        {name='buffer'},
                                    })
                                })

                                vim.lsp.config('lua_ls', {capabilities = capabilities})
                                vim.lsp.config('null-ls', {capabilities = capabilities})
                                vim.lsp.enable('lua_ls')
                                vim.lsp.enable('pyright')
                                vim.lsp.enable('fortls')
                                vim.lsp.enable('null-ls')
                            end,


                        }}
