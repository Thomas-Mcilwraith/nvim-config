vim.keymap.set("n", "<leader>df", function()
  local telescope = require("telescope.builtin")
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")

  local function pick_second_file(first_file)
    telescope.find_files({
      prompt_title = "Select Second File",
      attach_mappings = function(prompt_bufnr2)
        actions.select_default:replace(function()
          local second_file = action_state.get_selected_entry().path
          actions.close(prompt_bufnr2)

          -- Call the plugin via Vim command
          vim.cmd(string.format("CodeDiff file %s %s", first_file, second_file))
        end)
        return true
      end
    })
  end

  telescope.find_files({
    prompt_title = "Select First File",
    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        local first_file = action_state.get_selected_entry().path
        actions.close(prompt_bufnr)

        pick_second_file(first_file)
      end)
      return true
    end
  })
end, { noremap = true, silent = true, desc = "[F]iles"})

vim.keymap.set("n", "<leader>dd", function()
  local has_fd = vim.fn.executable("fd") == 1
  local find_cmd = nil

  if has_fd then
    find_cmd = { "fd", "--type", "d", "--hidden", "--follow" }
  else
    -- fallback to find if fd is not available
    find_cmd = { "find", ".", "-type", "d", "-not", "-path", "*/.*" }
  end

  local telescope = require("telescope.builtin")
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")

  local function pick_second_dir(first_dir)
    telescope.find_files({
      prompt_title = "Select Second Directory",
      find_command = find_cmd,
      attach_mappings = function(prompt_bufnr2)
        actions.select_default:replace(function()
          local second_dir = action_state.get_selected_entry().path
          actions.close(prompt_bufnr2)

          -- Call CodeDiff with dir subcommand
          vim.cmd(string.format("CodeDiff dir %s %s", first_dir, second_dir))
        end)
        return true
      end,
    })
  end

  telescope.find_files({
    prompt_title = "Select First Directory",
    find_command = find_cmd,
    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        local first_dir = action_state.get_selected_entry().path
        actions.close(prompt_bufnr)

        pick_second_dir(first_dir)
      end)
      return true
    end,
  })
end, { noremap = true, silent = true, desc = "[D]irectories"})
