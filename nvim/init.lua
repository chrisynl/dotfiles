if vim.g.vscode then
	require("core.options")
	require("core.keymaps")
else
	require("plugins-setup")
	require("core.options")
	require("core.keymaps")

	local old_notify = vim.notify
	local silence_pat = '[lspconfig] cmd ("cargo'
	vim.notify = function(msg, level, opts)
		if string.sub(msg, 1, string.len(silence_pat)) ~= silence_pat then
			old_notify(msg, level, opts)
		end
	end
end
