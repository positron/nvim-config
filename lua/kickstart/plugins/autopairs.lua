-- autopairs
-- https://github.com/windwp/nvim-autopairs

return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  -- Optional dependency
  dependencies = { 'hrsh7th/nvim-cmp' },
  config = function()
    local autopairs = require 'nvim-autopairs'
    autopairs.setup {
      --ignored_next_char = '', -- default doesn't pair if next char is alphanumberic or .
    }

    -- If you want to automatically add `(` after selecting a function or method
    local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
    local cmp = require 'cmp'
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

    -- remove single quote from lisps
    -- autopairs.get_rules("'")[1].not_filetypes = { 'clojure', 'scheme', 'lisp' }
    -- safer version:
    table.insert(autopairs.get_rules("'")[1].not_filetypes, 'clojure')
    table.insert(autopairs.get_rules("'")[1].not_filetypes, 'scheme')
    table.insert(autopairs.get_rules("'")[1].not_filetypes, 'lisp')
    -- autopairs.get_rules("'")[1].not_filetypes = { 'clojure', 'scheme', 'lisp' }
    --autopairs.get_rules("'")[2].not_filetypes = { 'clojure', 'scheme', 'lisp' }
    -- TODO: the above does not work. See the issue I filed: https://github.com/windwp/nvim-autopairs/issues/498
  end,
}
