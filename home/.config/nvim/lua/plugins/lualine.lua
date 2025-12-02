return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options.section_separators = " "
      opts.options.component_separators = ""
      table.insert(opts.sections.lualine_x, {
        "encoding",
        -- Show '[BOM]' when the file has a byte-order mark
        show_bomb = true,
      })
      table.insert(opts.sections.lualine_x, "fileformat")
    end,
  },
}
