return {
  "lervag/vimtex",
  lazy = false,
  init = function()
    vim.g.vimtex_view_method = "zathura_simple"
    vim.g.vimtex_quickfix_open_on_warning = 0

    -- Tell VimTeX to use latexmk (this is actually the default)
    vim.g.vimtex_compiler_method = "latexmk"
  end,
}
