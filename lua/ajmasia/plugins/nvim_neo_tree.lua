return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      {
        "<leader>e",
        function()
          require("neo-tree.command").execute({ toggle = true, require "ajmasia.utils".get_root() })
        end,
        desc = "Explorer NeoTree (root dir)",
      },
      {
        "<leader>E",
        function()
          require("neo-tree.command").execute({ action = "close" })
        end,
        desc = "Explorer NeoTree (root dir)",
      },
      {
        "<leader>ge",
        function()
          require("neo-tree.command").execute({ toggle = true, source = "git_status" })
        end,
        desc = "Explorer NeoTree (root dir)",
      },
      {
        "<leader>be",
        function()
          require("neo-tree.command").execute({ toggle = true, source = "buffers" })
        end,
        desc = "Explorer NeoTree (root dir)",
      },
    },
  },
}
