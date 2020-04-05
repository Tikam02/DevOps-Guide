# <a name="shell-scripting"></a>Shell Scripting

* [Need for scripting](#need-for-scripting)
* [Hello script](#hello-script)
* [Sourcing script](#sourcing-script)
* [Command Line Arguments](#command-line-arguments)
* [Variables and Comparisons](#variables-and-comparisons)
* [Accepting User Input interactively](#accepting-user-input-interactively)
* [if then else](#if-then-else)
* [for loop](#for-loop)
* [while loop](#while-loop)
* [Reading a file](#reading-file)
* [Debugging](#debugging)
* [Real world use case](#real-world-use-case)
* [Resource lists](#resource-lists)

<br>

### <a name="need-for-scripting"></a>Need for scripting

* Automate repetitive manual tasks
* Create specialized and custom commands
* [Difference between scripting and programming languages](https://stackoverflow.com/questions/17253545/scripting-language-vs-programming-language)

Note:

* `.sh` is typically used as extension for shell scripts
* Material presented here is for `GNU bash, version 4.3.11(1)-release`

<br>

### <a name="hello-script"></a>Hello script

```bash
#!/bin/bash

# Print greeting message
echo "Hello $USER"
# Print day of week
echo "Today is $(date -u +%A)"

# use single quotes for literal strings
echo 'Have a nice day'
```

The first line has two parts

* `/bin/bash` is path of `bash`
    * `type bash` to get path
* `#!` called as [shebang](https://en.wikipedia.org/wiki/Shebang_(Unix)), directs the program loader to use the interpreter path provided

Comments

* Comments start with `#`
* Comments can be placed at end of line of code as well
    * `echo 'Hello' # end of code comment`
* [Multiline comments](https://unix.stackexchange.com/questions/37411/multiline-shell-script-comments-how-does-this-work)

Single quotes vs Double quotes

* Single quotes preserves the literal value of each character within the quotes
* Double quotes preserves the literal value of all characters within the quotes, with the exception of '$', '`', '\', and, when history expansion is enabled, '!'
* [Difference between single and double quotes](https://stackoverflow.com/questions/6697753/difference-between-single-and-double-quotes-in-bash)

`echo` builtin command

* `help -d echo` Write arguments to the standard output
* By default, `echo` adds a newline and doesn't interpret backslash
* `-n` do not append a newline
* `-e` enable interpretation of the following backslash escapes
* `-E` explicitly suppress interpretation of backslash escapes
* [echo Q&A on unix stackexchange](https://unix.stackexchange.com/questions/tagged/echo?sort=votes&pageSize=15)

```bash
$ chmod +x hello_script.sh
$ ./hello_world.sh 
Hello learnbyexample
Today is Wednesday
Have a nice day
```

<br>

### <a name="sourcing-script"></a>Sourcing script

```bash
$ help -d source
source - Execute commands from a file in the current shell.
```

* If script should be executed in current shell environment instead of sub-shell, use the `.` or `source` command
    * For example, after editing `~/.bashrc` one can use `source ~/.bashrc` for changes to be immeditely effective

```bash
$ # contents of prev_cmd.sh
prev=$(fc -ln -2 | sed 's/^[ \t]*//;q')
echo "$prev"
```

* For example, to access history of current interactive shell from within script

```bash
$ printf 'hi there\n'
hi there
$ bash prev_cmd.sh 

$ printf 'hi there\n'
hi there
$ source prev_cmd.sh
printf 'hi there\n'
```

<br>

### <a name="command-line-arguments"></a>Command Line Arguments

```bash
#!/bin/bash

# Print line count of files given as command line argument
echo "No of lines in '$1' is $(wc -l < "$1")"
echo "No of lines in '$2' is $(wc -l < "$2")"
```

* Command line arguments are saved in positional variables starting with `$1 $2 $3` etc
* If a particular argument requires multiple word string, enclose them in quotes or use appropriate escape sequences
* `$0` contains the name of the script itself - useful to code different behavior based on name of script used
* `$@` array of all the command line arguments passed to script
* `$#` Number of command line arguments passed to script
* Use double quotes around variables when passing its value to another command
    * [why does my shell script choke on whitespace or other special characters?](https://unix.stackexchange.com/questions/131766/why-does-my-shell-script-choke-on-whitespace-or-other-special-characters)
* [bash special parameters reference](https://stackoverflow.com/questions/5163144/what-are-the-special-dollar-sign-shell-variables/5163260#5163260)

```bash
$ ./command_line_arguments.sh hello_script.sh test\ file.txt 
No of lines in 'hello_script.sh' is 9
No of lines in 'test file.txt' is 5
```

<br>

### <a name="variables-and-comparisons"></a>Variables and Comparisons

* `dir_path=/home/guest` space has special meaning in bash, cannot be used around = in variables
* `greeting='hello world'` use single quotes for literal strings
* `user_greeting="hello $USER"` use double quotes for substitutions
* `echo $user_greeting` use `$` when variable's value is needed
* `no_of_lines=$(wc -l < "$filename")` use double quotes around variables when passing its value to another command
* `num=534` numbers can also be declared
* `(( num = 534 ))` but using `(( ))` for numbers makes life much easier
* `(( num1 > num2 ))` number comparisons are also more readable within `(( ))`
* `[[ -e story.txt ]]` test if the file/directory exists
* `[[ $str1 == $str2 ]]` for string comparisons

**Further Reading**

* [bash arithmetic expressions](http://mywiki.wooledge.org/ArithmeticExpression)
* [how can I add numbers in a bash script?](https://stackoverflow.com/questions/6348902/how-can-i-add-numbers-in-a-bash-script)
* [difference between test, \[ and \[\[](http://mywiki.wooledge.org/BashFAQ/031)
* [Tests and Conditionals](http://mywiki.wooledge.org/BashGuide/TestsAndConditionals)
* [How to use double or single bracket, parentheses, curly braces?](https://stackoverflow.com/questions/2188199/how-to-use-double-or-single-bracket-parentheses-curly-braces)
* [Variable quoting and using braces for variable substitution](https://unix.stackexchange.com/questions/4899/var-vs-var-and-to-quote-or-not-to-quote)
* [Parameters](http://mywiki.wooledge.org/BashGuide/Parameters)
* [Parameter expansion](http://mywiki.wooledge.org/BashFAQ/073) - substitute a variable or special parameter for its value

<br>

### <a name="accepting-user-input-interactively"></a>Accepting User Input interactively

```bash
#!/bin/bash

# Get user input
echo 'Hi there! This script returns the sum of two numbers'
read -p 'Enter two numbers separated by spaces: ' number1 number2

echo -e "\n$number1 + $number2 = $((number1 + number2))"
echo 'Thank you for using the script, Have a nice day :)'
```

* `help -d read` Read a line from the standard input and split it into fields
* `-a` array assign the words read to sequential indices of the array variable ARRAY, starting at zero
* `-p` prompt output the string PROMPT without a trailing newline before attempting to read
* `-s` do not echo input coming from a terminal
* [More examples with read and getting input from stdin](http://ryanstutorials.net/bash-scripting-tutorial/bash-input.php)

```bash
$ ./user_input.sh 
Hi there! This script returns the sum of two numbers
Enter two numbers separated by spaces: 7 42

7 + 42 = 49
Thank you for using the script, Have a nice day :)
```

<br>

### <a name="if-then-else"></a>if then else

```bash
#!/bin/bash

if (( $# != 2 ))
then
    echo "Error!! Please provide two file names"
    # simple convention for exit values is '0' for success and '1' for error
    exit 1
else
    # Use ; to combine multiple commands in same line
    # -f option checks if file exists, ! negates the value
    # white-space around [[ and ]] is necessary
    if [[ ! -f $1 ]] ; then
        echo "Error!! '$1' is not a valid filename" ; exit 1
    else
        echo "No of lines in '$1' is $(wc -l < "$1")"
    fi

    # Conditional Execution
    [[ ! -f $2 ]] && echo "Error!! '$2' is not a valid filename" && exit 1
    echo "No of lines in '$2' is $(wc -l < "$2")"
fi
```

* When handling user provided arguments, it is always advisable to check the sanity of arguments. A simple check can reduce hours of frustrating debug when things go wrong
* The code inside `if [[ ! -f $1 ]] ; then` block is only intended for demonstration, we could as well have used error handling of `wc` command if file doesn't exist
* Default `exit` value is `0` , so need not be explicitly written for successful script completion
* Use `elif` if you need to test more conditions after `if`
* The operator `&&` is used to execute a command only when the preceding one successfully finishes
* To redirect error message to stderr, use `echo "Error!! Please provide two file names" 1>&2` and so on
* [Control Operators && and ||](http://mywiki.wooledge.org/BashGuide/TestsAndConditionals#Control_Operators_.28.26.26_and_.7C.7C.29)
* [More examples for if conditional block](http://mywiki.wooledge.org/BashGuide/TestsAndConditionals#Conditional_Blocks_.28if.2C_test_and_.5B.5B.29)

```bash
$ ./if_then_else.sh 
Error!! Please provide two file names
$ echo $?
1

$ ./if_then_else.sh hello_script.sh 
Error!! Please provide two file names
$ echo $?
1

$ ./if_then_else.sh hello_script.sh xyz.tzt
No of lines in 'hello_script.sh' is 9
Error!! 'xyz.tzt' is not a valid filename
$ echo $?
1

$ ./if_then_else.sh hello_script.sh 'test file.txt' 
No of lines in 'hello_script.sh' is 9
No of lines in 'test file.txt' is 5
$ echo $?
0
```

**Combining if with exit status of command executed**

Sometimes one needs to know if intended command operation was successful or not and then take action depending on outcome. Exit status of `0` is considered as successful condition when used with `if` statement. When avaiable, use appropriate options to suppress stdout/stderr of command being used, otherwise redirection might be needed to avoid cluttering output on terminal

```bash
$ grep 'echo' hello_script.sh 
echo "Hello $USER"
echo "Today is $(date -u +%A)"
echo 'Have a nice day'

$ # do not write anything to standard output
$ grep -q 'echo' hello_script.sh 
$ echo $?
0

$ grep -q 'echo' xyz.txt
grep: xyz.txt: No such file or directory
$ echo $?
2
$ # Suppress error messages about nonexistent or unreadable files
$ grep -qs 'echo' xyz.txt
$ echo $?
2
```

Example

```bash
#!/bin/bash

if grep -q 'echo' hello_script.sh ; then
    # do something
    echo "string found"
else
    # do something else
    echo "string not found"
fi
```

<br>

### <a name="for-loop"></a>for loop

```bash
#!/bin/bash

# Ensure atleast one argument is provided
(( $# == 0 )) && echo "Error!! Please provide atleast one file name" && exit 1

file_count=0
total_lines=0

# every iteration, variable file gets next positional argument
for file in "$@"
do
    # Let wc show its error message if file doesn't exist
    # terminate the script if wc command exit status is not 0
    no_of_lines=$(wc -l < "$file") || exit 1
    echo "No of lines in '$file' is $no_of_lines"
    ((file_count++))
    ((total_lines = total_lines + no_of_lines))
done

echo -e "\nTotal Number of files = $file_count"
echo "Total Number of lines = $total_lines"
```

* This form of `for` loop is useful if we need only element of an array, without having to iterate over length of an array and using an index for each iteration to get array elements
* In this example we use the control operator `||` to stop the script if `wc` fails i.e 'exit status' other than `0`

```bash
$ ./for_loop.sh 
Error!! Please provide atleast one file name
$ echo $?
1

$ ./for_loop.sh hello_script.sh if_then_else.sh command_line_arguments.sh
No of lines in 'hello_script.sh' is 9
No of lines in 'if_then_else.sh' is 21
No of lines in 'command_line_arguments.sh' is 5

Total Number of files = 3
Total Number of lines = 35
$ echo $?
0

$ ./for_loop.sh hello_script.sh xyz.tzt
No of lines in 'hello_script.sh' is 9
./for_loop.sh: line 14: xyz.tzt: No such file or directory
$ echo $?
1
```

**Index based for loop**

```bash
#!/bin/bash

# Print 0 to 4
for ((i = 0; i < 5; i++))
do
    echo $i
done
```

**Iterating over used defined array**

```bash
$ files=('report.log' 'pass_list.txt')
$ for f in "${files[@]}"; do echo "$f"; done
report.log
pass_list.txt
```

**Files specified by glob pattern**

A common mistake is to use output of `ls` command which is error prone and needless. Instead, the arguments can be directly used.

```bash
$ ls
pass_list.txt  power.log  report.txt

$ for f in power.log *.txt; do echo "$f"; done
power.log
pass_list.txt
report.txt
```

* [more examples and use of continue/break](http://ryanstutorials.net/bash-scripting-tutorial/bash-loops.php)

<br>

### <a name="while-loop"></a>while loop

```bash
#!/bin/bash

# Print 5 to 1
(( i = 5 ))
while (( i != 0 ))
do
    echo $i
    ((i--))
done
```

* Use `while` when you need to execute commands according to a specified condition

```bash
$ ./while_loop.sh 
5
4
3
2
1
```

<br>

### <a name="reading-file"></a>Reading a file

Reading line by line

```bash
#!/bin/bash

while IFS= read -r line; do
    # do something with each line
    echo "$line"
done < 'files.txt'
```

* `IFS` is used to specify field separator which is by default whitespace. `IFS=` will clear the default value and prevent stripping of leading and trailing whitespace of lines
* The `-r` option for `read` will prevent interpreting `\` escapes
* Last line from input won't be read if not properly terminated by newline character

```bash
$ cat files.txt 
hello_script.sh
if_then_else.sh
$ ./while_read_file.sh 
hello_script.sh
if_then_else.sh
```

Reading line as different fields

* By default, whitespace is delimiter
* Specify a different one by setting `IFS`

```bash
$ cat read_file_field.sh
#!/bin/bash

while IFS=: read -r genre name; do
    echo -e "$genre\t:: $name"
done < 'books.txt'
$ cat books.txt 
fantasy:Harry Potter
sci-fi:The Martian
mystery:Sherlock Holmes

$ ./read_file_field.sh 
fantasy :: Harry Potter
sci-fi  :: The Martian
mystery :: Sherlock Holmes
```

Reading 'n' characters at a time

```bash
$ while read -n1 char; do echo "Character read is: $char"; done <<< "\word"
Character read is: w
Character read is: o
Character read is: r
Character read is: d
Character read is: 

$ # if ending newline character is not desirable
$ while read -n1 char; do echo "Character read is: $char"; done < <(echo -n "hi")
Character read is: h
Character read is: i

$ while read -r -n2 chars; do echo "Characters read: $chars"; done <<< "\word"
Characters read: \w
Characters read: or
Characters read: d
```

<br>

### <a name="debugging"></a>Debugging

* `-x` Print commands and their arguments as they are executed
* `-v` verbose option, print shell input lines as they are read
* `set -xv` use this command to enable debugging from within script itself

```bash
$ bash -x hello_script.sh 
+ echo 'Hello learnbyexample'
Hello learnbyexample
++ date -u +%A
+ echo 'Today is Friday'
Today is Friday
+ echo 'Have a nice day'
Have a nice day
```

```bash
$ bash -xv hello_script.sh 
#!/bin/bash

# Print greeting message
echo "Hello $USER"
+ echo 'Hello learnbyexample'
Hello learnbyexample
# Print day of week
echo "Today is $(date -u +%A)"
date -u +%A
++ date -u +%A
+ echo 'Today is Friday'
Today is Friday

# use single quotes for literal strings
echo 'Have a nice day'
+ echo 'Have a nice day'
Have a nice day
```

<br>

### <a name="real-world-use-case"></a>Real world use case

With so much copy-paste of commands and their output involved in creating these chapters, mistakes do happen. So a script to check correctness comes in handy. Consider the below markdown file

    ## <a name="some-heading"></a>Some heading

    Some explanation

    ```bash
    $ seq 3
    1
    2
    3

    $ printf 'hi there!\n'
    hi there!
    ```

    ## <a name="another-heading"></a>Another heading

    More explanations

    ```bash
    $ help -d readarray
    readarray - Read lines from a file into an array variable.

    $ a=5
    $ printf "$a\n"
    5
    ```

* The whole file is read into an array so that index of next line to be read can be controlled dynamically
* Once a command is identified to be tested
    * the expected output is collected into a variable. Multiple lines are concatenated. Some commands do not have stdout to compare against
    * accordingly the index of next iteration is corrected
* Note that this is a sample script to demonstrate use of shell script. It is not fool-proof, doesn't have proactive check for possible errors, etc
* Be sure `eval` is being used for known commands like is the case here
* See [Parameter Expansion](http://mywiki.wooledge.org/BashGuide/Parameters#Parameter_Expansion) for examples and explanations on string processing constructs

```bash
#!/bin/bash

cb_start=0
readarray -t lines < 'sample.md'

for ((i = 0; i < ${#lines[@]}; i++)); do
    # mark start/end of command block
    # Line starting with $ to be verified only between ```bash and ``` block end
    [[ ${lines[$i]:0:7} == '```bash' ]] && ((cb_start=1)) && continue
    [[ ${lines[$i]:0:3} == '```' ]] && ((cb_start=0)) && continue

    if [[ $cb_start == 1 && ${lines[$i]:0:2} == '$ ' ]]; then
        cmd="${lines[$i]:2}"

        # collect command output lines until line starting with $ or ``` block end
        cmp_str=''
        j=1
        while [[ ${lines[$i+$j]:0:2} != '$ ' && ${lines[$i+$j]:0:3} != '```' ]]; do
            cmp_str+="${lines[$i+$j]}"
            ((j++))
        done
        ((i+=j-1))

        cmd_op=$(eval "$cmd")
        if [[ "${cmd_op//$'\n'}" == "${cmp_str//$'\n'}" ]]; then
            echo "Pass: $cmd"
        else
            echo "Fail: $cmd"
        fi
    fi
done
```

* Note how sourcing the script is helpful to take into consideration commands dependent on previous commands

```bash
$ ./verify_cmds.sh 
Pass: seq 3
Pass: printf 'hi there!\n'
Pass: help -d readarray
Pass: a=5
Fail: printf "$a\n"

$ source verify_cmds.sh 
Pass: seq 3
Pass: printf 'hi there!\n'
Pass: help -d readarray
Pass: a=5
Pass: printf "$a\n"
```

<br>

### <a name="resource-lists"></a>Resource lists

The material in this chapter is only a basic introduction

**Shell Scripting**

* [Bash Guide](http://mywiki.wooledge.org/BashGuide) - for everything related to bash and bash scripting, also has a downloadable pdf
* [ryanstutorial](http://ryanstutorials.net/bash-scripting-tutorial/) - good introductory tutorial
* [bash handbook](https://github.com/denysdovhan/bash-handbook)
* [writing shell scripts](http://linuxcommand.org/lc3_writing_shell_scripts.php)
* [snipcademy - shell scripting](http://code.snipcademy.com/tutorials/shell-scripting)
* [wikibooks - bash shell scripting](https://en.wikibooks.org/wiki/Bash_Shell_Scripting)
* [linuxconfig - Bash scripting tutorial](http://linuxconfig.org/bash-scripting-tutorial)
* [learnshell](http://www.learnshell.org/)

**Specific topics**

* [using source command to execute bash script](https://askubuntu.com/questions/661577/difference-between-and-for-running-a-script-application)
* [functions](http://ryanstutorials.net/bash-scripting-tutorial/bash-functions.php)
* Reading file(s)
    * [Reading file](http://mywiki.wooledge.org/BashFAQ/001)
    * [Loop through the lines of two files in parallel](https://unix.stackexchange.com/questions/82541/loop-through-the-lines-of-two-files-in-parallel)
* [arrays](http://mywiki.wooledge.org/BashGuide/Arrays)
* [nameref](https://unix.stackexchange.com/questions/288886/bash-array-values-like-variables-inside-loop/288894#288894)
    * also see this [FAQ](http://mywiki.wooledge.org/BashFAQ/006)
* getopts
    * [getopts tutorial](http://wiki.bash-hackers.org/howto/getopts_tutorial)
    * [wooledge - handle command-line arguments](http://mywiki.wooledge.org/BashFAQ/035)
    * [stackoverflow - getopts example](https://stackoverflow.com/questions/16483119/example-of-how-to-use-getopts-in-bash)

**Handy tools, tips and reference**

* [shellcheck](http://www.shellcheck.net/) - online static analysis tool that gives warnings and suggestions for scripts
	* See [github](https://github.com/koalaman/shellcheck) link for more info and install instructions
* [Common bash scripting issues faced by beginners](http://wiki.bash-hackers.org/scripting/newbie_traps)
* [bash FAQ](http://mywiki.wooledge.org/BashFAQ)
* [bash best Practices](http://mywiki.wooledge.org/BashGuide/Practices)
* [bash pitfalls](http://mywiki.wooledge.org/BashPitfalls)
* [Google shell style guide](https://google.github.io/styleguide/shell.xml)
* [better bash scripting](http://robertmuth.blogspot.in/2012/08/better-bash-scripting-in-15-minutes.html)
* [robust shell scripting](http://www.davidpashley.com/articles/writing-robust-shell-scripts/)
* [Bash Sheet](http://mywiki.wooledge.org/BashSheet)
* [bash reference](https://devmanual.gentoo.org/tools-reference/bash/index.html) - nicely formatted and explained well
* [bash special variables reference](https://stackoverflow.com/questions/5163144/what-are-the-special-dollar-sign-shell-variables/5163260#5163260)
* [Testing exit values in bash](http://blog.sanctum.geek.nz/testing-exit-values-bash/)


Credits: [github.com/learnbyexample/Linux_command_line](https://github.com/learnbyexample/Linux_command_line/blob/master/Shell_Scripting.md)