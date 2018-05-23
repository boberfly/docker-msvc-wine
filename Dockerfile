# Use Ubuntu 16.04 + wine-staging as a base for MSVC2017
FROM boberfly/docker-wine:latest

# For running anything headless in wine that needs a GUI, and 7zip
RUN apt-get update && apt-get install -y xvfb p7zip-full

# To get VisualCpp
RUN apt-get install -y nuget ca-certificates-mono \
# Clean up
    && apt-get autoremove -y \
        software-properties-common \
    && apt-get autoclean \
    && apt-get clean \
    && apt-get autoremove
# This one makes it so the certificates get picked up by nuget
ENV TZ=UTC

# For a headless wine experience, why not try xvfb?
COPY xvfb-start.sh /usr/bin/xvfb-start

# From now onwards we take the role of the wine user
USER wine:wine

# Download the Windows SDK
#COPY --chown=wine:wine win10sdk.iso /home/wine/win10sdk.iso
ADD --chown=wine:wine https://go.microsoft.com/fwlink/p/?linkid=870809 /home/wine/win10sdk.iso

# This convoluted RUN will extract and install the .msi's we are interested in for building against Windows 10
RUN xvfb-start && export DISPLAY=:99 \
    && mkdir /home/wine/win10sdk && cd /home/wine/win10sdk && 7z x ../win10sdk.iso && rm ../win10sdk.iso \
    && cd Installers && wine wineboot --init \
    && wine msiexec /i "Windows SDK Desktop Headers x64-x86_en-us.msi" /qn \
    && wine msiexec /i "Windows SDK Desktop Headers x86-x86_en-us.msi" /qn \ 
    && wine msiexec /i "Windows SDK Desktop Libs x64-x86_en-us.msi" /qn \ 
    && wine msiexec /i "Windows SDK Desktop Libs x86-x86_en-us.msi" /qn \ 
    && wine msiexec /i "Universal CRT Headers Libraries and Sources-x86_en-us.msi" /qn \
    && cd /home/wine && rm -rf win10sdk && winetricks -q vcrun2017

# Now we grab MSVC 2017 Community from Nuget
WORKDIR /home/wine/.wine/drive_c
RUN nuget install VisualCppTools.Community.VS2017Layout -Version 14.11.25506 \
    && rm /home/wine/.local/share/NuGet/Cache/VisualCppTools.Community.VS2017Layout.14.11.25506.nupkg

# Time to grab CMake and bundle it in.
ADD --chown=wine:wine https://cmake.org/files/v3.10/cmake-3.10.3-win64-x64.zip cmake.zip
RUN 7z x cmake.zip && rm cmake.zip

# Symlink all the things!
RUN ln -s VisualCppTools.Community.VS2017Layout.14.11.25506 msvc2017 \ 
    && ln -s "Program Files (x86)/Windows Kits/10" win10sdk \
    && ln -s cmake-3.10.3-win64-x64 cmake

# Copy an env we prepared earlier
COPY --chown=wine:wine msvc2017x64env.bat msvc2017x64env.bat

VOLUME /home/wine

# Start with a generic entrypoint.
ENTRYPOINT ["/usr/bin/entrypoint"]

# Default to cmd with MSVC 2017 64-bit as the default target.
CMD ["/usr/bin/entrypoint", "wine", "cmd.exe", "/k", "C:\msvc2017x64env.bat"]
