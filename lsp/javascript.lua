return {
  cmd = { "typescript-language-server", "--stdio" },
  -- single_file_support = true,
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact"
  },
  root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
}
