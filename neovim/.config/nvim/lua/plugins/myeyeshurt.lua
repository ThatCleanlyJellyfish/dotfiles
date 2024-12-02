return {
  "wildfunctions/myeyeshurt",
  opts = {
    initialFlakes = 1,
    flakeOdds = 20,
    maxFlakes = 750,
    nextFrameDelay = 175,
    useDefaultKeymaps = true,
    flake = {'*', '.'},
    minutesUntilRest = 20,
  },
  config = function()
    require('myeyeshurt').setup {}
    vim.keymap.set("n", "<leader>ms", function() require("myeyeshurt").start() end, {desc="Start snow", noremap = true, silent = true})
    vim.keymap.set("n", "<leader>mx", function() require("myeyeshurt").stop() end, {desc="Stop snow", noremap = true, silent = true})
  end,
}
