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
	call inputsave()
	let key = input("Predicate Places: '1', '2', '3', '4' or  (C)ase")
	call inputrestore()
	let feature = get( {'1': '1', '2': '2', '3': '3', '4': '4'}, key )
	if feature == '1'
		call setline(".", "\t, ( \"" . relation . "\",\t\\[x]\t-> predid1 \"" .
			\ relation . "\" x\t)")
	elseif feature == '2'
		call setline(".", "\t, ( \"" . relation . "\",\t\\[x,y]\t-> predid2 \"" .
			\ relation . "\" y x\t)")
	elseif feature == '3'
		call setline(".", "\t, ( \"" . relation . "\",\t\\[x,y,z]\t-> predid3 \"" .
			\ relation . "\" z y x\t)")
	elseif feature == '3'
		call setline(".", "\t, ( \"" . relation . "\",\t\\[x,y,z,w]\t-> predid4 \"" .
			\ relation . "\" w z y x\t)")
	else
		call setline(".", "\t, ( \"" . relation . "\",\t\\args -> case args of
			[x,y,z,w]\t-> predid4 \"" . relation ."\" w z y x
			[x,y,z]\t-> (forgetful4 . predid4) \"" . relation . "\" z y x
			[x,y]\t-> (forgetful3 . forgetful4 . predid4) \"" . relation . "\" y x
                         [x]\t-> (forgetful2 . forgetful3 . forgetful4 . predid4) \"" . relation . "\" x\t)")
	endif
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

fu! Populate(module)
	let word = expand('<cWORD>')
	call inputsave()
	let key = input("Cat: '(A)P', '(C)N', '(P)N', '(V)*' ")
	call inputrestore()
	let category = get( {'a': 'AP', 'c': 'CN', 'p': 'PN', 'v': 'V*'}, key )
"	call setline('.', word . "\t: " . category . ";")
	let word_buf = bufnr("%")
	let save_cursor = getpos(".")
	let word_lnum = line("'a")
"	call setline(word_lnum, "\t, \"" . word . "\"")
"	call append(word_lnum,'')
"	call setpos("'a", [0, (word_lnum+1), 1, 0])

	let ab_gf = bufnr( "/" . a:module . "\.gf")
	execute "buffer" ab_gf
	let module_lnum = line("'b")
"	call setline(module_lnum, "\t" . word . "\t: " . category . ";")
"	call append(module_lnum,'')
"	call setpos("'b", [0, (module_lnum+1), 1, 0])

	let ab_i_gf = bufnr( a:module . "I.gf")
	execute "buffer" ab_i_gf
	let module_lnum = line("'c")
	call setline(module_lnum, "\t" . word . "\t= mk" . category . " " . word . "_" . category . ";")
	call append(module_lnum,'')
	call setpos("'c", [0, (module_lnum+1), 1, 0])

	let lex_ab_gf = bufnr( "Lex" . a:module . ".gf")
	execute "buffer" lex_ab_gf
	let module_lnum = line("'d")
	call setline(module_lnum, "\t" . word . "_" . category . "\t: " . category . ";")
	call append(module_lnum,'')
	call setpos("'d", [0, (module_lnum+1), 1, 0])

	let lex_ab_eng_gf = bufnr( "Lex" . a:module . "Eng.gf")
	execute "buffer" lex_ab_eng_gf
	let module_lnum = line("'e")
	call setline(module_lnum, "\t" . word . "_" . category . "\t= mk" . category . " \"" . word . "\";")
	call append(module_lnum,'')
	call setpos("'e", [0, (module_lnum+1), 1, 0])

	execute "buffer" word_buf
	call setpos('.', save_cursor)

endf
nn <LocalLeader>p <Esc>:call Populate("Cusp")<CR><CR>

" put words in DicksonI.gf, LexDickson.gf, LexDicksonEng.gf

nn <LocalLeader>M
	yiwPV>A	: PN;:w:2bn"0PV>A      = mkPN "0pA_N;o:w:bn"0PV>A_N  : N;lO: "<80>kbw:bn"0PA_N       = mkN "0";bb~lV>o:w:bn"0PV>I, "l~lA":w:        brew}w

" put words in categories in WordsCharacters.hs and in Dickson.gf

nn <LocalLeader>e yiw'aA  , "^R0"^M^Cma''DI                                  -- ^R0       : CN;^Cyy:brewind^M'bPo^Cmb^M:5bn^M^M


let &cpo = s:save_cpo
