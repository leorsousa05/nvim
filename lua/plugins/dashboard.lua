return {
  "nvimdev/dashboard-nvim",
  priority = 999,
  lazy = false,
  event = "VimEnter",

  config = function()
    require("dashboard").setup({
      theme = "hyper",

      config = {
        header = {
          "███╗   ██╗██╗   ██╗██╗███╗   ███╗",
          "████╗  ██║██║   ██║██║████╗ ████║",
          "██╔██╗ ██║██║   ██║██║██╔████╔██║",
          "██║╚██╗██║██║   ██║██║██║╚██╔╝██║",
          "██║ ╚████║╚██████╔╝██║██║ ╚═╝ ██║",
          "╚═╝  ╚═══╝ ╚═════╝ ╚═╝╚═╝     ╚═╝",
        },

        shortcut = {
          { desc = "󰈞 Arquivos", group = "@string", action = "Telescope find_files", key = "f" },
          { desc = " Explorer", group = "@property", action = "Neotree toggle", key = "e" },
          { desc = "󰈭 Buscar", group = "@keyword", action = "Telescope live_grep", key = "g" },
          { desc = " Novo", group = "@constant", action = "ene", key = "n" },
          { desc = "󰒲 Plugins", group = "@include", action = "Lazy", key = "p" },
          { desc = " Config", group = "@function", action = "edit $MYVIMRC", key = "c" },
          { desc = "󰩈 Sair", group = "@macro", action = "qa", key = "q" },
        },

        footer = function()
          local stats = require("lazy").stats()
          return {
            "",
            "⚡ Plugins carregados: " .. stats.loaded,
            " " .. os.date("%H:%M"),
          }
        end,
      },
    })
  end,
}

