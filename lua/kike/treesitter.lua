local status_ok, configs = pcall(require, "nvim-treesitter.configs")

if not status_ok then
  return
end

configs.setup {
  -- List of parsers name or "all"
  ensure_installed = {
    "python",
    "lua",
    "json",
    "yaml",
    "make",
    "markdown",
    "dockerfile"
  },

  -- install languages s ynchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "" },

  -- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- false will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },

  -- Indentation based on treesitter for the equal operator
  -- NOTE: This is an experimental feature
  indent = {
    enable = true,
    disable = { "yaml" }
  },

  -- Allows for commentstring for embedded languages in certaing types of files
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },

  -- Rainbow parentheses for neovim using tree-sitter
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, -- List of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    colors = { "#B58900", "#CB4B16", "#6C71C4", "#D33682" }, -- table of colour hex strings
    -- termcolors = {} -- table of colour name strings
  }
}
