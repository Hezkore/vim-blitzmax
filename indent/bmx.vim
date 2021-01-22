" Vim ident file
" Language:		BlitzMax NG
" Maintainer:	@Hezkore
" Last Change:	2021

" Only load this indent file when no other was loaded
let b:did_indent = 1

setlocal indentexpr=BmxIndent()

" Only define the functions once
if exists("*BmxIndent")
	finish
endif

function! s:GetPrevNonCommentLineNum(lnum)
	let lnum = prevnonblank(a:lnum)
	let line = getline(lnum)
	" continue to search above if the current line begins with a '%'
	while line =~# '^\s*''.*$' || line=~# '\c^\s*Rem\(\s\+\w*\|$\)'
		let lnum = prevnonblank(lnum - 1)
		if 0 == lnum
		return 0
		endif
		let line = getline(lnum)
	endwhile
	return lnum
endfunction

function! IsBlockStart(line)
	return(a:line =~ '\c^\s*\(Type\|Method\|Function\|For\|If\|Select\)')
endfunction

function! IsBlockEnd(line)
	return(a:line =~ '\c^\s*End\s*\(If\|Type\|Function\|Method\|Struct\|Select\)\s*$')
endfunction

function! IsSingleLowerIndent(line)
	return(a:line =~ '\c^\s*\(Else\s*$\|ElseIf.*\|Else\s*If.*\)')
endfunction

function! BmxIndent()
	let prev_non_blank = prevnonblank(v:lnum - 1)
	
	" Hit the start of the file, use zero indent
	if prev_non_blank == 0
		return 0
	endif
	
	let prev_non_blank_comment = s:GetPrevNonCommentLineNum(prev_non_blank)
	let prevline = getline(prev_non_blank_comment)
	let currline = getline(v:lnum)
	let indnt = indent(prev_non_blank_comment)
	
	if IsSingleLowerIndent(currline)
		return indnt - &shiftwidth
	endif
	
	if IsBlockEnd(currline) && !IsBlockStart(prevline)
		return indnt - &shiftwidth
	endif
	
	if IsBlockStart(prevline) && !IsBlockEnd(currline)
		return indnt + &shiftwidth
	endif
	
	if IsSingleLowerIndent(prevline)
		return indnt + &shiftwidth
	endif
	
	return indnt
endfunction