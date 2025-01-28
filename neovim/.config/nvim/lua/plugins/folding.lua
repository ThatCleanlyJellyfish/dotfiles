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
    -- Syntax hilighting on closed folds.
    'kevinhwang91/nvim-ufo',
    dependencies = {
      'kevinhwang91/promise-async',
    },
    opts = {
      provider_selector = function(_, _, _)
        return {'treesitter', 'indent'}
      end,
      open_fold_hl_timeout = 0,
      fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local suffix = (' 󰁂 %d '):format(endLnum - lnum)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, {chunkText, hlGroup})
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
              suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end
        table.insert(newVirtText, {suffix, 'MoreMsg'})
        return newVirtText
      end
    },
  },
  -- {
  --   -- Alternative configurable folding for Python.
  --   'kalekundert/vim-coiled-snake',
  --   ft = { 'python' },
  --   opts = {},
  --   config = function()
  --     vim.g.coiled_snake_foldtext_flags = ''
  --   end,
  -- },
}
