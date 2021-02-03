" Vim compiler file
" Language:		BlitzMax NG
" Maintainer:	@Hezkore
" Last Change:	2021

if exists('current_compiler')
	finish
endif

" Test if the BlitzMax path is correct
if exists('g:blitzmax_path')==0
	echoh WarningMsg
	echom 'The BlitzMax path has not been set'
	echoh None
	finish
endif

let current_compiler = 'bmk'

execute "setlocal makeprg=".g:blitzmax_path.'/bin/bmk\ $*'
setlocal errorformat=
	\%ACompile\ \%t%\\w%\\+\:\ \%m,
	\%C\[\%f\;\%l\;\%c\],\%Z,
	\%-G\%.\%#
