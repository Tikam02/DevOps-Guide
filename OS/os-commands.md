# OS commands

- [Linux Performance monitoring]()
  - [top](#top)
  - [ps aux](#ps)
  - [kill](#kill)
  - [df](#df)
  - [ss](#ss)
  - [lsof](#lsof)

***************

# top
  
- Linux Top command is a performance monitoring program which is used frequently by many system administrators to monitor Linux performance and it is available under many Linux/Unix like operating systems. The top command used to dipslay all the running and active real-time processes in ordered list and updates it regularly. It display CPU usage, Memory usage, Swap Memory, Cache Size, Buffer Size, Process PID, User, Commands and much more. It also shows high memory and cpu utilization of a running processess.

- Display Processes for a Specific User

``` $ top -u root ```



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

``` $ps –eo pid,user,cmd ```

- Finding the process which is using the highest memory

``` $ps –eo pid,user,%mem,cmd --sort=-%mem ```


**************************
## kill 

- In Linux and Unix when you want to stop a running process you can use the kill command via the command line interface. The kill command in it’s most basic form is pretty simple to work with, if you want to terminate a process you simply need to know the processes id number.

- Finding the PID of a running process

- To find the process id or PID of a running process we will use the ps command. This command will list running processes and some information about those processes. The ps command has many options and many methods of showing processes; I could dedicate an article just to ps. For this example, I am just going to use the ps command with the -C flag, this flag can be used to lookup a process by the name of the command thats being run.


``` $ps -C <command> ```

```bash
# ps -C nginx
      PID TTY          TIME CMD
      566 ?        00:00:00 nginx
      567 ?        00:00:00 nginx
      568 ?        00:00:06 nginx
      570 ?        00:00:06 nginx
      571 ?        00:00:06 nginx
```

- Killing a process with kill

- Now that we have found the PID of the process we want to stop, we can use the kill command to terminate the process.

- Syntax:

``` $ kill <pid> ```


```bash
    root:/# ps -C nginx
      PID TTY          TIME CMD
      566 ?        00:00:00 nginx
      567 ?        00:00:00 nginx
      568 ?        00:00:08 nginx
      570 ?        00:00:09 nginx
      571 ?        00:00:08 nginx
    root:/# kill 571
    root:/# ps -C nginx
      PID TTY          TIME CMD
      566 ?        00:00:00 nginx
      567 ?        00:00:00 nginx
      568 ?        00:00:08 nginx
      570 ?        00:00:09 nginx
     8347 ?        00:00:00 nginx
```

- Detailed tutorial on resources links.




### Resources:

- [Understanding the kill command, and how to terminate processes in Linux](https://bencane.com/2014/04/01/understanding-the-kill-command-and-how-to-terminate-processes-in-linux/)
- [A Guide to Kill, Pkill and Killall Commands to Terminate a Process in Linux](https://www.tecmint.com/how-to-kill-a-process-in-linux/)
- [How To Use ps, kill, and nice to Manage Processes in Linux](https://www.digitalocean.com/community/tutorials/how-to-use-ps-kill-and-nice-to-manage-processes-in-linux)
- [Linux / Unix: killall Command Examples](https://www.cyberciti.biz/faq/unix-linux-killall-command-examples-usage-syntax/)

**************************
## df 

- `df` (abbreviated disk **d**isk **f**ree) is a standard Unix command used to display the amount of available disk space for file systems on which the invoking user has appropriate write access.
- `df` for Unix-like and Linux systems is a part of X/Open portability guide since issue 2 of 1987.
- Syntax:

```$ df```

```bash
Filesystem    1024-blocks      Free %Used    Iused %Iused Mounted on
/dev/hd4            32768     16016   52%     2271    14% /
/dev/hd2          4587520   1889420   59%    37791     4% /usr
/dev/hd9var         65536     12032   82%      518     4% /var
/dev/hd3           819200    637832   23%     1829     1% /tmp
/dev/hd1           524288    395848   25%      421     1% /home
/proc                   -         -    -         -     -  /proc
/dev/hd10opt        65536     26004   61%      654     4% /opt
```

- To get a more readable format we can pass the `-h` argument which displays in more human readable formats like `KB, MB, GB, or TB`

`$ df -h or df --human-redable`

```
Filesystem      Size  Used Avail Use% Mounted on
/dev/root       3.0G  2.3G  720M  77% /
devtmpfs        123M     0  123M   0% /dev
```

- Other useful arguments include
  - `-a or --all`: List all dummy, duplicate, or inaccessible files which are ommited by default.
  - `-k`: Use 1024-byte units, instead of default 512-byte units, when writing large figures.
  - `-P or --portabilty`: Use a POSIX portable output format, when writing to files.
  - `-t fstype or --type=fstype`: Limit the listing of the fstype. By default nothing is ommited.

### Resources:

- [Manual Page from GNU Coreutils](https://www.gnu.org/software/coreutils/manual/html_node/df-invocation.html)
- [Linux General Commands Manual](https://www.mankier.com/1/df)
- [FreeBSD General Commands Manual](https://www.freebsd.org/cgi/man.cgi?query=df&sektion=1)
- [df commands examples](https://www.tecmint.com/how-to-check-disk-space-in-linux/)

---

## ss

* The `ss` command is a tool used to dump socket statistics and display information in a similar fashion as `netstat`.
* The `ss` command can display stats for `PACKETS, TCP, UDP, DCCP, RAW` and `Unix Domain Sockets`.
* Usage:
  * `$ ss` will list all the connections regardless of the state they are in.
  * `$ ss -a` will list all the listening and not listening ports.
  * `$ ss -l` will display only the listening ports.
  * `$ ss -t` will display only the TCP connections.
  * `$ ss -lt` will display the listening TCP ports.
  * `$ ss -ua` will display all the UDP ports.
  * `$ ss -lu` will display all the listening UDP ports.
  * `$ ss -p` will display all the PID (Process IDs) of the sockets.
  * `$ ss -s` will display all the summary statistics.
  * `$ ss -4` and `$ ss -6` will display the ipv4 and ipv6 connections respectively.
  * `$ ss  -at '(dport = :22 or sport = :22)'`, will filter all socket connections with a given destination port (dport) and source port (sport).
  * alternatively `$ ss  -at '(dport = :ssh or sport = :ssh)'`, will filter all socket connections with a given destination port (dport) and source port (sport), but here the port is given as a service.

### Resources

- [linux.com's ss resource](https://www.linux.com/topic/networking/introduction-ss-command/)
- [techmint's ss resource](https://www.tecmint.com/ss-command-examples-in-linux/)

**************************

# lsof

* lsof is a command meaning `list open files`, which is used in many Unix-like systems to report a list of all open files and the processes that opened them.
* In linux/unix, everything is treated as files (pipes, sockets, directories, devices etc). Hence `lsof` is very handy tool in analyzing these resources.
* Usage:
  * `$ lsof` will list all open files.
  * `$ lsof -u username` will list files opened by specific user.
  * `$ lsof -i TCP:22` will list processes running on specific port.
  * `$ lsof -i 4` or `$ lsof -i 6` will list IPv4 and IPv6 network files.
  * `$ lsof -i TCP:1-1024` will list processes running on specific range of port.
  * `$ lsof -i -u^username` will list open files not owned by specific user.
  * `$ lsof -i` will shows the list of all network connections `LISTENING & ESTABLISHED`.
  * `$ lsof -p 1` will show open files owned by specific process id.
  * `$ lsof -c process-name` will list out all the files opened by a particular process.

### Resources

- [lsof wikipedia](https://en.wikipedia.org/wiki/Lsof)
- [lsof tecmint doc](https://www.tecmint.com/10-lsof-command-examples-in-linux/)
- [lsof geeksforgeeks doc](https://www.geeksforgeeks.org/lsof-command-in-linux-with-examples/)
- [lsof man page](https://man7.org/linux/man-pages/man8/lsof.8.html)

