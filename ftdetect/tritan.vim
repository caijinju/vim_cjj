autocmd BufRead,BufNewFile if b:current_syntax == "asm" | set filetype=tritan | endif
autocmd BufRead,BufNewFile *.asm set filetype=tritan
