" REPL: racket in a vim terminal with this module entered; vim-slime sends to it.
let b:slime_vimterminal_cmd = 'racket'

function! s:enter() abort
  return '(enter! (file "' . escape(expand('%:p'), '\"') . '"))'
endfunction

function! s:repl() abort
  update
  let l:bufnr = str2nr(get(get(b:, 'slime_config', {}), 'bufnr', ''))
  if term_getstatus(l:bufnr) =~# 'running'
    call slime#send(s:enter() . "\n")
    return
  endif
  let l:winid = win_getid()
  let l:bufnr = term_start(['racket', '-i', '-e', s:enter()], g:slime_vimterminal_config)
  call win_gotoid(l:winid)
  let b:slime_config = { 'bufnr': l:bufnr }
endfunction

command! -buffer -bar RacketRepl call s:repl()
command! -buffer -bar RacoMake update | compiler racomake | make
command! -buffer -bar RacoTest update | compiler racotest | make

nnoremap <buffer> <silent> <LocalLeader>rr :<C-u>RacketRepl<CR>
nnoremap <buffer> <silent> <LocalLeader>rm :<C-u>RacoMake<CR>
nnoremap <buffer> <silent> <LocalLeader>rt :<C-u>RacoTest<CR>
nmap <buffer> <LocalLeader>rd <Plug>RacketDoc
nmap <buffer> <LocalLeader>ee <Plug>SlimeMotionSendaf
nmap <buffer> <LocalLeader>ef <Plug>SlimeMotionSendaF
xmap <buffer> <LocalLeader>ee <Plug>SlimeRegionSend
