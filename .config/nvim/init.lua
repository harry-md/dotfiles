-- Disable built-in plugins
vim.g.loaded_osc52 = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Disable Provider
-- Stop Neovim from checking your system for Python/Node/Ruby/Perl on startup.
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

--
require("config.lazy")

vim.cmd.colorscheme("vague")
require("oil").setup()
require("treesitter-context").setup()
require("plugins.vim-fugitive")
-- require("el").setup({})
require("mini.statusline")

-- require("codeium").setup({
--   enable_cmp_source = false,
--   virtual_text = {
--     enabled = true,
--     manual = false,
--     filetypes = {
--       snacks_picker_input = false,
--       markdown = false,
--       text = false,
--       env = false,
--     },
--     default_filetype_enabled = true,
--     idle_delay = 75,
--     virtual_text_priority = 65535,
--     map_keys = true,
--     accept_fallback = nil,
--     key_bindings = {
--       accept = "<Tab>",
--       accept_word = false,
--       accept_line = false,
--       clear = false,
--       next = "<A-]>",
--       prev = "<A-[>",
--     },
--   },
-- })
