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
  }

  pickers.new({}, {
    prompt_title = "Git Commands",
    finder = finders.new_table({
      results = git_commands,
      entry_maker = function(entry)
        return {
          value = entry.command,
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
        vim.cmd(selection.value)
      end)
      return true
    end,
  }):find()
end

return M

