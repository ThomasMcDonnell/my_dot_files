set nocompatible              " be iMproved, required
filetype off                  " required <<========== We can turn it on later

" ----------------------------------------------------------------------------
" ----------------------------------------------------------------------------
" The eclim headless server script.
" You can now start the eclimd server by executing the script:
" /Users/thomas/eclipse/java-2018-09/Eclipse.app/Contents/Eclipse/eclimd
"  ---------------------------------------------------------------------------
"  ---------------------------------------------------------------------------

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'mattn/emmet-vim'                                        " plugin for HTML & CSS
Plugin 'scrooloose/nerdtree'                                    " plugin for file search
Plugin 'tpope/vim-vinegar'                                      " plugin for file search
Plugin 'neomake/neomake'
Plugin 'vim-scripts/indentpython.vim'                           " plugin for python style indentation
Plugin 'chriskempson/base16-vim'                                " plugin for colors
Plugin 'artur-shaik/vim-javacomplete2'                          " java autocomplete
Plugin 'davidhalter/jedi-vim'                                   " auto-complete
Plugin 'gregsexton/MatchTag'                                    " Vim's MatchParen for HTML tags http://www.vim.org/scripts/script.php?script_id=3818
Plugin 'vim-syntastic/syntastic'                                " syntax checking
Plugin 'nvie/vim-flake8'
Plugin 'AndrewRadev/splitjoin.vim'                              " A vim plugin that simplifies the transition between multiline and single-line code
Plugin 'farmergreg/vim-lastplace'                               " Intelligently reopen files at your last edit position in Vim.
Plugin 'tpope/vim-fugitive'                                     " a Git wrapper so awesome, it should be illegal http://www.vim.org/scripts/script.php?script_id=2975
Plugin 'Glench/Vim-Jinja2-Syntax'                               " An 'up-to-date' jinja2 syntax file.
Plugin 'tpope/vim-speeddating'                                  " use CTRL-A/CTRL-X to increment dates, times, and more http://www.vim.org/scripts/script.php?script_id=2120
Plugin 'Townk/vim-autoclose'                                    " Auto close brackets
Plugin 'tpope/vim-surround'                                     " Surround text with a character or brackets
Plugin 'vim-utils/vim-space'                                    " Select in and around whitespace
Plugin 'godlygeek/tabular'                                      " Align text; like these comments
Plugin 'jnurmine/Zenburn'                                       " color schemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'JamshedVesuna/vim-markdown-preview'                     " plugin for previewing markdown


call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" Put the rest of your .vimrc file here

" MarkDown Preview 
let vim_markdown_preview_github=1

" Set UFT8
set encoding=utf-8

" enable syntax highlighting
syntax enable

" show line numbers
set number

" set tabs to have 4 spaces
set ts=4

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" set new file creation
set autochdir

" enable all Python syntax highlighting features
let python_highlight_all = 1

" PEP8 if fil extension is .py
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" if file extension is .js|.html|.css
au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=4 |
    \ set shiftwidth=2 |

" if file extension is .c
au BufNewFile,BufRead *.c
    \ set cin "Use C-style indentation
    \ set ai  "Autoindent
    \ set sw=4 sts=4 ts=4 expandtab  "4-character indents with no hard tabs
    \ set backspace=2   "Allow backspacing over beginning of insert barrier
    \ set ru            "Display row/column in status bar
    \ syntax on         "Syntax highlighting on
    \ set wildignore=*.o,tags,*~   "Don't show object files, etc when tab-completing 

" if file extension is .java
au BufNewFile,BufRead *.java
    "Take care of indents for Java.
    \ set autoindent
    \ set si
    \ set shiftwidth=4
    \ syntax on
    "Java anonymous classes. Sometimes, you have to use them.
    \ set cinoptions+=j1
    \ let java_comment_strings=1
    \ let java_highlight_java_lang_ids=1
    \ let java_mark_braces_in_parens_as_errors=1
    \ let java_highlight_all=1
    \ let java_highlight_debug=1
    \ let java_ignore_javadoc=1
    \ let java_highlight_java_lang_ids=1
    \ let java_highlight_functions="style"
    \ let java_minlines = 150

" Always show statusline
set laststatus=2

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='minimalist'
let g:airline_powerline_fonts = 1

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" vim background 
let &colorcolumn=join(range(300,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn="80,".join(range(120,999),",")

if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme maui
endif
