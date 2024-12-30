local M = {}

function M.setup()
  -- Disable auto folding
  vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter" }, {
    pattern = "*",
    callback = function()
      vim.opt.foldenable = false
      vim.opt.foldmethod = "indent"
      vim.opt.foldlevelstart = 99
    end,
    desc = "Disable auto folding",
  })

  -- Automatically create missing directories before saving a file
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
      local dir = vim.fn.expand("<afile>:p:h")
      if not vim.fn.isdirectory(dir) then
        local confirm = vim.fn.confirm("Create a new directory?", "&Yes\n&No")
        if confirm == 1 then
          vim.fn.mkdir(dir, "p")
          vim.cmd("lcd " .. dir)
          vim.cmd("saveas " .. vim.fn.expand("<afile>:t"))
          print("Created a new directory: " .. dir)
          vim.cmd("bdelete! " .. vim.fn.bufnr("$"))
        end
      end
    end,
    desc = "Create directories automatically when saving files",
  })
end

return M
