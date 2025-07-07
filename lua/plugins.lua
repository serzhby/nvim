local lazy = require("lazy")

local function combine(...)
  local result = {}
  for _, tbl in ipairs({ ... }) do
    if type(tbl) == "table" then
      for _, item in ipairs(tbl) do
        table.insert(result, item)
      end
    else
      table.insert(result, tbl)
    end
  end

  return result
end

local combined = combine(
  require("core"),
  require("look-and-feel"),
  require("git"),
  require("database"),
  require("files"),
  require("neorg-notes"),
  require("code-assistant")
)

lazy.setup(combined)
