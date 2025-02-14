local M = {}
local actions = require("telescope.actions")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local sorters = require("telescope.sorters")

function M.open_git_modal()
  local git_commands = {
    { display = "󰊢 Git Status", command = "Git status" },
    { display = "󰊢 Git Add All", command = "Git add ." },
    { display = "󰊢 Git Commit", command = "Git commit" },
    { display = "󰊢 Git Push", command = "Git push" },
    { display = "󰊢 Git Pull", command = "Git pull" },
    { display = "󰊢 Git Init", command = "Git init" },
    { display = "󰜂 Set Git Origin", command = ":set_origin" },
    { display = "󰘔 Set Git Branch", command = ":set_branch" },
  }

  pickers.new({}, {
    prompt_title = "Git Commands",
    finder = finders.new_table({
      results = git_commands,
      entry_maker = function(entry)
        return {
          value = entry.command,  -- Armazenamos o comando ou identificador
          display = entry.display,
          ordinal = entry.display,
        }
      end,
    }),
    sorter = sorters.get_generic_fuzzy_sorter(),
    attach_mappings = function(prompt_bufnr, _)
      actions.select_default:replace(function()
        local selection = require("telescope.actions.state").get_selected_entry()
        actions.close(prompt_bufnr)
        
        -- Tratamento dos comandos especiais
        if selection.value == ":set_origin" then
          vim.ui.input({ prompt = "Enter remote URL: " }, function(input)
            if input and #input > 0 then
              vim.cmd("Git remote add origin " .. input)
            else
              print("No URL provided")
            end
          end)
        elseif selection.value == ":set_branch" then
          vim.ui.input({ prompt = "Enter branch name: " }, function(input)
            if input and #input > 0 then
              vim.cmd("Git checkout -b" .. input)  -- -b para criar se não existir
            else
              print("No branch name provided")
            end
          end)
        else
          -- Executa comandos Git normais
          vim.cmd(selection.value)
        end
      end)
      return true
    end,
  }):find()
end

return M
