@echo off
set JAVA_HOME=C:\Program Files\Java\jdk1.6.0_16
set JAVA_OPTS=-Xms256m -Xmx512m
set JAVA_OPTS=%JAVA_OPTS% -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port="3334" -Dcom.sun.management.jmxremote.authenticate="false" -Dcom.sun.management.jmxremote.ssl="false"

setlocal enabledelayedexpansion

for %%c in ("WebRoot\WEB-INF\lib\*.jar") do set CLASSPATH=!CLASSPATH!;%%c

if exist "%JAVA_HOME%\bin\java.exe" goto okHome 

echo The JAVA_HOME environment variable is not defined correctly
@pause

:okhome 
echo Using JAVA_HOME %JAVA_HOME%
echo Using JAVA_OPTS %JAVA_OPTS%
"%JAVA_HOME%\bin\java" %JAVA_OPTS% -cp %CLASSPATH% com.idw.mina.service.server.MinaServer
@pause

:end
