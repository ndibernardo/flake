let b:slime_vimterminal_cmd = 'guile'

function! s:load() abort
  return '(load "' . escape(expand('%:p'), '\"') . '")'
endfunction

function! s:repl() abort
  update
  let l:bufnr = str2nr(get(get(b:, 'slime_config', {}), 'bufnr', ''))
  if term_getstatus(l:bufnr) =~# 'running'
    call slime#send(s:load() . "\n")
    return
  endif
  let l:winid = win_getid()
  let l:bufnr = term_start(['guile', '-l', expand('%:p')], g:slime_vimterminal_config)
  call win_gotoid(l:winid)
  let b:slime_config = { 'bufnr': l:bufnr }
endfunction

command! -buffer -bar SchemeRepl call s:repl()

nnoremap <buffer> <silent> <LocalLeader>rr :<C-u>SchemeRepl<CR>
nmap <buffer> <LocalLeader>ee <Plug>SlimeMotionSendaf
nmap <buffer> <LocalLeader>ef <Plug>SlimeMotionSendaF
xmap <buffer> <LocalLeader>ee <Plug>SlimeRegionSend
