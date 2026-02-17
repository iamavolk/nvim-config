return {
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000, -- To load ahead of all the other plugins
    opts = {
      cursorline = {
        -- theme options: dark, light
        -- blend in [0.0, 1.0]
        theme = 'light',
        blend = 0.5,
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
