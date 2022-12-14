local status_ok, npairs = pcall(require, "nvim-autopairs")

if not status_ok then
  return
end

npairs.setup {
  disable_filetype = { "TelescopePrompt", "spectre_panel" },
  disable_in_macro = false,  -- disable when recording or executing a macro
  disable_in_visualblock = false, -- disable when insert after visual block mode
  ignored_next_char = [=[[%w%%%'%[%"%.]]=],
  enable_moveright = true,
  enable_afterquote = true,  -- add bracket pairs after quote
  enable_check_bracket_line = true,  --- check bracket in same line
  enable_bracket_in_quote = true,
  break_undo = true, -- switch for basic rule break undo sequence
  check_ts = true,
  map_cr = true,
  map_bs = true,  -- map the <BS> key
  map_c_h = false,  -- Map the <C-h> key to delete a pair
  map_c_w = false, -- map <c-w> to delete a pair if possible
  ts_config = {
    lua = { "string", "source" }, -- it will not add a pair on that treesitter node
    javascript = { "string", "template_string" },
    java = false, -- don't check treesitter on java
  },
  fast_wrap = {
    map = "<C-e>",
    chars = { "{", "[", "(", '"', "'" },
    pattern = [=[[%'%"%)%>%]%)%}%,]]=],
    end_key = "$",
    keys = "qwertyuiopzxcvbnmasdfghjkl",
    check_comma = true,
    highlight = "Search",
    highlight_grey = "Comment",
  },
}

local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local cmp_status_ok, cmp = pcall(require, "cmp")

if not cmp_status_ok then
  return
end

cmp.event:on(
  "confirm_done",
  cmp_autopairs.on_confirm_done()
)
