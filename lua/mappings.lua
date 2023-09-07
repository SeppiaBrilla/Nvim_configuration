function Mappings()
	-- terminal emulator

	vim.keymap.set('n', '<leader>tf', "<cmd>ToggleTerm direction=float<cr>", { desc = "ToggleTerm float" })
	vim.keymap.set('n', '<leader>th', "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "ToggleTerm horizontal" })



	--git
	vim.keymap.set('n', '<leader>gg', "<cmd>TermExec direction=float cmd=lazygit<cr>", { desc = "ToggleTerm horizontal" })

	-- general
	vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

	vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
	vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

	--NeoTree
	vim.keymap.set('n','<leader>o', '<cmd>Neotree focus<cr>', { desc = 'focus NeoTree' })
	vim.keymap.set('n','<leader>e', '<cmd>Neotree toggle<cr>', { desc = 'toggle NeoTree' })

	-- comment 
	vim.keymap.set('n','<leader>k', function() require('Comment.api').toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end, {desc = "toggle comment"})
	vim.keymap.set('v','<leader>k', "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", {desc = "toggle comment"})



	-- lsp
	vim.keymap.set('n','<leader>.r', function() vim.lsp.buf.rename() end, {desc = 'rename'})
	vim.keymap.set('n','<leader>.f', function() require("telescope.builtin").lsp_references() end, {desc = 'find reference'})
	vim.keymap.set('n','<leader>.i', function() require("telescope.builtin").lsp_implementation() end, {desc = 'find implementation'})
	vim.keymap.set('n','<leader>.d', vim.lsp.buf.type_definition, {desc = 'find implementation'})
	vim.keymap.set('n','<leader>.h', function() vim.lsp.buf.signature_help() end, {desc = 'help'})

	-- telescope 
	vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
	vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
	vim.keymap.set('n', '<leader>fc', require('telescope.builtin').current_buffer_fuzzy_find, { desc = '[c] Fuzzily search in current buffer' })

	vim.keymap.set('n', '<leader>ff', function()
		if not pcall(require('telescope.builtin').git_files)
			then
				require('telescope.builtin').find_files()
			end
		end,
		{ desc = 'Search Git Files if present, search globally if not' })
	vim.keymap.set('n', '<leader>fF', require('telescope.builtin').find_files, { desc = 'Search Files' })
	vim.keymap.set('n', '<leader>fH', require('telescope.builtin').help_tags, { desc = 'search Help' })
	vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = 'Search current word' })
	vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = 'Search by Grep' })
	vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = 'Search Diagnostics' })



	-- Diagnostic keymaps
	vim.keymap.set('n', 'dp', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
	vim.keymap.set('n', 'dn', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
	vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })


	-- remap return to normal mode
	vim.keymap.set('v', '<M-e>', '<esc>')
	vim.keymap.set('i', '<M-e>', '<esc>')

	-- bar
	vim.keymap.set('n', 'L', '<Cmd>BufferNext<CR>', {desc='next buffer'})
	vim.keymap.set('n', 'H', '<Cmd>BufferPrevious<CR>', {desc='previous buffer'})
	vim.keymap.set('n', 'c', '<Cmd>BufferClose<CR>', {desc='close buffer'})
end

return Mappings
