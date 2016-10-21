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
		call setline(".", "\t, ( \"" . relation . "\",\t\\args -> case args of")
		call append(".", [ "\t\t[x,y,z,w]\t-> predid4 \"" . relation ."\" w z y x", "\t\t[x,y,z]\t-> (forgetful4 . predid4) \"" . relation . "\" z y x", "\t\t[x,y]\t-> (forgetful3 . forgetful4 . predid4) \"" . relation . "\" y x", "\t\t[x]\t-> (forgetful2 . forgetful3 . forgetful4 . predid4) \"" . relation . "\" x\t)" ])
	endif
endfunction
ino <LocalLeader>I <Esc>:call Interp()<CR>o

fu! Predid() 
	let relation = expand('<cword>')
	call inputsave()
	let key = input("Predicate Places: '1', '2', '3', '4' or  (C)ase")
	call inputrestore()
	let feature = get( {'1': '1', '2': '2', '3': '3', '4': '4'}, key )
	call setline(".", "\t, ( \"" . relation . "\",\tpred" . feature . " [] )")
endfunction
" ino <LocalLeader>p <Esc>:call Predid()<CR>o

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

augroup gf
au!

fu! Word_mark()
	let save_cursor = getpos(".\"")
	let adj_line = search('a = [')
	call setpos("'a", [0, (adj_line), 1, 0])
	let adv_line = search('adv = [')
	call setpos("'d", [0, (adv_line), 1, 0])
	let conj_line = search('conj = [')
	call setpos("'c", [0, (conj_line), 1, 0])
	let subj_line = search('conj = [')
	call setpos("'s", [0, (subj_line), 1, 0])
	let det_line = search('det = [')
	call setpos("'t", [0, (det_line), 1, 0])
	call cursor(1,1)
	let cn_line = search('^n = [', "w")
	call setpos("'n", [0, (cn_line), 1, 0])
	call cursor(1,1)
	let n_line = search('^n = [', "w")
	call setpos("'n", [0, (n_line), 1, 0])
	let pn_line = search('pn = [')
	call setpos("'p", [0, (pn_line), 1, 0])
	let prep_line = search('prep = [')
	call setpos("'r", [0, (prep_line), 1, 0])
	let pron_line = search('pron = [')
	call setpos("'o", [0, (pron_line), 1, 0])
	let v_line = search('^v = [')
	call setpos("'v", [0, (v_line), 1, 0])
	call setpos('.', save_cursor)
endf

fu! Mod_mark()
	let save_cursor = getpos(".\"")
	let adj_line = search('-- AP')
	call setpos("'a", [0, (adj_line), 1, 0])
	let adv_line = search('-- Adv')
	call setpos("'d", [0, (adv_line), 1, 0])
	let conj_line = search('-- Conj')
	call setpos("'c", [0, (conj_line), 1, 0])
	let subj_line = search('-- Subj')
	call setpos("'s", [0, (subj_line), 1, 0])
	let det_line = search('-- Det')
	call setpos("'t", [0, (det_line), 1, 0])
	let n_line = search('-- N')
	call setpos("'n", [0, (n_line), 1, 0])
	let cn_line = search('-- N')
	call setpos("'n", [0, (cn_line), 1, 0])
	let pn_line = search('-- PN')
	call setpos("'p", [0, (pn_line), 1, 0])
	let prep_line = search('-- Prep')
	call setpos("'r", [0, (prep_line), 1, 0])
	let pron_line = search('-- Pron')
	call setpos("'o", [0, (pron_line), 1, 0])
	let v_line = search('-- V')
	call setpos("'v", [0, (v_line), 1, 0])
	call setpos('.', save_cursor)
endf

fu! Populate_pn(lnum, word, down_name, category, super_cat)
	call append(a:lnum, "\t" . a:down_name . "\t= mk" . a:category . "( mk" . a:super_cat . " feminine (mk" . a:super_cat ." \"" . a:word . "\") );")
endf

fu! Populate_partv(lnum, word, down_name, category, super_cat)
	let [verb; remainder] = split(a:word)
	let particle = join(remainder)
	call append(a:lnum, "\t" . a:down_name . "\t= part" . a:category . "( mk" . a:super_cat . " \"" . verb . "\") \"" . particle . "\";")
endf

fu! Populate_cat_args(lnum, word, down_name, category, arg)
	call append(a:lnum, "\t" . a:down_name . "\t= mk" . a:category . " \"" . a:word . "\" " . a:arg . ";")
endf

fu! Populate_adv(lnum, word, down_name, category, arg)
	call append(a:lnum, "\t" . a:down_name . "\t= ParadigmsEng.mk" . a:category . " \"" . a:word . "\" " . a:arg . ";")
endf

fu! Populate_ap_like(lnum, word, down_name, category, super_cat, arg)
	call append(a:lnum, "\t" . a:down_name . "\t= mk" . a:category . "( mk" . a:super_cat . " \"" . a:word . "\") " . a:arg .";")
endf

fu! Populate(module)
	let word_buf = bufnr( "/WordsCharacters.hs")
	let word_win = bufwinnr( "/WordsCharacters.hs")
	let win_id = win_getid( word_win )
	call win_gotoid( win_id )
	let line = line('.')
	let quoted_word = matchstr( getline('.'), "\".*\"")
	if quoted_word == ""
		let quoted_word = getline('.')
	endif
	let marklist = {'AP': 'a', 'A2': 'a', 'N': 'n', 'N2': 'n', 'CN': 'n', 'PN': 'p', 'PlaceNoun': 'n', 'Pron': 'o', 'V': 'v', 'Particle': 'v', 'V2': 'v', 'V3': 'v', 'VV': 'v', 'V2V': 'v', 'VS': 'v', 'V2S': 'v', 'VA': 'v', 'Adv': "d", 'Prep': "r", 'Det': "t", 'Conj': "c", 'Subj': "s"}
	let word = substitute( quoted_word, "\"", "", "g")
	call inputsave()
	let key = input("Word: " . word . ", Cat: '(A)', '(N)', '(V)*', a(D)v, p(R)ep, de(T), Pr(O)noun, (C)onj, (S)ubj")
	call inputrestore()
	let key_category = get( {'a': 'A', 'n': 'N', 'v': 'V', 'd': "Adv", 'r': "Prep", 't': "Det", 'o': "Pron", 'c': "Conj", 's': "Subj"}, key )
	let arg = ""
	if key_category == 'N'
		call inputsave()
		let n_key = input("Word: " . word . ", Cat: 'N( )', '(P)N', 'N(2)', '(C)N', 'P(l)aceNoun' ")
		call inputrestore()
		let n_category = get( {' ': 'N', 'p': 'PN', '2': 'N2', 'c': 'CN', 'l': 'PlaceNoun' }, n_key )
		if n_category == "N2"
			call inputsave()
			let arg = input("Word: " . word . ", Prep: eg, in_PREP, of_PREP, part_prep: ", "of_PREP")
			call inputrestore()
		else
		endif
		let category = n_category
	elseif key_category == 'V'
		call inputsave()
		let v_key = input("Word: " . word . ", Cat: 'V( )', '(P)article','V(2)', 'V(3)', 'V(V)', 'V2V(J)', 'V(S)', 'V2S(T)', 'V(A)' ")
		call inputrestore()
		let v_category = get( {' ': 'V', 'p': 'Particle', '2': 'V2', '3': 'V3', 'v': 'VV', 'j': 'V2V', 's': 'VS', 't': 'V2S', 'a': 'VA' }, v_key )
		if v_category == "V2"
			call inputsave()
			let arg = input("Word: " . word . ", Prep: eg, in_PREP, for, noPrep: ", "noPrep")
			call inputrestore()
		elseif v_category == "VV"
			call inputsave()
			let arg = input("Word: " . word . ", Prep: eg, noPrep, to: ", "noPrep")
			call inputrestore()
		elseif v_category == "V3"
			call inputsave()
			let arg = input("Word: " . word . ", Prep: eg, noPrep to: ", "noPrep noPrep")
			call inputrestore()
		elseif v_category == "V2V"
			call inputsave()
			let arg = input("Word: " . word . ", Prep: eg, noPrep to: ", "noPrep noPrep")
			call inputrestore()
		elseif v_category == "V2S"
			call inputsave()
			let arg = input("Word: " . word . ", Prep: eg, noPrep, to: ", "noPrep")
			call inputrestore()
		else
		endif
		let category = v_category
	elseif key_category == 'A'
		call inputsave()
		let a_key = input("Word: " . word . ", Cat: '(A)P', 'A(2)' ")
		call inputrestore()
		let a_category = get( {'a': 'AP', '2': 'A2'}, a_key )
		if a_category == "A2"
			call inputsave()
			let arg = input("Word: " . word . ", Prep: eg, noPrep, to, in_PREP, for, about: ", "to")
			call inputrestore()
		else
		endif
		let category = a_category
	else
		let category = key_category
	endif
	if category == "Particle"
		call setline('.', word . "\t: V;")
	else
		call setline('.', word . "\t: " . category . ";")
	endif
	let mark = marklist[category]

	let lc_name = tolower(word)
	let down_name = substitute(lc_name, '\(-\| \)', "_", "g")

	let ab_gf = bufnr( "/" . a:module . "\.gf")
	execute "buffer" ab_gf
	let ab_lnum = line("'" . mark)
	if category == "Particle"
		call append ((ab_lnum+1), "\t" . down_name . "\t: V;")
	else
		call append((ab_lnum+1), "\t" . down_name . "\t: " . category . ";")
	endif

	let ab_eng_gf = bufnr( a:module . "Eng.gf")
	execute "buffer" ab_eng_gf
	let ab_eng_lnum = line("'" . mark)
	if category == "PN"
		call Populate_pn((ab_eng_lnum+1), word, down_name, "PN", "N") 
	elseif category == "Particle"
		call Populate_partv((ab_eng_lnum+1), word, down_name, "V", "V") 
	elseif category == "Adv"
		call Populate_adv((ab_eng_lnum+1), word, down_name, category, "") 
	elseif category == "AP"
		call Populate_ap_like((ab_eng_lnum+1), word, down_name, category, "A", "") 
	elseif category == "A2"
		call Populate_ap_like((ab_eng_lnum+1), word, down_name, category, "A", arg) 
	elseif category == "CN"
		call Populate_ap_like((ab_eng_lnum+1), word, down_name, "CN", "N", "") 
	elseif category == "N2"
		call Populate_ap_like((ab_eng_lnum+1), word, down_name, "N2", "N",arg) 
	elseif category == "PlaceNoun"
		call Populate_ap_like((ab_eng_lnum+1), word, down_name, "CN", "N", "") 
	elseif category == "N"
		call Populate_cat_args((ab_eng_lnum+1), word, down_name, category, "nonExist") 
	elseif category == "V2"
		call Populate_ap_like((ab_eng_lnum+1), word, down_name, "V2", "V", arg) 
	elseif category == "VV"
		call Populate_ap_like((ab_eng_lnum+1), word, down_name, "VV", "V", arg) 
	elseif category == "VS"
		call Populate_ap_like((ab_eng_lnum+1), word, down_name, "VS", "V", arg) 
	elseif category == "V2S"
		call Populate_ap_like((ab_eng_lnum+1), word, down_name, category, "V", arg) 
	elseif category == "V2V"
		call Populate_ap_like((ab_eng_lnum+1), word, down_name, category, "V", arg) 
	elseif category == "VA"
		call Populate_ap_like((ab_eng_lnum+1), word, down_name, "VA", "V", arg) 
	elseif category == "V3"
		call Populate_ap_like((ab_eng_lnum+1), word, down_name, "V3", "V", arg) 
	else 
		call append((ab_eng_lnum+1), "\t" . down_name . "\t= mk" . category . " \"" . word . "\";")
	endif

	execute "buffer" word_buf
	call setpos('.', [ 0, (line+1), 1, 0] )

endf

fun Test_check()
	let quoted_word = matchstr( getline('.'), "\".*\"")
	if quoted_word == ""
		let quoted_word = getline('.')
	endif
	let word = substitute( quoted_word, "\"", "", "g")
	let test_win = bufwinnr("/Tests.hs")
	let win_id = win_getid( test_win )
	call win_gotoid( win_id )
	call clearmatches()
	call matchadd("Search", word)
endf

fun Next_line()
	exe "normal j"
endf

au BufReadPost Tests.hs nn <LocalLeader>p :call Populate($MOD) <CR>
au BufEnter WordsCharacters.hs nn <LocalLeader>a :call Test_check() <CR>
au BufReadPost My*gf,$MOD*.gf set tags=gf-contrib/drbean/$COURSE/$TOPIC/$STORY/gf_tags,gf-contrib/drbean/$COURSE/$TOPIC/$STORY/haskell_tags
au BufReadPost $MOD*.gf call Mod_mark()
au BufReadPost WordsCharacters.hs call Word_mark()
" au BufEnter WordsCharacters.hs if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif



augroup END

" put words in DicksonI.gf, LexDickson.gf, LexDicksonEng.gf

nn <LocalLeader>M yiwPV>A	: PN;:w:2bn"0PV>A      = mkPN "0pA_N;o:w:bn"0PV>A_N  : N;lO: "<80>kbw:bn"0PA_N       = mkN "0";bb~lV>o:w:bn"0PV>I, "l~lA":w:        brew}w

" put words in categories in WordsCharacters.hs and in Dickson.gf

nn <LocalLeader>e yiw'aA  , "^R0"^M^Cma''DI                                  -- ^R0       : CN;^Cyy:brewind^M'bPo^Cmb^M:5bn^M^M


let &cpo = s:save_cpo
