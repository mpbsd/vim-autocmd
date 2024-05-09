" autocmd.vim: autocmds for my vimrc
" Maintainer:  @mpbsd
" Version:     0.1

" s:autocmds {{{
let s:autocmds = [
      \  {
      \    'augroup': 'set_marker_foldmethod_based_on_filetype',
      \    'events': 'FileType',
      \    'pattern': 'python,sh,vim',
      \    'action': 'setlocal foldmethod=marker'
      \  },
      \  {
      \    'augroup': 'remove_trailing_spaces',
      \    'events': 'BufWritePre',
      \    'pattern': '*.json,*.lua,*.py,*.sh,*.tex,*.txt,*.vim',
      \    'action': ':call VimRemoveTrailingSpacesFromCurrentBuffer()'
      \  },
      \  {
      \    'augroup': 'autosave_views',
      \    'events': 'BufWinLeave',
      \    'pattern': '*.c,*.h,*.py,*.sh,*.tex,*.vim',
      \    'action': 'mkview'
      \  },
      \  {
      \    'augroup': 'autoload_views',
      \    'events': 'BufWinEnter',
      \    'pattern': '*.c,*.h,*.py,*.sh,*.tex,*.vim',
      \    'action': 'silent! loadview'
      \  },
      \  {
      \    'augroup': 'autoload_iabbrevs_based_on_filetype',
      \    'events': 'FileType',
      \    'pattern': 'mail,markdown,tex,text,vimwiki',
      \    'action': 'source ~/.vim/spell/words.abbr'
      \  },
      \  {
      \    'augroup': 'enable_spelling_when_writing_emails',
      \    'events': 'FileType',
      \    'pattern': 'mail',
      \    'action': 'setlocal spell'
      \  },
      \  {
      \    'augroup': 'remove_duplicates_from_my_curated_lists_of_words',
      \    'events': 'BufWinEnter',
      \    'pattern': 'words.abbr,words.dict',
      \    'action': '1,$sort u'
      \  },
      \]
" }}}

function VimSetAnAutocmd(augroup, events, pattern, action) abort
  execute printf("augroup %s", a:augroup)
  autocmd!
  execute printf("autocmd %s %s %s", a:events, a:pattern, a:action)
  augroup END
endfunction

function VimSetAutocmds(autocmds) abort
  for X in a:autocmds
    call VimSetAnAutocmd(X['augroup'], X['events'], X['pattern'], X['action'])
  endfor
endfunction

call VimSetAutocmds(s:autocmds)
