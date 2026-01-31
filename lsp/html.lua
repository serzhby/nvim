return {
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html", "templ" },
  init_options = {
    provideFormatter = true,
  },
}
