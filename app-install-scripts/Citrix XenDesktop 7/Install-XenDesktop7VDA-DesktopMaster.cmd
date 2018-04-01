@ECHO OFF
REM Set variables
SET SOURCE=%~dp0
SET SOURCE=%SOURCE:~0,-1%
IF NOT DEFINED LOGDIR SET LOGDIR=%SystemRoot%\TEMP

REM Resources
REM http://support.citrix.com/proddocs/topic/xendesktop-7/cds-install-command.html
REM VDA,PLUGINS

SET OPTIONS=
SET OPTIONS=/QUIET
SET OPTIONS=%OPTIONS% /NOREBOOT
SET OPTIONS=%OPTIONS% /LOGPATH %LOGDIR%
REM	SET OPTIONS=%OPTIONS% /COMPONENTS VDA,PLUGINS
SET OPTIONS=%OPTIONS% /COMPONENTS VDA
SET OPTIONS=%OPTIONS% /CONTROLLERS "xd71.home.stealthpuppy.com"
SET OPTIONS=%OPTIONS% /ENABLE_HDX_PORTS
SET OPTIONS=%OPTIONS% /ENABLE_REMOTE_ASSISTANCE
SET OPTIONS=%OPTIONS% /OPTIMIZE
SET OPTIONS=%OPTIONS% /ENABLE_REAL_TIME_TRANSPORT
SET OPTIONS=%OPTIONS% /MASTERIMAGE
REM	SET OPTIONS=%OPTIONS% /SITE_GUID {GUID}
REM	SET OPTIONS=%OPTIONS% /XA_SERVER_LOCATION
REM	SET OPTIONS=%OPTIONS% /BASEIMAGE
REM	SET OPTIONS=%OPTIONS% /ENABLE_HDX_3D_PRO
REM	SET OPTIONS=%OPTIONS% /ISVIRTUAL
REM	SET OPTIONS=%OPTIONS% /NODESKTOPEXPERIENCE
REM	SET OPTIONS=%OPTIONS% /NOCITRIXWDDM
REM	SET OPTIONS=%OPTIONS% /INSTALLWITHSECUREBOOTENABLED

IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" PUSHD "%SOURCE%\x64\XenDesktop Setup"
IF "%PROCESSOR_ARCHITECTURE%"=="x86" PUSHD "%SOURCE%\x86\XenDesktop Setup"

START /WAIT XenDesktopVDASetup.exe %OPTIONS%
REM	START /WAIT XenDesktopVDASetup.exe /RECONFIG /PORTNUMBER 8080

POPD
