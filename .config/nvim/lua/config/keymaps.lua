-- <leader>T        open nvim-tree
-- <leader>/        toggle comment
-- <leader>bn       next buffer
-- <leader>bp       prev buffer
-- <leader>vs       split vertically
-- <leader>hs       split horizontally
-- <leader>pa       copy filename to clipboard
-- <leader>sc       toggle spell check
--
-- <leader>ff       FZF Files
-- <leader>fg       FZF Live Grep
-- <leader>fb       FZF Buffers
-- <leader>fh       FZF Help Tags
-- <leader>fx       FZF Diagnostics Document
-- <leader>fX       FZF Diagnostics Workspace
-- <leader>fs       FZF Document Symbols
-- <leader>fS       FZF Workspace Symbols
-- <leader>fk       FZF keymaps
-- <leader>fr       FZF resume
-- <leader>fd       FZF LSP Finder (definition + references)
-- <leader>fr       FZF Show all references to the symbol under the cursor
-- <leader>ft       FZF Jump to the type definition of the symbol under the cursor
-- <leader>fs       FZF List all symbols (functions, classes, etc.) in the current file
-- <leader>fw       FZF Search for any symbol across the entire project/workspace
-- <leader>fi       FZF Go to implementation
--
-- <leader>tt       Open terminal horizontally
-- <leader>ttf      Open terminal 90% float
-- <leader>t1       Select terminal 1
-- 
-- n                next search result
-- N                prev search result
-- <                shift left (and keep selected)
-- >                shift right (and keep selected)
--
-- <CTRL>+d         page down
-- <CTRL>+f         page up
-- <CTRL>+up        increate window height  
-- <CTRL>+down      descrease window height  
-- <CTRL>+left      increase window width
-- <CTRL>+right     descrease window width  
-- <CTRL>+j         move line down
-- <CTRL>+K         move line up
--
-- <ALT>+h         left window
-- <ALT>+l         right window
-- <ALT>+j         down window
-- <ALT>+k         up window

-- nvim-tree
vim.keymap.set("n", "<leader>T", ":NvimTreeOpen<CR>")

-- comments
vim.keymap.set({"n", "v"}, "<leader>/", ":CommentToggle<CR>")

-- toggle spelling
local function toggle_spell()
  local spell_on = vim.opt_local.spell:get()
  vim.opt_local.spell = not spell_on
end

vim.keymap.set("n", "<leader>sc", function()
  toggle_spell()
end, { desc = "Toggle spell checking" })

-- allows to use normal j/k to move line-by-line even when text is wrapped
vim.keymap.set("n", "j", function()
	return vim.v.count == 0 and "gj" or "j"
end, { expr = true, silent = true, desc = "Down (wrap-aware)" })
vim.keymap.set("n", "k", function()
	return vim.v.count == 0 and "gk" or "k"
end, { expr = true, silent = true, desc = "Up (wrap-aware)" })

vim.keymap.set("n", "<leader>c", ":nohlsearch<CR>", { desc = "Clear search highlights" })

vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-f>", "<C-u>zz", { desc = "Half page up (centered)" })
--
-- vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })
-- vim.keymap.set({ "n", "v" }, "<leader>x", '"_d', { desc = "Delete without yanking" })
--
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })

vim.keymap.set("n", "<A-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<A-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<A-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<A-l>", "<C-w>l", { desc = "Move to right window" })

vim.keymap.set("n", "<leader>vs", ":vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>hs", ":split<CR>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize +2<CR>", { desc = "Increase window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize -2<CR>", { desc = "Descrease window width" })

vim.keymap.set("n", "<C-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<C-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

vim.keymap.set("n", "<leader>pa", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("file:", path)
end, { desc = "Copy full file path" })

--
-- vim.keymap.set("n", "<leader>e", function()
--   if require("zen-mode.view").is_open() then
--     require("zen-mode").close()
--   end
--
--   local api = require("nvim-tree.api")
--
--   if api.tree.is_visible() then
--     api.tree.close()
--   else
--     api.tree.open()
--   end
-- end, { desc = "Toggle NvimTree (close Zen if active)" })
--

-- FZF

vim.keymap.set('n', '<leader>ff', ':FzfLua files<CR>', { desc = 'FZF Files' })
vim.keymap.set('n', '<leader>fg', ':FzfLua live_grep<CR>', { desc = 'FZF Live Grep' })
vim.keymap.set('n', '<leader>fb', ':FzfLua buffers<CR>', { desc = 'FZF Buffers' })
vim.keymap.set('n', '<leader>fh', ':FzfLua help_tags<CR>', { desc = 'FZF Help Tags' })
vim.keymap.set('n', '<leader>fk', ':FzfLua keymaps<CR>', { desc = 'FZF keymaps' })
vim.keymap.set('n', '<leader>fr', ':FzfLua resume<CR>', { desc = 'FZF resume' })
vim.keymap.set('n', '<leader>fx', ':FzfLua diagnostics_document<CR>', { desc = 'FZF Diagnostics Document' })
vim.keymap.set('n', '<leader>fX', ':FzfLua diagnostics_workspace<CR>', { desc = 'FZF Diagnostics Workspace' })
vim.keymap.set('n', '<leader>fs', ':FzfLua lsp_document_symbols<CR>', { desc = 'FZF Document Symbols' })
vim.keymap.set('n', '<leader>fS', ':FzfLua lsp_workspace_symbols<CR>', { desc = 'FZF Workspace Symbols' })

-- terminal

vim.keymap.set('n', '<leader>tt', ':ToggleTerm size=7<CR>', { desc = 'Toggle terminal horizontally' })
vim.keymap.set('n', '<leader>ttf', ':ToggleTerm size=0.95 direction=float<CR>', { desc = 'Open terminal 90% float' })
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- ipython

vim.keymap.set('n', '<leader>rr', ':ReplIpython<CR>:ReplFocus<CR>a', { desc = 'Toggle ipython' })

-- mini

vim.keymap.set('n', '<Tab>', ':bnext<CR>', { desc = 'Move to next buffer' })
vim.keymap.set('n', '<S-Tab>', ':bprev<CR>', { desc = 'Move to previous buffer' })
vim.keymap.set('n', '<leader>mm', ':lua MiniMap.toggle()<CR>', { desc = 'Toggle minimap' })


-- barbar
--
local opts = { noremap = true, silent = true }

-- Move to previous/next
-- vim.keymap.set('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
-- vim.keymap.set('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)

-- Re-order to previous/next
vim.keymap.set('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
vim.keymap.set('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)

-- Goto buffer in position...
vim.keymap.set('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
vim.keymap.set('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
vim.keymap.set('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
vim.keymap.set('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
vim.keymap.set('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
vim.keymap.set('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
vim.keymap.set('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
vim.keymap.set('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
vim.keymap.set('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
vim.keymap.set('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

-- Pin/unpin buffer
vim.keymap.set('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)

-- Goto pinned/unpinned buffer
--                 :BufferGotoPinned
--                 :BufferGotoUnpinned

-- Close buffer
vim.keymap.set('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)

-- Wipeout buffer
--                 :BufferWipeout

-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight

-- Magic buffer-picking mode
-- vim.keymap.set('n', '<C-p>',   '<Cmd>BufferPick<CR>', opts)
-- vim.keymap.set('n', '<C-s-p>', '<Cmd>BufferPickDelete<CR>', opts)

-- Sort automatically by...
vim.keymap.set('n', '<Space>bbn', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
vim.keymap.set('n', '<Space>bbN', '<Cmd>BufferOrderByName<CR>', opts)
vim.keymap.set('n', '<Space>bbd', '<Cmd>BufferOrderByDirectory<CR>', opts)
vim.keymap.set('n', '<Space>bbl', '<Cmd>BufferOrderByLanguage<CR>', opts)
vim.keymap.set('n', '<Space>bbw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)
