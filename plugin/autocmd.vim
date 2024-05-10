" autocmd.vim: autocmds for my vimrc
" Maintainer:  @mpbsd
" Version:     0.1

augroup set_foldmethod_to_marker_for_these_filetypes
  autocmd!
  autocmd FileType python,sh,vim setlocal foldmethod=marker
augroup END

augroup get_rid_of_trailing_spaces
  autocmd!
  autocmd BufWritePre *.json,*.lua,*.py,*.sh,*.tex,*.txt,*.vim :call VimRemoveTrailingSpacesFromCurrentBuffer()
augroup END

augroup make_views_persistent_across_sessions
  autocmd!
  autocmd FileType c,h,python,sh,tex,vim :mkview
  autocmd FileType c,h,python,sh,tex,vim :silent! loadview
augroup END

augroup get_iabbrevs_for_these_filetypes
  autocmd!
  autocmd FileType mail,markdown,tex,text,vimwiki source ~/.vim/spell/words.abbr
augroup END

augroup point_out_misspelled_words_in_mails_and_tex_files
  autocmd!
  autocmd FileType mail,tex setlocal spell
augroup END

augroup remove_duplicate_words
  autocmd!
  autocmd BufWinEnter words.abbr,words.dict %sort u
augroup END
