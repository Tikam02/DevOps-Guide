#!/bin/bash
clear
print_style () {

    if [ "$2" == "info" ] ; then
        COLOR="96m";
    elif [ "$2" == "success" ] ; then
        COLOR="92m";
    elif [ "$2" == "warning" ] ; then
        COLOR="93m";
    elif [ "$2" == "danger" ] ; then
        COLOR="91m";
    else #default color
        COLOR="0m";
    fi

    STARTCOLOR="\e[$COLOR";
    ENDCOLOR="\e[0m";

    printf "$STARTCOLOR%b$ENDCOLOR" "$1";
    echo ""
}



ManageProc() {
clear
print_style "This menu facilitates process management, making it easy for you to monitor and control processes." "info"
sleep 1
PS3="Choose an item: If you don’t see anything, please press Enter."
select CHOICE in "Top 10 CPU% Usage" "Process More Than X CPU Usage(in %)" "Top 10 Memory% Usage" "Process More X Memory Usage(in %)" "Zombie Process" "Kill Process" "Exit";do
	case $REPLY in
		1)
			clear
			print_style "Below are the top 10 applications that utilize the most CPU resources." "info"
			sleep 0.5
			print_style "`ps -ax --sort=-%cpu --format pid,ppid,cmd,%cpu,%mem | head -n 10`"  "warning"; 
			;;
		2)
			clear
			read -p "Please input your CPU% Usage percentage like 10.0: " threshold 
			sleep 0.5
			print_style "`ps -ax --format pid,ppid,%cpu,%mem,cmd,user | awk -v threshold=$threshold '{ if ($3 > threshold ) print $0}'`" "warning";
			;;
		3)
			clear
			print_style "`ps ax --sort=-%mem --format pid,ppid,%cpu,%mem,cmd,user | head -n 10`" "warning"
			;;

		4)
			clear
			read -p "Please input your Memory% Usage percentage like: 10.0:  " threshold
			sleep 0.5
			print_style "`ps -ax --sort=-%mem --format pid,ppid,%cpu,%mem,cmd,user | awk -v threshold=$threshold '{if ($4 > threshold ) print $0}'`" "warning";
			;;

		5)
			clear
			echo This is Zombie Process, please kill them.
			sleep 0.5
			print_style "`ps -ax  --format pid,ppid,%cpu,%mem,cmd,stat | awk  '$6 == "Z" { print $0 }'`" "danger";
			;;

		6)
			read -p "Enter the PID of the process which you want to delete it: " ProcessID
			echo "here is the process-id of this PID:"
			print_style "`ps -ax --sort=-%mem --format pid,ppid,%cpu,%mem,cmd,user | awk -v pid=$ProcessID '{if ($1== pid ) print $0}'`"  "info";
			sleep 0.4
			read -p "Enter the signal which you want to send it to the process: " signal
			sleep 0.2
			read -p "Are you sure you want to send this signal to this PID? Y|N " answer
			case "$answer" in 
				Y|y)
					print_style "sending signal ($signal) to the PID ($ProcessID) in 5 second, you can press Ctrl+C to cancel it." "danger";
					sleep 5
					kill -$signal $ProcessID
					if [[ $? -eq 0 ]]
					then
						echo "the pid: $PID is successfully killed."
					fi
					;;
				N|n)
					echo "Nothing to do "
				;;

				*)
					print_style "Bad Input" "danger";
				;;
			esac
			;;
		7)
			clear
			print_style "Back to the main Menu..." "info"
			sleep 1
			print_style "Please press the Enter command"
			break
			;;

			

	esac
done

}



ManagefileSys() {

#!/bin/bash

PS3="Choose an item: If you don’t see anything, please press Enter. "
select CHOICE in "List Hard disk" "fine a file with size" "find a file" "find a pattern in files in your system"  "Quit"
do
	case $REPLY in
		1)
			lsblk -f
			;;
		2)

			read -p "Enter the size in M-Byte: " fileSize
			find / -type f -size +${fileSize}M -exec ls -lah {} \;
			;;
		3)
			read -p "What is the name of the file you are Looking for: " fileName
			find / -name $fileName
			;;
		4)
			read -p "Enter the pattern: " pattern
			find / -type f -name "*" -exec grep -i $pattern {} \;
			;;
		5)
			clear
			print_style "Back to the main Menu..." "info"
			sleep 1
			print_style "Please press the Enter command "
			break
			;;
		*)
			echo "bad input!!!"
			;;
	esac
done 


}






PS3="What do you Want to do: "
select fruit in "Manage your Process." "Adding a iptables rule." "Managing your filesystem." "Quit"
do

	case $REPLY in
		1)
			echo "Manage your Process. "
			ManageProc
			;;
		2)
			echo "Adding a iptables rule. "
			;;
		3)
			echo "Managing your filesystem. "
			ManagefileSys
			;;

		4)
			echo "Quitting "
			sleep 1
			break
			;;
		*)
			echo "bad input!!!"
			;;
	esac
done 




