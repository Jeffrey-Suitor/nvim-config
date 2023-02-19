return {
  "nvim-treesitter",
  dependencies = {
    { "mrjones2014/nvim-ts-rainbow" },
    { "windwp/nvim-ts-autotag" },
    { "JoosepAlviste/nvim-ts-context-commentstring" },
    { "nvim-treesitter/nvim-treesitter" },
    { "nvim-treesitter/nvim-treesitter-textobjects" },
    { 'nvim-treesitter/nvim-treesitter-context', config = true },
    { 'ckolkey/ts-node-action', dependencies = { 'nvim-treesitter' }, opts = {}, },
  },
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = "all",
      highlight = {
        enable = true
      },
      context_commentstring = {
        enable = true
      },
      rainbow = {
        enable = true,
        extended_mode = true
      },
      autotag = {
        enable = true
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn", -- set to `false` to disable one of the mappings
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
          },
          goto_next_end = {
            [']M'] = '@function.outer',
            [']['] = '@class.outer',
          },
          goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
          },
          goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>Sa'] = '@parameter.inner',
          },
          swap_previous = {
            ['<leader>SA'] = '@parameter.inner',
          },
        },
      },
    })
  end
}
