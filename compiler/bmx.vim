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

CompilerSet makeprg=bmk\ $*
CompilerSet errorformat=
	\%ACompile\ \%t%\\w%\\+\:\ \%m,
	\%C\[\%f\;\%l\;\%c\],\%Z,
	\%-G\%.\%#