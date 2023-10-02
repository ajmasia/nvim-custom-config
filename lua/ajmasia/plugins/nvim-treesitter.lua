return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
    "windwp/nvim-ts-autotag",
  },
  enabled = true,
  build = ":TSUpdate",
  main = "nvim-treesitter.configs",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    ensure_installed = {
      "lua",
      "luadoc",
      "vim",
      "vimdoc",
      "query",
      "nix",
      "bash",
      "typescript",
      "javascript",
      "tsx",
      "html",
      "css",
      "astro",
      "json",
      "yaml",
      "python",
    },
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
    autotag = { enable = true },
    context_commentstring = {
      enable = true,
    },
  },
}
