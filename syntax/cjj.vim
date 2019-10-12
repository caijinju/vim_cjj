"if exists("b:current_syntax")
"	finish
"endif

" ��������
" set tabstop=4
" ȡ���Զ�����
setlocal noautoindent
" ����tab
setlocal softtabstop=4

" �ڲ���ģʽ���س�ʱ���Զ����뵱ǰע��ǰ������
setlocal fo+=r,o
" ���ע�Ͷ��壺�Ҷ�����"��"����
setlocal comments+=n:��
" ���ע�Ͷ��壺�Ҷ�����"��"����
setlocal comments+=n:��
" ����3��ʽע��
"set comments+=sr:��,m:��,ex:��		" �ݲⲻ�ɹ���


" �����﷨�ؼ��ֺ��Դ�Сд
syntax	case	ignore
" �����﷨�ؼ����� IOPort ���������¾����ַ�����data_pa,data_pb,data_pc,data_pd,data_pe
"syntax	keyword IOPort	data_pa	data_pb	data_pc	data_pd	data_pe
" �����﷨�ؼ����� Instruction ���������¾����ַ�����ld,inc,adc
"syntax	keyword	Instruction	ld	inc	adc
" �����﷨ƥ���� cjj_info ��ƥ�俪ͷΪ=��һ��
syntax	match	cjj_info	"^=.*"
" �����﷨ƥ���� cjj_time ��ƥ������
syntax	match	cjj_time	"\v^\d{4}(-\d{2}){2}(\s\d{2}(:\d{2}){2})?"

" �����﷨�������ֱ��������ɫ
highlight IOPort ctermfg=1 guifg=red
highlight Instruction ctermfg=2 guifg=green
highlight cjj_info	gui=bold	guifg=SeaGreen	guibg=Grey
highlight cjj_time	gui=bold	guifg=DarkYellow
" ��һ�������﷨�������ʹ�������õĸ����﷨�飬ֱ�����Ӹø����鼴�ɡ�
"highlight default link	cjj_time	Pmenu

" ������д
:iabbre <buffer> dd ========================================================================================  �����ķָ���  ========================================================================================
:iabbre <buffer> ld =========================================================================================  <c-r>=strftime("%Y-%m-%d")<cr>  =========================================================================================-- ���� ---- �������� --

:iabbrev <buffer> <silent> tt 0i=strftime("%Y-%m-%d %H:%M:%S") --->
" :iabbre <buffer> <silent> tt :call setline(line("."),strftime("%Y-%m-%d %H:%M:%S"))A --->
" ���������Ѿ�������ע���Զ����빦�ܣ����沿����д����ɾ��
" :iabbre <buffer> nn <tab>��
" :iabbre <buffer> mm <tab>��
" :iabbre <buffer> ee <tab>��
" :iabbre <buffer> lnn <tab>��<tab>��
" :iabbre <buffer> llnn <tab>��<tab>��<tab>��
:iabbre <buffer> nn ��
:iabbre <buffer> mm ��
:iabbre <buffer> ee ��

" ����ӳ��
:inoremap <buffer> jk 
:inoremap <buffer> <c-d> ggVGDi
:vnoremap <buffer> <c-c> "+y
:vnoremap <buffer> <c-x> "+x
