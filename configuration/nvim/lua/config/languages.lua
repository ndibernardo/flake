local function inlay_hints()
  return vim.lsp.inlay_hint.enable()
end
local definitions = {{filetype = "clojure", conjure = true, formatter = "cljfmt", lsp = {"clojure_lsp", {}}}, {filetype = "elixir", lsp = {"elixirls", {}}}, {filetype = "fennel", conjure = true, formatter = "fnlfmt", lsp = {"fennel_ls", {}}}, {filetype = "fsharp", lsp = {"fsautocomplete", {}}}, {filetype = "go", lsp = {"gopls", {on_attach = inlay_hints, settings = {gopls = {analyses = {unusedparams = true}, staticcheck = true}}}}}, {filetype = "lua", lsp = {"lua_ls", {settings = {Lua = {runtime = {version = "LuaJIT"}, diagnostics = {globals = {"vim", "require"}}, workspace = {library = vim.api.nvim_get_runtime_file("", true), ignoreDir = {"result", ".direnv"}, checkThirdParty = false}, telemetry = {enable = false}}}}}}, {filetype = "nix", lsp = {"nixd", {settings = {nixd = {formatting = {command = {"nixfmt"}}}}}}}, {filetype = "ocaml", lsp = {"ocamllsp", {}}}, {filetype = "python", lsp = {"pyright", {settings = {python = {analysis = {typeCheckingMode = "basic"}}}}}}, {filetype = "rust", lsp = {"rust_analyzer", {on_attach = inlay_hints, settings = {["rust-analyzer"] = {cargo = {features = "all"}}}}}}, {filetype = "zig", lsp = {"zls", {root_markers = {".git", {"build.zig", "zls.json"}}, settings = {zls = {enable_inlay_hints = true, enable_snippets = true, warn_style = true}}}}}, {filetype = "lisp", conjure = true}}
local function lsp_servers()
  local servers = {}
  for _, language in ipairs(definitions) do
    if language.lsp then
      table.insert(servers, language.lsp)
    else
    end
  end
  return servers
end
local function formatters_by_filetype()
  local formatters = {}
  for _, language in ipairs(definitions) do
    if language.formatter then
      formatters[language.filetype] = {language.formatter}
    else
    end
  end
  return formatters
end
local function conjure_filetypes()
  local filetypes = {}
  for _, language in ipairs(definitions) do
    if language.conjure then
      table.insert(filetypes, language.filetype)
    else
    end
  end
  return filetypes
end
return {definitions = definitions, ["lsp-servers"] = lsp_servers(), ["formatters-by-filetype"] = formatters_by_filetype(), ["conjure-filetypes"] = conjure_filetypes()}
