return {

    {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim' -- Required for extension
        },
        config = function()
            local harpoon = require('harpoon')
            harpoon:setup()

            -- Load Telescope Harpoon extension (official way)
            local telescope = require('telescope')
            telescope.load_extension('harpoon')

            -- Key mappings
            vim.keymap.set('n', '<leader>hx', function() harpoon:list():add() end, { desc = 'Harpoon file [x]' })
            vim.keymap.set('n', '<leader>hl', function() telescope.extensions.harpoon.harpoon:start() end,
                { desc = 'Harpoon list' })
            vim.keymap.set('n', '<leader>hp', function() harpoon:list():prev() end, { desc = 'Harpoon previous' })
            vim.keymap.set('n', '<leader>hn', function() harpoon:list():next() end, { desc = 'Harpoon next' })
        end,
    }
}
