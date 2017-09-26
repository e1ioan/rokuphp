# Enable H.264/RTSP to HLS in IP Camera Viewer Pro on Roku

You will need a Raspberry Pi. I'm using for my tests the "Raspberry PI 3 Model B", but any Raspberry Pi with an Ethernet port or WiFi support should work.

First, you need to install Raspbian OS on your Raspberry Pi. To do this, you can follow the instructions here:
https://www.raspberrypi.org/learning/noobs-install/worksheet/
... or on short, here is what you need to do:

1. Download NOOBS https://www.raspberrypi.org/downloads/noobs/
2. Unzip it and copy the content to a micro sd card
3. Put the micro sd card in your Raspberry Pi 
4. Connect usb keyboard, mouse, a network cable and a HDMI monitor or TV to the Raspberry Pi
5. Connect the power to the Raspberry Pi and follow the instructions.
6. When asked what OS to install, select Raspbian (make sure at the bottom of the screen you select the right Language and Keyboard

## Install H.264/RTSP to HLS on the Pi

Wait for the Raspbian OS install to be done and then, open a console window and type:
```
wget https://raw.githubusercontent.com/e1ioan/rokuphp/master/install.sh
chmod +x install.sh
sudo ./install.sh
```
You will be shown two option:
1. To clean intall, which is recommended, will remove - if already installed - ffmpeg, apache2, php and then clean install and configure the packages
2. Dirty install, which will leave all the packages alone if already installed, and just try to configure them.

Select 1 or 2 and wait for "DONE INSTALL" message.

At this point, if you didn't receive any errors, you are ready to go.
Open IP Camera Viewer Pro on Roku, go into Settings and in the field PiIP enter the the install script showed at the end.

To configure the cameras, in a browser enter the IP, create a user, log in... and create cameras. 

The cameras created will be imported automatically to IP Camera Viewer Pro on Roku.
