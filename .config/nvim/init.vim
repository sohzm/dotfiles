set nu rnu
set noshowmode
set showmatch
set splitbelow splitright
let mapleader = " "
set mouse=a
nnoremap <esc><esc> :silent! nohls<cr>
set clipboard+=unnamedplus
set formatoptions-=cro
let g:rainbow_active = 1
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set undofile
set undodir=~/.nvim/undodir

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    Plug 'voldikss/vim-floaterm'
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
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'L3MON4D3/LuaSnip'

    Plug 'preservim/nerdtree'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'ryanoasis/vim-devicons'

    Plug 'rafamadriz/friendly-snippets'
    Plug 'puremourning/vimspector'
    Plug 'TamaMcGlinn/quickfixdd'

    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'
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
"let g:tokyonight_style = 'night' " available: night, storm
"let g:tokyonight_enable_italic = 1
"let g:tokyonight_transparent_background = 1
let g:tokyonight_transparent = 1
colorscheme tokyonight

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
let g:floaterm_keymap_toggle = '<Leader>t'

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

map <Leader>hh <C-w>t<C-w>H
map <Leader>kk <C-w>t<C-w>K

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
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')
require'lspconfig'.ccls.setup {
    capabilities = capabilities
}
require'lspconfig'.gopls.setup{
    capabilities = capabilities
}
require'lspconfig'.rls.setup {
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
        { name = 'luasnip' },
    },
}
require("luasnip.loaders.from_vscode").lazy_load()
EOF

nnoremap <leader>s :NERDTreeFocus<CR>
nnoremap <C-n>     :NERDTree<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>a :NERDTreeFind<CR>

autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

augroup nerdtreehidetirslashes
    autocmd!
    autocmd FileType nerdtree syntax match NERDTreeDirSlash #/$# containedin=NERDTreeDir conceal contained
augroup end

let NERDTreeMapActivateNode = 'l'
let NERDTreeMapCloseDir = 'h'
let NERDTreeMapOpenRecursively = 'o'
let NERDTreeMinimalUI=1


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
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gk    <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <silent> ge    <cmd>lua vim.diagnostic.setqflist()<CR>
nnoremap <silent> gf    <cmd>lua vim.lsp.buf.formatting()<CR>


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
EOF

:set colorcolumn=79
"let g:indentLine_enabled = 1
"let g:indentLine_char = '│'

nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>de :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>

nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>

nmap <Leader>dk <Plug>VimspectorRestart
nmap <Leader>dh <Plug>VimspectorStepOut
nmap <Leader>dl <Plug>VimspectorStepInto
nmap <Leader>dj <Plug>VimspectorStepOver

let g:lightline = {
\           'active': {
\               'left': [ [ 'mode', 'paste' ], [ 'readonly', 'absolutepath', 'modified' ] ],
\           }
\       }


let NERDTreeDirArrowExpandable = ""
let NERDTreeDirArrowCollapsible = ""
let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1


let g:signify_sign_add      = '+'
let g:signify_sign_delete      = '_'
let g:signify_sign_delete_first_line      = '='
let g:signify_sign_change      = '~'

let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1
