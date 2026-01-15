return {
    "saghen/blink.cmp",
    version = "*",

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {

        appearance = {
            use_nvim_cmp_as_default = false,
            kind_icons = {
              Text = "t",
              Method = "m",
              Function = "ƒ",  -- This basic lambda usually works
              Constructor = "C",
              Field = "f",
              Variable = "v",
              Class = "C",
              Interface = "I",
              Module = "M",
              Property = "p",
              Unit = "U",
              Value = "V",
              Enum = "E",
              Keyword = "k",
              Snippet = "S",
              Color = "c",
              File = "F",
              Reference = "r",
              Folder = "D",
              EnumMember = "Em",
              Constant = "K",
              Struct = "S",
              Event = "Ev",
              Operator = "op",
              TypeParameter = "TP",
            }
        },

        completion = {
            accept = { auto_brackets = { enabled = true } },

            documentation = {
                auto_show = true,
                auto_show_delay_ms = 250,
                treesitter_highlighting = true,
                window = { border = "rounded" },
            },

            menu = {
                border = "rounded",

                cmdline_position = function()
                    if vim.g.ui_cmdline_pos ~= nil then
                        local pos = vim.g.ui_cmdline_pos -- (1, 0)-indexed
                        return { pos[1] - 1, pos[2] }
                    end
                    local height = (vim.o.cmdheight == 0) and 1 or vim.o.cmdheight
                    return { vim.o.lines - height, 0 }
                end,

                draw = {
                    columns = {
                        { "kind_icon", "label", gap = 1 },
                        { "kind" },
                    },
                    components = {
                        label = {
                            text = function(item)
                                return item.label
                            end,
                            highlight = "CmpItemAbbr",
                        },
                        kind = {
                            text = function(item)
                                return item.kind
                            end,
                            highlight = "CmpItemKind",
                        },
                    },
                },
            },
        },

        -- Experimental signature help support
        signature = {
            enabled = true,
            window = { border = "rounded" },
        },

        sources = {
            default = { "lsp", "path", "buffer" },
            providers = {
                lsp = {
                    min_keyword_length = 2, -- Number of characters to trigger porvider
                    score_offset = 0, -- Boost/penalize the score of the items
                },
                path = {
                    min_keyword_length = 0,
                },
                buffer = {
                    min_keyword_length = 5,
                    max_items = 5,
                },
            },
        },
    },
}
