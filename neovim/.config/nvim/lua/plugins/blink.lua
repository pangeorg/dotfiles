return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      preset = "none",
      -- Navigate the completion list
      ["<C-n>"] = { "select_next" },
      ["<C-p>"] = { "select_prev" },

      -- Accept the current selection (do not navigate)
      ["<Tab>"] = { "select_and_accept" },
      ["<C-y>"] = { "select_and_accept" },

      -- (Optional) If you prefer Enter to accept too:
      -- ["<CR>"] = { "accept" },

      -- Ensure Tab isn't bound to "select_next" by any preset you use
      -- If you are using a preset, you can override it here explicitly.
    },
  },
}
