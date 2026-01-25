-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
        'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    keys = {
        { '<leader>n', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    },
    opts = {
        filesystem = {
            filtered_items = {
                hide_dotfiles = false,
                visible = true,
            },
            window = {
                position = 'right',
                mappings = {
                    ['<leader>n'] = 'close_window',
                },
            },
        },
    },
    config = function(_, opts)
        require('neo-tree').setup(opts)

        vim.api.nvim_create_autocmd('ColorScheme', {
            pattern = '*',
            callback = function()
                vim.api.nvim_set_hl(0, 'NeoTreeDimText', {fg = '#5a5a5a'})
                vim.api.nvim_set_hl(0, 'NeoTreeFileName', {fg = '#ffffff'})
            end,
        })
        vim.api.nvim_set_hl(0, 'NeoTreeDimText', {fg = '#5a5a5a'})
        vim.api.nvim_set_hl(0, 'NeoTreeFileName', {fg = '#ffffff'})

    end,
}
