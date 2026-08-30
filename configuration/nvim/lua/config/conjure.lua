local languages = require("config.languages")
do
  local settings = {["conjure#filetypes"] = languages["conjure-filetypes"], ["conjure#log#hud#enabled"] = true, ["conjure#log#hud#anchor"] = "SE", ["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = true, ["conjure#client#clojure#nrepl#connection#auto_repl#hidden"] = true, ["conjure#client#clojure#nrepl#connection#auto_repl#cmd"] = "bb nrepl-server localhost:$port", ["conjure#client#common_lisp#swank#connection#default_host"] = "127.0.0.1", ["conjure#client#common_lisp#swank#connection#default_port"] = "4005"}
  for name, value in pairs(settings) do
    vim.g[name] = value
  end
end
vim.g["parinfer_mode"] = "smart"
vim.g["parinfer_filetypes"] = languages["conjure-filetypes"]
local swank_job = nil
local function start_swank()
  if swank_job then
    return vim.notify("The Conjure SBCL/Swank job is already running", vim.log.levels.INFO)
  else
    local job
    local function _1_(_, code)
      swank_job = nil
      if (code ~= 0) then
        local function _2_()
          return vim.notify(("SBCL/Swank exited with code " .. code), vim.log.levels.ERROR)
        end
        return vim.schedule(_2_)
      else
        return nil
      end
    end
    job = vim.fn.jobstart({"conjure-sbcl"}, {on_exit = _1_, detach = false})
    if (job > 0) then
      swank_job = job
      vim.notify("Starting SBCL/Swank on 127.0.0.1:4005", vim.log.levels.INFO)
      local function _4_()
        return pcall(vim.cmd, "ConjureConnect 127.0.0.1 4005")
      end
      return vim.defer_fn(_4_, 750)
    else
      return vim.notify("Unable to start conjure-sbcl", vim.log.levels.ERROR)
    end
  end
end
vim.api.nvim_create_user_command("ConjureSwank", start_swank, {desc = "Start SBCL/Swank and connect Conjure"})
return vim.keymap.set("n", "<localleader>cS", start_swank, {desc = "[C]onjure start [S]wank"})
