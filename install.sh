#!/bin/bash

# wget -O install.sh https://sites.google.com/site/marginallyhandy/install.sh?attredirects=0&d=1

clear

RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

if (( $EUID != 0 )); then
    echo -e "${RED}Please run as root: sudo ./install.sh${NC}"
    exit
fi

echo "---------------------"
echo -e "${YELLOW}PLEASE READ CAREFULLY${NC}"
echo "---------------------"
echo "This script will install everything needed to interface with Roku IP Camera Viewer Pro"
echo -e "${YELLOW}Press 1 (${NC}${GREEN}recomended option${NC}${YELLOW}) To clean install all the needed packages.\n\t This option will remove apache2, php, ffmpeg first and then reinstall them.${NC}\n"
echo -e "${YELLOW}Press 2 to skip the uninstall process (dirty install)${NC}"
echo -e "${YELLOW}Press 0 to exit this script and abandon the installation${NC}"

echo "Enter your option:"
while read line
do
  case $line in
        0)
          echo -e "${RED}Exit selected!${NC}"
          exit
        ;;
        1)
          echo -e "${YELLOW}Clean install selected.${NC}"
          break
        ;;
        2)
          echo -e "${YELLOW}Dirty install selected.${NC}"
          break
        ;;
        *)
          echo -e "${RED}Not valid, try again: 0=exit, 1=clean install, 2=dirty install${NC}"
	  echo "Enter your option:"
        ;;
  esac
done

echo -e -e "${GREEN}Stoping apache2${NC}"
service apache2 stop

if [ "$line" == "1" ]; then
	echo -e "${GREEN}Uninstall packages${NC}"
	rm -rf /var/www/html
	apt-get remove --purge ffmpeg -y
	apt-get remove --purge apache2 -y
	apt-get remove --purge php5 libapache2-mod-php5 -y
	apt-get remove --purge php5-curl -y
fi

echo -e "${GREEN}Installing the required packages${NC}"	
# add new repository for php5
echo "deb http://raspbian.mirror.uk.sargasso.net/raspbian/ jessie main contrib non-free rpi" >> /etc/apt/sources.list

apt-get update -y
apt-get install ffmpeg -y
apt-get install apache2 -y
apt-get install php5 libapache2-mod-php5 -y
apt-get install php5-curl -y

echo -e "${GREEN}Rename index.html to index-old.html${NC}"
mv /var/www/html/index.html /var/www/html/index-old.html

echo -e "${GREEN}Retrieve php files archive...${NC}"
wget --no-http-keep-alive -O html.tar.gz "https://sites.google.com/site/marginallyhandy/html.tar.gz?attredirects=0&d=1"

echo -e "${GREEN}Please wait...${NC}"
sleep 3

while :
do
    if ! [[ `lsof -c wget | grep html.tar.gz` ]]
    then
        break
    fi
    sleep 1
done
echo -e "${GREEN}... done${NC}"

echo -e "${GREEN}Extracting php files${NC}"
tar -xvzf html.tar.gz --directory /var/www

echo -e "${GREEN}Changing directory rights${NC}"
chown -R www-data:www-data /var/www/html
chmod -R g+rw /var/www/html

#chown -R www-data:www-data /dev/shm
#chmod -R g+rw /dev/shm

ROKUPHP="# Added by roku php install"

echo "$ROKUPHP" >> apache.tmp
echo "Alias /hls /dev/shm" >> apache.tmp
echo "<Directory /dev/shm>" >> apache.tmp
echo "        Options Indexes FollowSymLinks" >> apache.tmp
echo "        Require all granted" >> apache.tmp
echo "</Directory>" >> apache.tmp

APACHECONFIG=/etc/apache2/apache2.conf

if grep -q "$ROKUPHP" "$APACHECONFIG"; then
	echo -e "${GREEN}Apache config already good${NC}"
else
	echo -e "${GREEN}Modifying apache2.conf file${NC}"
	cat apache.tmp >> "$APACHECONFIG"
fi

echo -e "${GREEN}Restarting apache2${NC}"
systemctl daemon-reload
service apache2 restart

echo -e "${GREEN}Remove old files${NC}"
rm html.tar.gz
rm apache.tmp

LOCALIP=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')
echo ""
echo -e "${YELLOW}---------------------${NC}"
echo -e "${YELLOW}DONE INSTALLING!${NC}"
echo -e "${YELLOW}---------------------${NC}"
echo ""
echo -e "${YELLOW}Now go to \"IP Camera Viewer Pro\" on Roku, and in settings, in the field PiIP enter: $LOCALIP${NC}"
echo -e "${YELLOW}To configure your cameras, in your browser go to: http://$LOCALIP${NC}"
