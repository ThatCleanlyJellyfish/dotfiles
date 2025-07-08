return {
  {
    -- Open folds with `l`. Close folds with `h` when cursor is in column 1.
    'chrisgrieser/nvim-origami',
    event = 'VeryLazy',
    opts = {
      keepFoldsAcrossSessions = false,
      pauseFoldsOnSearch = true,
      foldtext = {
        enabled = true,
        padding = 3,
        lineCount = {
          template = "%d", -- `%d` is replaced with the number of folded lines
          hlgroup = "Comment",
        },
        diagnosticsCount = true, -- uses hlgroups and icons from `vim.diagnostic.config().signs`
        gitsignsCount = true, -- requires `gitsigns.nvim`
      },
      foldKeymaps = {
        setup = true, -- modifies `h` and `l`
        hOnlyOpensOnFirstColumn = false,
      },
      autofold = {
        -- Enable auto-fold by default. Although this gets disabled in the
        -- autocmd below for short files.
        enabled = true,
        kinds = { "comment", "imports" }, ---@type lsp.FoldingRangeKind[]
      },
    },
    config = function(_, opts)
      -- Disable autofold for short files.
      vim.api.nvim_create_autocmd('BufReadPost', {
        callback = function()
          local line_count = vim.api.nvim_buf_line_count(0)
          if line_count < 50 then
            vim.b.origami_auto_fold = false
          end
        end,
      })
    end,
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
