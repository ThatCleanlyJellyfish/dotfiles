-- Use focus.nvim for its UI options like disabling relativenumber on unfocussed windows.
return {
  'beauwilliams/focus.nvim',
  version = false,
  opts = {
    autoresize = {
      enable = false,
      height_quickfix = 10,
    },
    -- Set option 'true' to enable the option in the focussed window only.
    ui = {
      number = false,
      relativenumber = false,
      hybridnumber = true,
      absolutenumber_unfocussed = true, -- Preserve absolute line numbers in unfocussed windows.
      signcolumn = false,
      cursorline = true,
      cursorcolumn = false,
      winhighlight = false,
    },
  },
  config = function ()
    -- Disable focus.nvim for these file and buffer types.
    local ignore_filetypes = { 'neo-tree' }
    local ignore_buftypes = { 'nofile', 'prompt', 'popup' }

    local augroup =
        vim.api.nvim_create_augroup('FocusDisable', { clear = true })

    vim.api.nvim_create_autocmd('WinEnter', {
        group = augroup,
        callback = function(_)
            if vim.tbl_contains(ignore_buftypes, vim.bo.buftype)
            then
                vim.w.focus_disable = true
            else
                vim.w.focus_disable = false
            end
        end,
        desc = 'Disable focus autoresize for BufType',
    })

    vim.api.nvim_create_autocmd('FileType', {
        group = augroup,
        callback = function(_)
            if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
                vim.b.focus_disable = true
            else
                vim.b.focus_disable = false
            end
        end,
        desc = 'Disable focus autoresize for FileType',
    })
  end,
}
