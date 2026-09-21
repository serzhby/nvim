-- Scopes telescope file/grep search to a folder picked in neo-tree.
-- Two modes: the node under the cursor (transient, while in the tree window)
-- and a pinned folder that survives leaving the tree.
local M = {}

M.pinned = nil

--- Directory for the neo-tree node under the cursor, or nil if not in neo-tree.
local function node_dir()
  local ok, manager = pcall(require, "neo-tree.sources.manager")
  if not ok then
    return nil
  end
  -- Returns nil unless the current window is a neo-tree window.
  local state = manager.get_state_for_window(vim.api.nvim_get_current_win())
  if not state or not state.tree then
    return nil
  end
  local node = state.tree:get_node()
  if not node or node.type == "message" then
    return nil
  end
  local path = node:get_id()
  return node.type == "directory" and path or vim.fs.dirname(path)
end

--- Node under the cursor wins; otherwise the pinned scope; otherwise nil (cwd).
function M.resolve()
  return node_dir() or M.pinned
end

function M.pin()
  local dir = node_dir()
  if not dir then
    vim.notify("Search scope: no neo-tree node under the cursor", vim.log.levels.WARN)
    return
  end
  M.pinned = dir
  vim.notify("Search scope: " .. vim.fn.fnamemodify(dir, ":~:."))
end

function M.clear()
  M.pinned = nil
  vim.notify("Search scope cleared")
end

function M.status()
  return M.pinned and vim.fn.fnamemodify(M.pinned, ":~:.") or ""
end

local function picker(name)
  local dir = M.resolve()
  require("telescope.builtin")[name]({
    cwd = dir,
    prompt_title = dir and (name .. ": " .. vim.fn.fnamemodify(dir, ":~:.")) or nil,
  })
end

function M.find_files() picker("find_files") end
function M.live_grep() picker("live_grep") end

return M
