return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts.picker = {
        sources = {
          explorer = {
            layout = {
              auto_hide = { "input" },
            },
          },
        },
      }
    end,
  },
}
