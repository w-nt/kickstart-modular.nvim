--[[
  TODO: The very first thing you should do is to run the command `:Tutor` in Neovim.

    If you don't know what this means, type the following:
      - <escape key>
      - :
      - Tutor
      - <enter key>

    (If you already know the Neovim basics, you can skip this step.)

  Once you've completed that, you can continue working through **AND READING** the rest
  of the kickstart init.lua.

  Next, run AND READ `:help`.
    This will open up a help window with some basic information
    about reading, navigating and searching the builtin help documentation.

    This should be the first place you go to look when you're stuck or confused
    with something. It's one of my favorite Neovim features.

    MOST IMPORTANTLY, we provide a keymap "<space>sh" to [s]earch the [h]elp documentation,
    which is very useful when you're not exactly sure of what you're looking for.

  I have left several `:help X` comments throughout the init.lua
    These are hints about where to find more information about the relevant settings,
    plugins or Neovim features used in Kickstart.

   NOTE: Look for lines like this

    Throughout the file. These are for you, the reader, to help you understand what is happening.

If you experience any errors while trying to install kickstart, run `:checkhealth` for more info.

--]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
require 'options'

-- [[ Basic Keymaps ]]
require 'keymaps'

-- [[ Install `lazy.nvim` plugin manager ]]
require 'lazy-bootstrap'

-- [[ Configure and install plugins ]]
require 'lazy-plugins'

vim.opt.clipboard = 'unnamedplus'

vim.g.clipboard = {
  name = 'wl-clipboard-safe',
  copy = {
    ['+'] = function(lines, _) vim.fn.system({ 'wl-copy', '--type', 'text/plain' }, table.concat(lines, '\n')) end,
    ['*'] = function(lines, _) vim.fn.system({ 'wl-copy', '--type', 'text/plain' }, table.concat(lines, '\n')) end,
  },
  paste = {
    ['+'] = function() return vim.fn.systemlist 'wl-paste --no-newline' end,
    ['*'] = function() return vim.fn.systemlist 'wl-paste --no-newline' end,
  },
  cache_enabled = 0,
}

if vim.fn.has 'wsl' == 1 then
  vim.g.clipboard = {
    name = 'WslClipboard',
    copy = {
      ['+'] = 'clip.exe',
      ['*'] = 'clip.exe',
    },
    paste = {
      ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0,
  }
end

vim.g.copilot_enabled = false
-- 1. Disable the default Copilot Tab mapping so we can control it
vim.g.copilot_no_tab_map = true

vim.keymap.set('i', '<Tab>', function()
  -- 1. If Copilot ghost text is visible, accept it
  if vim.fn['copilot#GetDisplayedSuggestion']().text ~= '' then return vim.fn['copilot#Accept']() end

  -- 2. If the blink completion menu is open, CONFIRM the selection
  if require('blink.cmp').is_visible() then
    -- 'accept' confirms the current highlighted item
    require('blink.cmp').accept()
    return ''
  end

  -- 3. Snippet jumping (keeps your Neogen/Snippet workflow smooth)
  if require('blink.cmp').is_active() then
    require('blink.cmp').snippet_forward()
    return ''
  end

  -- 4. Otherwise, just insert a regular Tab
  return vim.api.nvim_replace_termcodes('<Tab>', true, true, true)
end, { expr = true, replace_keycodes = false, desc = 'Smart Tab: Accept over Scroll' })
