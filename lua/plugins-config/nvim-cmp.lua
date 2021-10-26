-- Setup nvim-cmp
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local cmp = require 'cmp'
local lspkind = require 'lspkind'

cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn['vsnip#anonymous'](args.body)
    end
  },
  mapping = {

    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {select = true},
    -- Right is for ghost_text to behave like terminal
    ['<Right>'] = cmp.mapping.confirm {select = true},
    -- Don't insert if I explicitly exit
    -- Start completion with C-Space to have it truly clean-up
    ['<C-e>'] = cmp.mapping.abort(),
    -- Insert instead of Select so you don't go away at `stopinsert` after `CursorHoldI`
    -- @TODOUA: I want to be able to `Select` without `stopinsert` killing it (& keep `stopinsert`)
    ['<Down>'] = cmp.mapping.select_next_item {behavior = cmp.SelectBehavior.Insert},
    ['<Up>'] = cmp.mapping.select_prev_item {behavior = cmp.SelectBehavior.Insert},
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn['vsnip#available']() == 1 then
        feedkey('<Plug>(vsnip-expand-or-jump)', '')
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, {'i', 's'}),
    ['<S-Tab>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn['vsnip#jumpable'](-1) == 1 then
        feedkey('<Plug>(vsnip-jump-prev)', '')
      end
    end, {'i', 's'})
  },
  experimental = {ghost_text = true},
  border = {'╭', '─', '╮', '│', '╯', '─', '╰', '│'},
  sources = {
    -- 'crates' is lazy loaded
    {name = 'nvim_lsp'}, {name = 'treesitter'}, {name = 'vsnip'}, {name = 'path'}, {
      name = 'buffer',
      opts = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end
      }
    }, {name = 'spell'}
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = string.format('%s %s', lspkind.presets.default[vim_item.kind], vim_item.kind)
      vim_item.menu = ({
        nvim_lsp = 'ﲳ',
        nvim_lua = '',
        treesitter = '',
        path = 'ﱮ',
        buffer = '﬘',
        zsh = '',
        vsnip = '',
        spell = '暈'
      })[entry.source.name]

      return vim_item
    end
  }
}
