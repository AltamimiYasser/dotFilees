
* `s` stands for supsitute

1. `sed 's/t/T' text.txt` will show the file and replace every first `t` in a line wiht a `T`
2. `sed 's/t/T/g' text.txt` will show the file and replace every `t` with a `T`
3. `sed 's/t/T/g' text.txt > new.txt` will create a new file with every `t` changed to `T`.
4. `sed -i 's/t/T/G' text.txt` will change the file to have every `t` replaced with `T`
5. `sed 's/^t/T/g' text.txt` this will change the `t` to `T` if it is at the begininng of a line. (`^` stands for begininng of line)
6. `sed 's/$t/T/g' text.txt` this will change the `t` to `T` if it is at the end of the line. (`$` stands for end of line)
7. `sed 's/[0-9]/*' text.txt` will change every number to `*`
8. `sed 's/[a-z]/*' text.txt` will change every small letter to `*`. (this would be the same if we put `[A-Z]` as it will replace every capital letter with `*`).
9. `sed 's/[a-z][A-z]/*/g text.txt'` will change every small letter followed by a captial letter to `*`.
10. `sed 's/[a-zA-z]/*/g text.txt'` will change every letter to `*`. (we can make it simpler by just using `[A-z]`) and this will do the same thing. (this works but `[a-Z]` doesn't wokr because in *ASCi* capital letters comes first)
11. if we do `[0-z]` it will replace all letters and numbers. (simply it will take the range in which the *ASCI* character is in)
12. relizing the above, we can do for example `[m-y]` and it will replace all letters between these two
13. the ranges are inclusive.
14. if we put two `[][]` it will pick a pattern between those ranges. (meaning if we do `[a-z][0-9]` it will pick any sequnce when there is a small letter follwed by a number), (if we want to use more than one range then we should use`[a-z0-9]` without spaces).
15. if we do `sed s/t//g text.txt` this will remove all `t` from the file because we didn't put anything to supstitute with.
16. if we do `sed s/[0-9]/(&) txt` it will put `()` around every number in our text. (but the problem with that is if we have for example `10` then it will do like this `(1)(0)`). (the `&` stands for matching character)
17. if we do `sed 's/[0-9][0-9]*/(&)'` it will replace any one digit or two digits characters with `(number)`.
