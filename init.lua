local core = require "core"
local doc = require "core.doc"
local keymap = require "core.keymap"
local config = require "core.config"
local style = require "core.style"

local lspconfig = require "plugins.lsp.config"
local lsp = require("plugins.lsp")

config.ignore_files = {
  -- folders
  "^%.svn/",        "^%.git/",   "^%.hg/",        "^CVS/", "^%.Trash/", "^%.Trash%-.*/",
  "^node_modules/", "^%.cache/", "^__pycache__/", "^%.zig%-cache$",

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

keymap.unbind("ctrl+a")
keymap.add({
    ["ctrl+shift+a"] = "doc:select-all",
    ["ctrl+e"] = "doc:move-to-end-of-line",
    ["ctrl+a"] = "doc:move-to-start-of-line"
})

lspconfig.clangd.setup()

lsp.add_server({
    name = "zig-zls",
    language = "zig",
    file_patterns = {"%.zig$","%.zig.zon$"},
    command = {"zls"},
    requests_per_second = 16,
    verbose = false,
    incremental_changes = true,
})
