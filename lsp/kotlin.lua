return {
  --cmd = { "groovy-language-server" },
  --cmd = { "kotlin-language-server" },
  cmd = { "/home/sergey/dev/kotlin-lsp/kotlin-lsp.sh", "--stdio" },
  single_file_support = true,
  filetypes = { "kotlin" },
  root_markers = { "settings.gradle", "build.gradle" },
  --root_dir = function(fname)
  --  return vim.fs.dirname(vim.fs.find({ "build.gradle", "settings.gradle" }, { path = fname, upward = true })[1])
  --end,
  --init_options = {
  --  jvm_args = {
  --    "-Djava.util.logging.config.file=/home/sergey/.config/groovy-language-server/logging.properties",
  --  },
  --},
}
