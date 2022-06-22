local colorscheme = "gruvbox"
local options = {
  autoread = true,
  expandtab = true,
  hlsearch = true,
  number = true,
  smartindent = true,
  smarttab = true,
  wrap = false,
  fileencoding = "utf-8",
}

local extra_options = {
  shiftwidth = 4,
  softtabstop = 0,
  tabstop = 4,
}

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
end

for k, v in pairs(options) do
  vim.opt[k] = v
end
