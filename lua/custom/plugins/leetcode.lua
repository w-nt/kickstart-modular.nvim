return {
  'kawre/leetcode.nvim',
  build = ':TSUpdate html',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim', -- required by telescope
    'MunifTanjim/nui.nvim',
    '3rd/image.nvim',
    -- optional
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
    '',
  },
  opts = {
    -- configuration goes here
    lang = 'python3',
    image_suport = true,
  },
}
