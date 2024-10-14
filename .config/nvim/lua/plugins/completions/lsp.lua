return {
  -- LSP Config
  {
    dependencies = {
      {
        "SmiteshP/nvim-navbuddy",
        dependencies = {
          "SmiteshP/nvim-navic",
          "MunifTanjim/nui.nvim",
        },
        opts = { lsp = { auto_attach = true } },
        config = function()
          vim.keymap.set("n", "nv", ":Navbuddy<CR>")
        end,
      },
    },
    "neovim/nvim-lspconfig",
    config = function()
      local navbuddy = require("nvim-navbuddy")
      local lspconfig = require("lspconfig")
      lspconfig.rust_analyzer.setup({})
      local servers = { "pyright", "tsserver", "clangd", "lua_ls", "tailwindcss", "prismals" }
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({
          capabilities = capabilities,
          on_attach = function(client, bufnr)
            navbuddy.attach(client, bufnr)
          end,
        })
      end

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
  },
}
