#!/bin/bash
clear

echo -e """
_________ _______     _________ _______  _______ 
\__   __/(  ____ )    \__   __/(  ___  )(  ____ )
   ) (   | (    )|       ) (   | (   ) || (    )|
   | |   | (____)| _____ | |   | |   | || (____)|
   | |   |  _____)(_____)| |   | |   | ||     __)
   | |   | (             | |   | |   | || (\ (   
___) (___| )             | |   | (___) || ) \ \__
\_______/|/              )_(   (_______)|/   \__/
                                                 
"""

echo -e "\tip-tor\033[91m :: \033[0mInstall tor and show your ip"
echo -e "\tCode\033[91m :: \033[0mNaategh"
echo -e "\tEmail\033[91m :: \033[0mmanamtabeshekan@gmail.com"
echo ""

echo -e """
\033[91m1) \033[0mOnly install tor service
\033[91m2) \033[0mInstall tor browser
\033[91m3) \033[0mShow my ip
\033[91m4) \033[0mExit
"""

function main() {
	read -p $'\033[36m > \033[0m' choise

case $choise in
	1 )
		apt update && apt install tor
		echo -e  "\n\033[93mTor service installed successfully...\033[0m"
		echo ""
		read -p $'\033[93mDo you want start tor now?[y/N]' answer
		case ${answer:0:1} in
    		y|Y )
        		service tor start;;
    		n|N )
        		;;				
		esac
		main;;

	2 )
		sudo add-apt-repository ppa:webupd8team/tor-browser
		apt update && apt install tor && apt install tor-browser
		echo "\n\033[93mTor browser installed successfully...\033[0m"
		echo ""
		main;;

	3 )	
		echo -e "Your ip is:\033[91m"
		ip= curl http://icanhazip.com
		echo -e "\033[0m"
		main;;
		

	4 )
		echo -e "\t \033[91m-----------bye!-----------\033[0m"
		exit 0;;

	* )
		echo -e "\033[91mWrong command!!! \033[0m"
		main;;
esac
}

main
