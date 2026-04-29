return {
  cmd = { "kotlin-lsp", "--stdio", "--system-path", "~/.cache/kotlin-lsp" },
  single_file_support = true,
  filetypes = { "kotlin" },
  root_markers = { "settings.gradle", "settings.gradle.kts", "build.gradle", "build.gradle.kts", "pom.xml" },
}
