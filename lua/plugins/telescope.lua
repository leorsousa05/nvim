return {
  "nvim-telescope/telescope.nvim",

  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  config = function()
    require("telescope").setup({
      defaults = {
        prompt_prefix = "🔍 ",
        selection_caret = " ",
        layout_strategy = "horizontal",
        layout_config = {
          width = 0.9,
          height = 0.9,
        },
        mappings = {
          i = {
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
          },
        },
      },
      extensions = {},
    })
  end,
}

