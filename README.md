# Enable H.264/RTSP to HLS in IP Camera Viewer Pro on Roku

## 1. Install Raspbian

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

## 2. Install H.264/RTSP to HLS on the Pi

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

## 3. Adding Cameras using Web Interface

**Announcement - October 16th, 2017**

Along with Raspberry Pi, the software that converts h.264 rtsp streams to HLS for the IP Camera Viewer Pro also works on Orange Pi (tested on the $8 [url=https://www.aliexpress.com/store/product/New-Orange-Pi-Zero-H2-Quad-Core-Open-source-512MB-development-board-beyond-Raspberry-Pi/1553371_32761500374.html?spm=2114.12010612.0.0.6b3dc45fBK4POv]Orange Pi Zero[/url] 512MB RAM version)

To install the OS on the Orange Pi, follow this guide: http://lucsmall.com/2017/01/19/beginners-guide-to-the-orange-pi-zero/

After installing the OS, follow my guide (skip to step 2) to install my software : https://github.com/e1ioan/rokuphp

![pic](https://i.imgur.com/W6m7oNE.jpg)

---------------------------

**UPDATE EDIT  - October 1st, 2017:** Here is how to install the new H.264 support feature. https://github.com/e1ioan/rokuphp

**Note:** This requires IP Camera Viewer Pro 2.7, which is not yet available in the store (Roku store delays publishing the new version). If you installed the software needed on your Raspberry Pi, send me a private message for the new IP Camera Viewer Pro 2.7.

---------------------------


If you have some IP Cameras around the house that are ONVIF compliant or have h.264 video encoding, and if you like to get dirty in some DIY, this post is for you.

As I promised before, I will try my best to get rtsp/h.264 and onvif working in the IP Camera Viewer Pro (BTW those features are only going to be in the Pro version).
Now I have something to show, a preview of how everything is working, and what will take to setup. All the features are 99.9% already built, all the software written, now I'm just making sure everything works the way it should. Soon I'll be releasing a detailed "how to" with all the steps needed to get this working with your Roku, but [size=100]until then, here are some more details.[/size]

  * You will need a Raspberry Pi. I'm using for my tests the "Raspberry PI 3 Model B", but any Raspberry Pi with an Ethernet port or WiFi support should work.
  * You'll need to install some software packages that I will provide 100% free on your Raspberry Pi (I'll release step by step instructions)
  * Connect the Pi to your Router, make note of the IP, and forget about it.
  * On the Roku, in IP Camera Viewer Pro -> Settings, enter the Rapberry Pi IP address and you are done.   

![pic](https://i.imgur.com/bZa8bLX.jpg)

If in any browser, you open your Raspberry Pi IP address, you will be able to configure your cameras. On the Roku you don't need to do anything, the cameras will be imported automatically from the Pi.
Lets say the IP for you Raspberry Pi is 192.168.1.70. You open this address in your browser http://192.168.1.70 (on the phone or computer) and you'll get to the Login page:

![pic](https://i.imgur.com/s2jLVNU.png)

After Login in, you get to the "menu" page where you can see a list of all the cameras you already added and the "services" available:

![pic](https://i.imgur.com/8smDkKt.png)

First option, will allow you to add rtsp cameras manually:

![pic](https://i.imgur.com/n72Y6oq.png)

![pic](https://i.imgur.com/0LVlGDl.png)

The second option will allow you to add any ONVIF compliant camera:

![pic](https://i.imgur.com/MTft4E1.png)

All the cameras added will be automatically imported on Roku.

Of course you will be able to edit/delete any of the cameras:
![pic](https://i.imgur.com/wB9hzrH.png)

The last option, has nothing to do with Roku (no roku necessary), but I thought it will be nice to be there: You can broadcast live on youtube or twitch your IP camera with a click of the button:
![pic](https://i.imgur.com/VMCxeZv.png)

![pic](https://i.imgur.com/db96Wz6.png)

So that's about it! 

Here is a youtube video showing the Roku playing a h.264 rtsp live stream coming from an Axis IP camera. Of course, audio is supported:
[youtube]hhfv8zitAX4[/youtube]

Let me know what you think.
Thank you!
