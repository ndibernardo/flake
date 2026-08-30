local languages = require("config.languages")
local nvim = require("config.nvim")
local telescope = require("telescope.builtin")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lsp_group = vim.api.nvim_create_augroup("lsp-attach", {clear = true})
local function _1_(event)
  local function buffer_map(keys, action, description)
    return vim.keymap.set("n", keys, action, {buffer = event.buf, desc = ("LSP: " .. description)})
  end
  buffer_map("gd", telescope.lsp_definitions, "[G]oto [D]efinition")
  buffer_map("gr", telescope.lsp_references, "[G]oto [R]eferences")
  buffer_map("grr", telescope.lsp_references, "[G]oto [R]eferences")
  buffer_map("gI", telescope.lsp_implementations, "[G]oto [I]mplementation")
  buffer_map("<leader>D", telescope.lsp_type_definitions, "Type [D]efinition")
  buffer_map("<leader>ds", telescope.lsp_document_symbols, "[D]ocument [S]ymbols")
  buffer_map("<leader>ws", telescope.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
  buffer_map("<leader>rr", vim.lsp.buf.rename, "[R]ename")
  buffer_map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
  buffer_map("K", vim.lsp.buf.hover, "Hover Documentation")
  buffer_map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
  buffer_map("<leader>f", vim.lsp.buf.format, "[F]ormat")
  local client = vim.lsp.get_client_by_id(event.data.client_id)
  if (client and client.server_capabilities.documentHighlightProvider) then
    vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {group = lsp_group, buffer = event.buf, callback = vim.lsp.buf.document_highlight})
    return vim.api.nvim_create_autocmd({"CursorMoved", "CursorMovedI"}, {group = lsp_group, buffer = event.buf, callback = vim.lsp.buf.clear_references})
  else
    return nil
  end
end
vim.api.nvim_create_autocmd("LspAttach", {group = lsp_group, callback = _1_})
local function _3_(_)
  return vim.lsp.buf.clear_references()
end
vim.api.nvim_create_autocmd("LspDetach", {group = lsp_group, callback = _3_})
require("fidget").setup({notification = {window = {winblend = 0}}})
return nvim["lsp-servers!"](capabilities, languages["lsp-servers"])
