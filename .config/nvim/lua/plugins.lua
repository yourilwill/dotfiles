return {

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = {
          icon_enabled = true,
          --theme = 'nightfly',
          theme = 'dracula',
          --theme = 'ayu_mirage',
          --section_separators = '',
          --component_separators = '',
        }
      })
    end
  },

  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end
  },

  { 'nvim-tree/nvim-tree.lua',              dependencies = { 'nvim-tree/nvim-web-devicons' } },

  {
    'nvim-telescope/telescope.nvim',
    tag = "0.1.1",
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end,
    build = ':MasonUpdate',
  },

  {
    'kylechui/nvim-surround',
    config = function()
      require('nvim-surround').setup()
    end,
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {}
  },

  { "glepnir/lspsaga.nvim",                 event = "LspAttach" },
  { 'Mofiqul/dracula.nvim',                 lazy = false },
  { 'EdenEast/nightfox.nvim',               lazy = false },
  { 'nvim-treesitter/nvim-treesitter',      run = ':TSUpdate' },
  { 'hrsh7th/nvim-cmp',                     event = 'InsertEnter, CmdlineEnter' },
  { 'hrsh7th/cmp-nvim-lsp',                 event = 'InsertEnter' },
  { 'hrsh7th/cmp-buffer',                   event = 'InsertEnter' },
  { 'hrsh7th/cmp-path',                     event = 'InsertEnter' },
  { 'hrsh7th/cmp-vsnip',                    event = 'InsertEnter' },
  { 'hrsh7th/cmp-cmdline',                  event = 'ModeChanged' },
  { 'hrsh7th/cmp-nvim-lsp-signature-help',  event = 'InsertEnter' },
  { 'hrsh7th/cmp-nvim-lsp-document-symbol', event = 'InsertEnter' },
  { 'hrsh7th/cmp-calc',                     event = 'InsertEnter' },
  { 'onsails/lspkind.nvim',                 event = 'InsertEnter' },
  { 'hrsh7th/vim-vsnip',                    event = 'InsertEnter' },
  { 'hrsh7th/vim-vsnip-integ',              event = 'InsertEnter' },
  { 'rafamadriz/friendly-snippets',         event = 'InsertEnter' },
  { 'lewis6991/gitsigns.nvim' },
  { 'neovim/nvim-lspconfig' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'jose-elias-alvarez/null-ls.nvim',      dependencies = { 'nvim-lua/plenary.nvim' } },
  { 'sindrets/diffview.nvim' },
  { 'TimUntersberger/neogit',               dependencies = { 'sindrets/diffview.nvim' } },
  { 'romgrk/barbar.nvim',                   dependencies = { 'sindrets/diffview.nvim', 'nvim-tree/nvim-web-devicons' } },
  { 'windwp/nvim-autopairs',                event = "InsertEnter",                                                     opts = {} },

}
