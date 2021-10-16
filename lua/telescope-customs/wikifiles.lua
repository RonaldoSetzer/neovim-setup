local M = {}

M.search_wikifiles = function()
    require("telescope.builtin").live_grep({
        prompt_title = "< Vim Wiki >",
        cwd = "$HOME/documents/vimwiki"
    })
end

return M
