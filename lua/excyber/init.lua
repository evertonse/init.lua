if require("excyber.kickstart") == -1 then
  return
end

require("excyber.remap")
require("excyber.settings")

require("excyber.after.lsp")
require("excyber.after.nvim-tree")
-- The line beneath this is called `modeline`. See `:help modeline`

-- vim: ts=2 sts=2 sw=2 et