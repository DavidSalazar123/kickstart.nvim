return {
    'nvim-pack/nvim-spectre',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        { '<leader>fr', function() require('spectre').open() end,  desc = 'Open Spectre search panel' },
        { '<leader>fc', function() require('spectre').close() end, desc = 'Close Spectre search panel' },
    },
    config = function()
        require('spectre').setup {
            replace_engine = { cmd = 'sed', args = { '-i', '' } },
        }
    end,
}
