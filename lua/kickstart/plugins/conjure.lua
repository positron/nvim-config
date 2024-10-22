-- conjure clojure support
-- https://github.com/Olical/conjure

return {
  {
    'Olical/conjure',
    ft = { 'clojure', 'fennel', 'python' }, -- etc
    lazy = true,
    init = function()
      -- Set configuration options here
      -- Uncomment this to get verbose logging to help diagnose internal Conjure issues
      -- vim.g["conjure#debug"] = true

      -- Enable evaluating comment blocks
      vim.g['conjure#eval#gsubs'] = {
        ['do-comment'] = {
          '^%(comment[%s%c]', -- match pattern
          '(do ', -- replacement
        },
      }

      -- The default conjure mappings specifically for clojure collide with telescope search hotkeys.
      -- Disable or remap them.
      -- NOTE: Upon discovering more collisions, look up the config with `:help conjure` or `:help conjure-client-clojure-nrepl`
      vim.g['conjure#client#clojure#nrepl#mapping#session_clone'] = false
      vim.g['conjure#client#clojure#nrepl#mapping#session_fresh'] = false
      vim.g['conjure#client#clojure#nrepl#mapping#session_close'] = false
      vim.g['conjure#client#clojure#nrepl#mapping#session_close_all'] = false
      vim.g['conjure#client#clojure#nrepl#mapping#session_list'] = false
      vim.g['conjure#client#clojure#nrepl#mapping#session_next'] = false
      vim.g['conjure#client#clojure#nrepl#mapping#session_prev'] = false
      vim.g['conjure#client#clojure#nrepl#mapping#session_select'] = false

      -- Change some mappings to my muscle memory from previous clojure plugins
      -- NOTE: Mappings are prefixed by default. To ignore the prefix wrap in an array. Like: { '<LocalLeader>cc' }
      vim.g['conjure#client#clojure#nrepl#mapping#run_current_test'] = 'rt'
      vim.g['conjure#client#clojure#nrepl#mapping#run_current_ns_tests'] = 'rnt'
      vim.g['conjure#client#clojure#nrepl#mapping#run_all_tests'] = 'rat'

      -- TODO: Make gd do go to definition?
    end,

    -- Optional cmp-conjure integration
    dependencies = { 'PaterJason/cmp-conjure' },
  },
  {
    'PaterJason/cmp-conjure',
    lazy = true,
    config = function()
      local cmp = require 'cmp'
      local config = cmp.get_config()
      table.insert(config.sources, { name = 'conjure' })
      return cmp.setup(config)
    end,
  },
}
