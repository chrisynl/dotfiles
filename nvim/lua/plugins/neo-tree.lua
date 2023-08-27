local F = {}

F.default = function()
  require("neo-tree").setup({
    window = {
      width = 30,
    },
  })
end

return {
  {
     "nvim-neo-tree/neo-tree.nvim",
     branch = "v3.x",
     dependencies = {
       "nvim-lua/plenary.nvim",
       "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
       "MunifTanjim/nui.nvim",
     },
     keys = {
       { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
     },
     config = function()
       F.default()
     end
  }
}
