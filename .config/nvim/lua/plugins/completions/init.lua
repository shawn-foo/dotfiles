return {
  require("plugins.completions.navbuddy"),
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require('nvim-ts-autotag').setup({
        opts = {
          -- Defaults
          enable_close = true,    -- Auto close tags
          enable_rename = true,   -- Auto rename pairs of tags
          enable_close_on_slash = false -- Auto close on trailing </
        },
        -- Also override individual filetype configs, these take priority.
        -- Empty by default, useful if one of the "opts" global settings
        -- doesn't work well in a specific filetype
        per_filetype = {
          ["html"] = {
            enable_close = false
          }
        }
      })
    end
  },
  require("plugins.completions.cmp"),
  require("plugins.completions.lsp"),
  require("plugins.completions.luasnip"),
  require("plugins.completions.mason"),
  require("plugins.completions.none-ls"),
  require("plugins.completions.snippet"),
}
