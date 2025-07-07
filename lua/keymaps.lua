-- vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>f", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>p", "<cmd>Telescope find_files<cr>")
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<leader>o", "o<Esc>k")
vim.keymap.set("n", "<leader>O", "O<Esc>j")
-- vim.keymap.set("n", "<leader>e", [[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]], {noremap = true, silent = true})
vim.keymap.set("n", "<leader>e", "<cmd>Telescope oldfiles<CR>", {noremap=true, silent=true})
vim.keymap.set("n", "<leader>b", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>", {noremap=true})
vim.keymap.set("n", "<leader>h", "<cmd>Telescope help_tags<CR>", {noremap=true})
vim.keymap.set("n", "<leader>m", "<cmd>messages<CR>", {noremap=true})
vim.keymap.set("n", "<leader>re", [[<cmd>lua require('telescope').extensions.rest.select_env()<CR>]], {noremap = true, silent = true})
vim.keymap.set("n", "<leader>d", [[<cmd>lua require('telescope').extensions.diff.diff_current({ hidden = true })<CR>]], {noremap = true, silent = true})
-- vim.keymap.set("n", "<leader>n", "<cmd>NvimTreeOpen<CR>", {noremap=true})
vim.keymap.set("n", "<leader>-", "<cmd>Oil<CR>", {noremap=true})
--vim.keymap.set("n", "<leader>rr", "<cmd>Rest run<CR>", {noremap=true})
-- vim.keymap.set("n", "<leader>re", [[<cmd>lua require('telescope').extensions.rest.select_env()<CR>]], {noremap=true})
-- vim.keymap.set("n", "<leader>r", "<cmd>Http<CR>", {noremap=true})
-- vim.keymap.set("n", "<leader>r", "<cmd>Ij<CR>", {noremap=true})
vim.keymap.set("n", "<leader>gpl", "<cmd>Octo pr list<CR>", {noremap=true})
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>", {noremap=true})
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>", {noremap=true})
vim.keymap.set("n", "<leader>ac", "<cmd>CodeCompanionChat<CR>", {noremap=true})
vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR>", {noremap=true})
--vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm direction=horizontal<CR>", {noremap=true})

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
    --   cmd = "Ijhttp run"
  else
    vim.notify("No run command defined for file type: " .. ft, vim.log.levels.WARN)
    return
  end

  vim.cmd(cmd) -- Execute the command
end

-- vim.keymap.set("n", "<leader>rr", "<cmd>Ijhttp run<CR>", {noremap=true})
vim.keymap.set("n", "<leader>rr", run_file, {noremap=true, silent=true, desc="Run current file"})

--local function compare_with_clipboard()
--end
--vim.keymap.set("n", "<leader>cd", compare_with_clipboard, {noremap=true, silent=true, desc="Compare with clipboard"})
