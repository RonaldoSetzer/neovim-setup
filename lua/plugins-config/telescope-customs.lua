vim.api.nvim_set_keymap('n', '<Leader>fw', '<cmd>lua require(\'telescope-customs.wikifiles\').search_wikifiles()<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>vrc', '<cmd>lua require(\'telescope-customs.dotfiles\').search_dotfiles()<CR>',
                        {noremap = true, silent = true})
