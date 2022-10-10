## Introduction

No matter if you are a DevOps/SysOps engineer, developer, or just a Linux enthusiast, you can use Bash scripts to combine different Linux commands and automate boring and repetitive daily tasks, so that you can focus on more productive and fun things.

Here you can find the completed Bash Scripting cheat sheet 👇

## Bash Script Header (Shebang)

Option 1:

```
#!/bin/bash

```

Option 2:

```
#!/usr/bin/env bash

```

## Variables

```
#!/bin/bash
name="DevDojo"
echo "Hi there $name"

```

## User Input

```
#!/bin/bash

echo "What is your name?"
read name

echo "Hi there $name"
echo "Welcome to DevDojo!"

```

## Comments

To do that in bash you need to add the # symbol at the beginning of the line. Comments will never be rendered on the screen.

```
# This is a comment and will not be rendered on the screen

```

## Arguments

```
#!/bin/bash

echo "Argument one is $1"
echo "Argument two is $2"
echo "Argument three is $3"

```

Then run the file and pass 3 arguments:

```
bash ./arguments.sh dog cat bird

```

## Arrays

```
my_array=("value 1" "value 2" "value 3" "value 4")

# Access a single element, this would output: value 2
echo ${my_array[1]}

# This would return the last element: value 4
echo ${my_array[-1]}

# This would output the total number of elements in the array, in our case, it is 4:
echo "${#my_array[@]}"

# This would output all of the elements of the array:
printf '%s\n' "${my_array[@]}"

```

## Conditional Expressions

### File expressions

```
## True if file exists.
[[ -a ${file} ]]

## True if file exists and is a block special file.
[[ -b ${file} ]]

## True if file exists and is a character special file.
[[ -c ${file} ]]

## True if file exists and is a directory.
[[ -d ${file} ]]

## True if file exists.
[[ -e ${file} ]]

## True if file exists and is a regular file.
[[ -f ${file} ]]

## True if file exists and is a symbolic link.
[[ -h ${file} ]]

## True if file exists and is readable.
[[ -r ${file} ]]

## True if file exists and has a size greater than zero.
[[ -s ${file} ]]

## True if file exists and is writable.
[[ -w ${file} ]]

## True if file exists and is executable.
[[ -x ${file} ]]

## True if file exists and is a symbolic link.
[[ -L ${file} ]]

```

### String expressions

```
# True if the shell variable varname is set (has been assigned a value).
[[ -v ${varname} ]]

# True if the length of the string is zero.
[[ -z ${string} ]]

# True if the length of the string is non-zero.
[[ -n ${string} ]]

# True if the strings are equal. = should be used with the test command for POSIX conformance. When used with the [[ command, this performs pattern matching as described above (Compound Commands)
[[ ${string1} == ${string2} ]]

# True if the strings are not equal.
[[ ${string1} != ${string2} ]]

# True if string1 sorts before string2 lexicographically.
[[ ${string1} < ${string2} ]]

# True if string1 sorts after string2 lexicographically.
[[ ${string1} > ${string2} ]]

```

### Arithmetic operators

```
# Returns true if the numbers are equal
[[ ${arg1} -eq ${arg2} ]]

# Returns true if the numbers are not equal
[[ ${arg1} -ne ${arg2} ]]

# Returns true if arg1 is less than arg2
[[ ${arg1} -lt ${arg2} ]]

# Returns true if arg1 is less than or equal arg2
[[ ${arg1} -le ${arg2} ]]

# Returns true if arg1 is greater than arg2
[[ ${arg1} -gt ${arg2} ]]

# Returns true if arg1 is greater than or equal arg2
[[ ${arg1} -ge ${arg2} ]]

# As with other programming languages you can use AND & OR conditions:
[[ test_case_1 ]] && [[ test_case_2 ]] # And
[[ test_case_1 ]] || [[ test_case_2 ]] # Or

```

## Conditionals

```
#!/bin/bash

# Bash if statement example

read -p "What is your name? " name

if [[ -z ${name} ]]
then
    echo "Please enter your name!"
else
    echo "Hi there ${name}"
fi

```

## Loops

### For loops

```
#!/bin/bash

users="devdojo, bobby, tony"

for user in ${users}
do
    echo "${user}"
done

```

### While loops

```
#!/bin/bash

counter=1
while [[ $counter -le 10 ]]
do
    echo $counter
    ((counter++))
done

```

### Until Loops

```
#!/bin/bash

count=1
until [ $count -gt 10 ]
do
    echo $count
    ((count++))
done

```

## Functions

```
function function_name() {
    your_commands
}

```

Example

```
#!/bin/bash

function hello(){
    echo "Hello World Function!"
}

hello
```
