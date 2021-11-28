#!/bin/bash -i
#Author: kxisxr

greenColour="\x1B[0;32m\033[1m"
endColour="\033[0m\x1B[0m"
redColour="\x1B[0;31m\033[1m"
blueColour="\x1B[0;34m\033[1m"
yellowColour="\x1B[0;33m\033[1m"
purpleColour="\x1B[0;35m\033[1m"
turquoiseColour="\x1B[0;36m\033[1m"
grayColour="\x1B[0;37m\033[1m"

echo -e "${greenColour}""
                             _____ _           _
 ___ ___ ___ ___ ___ _ _ ___|     | |_ ___ ___| |_
| . | -_| . | .'|_ -| | |_ -|   --|   | -_|  _| '_|
|  _|___|_  |__,|___|___|___|_____|_|_|___|___|_,_|
|_|     |___|
""${endColour}";echo -e "${redColour}""
                    /
               ,.. /
             ,'   ';
  ,,.__    _,' /';  .
 :','  ~~~~    '. '~
:' (   )         )::,
'. '. .=----=..-~  .;'
""${endColour}"; echo -e "${greenColour}""by kxisxr
@pixelbit131 ""${endColour}"

echo -e "\n${blueColour}"'--------------------------------------------------------------------------------------------------------'"${endColour}\n"
echo -e "${purpleColour}"'[*] Installing requirements.'"${endColour}"
echo -e "\n${blueColour}"'--------------------------------------------------------------------------------------------------------'"${endColour}"

if [[ "$OSTYPE" == "linux-gnu"* ]]
then

echo -e -n "${greenColour}"'Updating the system...'"${endColour}\n"
sudo apt-get update -y > /dev/null 2>&1
sleep 0.5
echo -e ' '

echo -e -n "${greenColour}"'Installing misc...'"${endColour}\n"
sudo apt install wget -y > /dev/null 2>&1
sudo apt install git -y > /dev/null 2>&1
sleep 0.5
echo -e ' '

echo -e -n "${greenColour}"'Checking for idevicebackup2...'"${endColour}"
echo -e ' '
sleep 0.5
if ! command -v idevicebackup2 &> /dev/null
then
    echo -e -n "${greenColour}"'Installing' "${blueColour}"'idevicebackup2...'"${endColour}""${endColour}"
    echo -e ' '
    sudo apt-get install libimobiledevice-utils -y > /dev/null 2>&1
    sudo apt-get install usbmuxd libimobiledevice6 ideviceinstaller -y > /dev/null 2>&1
    sleep 0.5
else
echo -e "${redColour}"'idevicebackup2 exists, skipping...'"${endColour}"
fi

echo -e ' '

echo -e -n "${greenColour}"'Checking for python3...'"${endColour}"
echo -e ' '
sleep 0.5
if ! command -v python3 > /dev/null 2>&1
then
    echo -e "${greenColour}"'Installing' "${blueColour}"'python3...'"${endColour}""${endColour}"
    echo -e ' '
    sudo apt install build-essential zlib1g-dev sqlite3 libncurses5-dev libusb-1.0-0 libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev libffi-dev curl libbz2-dev > /dev/null 2>&1
    sudo apt-get install python3 -y > /dev/null 2>&1
    echo -e ' '
    sleep 0.5
else
echo -e "${redColour}"'python3 exists, skipping...'"${endColour}"
fi

echo -e ' '

echo -e -n "${greenColour}"'Checking for pip3...'"${endColour}"
echo -e ' '
sleep 0.5
if ! command -v pip3 > /dev/null 2>&1
then
    echo -e -n "${greenColour}"'Installing' "${blueColour}"'pip3...'"${endColour}""${endColour}"
    echo -e ' '
    sudo apt-get install python3-pip -y > /dev/null 2>&1
    sleep 0.5
else
echo -e "${redColour}"'pip3 exists, skipping...'"${endColour}"
fi

echo -e ' '

echo -e "${greenColour}"'Checking for mvt-ios...'"${endColour}"
sleep 0.5
if ! command -v mvt-ios > /dev/null 2>&1
then
    echo -e -n "${greenColour}"'Installing' "${blueColour}"'mvt-ios...'"${endColour}""${endColour}"
    echo -e ' '
    sudo apt install python3 python3-pip libusb-1.0-0 sqlite3 -y > /dev/null 2>&1
    sudo pip3 install mvt > /dev/null 2>&1
    echo -e ' '
    sleep 0.5
else
echo -e "${redColour}"'mvt-ios exists, skipping...'"${endColour}\n"
fi

elif [[ "$OSTYPE" == "darwin"* ]] # ------------------------------------------------------------------------------------------------------------------
then
echo -e -n "${greenColour}"'Checking for brew...'"${endColour}"
echo -e ' '
sleep 0.5
if ! command -v brew &> /dev/null 2>&1
then
    echo -e "${greenColour}"'Please install brew first, exiting...'"${endColour}"
    exit 0
else
    echo -e "${redColour}"'Brew installed, skipping...'"${endColour}"
fi
echo -e ' '

echo -e -n "${greenColour}"'Updating the system...'"${endColour}"
echo -e ' '
yes | brew update > /dev/null 2>&1
echo -e ' '

echo -e -n "${greenColour}"'Installing misc...'"${endColour}"
echo -e ' '
yes | brew install wget git libusb3 > /dev/null 2>&1
sleep 0.5
echo -e ' '

echo -e -n "${greenColour}"'Checking for idevicebackup2...'"${endColour}"
echo -e ' '
sleep 0.5

if ! command -v idevicebackup2 > /dev/null 2>&1
then
    echo -e -n "${greenColour}"'Installing' "${blueColour}"'idevicebackup2...'"${endColour}""${endColour}"
    echo -e ' '
    yes | brew install libimobiledevice > /dev/null 2>&1
    yes | brew install ideviceinstaller > /dev/null 2>&1
    echo -e ' '
    sleep 0.5
else
echo -e "${redColour}"'idevicebackup2 exists, skipping...'"${endColour}"
fi
echo -e ' '
echo -e -n "${greenColour}"'Checking for python3...'"${endColour}"
echo -e ' '
sleep 0.5

if ! command -v python3 > /dev/null 2>&1
then
    echo -e -n "${greenColour}"'Installing' "${blueColour}"'python3...'"${endColour}""${endColour}"
    echo -e ' '
    yes | brew install python3 > /dev/null 2>&1
    echo -e ' '
    sleep 0.5
else
echo -e "${redColour}"'python3 exists, skipping...'"${endColour}"
fi
echo -e ' '

echo -e "${greenColour}"'Checking for mvt-ios...'"${endColour}"
sleep 0.5

if ! command -v mvt-ios > /dev/null 2>&1
then
    echo -e -n "${greenColour}"'Installing' "${blueColour}"'mvt-ios...'"${endColour}""${endColour}"
    echo -e ' '
    pip3 install mvt > /dev/null 2>&1
    sleep 0.5
else
echo -e "${redColour}"'mvt-ios exists, skipping...'"${endColour}"
fi

else
echo -e -n "${greenColour}"' Operating system not supported, exiting... '"${endColour}"
exit 0
fi

version=$(python3 --version | awk '{print $2}' | tr -d ".")

echo -e "${blueColour}"'--------------------------------------------------------------------------------------------------------'"${endColour}"
echo -e ' '
echo -e "${purpleColour}"'[*] Checking the installation...'"${endColour}"
echo -e ' '
echo -e "${blueColour}"'--------------------------------------------------------------------------------------------------------'"${endColour}"
sleep 0.5
if ! command -v pip3 > /dev/null
then
    echo -e "${redColour}"'pip3 could not be found. '"${endColour}"
    exit 0
elif ! command -v python3 > /dev/null
then
    echo -e "${redColour}"'python3 could not be found. '"${endColour}"
    exit 0
elif ! command -v idevicebackup2 > /dev/null
then 
    echo -e "${redColour}"'idevicebackup2 could not be found.'"${endColour}"
    exit 0
elif ! command -v mvt-ios > /dev/null
then
    echo -e "${redColour}"'mvt-ios could not be found.'"${endColour}"
    exit 0
else
    echo -e "${greenColour}"'[+] All programs installed.'"${endColour}"
fi

echo -e ' '

if [ $version -lt 360 ]
then
echo -e "${redColour}"'[!] You need a python version greater than 3.6+'"${endColour}" 
exit 0
fi

echo -e ' '
sleep 0.5
echo -e "${greenColour}"'Downloading the pegasus IOCs...'"${endColour}"

if [ -f "pegasus.stix2" ]
then
    echo -e "${redColour}"'Pegasus indicators already downloaded, skipping...'"${endColour}"
else
wget https://raw.githubusercontent.com/AmnestyTech/investigations/master/2021-07-18_nso/pegasus.stix2 > /dev/null 2>&1
fi

sleep 0.5
echo -e "${blueColour}"'--------------------------------------------------------------------------------------------------------'"${endColour}"
echo -e ' '

echo -e "${purpleColour}"'[*] Preparing the backup. '"${endColour}"
echo -e ' '
echo -e "${blueColour}"'--------------------------------------------------------------------------------------------------------'"${endColour}"
echo -e -n "${greenColour}"'Connect the iPhone to the PC now...'"${endColour}"
echo -e ' '

echo -e "${greenColour}"'You must select '"${endColour}" "${turquoiseColour}"'-Trust this computer-'"${endColour}" "${greenColour}"' on the iPhone'"${endColour}"
sleep 0.5

echo -e ' '

echo -e "${yellowColour}"'Waiting 10 seconds...'"${endColour}"
sleep 10
echo -e ' '

device=$(ideviceinfo | grep DeviceName | sed 's/DeviceName:/Connected -/g')
ideviceinfo > /dev/null 2>&1

if [ $? -eq 0 ]
then
echo -e "${blueColour}"'--------------------------------------------------------------------------------------------------------'"${endColour}"
echo -e "${turquoiseColour}"[+] ''$device'.'"${endColour}"
echo -e "${blueColour}"'--------------------------------------------------------------------------------------------------------'"${endColour}"
else
echo -e "${redColour}"'Not connected, try again.'"${endColour}"
exit 0
fi

echo -e ' '
echo -e -n "${greenColour}"'Name of the backup directory: '"${endColour}"
read -e dirName
mkdir $dirName
sleep 0.5
echo -e ' '

echo -e "${blueColour}"'--------------------------------------------------------------------------------------------------------'"${endColour}"
echo -e ' '
echo -e "${yellowColour}"'[*] Reference time: '"${endColour}"
echo -e ' '
echo -e "${blueColour}"'--------------------------------------------------------------------------------------------------------'"${endColour}"
echo -e "${grayColour}"'
iPhone XR 64 GB
Upload Speed: 8 MB/s.
Backup phase: 1 hour and 15 minutes.
Decrypting phase: 4 hours and 10 minutes
Storage ocuppied: 62.9 GB.
'"${endColour}"

echo -e "${blueColour}"'--------------------------------------------------------------------------------------------------------'"${endColour}"
echo -e ' '
echo -e "${grayColour}"'[*] Enabling the backup encryption. '"${endColour}"
echo -e ' '
echo -e "${blueColour}"'--------------------------------------------------------------------------------------------------------'"${endColour}"
echo -e ' '
sleep 0.5

echo -e "${greenColour}"'[ 1.- Yes ]'"${endColour}"
echo -e "${yellowColour}"'[ 2.- No  ]'"${endColour}"
echo -e ' '
echo -e -n "${grayColour}"'[?] iPhone Backup password already activated? '"${endColour}"
read -e opt
sleep 0.5
echo -e ' '

if [ $opt == '1' ]
then

idevicebackup2 -i changepw > /dev/null

if [ $? -eq 0 ]
then
echo -e -n "${greenColour}"'[*] Please enter the new password again: '"${endColour}"
while IFS= read -p "$prompt" -r -s -n 1 char
do
    if [[ $char == $'\0' ]] ; then
        break
    fi

    if [[ $char == $'\177' ]] ; then
        prompt=$'\b \b'
        password="${password%?}"
    else
        prompt='*'
        password+="$char"
    fi
done
echo -e ' '
if [ $? -ne 0 ]
then
echo -e -n "${redColour}"'[!] Wrong password!'"${endColour}"
exit 0
fi

echo -e ' '
echo -e "${blueColour}"'--------------------------------------------------------------------------------------------------------'"${endColour}"
echo -e ' '
echo -e "${grayColour}"'[*] Making the backup. '"${endColour}""${redColour}"'[This may take a while...]'"${endColour}"
echo -e ' '
echo -e "${blueColour}"'--------------------------------------------------------------------------------------------------------'"${endColour}"
idevicebackup2 backup --full $dirName > /dev/null 2>&1
sleep 0.5

echo -e "${blueColour}"'--------------------------------------------------------------------------------------------------------'"${endColour}"
echo -e ' '
echo -e "${grayColour}"'[*] Decrypting the backup. '"${endColour}""${redColour}"'[This may take a while...]'"${endColour}"
echo -e ' '
echo -e "${blueColour}"'--------------------------------------------------------------------------------------------------------'"${endColour}"
sleep 0.5
mvt-ios decrypt-backup -p $password -d Decrypted $dirName/$encryptedBackup > /dev/null 2>&1

echo -e "${blueColour}"'--------------------------------------------------------------------------------------------------------'"${endColour}"
echo -e ' '
echo -e "${grayColour}"'[*] Extracting the results. '"${endColour}"
echo -e ' '
echo -e "${blueColour}"'--------------------------------------------------------------------------------------------------------'"${endColour}"
sleep 0.5
mvt-ios check-backup --output results Decrypted --iocs pegasus.stix2 | tee results.txt > /dev/null 2>&1

echo -e "${blueColour}"'--------------------------------------------------------------------------------------------------------'"${endColour}"
echo -e ' '
echo -e "${grayColour}"'[*] Final results: '"${endColour}"
echo -e ' '
echo -e "${blueColour}"'--------------------------------------------------------------------------------------------------------'"${endColour}"
cat results.txt | grep -E "WARNING|CRITICAL" | grep -vi redirect > /dev/null 2>&1

if [ $? -eq 0 ]; then
echo -e ' '
echo -e "${yellowColour}"'--------------------------------------------------------------------------------------------------------'"${endColour}"
echo -e "${redColour}"'[!] Indicators of spyware Pegasus are found.'"${endColour}"
echo -e "${yellowColour}"'--------------------------------------------------------------------------------------------------------'"${endColour}"
echo -e ' '
cat results.txt | grep WARNING
echo -e ' '
echo -e "${redColour}"'Check the indicators above, as well as the .json files with'"${endColour}" "${purpleColour}"'_detected'"${endColour}" "${redColour}"'ending in the '"${endColour}""${yellowColour}"'results '"${endColour}""${redColour}"'folder.'"${endColour}"
else
echo -e "${greenColour}"'[+] No indicators that you have been infected by pegasus are found.'"${endColour}"
echo -e "${blueColour}"'--------------------------------------------------------------------------------------------------------'"${endColour}"
fi
rm -rf results.txt
echo -e ' '
echo -e "${grayColour}"'[*] Full decrypted backup of your iPhone on: '$(pwd)/Decrypted''"${endColour}"
else
echo -e ' '
echo -e -n "${redColour}"'[!] Wrong password or backup password not enabled!, exiting...'"${endColour}"
exit 0
fi

else

echo -e -n "${greenColour}"'[*] Enter a new password to encrypt the backup: '"${endColour}"
while IFS= read -p "$prompt" -r -s -n 1 char
do
    if [[ $char == $'\0' ]] ; then
        break
    fi

    if [[ $char == $'\177' ]] ; then
        prompt=$'\b \b'
        password="${password%?}"
    else
        prompt='*'
        password+="$char"
    fi
done

idevicebackup2 backup -i encryption on $password $dirName > /dev/null 2>&1
if [ $? -eq 255 ]
then
echo -e -n "${redColour}"'[!] Backup password already enabled!'"${endColour}"
exit 0
fi

echo -e ' '
echo -e "${blueColour}"'--------------------------------------------------------------------------------------------------------'"${endColour}"
echo -e ' '
echo -e "${grayColour}"'[*] Making the backup. '"${endColour}""${redColour}"'[This may take a while...]'"${endColour}"
echo -e ' '
echo -e "${blueColour}"'--------------------------------------------------------------------------------------------------------'"${endColour}"
idevicebackup2 backup --full $dirName > /dev/null 2>&1
sleep 0.5

echo -e "${blueColour}"'--------------------------------------------------------------------------------------------------------'"${endColour}"
echo -e ' '
echo -e "${grayColour}"'[*] Decrypting the backup. '"${endColour}""${redColour}"'[This may take a while...]'"${endColour}"
echo -e ' '
echo -e "${blueColour}"'--------------------------------------------------------------------------------------------------------'"${endColour}"
sleep 0.5
mvt-ios decrypt-backup -p $password -d Decrypted $dirName/$encryptedBackup > /dev/null 2>&1

echo -e "${blueColour}"'--------------------------------------------------------------------------------------------------------'"${endColour}"
echo -e ' '
echo -e "${grayColour}"'[*] Extracting the results. '"${endColour}"
echo -e ' '
echo -e "${blueColour}"'--------------------------------------------------------------------------------------------------------'"${endColour}"
sleep 0.5
mvt-ios check-backup --output results Decrypted --iocs pegasus.stix2 | tee results.txt > /dev/null 2>&1

echo -e "${blueColour}"'--------------------------------------------------------------------------------------------------------'"${endColour}"
echo -e ' '
echo -e "${grayColour}"'[*] Final results: '"${endColour}"
echo -e ' '
echo -e "${blueColour}"'--------------------------------------------------------------------------------------------------------'"${endColour}"
cat results.txt | grep -E "WARNING|CRITICAL" | grep -vi redirect > /dev/null 2>&1

if [ $? -eq 0 ]; then
echo -e ' '
echo -e "${yellowColour}"'--------------------------------------------------------------------------------------------------------'"${endColour}"
echo -e "${redColour}"'[!] Indicators of spyware Pegasus are found.'"${endColour}"
echo -e "${yellowColour}"'--------------------------------------------------------------------------------------------------------'"${endColour}"
echo -e ' '
cat results.txt | grep WARNING
echo -e ' '
echo -e "${redColour}"'Check the indicators above, as well as the .json files with'"${endColour}" "${purpleColour}"'_detected'"${endColour}" "${redColour}"'ending in the '"${endColour}""${yellowColour}"'results '"${endColour}""${redColour}"'folder.'"${endColour}"
else
echo -e "${greenColour}"'[+] No indicators that you have been infected by pegasus are found.'"${endColour}"
echo -e "${blueColour}"'--------------------------------------------------------------------------------------------------------'"${endColour}"
fi
rm -rf results.txt
echo -e ' '
echo -e "${grayColour}"'[*] Full decrypted backup of your iPhone on: '$(pwd)/Decrypted''"${endColour}"
fi
