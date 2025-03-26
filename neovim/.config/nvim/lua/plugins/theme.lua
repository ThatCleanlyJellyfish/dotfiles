return {
  'folke/tokyonight.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  opts = {
    dim_inactive = true,
    styles = {
      comments = { italic = true },
    },
    on_highlights = function(highlights, colors)
      highlights.Folded = { bg = colors.bg_dark }
    end,
  },
  config = function(_, opts)
    require('tokyonight').setup(opts)
    vim.cmd.colorscheme 'tokyonight-night'
  end,
}
