@ECHO OFF

REM Taverna startup script

REM distribution directory
set TAVERNA_HOME=%~dp0

REM 32-bit compatible defaults:
REM 700 MB memory, 200 MB for classes
set ARGS=-Xmx700m -XX:MaxPermSize=200m

REM Taverna system properties
set ARGS=%ARGS% "-Dcom.sun.net.ssl.enableECC=false"
set ARGS=%ARGS% "-Djsse.enableSNIExtension=false"
set ARGS=%ARGS% "-Draven.profile=file:%TAVERNA_HOME%conf/current-profile.xml"
set ARGS=%ARGS% -Djava.system.class.loader=net.sf.taverna.raven.prelauncher.BootstrapClassLoader 
set ARGS=%ARGS% -Dsun.swing.enableImprovedDragGesture 
set ARGS=%ARGS% "-Dtaverna.startup=%TAVERNA_HOME%."

set JAR_FILE=

for /F "delims=" %%a in ('dir /b "%TAVERNA_HOME%lib" ^|findstr /c:prelauncher') do set JAR_FILE=%%a

java %ARGS% -jar "%TAVERNA_HOME%lib\%JAR_FILE%" %*

pause
