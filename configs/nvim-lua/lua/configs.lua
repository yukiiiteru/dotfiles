local colorscheme = "gruvbox"
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
  fileencoding = "utf-8",
  mouse = "",
}

local qemu_options = {
  expandtab = true,
  shiftwidth = 4,
  softtabstop = 4,
  tabstop = 4,
}

local yaml_lua_options = {
  expandtab = false,
  shiftwidth = 2,
  softtabstop = 2,
  tabstop = 2,
}

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
end

for k, v in pairs(def_options) do
  vim.opt[k] = v
end

local pwd = vim.env.PWD

if string.find(pwd, "qemu") ~= nil then
  for k, v in pairs(qemu_options) do
    vim.opt[k] = v
  end
end

if vim.bo.filetype == "yaml" or vim.bo.filetype == "lua" then
  for k, v in pairs(yaml_lua_options) do
    vim.opt[k] = v
  end
end
