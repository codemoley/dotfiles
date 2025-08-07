--- LAZY & PLUGINS ---
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- choose plugins
require("lazy").setup({
  spec = {
    { "ellisonleao/gruvbox.nvim",      priority = 1000,       config = true,  opts = ... },
    { "neovim/nvim-lspconfig" },
    { "windwp/nvim-autopairs",         event = "InsertEnter", config = true },
    { "nvim-telescope/telescope.nvim", tag = "0.1.8" },
    { "nvim-lua/plenary.nvim" },
    { "nvim-tree/nvim-web-devicons" },
    { "folke/trouble.nvim",            opts = {},             CMD = "Trouble" },
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
        require("nvim-treesitter.configs").setup({
          ensure_installed = {
            "lua",
            "vim",
            "markdown",
            "rust",
            "go",
            "python"
          },
          sync_install = false,
          auto_install = true,
          highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
          },
          indent = {
            enable = true,
          },
        })
      end
    },
  },
  checker = { enabled = true },
})

--- LSP CONFIG ---
vim.lsp.enable({ "lua_ls", "rust_analyzer", "clangd" })

--- KEYMAPS ---
-- set leaders
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- open netrw
vim.keymap.set("n", "<leader>e", "<CMD>Ex<CR>")
vim.keymap.set("n", "<leader>ev", "<CMD>Vex<CR>")
vim.keymap.set("n", "<leader>eh", "<CMD>Sex<CR>")

-- navigate splits with ctrl+hjkl
vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")

-- close windows with leader+q
vim.keymap.set("n", "<leader>q", "<C-w><C-q>")

-- splits
vim.keymap.set("n", "<leader>sv", "<CMD>vsplit<CR>")
vim.keymap.set("n", "<leader>sh", "<CMD>split<CR>")

-- telescope
vim.keymap.set("n", "<leader>fg", "<CMD>Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>ff", "<CMD>Telescope find_files<CR>")

-- lsp handling
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)

-- trouble.nvim keymaps
vim.keymap.set("n", "<leader>xx", "<CMD>Trouble diagnostics toggle<CR>")
vim.keymap.set("n", "<leader>xX", "<CMD>Trouble diagnostics toggle filter.buf=0<CR>")
vim.keymap.set("n", "<leader>cs", "<CMD>Trouble symbols toggle focus=false<CR>")
vim.keymap.set("n", "<leader>cl", "<CMD>Trouble lsp toggle focus=false win.position=right<CR>")
vim.keymap.set("n", "<leader>xL", "<CMD>Trouble loclist toggle<CR>")
vim.keymap.set("n", "<leader>xQ", "<CMD>Trouble qflist toggle<CR>")

--- EDITOR OPTIONS ---
-- set colourscheme
vim.cmd("colorscheme gruvbox")

-- line numbers
vim.o.number = true
vim.o.relativenumber = true

-- set tab size to 2 spaces
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true

-- search settings
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.incsearch = true

-- visual settings
vim.o.termguicolors = true

-- highlight cursor
vim.o.cursorline = true

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- DeCRease update time
vim.o.updatetime = 250

-- DeCRease mapped sequence wait time
vim.o.timeoutlen = 300
