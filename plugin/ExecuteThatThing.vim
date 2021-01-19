" Author: Timothy Rice <trice@posteo.net>
" Description: Pass text captured by motion to external filter (i.e. shell command)
"   This effectively turns Vim into a stateless coding notebook.

if exists('g:loaded_execute_that_thing')
    finish
endif
let g:loaded_execute_that_thing = 1

function! ExecuteThatThing(type, ...)
    let l:sel_save = &selection
    let &selection = 'inclusive'
    let l:reg_save = @@
    if a:0
        silent exe "normal! gvy`>"
    elseif a:type ==# 'line'
        silent exe "normal! '[V']y`>"
    else
        silent exe "normal! `[v`]y`>"
    endif
    " The following guard protects against ill-formed motions.
    " (Motivated by the dodgy InnerCommandMotion further down.)
    if @" != "\n"
        silent exec "r ! " . escape(@", "%!#\r\n")
    endif
    let &selection = l:sel_save
    let @@=l:reg_save
endfunction
nnoremap <silent> <Plug>(ExecThatThingNormal) :set opfunc=ExecuteThatThing<CR>g@
vnoremap <silent> <Plug>(ExecThatThingVisual) :<C-U>call ExecuteThatThing(visualmode(), 1)<CR>

" For executing the current line, by analogy with other 'inner motions' such as iw, i` etc
onoremap <silent> <Plug>(InnerLineMotion) :<C-U>normal! 0v$<CR>

" Treat first two characters as a prompt to be ignored. Execute the rest of the line.
" WARNING: This is NOT robust, i.e. it simply silently skips the leading characters.
" It does not check whether they actually look like a prompt,
" and it gives an error for lines with fewer than three characters.
onoremap <silent> <Plug>(InnerCommandMotion) :<C-U>normal! 3\|v$<CR>
