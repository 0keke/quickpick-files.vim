function! quickpick#pickers#files#open() abort
  call quickpick#open({
          \ 'items': s:get_files('.'),
          \ 'on_accept': function('s:on_accept'),
          \})
endfunction

function! s:on_accept(data, ...) abort
  call quickpick#close()
  execute 'edit ' .. a:data['items'][0]
endfunction

function! s:get_files(dir)
  let files = []
  for item in readdir(a:dir)
    if item =~ '^\.'
      continue
    endif
    let item = a:dir .. '/' .. item
    if isdirectory(item)
      let files += s:get_files(item)
    else
      let files += [item]
    endif
  endfor
  return files
endfunction

" vim: tabstop=2 shiftwidth=2 expandtab
