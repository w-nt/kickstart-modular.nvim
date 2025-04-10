return {
  'jpalardy/vim-slime',
  init = function()
    -- Tell vim-slime to target Tmux, not Kitty
    vim.g.slime_target = 'tmux'

    -- Optional: Set default config for Tmux (adjust based on your Tmux setup)
    vim.g.slime_default_config = {
      socket_name = 'default', -- Default tmux socket, adjust if you use a different one
      target_pane = '{last}', -- Adjust to your preferred pane (e.g., "1.2" for a fixed pane)
    }

    -- Optional: Don't ask for confirmation when sending code to Tmux pane
    vim.g.slime_dont_ask_default = 1
  end,
}
