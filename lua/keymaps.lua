vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>o", "o<Esc>k")
vim.keymap.set("n", "<leader>O", "O<Esc>j")
vim.keymap.set("n", "<leader>m", "<cmd>messages<CR>", {noremap=true})
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>", {noremap=true})
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>", {noremap=true})

local function run_file()
  local ft = vim.bo.filetype -- Get the file type of the current buffer
  local cmd = ""

  if ft == "sh" then
    cmd = "!bash %"
  elseif ft == "groovy" then
    cmd = "!groovy %"
  elseif ft == "python" then
    cmd = "!python3 %"
  elseif ft == "http" then
    cmd = "vertical botright Rest run"
  else
    vim.notify("No run command defined for file type: " .. ft, vim.log.levels.WARN)
    return
  end

  vim.cmd(cmd)
end

vim.keymap.set("n", "<leader>rr", run_file, {noremap=true, silent=true, desc="Run current file"})

