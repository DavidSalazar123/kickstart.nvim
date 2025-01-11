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
        view = { merge_tool = { layout = 'diff3_mixed' } },
      }
    end,
  },
  {
    'folke/trouble.nvim',
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = 'Trouble',
    keys = {
      {
        '[da',
        '<cmd>Trouble diagnostics toggle focus=true<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '[df',
        '<cmd>Trouble diagnostics toggle filter.buf=0 focus=true<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
    },
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup()

      -- basic telescope configuration
      local conf = require('telescope.config').values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require('telescope.pickers')
          .new({}, {
            prompt_title = 'Harpoon',
            finder = require('telescope.finders').new_table {
              results = file_paths,
            },
            previewer = conf.file_previewer {},
            sorter = conf.generic_sorter {},
          })
          :find()
      end

      vim.keymap.set('n', '<leader>hx', function()
        harpoon:list():add()
      end, { desc = 'Mark file [x]' })
      vim.keymap.set('n', '<leader>hl', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = 'List all harpoons' })
      vim.keymap.set('n', '<leader>hp', function()
        harpoon:list():prev()
      end, { desc = 'Previous harpoon file' })
      vim.keymap.set('n', '<leader>hn', function()
        harpoon:list():next()
      end, { desc = 'Next harpoon file' })
    end,
  },
  {
    'numToStr/Comment.nvim',
    opts = {
      toggler = {
        line = 'gcc', -- Default for line comments
        block = 'gcb', -- Default for block comments
      },
      opleader = {
        line = 'gc', -- Default for line comments
        block = 'cb', -- Default for block comments
      },
      mappings = {
        basic = true, -- Enable basic mappings
        extra = false, -- Disable extra mappings (if not needed)
        extended = false, -- Disable extended mappings (if not needed)
      },
    },
  },
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
  },
  {
    'windwp/nvim-ts-autotag',
    opts = {
      enable_close = true,
      enable_rename = true,
      enavle_close_on_slash = true,
    },
  },
}
