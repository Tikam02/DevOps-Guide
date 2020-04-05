# Shell Scripting


### What is Shell?

> Quoting from wikipedia

    A Unix shell is a command-line interpreter or shell that provides a traditional Unix-like command line user interface. Users direct the operation of the computer by entering commands as text for a command line interpreter to execute, or by creating text scripts of one or more such commands. Users typically interact with a Unix shell using a terminal emulator, however, direct operation via serial hardware connections, or networking session, are common for server systems. All Unix shells provide filename wildcarding, piping, here documents, command substitution, variables and control structures for condition-testing and iteration

- Interprets user commands
    - from terminal, from a file or as a shell script
    - expand wildcards, command/variable substitution
- Command history, command completion and command editing
- Managing processes
- Shell variables to customize the environment
- Difference between shell, tty and console


### Popular Shells

> Like any indispensible software, Shell has undergone transformation from the days of basic sh shell that was used in 1970s Unix. While bash is default shell in most distros and most commonly used, powerful and feature rich shells are still being developed and released

- sh bourne shell (light weight Linux distros might come with sh shell only)
- bash bourne again shell
- csh C shell
- tcsh tenex C shell
- ksh Korn shell
- zsh Z shell (bourne shell with improvements, including features from bash, tcsh, ksh)
- cat /etc/shells displays list of login shells available in the current Linux distro
- echo $SHELL path of current user's login shell


### Further Reading

- [Comparison of command shells](https://en.wikipedia.org/wiki/Comparison_of_command_shells)
- [Features and differences between various shells](http://www.faqs.org/faqs/unix-faq/shell/shell-differences/)
- [syntax comparison on different shells with examples](http://hyperpolyglot.org/unix-shells)
- [bash shell has also been ported on Windows platform]()
    - [git bash](https://git-for-windows.github.io/)
    - [Cygwin](https://www.cygwin.com/)
    - [MinGW](http://www.mingw.org/)
    - [Linux Subsystem for Windows](http://www.howtogeek.com/249966/how-to-install-and-use-the-linux-bash-shell-on-windows-10/)
- [Shell, choosing shell and changing default shells](https://wiki.ubuntu.com/ChangingShells)



 
## [Shell Customization](https://learnbyexample.gitbooks.io/linux-command-line/content/Shell_Customization.html)

- [Variables](https://learnbyexample.gitbooks.io/linux-command-line/content/Shell_Customization.html#variables)
- [Config files](https://learnbyexample.gitbooks.io/linux-command-line/content/Shell_Customization.html#config-files)
- [Emac mode Readline shortcuts](https://learnbyexample.gitbooks.io/linux-command-line/content/Shell_Customization.html#emac-mode-readline-shortcuts)



## Original Content and Authors

- [Shell - learnbyexample.gitbooks.io](https://learnbyexample.gitbooks.io/linux-command-line/content/Shell.html)
- [github.com/learnbyexample/Linux_command_line](https://github.com/learnbyexample/Linux_command_line/blob/master/Shell_Scripting.md) - Shell Scripting Cheatsheet