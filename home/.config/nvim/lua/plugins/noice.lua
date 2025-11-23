return {
  {
    "folke/noice.nvim",
    -- enabled = false,
    opts = {
      cmdline = {
        view = "cmdline", -- move command line to bottom
        format = {
          cmdline = { conceal = false },
          search_down = { conceal = false },
          search_up = { conceal = false },
          filter = { conceal = false },
          lua = { conceal = false },
          help = { conceal = false },
          input = { conceal = false },
        },
      },
      presets = { command_palette = false }, -- do not pop-up command line tab completions at the top
    },
  },
}
