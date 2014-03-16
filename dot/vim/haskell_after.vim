" Haskell filetype plugin for Parsing.hs, LogicalForm.hs
" Last Change:	2000 Oct 15
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" License:	This file is placed in the public domain.

let s:save_cpo = &cpo
set cpo&vim

set cpoptions+=M		"ignore backslashing in parentheses matching

if exists("loaded_haskell_after")
finish
endif
let loaded_haskell_after = 1

fu! CommonNoun() 
	let noun = expand('<cword>')
	let up = Ucfirst(noun)
	call setline(".", "lfCN " . up . '	= \t -> Atom "' . noun . '" [t]')
endfunction
" ino <LocalLeader>N <Esc>:call CommonNoun()<CR>o

fu! Interp() 
	let relation = expand('<cword>')
	let up = Ucfirst(relation)
	call setline(".", "\t, ( \"" . relation . "\",\t\\[x]\t-> predid1 \"" . relation . "\" x\t)")
endfunction
ino <LocalLeader>I <Esc>:call Interp()<CR>o

fu! Inflect()
	let words = split(getline('.'), '\s\+')
	let inflection = "\t, (\"" . get(words, 0) . "\",\t\"" . get(words, 1) . "\" )"
	call setline('.', inflection)
endfunction
ino <LocalLeader>N <Esc>:call Inflect()<CR>o


fu! Constantterm()
	let string = expand('<cword>')
	let cap = Ucfirst( string )
	let term = 'G' . string
	let lnum = line('.')
	let prevline = getline(prevnonblank(lnum - 1))
	let mx = '\(\w\+\).*'
	let line = matchstr(prevline, mx)
	let catlist = substitute(line, mx, '\1', '')
	if catlist == 'entity_list'
		call setline(".", catlist . " " . term .
			\ "\t= ent_ided \"" . cap . "\"")
	else
		call setline(".", catlist . " " . term .
			\ "\t= \"" . string . "\"")
	endif
endfunction
ino <LocalLeader>C <Esc>:call Constantterm()<CR>o

fu! Name()
	let lexeme = expand('<cword>')
	call inputsave()
	let key = input("Feature: '(M)asc', '(F)em', or '(N)eutr' ")
	call inputrestore()
	let feature = get( {'m': 'Masc', 'f': 'Fem', 'n': 'Neutr'}, key )
	call setline(".", "\t, [Cat \"" . lexeme . "\"	\"NP\" [Thrd," . feature . ",Sg] []]")
endf
ino <LocalLeader>P <Esc>:call Name()<CR>o

fu! Object()
	let lexeme = expand('<cword>')
	call inputsave()
	let key = input("Feature: 'CN', or 'NP' ")
	call inputrestore()
	let uncount = get( {'c': 'CN', 'n': 'NP'}, key )
	let key = input("Feature: 'Sg', or 'Pl' ")
	call inputrestore()
	let number = get( {'s': 'Sg', 'p': 'Pl'}, key )
	call setline(".", "\t, [Cat \"" . lexeme . "\"	\"" . uncount . "\" [Thrd,Neutr," . number . "] []]")
endf
ino <LocalLeader>O <Esc>:call Object()<CR>o

fu! Transitive()
	let lexeme = expand('<cword>')
	call inputsave()
	let key = input("Feature: '(T)ense' or '(I)nfl' ")
	call inputrestore()
	let feature = get( {'t': 'Tense', 'i': 'Infl'}, key )
	call setline(".", "\t[Cat \"" . lexeme . "\"	\"VP\" [" . feature . "] [Cat \"_\" \"NP\" [AccOrDat] []]],")
endf
ino <LocalLeader>T <Esc>:call Transitive()<CR>o

fu! Predicate()
	let name = expand('<cword>')
	call inputsave()
	let key = input("Predicate Places: '1', '2', or '3' ")
	call inputrestore()
	let feature = get( {'1': '1', '2': '2', '3': '3'}, key )
	let initial = Firstletter( Ucfirst( name ) )
	call setline(".", name . "\t= pred" . feature . " []")
endf
ino <LocalLeader>Pr <Esc>:call Predicate()<CR>$i

fu! Oneword()
	let lnum = line('.')
	let words = split(getline(lnum), '\s\+')
	let wordlist = join( words, '":"')
	let oneword = join( words, '_')
	call setline(".", "preproc (\"" . wordlist . "\":xs)\t= \"" . oneword . "\" : preproc xs")
endf
ino <LocalLeader>1 <Esc>:call Oneword()<CR>o

let &cpo = s:save_cpo
