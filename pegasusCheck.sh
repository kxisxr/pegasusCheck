eator: kxisxr
greenColour="\x1B[0;32m\033[1m"
endColour="\033[0m\x1B[0m"
redColour="\x1B[0;31m\033[1m"
blueColour="\x1B[0;34m\033[1m"
yellowColour="\x1B[0;33m\033[1m"
purpleColour="\x1B[0;35m\033[1m"
turquoiseColour="\x1B[0;36m\033[1m"
grayColour="\x1B[0;37m\033[1m"

echo -e -n "${greenColour}""
                             _____ _           _   
 ___ ___ ___ ___ ___ _ _ ___|     | |_ ___ ___| |_ 
| . | -_| . | .'|_ -| | |_ -|   --|   | -_|  _| '_|    
|  _|___|_  |__,|___|___|___|_____|_|_|___|___|_,_|
|_|     |___|                                      
""${endColour}"
echo -e -n "${redColour}""
                    /
               ,.. /
             ,'   ';
  ,,.__    _,' /';  .
 :','  ~~~~    '. '~
:' (   )         )::,
'. '. .=----=..-~  .;'
""${endColour}"
echo -e -n "${greenColour}""
by kxisxr
@pixelbit131
""${endColour}"
echo -e "${blueColour}"'--------------------------------------------------------------------------------------------------------'"${endColour}"
echo -e ' '
echo -e "${purpleColour}"'[*] Installing requirements.'"${endColour}"
echo -e ' '
echo -e "${blueColour}"'--------------------------------------------------------------------------------------------------------'"${endColour}"

#if [[ $(/usr/bin/id -u) -ne 0 ]]; then
#    echo -e -n "${redColour}"'Not running as root \nExiting...'"${endColour}"
#    exit
#fi

if [[ "$OSTYPE" == "linux-gnu"* ]]
then
so=linux
elif [[ "$OSTYPE" == "darwin"* ]]
then
so=mac
else
echo -e -n "${greenColour}"' Operating system not supported, exitting... '"${endColour}"
exit 0
fi

#if [ $so = "linux" ]
#then

echo -e -n "${greenColour}"'Installing misc...'"${endColour}"
echo -e ' '
sudo apt update -y > /dev/null 2>&1
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
    sudo apt-get install usbmuxd libimobiledevice6 libimobiledevice-utils ideviceinstaller -y > /dev/null 2>&1
    sudo apt-get install libimobiledevice6 -y > /dev/null 2>&1
    echo -e ' '
    source ~/.profile
    sleep 0.5
else
echo -e "${redColour}"'idevicebackup2 exists, skipping...'"${endColour}"
fi
echo -e ' '

echo -e -n "${greenColour}"'Checking for python3...'"${endColour}"
echo -e ' '
sleep 0.5

if ! command -v python3 &> /dev/null
then
    echo -e -n "${greenColour}"'Installing' "${blueColour}"'python3...'"${endColour}""${endColour}"
    echo -e ' '
    sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev libffi-dev curl libbz2-dev > /dev/null 2>&1
    sudo apt-get install python3 -y > /dev/null 2>&1
    echo -e ' '
    source ~/.profile
    sleep 0.5
else
echo -e "${redColour}"'python3 exists, skipping...'"${endColour}"
fi
echo -e ' '

echo -e -n "${greenColour}"'Checking for pip3...'"${endColour}"
echo -e ' '
sleep 0.5

if ! command -v pip3 &> /dev/null
then
    echo -e -n "${greenColour}"'Installing' "${blueColour}"'pip3...'"${endColour}""${endColour}"
    echo -e ' '
    sudo apt-get -y install python3-pip > /dev/null 2>&1
    sudo apt install python3 python3-pip libusb-1.0-0 > /dev/null 2>&1
    source ~/.profile
    echo -e ' '
    sleep 0.5
else
echo -e "${redColour}"'pip3 exists, skipping...'"${endColour}"
fi

echo -e ' '

echo -e "${greenColour}"'Checking for mvt-ios...'"${endColour}"
sleep 0.5

if ! command -v mvt-ios &> /dev/null
then
    echo -e -n "${greenColour}"'Installing' "${blueColour}"'mvt-ios...'"${endColour}""${endColour}"
    echo -e ' '
    git clone https://github.com/mvt-project/mvt.git > /dev/null 2>&1
    cd mvt
    pip3 install > /dev/null 2>&1
    pip3 install mvt > /dev/null 2>&1
    source ~/.profile
    echo -e ' '
    sleep 0.5

else
echo -e "${redColour}"'mvt-ios exists, skipping...'"${endColour}"
fi

echo -e ' '

echo -e "${greenColour}"'Downloading the pegasus IOCs...'"${endColour}"
cd - > /dev/null 2>&1
wget https://raw.githubusercontent.com/AmnestyTech/investigations/master/2021-07-18_nso/pegasus.stix2 > /dev/null 2>&1
sleep 0.5
echo -e "${blueColour}"'--------------------------------------------------------------------------------------------------------'"${endColour}"

echo -e ' '

echo -e "${purpleColour}"'[*] Backup the iPhone. '"${endColour}"
echo -e ' '
echo -e "${blueColour}"'--------------------------------------------------------------------------------------------------------'"${endColour}"
echo -e -n "${greenColour}"'Connect the iPhone to the PC now...'"${endColour}"
echo -e ' '

echo -e "${greenColour}"'You must select '"${endColour}" "${turquoiseColour}"'-Trust this computer-'"${endColour}" "${greenColour}"' on the iPhone'"${endColour}"
sleep 0.5

echo -e ' '

echo -e "${yellowColour}"'Waiting 15 seconds...'"${endColour}"
echo -e ' '

echo -e "${greenColour}"'Preparing the backup...'"${endColour}"
sleep 0.5
echo -e ' '

echo -e -n "${greenColour}"'Name of the backup directory: '"${endColour}"
read dirName
mkdir $dirName
sleep 0.5
echo -e ' '

unset password
prompt=$(echo -e -n "${yellowColour}"'Password to encrypt the iPhone Backup: '"${endColour}")
while IFS= read -p "$prompt" -r -s -n 1 char
do
    if [[ $char == $'\0' ]]
    then
        break
    fi
    prompt='*'
    password+="$char"
done
echo -e '\n'

sleep 0.5
echo -e "${grayColour}"'Enabling the backup encryption '"${endColour}"
echo -e ' '
idevicebackup2 backup -i encryption on $password $dirName
encryptedBackup=$(ls $dirName)

sleep 0.5  
echo -e ' '
echo -e "${grayColour}"'Making the backup (this may take a while...)'"${endColour}"
echo -e ' '
idevicebackup2 backup --full $dirName > /dev/null 2>&1

sleep 0.5
echo -e "${grayColour}"'Decrypting the backup '"${endColour}"
mvt-ios decrypt-backup -p $password -d Decrypted $dirName/$encryptedBackup > /dev/null 2>&1
echo -e ' '

sleep 0.5
echo -e "${grayColour}"'Extracting the results...'"${endColour}"
mvt-ios check-backup --output resultsPegasus Decrypted --iocs pegasus.stix2
echo -e "${blueColour}"'--------------------------------------------------------------------------------------------------------'"${endColour}"
