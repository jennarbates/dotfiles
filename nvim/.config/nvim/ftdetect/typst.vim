" Detect Typst files by extension
augroup typst_ftdetect
  autocmd!
  autocmd BufRead,BufNewFile *.typ setfiletype typst
augroup END
