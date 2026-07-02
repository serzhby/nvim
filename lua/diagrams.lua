return {
  {
    "3rd/image.nvim",
    ft = { "markdown" },
    build = false,
    opts = {
      backend = "kitty",
      processor = "magick_cli",
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          filetypes = { "markdown" },
        },
        neorg     = { enabled = false },
        asciidoc  = { enabled = false },
        rst       = { enabled = false },
        typst     = { enabled = false },
        html      = { enabled = false },
        css       = { enabled = false },
      },
      max_width_window_percentage = nil,
      max_height_window_percentage = 50,
      window_overlap_clear_enabled = false,
      window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "snacks_notif", "scrollview" },
      editor_only_render_when_focused = false,
      tmux_show_only_in_active_window = false,
      hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
    },
  },

  {
    "3rd/diagram.nvim",
    ft = { "markdown" },
    dependencies = { "3rd/image.nvim" },
    opts = function()
      return {
        integrations = {
          require("diagram.integrations.markdown"),
        },
        renderer_options = {
          mermaid  = {
            theme = "forest",
            scale = 2
          },
          plantuml = { charset = "utf-8" },
          d2       = { theme_id = 1 },
          gnuplot  = { theme = "dark", size = "800,600" },
        },
        events = {
          render_buffer = { "InsertLeave", "BufWinEnter", "TextChanged" },
          clear_buffer  = { "BufLeave" },
        },
      }
    end,
    keys = {
      {
        "<leader>md",
        function() require("diagram").show_diagram_hover() end,
        mode = "n",
        ft = "markdown",
        desc = "Diagram: show under cursor in new tab",
      },
    },
  },
}
