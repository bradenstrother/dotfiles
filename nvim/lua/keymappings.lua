local utils = require('utils')
local wk = require("which-key")
-- ToggleTerm Key Mappings
utils.map('i', [[<C-\>]], '<cmd>exe v:count1 . "ToggleTerm size=80 direction=vertical"<CR>')
utils.map('n', [[<C-\>]], '<cmd>exe v:count1 . "ToggleTerm size=80 direction=vertical"<CR>')

-- bufferline
utils.map('n', [[gb]], ':BufferLinePick<CR>')

-- Nvim Tree Key Mappings
utils.map('i', [[<C-n>]], ':NvimTreeToggle<CR>')
utils.map('n', [[<C-n>]], ':NvimTreeToggle<CR>')

-- Noice
vim.keymap.set('n', '<leader>nn', function()
    require('notify').dismiss({ silent = true, pending = true })
end, { desc = 'Dismiss Noice Messages' })

wk.add({
    { "<leader>n", group = "notifications" },
    { "<leader>nn", function() require('notify').dismiss({ silent = true, pending = true }) end, desc = "Dismiss Notifications" }
})

-- toggle term
function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- ufo code folding
vim.keymap.set('n', 'zN', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

-- telescope keymappings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

wk.add({
    { "<leader>f", group = "telescope" },
    { "<leader>ff", builtin.find_files, desc = "Find Files" },
    { "<leader>fg", builtin.live_grep,  desc = "Live Grep" },
    { "<leader>fb", builtin.buffers,    desc = "Buffers" },
    { "<leader>fh", builtin.help_tags,  desc = "Help Tags" },
})

-- harpoon
-- vim.keymap.set('n', '<leader>hx', require('harpoon.mark').add_file)
vim.keymap.set('n', '<leader>hn', require('harpoon.ui').nav_next)
vim.keymap.set('n', '<leader>hp', require('harpoon.ui').nav_prev)
utils.map('n', [[<leader>hm]], ':Telescope harpoon marks<CR>')

-- Harpoon Which-key mappings
wk.add({
    -- The first key you are pressing
    { "<leader>h",  group = "harpoon" },
    { "<leader>hx", function() require('harpoon.mark').add_file() end, desc = "Mark file" },
    { "<leader>hm", ':Telescope harpoon marks<CR>', desc = "Telescope Marks" },
})

-- bufferline
utils.map(
    'n',
    [[<leader>bl]],
    ':BufferLinePick<CR>'
)

-- flash
wk.add({
    -- flash search
    { "<leader>i",  group = "flash" },
    { "<leader>is", function() require('flash').jump() end,              desc = "Flash Jump" },
    { "<leader>it", function() require('flash').treesitter() end,        desc = "Flash Treesitter" },
    { "<leader>ir", function() require('flash').treesitter_search() end, desc = "Flash Treesitter Search" }
})

-- gp (Chat GPT)
wk.add({
    { "<leader>u",  group = "gpt" },
    { "<leader>ug", "<cmd>GpChatToggle popup<cr>", desc = "Toggle Chat" },
    { "<leader>ur", "<cmd>GpChatRespond<cr>",      desc = "Respond" },
    { "<leader>un", "<cmd>GpChatNew popup<cr>",    desc = "New Chat" }
})

vim.keymap.set('n', '<leader>ug', "<cmd>GpChatToggle popup<cr>")
vim.keymap.set('n', '<leader>ur', "<cmd>GpChatRespond<cr>")
vim.keymap.set('n', '<leader>un', "<cmd>GpChatNew popup<cr>")

wk.add({
    { "<leader>g",  group = "gitsigns" },
    { "<leader>gs", "<cmd>lua require('gitsigns').stage_hunk()<cr>",      desc = "Stage Hunk" },
    { "<leader>gu", "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>", desc = "Undo Stage Hunk" },
    { "<leader>gr", "<cmd>lua require('gitsigns').reset_hunk()<cr>",      desc = "Reset Hunk" },
    { "<leader>gp", "<cmd>lua require('gitsigns').preview_hunk()<cr>",    desc = "Preview Hunk" },
    { "<leader>gb", "<cmd>lua require('gitsigns').blame_line()<cr>",      desc = "Blame Line" },
    { "<leader>gf", "<cmd>lua require('gitsigns').diffthis('~1')<cr>",    desc = "Diff This" },
    { "<leader>gn", "<cmd>lua require('gitsigns').next_hunk()<cr>",       desc = "Blame Line" }
})

-- spectre
vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
    desc = "Toggle Spectre"
})
vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = "Search current word"
})
vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    desc = "Search current word"
})
vim.keymap.set('n', '<leader>sf', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = "Search on current file"
})

wk.add({
    { "<leader>l",  group = "lspsaga" },
    { "<leader>lc", "<cmd>Lspsaga code_action<cr>",                desc = "Code Action" },
    { "<leader>lo", "<cmd>Lspsaga outline<cr>",                    desc = "Outline" },
    { "<leader>lr", "<cmd>Lspsaga rename<cr>",                     desc = "Rename" },
    { "<leader>ld", "<cmd>Lspsaga goto_definition<cr>",            desc = "Lsp GoTo Definition" },
    { "<leader>lf", "<cmd>Lspsaga finder<cr>",                     desc = "Lsp Finder" },
    { "<leader>lp", "<cmd>Lspsaga preview_definition<cr>",         desc = "Preview Definition" },
    { "<leader>ls", "<cmd>Lspsaga signature_help<cr>",             desc = "Signature Help" },
    { "<leader>lw", "<cmd>Lspsaga show_workspace_diagnostics<cr>", desc = "Show Workspace Diagnostics" }
})

local function visual_cursors_with_delay()
    -- Execute the vm-visual-cursors command.
    vim.cmd('silent! execute "normal! \\<Plug>(VM-Visual-Cursors)"')
    -- Introduce delay via VimScript's 'sleep' (set to 500 milliseconds here).
    vim.cmd('sleep 200m')
    -- Press 'A' in normal mode after the delay.
    vim.cmd('silent! execute "normal! A"')
end

wk.add({
    { "<leader>m",  group = "visual multi" },
    { "<leader>ma", "<Plug>(VM-Select-All)<Tab>",    desc = "Select All" },
    { "<leader>mr", "<Plug>(VM-Start-Regex-Search)", desc = "Start Regex Search" },
    { "<leader>mp", "<Plug>(VM-Add-Cursor-At-Pos)",  desc = "Add Cursor At Pos" },
    { "<leader>mv", visual_cursors_with_delay,       desc = "Visual Cursors" },
    { "<leader>mo", "<Plug>(VM-Toggle-Mappings)",    desc = "Toggle Mapping" }
})

vim.keymap.set('n', '<leader><leader>', '<cmd>source ~/.config/nvim/init.lua<CR>')

-- Random which-key configuration
wk.add({
    { '<leader>b', group = 'buffers' },
    { '<leader><leader>', '<cmd>source ~/.config/nvim/init.lua<CR>', desc = 'Reload config' },
    { '<leader>s', group = 'search' },
})
