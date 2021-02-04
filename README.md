# Enable H.264/RTSP to HLS in IP Camera Viewer Pro on Roku

**Note:** 
This feature requires IP Camera Viewer Pro 2.7 or newer version on your Roku device.
## Docker / Kubernetes
a Docker image can be found at [https://hub.docker.com/r/yabbo/rokuphp](https://hub.docker.com/r/yabbo/rokuphp)

- You can use the `docker pull yabbo/rokuphp` or just reference `yabbo/rokuphp` as your image.

- Persistant Volumes can be mapped to ```/var/www/html/data``` inside the container to save your cameras.

- You will need to expose port 80 from the container to access the web frontend. this can be done through nodeport or loadbalancer. 
- Once the container is spun up use the loadbalancer/node ip and port to access the gui. 

----

## Ubuntu
Install the OS on hardware or as a virtual machine. 
 Login to the device and run the following commands.
 ```
wget https://raw.githubusercontent.com/Yabbo/rokuphp/master/install.sh
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

----

## Raspberry Pi
If you have some IP Cameras around the house that are ONVIF compliant or have h.264 video encoding, and if you like to get dirty in some DIY, this project is for you.

You will need a Raspberry Pi or an Orange Pi. I'm using for my tests the "Raspberry PI 3 Model B", but any Raspberry Pi with an Ethernet port or WiFi support should work. As for the Orange Pi, in my tests I used the Orange Pi Zero 512MB RAM version.



Along with Raspberry Pi, the software that converts h.264 rtsp streams to HLS for the IP Camera Viewer Pro also works on Orange Pi.
Tested on the [$8 Pi Zero 512MB RAM version](https://www.aliexpress.com/store/product/New-Orange-Pi-Zero-H2-Quad-Core-Open-source-512MB-development-board-beyond-Raspberry-Pi/1553371_32761500374.html?spm=2114.12010612.0.0.6b3dc45fBK4POv]Orange)

To install the OS on the Orange Pi, follow [this guide](http://lucsmall.com/2017/01/19/beginners-guide-to-the-orange-pi-zero/).

![Orange Pi](https://i.imgur.com/W6m7oNE.jpg)

After installing the OS on the Orange Pi, follow the guide bellow (skip to step 2) to install the software. For the Raspberry Pi, start with step 1.


### 1. Install Raspbian

You will need a Raspberry Pi. I'm using for my tests the "Raspberry PI 3 Model B", but any Raspberry Pi with an Ethernet port or WiFi support should work.

If you already have Raspbian installed on your Raspberry Pi, skip to **2**

First, you need to install Raspbian OS on your Raspberry Pi. To do this, you can follow the instructions here:
https://www.raspberrypi.org/learning/noobs-install/worksheet/
... or on short, here is what you need to do:

1. Download NOOBS https://www.raspberrypi.org/downloads/noobs/
2. Unzip it and copy the content to a micro sd card
3. Put the micro sd card in your Raspberry Pi 
4. Connect usb keyboard, mouse, a network cable and a HDMI monitor or TV to the Raspberry Pi
5. Connect the power to the Raspberry Pi and follow the instructions.
6. When asked what OS to install, select Raspbian (make sure at the bottom of the screen you select the right Language and Keyboard

### 2. Install H.264/RTSP to HLS on the Pi

**Note:** 
You can use H.264 to HLS on the Pi along with any other software you want to use, for example Retro Pie. My software gets along just fine with almost anything else.


Wait for the Raspbian OS install to be done and then, open a console window and type:
```
wget https://raw.githubusercontent.com/Yabbo/rokuphp/master/install.sh
chmod +x install.sh
sudo ./install.sh
```

If php7 fails to install, you can try installing php5 using the following set of commands:
```
wget https://raw.githubusercontent.com/Yabbo/rokuphp/master/installphp5.sh
chmod +x installphp5.sh
sudo ./installphp5.sh
```

You will be shown two option:
1. To clean intall, which is recommended, will remove - if already installed - ffmpeg, apache2, php and then clean install and configure the packages
2. Dirty install, which will leave all the packages alone if already installed, and just try to configure them.

Select 1 or 2 and wait for "DONE INSTALL" message.

At this point, if you didn't receive any errors, you are ready to go.
Open IP Camera Viewer Pro on Roku, go into Settings and in the field PiIP enter the the install script showed at the end.

To configure the cameras, in a browser enter the IP, create a user, log in... and create cameras. 

The cameras created will be imported automatically to IP Camera Viewer Pro on Roku.

----

## Adding Cameras using Web Interface

Inside the IP Camera View Pro interface go to settings and enter the IP address of the Raspberry Pi, Ubuntu System or loadbalancer/node in the PilP field

![pic](https://i.imgur.com/bZa8bLX.jpg)

Once the container is spun up use the IP from Raspberry Pi, Ubuntu System or the LoadBalancer/Node to access the gui from a browser.
From here you will be able to configure your cameras. You wont be required to add the camera's to the Roku, the cameras will be imported automatically from the website.
Lets say the IP you have is 192.168.1.70. You open this address in your browser http://192.168.1.70 (on the phone or computer) and you'll get to the Login page:

![pic](https://i.imgur.com/s2jLVNU.png)

After Login in, you get to the "menu" page where you can see a list of all the cameras you already added and the "services" available:

![pic](https://i.imgur.com/8smDkKt.png)

First option, will allow you to add rtsp cameras manually:

![pic](https://i.imgur.com/n72Y6oq.png)

![pic](https://i.imgur.com/0LVlGDl.png)

The second option will allow you to add any ONVIF compliant camera:

![pic](https://i.imgur.com/MTft4E1.png)

All the cameras added will be automatically imported on Roku.

Of course you will be able to edit/delete any of the cameras

![pic](https://i.imgur.com/wB9hzrH.png)

#### Live Broadcast 
The last option, has nothing to do with Roku (no roku necessary), but I thought it will be nice to be there: You can broadcast live on youtube or twitch your IP camera with a click of the button:

![pic](https://i.imgur.com/VMCxeZv.png)

![pic](https://i.imgur.com/db96Wz6.png)

So that's about it! 

Here is a youtube video showing the Roku playing a h.264 rtsp live stream coming from an Axis IP camera. Of course, audio is supported:

[![DEMO Video](http://img.youtube.com/vi/hhfv8zitAX4/0.jpg)](http://www.youtube.com/watch?v=hhfv8zitAX4)

Let me know what you think.
Thank you!
