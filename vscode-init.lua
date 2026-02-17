-- ~/.config/nvim/vscode-init.lua

-- 默认使用系统剪贴板（y/p 都走系统 clipboard）
-- vim.o.clipboard = 'unnamedplus'

-- yank 高亮
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('vscode-yank-highlight', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("yank-to-clipboard-only", { clear = true }),
  callback = function()
    if vim.v.event.operator == "y" then
      local text = vim.fn.getreg('"')
      local regtype = vim.fn.getregtype('"')
      vim.fn.setreg("+", text, regtype)
    end
  end,
})
