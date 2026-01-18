return {
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-mini/mini.icons" },
    config = function()
      local alpha = require("alpha")
      alpha.setup(require("alpha.themes.startify").config)
      -- Disable snacks_picker interference
      vim.g.snacks_picker_alpha_integration = false
    end,
  },
}

