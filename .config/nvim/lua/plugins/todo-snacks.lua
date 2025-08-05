return {
  -- No need to return snacks again — just extend it
  "folke/snacks.nvim",
  -- No config here, just use `init` to define the keymap
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy", -- make sure it's after dashboard setup
      callback = function()
        local snacks = require("snacks")

        vim.keymap.set("n", "<leader>td", function()
          snacks.win({
            file = vim.fn.expand("~/Documents/todo/todo.md"),
            width = 0.6,
            height = 0.6,
            bo = {
              modifiable = true,
              readonly = false,
            },
            wo = {
              spell = true,
              wrap = true,
              signcolumn = "yes",
              statuscolumn = " ",
              conceallevel = 3,
            },
          })
        end, { desc = "Open To-Do Note Popup" })
        vim.keymap.set("n", "<leader>tp", function()
          snacks.win({
            file = vim.fn.expand("~/Documents/todo/todo-project.md"),
            width = 0.6,
            height = 0.6,
            bo = {
              modifiable = true,
              readonly = false,
            },
            wo = {
              spell = true,
              wrap = true,
              signcolumn = "yes",
              statuscolumn = " ",
              conceallevel = 3,
            },
          })
        end, { desc = "Open To-Do Project Note Popup" })
        vim.keymap.set("n", "<leader>tn", function()
          snacks.win({
            file = vim.fn.expand("~/Documents/todo/note.md"),
            width = 0.6,
            height = 0.6,
            bo = {
              modifiable = true,
              readonly = false,
            },
            wo = {
              spell = true,
              wrap = true,
              signcolumn = "yes",
              statuscolumn = " ",
              conceallevel = 3,
            },
          })
        end, { desc = "Open Note Popup" })
      end,
    })
  end,
}
