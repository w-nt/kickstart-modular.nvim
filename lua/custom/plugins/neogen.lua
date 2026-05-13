return {
  'danymat/neogen',
  dependencies = 'nvim-treesitter/nvim-treesitter',
  config = function()
    require('neogen').setup {
      enabled = true,
      snippet_engine = 'luasnip',
      languages = {
        python = {
          template = {
            annotation_convention = 'google_docstrings',
          },
          -- This specifically tells Neogen to find types in the code
          extract_types = true,
          -- This ensures it puts a placeholder like (float) if it finds it
          type_placeholder = 'any',
        },
      },
    }
  end,
  keys = {
    {
      '<leader>n',
      function() require('neogen').generate() end,
      desc = 'Generate Annotations',
    },
  },
}
