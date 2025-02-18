call plug#begin('~/.vim/plugged')

" Commands:
"
" :PlugInstall [name ...] [#threads]    Install plugins
" :PlugUpdate [name ...] [#threads]     Install or update plugins
" :PlugClean[!]	                        Remove unlisted plugins (bang version will clean without prompt)
" :PlugUpgrade                          Upgrade vim-plug itself
" :PlugStatus                           Check the status of plugins
" :PlugDiff                             Examine changes from the previous update and the pending changes
" :PlugSnapshot[!] [output path]        Generate script for restoring the current snapshot of the plugins
"

" Comment stuff out
" https://github.com/tpope/vim-commentary
"
Plug 'tpope/vim-commentary'

" A simple, easy-to-use Vim alignment plugin 
" https://github.com/junegunn/vim-easy-align
"
Plug 'junegunn/vim-easy-align'

" Full path fuzzy file, buffer, mru, tag, ... finder for Vim. 
" https://github.com/ctrlpvim/ctrlp.vim
"
Plug 'ctrlpvim/ctrlp.vim'

" A tree explorer plugin for vim
" https://github.com/preservim/nerdtree
"
" Use this one as the original project is no longer maintained.
"
Plug 'preservim/nerdtree'

" A plugin of NERDTree showing git status 
" https://github.com/scrooloose/nerdtree-git-plugin
"
" Use this one as the original projec is no longer maintained.
"
Plug 'Xuyuanp/nerdtree-git-plugin'

" Extra syntax and highlight for nerdtree files 
" https://github.com/tiagofumo/vim-nerdtree-syntax-highlight
"
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" A Vim plugin which shows a git diff in the sign column 
" https://github.com/airblade/vim-gitgutter
"
Plug 'airblade/vim-gitgutter'

" Fugitive is the premier Vim plugin for Git
" https://github.com/tpope/vim-fugitive
"
Plug 'tpope/vim-fugitive'

" Lean & mean status/tabline for vim that's light as air 
" https://github.com/vim-airline/vim-airline
"
Plug 'vim-airline/vim-airline'

" The official theme repository for vim-airline
" https://github.com/vim-airline/vim-airline-themes
"
Plug 'vim-airline/vim-airline-themes'

" Vim plugin for intensely nerdy commenting powers 
" https://github.com/preservim/nerdcommenter
"
" Use this one as the original projet is no longer maintained.
"
Plug 'preservim/nerdcommenter'

" Light & Dark color schemes for terminal and GUI Vim awesome editor 
" https://github.com/NLKNguyen/papercolor-theme
" 
Plug 'NLKNguyen/papercolor-theme'

" Go development plugin for Vim https://github.com/fatih/vim-go
" https://github.com/fatih/vim-go
"
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Nodejs extension host for vim & neovim, load extensions like VSCode and host
" language servers
" https://github.com/neoclide/coc.nvim
"
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Or build from source code by using yarn: https://yarnpkg.com
"Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
call plug#end()


" Configuration section
"

" Set your leader key"
"
let mapleader=" "

" Configure panel switching
"
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>

" Configure split panel
"
nnoremap <leader>v <C-w>v
nnoremap <leader>s <C-w>s

" -----------------------------------------------------------------------------
" junegunn/vim-easy-align settings
" -----------------------------------------------------------------------------

" Start interactive EasyAlign in visual mode (e.g. vipga)
"
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
"
nmap ga <Plug>(EasyAlign)

" -----------------------------------------------------------------------------
" preservim/nerdtree settings
" -----------------------------------------------------------------------------

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Exit Vim if NERDTree is the only window left.
"
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
"
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

let g:NERDTreeIgnore = ['^node_modules$']
let NERDTreeShowHidden=1

" -----------------------------------------------------------------------------
" Xuyuanp/nerdtree-git-plugin settings
" -----------------------------------------------------------------------------

let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0

let g:NERDTreeGitStatusWithFlags = 1

" Configure theme
"
set t_Co=256 "required for urxvt
set background=dark "dark or light
colorscheme PaperColor
let g:airline_theme='papercolor'

" settings
"
filetype on "detect files based on type
filetype plugin on "when a file is edited its plugin file is loaded, if there is one
filetype indent on "maintain indention
set nu "enable line numbers

" -----------------------------------------------------------------------------
" coc.nvim default settings
"
" Mostly from https://github.com/neoclide/coc.nvim#example-vim-configuration
" -----------------------------------------------------------------------------

let g:coc_global_extensions = [
  \ 'coc-go',
  \ 'coc-pyright',
  \ 'coc-solargraph',
  \ 'coc-spell-checker',
  \ 'coc-json',
  \ 'coc-yaml',
  \ 'coc-angular',
  \ 'coc-html',
  \ 'coc-snippets',
  \ 'coc-prettier',
  \ ]

" Configure prettier as per https://github.com/neoclide/coc-prettier
"
" Command:
"
" :Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Remap keys for range format
"
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number colmn into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
"
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
"
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
"
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
"
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
"
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
"
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
"
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
"
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
"
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
"
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
"
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
"
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
"
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
"
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
"
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
"
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
"
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
"
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
"
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
"
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
"
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
"
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
"
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>u

" -----------------------------------------------------------------------------
" fatih/vim-go settings
" -----------------------------------------------------------------------------

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
"
let g:go_def_mapping_enabled = 0

" -----------------------------------------------------------------------------
" vim-airline/vim-airline settings
" -----------------------------------------------------------------------------
let g:airline_powerline_fonts = 1

" -----------------------------------------------------------------------------
" Configure `:Lint` in Vim to run golint on the current file and populate the 
" quickfix list 
" -----------------------------------------------------------------------------
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim

" show tabs
"
set list
set listchars=tab:>-
