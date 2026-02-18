return {
  cmd = { "graphql-lsp", "server", "-m", "stream" };
  filetypes = { "graphql" };
  root_markers = { "schema.graphqls", "graphql.config.yml", ".graphqlrc.yml" },
}
