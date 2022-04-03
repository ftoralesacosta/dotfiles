" NOTES
" check mapping with :verbose map ____

  " Move to word
map  <C-f> <Plug>(easymotion-bd-w)
nmap <C-f> <Plug>(easymotion-overwin-w)

" Terminal mappings
nnoremap  <C-t> :FloatermToggle<CR>
tnoremap <C-t> <C-\><C-n>:FloatermToggle<CR>
" nnoremap  <leader>t :tab ter<CR>
" noremap! <leader>t <Esc>:FloatermToggle<CR>i
" tnoremap  <leader>d <C-\><C-n>:bd!<CR>

" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use alt + hjkl to resize windows
" nnoremap <M-j>    :resize -2<CR>
" nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" remap Y to what it should be
nnoremap <S-y> y$

" italics and bold
" vnoremap i <Plug>Ysurround ssiwi
" vnoremap <C-b> <S-s>b

" remap Return to save
" nmap <CR> <plug>(vimtex-context-menu)

" Jump paragraph
" nmap <C-j> :NERDTreeToggle<CR>

vnoremap <M-j> :m'>+<CR>gv
vnoremap <M-k> :m-2<CR>gv
nnoremap <M-j> ddp
nnoremap <M-k> ddkP
inoremap <M-j> <esc>ddp
inoremap <M-k> <esc>ddkP

" Jump forward, replacing <c-i> since idential to <tab>
" nnoremap <C-[> <C-i>
" nnoremap <C-]> <C-o>

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" jump to end of previous word
nnoremap E ge

" Better tabbing
vnoremap > >gv
vnoremap < <gv
nnoremap > <S-v>><esc>
nnoremap < <S-v><<esc>

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Horizontal line movement
nnoremap <S-h> g^
nnoremap <S-l> g$
vnoremap <S-h> g^
vnoremap <S-l> g$

" Display line movements
" noremap <S-h> b
" noremap <S-j> gj
" noremap <S-k> gk
" noremap <S-l> w

" Open Manual for word
nnoremap <M-m> :execute "help " . expand("<cword>")<cr>
" noremap <C-m> :call <SNR>23_show_documentation()<CR>
" noremap <C-m> :help expand("<cword>")<cr>

" Display line movements
nnoremap <S-k> gk
nnoremap <S-j> gj
vnoremap <S-k> gk
vnoremap <S-j> gj


" UndoTree bindings
nnoremap <space>u :UndotreeToggle<CR> \| <C-w>h \| <C-w>k

" LaTeX bindings
nnoremap <space>c :VimtexCountWords<CR> 
" nnoremap <space>b :VimtexCompile<CR>
" nnoremap <space>i :VimtexTocOpen<CR>
" nnoremap <space>i :VimtexTocToggle<CR> \| <C-w>h
" nnoremap <space>p :VimtexView<CR> 
" nnoremap <space>x :VimtexClean<CR>
" nnoremap <space>l :VimtexLabelsToggle<CR> 

" Fuzzy Search
nnoremap <C-p> :Files<CR>

" NERDTree bindings
" nmap <C-n> :NERDTreeToggle<CR>

" Explorer
" nmap <space>f :w \| :CocCommand explorer --preset floating<CR>

" Ranger
" nmap <space>r :RnvimrToggle<CR>

" Coc Autocomplete Toggle
" nnoremap <expr> <space>r yourConditionExpression ? ':q!<cr>':':bd<cr>'

" Kill search on escape
nnoremap <esc> :noh<return><esc>

" Spelling: http://vimdoc.sourceforge.net/htmldoc/spell.html
nnoremap <C-s> a<C-X><C-S>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)


" " Markdown
let g:markdown_mapping_switch_status = '<Space>ms'
" nnoremap <Space>ft <Space>mf
" nmap <C-s> <Plug>MarkdownPreview
" nmap <M-s> <Plug>MarkdownPreviewStop
" nmap <C-p> <Plug>MarkdownPreviewToggle

" GitGutterHunk
  " nmap ghp <Plug>(GitGutterPreviewHunk)
  " nmap ghs <Plug>(GitGutterStageHunk)
  " nmap ghu <Plug>(GitGutterUndoHunk)

" Snippets in Coc
  " Use <C-l> for trigger snippet expand.
  imap <C-l> <Plug>(coc-snippets-expand)

cnoremap <C-j> <C-n>
cnoremap <C-k> <C-p>
