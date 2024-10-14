require("toggleterm").setup {
    close_on_exit = false,
    autochdir = 'true',
    shell = vim.o.shell,
    size = 20
}

require('nvim-tree').setup({
    filters = { dotfiles = false, git_ignored = false },
    auto_reload_on_write = true,
    view = {
        centralize_selection = false,
        cursorline = true,
        debounce_delay = 15,
        width = {},
        side = "left",
        preserve_window_proportions = false,
        number = true,
        relativenumber = true,
        signcolumn = "yes",
    },
    update_focused_file = { enable = true, update_root = false, ignore_list = {} },
    renderer = {
        add_trailing = false,
        group_empty = false,
        highlight_git = false,
        full_name = false,
        highlight_opened_files = "all",
        highlight_modified = "none",
        root_folder_label = ":~:s?$?/..?",
        indent_width = 2,
        indent_markers = {
            enable = true,
            inline_arrows = true,
            icons = {
                corner = "└",
                edge = "│",
                item = "│",
                bottom = "─",
                none = " ",
            },
        },
    }
})

require('ufo').setup()


require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or
    -- "all" (the five listed parsers
    -- should always be installed)
    ensure_installed = {
        "bash",
        "fish",
        "lua",
        "markdown",
        "vim",
        "regex",
        "markdown_inline",
    },

    -- Install parsers synchronously
    -- (only applied to
    -- `ensure_installed`)
    sync_install = false,

    -- Automatically install missing
    -- parsers when entering buffer
    -- Recommendation: set to false
    -- if you don't have `tree-sitter`
    -- CLI installed locally
    auto_install = false,
}

-- indent blankline
require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = true,
    show_end_of_line = true,
}


-- treesj
require('treesj').setup({
    -- Use default keymaps
    -- (<space>m - toggle, <space>j - join, <space>s - split)
    use_default_keymaps = false,

    -- Node with syntax error will not be formatted
    check_syntax_error = false,

    -- If line after join will be longer than max value,
    -- node will not be formatted
    max_join_length = 120,

    -- hold|start|end:
    -- hold - cursor follows the node/place on which it was called
    -- start - cursor jumps to the first symbol of the node being formatted
    -- end - cursor jumps to the last symbol of the node being formatted
    cursor_behavior = 'hold',

    -- Notify about possible problems or not
    notify = true,
    langs = {
        lua = require('treesj.langs.lua'),
        typescript = require('treesj.langs.typescript'),
    },

    -- Use `dot` for repeat action
    dot_repeat = true,
})

require('Comment').setup()

require('telescope').setup({
    pickers = {
        find_files = {
            theme = "dropdown",
        },
        live_grep = {
            theme = "dropdown",
        },
        help_tags = {
            theme = "dropdown",
        }
    }
})

-- lualine
local colors = {
    blue   = '#80a0ff',
    cyan   = '#79dac8',
    black  = '#080808',
    white  = '#c6c6c6',
    red    = '#ff5189',
    violet = '#d183e8',
    grey   = '#303030',
}
local bubbles_theme = {
    normal = {
        a = { fg = colors.black, bg = colors.violet },
        b = { fg = colors.white, bg = colors.grey },
        c = { fg = colors.black, bg = colors.black },
    },

    insert = { a = { fg = colors.black, bg = colors.blue } },
    visual = { a = { fg = colors.black, bg = colors.cyan } },
    replace = { a = { fg = colors.black, bg = colors.red } },

    inactive = {
        a = { fg = colors.white, bg = colors.black },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.black, bg = colors.black },
    },
}
require('lualine').setup({
    options = {
        theme = bubbles_theme,
        component_separators = '|',
        section_separators = { left = '', right = '' },
    },
    sections = {
        lualine_a = {
            { 'mode', separator = { left = '' }, right_padding = 2 },
        },
        lualine_b = { 'filename', 'branch' },
        lualine_c = { 'fileformat' },
        lualine_x = {},
        lualine_y = { 'filetype', 'progress' },
        lualine_z = {
            { 'location', separator = { right = '' }, left_padding = 2 },
        },
    },
    inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
    },
    tabline = {},
    extensions = {},
})

-- Harpoon
require('harpoon').setup({
    global_settings = {
        -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
        save_on_toggle = false,

        -- saves the harpoon file upon every change. disabling is unrecommended.
        save_on_change = true,

        -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
        enter_on_sendcmd = false,

        -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
        tmux_autoclose_windows = false,

        -- filetypes that you want to prevent from adding to the harpoon list menu.
        excluded_filetypes = { "harpoon" },

        -- set marks specific to each git branch inside git repository
        -- Each branch will have it's own set of marked files
        mark_branch = true,

        -- enable tabline with harpoon marks
        tabline = false,
        tabline_prefix = "   ",
        tabline_suffix = "   ",
    }
})

-- Harpoon telescope extension
require('telescope').load_extension('harpoon')

-- Bufferline
require("bufferline").setup {
    options = {
        mode = 'buffers',
        -- diagnostics = 'coc',
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                separator = true,
            }
        },
    },
}

-- which-key
require("which-key").setup {
    plugins = {
        marks = true,     -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        spelling = {
            enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        presets = {
            operators = true,    -- adds help for operators like d, y, ...
            motions = true,      -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true,      -- default bindings on <c-w>
            nav = true,          -- misc bindings to work with windows
            z = true,            -- bindings for folds, spelling and others prefixed with z
            g = true,            -- bindings for prefixed with g
        },
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },
}

require("flash").setup({})

-- Feedkey function definition
local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

-- Check if words exist before the cursor
local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- nvim-cmp setup
local cmp = require('cmp')
cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        -- Super-Tab like mappings
        -- https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#vim-vsnip
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif vim.fn == 1 then
                feedkey("<Plug>(vsnip-expand-or-jump)", "")
            elseif has_words_before() then
                cmp.complete()
            else
                fallback() -- The fallback function sends an already mapped key. In this case, it's probably `<Tab>`.
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                feedkey("<Plug>(vsnip-jump-prev)", "")
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
        { name = 'vsnip' }, -- Snippet source
        { name = 'nvim_lsp' },
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

-- gp
require('gp').setup({
    openai_api_key = { "op", "item", "get", "b3cfrmdlodxgk73q2ek3pw3ske", "--fields", "credential", "--reveal" },
})
-- lsp config
--
-- This is what we had before.
-- require'lspconfig'.lua_ls.setup{}

-- We are replacing that with:
--
require('mason').setup()
require('mason-lspconfig').setup()
require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
    end,
}

require('lspmappings')

require('spectre').setup({
    result_padding = '',
    default = {
        replace = {
            cmd = "sed"
        }
    }
})

require('gitsigns').setup({})
vim.cmd "set statusline+=%{get(b:,'gitsigns_status','')}"

require('lspsaga').setup({
    lightbulb = {
        enable = false,
    },
})

require('notify').setup({
    opts = {
        stages = "static",
        timeout = 3000,
        max_height = function()
            return math.floor(vim.o.lines * 0.75)
        end,
        max_width = function()
            return math.floor(vim.o.columns * 0.75)
        end,
        on_open = function(win)
            vim.api.nvim_win_set_config(win, { zindex = 100 })
        end,
    },
})

require('fidget').setup({
    {
        -- Options related to LSP progress subsystem
        progress = {
            poll_rate = 0,                -- How and when to poll for progress messages
            suppress_on_insert = false,   -- Suppress new messages while in insert mode
            ignore_done_already = false,  -- Ignore new tasks that are already complete
            ignore_empty_message = false, -- Ignore new tasks that don't contain a message
            clear_on_detach =             -- Clear notification group when LSP server detaches
                function(client_id)
                    local client = vim.lsp.get_client_by_id(client_id)
                    return client and client.name or nil
                end,
            notification_group = -- How to get a progress message's notification group key
                function(msg) return msg.lsp_client.name end,
            ignore = {},         -- List of LSP servers to ignore

            -- Options related to how LSP progress messages are displayed as notifications
            display = {
                render_limit = 16, -- How many LSP messages to show at once
                done_ttl = 3, -- How long a message should persist after completion
                done_icon = "✔", -- Icon shown when all LSP progress tasks are complete
                done_style = "Constant", -- Highlight group for completed LSP tasks
                progress_ttl = math.huge, -- How long a message should persist when in progress
                progress_icon = -- Icon shown when LSP progress tasks are in progress
                { pattern = "dots", period = 1 },
                progress_style = -- Highlight group for in-progress LSP tasks
                "WarningMsg",
                group_style = "Title", -- Highlight group for group name (LSP server name)
                icon_style = "Question", -- Highlight group for group icons
                priority = 30, -- Ordering priority for LSP notification group
                skip_history = true, -- Whether progress notifications should be omitted from history
                format_message = -- How to format a progress message
                    require("fidget.progress.display").default_format_message,
                format_annote = -- How to format a progress annotation
                    function(msg) return msg.title end,
                format_group_name = -- How to format a progress notification group's name
                    function(group) return tostring(group) end,
                overrides = { -- Override options from the default notification config
                    rust_analyzer = { name = "rust-analyzer" },
                },
            },

            -- Options related to Neovim's built-in LSP client
            lsp = {
                progress_ringbuf_size = 0, -- Configure the nvim's LSP progress ring buffer size
                log_handler = false,       -- Log `$/progress` handler invocations (for debugging)
            },
        },

        -- Options related to notification subsystem
        notification = {
            poll_rate = 10,               -- How frequently to update and render notifications
            filter = vim.log.levels.INFO, -- Minimum notifications level
            history_size = 128,           -- Number of removed messages to retain in history
            override_vim_notify = false,  -- Automatically override vim.notify() with Fidget
            configs =                     -- How to configure notification groups when instantiated
            { default = require("fidget.notification").default_config },
            redirect =                    -- Conditionally redirect notifications to another backend
                function(msg, level, opts)
                    if opts and opts.on_open then
                        return require("fidget.integration.nvim-notify").delegate(msg, level, opts)
                    end
                end,

            -- Options related to how notifications are rendered as text
            view = {
                stack_upwards = true,    -- Display notification items from bottom to top
                icon_separator = " ",    -- Separator between group name and icon
                group_separator = "---", -- Separator between notification groups
                group_separator_hl =     -- Highlight group used for group separator
                "Comment",
                render_message =         -- How to render notification messages
                    function(msg, cnt)
                        return cnt == 1 and msg or string.format("(%dx) %s", cnt, msg)
                    end,
            },

            -- Options related to the notification window and buffer
            window = {
                normal_hl = "Comment", -- Base highlight group in the notification window
                winblend = 100,        -- Background color opacity in the notification window
                border = "none",       -- Border around the notification window
                zindex = 45,           -- Stacking priority of the notification window
                max_width = 0,         -- Maximum width of the notification window
                max_height = 0,        -- Maximum height of the notification window
                x_padding = 1,         -- Padding from right edge of window boundary
                y_padding = 0,         -- Padding from bottom edge of window boundary
                align = "bottom",      -- How to align the notification window
                relative = "editor",   -- What the notification window position is relative to
            },
        },

        -- Options related to integrating with other plugins
        integration = {
            ["nvim-tree"] = {
                enable = true, -- Integrate with nvim-tree/nvim-tree.lua (if installed)
            },
            ["xcodebuild-nvim"] = {
                enable = true, -- Integrate with wojciech-kulik/xcodebuild.nvim (if installed)
            },
        },

        -- Options related to logging
        logger = {
            level = vim.log.levels.WARN, -- Minimum logging level
            max_size = 10000,            -- Maximum log file size, in KB
            float_precision = 0.01,      -- Limit the number of decimals displayed for floats
            path =                       -- Where Fidget writes its logs to
                string.format("%s/fidget.nvim.log", vim.fn.stdpath("cache")),
        },
    }
})
