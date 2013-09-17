set guifont=DejaVu\ Sans\ Mono\ 9

" (e) Native tab labels
" (a) Autoselect: Visually selected text is available to windowing system
" (c) Prefer console dialogs instead of gui
set guioptions=aec

" Disable bell
set novb

highlight Cursor  guifg=NONE guibg=white
highlight iCursor guifg=NONE guibg=red
set guicursor=n-v-c:ver2-Cursor     " Set normal-visual mode cursor to be a 2% wide vertical bar
set guicursor+=c:ver2-Cursor        " Set command mode cursor to be 2% wide vertical bar
set guicursor+=i:ver2-iCursor       " Set insert mode cursor to be 2% wide vertical bar
set guicursor+=a:blinkon0           " Disable all blinking:
