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

return {
  setup = function(groups)
    local definitions = {}
    for _, group in ipairs(groups) do
      table.insert(definitions, require(group))
    end
    local combined = combine(definitions)
    lazy.setup(combined, {
      rocks = {
        -- required by rest.nvim until the issue https://github.com/rest-nvim/rest.nvim/issues/559 is fixed.
        server = "https://lumen-oss.github.io/rocks-binaries/",
      },
    })
  end
}
