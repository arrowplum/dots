" vim: fdm=marker

" GENERAL SETTINGS                                                             {{{
" --------------------------------------------------------------------------------

set nocompatible                " Disable Vi compatibility

if filereadable($HOME."/.vim/bundle/pathogen/autoload/pathogen.vim")
	runtime bundle/pathogen/autoload/pathogen.vim
	call pathogen#infect()      " Manage plugins with pathogen.vim
endif

syntax on                       " Enable syntax highlighting
filetype plugin indent on       " Enable file type detection

set encoding=utf-8              " Use UTF-8 as default file encoding
set cursorline                  " Highlight current line
set laststatus=2                " Always show status line
set fillchars=vert:\            " Use space for vertical split fill char
set pastetoggle=<F2>            " Toggle paste mode (disables auto-indent etc.)
set modeline modelines=20       " Look for modeline in first 20 lines
set autoread                    " Reload unchanged buffer when file changes
set history=500                 " Keep 500 lines of history
set hidden                      " Allow unedited buffers to be hidden

"" Command line
set wildmenu                    " Command line completion
set cmdheight=2                 " Reserve two lines for command area

"" Whitespace
set backspace=indent,eol,start  " Allow backspacing over everything in insert mode
set tabstop=4                   " Tabs count for 4 spaces
set shiftwidth=4                " Each indent step is 4 spaces

"" Swaps and backups
" Don't store swaps in . -- store in ~/.vim/tmp/%path%to%orig.swp
set directory=~/.vim/tmp//,.,/var/tmp
" Don't store backups in . -- store in ~/.vim/tmp/%path%to%orig~
set backupdir=~/.vim/tmp//,.,/var/tmp

"" Searching
set hlsearch                    " Highlight search matches
set incsearch                   " Do incremental searching
set ignorecase                  " Searches are case-insensitive...
set smartcase                   " ...unless they contain at least one capital letter
set listchars=tab:▸\ ,eol:¬,trail:·

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
	set mouse=a
endif

" Set color scheme for 16-color+ terminals
if &t_Co >= 16 || has("gui_running")
	colorscheme noctu
endif

" }}}
" FUNCTIONS & COMMANDS                                                         {{{
" --------------------------------------------------------------------------------

" Set the appearance of the status line for various modes and states
function! <SID>SetStatusLine(mode)
	if &ft == "nerdtree"	" NERDTree sets its own minimal statusline
		return
	endif

	if a:mode == "normal"
		let histyle = "%3*"
	elseif a:mode == "insert"
		let histyle = "%2*"
	else
		let histyle = ""	" inactive
	endif

	" Get Git info from vim-fugitive for current buffer (if available)
	let mygit = exists("*fugitive#statusline") ? fugitive#statusline()[4:-2] : ""
	
	" Left side
	let mystl = histyle
	let mystl .= " %6.(#%n%)  %* %t%#StatusLineNC# ".mygit."%m%="

	" Right side
	let mystl .= "%{(&fenc==''?&enc:&fenc)}%* %{strlen(&ft)?&ft:'n/a'} "
	let mystl .= histyle
	let mystl .= " %3.l:%-3.c "

	let &l:statusline = mystl
endfunc

" Show highlight group of character under cursor
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		\ | wincmd p | diffthis
endif

" }}}
" AUTOCOMMANDS                                                                 {{{
" --------------------------------------------------------------------------------

if has("autocmd")
	augroup FileTypes
		autocmd!

		" For all text files set 'textwidth' to 78 characters.
		autocmd FileType text setlocal textwidth=78

		" Always use spelling for particular file types
		autocmd FileType gitcommit setlocal spell

		" Use 2-space indents for Ruby
		autocmd FileType ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

		" Use :make to check PHP syntax
		autocmd FileType php setlocal makeprg=php\ -l\ %
			\ errorformat=%m\ in\ %f\ on\ line\ %l
	augroup END

	augroup CursorLine
		autocmd!

		" Only highlight cursor line in active buffer window
		autocmd WinLeave * set nocursorline
		autocmd WinEnter * set cursorline
	augroup END

	augroup StatusLineHighlight
		autocmd!

		" Set statusline for various modes and states
		autocmd BufEnter,BufWinEnter,WinEnter,CmdwinEnter,CursorHold,BufWritePost,InsertLeave *
			\ call <SID>SetStatusLine("normal")
		autocmd BufLeave,BufWinLeave,WinLeave,CmdwinLeave *
			\ call <SID>SetStatusLine("inactive")
		autocmd InsertEnter,CursorHoldI *
			\ call <SID>SetStatusLine("insert")
	augroup END
endif

" }}}
" MAPPINGS                                                                     {{{
" --------------------------------------------------------------------------------

" Use arrow keys for buffer/tab navigation
noremap <Up> :bprev<CR>
noremap <Down> :bnext<CR>
noremap <Left> :tabprev<CR>
noremap <Right> :tabnext<CR>

" Turn off highlighting and clear any message already displayed
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Expand %% to directory of current file in command-line mode
cnoremap %% <C-R>=expand('%:h').'/'<CR>

" Convenient ways to open files relative to current buffer
nnoremap <Leader>ew :e %%
nnoremap <Leader>es :sp %%
nnoremap <Leader>ev :vsp %%
nnoremap <Leader>et :tabe %%

" Toggle light/dark background
nnoremap <Leader>a :let &background = ( &background == "dark" ? "light" : "dark" )<CR>

" Write buffer and source current file
nnoremap <silent> <Leader>w :w<CR>:so %<CR>

" Toggle NERDTree open/closed
nnoremap <Leader>r :NERDTreeToggle<CR>

" Show highlighting groups for current word
nnoremap <silent> <Leader>p :call <SID>SynStack()<CR>

" Toggle invisible characters (list)
nnoremap <Leader>l :set list!<CR>

" Toggle line numbers
nnoremap <Leader>n :set number!<CR>

" Toggle spelling
nnoremap <Leader>s :set spell!<CR>

" Quickly edit .vimrc
nnoremap <Leader>v :tabedit $MYVIMRC<CR>

" Quickly bring up Vim notes
nnoremap <Leader>V :tabedit ~/Documents/vim.md<CR>

" Shortcuts for Session plugin
nnoremap <Leader>so :OpenSession<CR>
nnoremap <Leader>sc :CloseSession<CR>
nnoremap <Leader>ss :SaveSession<CR>

" NOTE: Command-T plug-in sets the following mappings:
"    nnoremap <silent> <Leader>t :CommandT<CR>
"    nnoremap <silent> <Leader>b :CommandTBuffer<CR>

" }}}
" PLUGINS                                                                      {{{
" --------------------------------------------------------------------------------

" Settings for bundled PHP plugin
let php_noShortTags = 1         " Always use <?php
let php_folding = 1             " Enable folding of classes/functions
let php_htmlInStrings = 1       " Highlight HTML in PHP strings

" xptemplate key
let g:xptemplate_key = '<Tab>'

" Settings for Session plugin
let g:session_autosave = 'yes'

" }}}