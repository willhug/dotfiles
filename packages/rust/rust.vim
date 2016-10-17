setlocal tags=./rusty-tags.vi;/
autocmd BufWrite *.rs :silent exec "!rusty-tags vi -q --start-dir=" . expand('%:p:h') . "&"
setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi
