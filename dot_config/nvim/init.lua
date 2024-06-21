-- Options
vim.o.background = 'dark'
vim.o.clipboard = 'unnamedplus'
vim.o.completeopt = 'noinsert,menuone,noselect'
vim.wo.cursorline = true
vim.o.hidden = true
vim.o.inccommand = 'split'
vim.o.mouse = 'a'
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.title = true
vim.o.ttimeoutlen = 0
vim.o.wildmenu = true

-- Tabs size
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2

vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')

-- True color if available
local term_program = os.getenv('TERM_PROGRAM')

-- Check for conflicts with Apple Terminal app
if term_program ~= 'Apple_Terminal' then
    vim.o.termguicolors = true
else
    if os.getenv('TERM') ~= 'xterm-256color' then
        vim.o.termguicolors = true
    end
end

-- prevent typo when pressing `wq` or `q`
vim.cmd [[
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))
cnoreabbrev <expr> WQ ((getcmdtype() is# ':' && getcmdline() is# 'WQ')?('wq'):('WQ'))
cnoreabbrev <expr> Wq ((getcmdtype() is# ':' && getcmdline() is# 'Wq')?('wq'):('Wq'))
]]


-- Plugins
vim.cmd('call plug#begin()')
vim.cmd('Plug \'vim-airline/vim-airline\'')
vim.cmd('Plug \'ryanoasis/vim-devicons\'')
vim.cmd('Plug \'sheerun/vim-polyglot\'')
vim.cmd('Plug \'jiangmiao/auto-pairs\'')
vim.cmd('Plug \'ap/vim-css-color\'')
vim.cmd('Plug \'preservim/nerdtree\'')
-- vim.cmd('Plug \'neoclide/coc.nvim\',  {\'branch\': \'release\'}')
vim.cmd('Plug \'plasticboy/vim-markdown\'')
vim.cmd('Plug \'airblade/vim-gitgutter\'')
vim.cmd('Plug \'Mofiqul/dracula.nvim\'')
vim.cmd('Plug \'folke/twilight.nvim\'')
vim.cmd('Plug \'nvim-lua/plenary.nvim\'')
vim.cmd('Plug \'nvim-pack/nvim-spectre\'')
vim.cmd('call plug#end()')

vim.cmd('colorscheme dracula')


-- local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- if not (vim.uv or vim.loop).fs_stat(lazypath) then
--   vim.fn.system({
--     "git",
--     "clone",
--     "--filter=blob:none",
--     "https://github.com/folke/lazy.nvim.git",
--     "--branch=stable", -- latest stable release
--     lazypath,
--   })
-- end
-- vim.opt.rtp:prepend(lazypath)