local def_options = {
	autoindent = true,
	autoread = true,
	hlsearch = true,
	number = true,
	smarttab = true,
	smartindent = true,
	wrap = false,
	shiftwidth = 8,
	tabstop = 8,
	fileencoding = 'utf-8',
	mouse = '',
}

local yaml_options = {
	expandtab = false,
	shiftwidth = 2,
	softtabstop = 2,
	tabstop = 2,
}

for k, v in pairs(def_options) do
	vim.opt[k] = v
end

if vim.bo.filetype == 'yaml' then
	for k, v in pairs(yaml_options) do
		vim.opt[k] = v
	end
end
