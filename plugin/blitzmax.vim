" File:		blitzmax.vim
" Language:	 BlitzMax
" Maintainer: @Hezkore
" Last Change: 2021
" Description: Basic CTags/Tagbar support

" Make BlitzMax specific CTags
command! MakeBmxModuleCtags :call MakeBmxCtags(g:blitzmax_path.'/mod')
command! -nargs=? MakeBmxCtags :call MakeBmxCtags(<f-args>)
function! MakeBmxCtags(...)
	let l:path = a:0 >= 1 ? a:1 : expand("%:p:h")
	silent execute('!ctags -f '.l:path.'/tags
\	--langdef=blitzmax --langmap=blitzmax:.bmx
\	--regex-blitzmax=/^\\s*Type\\s+\(\[a-zA-Z0-9_\]+\)/\\1/t,Type/,i
\	--regex-blitzmax=/^\\s*Struct\\s+\(\[a-zA-Z0-9_\]+\)/\\1/s,Struct/,i
\	--regex-blitzmax=/^\\s*Enum\\s+\(\[a-zA-Z0-9_\]+\)/\\1/e,Enum/,i
\	--regex-blitzmax=/^\\s*Const\\s+\(\[a-zA-Z0-9_\]+\)/\\1/c,Constants/,i
\	--regex-blitzmax=/^\\s*Global\\s+\(\[a-zA-Z0-9_\]+\)/\\1/g,Globals/,i
\	--regex-blitzmax=/^\\s*Field\\s+\(\[a-zA-Z0-9_\]+\)/\\1/i,Fields/,i
\	--regex-blitzmax=/^\\s*Method\\s+\(\[a-zA-Z0-9_\]+\)/\\1/m,Method/,i
\	--regex-blitzmax=/^\\s*Function\\s+\(\[a-zA-Z0-9_\]+\)/\\1/f,Function/,i
\	--languages=blitzmax
\	-R '.l:path)
	redraw!
	if v:shell_error
		echoh WarningMsg
		echom 'Error creating Ctags! Make sure you have CTags installed'
		echoh None
	else
		echom 'Created Ctags for '.l:path
	endif
endfunction

" Tagbar definition for BlitzMax
let g:tagbar_type_blitzmax = {
\	'ctagstype' : 'blitzmax',
\	'kinds' : [
\		'c:Constants:0:0',
\		'g:Globals:0:0',
\		't:Type:1:1',
\		's:Struct:0:1',
\		'e:Enum:0:1',
\		'i:Fields:0:0',
\		'f:Function:0:1',
\		'm:Method:0:1'
\	],
\	'sro' : '.',
\	'kind2scope' : {
\		't' : 'Type',
\		'f' : 'Function',
\		'm' : 'Method',
\		'e' : 'Enum',
\		's' : 'Struct',
\	},
\	'scope2kind' : {
\		'Type' : 't',
\		'Function' : 'f',
\		'Method' : 'm',
\		'Enum' : 'e',
\		'Struct' : 's',
\	},
\	'sort' : 0,
\	'deffile' : expand('<sfile>:p:h:h') . '/ctags/blitzmax.cnf'
\}
