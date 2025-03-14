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


-- toggle term
function _G.set_terminal_keymaps()
    local opts = {noremap = true}
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

wk.register({
    -- define key mappings for telescope
    f = {
        name = "telescope",
        f = { function() require('telescope.builtin').find_files() end },
    },
}, { prefix = "<leader>" })

-- harpoon
-- vim.keymap.set('n', '<leader>hx', require('harpoon.mark').add_file)
vim.keymap.set('n', '<leader>hn', require('harpoon.ui').nav_next)
vim.keymap.set('n', '<leader>hp', require('harpoon.ui').nav_prev)
utils.map('n', [[<leader>hm]], ':Telescope harpoon marks<CR>')

-- Harpoon Which-key mappings
wk.register({
    -- The first key you are pressing
    h = {
        name  = "harpoon",
        -- the second key
        x = { function() require('harpoon.mark').add_file() end, "Mark file" }
    },
}, { prefix = "<leader>" })

-- bufferline
utils.map('n', [[<leader>bl]], ':BufferLinePick<CR>')

-- flash
wk.register({
    -- flash search
    l = {
        name = "flash",
        s = { function() require("flash").jump() end, "Flash Jump" },
        t = { function() require("flash").treesitter() end, "Flash Treesitter" },
        r = { function() require("flash").treesitter_search() end, "Flash Treesitter Search" },
    },
}, { prefix = "<leader>" })

