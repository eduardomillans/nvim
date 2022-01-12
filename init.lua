-- Require global variables
require("nv.vars")

-- Require core
require("nv.core")

-- Require plugins
require("nv.plugins")

-- Global functions
Print = function(value)
  print(vim.inspect(value))
end
