## OS Concepts for DevOps
*******************

- [OS Concepts for DevOps](#os-concepts-for-devops)
- [Operating System](#operating-system)
- [Boot Process](#boot-process)
  - [System startup](#system-startup)
  - [Stage 1 boot loader](#stage-1-boot-loader)
  - [Stage 2 boot loader](#stage-2-boot-loader)
  - [Kernel](#kernel)
  - [Init](#init)
- [Resources:](#resources)
- [Process and Process Management](#process-and-process-management)
  - [Resources:](#resources-1)
- [Linux Signals](#linux-signals)
- [Threads and Concurrency](#threads-and-concurrency)
- [References:](#references)

*********************
## Operating System

But first, let’s define what an operating system is. An Operating System (OS) is a collection of software that manages computer hardware and provides services for programs. Specifically, it hides hardware complexity, manages computational resources, and provides isolation and protection. Most importantly, it directly has privilege access to the underlying hardware. Major components of an OS are file system, scheduler, and device driver. You probably have used both Desktop (Windows, Mac, Linux) and Embedded (Android, iOS) operating systems before.

There are 3 key elements of an operating system, which are: (1) Abstractions (process, thread, file, socket, memory), (2) Mechanisms (create, schedule, open, write, allocate), and (3) Policies (LRU, EDF)

There are 2 operating system design principles, which are: (1) Separation of mechanism and policy by implementing flexible mechanisms to support policies, and (2) Optimize for common case: Where will the OS be used? What will the user want to execute on that machine? What are the workload requirements?

The 3 types of Operating Systems commonly used nowadays are: (1) Monolithic OS, where the entire OS is working in kernel space and is alone in supervisor mode; (2) Modular OS, in which some part of the system core will be located in independent files called modules that can be added to the system at run time; and (3) Micro OS, where the kernel is broken down into separate processes, known as servers. Some of the servers run in kernel space and some run in user-space.

**************

## Boot Process

![alt text](https://github.com/Tikam02/DevOps_Cheatsheet/blob/master/img/linux-boot_1.gif)

- When a system is first booted, or is reset, the processor executes code at a well-known location. In a personal computer (PC), this location is in the basic input/output system (BIOS), which is stored in flash memory on the motherboard. The central processing unit (CPU) in an embedded system invokes the reset vector to start a program at a known address in flash/ROM. In either case, the result is the same. Because PCs offer so much flexibility, the BIOS must determine which devices are candidates for boot. 


- When a boot device is found, the first-stage boot loader is loaded into RAM and executed. This boot loader is less than 512 bytes in length (a single sector), and its job is to load the second-stage boot loader.

- When the second-stage boot loader is in RAM and executing, a splash screen is commonly displayed, and Linux and an optional initial RAM disk (temporary root file system) are loaded into memory. When the images are loaded, the second-stage boot loader passes control to the kernel image and the kernel is decompressed and initialized. At this stage, the second-stage boot loader checks the system hardware, enumerates the attached hardware devices, mounts the root device, and then loads the necessary kernel modules. When complete, the first user-space program (init) starts, and high-level system initialization is performed.

### System startup
 - The system startup stage depends on the hardware that Linux is being booted on. On an embedded platform, a bootstrap environment is used when the system is powered on, or reset. Examples include U-Boot, RedBoot, and MicroMonitor from Lucent. Embedded platforms are commonly shipped with a boot monitor. These programs reside in special region of flash memory on the target hardware and provide the means to download a Linux kernel image into flash memory and subsequently execute it. In addition to having the ability to store and boot a Linux image, these boot monitors perform some level of system test and hardware initialization. In an embedded target, these boot monitors commonly cover both the first- and second-stage boot loaders.

- In a PC, booting Linux begins in the BIOS at address 0xFFFF0. The first step of the BIOS is the power-on self test (POST). The job of the POST is to perform a check of the hardware. The second step of the BIOS is local device enumeration and initialization.

- Given the different uses of BIOS functions, the BIOS is made up of two parts: the POST code and runtime services. After the POST is complete, it is flushed from memory, but the BIOS runtime services remain and are available to the target operating system.

- To boot an operating system, the BIOS runtime searches for devices that are both active and bootable in the order of preference defined by the complementary metal oxide semiconductor (CMOS) settings. A boot device can be a floppy disk, a CD-ROM, a partition on a hard disk, a device on the network, or even a USB flash memory stick.

- Commonly, Linux is booted from a hard disk, where the Master Boot Record (MBR) contains the primary boot loader. The MBR is a 512-byte sector, located in the first sector on the disk (sector 1 of cylinder 0, head 0). After the MBR is loaded into RAM, the BIOS yields control to it.

### Stage 1 boot loader

- The primary boot loader that resides in the MBR is a 512-byte image containing both program code and a small partition table (see Figure 2). The first 446 bytes are the primary boot loader, which contains both executable code and error message text. The next sixty-four bytes are the partition table, which contains a record for each of four partitions (sixteen bytes each). The MBR ends with two bytes that are defined as the magic number (0xAA55). The magic number serves as a validation check of the MB

![alt text](https://github.com/Tikam02/DevOps_Cheatsheet/blob/master/img/1st_stage_bootloader.gif)


- The job of the primary boot loader is to find and load the secondary boot loader (stage 2). It does this by looking through the partition table for an active partition. When it finds an active partition, it scans the remaining partitions in the table to ensure that they’re all inactive. When this is verified, the active partition’s boot record is read from the device into RAM and executed.


### Stage 2 boot loader

- The secondary, or second-stage, boot loader could be more aptly called the kernel loader. The task at this stage is to load the Linux kernel and optional initial RAM disk

- The first- and second-stage boot loaders combined are called Linux Loader (LILO) or GRand Unified Bootloader (GRUB) in the x86 PC environment. Because LILO has some disadvantages that were corrected in GRUB, let’s look into GRUB. (See many additional resources on GRUB, LILO, and related topics in the Resources section later in this article.)

- The great thing about GRUB is that it includes knowledge of Linux file systems. Instead of using raw sectors on the disk, as LILO does, GRUB can load a Linux kernel from an ext2 or ext3 file system. It does this by making the two-stage boot loader into a three-stage boot loader. Stage 1 (MBR) boots a stage 1.5 boot loader that understands the particular file system containing the Linux kernel image. Examples include reiserfs_stage1_5 (to load from a Reiser journaling file system) or e2fs_stage1_5 (to load from an ext2 or ext3 file system). When the stage 1.5 boot loader is loaded and running, the stage 2 boot loader can be loaded.

- With stage 2 loaded, GRUB can, upon request, display a list of available kernels (defined in /etc/grub.conf, with soft links from /etc/grub/menu.lst and /etc/grub.conf). You can select a kernel and even amend it with additional kernel parameters. Optionally, you can use a command-line shell for greater manual control over the boot process.

- With the second-stage boot loader in memory, the file system is consulted, and the default kernel image and initrd image are loaded into memory. With the images ready, the stage 2 boot loader invokes the kernel image.

### Kernel

- With the kernel image in memory and control given from the stage 2 boot loader, the kernel stage begins. The kernel image isn’t so much an executable kernel, but a compressed kernel image. Typically this is a zImage (compressed image, less than 512KB) or a bzImage (big compressed image, greater than 512KB), that has been previously compressed with zlib. At the head of this kernel image is a routine that does some minimal amount of hardware setup and then decompresses the kernel contained within the kernel image and places it into high memory. If an initial RAM disk image is present, this routine moves it into memory and notes it for later use. The routine then calls the kernel and the kernel boot begins.

### Init

- After the kernel is booted and initialized, the kernel starts the first user-space application. This is the first program invoked that is compiled with the standard C library. Prior to this point in the process, no standard C applications have been executed.

- In a desktop Linux system, the first application started is commonly /sbin/init. But it need not be. Rarely do embedded systems require the extensive initialization provided by init (as configured through /etc/inittab). In many cases, you can invoke a simple shell script that starts the necessary embedded applications.


## Resources:

- [IBM Linuxboot Concepts](https://www.ibm.com/developerworks/library/l-linuxboot/)
- [Linux Insides](https://0xax.gitbooks.io/linux-insides/content/Booting/linux-bootstrap-1.html)
- [ A step by step tutorial for understanding Linux boot sequence](www.slashroot.in/linux-booting-process-step-step-tutorial-understanding-linux-boot-sequence)
- [The Upstart Event System: What It Is And How To Use It](https://www.digitalocean.com/community/tutorials/the-upstart-event-system-what-it-is-and-how-to-use-it)
- [Linux Boot Process Explained in Simple Steps ](https://linoxide.com/booting/boot-process-of-linux-in-detail/)
- [Understanding a little more about /etc/profile and /etc/bashrc](https://bencane.com/2013/09/16/understanding-a-little-more-about-etcprofile-and-etcbashrc/)

**********************
## Process and Process Management


- A process is basically a program in execution. The execution of a process must progress in a sequential fashion. To put it in simple terms, we write our computer programs in a text file and when we execute this program, it becomes a process which performs all the tasks mentioned in the program.

- When a program is loaded into the memory and it becomes a process, it can be divided into four sections ─ stack, heap, text and data.

![alt text](https://github.com/Tikam02/DevOps_Cheatsheet/blob/master/img/process.jpeg)

- Stack: The process Stack contains the temporary data such as method/function parameters, return address and local variables.
  
- Heap: This is dynamically allocated memory to a process during its run time.
  
- Text: This includes the current activity represented by the value of Program Counter and the contents of the processor’s registers.
  
- Data: This section contains the global and static variables.

- When a process executes, it passes through different states. These stages may differ in different operating systems, and the names of these states are also not standardized. In general, a process can have one of the following five states at a time:
  
    - Start: This is the initial state when a process is        first started/created.
  
    - Ready: The process is waiting to be assigned to a processor. Ready processes are waiting to have the processor allocated to them by the operating system so that they can run. Process may come into this state after Start state or while running it by but interrupted by the scheduler to assign CPU to some other process.
    
    - Running: Once the process has been assigned to a processor by the OS scheduler, the process state is set to running and the processor executes its instructions.
    
    - Waiting: Process moves into the waiting state if it needs to wait for a resource, such as waiting for user input, or waiting for a file to become available.
    
    - Terminated or Exit: Once the process finishes its execution, or it is terminated by the operating system, it is moved to the terminated state where it waits to be removed from main memory.

- A Process Control Block is a data structure maintained by the Operating System for every process. The PCB is identified by an integer process ID (PID). A PCB keeps all the information needed to keep track of a process.

![alt text](https://github.com/Tikam02/DevOps_Cheatsheet/blob/master/img/process-things.jpeg)

- Process State: The current state of the process i.e., whether it is ready, running, waiting, or whatever.
- Process Privileges: This is required to allow/disallow access to system resources.
- Process ID: Unique identification for each of the process in the operating system.
- Pointer: A pointer to parent process.
- Program Counter: Program Counter is a pointer to the address of the next instruction to be executed for this process.
- CPU Registers: Various CPU registers where process need to be stored for execution for running state.
- CPU Scheduling Information: Process priority and other scheduling information which is required to schedule the process.
- Memory Management Information: This includes the information of page table, memory limits, Segment table depending on memory used by the operating system.
- Accounting Information: This includes the amount of CPU used for process execution, time limits, execution ID etc.
- IO Status Information: This includes a list of I/O devices allocated to the process.



### Resources:

 - [Type of Processes](http://www.gmarik.info/blog/2012/orphan-vs-zombie-vs-daemon-processes/)
  - [The 10 Operating System Concepts Software Developers Need to Remember](https://medium.com/cracking-the-data-science-interview/the-10-operating-system-concepts-software-developers-need-to-remember-480d0734d710)
  - [Process state - ps aux Meaning](http://superuser.com/questions/117913/ps-aux-output-meaning)
  - [Difference between nohup, disown and &](https://unix.stackexchange.com/questions/3886/difference-between-nohup-disown-and)


************************

## Linux Signals

- In Linux, every signal has a name that begins with characters SIG. For example :

    - A SIGINT signal that is generated when a user presses ctrl+c. This is the way to terminate programs from terminal.
    - A SIGALRM  is generated when the timer set by alarm function goes off.
    - A SIGABRT signal is generated when a process calls the abort function.
    etc

- When the signal occurs, the process has to tell the kernel what to do with it.  There can be three options through which a signal can be disposed :

    - The signal can be ignored. By ignoring we mean that nothing will be done when signal occurs. Most of the signals can be ignored but signals generated by hardware exceptions like divide by zero, if ignored can have weird consequences. Also, a couple of signals like SIGKILL and SIGSTOP cannot be ignored.
    - The signal can be caught. When this option is chosen, then the process registers a function with kernel. This function is called by kernel when that signal occurs. If the signal is non fatal for the process then in that function the process can handle the signal properly or otherwise it can chose to terminate gracefully.
    Let the default action apply. Every signal has a default action. This could be process terminate, ignore etc.

- As we already stated that two signals SIGKILL and SIGSTOP cannot be ignored. This is because these two signals provide a way for root user or the kernel to kill or stop any process in any situation .The default action of these signals is to terminate the process. Neither these signals can be caught nor can be ignored.

- What Happens at Program Start-up?

  - It all depends on the process that calls exec. When the process is started the status of all the signals is either ignore or default. Its the later option that is more likely to happen unless the process that calls exec is ignoring the signals.

- It is the property of exec functions to change the action on any signal to be the default action. In simpler terms, if parent has a signal catching function that gets called on signal occurrence then  if that parent execs a new child process, then this function has no meaning in the new process and hence the disposition of the same signal is set to the default in the new process.

- Also, Since we usually have processes running in background so the shell just sets the quit signal disposition as ignored since we do not want the background processes to get terminated by a user pressing a ctrl+c key because that defeats the purpose of making a process run in background.





**************************


## Threads and Concurrency

***********************


## References:

- [The 10 Operating System Concepts Software Developers Need to Remember](https://medium.com/cracking-the-data-science-interview/the-10-operating-system-concepts-software-developers-need-to-remember-480d0734d710)

