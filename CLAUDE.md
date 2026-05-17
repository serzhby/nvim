# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A personal Neovim configuration for a NixOS host. There is no build/test step — changes take effect when Neovim restarts (or on `:source` for the edited file). The plugin lockfile is `lazy-lock.json`; commit it after `:Lazy sync` / `:Lazy update`.

Leader key is `<Space>`.

## Layout & how plugin specs are organized

- `init.lua` — options, lazy.nvim bootstrap, a few global commands/autocmds, transparent-background highlight tweaks.
- `lua/plugins.lua` — does **not** declare plugins itself. It `require`s the category files below and flattens their returned lists via a local `combine()` helper before passing to `lazy.setup`. To add a plugin, append a spec to whichever category file fits; don't create new top-level files unless you also wire them into `combine(...)` in `lua/plugins.lua`.
  - `lua/core.lua` — telescope, treesitter, undotree, dap, jdtls, spectre, trouble, mini.\*, rest.nvim, etc.
  - `lua/look-and-feel.lua` — colorscheme (gruvbox), lualine, which-key, snacks, ufo, neoscroll, mini.comment, devicons.
  - `lua/git.lua` — fugitive, gitsigns, lazygit, octo, diffview, merginal.
  - `lua/files.lua` — oil, yazi, neo-tree.
  - `lua/code-assistant.lua` — codecompanion, copilot.vim. (`avante.nvim` block is intentionally commented out as a fallback reference.)
  - `lua/database.lua`, `lua/neorg-notes.lua` — present but commented out in `lua/plugins.lua`; un-comment in `combine(...)` to enable.
- `lua/keymaps.lua` — non-plugin keymaps only. Plugin keymaps live in each plugin's `keys = { ... }` spec (this was a deliberate refactor — see commit `238b0de`). Don't move keymaps back here.
- `plugin/globals.lua` — defines `P()` as a `vim.inspect`-print helper used during debugging.
- `ftdetect/policy2.vim` — maps `*.policy2`, `*.scoring`, `*.flow`, `*.product` to `groovy` (these are work-specific ID Finance file types).
- `ftplugin/java.lua` — Java/jdtls bootstrap (see below).
- `after/plugin/lsp.lua` — LSP enablement and `LspAttach` autocmd.

## LSP architecture (Neovim 0.11+ native style)

Every server except Java follows this pattern:

1. A file `lsp/<name>.lua` returns a config table (`cmd`, `filetypes`, `root_markers`, optional `settings`). Neovim auto-loads it via `vim.lsp.config`.
2. `after/plugin/lsp.lua` calls `vim.lsp.enable("<name>")` to activate it.

To add a new LSP: create `lsp/<name>.lua` and add one `vim.lsp.enable("<name>")` line to `after/plugin/lsp.lua`. No `lspconfig` package is used for these.

Completion is wired by the `LspAttach` autocmd in `after/plugin/lsp.lua` using `vim.lsp.completion.enable` (autotrigger off, manual trigger `<C-Space>`). `mini.completion` provides the UI fallback. Don't add `nvim-cmp` — it would conflict.

**Java is the exception.** `ftplugin/java.lua` calls `require('jdtls').start_or_attach(config)` directly because eclipse.jdt.ls needs `extendedClientCapabilities` and per-project-root client deduplication that `nvim-jdtls` provides. There is intentionally no `lsp/jdtls.lua`. The config:
- Expects JDK 21 at `~/dev/jdk21` and jdtls installed at `~/dev/jdtls/share/java/jdtls/` (from Nix).
- Copies the jdtls `config_linux` directory from the read-only Nix store to `~/.local/share/eclipse/jdtls-config` because Eclipse needs to write into it. An md5 checksum of `config.ini` is stored so the copy only re-runs after a Nix jdtls update. If you change anything about jdtls install paths, update both `jdtls_config_source` and the `-jar` glob in `cmd`.
- Workspace data goes under `~/.local/share/eclipse/<project-dir-name>/`.

## Treesitter

Pinned to the **`main` branch**, not `master` (see `lua/core.lua`). This uses the new install API (`require('nvim-treesitter').install(parsers)` + manual `vim.treesitter.start` on `FileType`). Any plugin spec that depends on treesitter must also pin `branch = "main"` — `rest.nvim` and `render-markdown.nvim` already do this. Don't switch back to `master`.

## Code assistant (CodeCompanion)

Default adapter is `litellm` (a self-hosted OpenAI-compatible proxy at `https://litellm.idfaws.com`). It reads `LITELLM_API_KEY` from the environment. The `copilot` adapter is also configured but not the default. Changing the default model means editing `schema.model.default` in the relevant adapter inside `lua/code-assistant.lua`.

## Conventions when editing this config

- Commented-out blocks (alternative colorschemes, avante, dbtpal, toggleterm, noice) are kept as references — don't delete them when making unrelated changes.
- When adding plugin keymaps, put them in the plugin's own `keys = { ... }` table so the plugin lazy-loads on first use; don't add them to `lua/keymaps.lua`.
- The custom `:Gconfig` and `:Gdeploy` commands in `init.lua` commit with hardcoded messages (`feat(mx): config.` / `feat(es): deploy.`) and push — they're personal shortcuts, not generic.
