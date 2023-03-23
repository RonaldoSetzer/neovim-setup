require("nvim-treesitter.configs").setup {
  ensure_installed = {
    'css', 'dockerfile', 'go', 'graphql', 'html', 'javascript', 'json', 'json5', 'lua', 'markdown',
    'regex', 'scss', 'svelte', 'tsx', 'typescript', 'vim', 'vue', 'yaml'
  },
  sync_install = false,
  ignore_install = {""}, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = {""}, -- list of language that will be disabled
    additional_vim_regex_highlighting = true
  },
  context_commentstring = {enable = true},
  --[[ rainbow = {enable = true, colors = {'#ffd701', "#da70d6", "#179fff"}}, ]]
  indent = {enable = true, disable = {"yaml"}}
}
