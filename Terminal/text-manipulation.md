# Text Manipulation

- [sort]()
- [uniq]()
- [comm]()
- [cmp]()
- [diff]()
- [tr]()
- [sed]()
- [awk]()
- [perl]()
- [cut]()
- [paste]()
- [column]()
- [pr]()


*****************************

## Sort


> sort lines of text files

> s the name implies, this command is used to sort files. How about alphabetic sort and numeric sort? Possible. How about sorting a particular column? Possible. Prioritized multiple sorting order? Possible. Randomize? Unique? Just about any sorting need is catered by this powerful command

### Options

    -R random sort
    -r reverse the sort order
    -o redirect sorted result to specified filename, very useful to sort a file inplace
    -n sort numerically
    -V version sort, aware of numbers within text
    -h sort human readable numbers like 4K, 3M, etc
    -k sort via key
    -u sort uniquely
    -b ignore leading white-spaces of a line while sorting
    -t use SEP instead of non-blank to blank transition

### Examples

    sort dir_list.txt display sorted file on standard output
    sort -bn numbers.txt -o numbers.txt sort numbers.txt numerically (ignoring leading white-spaces) and overwrite the file with sorted output
    sort -R crypto_keys.txt -o crypto_keys_random.txt sort randomly and write to new file
        shuf crypto_keys.txt -o crypto_keys_random.txt can also be used
    du -sh * | sort -h sort file/directory sizes in current directory in human readable format

```bash
$ cat ip.txt 
6.2  : 897 : bar
3.1  : 32  : foo
2.3  : 012 : bar
1.2  : 123 : xyz
```

```bash
$ # -k3,3 means from 3rd column onwards to 3rd column
$ # for ex: to sort from 2nd column till end, use -k2
$ sort -t: -k3,3 ip.txt 
2.3  : 012 : bar
6.2  : 897 : bar
3.1  : 32  : foo
1.2  : 123 : xyz
```

```bash
$ # -n option for numeric sort, check out what happens when -n is not used
$ sort -t: -k2,2n ip.txt 
2.3  : 012 : bar
3.1  : 32  : foo
1.2  : 123 : xyz
6.2  : 897 : bar
```

```bash
$ # more than one rule can be specified to resolve same values
$ sort -t: -k3,3 -k1,1rn ip.txt 
6.2  : 897 : bar
2.3  : 012 : bar
3.1  : 32  : foo
1.2  : 123 : xyz
```

### More sources
- [sort like a master](http://www.skorks.com/2010/05/sort-files-like-a-master-with-the-linux-sort-command-bash/)
- [sort Q&A on unix stackexchange](https://unix.stackexchange.com/questions/tagged/sort?sort=votes&pageSize=15)
- [sort on multiple columns using -k option](https://unix.stackexchange.com/questions/249452/unix-multiple-column-sort-issue)

## uniq

>  report or omit repeated lines

This command is more specific to recognizing duplicates. Usually requires a sorted input as the comparison is made on adjacent lines only

### Options

- -d print only duplicate lines
- -c prefix count to occurrences
- -u print only unique lines

### Examples

- sort test_list.txt | uniq outputs lines of test_list.txt in sorted order with duplicate lines removed
    - uniq <(sort test_list.txt) same command using process substitution
    - sort -u test_list.txt equivalent command
- uniq -d sorted_list.txt print only duplicate lines
- uniq -cd sorted_list.txt print only duplicate lines and prefix the line with number of times it is repeated
- uniq -u sorted_list.txt print only unique lines, repeated lines are ignored
- uniq Q&A on unix stackexchange

```bash
$ echo -e 'Blue\nRed\nGreen\nBlue\nRed\nBlack\nRed' > colors.txt 
$ uniq colors.txt 
Blue
Red
Green
Blue
Red
Black
Red

$ echo -e 'Blue\nRed\nGreen\nBlue\nRed\nBlack\nRed' | sort > sorted_colors.txt 
$ uniq sorted_colors.txt
Black
Blue
Green
Red

$ uniq -d sorted_colors.txt 
Blue
Red

$ uniq -cd sorted_colors.txt 
      2 Blue
      3 Red

$ uniq -u sorted_colors.txt 
Black
Green
```


## comm

> compare two sorted files line by line

Without any options, it prints output in three columns - lines unique to file1, line unique to file2 and lines common to both files

### Options

- -1 suppress lines unique to file1
    -2 suppress lines unique to file2
    -3 suppress lines common to both files

### Examples

- comm -23 sorted_file1.txt sorted_file2.txt print lines unique to sorted_file1.txt
    - comm -23 <(sort file1.txt) <(sort file2.txt)' same command using process substitution, if sorted input files are not available
- comm -13 sorted_file1.txt sorted_file2.txt print lines unique to sorted_file2.txt
- comm -12 sorted_file1.txt sorted_file2.txt print lines common to both files
- comm Q&A on unix stackexchange

```bash
$ echo -e 'Brown\nRed\nPurple\nBlue\nTeal\nYellow' | sort > colors_1.txt 
$ echo -e 'Red\nGreen\nBlue\nBlack\nWhite' | sort > colors_2.txt 

$ # the input files viewed side by side
$ paste colors_1.txt colors_2.txt
Blue    Black
Brown   Blue
Purple  Green
Red     Red
Teal    White
Yellow

    examples

$ # 3 column output - unique to file1, file2 and common
$ comm colors_1.txt colors_2.txt
        Black
                Blue
Brown
        Green
Purple
                Red
Teal
        White
Yellow 

$ # suppress 1 and 2 column, gives only common lines
$ comm -12 colors_1.txt colors_2.txt
Blue
Red

$ # suppress 1 and 3 column, gives lines unique to file2
$ comm -13 colors_1.txt colors_2.txt
Black
Green
White

$ # suppress 2 and 3 column, gives lines unique to file1
$ comm -23 colors_1.txt colors_2.txt
Brown
Purple
Teal
Yellow
```


## cmp

> compare two files byte by byte

Useful to compare binary files. If the two files are same, no output is displayed (exit status 0)
If there is a difference, it prints the first difference - line number and byte location (exit status 1)
Option -s allows to suppress the output, useful in scripts

```bash
$ cmp /bin/grep /bin/fgrep
/bin/grep /bin/fgrep differ: byte 25, line 1
```

- [Examples](https://www.sanfoundry.com/5-cmp-command-usage-examples-linux/)



## diff

> compare files line by line

Useful to compare old and new versions of text files
All the differences are printed, which might not be desirable if files are too long

### Options

- -s convey message when two files are same
- -y two column output
- -i ignore case while comparing
- -w ignore white-spaces
- -r recursively compare files between the two directories specified
- -q report if files differ, not the details of difference

### Examples

- diff -s test_list_mar2.txt test_list_mar3.txt compare two files
- diff -s report.log bkp/mar10/ no need to specify second filename if names are same
- diff -qr report/ bkp/mar10/report/ recursively compare files between report and bkp/mar10/report directories, filenames not matching are also specified in output
    - see this link for detailed analysis and corner cases
- diff report/ bkp/mar10/report/ | grep -w '^diff' useful trick to get only names of mismatching files (provided no mismatches contain the whole word diff at start of line)

### Further Reading

- [diff Q&A on unix stackexchange](https://unix.stackexchange.com/questions/tagged/diff?sort=votes&pageSize=15)
- [GUI diff and merge tools](http://askubuntu.com/questions/2946/what-are-some-good-gui-diff-and-merge-applications-available-for-ubuntu)


## tr

> translate or delete characters.
> The tr command in UNIX is a command line utility for translating or deleting characters. It supports a range of transformations including uppercase to lowercase, squeezing repeating characters, deleting specific characters and basic find and replace. It can be used with UNIX pipes to support more complex translation.

### Options

- -d delete the specified characters
- -c complement set of characters to be replaced


### How to Use the tr Command

The syntax for the tr command is as follows:

> tr OPTION... SET1 [SET2]


> tr accepts two sets of characters, usually with the same length, and replaces the characters of the first sets with the corresponding characters from the second set.

> A SET is basically a string of characters, including the special backslash-escaped characters.



### Examples

- tr a-z A-Z < test_list.txt convert lowercase to uppercase
- tr -d ._ < test_list.txt delete the dot and underscore characters
- tr a-z n-za-m < test_list.txt > encrypted_test_list.txt Encrypt by replacing every lowercase alphabet with 13th alphabet after it
- How to delete specific characters

```bash
echo 'clean this up' | tr -d 'up'
clean this
```

- How to squeeze repeating characters

> To squeeze repeat occurrences of characters specified in a set use the -s option. This removes repeated instances of a character. In the following example a string with too many spaces is squeezed to remove them.

```bash
echo 'too    many    spaces  here' | tr -s '[:space:]'
too many spaces here
```

- How to find and replace

> The tr tool works well for simple find and replace operations where one character should be replaced with another. The following example replaces underscores with spaces.

```bash
echo "some_url_that_I_have" | tr "_" "-"
some-url-that-I-have

```

### Read More

- [Linux tr command](https://linuxize.com/post/linux-tr-command/)
- [tr examples](https://shapeshed.com/unix-tr/)
- [Examples tecmint](https://www.tecmint.com/tr-command-examples-in-linux/)
- [8 Linux TR Command Examples](https://www.thegeekstuff.com/2012/12/linux-tr-command/)


## sed

>  stream editor for filtering and transforming text

### Options

  -  -n suppress automatic printing of pattern space
  -  -i edit files inplace (makes backup if SUFFIX supplied)
  -  -r use extended regular expressions
  -  -e add the script to the commands to be executed
  -  -f add the contents of script-file to the commands to be executed

### commands

    -   d Delete the pattern space
    -   p Print out the pattern space
    -   s search and replace


### range

> By default, sed acts on all of input contents. This can be refined to specific line number or a range defined by line numbers, search pattern or mix of the two

- n,m range between nth line to mth line, including n and m
- i~j act on ith line and i+j, i+2j, i+3j, etc
   - 1~2 means 1st, 3rd, 5th, 7th, etc lines i.e odd numbered lines
   -  5~3 means 5th, 8th, 11th, etc
- n only nth line
- $ only last line
- /pattern/ lines matching pattern
- n,/pattern/ nth line to line matching pattern
- n,+x nth line and x lines after
- /pattern/,m line matching pattern to mth line
- /pattern/,+x line matching pattern and x lines after
- /pattern1/,/pattern2/ line matching pattern1 to line matching pattern2
- /pattern/I lines matching pattern, pattern is case insensitive
    
### Examples for selective deletion(d)

- sed '/cat/d' story.txt delete every line containing cat
- sed '/cat/!d' story.txt delete every line NOT containing cat
- sed '$d' story.txt delete last line of the file
- sed '2,5d' story.txt delete lines 2,3,4,5 of the file
- sed '1,/test/d' dir_list.txt delete all lines from beginning of file to first occurrence of line containing test (the matched line is also deleted)
- sed '/test/,$d' dir_list.txt delete all lines from line containing test to end of file

### Examples for selective printing(p)

- sed -n '5p' story.txt print 5th line, -n option overrides default print behavior of sed
    - use sed '5q;d' story.txt on large files. Read more
- sed -n '/cat/p' story.txt print every line containing the text cat
    - equivalent to sed '/cat/!d' story.txt
- sed -n '4,8!p' story.txt print all lines except lines 4 to 8
- man grep | sed -n '/^\s*exit status/I,/^$/p' extract exit status information of a command from manual
    - /^\s*exit status/I checks for line starting with 'exit status' in case insensitive way, white-space may be present at start of line
    - /^$/ empty line
- man ls | sed -n '/^\s*-F/,/^$/p' extract information on command option from manual
    - /^\s*-F/ line starting with option '-F', white-space may be present at start of line

### Examples for search and replace(s)

- sed -i 's/cat/dog/g' story.txt search and replace every occurrence of cat with dog in story.txt
- sed -i.bkp 's/cat/dog/g' story.txt in addition to inplace file editing, create backup file story.txt.bkp, so that if a mistake happens, original file can be restored
    - sed -i.bkp 's/cat/dog/g' *.txt to perform operation on all files ending with .txt in current directory
- sed -i '5,10s/cat/dog/gI' story.txt search and replace every occurrence of cat (case insensitive due to modifier I) with dog in story.txt only in line numbers 5 to 10
- sed '/cat/ s/animal/mammal/g' story.txt replace animal with mammal in all lines containing cat
    - Since -i option is not used, output is displayed on standard output and story.txt is not changed
    - spacing between range and command is optional, sed '/cat/s/animal/mammal/g' story.txt can also be used
- sed -i -e 's/cat/dog/g' -e 's/lion/tiger/g' story.txt search and replace every occurrence of cat with dog and lion with tiger
    - any number of -e option can be used
    - sed -i 's/cat/dog/g ; s/lion/tiger/g' story.txt alternative syntax, spacing around ; is optional
- sed -r 's/(.*)/abc: \1 :xyz/' list.txt add prefix 'abc: ' and suffix ' :xyz' to every line of list.txt
- sed -i -r "s/(.*)/$(basename $PWD)\/\1/" dir_list.txt add current directory name and forward-slash character at the start of every line
    - Note the use of double quotes to perform command substitution
- sed -i -r "s|.*|$HOME/\0|" dir_list.txt add home directory and forward-slash at the start of every line
    - Since the value of '$HOME' itself contains forward-slash characters, we cannot use / as delimiter
    - Any character other than backslash or newline can be used as delimiter, for example | # ^ see this link for more info
    -  \0 back-reference contains entire matched string

### More sources:

- [Sed basics](http://code.snipcademy.com/tutorials/shell-scripting/sed/introduction)
- [Sed detailed tutorial](http://www.grymoire.com/Unix/Sed.html)
- [sed book](http://www.catonmat.net/blog/sed-book/)
- [sed cheatsheet](http://www.catonmat.net/download/sed.stream.editor.cheat.sheet.txt)
- [sed examples](http://how-to.linuxcareer.com/learning-linux-commands-sed)
- [one liner sed-explained](http://www.catonmat.net/series/sed-one-liners-explained)
- [Common Search and replace examples with sed](https://unix.stackexchange.com/questions/112023/how-can-i-replace-a-string-in-a-files)
- [sed Q&A on unix stackexchange](https://unix.stackexchange.com/questions/tagged/sed?sort=votes&pageSize=15)
- [sed Q&A on stackoverflow](https://stackoverflow.com/questions/tagged/sed?sort=votes&pageSize=15)


## awk

> pattern scanning and text processing language

> awk derives its name from authors Alfred Aho, Peter Weinberger and Brian Kernighan.

### syntax

- awk 'BEGIN {initialize} condition1 {stmts} condition2 {stmts}... END {finish}'
    - BEGIN {initialize} used to initialize variables (could be user defined or awk variables or both), executed once - optional block
    - condition1 {stmts} condition2 {stmts}... action performed for every line of input, condition is optional, more than one block {} can be used with/without condition
    - END {finish} perform action once at end of program - optional block
- awk ' {print $1,$3} ' > Print only columns one and three using stdin



## cut

> remove sections from each line of files

> For columns operations with well defined delimiters, cut command is handy

#### Examples

- ls -l | cut -d' ' -f1 first column of ls -l
    - -d option specifies delimiter character, in this case it is single space character (Default delimiter is TAB character)
    - -f option specifies which fields to print separated by commas, in this case field 1
- cut -d':' -f1 /etc/passwd prints first column of /etc/passwd file
- cut -d':' -f1,7 /etc/passwd prints 1st and 7th column of /etc/passwd file with : character in between
- cut -d':' --output-delimiter=' ' -f1,7 /etc/passwd use space as delimiter between 1st and 7th column while printing


## paste

> merge lines of files

#### Examples

- paste list1.txt list2.txt list3.txt > combined_list.txt combines the three files column-wise into single file, the entries separated by TAB character
- paste -d':' list1.txt list2.txt list3.txt > combined_list.txt the entries are separated by : character instead of TAB
    - See pr command for multiple character delimiter

```bash
$ # joining multiple files
$ paste -d, <(seq 5) <(seq 6 10)
1,6
2,7
3,8
4,9
5,10

$ paste -d, <(seq 3) <(seq 4 6) <(seq 7 10)
1,4,7
2,5,8
3,6,9
,,10
```

- Single column to multiple columns

```bash
$ seq 5 | paste - -
1    2
3    4
5    

$ # specifying different output delimiter, default is tab
$ seq 5 | paste -d, - -
1,2
3,4
5,

$ # if number of columns to specify is large, use the printf trick
$ seq 5 | paste $(printf -- "- %.s" {1..3})
1    2    3
4    5
```

- Combine all lines to single line

```bash
$ seq 10 | paste -sd,
1,2,3,4,5,6,7,8,9,10

$ # for multiple character delimiter, perl can be used
$ seq 10 | perl -pe 's/\n/ : / if(!eof)'
1 : 2 : 3 : 4 : 5 : 6 : 7 : 8 : 9 : 10
```


## column

> columnate lists

```bash
$ cat dishes.txt 
North alootikki baati khichdi makkiroti poha 
South appam bisibelebath dosa koottu sevai 
West dhokla khakhra modak shiro vadapav 
East handoguri litti momo rosgulla shondesh 

$ column -t dishes.txt 
North  alootikki  baati         khichdi  makkiroti  poha
South  appam      bisibelebath  dosa     koottu     sevai
West   dhokla     khakhra       modak    shiro      vadapav
East   handoguri  litti         momo     rosgulla   shondesh
```

## pr

> convert text files for printing


```bash
$ pr sample.txt 


2016-05-29 11:00                    sample.txt                    Page 1


This is an example of adding text to a new file using cat command.
Press Ctrl+d on a newline to save and quit.
Adding a line of text at end of file

```

- Options include converting text files for printing with header, footer, page numbers, double space a file, combine multiple files column wise, etc

```bash
$ # single column to multiple column, split vertically
$ # for example, in command below, output of seq is split into two
$ seq 5 | pr -2t
1                    4
2                    5
3

$ # different output delimiter can be used by passing string to -s option
$ seq 5 | pr -2ts' '
1 4
2 5
3

$ seq 15 | pr -5ts,
1,4,7,10,13
2,5,8,11,14
3,6,9,12,15
```

- Use -a option to split across

$ seq 5 | pr -2ats' : '
1 : 2
3 : 4
5

$ seq 15 | pr -5ats,
1,2,3,4,5
6,7,8,9,10
11,12,13,14,15

```


```bash
$ # use $ to expand characters denoted by escape characters like \t for tab
$ seq 5 | pr -3ts$'\t'
1    3    5
2    4

$ # or leave the argument to -s empty as tab is default
$ seq 5 | pr -3ts
1    3    5
2    4

```

- The default PAGE_WIDTH is 72
- The formula (col-1)*len(delimiter) + col seems to work in determining minimum PAGE_WIDTH required for multiple column output
- The -J option will help in turning off line truncation

```bash
$ seq 74 | pr -36ats,
1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36
37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72
73,74
$ seq 74 | pr -37ats,
pr: page width too narrow

$ # (37-1)*1 + 37 = 73
$ seq 74 | pr -Jw 73 -37ats,
1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37
38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74

$ # (3-1)*4 + 3 = 11
$ seq 6 | pr -Jw 10 -3ats'::::'
pr: page width too narrow
$ seq 6 | pr -Jw 11 -3ats'::::'
1::::2::::3
4::::5::::6
```

- Use -m option to combine multiple files in parallel

```bash
$ pr -mts', ' <(seq 3) <(seq 4 6) <(seq 7 9)
1, 4, 7
2, 5, 8
3, 6, 9


```



### Further Reading

- [awk basics](http://code.snipcademy.com/tutorials/shell-scripting/awk/introduction)
- [Gawk: Effective AWK Programming](https://www.gnu.org/software/gawk/manual/)
- [awk detailed tutorial](http://www.grymoire.com/Unix/Awk.html)
- [basic tutorials for grep, awk, sed](https://unix.stackexchange.com/questions/2434/is-there-a-basic-tutorial-for-grep-awk-and-sed)
- [awk one-liners explained](http://www.catonmat.net/series/awk-one-liners-explained)
- [awk book](http://www.catonmat.net/blog/awk-book/)
- [awk cheat-sheet for awk variables, statements, functions, etc](http://www.catonmat.net/download/awk.cheat.sheet.txt)
- [awk examples](http://www.thegeekstuff.com/tag/unix-awk-examples/)
- [awk Q&A on unix stackexchange](https://unix.stackexchange.com/questions/tagged/awk?sort=votes&pageSize=15)
- [awk Q&A on stackoverflow](https://stackoverflow.com/questions/tagged/awk?sort=votes&pageSize=15)

## Original Contents, Credits and Refrences

- [Command line text processing -  Sundeep Agarwal learnbyexample ](https://learnbyexample.gitbooks.io/command-line-text-processing/content/)

- [More contents for text manipulation](https://learnbyexample.github.io/)

- [Command-line-text-processing](https://github.com/learnbyexample/Command-line-text-processing) 