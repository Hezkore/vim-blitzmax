" Vim syntax file
" Language: BlitzMax NG
" Maintainer: @Hezkore
" Last Change: 20 Jan, 2021

if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

syntax case ignore

" This needs to support 'End Rem' as well
syn region bmxComment start="rem$" end="endrem"
syn region bmxComment start="'" end="$"

syn match bmxSyntax "\b(End\s*?Function|End\s*?Type|End\s*?If|Else\s*?If)"
syn keyword bmxSyntax Strict SuperStrict Public Private Int Float Long Double String Mod Continue Include Import Extern New Self Null Super EachIn True False Not Extends Abstract Select Case Default Const Local Global Field Method Function Type And Or Shl Shr End If Then Else While Wend Repeat Until Forever For To Step Next Return Module Implements
syn keyword bmxPreprocessor #if #else #endif

syn match	bmxTypeSpecifier "[<>+\*^/\\=-]"
"syn match	bmxTypeSpecifier "-\|=\|[:<>+\*^/\\]\|AND\|OR"

syn match	bmxNumber "\<\d\+\>"
syn match	bmxNumber "\<\d\+\.\d*\>"
syn match	bmxNumber "\.\d\+\>"

syn region	bmxStruc matchgroup=Delimiter start="("	matchgroup=Delimiter end=")" contains=ALL
syn region	bmxStruc matchgroup=Delimiter start="\[" matchgroup=Delimiter end="\]" contains=ALL

syn match	bmxSpecial contained "\\\d\d\d\|\\."
syn region	bmxString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=bmxSpecial

syn match	bmxTypeSpecifier "[a-zA-Z0-9][\$%&!#]"ms=s+1

if version >= 508 || !exists("did_bmx_syntax_inits")
	
	if version < 508
		let did_bmx_syntax_inits = 1
		command -nargs=+ HiLink hi link <args>
	else
		command -nargs=+ HiLink hi def link <args>
	endif
	
	HiLink bmxSyntax		Statement
	HiLink bmxFunc			Function
	HiLink bmxString		String
	HiLink bmxNumber		Number
	
	HiLink bmxConstant		Constant
	
	HiLink bmxMath			Identifier
	
	HiLink bmxComment		Comment
	HiLink bmxSpecial		Special
	HiLink bmxPreprocessor	PreProc
	HiLink bmxTypeSpecifier	Type
	
	delcommand HiLink
endif

let b:current_syntax = "blitzmax"