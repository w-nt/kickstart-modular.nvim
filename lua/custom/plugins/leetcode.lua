return {
  'kawre/leetcode.nvim',
  build = ':TSUpdate html',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim', -- required by telescope
    'MunifTanjim/nui.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    -- configuration goes here
    arg = 'lc',
    lang = 'python3',
    logging = true,
    image_support = false,
  },
}
