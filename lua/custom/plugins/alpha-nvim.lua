return {
  {import = 'lazyvim.plugins.extras.ui.alpha', enabled = false},
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { "nvim-mini/mini.icons" },
    config = function()
      local alpha = require("alpha")
      local startify = require("alpha.themes.startify")
      alpha.setup(startify.config)
    end,
  },
}

