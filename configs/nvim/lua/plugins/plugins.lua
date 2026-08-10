return {
  -- 安装 catppuccin 主题插件
  { "catppuccin/nvim", name = "catppuccin" },

  -- 通过修改 LazyVim 核心配置来应用主题
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin", -- 告诉 LazyVim 使用 catppuccin
    },
  },

  -- 如果想自定义 catppuccin 的具体选项，额外添加配置
  {
    "catppuccin/nvim",
    opts = {
      flavour = "mocha", -- 可选: latte, frappe, macchiato, mocha
    },
  },

  -- add any tools you want to have installed below
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "black",
        "isort",
        "flake8",
        "clang-format",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "markdown",
        "markdown_inline",
        "latex",
      },
      auto_install = true,
    },
  },
  {
    "lervag/vimtex",
    enabled = false, -- 禁用 vimtex，否则报版本错误，tex相关插件都无法使用
  },
}
