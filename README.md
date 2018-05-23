# docker-msvc-wine
Experiment in getting the MSVC compiler to work in docker under wine

How to use
----------
- First make sure you get [boberfly/docker-wine](https://github.com/boberfly/docker-wine) and build it, then, build this on top.
- Follow docker-wine's instructions, if you run this it'll launch a cmd with the environment set to build against MSVC2017 64-bit.
- CMake is bundled with this release, I'll get JOM and Ninja also in there next time so it's noy just NMake.

Todo
----
- Tidy this up so it's not as big.
- Actually test some compiling scenarios.
