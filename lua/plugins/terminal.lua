return {
  "akinsho/toggleterm.nvim",
  version = "*",

  config = function()
    require("toggleterm").setup({
      size = 15,
      open_mapping = [[<A-t>]],
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 1,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "float",
      float_opts = {
        border = "rounded",
        width = math.floor(vim.o.columns * 0.85),
        height = math.floor(vim.o.lines * 0.85),
      },
    })

    local Terminal = require("toggleterm.terminal").Terminal

    local float_term = Terminal:new({
      direction = "float",
      float_opts = { border = "rounded" },
    })
    vim.keymap.set("n", "<A-f>", function()
      float_term:toggle()
    end, { noremap = true, silent = true })

    local vert_term = Terminal:new({
      direction = "vertical",
      size = 60,
    })
    vim.keymap.set("n", "<A-v>", function()
      vert_term:toggle()
    end, { noremap = true, silent = true })

    local horiz_term = Terminal:new({
      direction = "horizontal",
      size = 15,
    })
    vim.keymap.set("n", "<A-h>", function()
      horiz_term:toggle()
    end, { noremap = true, silent = true })

    vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })

    vim.keymap.set("t", "<Esc><Esc>", function()
      float_term:toggle()
    end, { noremap = true, silent = true })
  end,
}

