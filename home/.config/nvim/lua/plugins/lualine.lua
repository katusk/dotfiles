return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options.section_separators = " "
      opts.options.component_separators = ""
      opts.sections.lualine_z = opts.sections.lualine_y
      opts.sections.lualine_y = {
        {
          "encoding",
          -- Show '[BOM]' when the file has a byte-order mark
          show_bomb = true,
        },
        "fileformat",
      }
    end,
  },
}
