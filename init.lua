local core = require "core"
local keymap = require "core.keymap"
local config = require "core.config"
local style = require "core.style"

config.ignore_files = {
  -- folders
  "^%.svn/",        "^%.git/",   "^%.hg/",        "^CVS/", "^%.Trash/", "^%.Trash%-.*/",
  "^node_modules/", "^%.cache/", "^__pycache__/",
  -- files
  "%.pyc$",         "%.pyo$",       "%.exe$",        "%.dll$",   "%.obj$", "%.o$",
  "%.a$",           "%.lib$",       "%.so$",         "%.dylib$", "%.ncb$", "%.sdf$",
  "%.suo$",         "%.pdb$",       "%.idb$",        "%.class$", "%.psd$", "%.db$",
  "^desktop%.ini$", "^%.DS_Store$", "^%.directory$",
}

config.fps = 120
config.tab_type = "hard"
config.indent_size = 4
config.plugins.scale.default_scale = 1.69

local lspconfig = require "plugins.lsp.config"
local lsp = require("plugins.lsp")

lspconfig.clangd.setup()

lsp.add_server({
    name = "zig-zls",
    language = "zig",
    file_patterns = {"%.zig$","%.zig.zon$"},
    command = {"zls"},
    requests_per_second = 50,
    verbose = false,
    incremental_changes = false,
})
