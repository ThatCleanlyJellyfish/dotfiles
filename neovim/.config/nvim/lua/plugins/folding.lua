return {
  {
    -- Open folds with `l`. Close folds with `h` when cursor is in column 1.
    'chrisgrieser/nvim-origami',
    event = 'VeryLazy',
    opts = {
      keepFoldsAcrossSessions = false,
      pauseFoldsOnSearch = true,
      setupFoldKeymaps = true,
      hOnlyOpensOnFirstColumn = false,
    },
  },
  {
    -- Alternative configurable folding for Python.
    'kalekundert/vim-coiled-snake',
    ft = { 'python' },
    opts = {},
    config = function()
      vim.g.coiled_snake_foldtext_flags = ''
    end,
  },
}
