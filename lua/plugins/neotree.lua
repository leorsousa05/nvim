return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  event = "VeryLazy",
  cmd = "Neotree",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },

  config = function()
    vim.g.neo_tree_remove_legacy_commands = 1

    require("neo-tree").setup({
      close_if_last_window = true,
      popup_border_style = "rounded",

      enable_git_status = true,
      enable_diagnostics = true,

      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {},
        },

        follow_current_file = {
          enabled = true,
        },

        hijack_netrw_behavior = "open_current",
      },

      window = {
        width = 32,
        mappings = {
          ["<space>"] = "toggle_node",
          ["o"] = "open",
          ["s"] = "open_split",
          ["v"] = "open_vsplit",
          ["t"] = "open_tabnew",
          ["q"] = "close_window",
        },
      },

      default_component_configs = {
        git_status = {
          symbols = {
            added     = "",
            modified  = "",
            deleted   = "✖",
            renamed   = "󰁕",
            untracked = "★",
            ignored   = "◌",
          },
        },
      },
    })

    vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", { noremap = true, silent = true })
  end,
}

