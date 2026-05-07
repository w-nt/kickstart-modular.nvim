return {
  'danymat/neogen',
  dependencies = 'nvim-treesitter/nvim-treesitter',
  config = true,
  keys = {
    {
      '<leader>n',
      function() require('neogen').generate() end,
      desc = 'Generate annotations',
    },
  },
}
