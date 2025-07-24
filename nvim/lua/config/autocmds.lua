vim.api.nvim_create_autocmd({ "VimEnter" }, {
  desc = "Open Telescope on directory",
  pattern = "*",
  callback = function(args)
    if vim.fn.argc() > 0 then
      local arg = vim.fn.argv()[1]
      local stat = vim.loop.fs_stat(arg)
      if stat and stat.type == "directory" then
        vim.schedule(function()
          vim.api.nvim_buf_delete(args.buf, { force = true })
		  -- Open the telescope with the directory as the argument 1
		  require('telescope.builtin').find_files({ cwd = arg })
        end)
      end
    end
  end,
})
