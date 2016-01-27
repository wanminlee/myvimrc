"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"        Plugins Config
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Check OS
"--------------------------------------------------
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
else
    let g:iswindows = 0
endif
"--------------------------------------------------
" Custom Settings
let useYoucompleteme = 1

"--------------------------------------------------
" Vundle begin
"--------------------------------------------------
" not support VI
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'
" Custom plugins bellow

if useYoucompleteme == 0
    " ultimate auto completion system for Vim , need lua+
    " just add lua52.dll in VIM folder
    Plugin 'Shougo/neocomplete.vim'
endif
if useYoucompleteme == 1
    " YCM need compile but recommend
    Plugin 'Valloric/YouCompleteMe'
endif

Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'bling/vim-airline'
" visually display indent levels in Vim   colors
Plugin 'nathanaelkane/vim-indent-guides'

" displays tags in a window, ordered by class etc
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
" show tab c-a   d: delete buf
Plugin 'vim-ctrlspace/vim-ctrlspace'
" search files  c-p
Plugin 'ctrlpvim/ctrlp.vim'
" fast to get      \w  \f
Plugin 'easymotion/vim-easymotion'
" show whitespace   delete call :fixwhitespace
Plugin 'bronson/vim-trailing-whitespace'
" comment in a easy way  \cc \cu   like c.vim
Plugin 'scrooloose/nerdcommenter'
" tabular /|
Plugin 'godlygeek/tabular'
"Plugin 'plasticboy/vim-markdown'
Plugin 'MikeCoder/markdown-preview.vim'
" marks ma create a   'a goto a   m- delete
"Plugin 'kshenoy/vim-signature'

" deal with pairs of punctuations such as (), [], {}, and so on
Plugin 'kana/vim-smartinput'
" syntax check that runs files through external syntax checkers
Plugin 'scrooloose/syntastic'

" improved C++ syntax highlighting
Plugin 'vim-cpp-enhanced-highlight'

" html
Plugin 'mattn/emmet-vim'
" xml html complete
Plugin 'docunext/closetag.vim'
" html xml ...  cs  repeate
Plugin 'tpope/vim-surround'
" javascript complete
Plugin 'pangloss/vim-javascript'

" singlecompile using one key
Plugin 'xuhdev/SingleCompile'
" track the engine.
"Plugin 'SirVer/ultisnips'
" snippets are separated from the engine. Add this if you want them:
"Plugin 'honza/vim-snippets'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on
"--------------------------------------------------
" vundle end
"--------------------------------------------------
" => Neocomplete
"--------------------------------------------------
if useYoucompleteme == 0

    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplcache.
    let g:neocomplcache_enable_at_startup = 1
    " Use smartcase.
    let g:neocomplcache_enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplcache_min_syntax_length = 3
    let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

    " Enable heavy features.
    " Use camel case completion.
    "let g:neocomplcache_enable_camel_case_completion = 1
    " Use underbar completion.
    "let g:neocomplcache_enable_underbar_completion = 1

    " Define dictionary.
    let g:neocomplcache_dictionary_filetype_lists = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

    " Define keyword.
    if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplcache#undo_completion()
    inoremap <expr><C-l>     neocomplcache#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
      return neocomplcache#smart_close_popup() . "\<CR>"
      " For no inserting <CR> key.
      "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplcache#close_popup()
    inoremap <expr><C-e>  neocomplcache#cancel_popup()
    " Close popup by <Space>.
    "inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

    " For cursor moving in insert mode(Not recommended)
    "inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
    "inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
    "inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
    "inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
    " Or set this.
    "let g:neocomplcache_enable_cursor_hold_i = 1
    " Or set this.
    "let g:neocomplcache_enable_insert_char_pre = 1

    " AutoComplPop like behavior.
    "let g:neocomplcache_enable_auto_select = 1

    " Shell like behavior(not recommended).
    "set completeopt+=longest
    "let g:neocomplcache_enable_auto_select = 1
    "let g:neocomplcache_disable_auto_complete = 1
    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplcache_force_omni_patterns')
      let g:neocomplcache_force_omni_patterns = {}
    endif
    let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

    " For perlomni.vim setting.
    " https://github.com/c9s/perlomni.vim
    let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
endif
"--------------------------------------------------
" => YouCompleteMe options
"--------------------------------------------------
if useYoucompleteme == 1

    " youcompleteme defaul tab s-tab have conflict in autocomplete
    let g:ycm_key_list_select_completion = ['<Down>']
    let g:ycm_key_list_previous_completion = ['<Up>']
    let g:ycm_complete_in_comments = 1
    " reminder UltiSnips
    let g:ycm_use_ultisnips_completer = 1
    let g:ycm_collect_identifiers_from_comments_and_strings = 1
    let g:ycm_collect_identifiers_from_tags_files = 1
    " enable syntactic keywords complete
    let g:ycm_seed_identifiers_with_syntax=1
    "let g:ycm_enable_diagnostic_signs = 0
    "let g:ycm_enable_diagnostic_highlighting = 0
    " language keywords complete
    "let g:ycm_seed_identifiers_with_syntax=1

    let g:ycm_goto_buffer_command = 'horizontal-split'
    " nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
    nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
    nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>

    " load extra conf.py
    if !empty(glob("~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"))
        let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
    endif

    " let g:ycm_key_invoke_completion = '<C-Space>'
    let g:ycm_filetype_blacklist = {
        \ 'tagbar' : 1,
        \ 'gitcommit' : 1,
        \}
endif
"--------------------------------------------------
" => NerdTree options   Tagbar options
"--------------------------------------------------
" auto change the root directory
let NERDTreeChDirMode=2
let NERDTreeWinPos="right"
let g:NERDTreeWinSize = 24
let g:tagbar_width = 24
let g:tagbar_left = 1

function! ToggleTagBar()
    let w:jumpbacktohere = 1
    let tagbar_open = bufwinnr('__Tagbar__') != -1
    if tagbar_open
        TagbarClose
    else
        TagbarOpen
    endif
    for window in range(1, winnr('$'))
        execute window . 'wincmd w'
        if exists('w:jumpbacktohere')
            unlet w:jumpbacktohere
            break
        endif
    endfor
endfunction

function! ToggleNERDTree()
    let w:jumpbacktohere = 1
    " Detect which plugins are open
    if exists('t:NERDTreeBufName')
        let nerdtree_open = bufwinnr(t:NERDTreeBufName) != -1
    else
        let nerdtree_open = 0
    endif
    if nerdtree_open
        NERDTreeClose
    else
        NERDTree
    endif
    " Jump back to the original window
    for window in range(1, winnr('$'))
        execute window . 'wincmd w'
        if exists('w:jumpbacktohere')
            unlet w:jumpbacktohere
            break
        endif
    endfor
endfunction

nmap <F7> :call ToggleTagBar()<CR>
nmap <F8> :call ToggleNERDTree()<CR>
"--------------------------------------------------
" => Syntastic
"--------------------------------------------------
let g:syntastic_error_symbol='>>'
let g:syntastic_warning_symbol='>'
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_enable_highlighting=1

" error code: http://pep8.readthedocs.org/en/latest/intro.html#error-codes
let g:syntastic_python_checkers=['python','pyflakes', 'pep8']
let g:syntastic_python_pep8_args='--ignore=E501,E225,E124,E712'

" if js
" let g:syntastic_javascript_checkers = ['jsl', 'jshint']
" let g:syntastic_html_checkers=['tidy', 'jshint']

" to see error location list
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5

" disabled in java, to be faster
let g:syntastic_mode_map = {'mode': 'active', 'passive_filetypes': ['java'] }
"let g:syntastic_python_python_exec =
"--------------------------------------------------
" => Single compile
"--------------------------------------------------
"nmap <F5> :SCCompile<cr>
nmap <F6> :SCCompileRun<cr>
"let g:SingleCompile_usequickfix = 0
"--------------------------------------------------
" => UltiSnips
"--------------------------------------------------
" trigger configuration. Do not use <tab> if you use YouCompleteMe.
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" define custom folder under .vim/UltiSnips ,
"let g:UltiSnipsSnippetDirectories  = ['UltiSnips']
"let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
" edit snippets with the correct filetype
map <leader>us :UltiSnipsEdit<CR>

"" ctrl+j/k to chose
"func! g:JInYCM()
    "if pumvisible()
        "return "\<C-n>"
    "else
        "return "\<c-j>"
    "endif
"endfunction

"func! g:KInYCM()
    "if pumvisible()
        "return "\<C-p>"
    "else
        "return "\<c-k>"
    "endif
"endfunction
"inoremap <c-j> <c-r>=g:JInYCM()<cr>
"au BufEnter,BufRead * exec "inoremap <silent> " . g:UltiSnipsJumpBackwordTrigger . " <C-R>=g:KInYCM()<cr>"
"let g:UltiSnipsJumpBackwordTrigger = "<c-k>"

" if you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"--------------------------------------------------
" => Ctrlp
"--------------------------------------------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',}

if g:iswindows
    set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe
    let g:ctrlp_user_command = {
      \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files'],
        \ 2: ['.hg', 'hg --cwd %s locate -I .'],
        \ },
      \ 'fallback': 'dir %s /-n /b /s /a-d'
      \ }
else
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip
    let g:ctrlp_user_command = {
      \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files'],
        \ 2: ['.hg', 'hg --cwd %s locate -I .'],
        \ },
      \ 'fallback': 'find %s -type f'
      \ }
endif
"--------------------------------------------------
" => Ctrlspace
"--------------------------------------------------
if has("gui_running")
    " Settings for Inconsolata font
    let g:CtrlSpaceSymbols = { "CS": "#", "All": "All", "WLoad": "|*|", "WSave": "[*]","Zoom": "*",}
endif

let g:CtrlSpaceUseTabline = 0
let g:ctrlspace_default_mapping_key = "<C-a>"
" use ctrlp
"nnoremap <silent><C-p> :CtrlSpace O<CR>
map <C-a>  :CtrlSpace<CR>
"--------------------------------------------------
" =>  Easymotion
"--------------------------------------------------
let g:EasyMotion_leader_key = '<Leader>'
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
"--------------------------------------------------
" => Markdown
"--------------------------------------------------
let g:vim_markdown_folding_disabled = 1
"--------------------------------------------------
" => Html + Javascript
"--------------------------------------------------
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
let g:closetag_html_style = 1
"--------------------------------------------------
" => Indent Guides
"--------------------------------------------------
if has('gui_running')
    let g:indent_guides_auto_colors = 1
    set ts=4 sw=4 et
else
    let g:indent_guides_auto_colors = 0
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=dark   ctermbg=3
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=dark   ctermbg=3
endif

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size  = 1
"--------------------------------------------------
" => Colorscheme
"--------------------------------------------------
if has('gui_running')
    set background=dark
    colorscheme solarized
    let g:solarized_termcolors=256
    let g:solarized_italic =  0
else
    set background=dark
    colorscheme molokai
    let g:molokai_original=1
    let g:rehash256=1
endif
"--------------------------------------------------
" => Plugin end
"--------------------------------------------------
