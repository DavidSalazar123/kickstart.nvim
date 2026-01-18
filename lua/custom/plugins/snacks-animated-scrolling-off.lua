return {
  "folke/snacks.nvim",
  opts = {
    scroll = { enabled = false },
    dashboard = { enabled = false },

    indent = {
      -- ENABLE the Snacks indent system (required!)
      enabled = true,

      -- Disable normal/static indent guides
      indent = {
        enabled = false,
      },

      -- Enable ONLY the current scope
      scope = {
        enabled = true,
        only_current = true,

        -- Animated guides for the active block
        animate = {
          enabled = true,
        },
      },
    },
  },
  keys = {
    history = false,
  },
}

