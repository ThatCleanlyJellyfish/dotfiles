local terminal_key = ','
return {
  'akinsho/toggleterm.nvim',
  version = "*",
  init = function ()
    local trim_spaces = true
    local toggleterm = require("toggleterm")
    vim.keymap.set(
      'n',
      'g' .. terminal_key,
      function()
        toggleterm.send_lines_to_terminal("single_line", trim_spaces, { args = vim.v.count })
        toggleterm.toggle()
      end,
      { desc = 'Send current line to terminal' }
    )
    vim.keymap.set(
      'v',
      'g' .. terminal_key,
      function()
        toggleterm.send_lines_to_terminal("visual_selection", trim_spaces, { args = vim.v.count })
        toggleterm.toggle()
      end,
      { desc = 'Send visual selection to terminal' }
    )
  end,
  opts = {
    open_mapping = terminal_key,
    insert_mappings = false,  -- Don't add insert mode mappings.
    hide_numbers = true,
    shade_terminals = true,
    start_in_insert = true,
    persist_size = true,
    close_on_exit = true,  -- Close terminal window when shell exits.
    shell = vim.o.shell,
    direction = 'float',  -- vertical, horizontal, tab or float.
    float_opts = {
    },
  },
}
