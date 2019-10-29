# OS commands

- [Linux Performance monitoring]()
  - [top]()
  - [ps aux]()
  - [kill]()


***************

# top
  
- Linux Top command is a performance monitoring program which is used frequently by many system administrators to monitor Linux performance and it is available under many Linux/Unix like operating systems. The top command used to dipslay all the running and active real-time processes in ordered list and updates it regularly. It display CPU usage, Memory usage, Swap Memory, Cache Size, Buffer Size, Process PID, User, Commands and much more. It also shows high memory and cpu utilization of a running processess.

- Display Processes for a Specific User

``` $ top -u root ``



### Resources:

- [Understanding the Top command on Linux](http://linuxaria.com/howto/understanding-the-top-command-on-linux)
- [30 Top Command Examples for Monitoring in Linux](https://linoxide.com/linux-command/linux-top-command-examples-screenshots/)
- [How to Read Linux Top Command Output and Uses](https://tecadmin.net/understanding-linux-top-command-results-uses/)
- [15 Practical Linux Top Command Examples]( 15 Practical Linux Top Command Examples)
- [Linux CPU Performance Monitoring Tutorial](https://www.slashroot.in/linux-cpu-performance-monitoring-tutorial)
- [20 Command Line Tools to Monitor Linux Performance](https://www.tecmint.com/command-line-tools-to-monitor-linux-performance/)
- [How to Use the Linux Top command](https://vitux.com/how-to-use-the-ubuntu-linux-top-command/)

****************

# ps

- ps displays information about a selection of the active processes.
-  provides a snapshot of the current processes along with detailed information like user id, cpu usage, memory usage, command name etc. It does not display data in real time like top or htop commands.

- To print all running processes in system

``` $ps -A ``` 

    or 

``` $ps -e ```

- The options A and e provide summarized overview of running processes. 
- To print the detailed overview, use the options f (full format) and F (extra full format)

``` $ps -ef ```

    Or

``` $ps -eF ```

- The "ps aux" command is the most frequently used command by Linux administrators.

- ps aux command options

    - a:- This option prints the running processes from all users.

    - u:- This option shows user or owner column in output.

    - x:- This option prints the processes those have not been executed from the terminal.

- Collectively the options "aux" print all the running process in system regardless from where they have been executed

- ps aux output meaning


   -  USER = user owning the process
   -  PID = process ID of the process
   -  %CPU = It is the CPU time used divided by the time the process has been running.
   -  %MEM = ratio of the process’s resident set size to the physical memory on the machine
   -  VSZ = virtual memory usage of entire process (in KiB)
   -  RSS = resident set size, the non-swapped physical memory that a task has used (in KiB)
   -  TTY = controlling tty (terminal)
   -  STAT = multi-character process state
   -  START = starting time or date of the process
   -  TIME = cumulative CPU time
   -  COMMAND = command with all its arguments

- To display all process running under the root user account, use the following command.

``` $ps -U root -u root ```

- To display all process running by a specific user account, use the following command.

``` $ps -U [UserName] -u [UserName] ```

- To display all process running under a particular group, use the following command.

``` $ps -G [Group Name] ```

- To display all process in hierarchy, we can use the following command.

``` $ps –A --forest ```

- To view only PID, USER and CMD columns, we can use the following command.

``` $ps –eo pid,user,cmd ``

- Finding the process which is using the highest memory

``` $ps –eo pid,user,%mem,cmd --sort=-%mem ```


**************************
## kill 

- In Linux and Unix when you want to stop a running process you can use the kill command via the command line interface. The kill command in it’s most basic form is pretty simple to work with, if you want to terminate a process you simply need to know the processes id number.


### Resources:

- [Understanding the kill command, and how to terminate processes in Linux](https://bencane.com/2014/04/01/understanding-the-kill-command-and-how-to-terminate-processes-in-linux/)
- 