@ECHO OFF

REM Taverna startup script

REM go to the distribution directory
pushd "%~dp0"


REM 300 MB memory
set ARGS=-Xmx300m -XX:MaxPermSize=140m

REM Internal system properties
set ARGS=%ARGS% -Draven.profile=file:conf/current-profile.xml
set ARGS=%ARGS% -Djava.system.class.loader=net.sf.taverna.raven.prelauncher.BootstrapClassLoader 
set ARGS=%ARGS% -Dsun.swing.enableImprovedDragGesture 
REM set ARGS=%ARGS% "-Dtaverna.startup=%~dp0"
set ARGS=%ARGS% "-Dtaverna.startup=."

java %ARGS% -jar lib\prelauncher-*.jar

REM restore current directory
popd
