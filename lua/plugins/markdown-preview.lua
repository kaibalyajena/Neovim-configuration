return {
    'iamcco/markdown-preview.nvim',
    build = function() vim.fn['mkdp#util#install']() end,
    ft = { 'markdown' },
    config = function()
        -- Plugin-specific settings (optional)
        vim.g.mkdp_auto_start = 0 -- Only start preview when triggered
        vim.g.mkdp_auto_close = 1 -- Close preview when buffer is closed

        -- Keymaps for Markdown preview
        vim.api.nvim_set_keymap(
            'n', -- Normal mode
            '<leader>mp', -- Shortcut for opening preview
            ':MarkdownPreview<CR>',
            { noremap = true, silent = true, desc = "Open Markdown Preview" }
        )

        vim.api.nvim_set_keymap(
            'n', -- Normal mode
            '<leader>mc', -- Shortcut for closing preview
            ':MarkdownPreviewStop<CR>',
            { noremap = true, silent = true, desc = "Close Markdown Preview" }
        )
    end,
}

