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
  silent !curl -flo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/autoload/plugged')
    plug 'neoclide/coc.nvim', {'branch': 'release'}
    plug 'voldikss/vim-floaterm'
    plug 'mcchrish/nnn.vim'
    plug 'nvim-lua/popup.nvim'
    plug 'nvim-lua/plenary.nvim'
    plug 'nvim-telescope/telescope.nvim'
    plug 'sheerun/vim-polyglot'
    plug 'jiangmiao/auto-pairs'
    plug 'itchyny/lightline.vim'
    plug 'junegunn/goyo.vim'
    plug 'folke/tokyonight.nvim'
    plug 'mhinz/vim-startify'
    plug 'yuttie/comfortable-motion.vim'
call plug#end()

syntax on
autocmd bufenter *asm setfiletype nasm
autocmd bufread,bufnewfile *.tex set filetype=tex

let g:startify_custom_header = [
        \ '                              ,,                             ',
        \ '     `7mn.   `7mf''            db                            ',
        \ '       mmn.    m                                             ',
        \ '       m ymb   m `7m''   `mf''`7mm  `7mmpmmmb.pmmmb.  mmmmmm/',
        \ '       m  `mn. m   va   ,v    mm    mm    mm    mm .m        ',
        \ '       m   `mm.m    va ,v     mm    mm    mm    mm |bmmag.   ',
        \ '       m     ymm     vvv      mm    mm    mm    mm      `mb  ',
        \ '     .jml.    ym      w     .jmml..jmml  jmml  jmml.     jm  ', 
        \ '                                                  (o)   ,m9  ',
        \ '                                                    6mmm9    ',
        \ '                                                             ',
        \ ]

let g:lightline = {'colorscheme': 'materia'}

set termguicolors
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
let g:tokyonight_transparent = 1
colorscheme tokyonight

nnoremap <leader>ff <cmd>telescope find_files<cr>
nnoremap <leader>fg <cmd>telescope live_grep<cr>
nnoremap <leader>fb <cmd>telescope buffers<cr>
nnoremap <leader>fh <cmd>telescope help_tags<cr>

nnoremap y y$

nnoremap n nzzzv
nnoremap n nzzzv
nnoremap j mzj`z

nnoremap zz zz

inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

set encoding=utf-8
set hidden
set nobackup
set nowritebackup

" give more space for displaying messages.
" set cmdheight=2

" having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" don't pass messages to |ins-completion-menu|.
set shortmess+=c

" always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" use tab for trigger completion with characters ahead and navigate.
" note: use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <tab>
      \ pumvisible() ? "\<c-n>" :
      \ <sid>check_back_space() ? "\<tab>" :
      \ coc#refresh()
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<c-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" make <cr> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<c-g>u\<cr>\<c-r>=coc#on_enter()\<cr>"

" use `[g` and `]g` to navigate diagnostics
" use `:cocdiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <plug>(coc-diagnostic-prev)
nmap <silent> ]g <plug>(coc-diagnostic-next)

" goto code navigation.
nmap <silent> gd <plug>(coc-definition)
nmap <silent> gy <plug>(coc-type-definition)
nmap <silent> gi <plug>(coc-implementation)
nmap <silent> gr <plug>(coc-references)

" use k to show documentation in preview window.
nnoremap <silent> k :call <sid>show_documentation()<cr>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call cocactionasync('dohover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" highlight the symbol and its references when holding the cursor.
autocmd cursorhold * silent call cocactionasync('highlight')

" symbol renaming.
nmap <leader>rn <plug>(coc-rename)

" formatting selected code.
xmap <leader>f  <plug>(coc-format-selected)
nmap <leader>f  <plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " setup formatexpr specified filetype(s).
  autocmd filetype typescript,json setl formatexpr=cocaction('formatselected')
  " update signature help on jump placeholder.
  autocmd user cocjumpplaceholder call cocactionasync('showsignaturehelp')
augroup end

" applying codeaction to the selected region.
" example: `<leader>aap` for current paragraph
xmap <leader>a  <plug>(coc-codeaction-selected)
nmap <leader>a  <plug>(coc-codeaction-selected)

" remap keys for applying codeaction to the current buffer.
nmap <leader>ac  <plug>(coc-codeaction)
" apply autofix to problem on the current line.
nmap <leader>qf  <plug>(coc-fix-current)

" map function and class text objects
" note: requires 'textdocument.documentsymbol' support from the language server.
xmap if <plug>(coc-funcobj-i)
omap if <plug>(coc-funcobj-i)
xmap af <plug>(coc-funcobj-a)
omap af <plug>(coc-funcobj-a)
xmap ic <plug>(coc-classobj-i)
omap ic <plug>(coc-classobj-i)
xmap ac <plug>(coc-classobj-a)
omap ac <plug>(coc-classobj-a)

" remap <c-f> and <c-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <c-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<c-f>"
  nnoremap <silent><nowait><expr> <c-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<c-b>"
  inoremap <silent><nowait><expr> <c-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<right>"
  inoremap <silent><nowait><expr> <c-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<left>"
  vnoremap <silent><nowait><expr> <c-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<c-f>"
  vnoremap <silent><nowait><expr> <c-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<c-b>"
endif

" use ctrl-s for selections ranges.
" requires 'textdocument/selectionrange' support of language server.
nmap <silent> <c-s> <plug>(coc-range-select)
xmap <silent> <c-s> <plug>(coc-range-select)

" add `:format` command to format current buffer.
command! -nargs=0 format :call cocaction('format')

" add `:fold` command to fold current buffer.
command! -nargs=? fold :call     cocaction('fold', <f-args>)

" add `:or` command for organize imports of the current buffer.
command! -nargs=0 or   :call     cocaction('runcommand', 'editor.action.organizeimport')

" add (neo)vim's native statusline support.
" note: please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" mappings for coclist
" show all diagnostics.
nnoremap <silent><nowait> <space>a  :<c-u>coclist diagnostics<cr>
" manage extensions.
nnoremap <silent><nowait> <space>e  :<c-u>coclist extensions<cr>
" show commands.
nnoremap <silent><nowait> <space>c  :<c-u>coclist commands<cr>
" find symbol of current document.
nnoremap <silent><nowait> <space>o  :<c-u>coclist outline<cr>
" search workspace symbols.
nnoremap <silent><nowait> <space>s  :<c-u>coclist -i symbols<cr>
" do default action for next item.
nnoremap <silent><nowait> <space>j  :<c-u>cocnext<cr>
" do default action for previous item.
nnoremap <silent><nowait> <space>k  :<c-u>cocprev<cr>
" resume latest coc list.
nnoremap <silent><nowait> <space>p  :<c-u>coclistresume<cr>

let g:floaterm_keymap_new = '<leader>ft'
let g:floaterm_keymap_toggle = '<leader>t'

let g:floaterm_width = 1.0
let g:floaterm_height = 0.9
let g:floaterm_position = 'bottom'
hi floatermborder guibg=none guifg=#a9b1d6

nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

nnoremap <silent> <c-left> :vertical resize +3<cr>
nnoremap <silent> <c-right> :vertical resize -3<cr>
nnoremap <silent> <c-up> :resize +3<cr>
nnoremap <silent> <c-down> :resize -3<cr>

map <leader>hh <c-w>t<c-w>h
map <leader>kk <c-w>t<c-w>k

let g:nnn#session = 'local'
let g:nnn#command = 'nnn -d'
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.7, 'highlight': 'comment' } }
let g:nnn#set_default_mappings = 0
nnoremap <silent> <leader>n :nnnpicker<cr>
nnoremap <leader>o :nnnpicker %:p:h<cr>
