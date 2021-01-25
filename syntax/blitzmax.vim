" Vim syntax file
" Language:		BlitzMax NG
" Maintainer:	@Hezkore
" Last Change:	2021

if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

syntax case ignore

" Comments
syn region	bmxComment start="^\s*Rem\(\s\+\w*\|$\)" end="^\s*End\s*Rem\s*$"
syn region	bmxComment start="'" end="$"

" Keywords
syn match	bmxSyntax "^\s*End\s*\(If\|Type\|Function\|Method\|Struct\|Select\)\s*$"
syn keyword	bmxSyntax Strict SuperStrict Public Private Var Mod Continue Incbin Framework Include Import Extern New Self Null Super EachIn True False Not Extends Abstract Select Case Default Const Local Global Field Method Function Type And Or Shl Shr End If Then Else ElseIf While Wend Repeat Until Forever For To Step Next Return Module Implements

" Preprocessors
syn match	bmxPreprocessor "^\s*?.*"

" Functions
syn match	bmxFunc "\(New\s\+\w*\)\@<!\w*\s*\(\(\:\s*\w\+\|%\|#\|!\|\$\)\s*(\|(\)\@="

" Types
syn match	bmxTypeSpecifier "\w*\(\:\s*\)\@<=\(\w\+\)"
syn match	bmxTypeSpecifier "\(^\s*Type\s*\)\@<=\w\+"
syn match	bmxTypeSpecifier "\(\:\)\@<!\(\w\+\)\@<=\s*\(%\|#\|!\|\$\)"
syn match	bmxTypeSpecifier "\(New\|Implements\|Extends\)\@<=\s\+\w*"

syn match	bmxSyntax "\(\.\|,\|\:\|=\|+\|-\|*\|/\|\~\|\^\|<\|>\)"

syn match	bmxNumber "\<\d\+\>"
syn match	bmxNumber "\<\d\+\.\d*\>"
syn match	bmxNumber "\.\d\+\>"

syn region	bmxStruc matchgroup=Delimiter start="("	matchgroup=Delimiter end=")" contains=ALL
syn region	bmxStruc matchgroup=Delimiter start="\[" matchgroup=Delimiter end="\]" contains=ALL

syn match	bmxSpecial contained "\\\d\d\d\|\\."
syn region	bmxString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=bmxSpecial

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
	
	HiLink bmxIdent			Identifier
	
	HiLink bmxComment		Comment
	HiLink bmxSpecial		Special
	HiLink bmxPreprocessor	PreProc
	HiLink bmxTypeSpecifier	Type
	
	delcommand HiLink
endif

let b:current_syntax = "blitzmax"

" Shortcut to build & execute a debug build
nnoremap <F5> :make makeapp -d -t console -w -a -x -o %<.debug %<CR>

" Shortcut to build & execute a release build
nnoremap <F6> :make makeapp -r -t console -w -x %<CR>

" Shortcut to build a debug build
nnoremap <F7> :make makeapp -d -t console -w -o %<.debug %<CR>

" Shortcut to build a release build
nnoremap <F8> :make makeapp -r -t console -w %<CR>
