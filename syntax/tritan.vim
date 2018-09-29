"if exists("b:current_syntax")
"	finish
"endif

" 设置语法关键字忽略大小写
syntax	case	ignore
" 设置语法关键字组 IOPort ，包括以下具体字符串：data_pa,data_pb,data_pc,data_pd,data_pe
syntax	keyword IOPort	STATUS
syntax	keyword IOPort	IOC_PA
syntax	keyword IOPort	IOC_PB
syntax	keyword IOPort	IOC_PD
syntax	keyword IOPort	IOC_PCE
syntax	keyword IOPort	DATA_PA
syntax	keyword IOPort	DATA_PB
syntax	keyword IOPort	DATA_PC
syntax	keyword IOPort	DATA_PD
syntax	keyword IOPort	DATA_PE
syntax	keyword IOPort	DATA_PCE
syntax	keyword IOPort	AUD_DLL
syntax	keyword IOPort	AUD_DL
syntax	keyword IOPort	AUD_DH
syntax	keyword IOPort	IADJ
syntax	keyword IOPort	CNTI
syntax	keyword IOPort	DMA0
syntax	keyword IOPort	DMA1
syntax	keyword IOPort	DMA2
syntax	keyword IOPort	DMA3
syntax	keyword IOPort	DMA4
syntax	keyword IOPort	DMA5
syntax	keyword IOPort	DMDH
syntax	keyword IOPort	DMDL
syntax	keyword IOPort	MUL_AH
syntax	keyword IOPort	MUL_AL
syntax	keyword IOPort	MUL_BH
syntax	keyword IOPort	MUL_BL
syntax	keyword IOPort	MUL_R0
syntax	keyword IOPort	MUL_R1
syntax	keyword IOPort	MUL_R2
syntax	keyword IOPort	MUL_R3
syntax	keyword IOPort	MUL_R4
syntax	keyword IOPort	PWM_CLK
syntax	keyword IOPort	PWM_CTRL
syntax	keyword IOPort	PWM_DH
syntax	keyword IOPort	PWM_DL
syntax	keyword IOPort	SYS0
syntax	keyword IOPort	WATCH

" 设置语法关键字组 Keywords
syntax	keyword Keywords	A
syntax	keyword Keywords	C
syntax	keyword Keywords	DB
syntax	keyword Keywords	DPLA
syntax	keyword Keywords	DW
syntax	keyword Keywords	ENDM
syntax	keyword Keywords	EQU
syntax	keyword Keywords	ITZU
syntax	keyword Keywords	LINKDATA
syntax	keyword Keywords	LINKENV
syntax	keyword Keywords	LINKMELODY
syntax	keyword Keywords	LINKFORMAT
syntax	keyword Keywords	LINKORG
syntax	keyword Keywords	MACRO
syntax	keyword Keywords	MAH
syntax	keyword Keywords	ROMNAME
syntax	keyword Keywords	ROMSIZE
syntax	keyword Keywords	ORG
syntax	keyword Keywords	SIGN
syntax	keyword Keywords	UNSIGN

" 设置语法关键字组 Instruction ，包括以下具体字符串：ld,inc,adc
syntax	keyword Operators	ADR
syntax	keyword Operators	ADC
syntax	keyword Operators	AND
syntax	keyword Operators	CALL
syntax	keyword Operators	CLR
syntax	keyword Operators	CMP
syntax	keyword Operators	DEC
syntax	keyword Operators	HALT
syntax	keyword Operators	INC
syntax	keyword Operators	JC
syntax	keyword Operators	JMP
syntax	keyword Operators	JNC
syntax	keyword Operators	JNZ
syntax	keyword Operators	JZ
syntax	keyword Operators	LD
syntax	keyword Operators	LDMAH
syntax	keyword Operators	LDPCH
syntax	keyword Operators	NOP
syntax	keyword Operators	OR
syntax	keyword Operators	RETI
syntax	keyword Operators	RETS
syntax	keyword Operators	RLC
syntax	keyword Operators	RRC
syntax	keyword Operators	SBC
syntax	keyword Operators	SET
syntax	keyword Operators	XOR

" 设置语法匹配组 lineComment ，匹配注释
syntax	match	lineComment	"\v;.*"
" 设置语法匹配组 Numbers ，匹配数字
syntax	match	Numbers		"\v<\d[0-9a-f]*([hb])?>"

" 设置语法匹配组 cjj_info ，匹配开头为=的一行
syntax	match	cjj_info	"^=.*"

" 设置语法匹配组 cjj_const，匹配常量，以_开头
syntax	match	cjj_const	"\v<_\w*"

" 设置语法匹配组 trString，匹配字符串
syntax	match	trString	"\".*\""ms=s+1,me=e-1

" 设置语法匹配组 trLabel，匹配Label
syntax	match	trLabel		"^\s*[a-zA-Z_][a-zA-Z0-9_]*\s*:"me=e-1

" 设置语法组高亮，直接设置颜色
highlight IOPort 	guifg=Orange
highlight Keywords	guifg=LightMagenta
highlight Operators	guifg=#ff00ff
highlight default link	trString	string
highlight default link	trLabel		Function
"highlight cjj_const	guifg=DarkYellow	gui=bold
highlight cjj_info	guifg=DarkMagenta	guibg=Grey	gui=bold
highlight default link	lineComment	Comment
highlight cjj_const	guifg=DarkYellow
highlight Numbers	guifg=Green

inoremap jk 

setlocal laststatus=2

" -------------------------------------------
inoremap <buffer> ( ()<Left>
inoremap <buffer> ) <c-r>=Cjj_closePair(')')<cr>
function! Cjj_closePair(char)
	if (getline(".")[col(".")-1]==a:char)
		return "\<Right>"
	else
		return a:char
	endif
endfunction

" -------------------------------------------
inoremap <buffer> <cr> <c-r>=Cjj_endPair()<cr>

function! Cjj_endPair()
	if (getline(".")[col(".")-1] == ')')
		return "\<Right>"
	else
		return "\<cr>"
	endif
endfunction



" -------------------------------------------
setlocal autoindent

