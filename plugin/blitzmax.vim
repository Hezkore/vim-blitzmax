" File:		blitzmax.vim
" Language:	 BlitzMax
" Maintainer: @Hezkore
" Last Change: 2021
" Description: Basic CTags/Tagbar support

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
