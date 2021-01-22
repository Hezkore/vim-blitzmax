" Vim syntax file
" Language:		BlitzMax NG
" Maintainer:	@Hezkore
" Last Change:	2021

if exists('current_compiler')
  finish
endif
let current_compiler = 'bmx'

if exists(':CompilerSet') != 2
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=bmk\ makeapp\ -d\ -t\ console\ -w\ -x\ %
CompilerSet errorformat=%+P[%f],(%l\\,%c)%*[\ ]%t%*[^:]:\ %m,%-Q