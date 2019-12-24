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
  - [Concepts](#concepts)
  - [Resources:](#resources-1)
- [Linux Signals](#linux-signals)
  - [Concepts](#concepts-1)
  - [Resources:](#resources-2)
- [Threads and Concurrency](#threads-and-concurrency)
  - [Concepts](#concepts-2)
  - [Resources:](#resources-3)
- [Scheduling](#scheduling)
  - [Concepts](#concepts-3)
  - [Resources:](#resources-4)
- [Memory Management](#memory-management)
  - [Concepts](#concepts-4)
  - [Resources:](#resources-5)
- [Inter-Process Communication](#inter-process-communication)
  - [Concepts](#concepts-5)
  - [Resources:](#resources-6)
- [I/O Management](#io-management)
  - [Concepts](#concepts-6)
  - [Resources:](#resources-7)
- [Virtualization](#virtualization)
  - [Concepts](#concepts-7)
  - [Resources:](#resources-8)
- [Distributed File Systems](#distributed-file-systems)
  - [Concepts](#concepts-8)
  - [Resources:](#resources-9)
- [Cloud Computing](#cloud-computing)
  - [concepts](#concepts)
  - [Resources:](#resources-10)
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


#### Resources:

- [IBM Linuxboot Concepts](https://www.ibm.com/developerworks/library/l-linuxboot/)
- [Linux Insides](https://0xax.gitbooks.io/linux-insides/content/Booting/linux-bootstrap-1.html)
- [ A step by step tutorial for understanding Linux boot sequence](www.slashroot.in/linux-booting-process-step-step-tutorial-understanding-linux-boot-sequence)
- [The Upstart Event System: What It Is And How To Use It](https://www.digitalocean.com/community/tutorials/the-upstart-event-system-what-it-is-and-how-to-use-it)
- [Linux Boot Process Explained in Simple Steps ](https://linoxide.com/booting/boot-process-of-linux-in-detail/)
- [Understanding a little more about /etc/profile and /etc/bashrc](https://bencane.com/2013/09/16/understanding-a-little-more-about-etcprofile-and-etcbashrc/)

**********************
## Process and Process Management


### Concepts



- When a program is loaded into the memory and it becomes a process, it can be divided into four sections ─ stack, heap, text and data.



- root and chroot

    - In a Unix-like OS, root directory(/) is the top directory. root file system sits on the same disk partition where root directory is located. And it is on top of this root file system that all other file systems are mounted. All file system entries branch out of this root. This is the system’s actual root.

    - But each process has its own idea of what the root directory is. By default, it is actual system root but we can change this by using chroot()system call. We can have a different root so that we can create a separate environment to run so that it becomes easier to run and debug the process. Or it may also be to use legacy dependencies and libraries for the process.

    - chroot changes apparent root directory for current running process and its children.

    - It may appear that by separating a process using chroot()we ensure security by restricting the process not to access outside its environment. But in reality that is not very true. chroot() simply modifies pathname lookups for a process and its children , prepending the new root path to any name starting with /.Current directory is not modified and relative paths can refer any locations outside of new root.

    - So, chroot() do NOT provide a secure sandbox to test a software.

- cgroups- Isolate and manage resources

    - Control groups(cgroups) is a Linux kernel feature which limits, isolates and measures resource usage of a group of processes. Resources quotas for memory, CPU, network and IO can be set. These were made part of Linux kernel in Linux 2.6.24.

    - Though Linux is excellent at handling and sharing available resources between processes, sometimes we want better control over resources.We want to allocate or guarantee a certain amount of resources to a group of processes. We do this with cgroups. This isolates an application/group’s resources.

    - Suppose we have an application we want to isolate usage for. Lets call it A1. Lets call rest of system as S. We will create a control group and assign resource limits on it: say 3GB of memory limit and 70% of CPU. Then we can add requisite application’s process id to the group and application resource usage now is throttled. Though the application may exceed the limits in normal scenarios, it will be throttled back to pre set limits in case system is facing resource crunch. This makes even more sense when we are handling many VMs running on a machine-have a cgroup for VMs and throttle them individually to a set limit when resource contention happens.

        - Define the solution to problem
        - Create a cgroup to handle the allocation
        - Add applications to the group.
        - Keep monitoring the group(happens as part of cgroups, we need not handle explicitly)

- Linux Namespaces

    - Linux processes form a single hierarchy, with all processes rooting at init. Usually privileged processes in this tree can trace or kill other processes.Linux namespace enables us to have many hierarchies of processes with their own “subtrees” such that processes in one subtree cant access or even know of those in another.

    - A namespace wraps a global resource such that it appears to processes in that namespace have their own isolated instance of the said resource. Lets take PID namespace as an example. Without namespace involved, all processes descend hierarchically from PID 1(init). If we create a PID namespace and run a process in it, that first process becomes PID 1 in that namespace. In this case, we wrapped a global system resource(process IDs). The process that creates namespace still remains in parent namespace, but makes its child the root of new process tree.

    - But this only means that the processes within the new namespace can not see parent process but the parent process namespace can see the child namespace. And the processes within new namespace now have 2 PIDs: one for new namespace and one for global namespace.

- Types of namespace
  
- Linux provides following namespaces:

    - cgroup:This isolates Cgroup root directory(CLONE_NEWCGROUP)
    
    - IPC: isolates System V IPC, POSIX message queues(CLONE_NEWIPC)
    
    - Network: isolates Network devices, ports etc(CLONE_NEWNET)
    
    - Mount: isolates mountpoints(CLONE_NEWNS)
    
    - PID: isolated process IDs(CLONE_NEWPID)
    
    - User : isolates User and group IDs(CLONE_NEWUSER)
    
    - UTS: isolates Hostname and NIS domain name(CLONE_NEWUTS)

### Resources:

- [Type of Processes](http://www.gmarik.info/blog/2012/orphan-vs-zombie-vs-daemon-processes/)
- [The 10 Operating System Concepts Software Developers Need to Remember](https://medium.com/cracking-the-data-science-interview/the-10-operating-system-concepts-software-developers-need-to-remember-480d0734d710)
- [Process state - ps aux Meaning](http://superuser.com/questions/117913/ps-aux-output-meaning)
- [Difference between nohup, disown and &](https://unix.stackexchange.com/questions/3886/difference-between-nohup-disown-and)
- [Introduction to Linux Control Groups (Cgroups)](https://sysadmincasts.com/episodes/14-introduction-to-linux-control-groups-cgroups?source=post_page-----37124d995e3d----------------------)

************************

## Linux Signals

### Concepts

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



### Resources:

- [Linux Processes and Signals](https://www.bogotobogo.com/Linux/linux_process_and_signals.php)
- [Short Tutorial on Signals in Linux](https://lasr.cs.ucla.edu/vahab/resources/signals.html)
- [Signal Concepts](https://www.win.tue.nl/~aeb/linux/lk/lk-5.html)

**************************
## Threads and Concurrency

### Concepts

- Definition: A Thread also called lightweight process, is basic CPU utilization; it compromises a thread ID, a program counter, a register set, and a stack. A thread is an entity within a process that can be scheduled for execution.








- Benefits of Multi-threading

    - Parallelization: In multi-processor architecture, different threads can execute different instructions at a time, which result in parallelization which speeds up the execution of the process.

    - Specialization: By specializing different threads to perform the different task, we can manage threads, for example, we can give higher priority to those threads which are executing the more important task. Also in multi-processor architecture specialization leads to the hotter cache which improves performance.

    - Efficient: Multi-threaded programs are more efficient as compared to multi-process programs in terms of resource requirement as threads share address space while process does not, so multi-process programs will require separate memory space allocation. Also, Multi-threaded programs incur lower overhead as inter-thread communication is less expensive.

    - Hide Latency: As context switching among the process is a costly operation, as all the threads of a process share the same virtual to physical address mapping and other resources, context switch among the thread is a cheap operation and require less time. When the number of thread is greater than the number of CPU and a thread is in idle state (spending the time to wait for the result of some interrupt) and its idle time is greater than two times the time required for switching the context to another thread, it will switch the switch context to another thread to hide idling time.


- Detailed Deep-Dive Concepts on Resources Links

### Resources:
- [Threads & Cocurrency](https://applied-programming.github.io/Operating-Systems-Notes/3-Threads-and-Concurrency/)
- [Operating System: Threads and Concurrency](https://medium.com/@akhandmishra/operating-system-threads-and-concurrency-aec2036b90f8)
- [General concepts: concurrency, parallelism, threads and processes](https://learn-gevent-socketio.readthedocs.io/en/latest/general_concepts.html)

***********************

##  Scheduling


### Concepts

- Linux scheduling is based on the time sharing technique: several processes run in “time multiplexing” because the CPU time is divided into slices, one for each runnable process. If a currently running process is not terminated when its time slice or quantum expires, a process switch may take place. Time sharing relies on timer interrupts and is thus transparent to processes. No additional code needs to be inserted in the programs to ensure CPU time sharing.

- The Linux scheduler is a priority based scheduler that schedules tasks based upon their static and dynamic priorities. When these priorities are combined they form a task's goodness . Each time the Linux scheduler runs, every task on the run queue is examined and its goodness value is computed. The task with the highest goodness is chosen to run next.

- When there are cpu bound tasks running in the system, the Linux scheduler may not be called for intervals of up to .40 seconds. This means that the currently running task has the CPU to itself for periods of up to .40 seconds (how long depends upon the task's priority and whether it blocks or not). This is good for throughput because there are few computationally uneccessary context switches. However it can kill interactivity because Linux only reschedules when a task blocks or when the task's dynamic priority (counter) reaches zero. Thus under Linux's default priority based scheduling method, long scheduling latencies can occur.

- Looking at the scheduling latency in finer detail, the Linux scheduler makes use of a timer that interrupts every 10 msec. This timer erodes the currently running task's dynamic priority (decrements its counter). A task's counter starts out at the same value its priority contains. Once its dynamic priority (counter) has eroded to 0 it is again reset to that of its static priority (priority). It is only after the counter reaches 0 that a call to schedule() is made. Thus a task with the default priority of 20 may run for .200 secs (200 msecs) before any other task in the system gets a chance to run. A task at priority 40 (the highest priority allowed) can run for .400 secs without any scheduling occurring as long as it doesn't block or yield. 

- Process scheduling is an essential part of a Multiprogramming operating systems. Such operating systems allow more than one process to be loaded into the executable memory at a time and the loaded process shares the CPU using time multiplexing.


- The Operating System maintains the following important process scheduling queues:



### Resources:
- [Scheduling in Linux ](https://www.cs.montana.edu/~chandrima.sarkar/AdvancedOS/CSCI560_Proj_main/index.html)
- [Linux Scheduler](https://www.kernel.org/doc/html/latest/scheduler/index.html)
- [Linux Scheduling - IBM](https://www.ibm.com/support/knowledgecenter/en/linuxonibm/com.ibm.linux.z.ldva/ldva_c_CPU_scheduling.html)
- [Linux Scheduler - CS Columbia](https://www.cs.columbia.edu/~smb/classes/s06-4118/l13.pdf)
- [Linux Kernel: Process Scheduling](https://medium.com/hungys-blog/linux-kernel-process-scheduling-8ce05939fabd)


***********************

## Memory Management


### Concepts




- The process address space is the set of logical addresses that a process references in its code. For example, when 32-bit addressing is in use, addresses can range from 0 to 0x7fffffff; that is, 2³¹ possible numbers, for a total theoretical size of 2 gigabytes.

- The operating system takes care of mapping the logical addresses to physical addresses at the time of memory allocation to the program. There are three types of addresses used in a program before and after memory is allocated:

    - Symbolic addresses: The addresses used in a source code. The variable names, constants, and instruction labels are the basic elements of the symbolic address space.
    
    - Relative addresses: At the time of compilation, a compiler converts symbolic addresses into relative addresses.
    
    - Physical addresses: The loader generates these addresses at the time when a program is loaded into main memory.

- Virtual and physical addresses are the same in compile-time and load-time address-binding schemes. Virtual and physical addresses differ in execution-time address-binding scheme.

- The set of all logical addresses generated by a program is referred to as a logical address space. The set of all physical addresses corresponding to these logical addresses is referred to as a physical address space.



### Resources:

- [The Linux Kernerl Docs - Memory Management](https://www.kernel.org/doc/html/latest/admin-guide/mm/index.html)
- [Linux Memory Management – Virtual Memory and Demand Paging](https://www.thegeekstuff.com/2012/02/linux-memory-management/embed/)
- [Memory management implementationn Approaches](https://www.tldp.org/LDP/tlk/mm/memory.html)



*****************************

## Inter-Process Communication

### Concepts


- IPC is an abbreviation that stands for “Inter-process Communication”. It denotes a set of system calls that allows a User Mode process to:
    - Synchronize itself with other processes by means of ‘Semaphores’.
    - Send messages to other processes or receive messages from them.
    - Share a memory area with other processes.


- Q) What is Inter Process Communication means?

    - The mechanism in which User Mode processes synchronize themselves and exchange data is referred to as “Inter-process Communication (IPC)” in UNIX Systems (that includes Linux too).


- Q) But in what way exactly do terms like: Semaphores, Shared Memory and Message Queues relate to IPC?

    - Semaphores, Shared Memory and Message Queues do relate to IPC in a very special way, since Semaphores, Shared Memory and Message Queues are “Inter-process Communication Resources” or “Inter-process Communication Facilities”, and different in the way they represent IPC from “Inter-process Communication Mechanisms” like Pipes and FIFOs. Semaphores, Shared Memory and Message Queues are System V (AT&T System V.2 release of UNIX) IPC facilities, and they represent wrapper functions that have been developed and inserted in suitable libraries to harness the energy and beauty of IPC mechanisms.




- Data sharing among processes can be obtained by storing data in temporary files protected by locks. But this mechanism is never implemented as it proves costly since it requires accesses to the disk filesystem. For that reason, all UNIX Kernels include a set of system calls that supports process communications without interacting with the filesystem.

- Application programmers have a variety of needs that call for different communication mechanisms. Some of the basic mechanisms that UNIX systems, GNU/Linux is particular has to offer are:

    - Pipes and FIFOs: Mainly used for implementing producer/consumer interactions among processes. Some processes will fill the pipe with data while others will extract from it.
    
    - Semaphores: Here we refer to (NOT the POSIX Realtime Extension Semaphores applied to Linux Kernel Threads), but System V semaphores which apply to User Mode processes. Used for locking critical sections of code.
    
    - Message Queues: To set up a message queue between processes is a way to exchange short blocks (called messages) between two processes in an asynchronous way.
    
    - Shared Memory: A mechanism (specifically a resource) applied when processes need to share large amounts of data in an efficient way.

- A process is a program in execution, and each process has its own address space, which comprises the memory locations that the process is allowed to access. A process has one or more threads of execution, which are sequences of executable instructions: a single-threaded process has just one thread, whereas a multi-threaded process has more than one thread. Threads within a process share various resources, in particular, address space. Accordingly, threads within a process can communicate straightforwardly through shared memory, although some modern languages (e.g., Go) encourage a more disciplined approach such as the use of thread-safe channels. Of interest here is that different processes, by default, do not share memory.

- There are various ways to launch processes that then communicate, and two ways dominate in the examples that follow:

    - A terminal is used to start one process, and perhaps a different terminal is used to start another.
    
    - The system function fork is called within one process (the parent) to spawn another process (the child).

- Linux systems provide two separate APIs for shared memory: the legacy System V API and the more recent POSIX one. These APIs should never be mixed in a single application, however. A downside of the POSIX approach is that features are still in development and dependent upon the installed kernel version, which impacts code portability. For example, the POSIX API, by default, implements shared memory as a memory-mapped file: for a shared memory segment, the system maintains a backing file with corresponding contents. Shared memory under POSIX can be configured without a backing file, but this may impact portability. My example uses the POSIX API with a backing file, which combines the benefits of memory access (speed) and file storage (persistence).

- The shared-memory example has two programs, named memwriter and memreader, and uses a semaphore to coordinate their access to the shared memory. Whenever shared memory comes into the picture with a writer, whether in multi-processing or multi-threading, so does the risk of a memory-based race condition; hence, the semaphore is used to coordinate (synchronize) access to the shared memory.





### Resources:

- [Inter-process communication in Linux: Shared storage](https://opensource.com/article/19/4/interprocess-communication-linux-storage)
- [Understanding InterProcess Communication in Linux: Introduction to Interprocess Communication](http://www.emblogic.com/blog/03/understanding-interprocess-communication-in-linux-introduction-to-interprocess-communication/)
- [Inter-process communication in Linux: Shared storage](https://opensource.com/article/19/4/interprocess-communication-linux-storage)
- [Inter-process communication in Linux: Sockets and signals](https://opensource.com/article/19/4/interprocess-communication-linux-networking)
- [Inter-process communication in Linux: Using pipes and message queues](https://opensource.com/article/19/4/interprocess-communication-linux-channels)
- [IPC mechanisms on Linux - Introduction](http://www.chandrashekar.info/articles/linux-system-programming/introduction-to-linux-ipc-mechanims.html)




******************************

## I/O Management

### Concepts


- Management of I/O devices is a very important part of the operating system - so important and so varied that entire I/O subsystems are devoted to its operation. ( Consider the range of devices on a modern computer, from mice, keyboards, disk drives, display adapters, USB devices, network connections, audio I/O, printers, special devices for the handicapped, and many special-purpose peripherals.



- Device Controllers

    - Device drivers are software modules that can be plugged into an OS to handle a particular device. Operating System takes help from device drivers to handle all I/O devices.

    - The Device Controller works like an interface between a device and a device driver. I/O units (Keyboard, mouse, printer, etc.) typically consist of a mechanical component and an electronic component where electronic component is called the device controller.

    - There is always a device controller and a device driver for each device to communicate with the Operating Systems. A device controller may be able to handle multiple devices. As an interface its main task is to convert serial bit stream to block of bytes, perform error correction as necessary.

    - Any device connected to the computer is connected by a plug and socket, and the socket is connected to a device controller. Following is a model for connecting the CPU, memory, controllers, and I/O devices where CPU and device controllers all use a common bus for communication.

- Synchronous vs asynchronous I/O

    - Synchronous I/O − In this scheme CPU execution waits while I/O proceeds

    - Asynchronous I/O − I/O proceeds concurrently with CPU execution

- Communication to I/O Devices

- The CPU must have a way to pass information to and from an I/O device. There are three approaches available to communicate with the CPU and Device.

    - Special Instruction I/O
    - Memory-mapped I/O
    - Direct memory access (DMA)


### Resources:

- [Operation Systems I/O Hardware](https://www.tutorialspoint.com/operating_system/os_io_hardware.htm)
- [I/O Systems ](https://www.cs.uic.edu/~jbell/CourseNotes/OperatingSystems/13_IOSystems.html)
- [I/O Management](http://www.cs.umsl.edu/~sanjiv/classes/cs4760/lectures/io.pdf)
- [Os Notes- I/O Management](https://applied-programming.github.io/Operating-Systems-Notes/8-IO-Management/)
  



***************************

## Virtualization


### Concepts

- Virtualization is the process of running a virtual instance of a computer system in a layer abstracted from the actual hardware. Most commonly, it refers to running multiple operating systems on a computer system simultaneously. To the applications running on top of the virtualized machine, it can appear as if they are on their own dedicated machine, where the operating system, libraries, and other programs are unique to the guest virtualized system and unconnected to the host operating system which sits below it.

- There are many reasons why people utilize virtualization in computing. To desktop users, the most common use is to be able to run applications meant for a different operating system without having to switch computers or reboot into a different system. For administrators of servers, virtualization also offers the ability to run different operating systems, but perhaps, more importantly, it offers a way to segment a large system into many smaller parts, allowing the server to be used more efficiently by a number of different users or applications with different needs. It also allows for isolation, keeping programs running inside of a virtual machine safe from the processes taking place in another virtual machine on the same host.


![Virtualization](https://github.com/Tikam02/DevOps_Cheatsheet/blob/master/img/linux-virtualization.png)

- How does virtualization work?
  - Software called hypervisors separate the physical resources from the virtual environments—the things that need those resources. Hypervisors can sit on top of an operating system (like on a laptop) or be installed directly onto hardware (like a server), which is how most enterprises virtualize. Hypervisors take your physical resources and divide them up so that virtual environments can use them.
  - Resources are partitioned as needed from the physical environment to the many virtual environments. Users interact with and run computations within the virtual environment (typically called a guest machine or virtual machine). The virtual machine functions as a single data file. And like any digital file, it can be moved from one computer to another, opened in either one, and be expected to work the same
  - When the virtual environment is running and a user or program issues an instruction that requires additional resources from the physical environment, the hypervisor relays the request to the physical system and caches the changes—which all happens at close to native speed (particularly if the request is sent through an open source hypervisor based on KVM, the Kernel-based Virtual Machine).


- What is hypervisor?

  - A hypervisor is a program for creating and running virtual machines. Hypervisors have traditionally been split into two classes: type one, or "bare metal" hypervisors that run guest virtual machines directly on a system's hardware, essentially behaving as an operating system. Wype two, or "hosted" hypervisors behave more like traditional applications that can be started and stopped like a normal program. In modern systems, this split is less prevalent, particularly with systems like KVM. KVM, short for kernel-based virtual machine, is a part of the Linux kernel that can run virtual machines directly, although you can still use a system running KVM virtual machines as a normal computer itself.

- Types of Virtualization:
  - Data virtualization : Data virtualization tools sit in front of multiple data sources and allows them to be treated as single source, delivering the needed data—in the required form—at the right time to any application or user.
  - Desktop Virtualization : desktop virtualization allows a central administrator (or automated administration tool) to deploy simulated desktop environments to hundreds of physical machines at once. 
  - Server Virtualization : Servers are computers designed to process a high volume of specific tasks really well so other computers—like laptops and desktops—can do a variety of other tasks. Virtualizing a server lets it to do more of those specific functions and involves partitioning it so that the components can be used to serve multiple functions.
  - Operating System Virtualization : Operating system virtualization happens at the kernel—the central task managers of operating systems. It’s a useful way to run Linux and Windows environments side-by-side.
  - Network Function Virtualization : Virtualizing networks reduces the number of physical components—like switches, routers, servers, cables, and hubs—that are needed to create multiple, independent networks, and it’s particularly popular in the telecommunications industry.


 - Distributed File System Requirements Sharing files across nodes (processes, cpus, computers, networks) requires or benefits from certain attributes of the system.

- Some attributes which are required or may be used as utility metrics for a DFS:

   - naming

   - transparency (works hand-in-hand with naming)

   - concurrency (including synchronization)

   - replication (caching, with consistency checks)

   - platform independence (heterogeneity)

   - fault tolerance

   - consistency

   - security 


### Resources:

- [Notes on Virtualization with Linux](https://moi.vonos.net/linux/linux-virtualization/)
- [What is virtualization?](https://www.redhat.com/en/topics/virtualization/what-is-virtualization)
- [Operating System Virtualization – Types, Working, Benefits](https://data-flair.training/blogs/operating-system-virtualization/)
- [Virtualization concepts](https://opensource.com/resources/virtualization)
- [ Virtual Linux: Platform and OS Linux Virtualization ](https://www.datamation.com/osrc/article.php/3879871/Virtual-Linux-Platform-and-OS-Linux-Virtualization.htm)
- [Distributed File Syatems - Cs oswego](http://www.cs.oswego.edu/~odendahl/coursework/csc443/notes/java7/17-aa-dfs.html)







*************************


## Distributed File Systems


### Concepts

- A distributed file systemis a file system that resides on different machines, but offers an integrated view of data stored on remote disks

- Distributed file system (DFS) – a distributed implementation of the classical time-sharing model of a file system, where multiple users share files and storage resources.!A DFS manages set of dispersed storage devices!Overall storage space managed by a DFS is composed of different, remotely located, smaller storage spaces.!There is usually a correspondence between constituent storage spaces and sets of files. 
  - A DFS manages a set of dispersed storage devices

  - The overall storage space is composed of heterogeneous, remotely located, smaller storage spaces.

  - There is usually a correspondence between constituent storage spaces and sets of files. 

- Distributed File System Structure:
  
  - Service– software entity running on one or more machines and providing a particular type of function to a priori unknown clients.
  
  - Server– service software running on a single machine.
  
  - Client–  process that can invoke a service using a set of operations that forms its client interface.
  
  - A client interface for a file service is formed by a set of primitive file operations(create, delete, read, write).
  
  - Client interface of a DFS should be transparent, i.e., not distinguish between local and remote files.

- A distributed file system is a client/server-based application that allows clients to access and process data stored on the server as if it were on their own computer. When a user accesses a file on the server, the server sends the user a copy of the file, which is cached on the user’s computer while the data is being processed and is then returned to the server.


### Resources:
- [Distributed File System - CS Nuim](https://www.cs.nuim.ie/~dkelly/CS402-06/Distributed%20File%20Systems.htm)
- [Distributed File System - cs ucsd](https://cseweb.ucsd.edu/classes/sp16/cse291-e/applications/ln/lecture13.html)
- [Distributed File System - cs wpi](https://web.cs.wpi.edu/~cs4513/b05/week5-dfs.pdf)



*********************

## Cloud Computing


### concepts

- Computing  itself,  to  be  considered  fully  virtualized,  must  allow  computers  to be  built  from  distributed components  such  as  processing,  storage,  data,  and software resources.

- In the simplest terms, cloud computing means storing and accessing data and programs over the Internet instead of your computer's hard drive. The cloud is just a metaphor for the Internet.

- What cloud computing is not about is your hard drive. When you store data on or run programs from the hard drive, that's called local storage and computing. Everything you need is physically close to you, which means accessing your data is fast and easy, for that one computer, or others on the local network. Working off your hard drive is how the computer industry functioned for decades; some would argue it's still superior to cloud computing, for reasons I'll explain shortly.

- Cloud computing is a model for enabling ubiquitous, convenient, on-demand network access to a shared pool of configurable computing resources (e.g., networks, servers, storage, applications, and services) that can be rapidly provisioned and released with minimal management effort or service provider interaction.

- Cloud computing is a model for enabling ubiquitous, convenient, on-demand network access to a shared pool of configurable computing resources (e.g., networks, servers, storage, applications, and services) that can be rapidly provisioned and released with minimal management effort or service provider interaction.

- There are five key characteristics of cloud computing : 
    - On-demand self-service : Users can access computing services via the cloud when they need to without interaction from the service provider. The computing services should be fully on-demand so that users have control and agility to meet their evolving needs.

    - Broad network access : Cloud computing services are widely available via the network through users’ preferred tools (e.g., laptops, desktops, smartphones, etc.).

    - Resource pooling : One of the most attractive elements of cloud computing is the pooling of resources to deliver computing services at scale. Resources, such as storage, memory, processing, and network bandwidth, are pooled and assigned to multiple consumers based on demand.

    - Rapid elasticity : Successful resource allocation requires elasticity. Resources must be assigned accurately and quickly with the ability to absorb significant increases and decreases in demand without service interruption or quality degradation.

    - Measured service : Following the utility model, cloud computing services are measured and metered. This measurement allows the service provider (and consumer) to track usage and gauge costs according to their demand on resources.

### Resources:

- [Understanding the Basics of Cloud Computing ](https://www.lucidchart.com/blog/cloud-computing-basics)
- [ What is Cloud Computing? - AWS](https://aws.amazon.com/what-is-cloud-computing/)
- [What is cloud computing? - Salesforce](https://www.salesforce.com/products/platform/best-practices/cloud-computing/)
- [What is cloud computing? - Azure](https://azure.microsoft.com/en-in/overview/what-is-cloud-computing/)


********************

## References:

- [The 10 Operating System Concepts Software Developers Need to Remember](https://medium.com/cracking-the-data-science-interview/the-10-operating-system-concepts-software-developers-need-to-remember-480d0734d710)
- [Operating System Notes](https://applied-programming.github.io/Operating-Systems-Notes/)
- [Sysadmin Guides - Episodes](https://sysadmincasts.com/episode-guide)

