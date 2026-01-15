-- Disable E501 from pylsp's pycodestyle plugin
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      pylsp = {
        settings = {
          pylsp = {
            plugins = {
              pycodestyle = {
                ignore = { "E303", "E704" },
                maxLineLength = 120,
              },
            },
          },
        },
      },
    },
  },
}
