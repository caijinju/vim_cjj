"if exists("b:current_syntax")
"	finish
"endif

" 设置缩进
" set tabstop=4
" 取消自动缩进
setlocal noautoindent
" 设置tab
setlocal softtabstop=4

" 在插入模式按回车时，自动插入当前注释前导符。
setlocal fo+=r,o
" 添加注释定义：右对齐检测"┃"符号
setlocal comments+=n:┃
" 添加注释定义：右对齐检测"┣"符号
setlocal comments+=n:┣
" 设置3段式注释
"set comments+=sr:┣,m:┣,ex:┗		" 暂测不成功。


" 设置语法关键字忽略大小写
syntax	case	ignore
" 设置语法关键字组 IOPort ，包括以下具体字符串：data_pa,data_pb,data_pc,data_pd,data_pe
"syntax	keyword IOPort	data_pa	data_pb	data_pc	data_pd	data_pe
" 设置语法关键字组 Instruction ，包括以下具体字符串：ld,inc,adc
"syntax	keyword	Instruction	ld	inc	adc
" 设置语法匹配组 cjj_info ，匹配开头为=的一行
syntax	match	cjj_info	"^=.*"
" 设置语法匹配组 cjj_time ，匹配日期
syntax	match	cjj_time	"\v^\d{4}(-\d{2}){2}(\s\d{2}(:\d{2}){2})?"

" 设置语法组高亮，直接设置颜色
highlight IOPort ctermfg=1 guifg=red
highlight Instruction ctermfg=2 guifg=green
highlight cjj_info	gui=bold	guifg=SeaGreen	guibg=Grey
highlight cjj_time	gui=bold	guifg=DarkYellow
" 另一种设置语法组高亮，使用已设置的高亮语法组，直接链接该高亮组即可。
"highlight default link	cjj_time	Pmenu

" 设置缩写
:iabbre <buffer> dd ========================================================================================  华丽的分割线  ========================================================================================
:iabbre <buffer> ld =========================================================================================  <c-r>=strftime("%Y-%m-%d")<cr>  =========================================================================================-- 案子 ---- 其他事务 --

:iabbrev <buffer> <silent> tt 0i=strftime("%Y-%m-%d %H:%M:%S") --->
" :iabbre <buffer> <silent> tt :call setline(line("."),strftime("%Y-%m-%d %H:%M:%S"))A --->
" 由于上面已经设置了注释自动插入功能，下面部分缩写可以删除
" :iabbre <buffer> nn <tab>┣
" :iabbre <buffer> mm <tab>┃
" :iabbre <buffer> ee <tab>┗
" :iabbre <buffer> lnn <tab>┃<tab>┣
" :iabbre <buffer> llnn <tab>┃<tab>┃<tab>┣
:iabbre <buffer> nn ┣
:iabbre <buffer> mm ┃
:iabbre <buffer> ee ┗

" 设置映射
:inoremap <buffer> jk 
:inoremap <buffer> <c-d> ggVGDi
:vnoremap <buffer> <c-c> "+y
:vnoremap <buffer> <c-x> "+x
