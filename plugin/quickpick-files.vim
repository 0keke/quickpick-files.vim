if exists('g:quickpick_files_loaded')
  finish
endif
let g:quickpick_files_loaded = 1

command! Pfiles call quickpick#pickers#files#open()

" vim: tabstop=2 shiftwidth=2 expandtab
