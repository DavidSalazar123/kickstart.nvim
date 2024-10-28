-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'goolord/alpha-nvim',
    dependencies = { 'echasnovski/mini.icons' },
    config = function()
      require('alpha').setup(require('alpha.themes.startify').config)
    end,
  },
  {
    'sindrets/diffview.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local diffview = require 'diffview'

      -- Key mappings
      vim.api.nvim_set_keymap('n', '<leader>dc', ':DiffviewClose<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>df', ':DiffviewOpen HEAD -- %<CR>', { noremap = true, silent = true }) -- Diff uncommitted changes
      vim.api.nvim_set_keymap('n', '<leader>da', ':DiffviewOpen <CR>', { noremap = true, silent = true }) -- Diff uncommitted changes

      -- Diffview configuration
      diffview.setup {
        diff_binaries = true,
        enhanced_diff_hl = true,
        use_icons = true,
      }
    end,
  },
}
