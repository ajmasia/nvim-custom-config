return {
  {
    "antosha417/nvim-lsp-file-operations",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neo-tree/neo-tree.nvim",
    },
    config = function()
      require("lsp-file-operations").setup {
        -- used to see debug logs in file `vim.fn.stdpath("cache") .. lsp-file-operations.log`
        debug = false,
        -- how long to wait (in milliseconds) for file rename information before cancelling
        timeout_ms = 10000,
      }

    end

  }
}
