# docker-msvc-wine
Experiment in getting the MSVC compiler to work in docker under wine

How to use
----------
- First make sure you get [boberfly/docker-wine](https://github.com/boberfly/docker-wine) and build it, then, build this on top.
- Follow docker-wine's instructions, if you run this it'll launch a cmd with the environment set to build against MSVC2017 64-bit.
- Run with ./docker-msvc-wine.sh wine cmd, and in C:\ there's an msvc2017x64env.bat you can run to set the env. For some reason I can't get this to run right now without it asking for a password? Strange...
- If not, ./docker-msvc-wine.sh wine notepad.exe if you want to use the best editor on the planet.

Stuff to know
-------------
- CMake is bundled, as well as Ninja and JOM so that you don't have to suffer with NMake (MSTarget doesn't work yet)
- This now uses a multi-stage build to chew off a bit of fat, so now msvc2017/win10sdk/etc. are located in /opt

Todo
----
- Tidy this up so it's not as big.
- Actually test some compiling scenarios.
- Maybe have it seamlessly work in a Linux environment somehow like this guy did [here](https://hackernoon.com/a-c-hello-world-and-a-glass-of-wine-oh-my-263434c0b8ad)
