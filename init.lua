vim.opt.cursorline = true
vim.opt.autoindent = true
--vim.opt.paste = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.clipboard   = "unnamedplus"
vim.opt.completeopt = ""
-- vim.opt.mouse = a
vim.cmd "set guifont=Consolas:h16"


function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function vmap(shortcut, command)
  map('v', shortcut, command)
end

-- command line mode remap?
function cmap(shortcut, command)
  map('c', shortcut, command)
end


function imap(shortcut, command)
  map('i', shortcut, command)
end

--compile stuff
vim.opt.makeprg="build.bat"
vim.opt.errorformat=" %#%f(%l\\,%c): %m" --for msbuild
imap("<F5>", "<C-o>:make<CR>")
nmap("<F5>", ":make<CR>") 
imap("<C-PageDown>", "<C-o>:cnext<CR>")
imap("<C-PageUp>",   "<C-o>:cprevious<CR>")
nmap("<C-PageDown>", ":cnext<CR>")
nmap("<C-PageUp>",   ":cprevious<CR>")

imap("<F1>", "<C-o>:!devenv /edit %<CR><CR>")

--undo/redo
imap("<A-z>", "<C-o><C-r>")
imap("<A-u>", "<C-o><C-r>")
imap("<C-u>", "<C-O>u")
imap("<C-z>", "<C-O>u")

nmap("<A-z>", "<C-r>")
nmap("<A-u>", "<C-r>")
nmap("<C-u>", "u")
nmap("<C-z>", "u")


--emacs keybinding
vim.api.nvim_exec("inoremap <nowait> <A-x> <C-o>:", false) 
vim.api.nvim_exec("nnoremap <nowait> <A-x> :", false) 
vim.api.nvim_exec("vnoremap <nowait> <A-x> :", false) 

--panel stuff
imap('<C-;>', "<C-o><C-w><C-w>")
nmap('<C-;>', "<C-w><C-w>")

--indentation stuff
vim.api.nvim_exec("nnoremap <Tab> >>", false)
vim.api.nvim_exec("nnoremap <S-Tab> <<", false)
vim.api.nvim_exec("nnoremap <C-Tab> ==", false)

vim.api.nvim_exec("inoremap <S-Tab> <C-d>", false)
vim.api.nvim_exec("inoremap <C-Tab> <C-o>==", false)

--vim.api.nvim_exec("inoremap <A-i> {}<Left><cr><C-o>O", false)
vim.api.nvim_exec("inoremap <A-i> <cr><C-o>O", false) -- expand braces and indent

vim.opt.cinoptions = "l1, :0"


--toggle between .h and .cpp files
vim.api.nvim_exec("inoremap <C-k> <C-o>:find %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>", false) -- line start
vim.api.nvim_exec("nnoremap <C-k> :find %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>", false) -- line start

nmap('<C-d>', 'i')
--imap('<C-d>', '<ESC>l')
imap('<C-d>', '<C-o>:stopinsert<CR>')

imap('<C-j>', '<C-p>')
imap('<C-,>', '_')
imap('<C-.>', '->')
imap('<C-BS>', '<C-w>')
imap('<C-BS>', '<C-w>')
imap('<C-Del>', '<C-o>"_dw')

--incremental search
--imap('<C-f>', '<C-o>/')
--imap('<C-r>', '<C-o>?')
--nmap('<C-f>', '/') 
--nmap('<C-r>', '?') 
--cmap('<C-f>', '<C-g>')
--cmap('<C-r>', '<C-t>')

vim.api.nvim_exec("autocmd BufEnter * inoremap <buffer><nowait> <C-f> <C-o>/\\c", false) 
vim.api.nvim_exec("autocmd BufEnter * inoremap <buffer><nowait> <C-r> <C-o>?\\c", false) 
vim.api.nvim_exec("autocmd BufEnter * nnoremap <buffer><nowait> <C-f> /\\c", false) 
vim.api.nvim_exec("autocmd BufEnter * nnoremap <buffer><nowait> <C-r> ?\\c", false) 
vim.api.nvim_exec("autocmd BufEnter * cnoremap <buffer><nowait> <C-f> <C-g>", false) 
vim.api.nvim_exec("autocmd BufEnter * cnoremap <buffer><nowait> <C-r> <C-t>", false) 


--navigation
nmap('w', 'h')   -- h left
nmap('r', 'l')   -- l right
nmap('s', 'b')   -- word back 
nmap('f', 'e')   -- word forward to end
nmap('e', 'k')   -- k up
nmap('d', 'j')   -- j down

nmap('<Enter>', 'i<Enter><C-o>:stopinsert<CR>')
--nmap('O', 'O<ESC>0"_D');

--nmap('a', 'g^')  --line start
vim.api.nvim_exec("autocmd BufEnter * nnoremap <buffer><nowait> a g^", false) -- line start
vim.api.nvim_exec("autocmd BufEnter * nnoremap <buffer><nowait> g g$", false) -- line end
-- this doesn't work for some reason...
--nmap('<buffer><nowait> g', 'g$') -- end




nmap('<Space>', 'v')
vim.api.nvim_exec("nnoremap o i<Space><C-o>:stopinsert<CR>", false) 

------------------------
-- visual mode stuff
------------------------

-- navigation
vmap('w', 'h') -- h left
vmap('r', 'l') -- l right
vmap('s', 'b') -- word back 
vmap('f', 'e') -- word forward to end
vmap('e', 'k') -- k up
vmap('d', 'j') -- j down

vmap('<BS>', '\"_d')

vim.api.nvim_exec("autocmd BufEnter * vnoremap <buffer><nowait> a g^", false) -- line start
vim.api.nvim_exec("autocmd BufEnter * vnoremap <buffer><nowait> g g$", false) -- line end






vmap('<Space>',   '<ESC>')
vmap('<C-Space>', 'o')


vmap('x', 'd') --cut
vmap('c', 'y`]') --copy (yank) and move cursor to where it was
vim.api.nvim_exec("nnoremap <nowait> v Pl", false) -- move left, paste then move right


--expand selection to brace pair
nmap('\'',   'vaB')
vmap('\'',   'aB')

--expand selection to parenthesis pair
vim.api.nvim_exec("nnoremap <nowait> 9 vib", false) 
vim.api.nvim_exec("vnoremap <nowait> 9 ib", false) 

vim.api.nvim_exec("nnoremap <nowait> <C-9> vab", false) 
vim.api.nvim_exec("vnoremap <nowait> <C-9> ab", false) 



vim.call('plug#begin', '~/AppData/Local/nvim/plugged')
-- what about Plug?...
local Plug = vim.fn['plug#']
Plug 'tombh/novim-mode'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'vim-airline/vim-airline'
Plug 'karb94/neoscroll.nvim'
Plug 'sainnhe/everforest'
vim.call('plug#end')

vim.cmd "colorscheme everforest"



local actions = require "telescope.actions"
local fb_actions = require "telescope._extensions.file_browser.actions"

require("telescope").setup {
	defaults = {
		default_text = "foo",
		mappings = {
			i = {
			-- map actions.which_key to <C-h> (default: <C-/>)
			-- actions.which_key shows the mappings for your picker,
			-- e.g. git_{create, delete, ...}_branch for the git_branches picker
			["<Esc>"] = actions.close,
			["<C-e>"] = actions.move_selection_previous,
			["<C-d>"] = actions.move_selection_next,
			["<A-e>"] = actions.move_to_top,
            ["<A-d>"] = actions.move_to_bottom,
			["<C-h>"] = "which_key",
			["<C-BS>"] = false,
			} 
		}
	},
  extensions = {
    file_browser = {
      --theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      mappings = {
        ["i"] = {
			 ["<C-k>"] = fb_actions.create, --create file/folder
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
}
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension "file_browser" 



-- file broswer stuff
--vim.keymap.set("i", "<A-o>", "<C-o>:Telescope find_files<CR>",   {noremap = true}) --doesn't work for some reason
vim.keymap.set("i", "<C-o>", "<ESC>:Telescope file_browser<CR>", { noremap = true })
vim.keymap.set("i", "<C-b>", "<ESC>:Telescope buffers<CR>", { noremap = true })
vim.keymap.set("n", "<C-o>", ":Telescope file_browser<CR>", { noremap = true })
vim.keymap.set("n", "<C-b>", ":Telescope buffers<CR>", { noremap = true })










