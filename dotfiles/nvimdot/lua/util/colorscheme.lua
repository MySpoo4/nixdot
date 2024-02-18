local colorscheme;

local ok, nix_colorscheme = pcall(require, 'util/nix_colorscheme')
if ok then
  colorscheme = nix_colorscheme
else 
  colorscheme = 'gruvbox'
end

return colorscheme
