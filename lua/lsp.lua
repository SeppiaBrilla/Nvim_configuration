-- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.

function Lsp_config()
return {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
}
end

local on_attach = function(_, bufnr)
	local nmap = function(keys, func, desc)
	    if desc then
	      desc = 'LSP: ' .. desc
	    end
	    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end
	nmap('<leader>.c', vim.lsp.buf.code_action, 'code action')
	nmap('.k', vim.lsp.buf.hover, 'Hover Documentation')
end


function Lsps()
	local servers = {
	  clangd = {},
	  -- gopls = {},
	  pyright = {},
	  -- rust_analyzer = {},
	  tsserver = {},
	  html = { filetypes = { 'html', 'twig', 'hbs'} },

	  lua_ls = {
	    Lua = {
	      workspace = { checkThirdParty = false },
	      telemetry = { enable = false },
	    },
	  },
	}
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

	-- Ensure the servers above are installed
	local mason_lspconfig = require 'mason-lspconfig'

	mason_lspconfig.setup {
	  ensure_installed = vim.tbl_keys(servers),
	}

	mason_lspconfig.setup_handlers {
	  function(server_name)
	    require('lspconfig')[server_name].setup {
	      capabilities = capabilities,
	      on_attach = on_attach,
	      settings = servers[server_name],
	      filetypes = (servers[server_name] or {}).filetypes,
	    }
	  end
	}
end

return {['config'] = Lsp_config, ['servers'] = Lsps}


