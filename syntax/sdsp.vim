if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

" 设置语法关键字忽略大小写
syntax	case	ignore

" 设置语法关键字组 Common IO Registers
syntax	keyword IO_Registers	status
syntax	keyword IO_Registers	intena
syntax	keyword IO_Registers	intreq
syntax	keyword IO_Registers	intvect
syntax	keyword IO_Registers	ioc_pa
syntax	keyword IO_Registers	ioc_pb
syntax	keyword IO_Registers	ioc_pci
syntax	keyword IO_Registers	porta
syntax	keyword IO_Registers	portb
syntax	keyword IO_Registers	portci
syntax	keyword IO_Registers	intmask
syntax	keyword IO_Registers	audio_pwm
syntax	keyword IO_Registers	misc5
syntax	keyword IO_Registers	misc4
syntax	keyword IO_Registers	misc3
syntax	keyword IO_Registers	misc2
syntax	keyword IO_Registers	misc1
syntax	keyword IO_Registers	clrwdt
syntax	keyword IO_Registers	iop_ix
syntax	keyword IO_Registers	iop_dat

" 设置语法关键字组 Virtual Programming IO Port
syntax	keyword VIO_Registers	Timer1
syntax	keyword VIO_Registers	Timer2
syntax	keyword VIO_Registers	rtctimer
syntax	keyword VIO_Registers	fetchcnt
syntax	keyword VIO_Registers	pa_pd50k
syntax	keyword VIO_Registers	pb_pd50k
syntax	keyword VIO_Registers	pci_pd50k
syntax	keyword VIO_Registers	pa_pd220k
syntax	keyword VIO_Registers	pb_pd220k
syntax	keyword VIO_Registers	pci_pd220k
syntax	keyword VIO_Registers	pa_pd1m
syntax	keyword VIO_Registers	pb_pd1m
syntax	keyword VIO_Registers	pci_pd1m
syntax	keyword VIO_Registers	pa_4ma
syntax	keyword VIO_Registers	pb_4ma
syntax	keyword VIO_Registers	pci_4ma
syntax	keyword VIO_Registers	pa_wlow
syntax	keyword VIO_Registers	pb_wlow
syntax	keyword VIO_Registers	pci_wlow
syntax	keyword VIO_Registers	waken_pa
syntax	keyword VIO_Registers	waken_pb
syntax	keyword VIO_Registers	waken_pc
syntax	keyword VIO_Registers	wakelv_pa
syntax	keyword VIO_Registers	wakelv_pb
syntax	keyword VIO_Registers	wakelv_pc
syntax	keyword VIO_Registers	wakedlv_pb

" 设置语法关键字组 Registers
syntax	keyword Registers	i0
syntax	keyword Registers	i1
syntax	keyword Registers	bp
syntax	keyword Registers	p0
syntax	keyword Registers	p1
syntax	keyword Registers	pc
syntax	keyword Registers	ar
syntax	keyword Registers	ax
syntax	keyword Registers	bx
syntax	keyword Registers	cx
syntax	keyword Registers	dx
syntax	keyword Registers	r0
syntax	keyword Registers	r1
syntax	keyword Registers	r2
syntax	keyword Registers	r3
syntax	keyword Registers	pcb
syntax	keyword Registers	pch
syntax	keyword Registers	flto
syntax	keyword Registers	flti
syntax	keyword Registers	fltg
syntax	keyword Registers	flta
syntax	keyword Registers	fltp
syntax	keyword Registers	cbl
syntax	keyword Registers	pasr
syntax	keyword Registers	mx
syntax	keyword Registers	mr0
syntax	keyword Registers	mr1
syntax	keyword Registers	ah
syntax	keyword Registers	al
syntax	keyword Registers	pe
syntax	keyword Registers	ps
syntax	keyword Registers	sf


" 设置语法关键字组 Instruction
syntax	keyword Instructions	jmp
syntax	keyword Instructions	call
syntax	keyword Instructions	loop
syntax	keyword Instructions	lcall
syntax	keyword Instructions	ljmp
syntax	keyword Instructions	rets
syntax	keyword Instructions	reti
syntax	keyword Instructions	fcall
syntax	keyword Instructions	fjmp
syntax	keyword Instructions	jzr
syntax	keyword Instructions	jeq
syntax	keyword Instructions	jnz
syntax	keyword Instructions	jne
syntax	keyword Instructions	jle
syntax	keyword Instructions	jge
syntax	keyword Instructions	jac
syntax	keyword Instructions	jan
syntax	keyword Instructions	jav
syntax	keyword Instructions	halt
syntax	keyword Instructions	nop
syntax	keyword Instructions	dw
syntax	keyword Instructions	lstr
syntax	keyword Instructions	mstr
syntax	keyword Instructions	rm
syntax	keyword Instructions	pm
syntax	keyword Instructions	test
syntax	keyword Instructions	set
syntax	keyword Instructions	clr
syntax	keyword Instructions	xchg
syntax	keyword Instructions	if

" 设置语法关键字组 Virtual Instruction
syntax	keyword Vir_Inst	equ
syntax	keyword Vir_Inst	org
syntax	keyword Vir_Inst	varrm
syntax	keyword Vir_Inst	sharevar
syntax	keyword Vir_Inst	macro
syntax	keyword Vir_Inst	endm
syntax	keyword Vir_Inst	optimal_rm

syntax	match	Vir_Inst	"reallocate#"
syntax	match	Vir_Inst	"\v\#(define|undef|include|if|else|endif)"
syntax	match	Vir_Inst	"\vbaseon(2|4|8|16|32|64|128|256|512|1024)\#"

" 设置语法匹配组 lineComment ，匹配注释
syntax	match	lineComment	"\v;.*"
syntax	match	lineComment	"\v//.*"

" 设置语法匹配组 Numbers ，匹配数字
syntax	match	Numbers		"\v<\d[0-9a-f]*([hb])?>"
syntax	match	Numbers		"\v<0x[0-9a-f]*>"

" 设置语法匹配组 trString，匹配字符串
syntax	match	trString	"\".*\""ms=s+1,me=e-1

" 设置语法匹配组 trLabel，匹配Label
syntax	match	trLabel		"^\s*[@a-zA-Z_][@a-zA-Z0-9_]*\s*:"me=e-1

" 设置语法组高亮，直接设置颜色
highlight IO_Registers 	guifg=Orange
highlight Registers	guifg=LightMagenta
highlight Instructions	guifg=#ff00ff
highlight Vir_Inst	guifg=#ff00ff
highlight default link	trString	string
highlight default link	trLabel		Function
highlight default link	lineComment	Comment
highlight Numbers	guifg=Green

inoremap jk 

setlocal laststatus=2

" -------------------------------------------
inoremap <buffer> ( ()<Left>
inoremap <buffer> [ []<Left>

inoremap <buffer> ) <c-r>=Cjj_closePair(')')<cr>
function! Cjj_closePair(char)
	if (getline(".")[col(".")-1]==a:char)
		return "\<Right>"
	else
		return a:char
	endif
endfunction

" -------------------------------------------
inoremap <buffer> <silent> <cr> <c-r>=Cjj_endPair()<cr>

function! Cjj_endPair()
	" 有下拉补全框时，直接返回 <cr>
	if pumvisible()
		return "\<cr>"
	endif

	let c = getline(".")[col(".")-1]
	if ( c != ')') && (c != ']' )
		return "\<cr>"
	endif

	let line = getline(".")
	let len = strlen(line)
	let pos = col(".")-1
	let ptr = pos

	while ptr < len
		let c = line[ptr]
		if ( c != ')') && (c != ']' )
			break
		endif

		exec "normal %"
		let pos = col(".")-1
		if ptr == pos
			break
		endif

		exec "normal %l"
		let ptr += 1
	endwhile

	if ptr == len
		return "\<Right>"
	else
		return ""
	endif

endfunction

" -------------------------------------------
setlocal autoindent

let b:current_syntax = "sdsp"

let &cpo = s:cpo_save
unlet s:cpo_save

