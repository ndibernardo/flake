for _, module in ipairs({"config.core", "config.languages", "config.conjure", "config.keymaps", "config.completion", "config.lsp", "config.plugins"}) do
  require(module)
end
return nil
