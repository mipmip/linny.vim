call linny#Init()

"TODO deprecation
"let g:linny_dirs_root = '/Users/pim/Sys/linny-projects-dirs'
"let g:awkMissingFrontMatterCommand = "/usr/bin/awk 'FNR>1 {nextfile} /---/ { nextfile  } {print FILENAME". '"' . "|0| missing Front Matter" . '"' . "}' ".g:linny_root_path."/wiki/*.md"
"command! LinnyMissingFrontMatter :cexpr system(g:awkMissingFrontMatterCommand)

command! -nargs=+ LinnyGrep :call linny#grep(<f-args>)
command! -nargs=+ LinnyDoc :call linny_menu#new_document_in_leaf(<f-args>)

command! LinnyMenuOpen :call linny_menu#open()
command! LinnyMenuClose :call linny_menu#close()

" VALIDATE Linny Links
augroup MarkdownTasks
  autocmd BufEnter,WinEnter,BufWinEnter *.md call linny_wiki#FindNonExistingLinks()
augroup END

call linny#RegisterLinnyWikitag('FILE',   'linny_wikitags#file',  'linny_wikitags#file')
call linny#RegisterLinnyWikitag('DIR',    'linny_wikitags#dir1st','linny_wikitags#dir2nd')
call linny#RegisterLinnyWikitag('SHELL',  'linny_wikitags#shell', 'linny_wikitags#shell')
call linny#RegisterLinnyWikitag('LIN',    'linny_wikitags#linny', 'linny_wikitags#linny')
call linny#RegisterLinnyWikitag('VIM',    'linny_wikitags#vim',   'linny_wikitags#vim')
