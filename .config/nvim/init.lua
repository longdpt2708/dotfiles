require('base')
require('plugins')
require('maps')
require('highlights')

local has = function(x)
  return vim.fn.has(x) == 1
end

local is_mac = has "macunix"
local is_linux = has "linux"
local is_win = has "win32"

-- require('macos-linux')

if is_mac or is_linux then
  require('macos-linux')
end
if is_win then
  require('windows')
end


if (vim.fn.has("termguicolors")) then
 vim.opt.termguicolors = true
end

vim.opt.syntax = 'enable'
