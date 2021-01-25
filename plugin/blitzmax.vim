" File:		blitzmax.vim
" Language:	 BlitzMax
" Maintainer: @Hezkore
" Last Change: 2021
" Description: Basic CTags/Tagbar support

" Tagbar definition for BlitzMax 
let g:tagbar_type_blitzmax = {
    \ 'ctagstype' : 'blitzmax',
    \ 'kinds'        : [
        \'t:types',
		\'y:constants',
		\'g:globals',
        \'f:fields',
        \'m:methods',
		\'x:functions'
    \],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'Type'
    \ },
    \ 'scope2kind' : {
        \ 'Type' : 't'
    \ },
	\ 'deffile' : expand('<sfile>:p:h:h') . '/ctags/blitzmax.cnf'
\}
