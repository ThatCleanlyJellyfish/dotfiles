-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ["\\"] = 'close_window',
          ["l"] = "open",
          ["h"] = "close_node",
          ["A"]  = "git_add_all",
          ["u"] = "git_unstage_file",
          ["a"] = "git_add_file",
          ["c"] = "git_commit",
          ["p"] = "git_push",
        },
      },
      use_libuv_file_watcher = true,
    },
    default_component_configs = {
      name = { trailing_slash = true },
      type = { enabled = false },
    },
  },
}
