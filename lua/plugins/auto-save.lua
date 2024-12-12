return {
    "Pocco81/auto-save.nvim",
    lazy = false, -- Load on startup
    config = function()
        require("auto-save").setup({
            enabled = true, -- Start with auto-save enabled
            execution_message = {
                message = function() return "" end, -- Disable the save message
            },
            trigger_events = {"InsertLeave", "TextChanged"}, -- Save on these events
            conditions = {
                exists = true,
                filename_is_not = {},
                filetype_is_not = {"gitcommit"}, -- Exclude certain filetypes
            },
            write_all_buffers = false, -- Save only the current buffer
            debounce_delay = 135, -- Time in ms to wait before saving
        })
    end,
}

