# Neovim Configuration with Lazy.nvim

This guide covers setting up Neovim with various plugins using `lazy.nvim` for autocompletion, LSP support, snippets, and more.

## Plugin Overview

### 1. `windwp/nvim-autopairs`

**Functionality:** Automatically closes brackets, parentheses, quotes, etc. when you open them. For example, when you type `{`, it automatically adds `}`.

**Key Features:**
- Auto-pairing of brackets, quotes, etc.
- Integration with `nvim-cmp` to handle pairs in completion items.

### 2. `neovim/nvim-lspconfig`

**Functionality:** Simplifies the setup of Neovim's built-in Language Server Protocol (LSP) client, allowing easy configuration of LSP servers.

**Key Features:**
- Quick setup for a variety of LSP servers.
- Provides capabilities like code completion, diagnostics, code actions, and more.

### 3. `hrsh7th/nvim-cmp`

**Functionality:** A completion plugin for Neovim. It provides a framework for autocompletion, allowing integration with various sources like LSP, snippets, buffers, etc.

**Key Features:**
- Modular and highly configurable.
- Supports multiple completion sources (LSP, buffer, path, snippets, etc.).

### 4. `hrsh7th/cmp-nvim-lsp`

**Functionality:** A source for `nvim-cmp` that provides completion items from Neovim's built-in LSP.

**Key Features:**
- Integrates LSP completion items into `nvim-cmp`.

### 5. `hrsh7th/cmp-nvim-lsp-signature-help`

**Functionality:** A source for `nvim-cmp` that provides signature help from Neovim's built-in LSP.

**Key Features:**
- Displays function signatures as you type, helping you understand the parameters required by functions.

### 6. `saadparwaiz1/cmp_luasnip`

**Functionality:** A source for `nvim-cmp` that provides completion items from `LuaSnip` snippets.

**Key Features:**
- Integrates snippet completions into `nvim-cmp`.

### 7. `jose-elias-alvarez/null-ls.nvim`

**Functionality:** Allows you to use non-LSP sources (like linters, formatters, and code actions) as if they were LSP servers. This plugin enables tools that don't natively support LSP to work with Neovim's LSP client.

**Key Features:**
- Provides integration for formatters, linters, and code actions.
- Highly configurable and supports a wide range of tools.

### 8. `L3MON4D3/LuaSnip`

**Functionality:** A snippet engine for Neovim. Allows you to define and use code snippets in various languages.

**Key Features:**
- Supports defining and expanding snippets.
- Highly configurable and supports different snippet formats.

### 9. `rafamadriz/friendly-snippets`

**Functionality:** A collection of pre-defined snippets for various programming languages. It is designed to be used with snippet engines like `LuaSnip`.

**Key Features:**
- Provides a large library of snippets for many programming languages.
- Works out of the box with popular snippet engines.
