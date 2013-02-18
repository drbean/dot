let SessionLoad = 1
if &cp | set nocp | endif
nmap v :call Screen_Vars()
nmap  vip
vmap  "ry :call Send_to_Screen(@r)
noremap  `"
noremap + I
nmap :W :w
nmap :E :e
nnoremap \jigsaw 4d4d3kPd3dpd2dpddpd4d6-Pd3dpd2dpddpd4d9-Pd3d2pd2d2pdd2p
map \l :ls:b 
nnoremap \f :call FindNext()
map \words :call Wordlist()
map <silent> \snip :call ResetSnippets() | call GetSnippets(g:snippets_dir, "_") | call GetSnippets(g:snippets_dir, &ft):echo "Snippets for format \"" . &ft . "\" updated."
map \i :call Insert_increment()
map \wc :%s/[^ 	]\+/&/g``
vmap \we :v/HEMAIL/d
nmap \we vip:v/HEMAIL/d
map \S mX:sp ~/.mutt/fortunesggd/^--/Gp:wq'XGAp`X
let s:cpo_save=&cpo
set cpo&vim
map \cG y0:.,$-5d"0Pa<Up><Up>
map \dG :.,$-5d
map \das dasi> 
vmap \dp :s/^> //
vmap \qp :s/^/> /
vmap \cq :s/^[>	 ]\+$//e
nmap \cq :%s/^[>	 ]\+$//e
nnoremap \Y :%s/^\w*\s//:%s/	/: /G$"eyiw:v/e$/d:%s/\s*e$//ggO---
map \h :se hls! :se hls? 
vmap \m <Plug>MarkersMark
map \< <Plug>MarkersJumpB
map \> <Plug>MarkersJumpF
map \V :so $V/vim55/syntax/
map \A 
map \tw :set textwidth==col(".")
nnoremap \u :source ~/.vimrc
nnoremap \v :confirm e ~/.vimrc
nmap gx <Plug>NetrwBrowseX
noremap gf gf`"
vnoremap p :let current_reg = @"gvdi=current_reg
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
inoremap \_ :call Underscore()A 
imap \m <Plug>MarkersMark
imap \< <Plug>MarkersJumpB
imap \> <Plug>MarkersJumpF
imap gqap gqap
cabbr HEMAIL ^\(From\|Cc\|To\|Date\|Subject\|Message-ID\|Message-Id\|X-\)
iabbr YDATE =strftime("%a %b %d %T %Z %Y")
iabbr teh the
let &cpo=s:cpo_save
unlet s:cpo_save
set autoindent
set backspace=2
set backup
set comments=b:#,:%,fb:-,n:>,n:)
set exrc
set fileencodings=ucs-bom,utf-8,default,latin1
set formatoptions=toncqrw
set grepprg=ack
set helpheight=0
set helplang=en
set hidden
set history=50000
set hlsearch
set incsearch
set iskeyword=@,48-57,_,192-255,.,@-@
set laststatus=2
set nrformats=hex
set pastetoggle=\\P
set path=.,
set report=0
set ruler
set showbreak=+
set showcmd
set showmatch
set nostartofline
set tildeop
set timeoutlen=500
set title
set titlestring=%t%(\ %M%)%(\ [%{expand(\"%:p:h\")}]%)%(\ %a%)
set ttimeoutlen=500
set viminfo='20,\"50,h,!
set whichwrap=b,s,h,l,<,>,[,]
set winminheight=0
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/dot
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 .bashrc
badd +1 .bash_profile
badd +1 .screen/dotrc
badd +1 .screen/csfprc
badd +1 .screen/businessrc
badd +1 .screen/literaturerc
badd +0 .screen/weechatrc
silent! argdel *
edit .screen/weechatrc
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=b:#,:%,fb:-,n:>,n:)
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != ''
setlocal filetype=
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=toncqrw
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=0
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,.,@-@
setlocal keywordprg=
set linebreak
setlocal linebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=hex
setlocal nonumber
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=8
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != ''
setlocal syntax=
endif
setlocal tabstop=8
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 11) / 22)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
