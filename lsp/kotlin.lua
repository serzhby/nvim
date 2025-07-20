return {
  --cmd = { "groovy-language-server" },
  cmd = { "kotlin-language-server" },
  --cmd = { "java -jar /home/sergey/dev/groovy-language-server-all.jar" },
  filetypes = { "kotlin" },
  root_markers = { "build.gradle", "settings.gradle" },
  --root_dir = function(fname)
  --  return vim.fs.dirname(vim.fs.find({ "build.gradle", "settings.gradle" }, { path = fname, upward = true })[1])
  --end,
  --init_options = {
  --  jvm_args = {
  --    "-Djava.util.logging.config.file=/home/sergey/.config/groovy-language-server/logging.properties",
  --  },
  --},
}
