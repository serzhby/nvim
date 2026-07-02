return {
  {
    'Mathijs-Bakker/godotdev.nvim',
    enabled = not vim.g.is_devcontainer,
    dependencies = { 'nvim-dap', 'nvim-dap-ui', 'nvim-treesitter' },
    config = {
      autostart_editor_server = true
    }
  }
}
