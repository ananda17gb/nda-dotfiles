return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
--
-- return { { "Everblush/nvim", name = "everblush" }, { "LazyVim/LazyVim", opts = {
--   colorscheme = "everblush",
-- } } }
--
-- return {
--   {
--     "rebelot/kanagawa.nvim",
--     name = "kanagawa",
--     opts = {
--       theme = "dragon",
--     },
--   },
--   { "LazyVim/LazyVim", opts = {
--     colorscheme = "kanagawa",
--   } },
-- }
-- return {
--   {
--     "sainnhe/gruvbox-material",
--     name = "gruvbox-material",
--     config = function()
--       vim.g.gruvbox_material_foreground = "original"
--     end,
--   },
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "gruvbox-material",
--     },
--   },
-- }
