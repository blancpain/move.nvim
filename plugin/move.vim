" prevent loading file twice
if exists('g:loaded_move') | finish | endif

" save user coptions
let s:save_cpo = &cpo 
" reset them to defaults
set cpo&vim 

" command to run our plugin
command! -nargs=1 Move lua require('move').Move(<args>)
command! -nargs=1 -range=% MoveBlock lua require('move').MoveBlock(<args>, <line1>, <line2>)
lua map = require('lua.mapping')

" and restore after
let &cpo = s:save_cpo 
unlet s:save_cpo

let g:loaded_whid = 1