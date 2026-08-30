local function options_21(target, specification)
  for name, value in pairs(specification) do
    target[name] = value
  end
  return target
end
local function mappings_21(specification)
  for _, binding in ipairs(specification) do
    local mode = binding[1]
    local lhs = binding[2]
    local rhs = binding[3]
    local options = binding[4]
    vim.keymap.set(mode, lhs, rhs, (options or {}))
  end
  return nil
end
local function lsp_servers_21(capabilities, specification)
  local servers = {}
  for _, _1_ in ipairs(specification) do
    local server = _1_[1]
    local options = _1_[2]
    table.insert(servers, server)
    vim.lsp.config[server] = vim.tbl_deep_extend("force", {capabilities = capabilities}, options)
  end
  return vim.lsp.enable(servers)
end
return {["options!"] = options_21, ["mappings!"] = mappings_21, ["lsp-servers!"] = lsp_servers_21}
