local cmp = require("cmp")
local languages = require("config.languages")
local luasnip = require("luasnip")
luasnip.config.setup({})
require("luasnip.loaders.from_vscode").lazy_load()
local function _1_(args)
  return luasnip.lsp_expand(args.body)
end
local function _2_()
  if luasnip.expand_or_locally_jumpable() then
    return luasnip.expand_or_jump()
  else
    return nil
  end
end
local function _4_()
  if luasnip.locally_jumpable(-1) then
    return luasnip.jump(-1)
  else
    return nil
  end
end
cmp.setup({snippet = {expand = _1_}, completion = {completeopt = "menu,menuone,noinsert"}, mapping = cmp.mapping.preset.insert({["<C-n>"] = cmp.mapping.select_next_item(), ["<C-p>"] = cmp.mapping.select_prev_item(), ["<C-b>"] = cmp.mapping.scroll_docs(-4), ["<C-f>"] = cmp.mapping.scroll_docs(4), ["<Tab>"] = cmp.mapping.confirm({select = true}), ["<C-Space>"] = cmp.mapping.complete({}), ["<C-l>"] = cmp.mapping(_2_, {"i", "s"}), ["<C-h>"] = cmp.mapping(_4_, {"i", "s"})}), sources = {{name = "nvim_lsp"}, {name = "conjure"}, {name = "luasnip"}, {name = "path"}}})
return require("conform").setup({format_on_save = {timeout_ms = 500, lsp_format = "fallback"}, formatters_by_ft = languages["formatters-by-filetype"]})
