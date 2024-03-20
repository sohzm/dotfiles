set nu rnu
set noshowmode

set showmatch
set synmaxcol=512
set splitbelow splitright
let mapleader = " "
set mouse=a
nnoremap <esc><esc> :silent! nohls<cr>
set clipboard+=unnamedplus
set formatoptions-=cro
let g:rainbow_active = 1
filetype plugin indent on
set undofile
set undodir=~/.nvim/undodir

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/autoload/plugged')
    Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production', 'branch': 'release/0.x' }
    Plug 'ellisonleao/glow.nvim'
    Plug 'mtdl9/vim-log-highlighting'
    Plug 'rodjek/vim-puppet'
    Plug 'othree/html5.vim'
    Plug 'pangloss/vim-javascript'
    Plug 'folke/which-key.nvim'
    Plug 'evanleck/vim-svelte', {'branch': 'main'}
    
    Plug 'shiracamus/vim-syntax-x86-objdump-d'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'voldikss/vim-floaterm'
    Plug 'easymotion/vim-easymotion'
    Plug 'mcchrish/nnn.vim'
    Plug 'mg979/vim-visual-multi'
    Plug 'morhetz/gruvbox'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    Plug 'sheerun/vim-polyglot'
    Plug 'jiangmiao/auto-pairs'

    Plug 'itchyny/lightline.vim'
    Plug 'junegunn/goyo.vim'
    "Plug 'ghifarit53/tokyonight-vim'
    Plug 'folke/tokyonight.nvim'
    Plug 'mhinz/vim-startify', {'branch': 'center'}
    Plug 'yuttie/comfortable-motion.vim'

    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'

    Plug 'hrsh7th/cmp-buffer'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'L3MON4D3/LuaSnip'

    Plug 'kyazdani42/nvim-web-devicons' "optional, for file icons
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'ryanoasis/vim-devicons'

    Plug 'rafamadriz/friendly-snippets'
    Plug 'puremourning/vimspector'
    Plug 'TamaMcGlinn/quickfixdd'

    "Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'

    Plug 'godlygeek/tabular'
    Plug 'github/copilot.vim'

call plug#end()

syntax on
autocmd BufEnter *asm setfiletype nasm
autocmd BufEnter *ss setfiletype css
autocmd BufRead,BufNewFile *.tex set filetype=tex

let g:startify_padding_left = 65
let g:startify_custom_header = [
        \ '                                                                                          ,,                             ',
        \ '                                                                 `7MN.   `7MF''            db                            ',
        \ '                                                                   MMN.    M                                             ',
        \ '                                                                   M YMb   M `7M''   `MF''`7MM  `7MMpMMMb.pMMMb.  MMMMMM/',
        \ '                                                                   M  `MN. M   VA   ,V    MM    MM    MM    MM .M        ',
        \ '                                                                   M   `MM.M    VA ,V     MM    MM    MM    MM |bMMAg.   ',
        \ '                                                                   M     YMM     VVV      MM    MM    MM    MM      `Mb  ',
        \ '                                                                 .JML.    YM      W     .JMML..JMML  JMML  JMML.     jM  ', 
        \ '                                                                                                              (O)   ,M9  ',
        \ '                                                                                                                6mmm9    ',
        \ '                                                                                                                         ',
        \ ]


let g:lightline = {'colorscheme': 'materia'}

set termguicolors
" let g:tokyonight_style = 'night' " available: night, storm
" let g:tokyonight_enable_italic = 0
" let g:tokyonight_transparent_background = 1
" let g:tokyonight_transparent = 1

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap Y yg_

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

nnoremap yf ggVGy<c-o>

inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

set encoding=utf-8
set hidden
set nobackup
set nowritebackup

set updatetime=300

set shortmess+=c

if has("nvim-0.5.0") || has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

let g:floaterm_keymap_new = '<Leader>ft'
let g:floaterm_keymap_toggle = '<Leader>r'

let g:floaterm_width = 1.0
let g:floaterm_height = 1.0
let g:floaterm_position = 'bottom'
hi FloatermBorder guibg=none guifg=#a9b1d6

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <silent> <C-Left> :vertical resize +3<CR>
nnoremap <silent> <C-Right> :vertical resize -3<CR>
nnoremap <silent> <C-Up> :resize +3<CR>
nnoremap <silent> <C-Down> :resize -3<CR>

"map <Leader>hh <C-w>t<C-w>H
"map <Leader>kk <C-w>t<C-w>K

let g:nnn#session = 'local'
let g:nnn#command = 'nnn -o'
let g:nnn#layout = { 'window': { 'width': 0.7, 'height': 0.7, 'highlight': 'Comment' } }
let g:nnn#set_default_mappings = 0
nnoremap <silent> <leader>j :NnnPicker<CR>
nnoremap <leader>o :NnnPicker %:p:h<CR>

nnoremap d "_d
vnoremap d "_d

command! W write
command! Q quit
command! X xit

set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

lua << EOF
-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local lspconfig = require('lspconfig')
require'lspconfig'.ccls.setup {
    capabilities = capabilities
}
require'lspconfig'.gopls.setup{
    capabilities = capabilities
}
require'lspconfig'.rust_analyzer.setup {
    capabilities = capabilities
}
require'lspconfig'.vls.setup{
    cmd = {"v", "ls" },
    filetypes = {"vlang", "v"},
    capabilities = capabilities
}
require'lspconfig'.csharp_ls.setup{
    capabilities = capabilities
}
require'lspconfig'.tsserver.setup {
    capabilities = capabilities
}
require'lspconfig'.svelte.setup {
    capabilities = capabilities
}
require'lspconfig'.zls.setup {
    capabilities = capabilities
}
require'lspconfig'.hls.setup {
    capabilities = capabilities
}
require'lspconfig'.pyright.setup {
    capabilities = capabilities
}
--require'lspconfig'.tsserver.setup {
--    capabilities = capabilities
--}
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end,
        ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end,
    },
    sources = {
        { name = 'nvim_lsp' },

        { name = "buffer" },
        { name = 'luasnip' },
    },
}
require("luasnip.loaders.from_vscode").lazy_load()
EOF


imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)

let g:vsnip_filetypes = {}
let g:vsnip_filetypes.javascriptreact = ['javascript']
let g:vsnip_filetypes.typescriptreact = ['typescript']

nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gh     <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gk    <cmd>lua vim.diagnostic.open_float(0, { scope = "line", border = "single" })<CR>
nnoremap <silent> ge    <cmd>lua vim.diagnostic.setqflist()<CR>
nnoremap <silent> gf    <cmd>lua vim.lsp.buf.format()<CR>


nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
nnoremap <silent> gh :Lspsaga lsp_finder<CR>
nnoremap <leader>lr <cmd>lua vim.lsp.buf.rename()<CR>
set formatoptions-=t 

highlight ScrollView ctermbg=159 guibg=#4444aa


autocmd TermOpen * setlocal nonumber norelativenumber
set cul

augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
augroup END

lua << EOF
local function prequire(...)
    local status, lib = pcall(require, ...)
    if (status) then return lib end
    return nil
end

local luasnip = prequire('luasnip')
local cmp = prequire("cmp")

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

_G.tab_complete = function()
    if cmp and cmp.visible() then
        cmp.select_next_item()
    elseif luasnip and luasnip.expand_or_jumpable() then
        return t("<Plug>luasnip-expand-or-jump")
    elseif check_back_space() then
        return t "<Tab>"
    else
        cmp.complete()
    end
    return ""
end
_G.s_tab_complete = function()
    if cmp and cmp.visible() then
        cmp.select_prev_item()
    elseif luasnip and luasnip.jumpable(-1) then
        return t("<Plug>luasnip-jump-prev")
    else
        return t "<S-Tab>"
    end
    return ""
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<C-E>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-E>", "<Plug>luasnip-next-choice", {})

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

local function my_on_attach(bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    vim.keymap.set('n', 'l', api.node.open.edit,                    opts('Open'))
    vim.keymap.set('n', 'h', api.node.navigate.parent_close,        opts('Close Directory'))
    vim.keymap.set('n', 't', api.node.open.tab,                     opts('Open: New Tab'))
    vim.keymap.set('n', 's', api.node.open.vertical,                opts('Open: Vertical Split'))
    vim.keymap.set('n', 'i', api.node.open.horizontal,              opts('Open: Horizontal Split'))
    vim.keymap.set('n', 'r', api.fs.rename,                         opts('Rename'))
    vim.keymap.set('n', 'a', api.fs.create,                         opts('Create'))
    vim.keymap.set('n', 'd', api.fs.remove,                         opts('Delete'))
    vim.keymap.set('n', 'u', api.tree.change_root_to_parent,        opts('Up'))
end

require("nvim-tree").setup({
  on_attach = my_on_attach,
  sort_by = "case_sensitive",
  view = {
      width = '20%',
      adaptive_size = false,
  },
  renderer = {
      add_trailing = false,
      group_empty = false,
      highlight_git = false,
      full_name = false,
      highlight_opened_files = "none",
      root_folder_modifier = ":~",
      indent_width = 2,
      indent_markers = {
          enable = true,
          inline_arrows = true,
          icons = {
              corner = "└",
              edge = "│",
              item = "│",
              bottom = "─",
              none = " ",
          },
      },
      icons = {
          show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = false,
          },
      },
      },

  filters = {
      dotfiles = true,
  },
})


require("tokyonight").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  light_style = "day", -- The theme is used when the background is set to light
  transparent = true, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = false },
    keywords = { italic = false },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
  sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = false, -- dims inactive windows
  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  ---@param colors ColorScheme
  on_colors = function(colors) end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  ---@param highlights Highlights
  ---@param colors ColorScheme
  on_highlights = function(highlights, colors) end,
})



EOF

:set colorcolumn=79
"let g:indentLine_enabled = 1
"let g:indentLine_char = '│'

let g:vimspector_enable_mappings = 'HUMAN'
nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>

nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>

nmap <Leader>dk <Plug>VimspectorRestart
nmap <Leader>dh <Plug>VimspectorStepOut
nmap <Leader>dl <Plug>VimspectorStepInto
nmap <Leader>dj <Plug>VimspectorStepOver

nmap <Leader>dx <Plug>VimspectorReset
nmap <Leader>de <Plug>VimspectorEval
nmap <Leader>dw <Plug>VimspectorWatch
nmap <Leader>do <Plug>VimspectorShowOutput

let g:lightline = {
\           'active': {
\               'left': [ [ 'mode', 'paste' ], [ 'readonly', 'absolutepath', 'modified' ] ],
\           }
\       }

let g:neovide_cursor_vfx_mode = "railgun"
let g:floaterm_borderchars = "        "
set guifont=Iosevka\ Term:h10
set ts=4 sw=4

vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
nnoremap <leader>s :NvimTreeFocus<CR>
nnoremap <leader>n :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>

" <Leader>f{char} to move to {char}
map  <Leader>h <Plug>(easymotion-bd-f)
nmap <Leader>h <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

let g:EasyMotion_keys='asdghklqwertyuiopzxcvbnmfj'
"let g:EasyMotion_keys='abcdefghijklmnopqrstuvwxyz'
"



let g:svelte_indent_script = 4
let g:svelte_indent_style = 4
set cursorcolumn
set cursorline


if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif


lua << EOF
  require("which-key").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }


require('glow').setup({
  style = "dark",
})

EOF

set tabstop=4 softtabstop=4 shiftwidth=4

set guifont=Iosevka\ NFM\ Light:h8
let g:neovide_remember_window_size = v:false

imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

colorscheme tokyonight-night

set tabstop=4
set shiftwidth=4
set expandtab
