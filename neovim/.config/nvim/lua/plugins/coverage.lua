return {
  'andythigpen/nvim-coverage',
  version = "*",
  event = 'VeryLazy',
  ft = { 'python' },
  config = function()
    require('coverage').setup({
      auto_reload = true,
      load_coverage_cb = function (ftype)
          vim.notify("Loaded " .. ftype .. " coverage")
      end,
    })
  end,
  keys = {
    {
      '<leader>tc',
      function()
        if not vim.b.coverage_loaded then
          require('coverage').load(true)
          vim.b.coverage_loaded = true
        else
          require('coverage').toggle()
        end
      end,
      desc = '[T]oggle [C]overage',
    },
    {
      ']a',
      function()
        require('coverage').jump_next('uncovered')
      end,
      desc = 'Jump to next uncovered block',
    },
    {
      '[a',
      function()
        require('coverage').jump_prev('uncovered')
      end,
      desc = 'Jump to previous uncovered block',
    },
  },
}
