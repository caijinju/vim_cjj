"if exists("b:current_syntax")
"	finish
"endif

" ÉèÖÃËõ½ø
" set tabstop=4
" È¡Ïû×Ô¶¯Ëõ½ø
setlocal noautoindent
" ÉèÖÃtab
setlocal softtabstop=4

" ÔÚ²åÈëÄ£Ê½°´»Ø³µÊ±£¬×Ô¶¯²åÈëµ±Ç°×¢ÊÍÇ°µ¼·û¡£
setlocal fo+=r,o
" Ìí¼Ó×¢ÊÍ¶¨Òå£ºÓÒ¶ÔÆë¼ì²â"©§"·ûºÅ
setlocal comments+=n:©§
" Ìí¼Ó×¢ÊÍ¶¨Òå£ºÓÒ¶ÔÆë¼ì²â"©Ç"·ûºÅ
setlocal comments+=n:©Ç
" ÉèÖÃ3¶ÎÊ½×¢ÊÍ
"set comments+=sr:©Ç,m:©Ç,ex:©»		" Ôİ²â²»³É¹¦¡£


" ÉèÖÃÓï·¨¹Ø¼ü×ÖºöÂÔ´óĞ¡Ğ´
syntax	case	ignore
" ÉèÖÃÓï·¨¹Ø¼ü×Ö×é IOPort £¬°üÀ¨ÒÔÏÂ¾ßÌå×Ö·û´®£ºdata_pa,data_pb,data_pc,data_pd,data_pe
"syntax	keyword IOPort	data_pa	data_pb	data_pc	data_pd	data_pe
" ÉèÖÃÓï·¨¹Ø¼ü×Ö×é Instruction £¬°üÀ¨ÒÔÏÂ¾ßÌå×Ö·û´®£ºld,inc,adc
"syntax	keyword	Instruction	ld	inc	adc
" ÉèÖÃÓï·¨Æ¥Åä×é cjj_info £¬Æ¥Åä¿ªÍ·Îª=µÄÒ»ĞĞ
syntax	match	cjj_info	"^=.*"
" ÉèÖÃÓï·¨Æ¥Åä×é cjj_time £¬Æ¥ÅäÈÕÆÚ
syntax	match	cjj_time	"\v^\d{4}(-\d{2}){2}(\s\d{2}(:\d{2}){2})?"

" ÉèÖÃÓï·¨×é¸ßÁÁ£¬Ö±½ÓÉèÖÃÑÕÉ«
highlight IOPort ctermfg=1 guifg=red
highlight Instruction ctermfg=2 guifg=green
highlight cjj_info	gui=bold	guifg=SeaGreen	guibg=Grey
highlight cjj_time	gui=bold	guifg=DarkYellow
" ÁíÒ»ÖÖÉèÖÃÓï·¨×é¸ßÁÁ£¬Ê¹ÓÃÒÑÉèÖÃµÄ¸ßÁÁÓï·¨×é£¬Ö±½ÓÁ´½Ó¸Ã¸ßÁÁ×é¼´¿É¡£
"highlight default link	cjj_time	Pmenu

" ÉèÖÃËõĞ´
:iabbre <buffer> dd ========================================================================================  »ªÀöµÄ·Ö¸îÏß  ========================================================================================
:iabbre <buffer> ld =========================================================================================  <c-r>=strftime("%Y-%m-%d")<cr>  =========================================================================================-- °¸×Ó ---- ÆäËûÊÂÎñ --

:iabbrev <buffer> <silent> tt 0i=strftime("%Y-%m-%d %H:%M:%S") --->
" :iabbre <buffer> <silent> tt :call setline(line("."),strftime("%Y-%m-%d %H:%M:%S"))A --->
" ÓÉÓÚÉÏÃæÒÑ¾­ÉèÖÃÁË×¢ÊÍ×Ô¶¯²åÈë¹¦ÄÜ£¬ÏÂÃæ²¿·ÖËõĞ´¿ÉÒÔÉ¾³ı
" :iabbre <buffer> nn <tab>©Ç
" :iabbre <buffer> mm <tab>©§
" :iabbre <buffer> ee <tab>©»
" :iabbre <buffer> lnn <tab>©§<tab>©Ç
" :iabbre <buffer> llnn <tab>©§<tab>©§<tab>©Ç
:iabbre <buffer> nn ©Ç
:iabbre <buffer> mm ©§
:iabbre <buffer> ee ©»

" ÉèÖÃÓ³Éä
:inoremap <buffer> jk 
:inoremap <buffer> <c-d> ggVGDi
:vnoremap <buffer> <c-c> "+y
:vnoremap <buffer> <c-x> "+x
