vim.api.nvim_create_autocmd('VimResized', {
  desc = 'Resize splits when the parent window is resized.',
  pattern = '*',
  command = 'wincmd =',
})

-- vim: ts=2 sts=2 sw=2 et
