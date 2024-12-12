-- require "nvchad.mappings"
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

--tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

--move to beggining/end of line
keymap.set("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
keymap.set("i", "<C-e>", "<End>", { desc = "move end of line" })

--copy and save file
keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
keymap.set("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

--format file
keymap.set("n", "<leader>fm", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "general format file" })

-- global lsp mappings
keymap.set("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })

-- Comment
keymap.set("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
keymap.set("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- nvimtree
keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- terminal
keymap.set("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- new terminals
keymap.set("n", "<leader>h", function()
  require("nvchad.term").new { pos = "sp" }
end, { desc = "terminal new horizontal term" })
keymap.set("n", "<leader>v", function()
  require("nvchad.term").new { pos = "vsp" }
end, { desc = "terminal new vertical term" })

--theme switcher
keymap.set("n", "<leader>th", function()
  require("nvchad.themes").open()
end, { desc = "telescope nvchad themes" })

-- whichkey
keymap.set("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })

keymap.set("n", "<leader>wk", function()
  vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "whichkey query lookup" })

-- toggleable
keymap.set({ "n", "t" }, "<A-v>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "terminal toggleable vertical term" })

keymap.set({ "n", "t" }, "<A-h>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggleable horizontal term" })

keymap.set({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })

--telescope
keymap.set("n", "<C-f>", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
keymap.set("n", "<leader>ff", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })

-- //navigate telescope window mappings
-- mappings = {
--           i = {
--             ["<C-k>"] = actions.move_selection_previous, -- move to prev result
--             ["<C-j>"] = actions.move_selection_next, -- move to next result
--             ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
--           },
--         },
--

-- auto session manager keymaps
keymap.set("n", "<leader>wb", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" }) -- restore last workspace session for current directory
keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" }) -- save workspace session for current working directory

-- for the autocomplete suggestions

-- ["<C-p>"] = cmp.mapping.select_prev_item(),
--     ["<C-n>"] = cmp.mapping.select_next_item(),
--     ["<C-d>"] = cmp.mapping.scroll_docs(-4),
--     ["<C-f>"] = cmp.mapping.scroll_docs(4),
--     ["<C-Space>"] = cmp.mapping.complete(),
--     ["<C-e>"] = cmp.mapping.close(),
--
--     ["<CR>"] = cmp.mapping.confirm {
--       behavior = cmp.ConfirmBehavior.Insert,
--       select = true,
--     },

-- surround lua shortcut
-- ys  iw   ""  - to surround with double quotes
-- ds "" - delete the surrounding double quotes
-- cs "" {} - to change the surrounding from double to single quotes
-- ds t - delete the surrounding html tag
-- ys 8j t - to add a surrounding html tag
-- cs t - change html tag

-- todo comments
-- keymap.set("n", "]t", function()
--       todo_comments.jump_next()
--     end, { desc = "Next todo comment" })
--
--     keymap.set("n", "[t", function()
--       todo_comments.jump_prev()
--     end, { desc = "Previous todo comment" })




-- substitution plugin keymaps (need to use with vim motions)
local substitute = require "substitute"
keymap.set("n", "s", substitute.operator, { desc = "Substitute with motion" })
keymap.set("n", "ss", substitute.line, { desc = "Substitute line" })
keymap.set("n", "S", substitute.eol, { desc = "Substitute to end of line" })
keymap.set("x", "s", substitute.visual, { desc = "Substitute in visual mode" })




--lsp mappings
-- map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
--   map("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
--   map("n", "gi", vim.lsp.buf.implementation, opts "Go to implementation")
--   map("n", "<leader>sh", vim.lsp.buf.signature_help, opts "Show signature help")
--   map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
--   map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")
--
--   map("n", "<leader>wl", function()
--     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--   end, opts "List workspace folders")
--
--   map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Go to type definition")
--   map("n", "<leader>ra", require "nvchad.lsp.renamer", opts "NvRenamer")
--
--   map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts "Code action")
--   map("n", "gr", vim.lsp.buf.references, opts "Show references")



-- telescope lsp keybindings
keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", { desc = "Show LSP references" })
keymap.set("n", "gtd", "<cmd>Telescope lsp_definitions<CR>", { desc = "Show LSP definitions" }) -- show lsp definitions
keymap.set("n", "gti", "<cmd>Telescope lsp_implementations<CR>", { desc = "Show LSP implementations" }) -- show lsp implementations
keymap.set("n", "gtd", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "Show LSP type definitions" })



-- linting
-- vim.keymap.set("n", "<leader>l", function()
--      lint.try_lint()
--    end, { desc = "Trigger linting for current file" })



-- tabufline
keymap.set("n", "<Tab>", "<cmd>lua require('nvchad.tabufline').next()<CR>", { desc = "Go to next buffer in tabufline" })
keymap.set("n", "<S-Tab>", "<cmd>lua require('nvchad.tabufline').prev()<CR>", { desc = "Go to previous buffer in tabufline" })

-- Search UP for a markdown header
-- Make sure to follow proper markdown convention, and you have a single H1
-- heading at the very top of the file
-- This will only search for H2 headings and above
vim.keymap.set("n", "gk", function()
  -- `?` - Start a search backwards from the current cursor position.
  -- `^` - Match the beginning of a line.
  -- `##` - Match 2 ## symbols
  -- `\\+` - Match one or more occurrences of prev element (#)
  -- `\\s` - Match exactly one whitespace character following the hashes
  -- `.*` - Match any characters (except newline) following the space
  -- `$` - Match extends to end of line
  vim.cmd("silent! ?^##\\+\\s.*$")
  -- Clear the search highlight
  vim.cmd("nohlsearch")
end, { desc = "Go to previous markdown header" })

-- Search DOWN for a markdown header
-- Make sure to follow proper markdown convention, and you have a single H1
-- heading at the very top of the file
-- This will only search for H2 headings and above
vim.keymap.set("n", "gj", function()
  -- `/` - Start a search forwards from the current cursor position.
  -- `^` - Match the beginning of a line.
  -- `##` - Match 2 ## symbols
  -- `\\+` - Match one or more occurrences of prev element (#)
  -- `\\s` - Match exactly one whitespace character following the hashes
  -- `.*` - Match any characters (except newline) following the space
  -- `$` - Match extends to end of line
  vim.cmd("silent! /^##\\+\\s.*$")
  -- Clear the search highlight
  vim.cmd("nohlsearch")
end, { desc = "Go to next markdown header" })
