local context_manager = require("plenary.context_manager")

local with = context_manager.with
local open = context_manager.open

local M = {}
M.config = {
  -- default config
  opt = "Hello!",
}

-- setup is the public method to setup your plugin
M.setup = function(args)
  -- you can define your setup function here. Usually configurations can be merged, accepting outside params and
  -- you can also put some validation here for those.
  M.config = vim.tbl_deep_extend("force", M.config, args or {})
end

M.load = function()
  local result = with(open("tests/fixtures.json"), function(reader)
    while true do
      local line = reader:read()
      if line == nil then
        break
      end

      print(line)
    end
  end)
  return result
end

return M
