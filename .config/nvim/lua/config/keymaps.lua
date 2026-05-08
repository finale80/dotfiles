-- <leader>T        misc: open nvim-tree
-- <leader>/        misc: toggle comment
-- <leader>bn       misc: next buffer
-- <leader>bp       misc: prev buffer
-- <leader>vs       misc: split vertically
-- <leader>hs       misc: split horizontally
-- <leader>pa       misc: copy filename to clipboard
-- <leader>sc       misc: toggle spell check
-- <leader>mm       misc: Toggle minimap
-- n                misc: next search result
-- N                misc: prev search result
-- <                misc: shift left (and keep selected)
-- >                misc: shift right (and keep selected)
--
-- aF               textobject: Textobject around function')
-- iF               textobject: Textobject inner function')
-- aC               textobject: Textobject around class')
-- iC               textobject: Textobject inner class')
-- ]f               textobject: Textobject next function start')
-- [f               textobject: Textobject previous function start')
-- ]F               textobject: Textobject next function end')
-- [F               textobject: Textobject previous function end')
-- ]c               textobject: Textobject next class start')
-- [c               textobject: Textobject previous class start')
-- ]C               textobject: Textobject next class end')
-- [C               textobject: Textobject previous class end')
--
-- <leader>ff       FZF: Files
-- <leader>fg       FZF: Live Grep
-- <leader>fb       FZF: Buffers
-- <leader>fh       FZF: Help Tags
-- <leader>fx       FZF: Diagnostics Document
-- <leader>fX       FZF: Diagnostics Workspace
-- <leader>fs       FZF: Document Symbols
-- <leader>fS       FZF: Workspace Symbols
-- <leader>fk       FZF: keymaps
-- <leader>fr       FZF: resume
-- <leader>fd       FZF: LSP Finder (definition + references)
-- <leader>fr       FZF: Show all references to the symbol under the cursor
-- <leader>ft       FZF: Jump to the type definition of the symbol under the cursor
-- <leader>fs       FZF: List all symbols (functions, classes, etc.) in the current file
-- <leader>fw       FZF: Search for any symbol across the entire project/workspace
-- <leader>fi       FZF: Go to implementation
--
-- <leader>tt       terminal: toggle terminal horizontally
-- <leader>ttf      terminal: Open terminal 90% float
-- <leader>t1       terminal: Select terminal 1
-- <esc>            terminal: exit terminal mode
-- <leader>rr       terminal: toggle ipython REPL
-- 
-- <CTRL>+d         window: page down
-- <CTRL>+f         window: page up
-- <CTRL>+up        window: increate window height  
-- <CTRL>+down      window: descrease window height  
-- <CTRL>+left      window: increase window width
-- <CTRL>+right     window: descrease window width  
-- <CTRL>+j         window: move line down
-- <CTRL>+K         window: move line up
-- <ALT>+h          window: move to left window
-- <ALT>+l          window: move to right window
-- <ALT>+j          window: move to lower window
-- <ALT>+k          window: move to upper window
--
-- <Tab>            buffer: Move to next buffer
-- <S-Tab>          buffer: Move to previous buffer
-- <A-<>            buffer: Move buffer to left
-- <A->>            buffer: Move buffer to right
-- <A-1>            buffer: Goto buffer 1
-- <A-2>            buffer: Goto buffer 2
-- <A-3>            buffer: Goto buffer 3
-- <A-4>            buffer: Goto buffer 4
-- <A-5>            buffer: Goto buffer 5
-- <A-6>            buffer: Goto buffer 6
-- <A-7>            buffer: Goto buffer 7
-- <A-8>            buffer: Goto buffer 8
-- <A-9>            buffer: Goto buffer 9
-- <A-0>            buffer: Goto last buffer
-- <A-p>            buffer: Pin buffer
-- <A-c>            buffer: Close buffer
-- <leader>bbn      buffer: Sort buffers by number
-- <leader>bbN      buffer: Sort buffer by name
-- <leader>bbd      buffer: Sort buffer by directory
-- <leader>bbl      buffer: Sort buffer by language
-- <leader>bbw      buffer: Sort buffer by window number


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
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], { buffer = 0, desc = 'Exit terminal mode'} )
  -- vim.keymap.set('t', 'jk', [[<C-\><C-n>]], { buffer = 0 })
  vim.keymap.set('t', '<A-h>', [[<Cmd>wincmd h<CR>]], { buffer = 0, desc = 'Move to left window from terminal' })
  vim.keymap.set('t', '<A-j>', [[<Cmd>wincmd j<CR>]], { buffer = 0, desc = 'Move to lower window from terminal' })
  vim.keymap.set('t', '<A-k>', [[<Cmd>wincmd k<CR>]], { buffer = 0, desc = 'Move to upper window from terminal' })
  vim.keymap.set('t', '<A-l>', [[<Cmd>wincmd l<CR>]], { buffer = 0, desc = 'Move to right window from terminal' })
  -- vim.keymap.set('t', '<A-w>', [[<C-\><C-n><C-w>]], { buffer = 0, desc = 'Exit terminal window' })
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
_barbar_opts  = function(desc)
   return { desc = desc, noremap = true, silent = true }
end

-- Move to previous/next
-- vim.keymap.set('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
-- vim.keymap.set('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)

-- Re-order to previous/next
vim.keymap.set('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', _barbar_opts('Move buffer to left'))
vim.keymap.set('n', '<A->>', '<Cmd>BufferMoveNext<CR>', _barbar_opts('Move buffer to right'))

-- Goto buffer in position...
vim.keymap.set('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', _barbar_opts('Goto buffer 1'))
vim.keymap.set('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', _barbar_opts('Goto buffer 2'))
vim.keymap.set('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', _barbar_opts('Goto buffer 3'))
vim.keymap.set('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', _barbar_opts('Goto buffer 4'))
vim.keymap.set('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', _barbar_opts('Goto buffer 5'))
vim.keymap.set('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', _barbar_opts('Goto buffer 6'))
vim.keymap.set('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', _barbar_opts('Goto buffer 7'))
vim.keymap.set('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', _barbar_opts('Goto buffer 8'))
vim.keymap.set('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', _barbar_opts('Goto buffer 9'))
vim.keymap.set('n', '<A-0>', '<Cmd>BufferLast<CR>', _barbar_opts('Goto last buffer'))

-- Pin/unpin buffer
vim.keymap.set('n', '<A-p>', '<Cmd>BufferPin<CR>', _barbar_opts('Pin buffer'))

-- Goto pinned/unpinned buffer
--                 :BufferGotoPinned
--                 :BufferGotoUnpinned

-- Close buffer
vim.keymap.set('n', '<A-c>', '<Cmd>BufferClose<CR>', _barbar_opts('Close buffer'))

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
vim.keymap.set('n', '<leader>bbn', '<Cmd>BufferOrderByBufferNumber<CR>', _barbar_opts('Sort buffers by number'))
vim.keymap.set('n', '<leader>bbN', '<Cmd>BufferOrderByName<CR>', _barbar_opts('Sort buffer by name'))
vim.keymap.set('n', '<leader>bbd', '<Cmd>BufferOrderByDirectory<CR>', _barbar_opts('Sort buffer by directory'))
vim.keymap.set('n', '<leader>bbl', '<Cmd>BufferOrderByLanguage<CR>', _barbar_opts('Sort buffer by language'))
vim.keymap.set('n', '<leader>bbw', '<Cmd>BufferOrderByWindowNumber<CR>', _barbar_opts('Sort buffer by window number'))



-- text-objects

local to_select = require('nvim-treesitter-textobjects.select')
local textobject_select = function(keymap, query, desc)
    vim.keymap.set(
        { 'x', 'o' },
        keymap, 
        function()
          to_select.select_textobject(query, 'textobjects')
        end,
        { desc = desc }
    )
end
textobject_select('aF', '@function.outer', 'Textobject around function')
textobject_select('iF', '@function.inner', 'Textobject inner function')
textobject_select('aC', '@class.outer', 'Textobject around class')
textobject_select('iC', '@class.inner', 'Textobject inner class')

local to_move = require('nvim-treesitter-textobjects.move')
local textobject_move = function(keymap, func, query, desc)
    vim.keymap.set(
        { 'n' }, 
        keymap, 
        function()
          func(query, "textobjects")
        end, 
        { desc = desc }
    )
end
textobject_move(']f', to_move.goto_next_start, "@function.outer", 'Textobject next function start')
textobject_move('[f', to_move.goto_previous_start, "@function.outer", 'Textobject previous function start')
textobject_move(']F', to_move.goto_next_end, '@function.outer', 'Textobject next function end')
textobject_move('[F', to_move.goto_previous_end, '@function.outer', 'Textobject previous function end')
textobject_move(']c', to_move.goto_next_start, "@class.outer", 'Textobject next class start')
textobject_move('[c', to_move.goto_previous_start, "@class.outer", 'Textobject previous class start')
textobject_move(']C', to_move.goto_next_end, '@class.outer', 'Textobject next class end')
textobject_move('[C', to_move.goto_previous_end, '@class.outer', 'Textobject previous class end')
