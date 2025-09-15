local state = {
  floating = {
    buf = -1,
    win = -1,
  },
}

local function create_floating_window(opts)
  opts = opts or {}

  local width  = opts.width  or math.floor(vim.o.columns * 0.8)
  local height = opts.height or math.floor(vim.o.lines * 0.8)
  local col    = math.floor((vim.o.columns - width) / 2)
  local row    = math.floor((vim.o.lines - height) / 2)

  local buf
  if opts.buf and vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true)
  end

  local win_config = {
    relative = "editor",
    width    = width,
    height   = height,
    col      = col,
    row      = row,
    style    = "minimal",
    border   = "rounded",
  }

  local win = vim.api.nvim_open_win(buf, true, win_config)

  return { buf = buf, win = win }
end

local toggle_terminal = function(lazy_flag)
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    local buf

    if lazy_flag then
        buf = vim.api.nvim_create_buf(false, true)
    else
        if vim.api.nvim_buf_is_valid(state.floating.buf) then
            buf = state.floating.buf
        else
            buf = vim.api.nvim_create_buf(false, true)
        end
    end

    state.floating = create_floating_window { buf = buf }

    if lazy_flag then
            -- local buf = vim.api.nvim_create_buf(false, true)
            -- state.floating = create_floating_window { buf = buf }
            vim.fn.termopen('lazygit', {
                on_exit = function(_,_,_)
                    if vim.api.nvim_win_is_valid(state.floating.win) then
                        vim.api.nvim_win_close(state.floating.win, true)
                    end
                    if vim.api.nvim_buf_is_valid(state.floating.buf) then
                        vim.api.nvim_buf_delete(state.floating.buf, {force=true})
                    end
        end,})
        vim.cmd('startinsert')
    end

    if vim.bo[state.floating.buf].buftype ~= "terminal" then
      vim.cmd.term()
    end
  else
    vim.api.nvim_win_hide(state.floating.win)
  end
end

vim.api.nvim_create_user_command("Floatingterminal", function()
    toggle_terminal(false)
end, {})
vim.api.nvim_create_user_command("Lazygit", function()
    toggle_terminal(true)
end, {})
