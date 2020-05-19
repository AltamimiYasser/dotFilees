
* `grep "text to search" fileToSearchOn`
* `grep -w  "text to search" fieToSearchon ` search the exact words.(-w option stand for whole word)
* `grep -wi "text to search" file to search` search the exact words but case-insenstive.
* `grep -win "text to search" file to search` search the exact words but case-insenstive, and give us the line number.
* `grep -win -B number "text to search" file to search` search the exact words but case-insenstive, and give us the line number. and bring the number of lines we specifed after the `-B` command (which stand for before)
* `grep -win -A number "text to search" file to search` search the exact words but case-insenstive, and give us the line number. and bring the number of lines we specifed after the `-B` command (which stand for after)
* `grep -win -C number "text to search" file to search` search the exact words but case-insenstive, and give us the line number. and bring the number of lines we specifed after the `-B` command (which stand for context -which means it is going to bring the number of lines before and after the search-)
* `grep "word to search" foldername/*` search inside a whole directory for this word
* `grep -r "word to search" folderName` will search inside a whole directory and nested directories.
* `grep -rl "word to search" folderName` will return the files names that contain this word.
* `grep -rc "word to search" folderName` will return the files names that contain this word but also give me the number of matches inside eatch file 
* `bash command | grep "search term"` will pipe the output of the command to our search.
* `bash command | grep "search term" | grep "search term"` to furhur pipe the result of the first grep.
* we can use [regural expression](regural expression) instead of the term to search for patterns
