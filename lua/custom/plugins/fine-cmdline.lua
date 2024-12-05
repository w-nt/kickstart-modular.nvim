return {
  'VonHeikemen/fine-cmdline.nvim',
  dependencies = {
    'MunifTanjim/nui.nvim', -- Required dependency for fine-cmdline.nvim
  },
  config = function()
    require('fine-cmdline').setup {
      -- Example configuration (customize as needed)
      cmdline = {
        enable_keymaps = true,
        smart_history = true,
      },
      popup = {
        position = {
          row = '50%',
          col = '50%',
        },
        size = {
          width = 60,
          height = 'auto',
        },
      },
    }

    -- Optional keymap to open the cmdline
    vim.keymap.set('n', '<leader>fc', function()
      require('fine-cmdline').open()
    end, { desc = 'Open Fine Cmdline' })
  end,
}
