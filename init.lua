-- Require global variables
require("nv.vars")

-- Require core
require("nv.core")

-- Require plugins
require("nv.plugins")

-- Global functions
P = function(value)
  vim.pretty_print(value)
end
