@echo off

set DevEnvDir=C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\IDE\
set ExtensionSdkDir=C:\Program Files (x86)\Microsoft SDKs\Windows Kits\10\ExtensionSDKs
set INCLUDE=C:\msvc2017\lib\native\atlmfc\include;C:\msvc2017\lib\native\include;C:\win10sdk\include\10.0.17134.0\ucrt;C:\win10sdk\include\10.0.17134.0\shared;C:\win10sdk\include\10.0.17134.0\um;C:\win10sdk\include\10.0.17134.0\winrt;C:\win10sdk\include\10.0.17134.0\cppwinrt
set LIB=C:\msvc2017\lib\native\atlmfc\lib\x64;C:\msvc2017\lib\native\lib\x64;C:\win10sdk\lib\10.0.17134.0\ucrt\x64;C:\win10sdk\lib\10.0.17134.0\um\x64;
set LIBPATH=C:\msvc2017\lib\native\atlmfc\lib\x64;C:\msvc2017\lib\native\lib\x64;C:\msvc2017\lib\native\lib\x86\store\references;C:\win10sdk\UnionMetadata\10.0.17134.0;C:\win10sdk\References\10.0.17134.0;
set PATH=C:\msvc2017\lib\native\bin\HostX64\x64;C:\win10sdk\bin\10.0.17134.0\x64;C:\win10sdk\bin\x64;C:\msbuild\bin;C:\cmake\bin;C:\ninja;C:\jom;C:\Python27;C:\Python27\Scripts;C:\git\tools\cmd;C:\git\tools\usr\bin;C:\curl\bin;C:\msbuild\bin;%PATH%
set Platform=x64
set UCRTVersion=10.0.17134.0
set UniversalCRTSdkDir=C:\win10sdk\
rem set VCIDEInstallDir=C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\IDE\VC\
set VCINSTALLDIR=C:\msvc2017\lib\native\
set VCToolsInstallDir=C:\msvc2017\lib\native\
set VCToolsRedistDir=C:\msvc2017\lib\native\redist\
set VCToolsVersion=14.11.25506
set VisualStudioVersion=15.0
rem set VS150COMNTOOLS=C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\Tools\
set VSCMD_ARG_app_plat=Desktop
set VSCMD_ARG_HOST_ARCH=x64
set VSCMD_ARG_TGT_ARCH=x64
set VSCMD_VER=15.7.2
rem set VSINSTALLDIR=C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\
set WindowsLibPath=C:\win10sdk\UnionMetadata\10.0.17134.0;C:\win10sdk\References\10.0.17134.0
set WindowsSdkBinPath=C:\win10sdk\bin\
set WindowsSdkDir=C:\win10sdk\
set WindowsSDKLibVersion=10.0.17134.0\
set WindowsSdkVerBinPath=C:\win10sdk\bin\10.0.17134.0\
set WindowsSDKVersion=10.0.17134.0\
rem set WindowsSDK_ExecutablePath_x64=C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.6.1 Tools\x64\
rem set WindowsSDK_ExecutablePath_x86=C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.6.1 Tools\
set __DOTNET_ADD_64BIT=1
set __DOTNET_PREFERRED_BITNESS=64

call %*
