for s:group in getcompletion('typescript', 'highlight')
  if s:group =~# 'Method$'
    execute 'highlight! link' s:group 'Function'
  elseif s:group =~# 'Prop$'
    execute 'highlight! link' s:group 'Identifier'
  elseif s:group =~# '\%(Global\|Cons\)$'
    execute 'highlight! link' s:group 'Type'
  endif
endfor
unlet! s:group
