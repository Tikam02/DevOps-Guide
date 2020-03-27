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


## cat


## Original Contents, Credits and Refrences

- [Command line text processing -  Sundeep Agarwal learnbyexample ](https://learnbyexample.gitbooks.io/command-line-text-processing/content/)

- [More contents for text manipulation](https://learnbyexample.github.io/)

- [Command-line-text-processing](https://github.com/learnbyexample/Command-line-text-processing)