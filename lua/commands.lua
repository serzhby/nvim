vim.cmd([[
  command Gpush Git pull --rebase | Git push
  command Jq %!jq .
  command Gwc w | Gwrite | Git commit
  command Gconfig w | Gwrite | Git commit -m "feat(mx): config." | Git pull --rebase | Git push
  command Gdeploy w | Gwrite | Git commit -m "feat(es): deploy." | Git pull --rebase | Git push
]])
