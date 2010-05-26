@ECHO OFF

REM Taverna startup script

REM go to the distribution directory
pushd "%~dp0"


REM 400 MB memory, 140 MB for classes
set ARGS=-Xmx400m -XX:MaxPermSize=140m

REM Internal system properties
set ARGS=%ARGS% -Draven.profile=file:conf/current-profile.xml
set ARGS=%ARGS% -Djava.system.class.loader=net.sf.taverna.raven.prelauncher.BootstrapClassLoader 
set ARGS=%ARGS% -Dsun.swing.enableImprovedDragGesture 
set ARGS=%ARGS% -Draven.launcher.app.main=net.sf.taverna.t2.commandline.CommandLineLauncher
set ARGS=%ARGS% -Draven.launcher.show_splashscreen=false
set ARGS=%ARGS% -Dtaverna.startup=.

java %ARGS% -jar lib\prelauncher-*.jar %*

pause
REM restore current directory
popd