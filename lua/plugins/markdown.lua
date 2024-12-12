return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 
        'nvim-treesitter/nvim-treesitter', 
        'nvim-tree/nvim-web-devicons' 
    },
    -- Lazy load based on file type
    ft = { 'markdown' },
    opts = {}, -- Your custom options for the plugin
}
