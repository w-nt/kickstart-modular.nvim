-- Set the filetype for .h files to objc, for some reason vim detects .h as cpp
vim.cmd 'autocmd BufNewFile,BufRead *.h setfiletype objc'

---@module 'lazy'
---@type LazySpec
return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>cf',
        function() require('conform').format { async = true } end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    ---@module 'conform'
    ---@type conform.setupOpts
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true, r = true }

        local lsp_format_opt
        if disable_filetypes[vim.bo[bufnr].filetype] then
          lsp_format_opt = 'never'
        else
          lsp_format_opt = 'fallback'
        end

        return {
          timeout_ms = 500,
          lsp_format = lsp_format_opt,
        }
      end,
      default_format_opts = {
        lsp_format = 'fallback', -- Use external formatters if configured below, otherwise use LSP formatting. Set to `false` to disable LSP formatting entirely.
      },
      -- You can also specify external formatters in here.
      formatters_by_ft = {
        -- rust = { 'rustfmt' },
        -- Conform can also run multiple formatters sequentially
        python = { 'black' },
        c = { 'astyle' },
        objc = { 'astyle' },
        cpp = { 'astyle' },

        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
      },
      formatters = {
        astyle = {
          prepend_args = { '--style=allman', '--align-pointer=type', '--unpad-paren', '--align-reference=type', '--pad-header' },
        },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
